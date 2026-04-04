<header class="site-navbar bg-white border-bottom" role="banner">
    <div class="py-3 border-bottom">
        <div class="container">
            <div class="d-flex align-items-center justify-content-between gap-3">
                
                <div class="site-logo">
                    <a href="{{ route('index') }}" class="d-block">
                        <img src="{{ asset($settings['logo'] ?? '') }}" alt="Logo" style="height: 34px;">
                    </a>
                </div>

                <div class="flex-grow-1 mx-md-4 max-width-600">
                    <form action="" class="position-relative">
                        <span class="icon icon-search2 position-absolute" style="left: 15px; top: 50%; transform: translateY(-50%); color: #888;"></span>
                        <input type="text" 
                               class="form-control rounded-pill border py-2 pl-5" 
                               placeholder="Search Products" 
                               style="padding-left: 40px; background-color: #f8f9fa;">
                    </form>
                </div>

                <div class="site-top-icons d-flex align-items-center">
                    <ul class="list-unstyled d-flex align-items-center m-0 gap-4">
                        <li class="d-none d-lg-block">
                            <a href="#" class="text-dark font-weight-bold small text-uppercase">Support</a>
                        </li>
                        
                        <li class="d-none d-lg-block">
                            <a href="#" class="btn btn-outline-danger btn-sm rounded-pill px-4 font-weight-bold">
                                For Business
                            </a>
                        </li>

                        <li><a href="#"><span class="icon icon-person"></span></a></li>
                        <li>
                            <a href="{{ route('cart') }}" class="site-cart position-relative">
                                <span class="icon icon-shopping_cart"></span>
                                <span class="count bg-danger text-white rounded-circle position-absolute" 
                                      style="font-size: 10px; top: -10px; right: -10px; padding: 2px 6px;">
                                    {{ session()->get('cart') ? count(session('cart')) : 0 }}
                                </span>
                            </a>
                        </li>
                        
                        <li class="d-inline-block d-md-none ml-2">
                            <a href="#" class="site-menu-toggle js-menu-toggle">
                                <span class="icon-menu"></span>
                            </a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>

    <nav class="site-navigation border-bottom" role="navigation">
        <div class="container text-left text-md-center">
            <ul class="site-menu js-clone-nav d-none d-md-block list-unstyled m-0 py-2">
                <li class="active d-inline-block px-3"><a href="{{ route('index') }}" class="text-dark small font-weight-bold">Home</a></li>
                
                <li class="has-children d-inline-block px-3">
                    <a href="#" class="text-dark small font-weight-bold">Categories <span class="icon-keyboard_arrow_down"></span></a>
                    <ul class="dropdown shadow-sm border-0">
                        @if (!empty($categories) && $categories->count() > 0)
                            @foreach ($categories->where('cat_ust', null) as $category)
                                <li class="has-children px-2">
                                    <a href="{{ route('product.category', ['slug' => $category->slug]) }}" class="d-flex justify-content-between">
                                        {{ $category->name }}
                                    </a>
                                    <ul class="dropdown">
                                        @foreach ($category->subCategory as $subCategory)
                                            <li>
                                                <a href="{{ route('product.category', ['slug' => $subCategory->slug]) }}">
                                                    {{ $subCategory->name }}
                                                </a>
                                            </li>
                                        @endforeach
                                    </ul>
                                </li>
                            @endforeach
                        @endif
                    </ul>
                </li>

                <li class="d-inline-block px-3"><a href="{{ route('about') }}" class="text-dark small font-weight-bold">About</a></li>
                <li class="d-inline-block px-3"><a href="{{ route('product') }}" class="text-dark small font-weight-bold">Shop</a></li>
                <li class="d-inline-block px-3"><a href="{{ route('contact') }}" class="text-dark small font-weight-bold">Contact</a></li>
            </ul>
        </div>
    </nav>
</header>
