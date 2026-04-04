<div class="hero-slider">
    <div class="slides">
)
        @foreach($slider as $item)


        <div class="slide">
            <img src="{{ asset($item->image) }}">

            <div class="caption">
                <h2>{{ $item->name }}</h2>
                <p>{!! $item->content !!}</p>
            </div>
        </div>

        @endforeach

    </div>
</div>