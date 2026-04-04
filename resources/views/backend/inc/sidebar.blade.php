<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link {{ request()->routeIs('panel.dashboard') ? 'active' : '' }}" href="{{ route('panel.dashboard') }}">
                <i class="icon-grid menu-icon"></i>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <i class="icon-layout menu-icon"></i>
                <span class="menu-title">Slider</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link {{ request()->routeIs('panel.slider.list') ? 'active' : '' }}" href="{{ route('panel.slider.list') }}">Slider</a></li>
                    <li class="nav-item"> <a class="nav-link {{ request()->routeIs('panel.slider.create') ? 'active' : '' }}" href="{{ route('panel.slider.create') }}">Create Slider</a>
                    </li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic1">
                <i class="icon-layout menu-icon"></i>
                <span class="menu-title">Categories</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic1">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link {{ request()->routeIs('panel.category.list') ? 'active' : '' }}" href="{{ route('panel.category.list') }}">Categories</a>
                    </li>
                    <li class="nav-item"> <a class="nav-link {{ request()->routeIs('panel.category.create') ? 'active' : '' }}" href="{{ route('panel.category.create') }}">Create
                            Category</a>
                    </li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic2" aria-expanded="false" aria-controls="ui-basic2">
                <i class="icon-layout menu-icon"></i>
                <span class="menu-title">Product</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic2">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link {{ request()->routeIs('panel.product.list') ? 'active' : '' }}" href="{{ route('panel.product.list') }}">Products</a>
                    </li>
                    <li class="nav-item"> <a class="nav-link {{ request()->routeIs('panel.product.create') ? 'active' : '' }}" href="{{ route('panel.product.create') }}">Create
                            Product</a>
                    </li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic3" aria-expanded="false" aria-controls="ui-basic3">
                <i class="icon-layout menu-icon"></i>
                <span class="menu-title">Orders</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic3">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link {{ request()->routeIs('panel.order.index') ? 'active' : '' }}" href="{{ route('panel.order.index') }}">Orders</a>
                    </li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link {{ request()->routeIs('panel.about.index') ? 'active' : '' }}" href="{{ route('panel.about.index') }}">
                <i class="icon-grid menu-icon"></i>
                <span class="menu-title">About</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link {{ request()->routeIs('panel.contact.index') ? 'active' : '' }}" href="{{ route('panel.contact.index') }}">
                <i class="icon-grid menu-icon"></i>
                <span class="menu-title">Contact</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link {{ request()->routeIs('panel.setting.index') ? 'active' : '' }}" href="{{ route('panel.setting.index') }}">
                <i class="icon-grid menu-icon"></i>
                <span class="menu-title">Site Setting</span>
            </a>
        </li>
    </ul>
</nav>
