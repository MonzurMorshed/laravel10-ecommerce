<?php

namespace App\Http\Controllers\Backend;

use App\Models\Slider;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use ImageResize;
use App\Http\Requests\SliderRequest;
use Illuminate\Http\Request;
use App\Http\Helper;

class SliderController extends Controller
{
    public function index(){
        $sliders = Slider::all();
        return view('backend.pages.slider.index', compact('sliders'));
    }

    public function create(){
        return view('backend.pages.slider.edit');
    }

    public function edit($id){
        $slider = Slider::where('id', $id)->first();
        return view('backend.pages.slider.edit', compact('slider'));
    }

    public function store(SliderRequest $request){

        $imagePath = null;

        $image = uploadImage($request->file('image'), 'img/slider');

        

        $slider = Slider::create([
            'name' => $request->name,
            'content' => $request->content,
            'link' => $request->link,
            'status' => $request->status,
            'image' => $image,
        ]);

        return back()->withSuccess('Slider created successfully');
    }

    public function update(SliderRequest $request, Slider $slider)
    {
        $image = uploadImage(
            $request->file('image'),
            'img/slider',
            $slider->image
        );

        $slider->update([
            'name' => $request->name,
            'content' => $request->content,
            'link' => $request->link,
            'status' => $request->status,
            'image' => $image,
        ]);

        return back()->withSuccess('Slider updated successfully');
    }

    public function destroy(Request $request){
        $slider = Slider::where('id', $request->id)->firstOrFail();

        deleteImage($slider->image);

        $slider->delete();
        return response(['error'=>false, 'message'=>'Slider deleted successfully']);
    }

    public function status(Request $request){
        $update = $request->statu;
        $updateCheck = $update == "false" ? '0' : '1';
        Slider::where('id', $request->id)->update(['status' => $updateCheck]);
        return response(['error'=>false, 'status'=>$update]); // ajax kullanıldığı için response kullanıldı.
    }
}
