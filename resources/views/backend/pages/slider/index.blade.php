@extends('backend.layout.app')

@section('customcss')
    <link rel="stylesheet" href="{{ asset('css/backendStyle.css') }}">
@endsection

@section('content')


<div class="container-fluid py-4">
    <div class="row">
        <div class="col-12">
            <div class="card custom-card">
                <div class="card-header bg-transparent border-0 d-flex justify-content-between align-items-center p-4">
                    <h3 class="mb-0 font-weight-bold" style="color: #32325d;">Slider Management</h3>
                    <a href="{{ route('panel.slider.create') }}" class="btn btn-primary shadow-sm" style="border-radius: 20px; padding: 10px 25px;">
                        <i class="fas fa-plus mr-2"></i> Create New
                    </a>
                </div>

                <div class="table-responsive">
                    <table class="table align-items-center table-flush">
                        <thead>
                            <tr>
                                <th>Preview</th>
                                <th>Slider Info</th>
                                <!-- <th>Link</th> -->
                                <th>Status</th>
                                <th class="text-right">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($sliders as $slider)
                                <tr class="item" item-id="{{ $slider->id }}">
                                    <td>
                                        <div class="slider-img-container">
                                            <img src="{{ asset($slider->image) }}" alt="Slider">
                                        </div>
                                    </td>
                                    <td>
                                        <span class="d-block font-weight-bold mb-0" style="color: #32325d;">{{ $slider->name }}</span>
                                        <small class="text-muted">{{ Str::limit($slider->content, 40) }}</small>
                                    </td>
                                    <!-- <td>
                                        <a href="{{ $slider->link }}" target="_blank" class="text-primary font-weight-600">{{ $slider->link }}</a>
                                    </td> -->
                                    <!-- <td>
                                        <label class="switch">
                                            <input type="checkbox" class="durum" {{ $slider->status == '1' ? 'checked' : '' }}>
                                            <span class="slider-toggle"></span>
                                        </label>
                                    </td> -->
                                    <td>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" class="durum" data-on="Active"
                                                            data-off="Inactive" data-onstyle="success" data-offstyle="danger"
                                                            data-toggle="toggle"
                                                            {{ $slider->status == '1' ? 'checked' : '' }}>
                                                    </label>
                                                </div>
                                            </td>
                                    <td class="text-right">
                                        <div class="d-flex align-items-center justify-content-end">
                                            <a href="{{ route('panel.slider.edit', $slider->id) }}" 
                                            class="btn btn-sm btn-outline-primary mr-2 d-flex align-items-center p-3" 
                                            style="border-radius: 8px; padding: 6px 14px; font-weight: 500;">
                                                <i class="fas fa-edit mr-2"></i> Edit
                                            </a>

                                            <button type="button" 
                                                    class="deleteBtn btn btn-sm btn-danger d-flex align-items-center shadow-sm p-3" 
                                                    style="border-radius: 8px; padding: 6px 14px; font-weight: 500; background-color: #ff4d4d; border: none;">
                                                <i class="fas fa-trash-alt mr-2"></i> Delete
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="5" class="text-center py-5 text-muted">No sliders found.</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('customjs')
    <script>
        $(document).on('change', '.durum', function(e) {
            let id = $(this).closest('.item').attr('item-id');
            let statu = $(this).prop('checked');
            
            $.ajax({
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                type: "POST",
                url: "{{ route('panel.slider.status') }}",
                data: { id: id, statu: statu },
                success: function(response) {
                    if (response.status == 'true') {
                        alertify.success("Status Updated Successfully");
                    } else {
                        alertify.error('An error occurred');
                    }
                }
            });
        });

        $(document).on('click', '.deleteBtn', function(e) {
            e.preventDefault();
            var item = $(this).closest('.item');
            var id = item.attr('item-id');

            alertify.confirm("Wait!", "Are you sure you want to delete this slider? This cannot be undone.",
                function() {
                    $.ajax({
                        headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                        type: "DELETE",
                        url: "{{ route('panel.slider.destroy') }}",
                        data: { id: id },
                        success: function(response) {
                            if (response.error == false) {
                                item.fadeOut(400, function() { $(this).remove(); });
                                alertify.success(response.message);
                            } else {
                                alertify.error("Something went wrong");
                            }
                        }
                    });
                }, null).set('labels', {ok:'Delete', cancel:'Cancel'});
        });
    </script>
@endsection