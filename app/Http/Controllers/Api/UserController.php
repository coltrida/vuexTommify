<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\AlbumService;
use App\Services\UserService;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function createAlbum(Request $request, AlbumService $albumService)
    {
        $albumService->insert($request);
    }
}
