<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
    protected function redirectTo(Request $request): ?string
    {
        $segments = $request->segment(1);
        if($segments == 'panel') {
            return $request->expectsJson() ? null : route('panel.login');
        } else {
            return $request->expectsJson() ? null : route('login');
        }
    }
}
