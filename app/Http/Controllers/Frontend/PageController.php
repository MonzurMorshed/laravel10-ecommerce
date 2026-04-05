<?php

namespace App\Http\Controllers\Frontend;

use App\Models\About;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Category;

class PageController extends Controller
{
    public function contact(){
        $breadcrumb = [
            'pages' => [

            ],
            'active'=> 'Contact'
        ];

        return view('frontend.pages.contact', compact('breadcrumb'));
    }

    public function about(){
        $about = About::where("id",1)->first();
        $breadcrumb = [
            'pages' => [

            ],
            'active'=> 'About'
        ];
        return view('frontend.pages.about', compact("about", 'breadcrumb'));
    }

    public function product(Request $request, $slug = null)
{
    // 1. Validate sorting inputs to prevent SQL injection/errors
    $validOrders = ['id', 'price', 'name', 'created_at'];
    $order = in_array($request->order, $validOrders) ? $request->order : 'id';
    $sort = ($request->sort === 'asc') ? 'asc' : 'desc';

    // 2. Extract and sanitize filters
    $categorySlug = request()->segment(1);
    $sizes = $request->filled('size') ? explode(',', $request->size) : null;
    $colors = $request->filled('color') ? explode(',', $request->color) : null;
    $minPrice = $request->min;
    $maxPrice = $request->max;

    // 3. Resolve Categories & Breadcrumbs
    $anaKategori = Category::where('slug', $categorySlug)->first();
    $altKategori = $slug ? Category::where('slug', $slug)->first() : null;

    $breadcrumb = ['pages' => [], 'active' => 'Products'];

    if ($anaKategori) {
        if ($altKategori) {
            $breadcrumb['pages'][] = [
                'link' => route($anaKategori->slug . 'product'), // Ensure this route exists
                'name' => $anaKategori->name
            ];
            $breadcrumb['active'] = $altKategori->name;
        } else {
            $breadcrumb['active'] = $anaKategori->name;
        }
    }

    // 4. Main Product Query
    $products = Product::where("status", "1")
        ->select(['id', 'name', 'slug', 'size', 'color', 'price', 'category_id', 'image'])
        ->with('category:id,name,slug')
        ->where(function($q) use ($sizes, $colors, $minPrice, $maxPrice) {
            if (!empty($sizes)) $q->whereIn('size', $sizes);
            if (!empty($colors)) $q->whereIn('color', $colors);
            if (!empty($minPrice)) $q->where('price', '>=', $minPrice);
            if (!empty($maxPrice)) $q->where('price', '<=', $maxPrice);
        })
        ->whereHas('category', function($q) use ($categorySlug, $slug) {
            // Filter by sub-category if slug exists, otherwise by main category
            $q->where('slug', $slug ?? $categorySlug);
        })
        ->orderBy($order, $sort)
        ->paginate(21);

    // 5. AJAX Handling
    if ($request->ajax()) {
        $view = view('frontend.ajax.productList', compact('products'))->render();
        return response([
            'data' => $view, 
            'paginate' => (string) $products->withQueryString()->links('vendor.pagination.custom')
        ]);
    }

    // 6. Sidebar Data (Consider Caching these if the inventory is large)
    $sizeLists = Product::where("status", "1")->whereNotNull('size')->distinct()->pluck('size');
    $colorLists = Product::where("status", "1")->whereNotNull('color')->distinct()->pluck('color');
    $dbMaxPrice = Product::max('price');

    return view('frontend.pages.products', [
        'breadcrumb' => $breadcrumb,
        'products'   => $products,
        'maxPrice'   => $dbMaxPrice,
        'sizeLists'  => $sizeLists,
        'colors'     => $colorLists
    ]);
}

    public function saleproduct(){
        $breadcrumb = [
            'pages' => [

            ],
            'active'=> 'Discounted Products'
        ];

        return view('frontend.pages.products', compact('breadcrumb'));
    }

    public function productdetail($slug){
        // $product = Product::whereSlug($slug)->first();
        $product = Product::where("slug",$slug)->where('status', '1')->firstOrFail();

        $products = Product::where('id', '!=', $product->id)
        ->where('category_id', $product->category_id) // ürünün kategorisiyle aynı olan ürünleri getir
        ->where('status', '1')
        ->limit('6')
        ->orderBy('id', 'desc')
        ->get();

        $category = Category::where('id',$product->category_id)->first();

            $breadcrumb = [
                'pages' => [

                ],
                'active'=>  $product->name
            ];

            if(!empty($category)) {
                $breadcrumb['pages'][] = [
                    'link'=> route('product.category', ['slug' => $category->slug]),
                    'name' => $category->name
                ];
            }

        return view('frontend.pages.product', compact('breadcrumb', 'product', 'products'));
    }

}
