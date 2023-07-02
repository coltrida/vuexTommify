<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\AlbumService;
use App\Services\SongService;
use Illuminate\Http\Request;

class ArtistController extends Controller
{
    public function createAlbumWithSongs(Request $request, AlbumService $albumService, SongService $songService)
    {
        $album = $this->createAlbum($request, $albumService);
        $request['album_id'] = $album->id;
        foreach ($request['songs'] as $song) {
            $this->addSong($request, $songService);
        }
    }

    public function createAlbum(Request $request, AlbumService $albumService)
    {
        return $albumService->insert($request);
    }

    public function createSong(Request $request, AlbumService $albumService, SongService $songService)
    {
        $album = $albumService->createAlbumLikeSong($request);
        $request['album_id'] = $album->id;
        $song = $songService->save($request);
        return [$album, $song];
    }

    public function addSong(Request $request, SongService $songService)
    {
        return $songService->save($request);
    }
}
