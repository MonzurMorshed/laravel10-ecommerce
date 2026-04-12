<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\BrandRequest;
use App\Models\Brand;
use App\Models\Category;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $brands = Brand::with('brand:id,cat_ust,name')->get();
        return view('backend.pages.brand.index', compact('brands'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $brands = Brand::get();
        $categories = Category::where('cat_ust', '!=', null)
            ->where('status', '1')
            ->pluck('name', 'id');
        return view('backend.pages.brand.edit', compact('brands', 'categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request->all());
        if ($request->hasFile('image')) {
            $img = $request->file('image');
            $folderName = $request->name;
            $uploadFolder = 'img/brand/';
            folderOpen($uploadFolder);
            $imgurl = resimyukle($img, $folderName, $uploadFolder);
        }

        Brand::create([
            'name' => $request->name,
            'cat_ust' => is_array($request->cat_ust) ? implode(',', $request->cat_ust) : $request->cat_ust,
            'status' => $request->status,
            'content' => $request->content,
            'image' => $imgurl ?? NULL,
        ]);

        return back()->withSuccess('brand created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $brand = Brand::where('id', $id)->first();
        $brands = Brand::get();
        $categories = Category::where('cat_ust', '!=', null)
            ->where('status', '1')
            ->pluck('name', 'id');
        return view('backend.pages.brand.edit', compact('brand', 'brands', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $brand = Brand::where('id', $id)->firstOrFail();

        if ($request->hasFile('image')) {
            dosyasil($brand->image);

            $img = $request->file('image');
            $folderName = $request->name;
            $uploadFolder = 'img/brand/';
            folderOpen($uploadFolder);
            $imgurl = resimyukle($img, $folderName, $uploadFolder);
        }

        $brand->update([
            'name' => $request->name,
            'cat_ust' => is_array($request->cat_ust) ? json_encode($request->cat_ust) : $request->cat_ust,
            'status' => $request->status,
            'content' => $request->content,
            'image' => $imgurl ?? $brand->image,
        ]);

        return back()->withSuccess('brand updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        $brand = Brand::where('id', $request->id)->firstOrFail();

        dosyasil($brand->image);

        $brand->delete();
        return response(['error'=>false, 'message'=>'brand deleted successfully']);
    }

    public function status(Request $request){
        $update = $request->status;
        $updateCheck = $update == "false" ? '0' : '1';
        Brand::where('id', $request->id)->update(['status' => $updateCheck]);
        return response(['error'=>false, 'status'=>$update]);
    }
}
