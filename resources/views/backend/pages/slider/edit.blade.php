@extends('backend.layout.app')

@section('content')
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Slider</h4>

                    @if ($errors)
                        @foreach ($errors->all() as $error)
                            <div class="alert alert-danger">
                                {{ $error }}
                            </div>
                        @endforeach
                    @endif

                    @if (session()->get('success'))
                        <div class="alert alert-success">
                            {{ session()->get('success') }}
                        </div>
                    @endif

                    @if (!empty($slider->id))
                        @php
                            $routeLink = route('panel.slider.update', $slider->id);
                        @endphp
                    @else
                        @php
                            $routeLink = route('panel.slider.store');
                        @endphp
                    @endif

                    <form class="forms-sample" action="{{ $routeLink }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        @if (!empty($slider->id))
                            @method('PUT')
                        @endif

                        <div class="form-group">
                            <img src="{{ asset($slider->image ?? 'img/noimage.webp') }}" width="150">
                        </div>

                        <div class="form-group">
                            <label>Image</label>
                            <input type="file" class="form-control" name="image">
                        </div>

                        <div class="form-group">
                            <label>Name</label>
                            <input type="text"
                                class="form-control"
                                name="name"
                                value="{{ $slider->name ?? '' }}"
                                placeholder="Slider Title">
                        </div>

                        <div class="form-group">
                            <label>Content</label>
                            <textarea class="form-control" name="content" rows="4">
                    {!! $slider->content ?? '' !!}
                            </textarea>
                        </div>

                        <div class="form-group">
                            <label>Slider Link</label>
                            <input type="text"
                                class="form-control"
                                name="link"
                                value="{{ $slider->link ?? '' }}"
                                placeholder="Slider Link">
                        </div>

                        <div class="form-group">
                            <label>Status</label>

                            @php
                                $status = $slider->status ?? '1';
                            @endphp

                            <select name="status" class="form-control">
                                <option value="0" {{ $status == '0' ? 'selected' : '' }}>Passive</option>
                                <option value="1" {{ $status == '1' ? 'selected' : '' }}>Active</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
