<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\AlbumService;
use App\Services\SongService;
use Illuminate\Http\Request;

class ArtistController extends Controller
{
    public function createAlbum(Request $request, AlbumService $albumService)
    {
        return $albumService->insert($request);
    }

    public function addSong(Request $request, SongService $songService)
    {
        return $songService->save($request);
    }
}
