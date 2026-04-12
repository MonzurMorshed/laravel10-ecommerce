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
                    <h3 class="mb-0 font-weight-bold" style="color: #32325d;">Product Management</h3>
                    <a href="{{ route('panel.product.create') }}" class="btn btn-primary shadow-sm" style="border-radius: 20px; padding: 10px 25px;">
                        <i class="fas fa-plus mr-2"></i> Create New
                    </a>
                </div>

                <div class="table-responsive">
                    <table class="table align-items-center table-flush">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Product</th>
                                    <th>Category</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if (!empty($products) && $products->count() > 0)
                                    @foreach ($products as $item)
                                        <tr class="item" item-id="{{ $item->id }}">
                                            <td class="py-1">
                                                <img src="{{ asset($item->image) }}" alt="{{ $item->name }}" />
                                            </td>
                                            <td>{{ $item->name }}</td>
                                            <td>{{ $item->category->name ?? '' }}</td>
                                            <td>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" class="durum" data-on="Active"
                                                            data-off="Inactive" data-onstyle="success" data-offstyle="danger"
                                                            data-toggle="toggle"
                                                            {{ $item->status == '1' ? 'checked' : '' }}>
                                                    </label>
                                                </div>
                                            </td>
                                            <td class="d-flex">
                                                <a href="{{ route('panel.product.edit', $item->id) }}"
                                                    class="btn btn-primary mr-2">Edit
                                                </a>
                                                <button type="button" class="deleteBtn btn btn-danger">Delete</button>
                                            </td>
                                        </tr>
                                    @endforeach
                                @endif
                            </tbody>
                        </table>
                    </div>

                    {{ $products->links('pagination::custom') }}

                </div>
            </div>
        </div>
    </div>
@endsection

@section('customjs')
    <script>
        // basmalı olduğu için change kullanıldı
        // buton olsaydı click kullanılması gerekiyordu
        $(document).on('change', '.durum', function(e) {
            // alert('test')
            id = $(this).closest('.item').attr('item-id');
            statu = $(this).prop('checked');
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: "POST",
                url: "{{ route('panel.product.status') }}",
                data: {
                    id: id,
                    statu: statu
                },
                success: function(response) {
                    if (response.status == 'true') {
                        alertify.success("Status activated")
                    } else {
                        alertify.error('Status deactivated')
                    }
                }
            });
        });

        $(document).on('click', '.deleteBtn', function(e) {
            e.preventDefault();
            var item = $(this).closest('.item');
            id = item.attr('item-id');

            alertify.confirm("Are you sure?", "You won't be able to revert this!",
                function() {

                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        type: "DELETE",
                        url: "{{ route('panel.product.destroy') }}",
                        data: {
                            id: id,
                        },
                        success: function(response) {
                            if (response.error == false) {
                                item.remove();
                                alertify.success(response.message)
                            } else {
                                alertify.error("Something went wrong");
                            }
                        }
                    });
                },
                function() {
                    alertify.error('Deletion canceled.');
                });
        });
    </script>
@endsection
