<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\AlbumService;
use App\Services\ArtistServices;
use App\Services\SongService;
use App\Services\UserService;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function users(UserService $userService)
    {
        return $userService->listUtenti();
    }

    public function usersPaginate(UserService $userService)
    {
        return $userService->listUtentiPaginate();
    }

    public function findUser(Request $request, UserService $userService)
    {
        return $userService->findUser($request);
    }

    public function deleteUser($idUser, UserService $userService)
    {
        $userService->deleteUser($idUser);
    }

    public function statisticFirstThreeAlbumSales(AlbumService $albumService)
    {
        return $albumService->statisticFirstThreeAlbumSales();
    }

    public function albums(AlbumService $albumService)
    {
        return $albumService->albumsConSongs();
    }

    public function findAlbum(Request $request, AlbumService $albumService)
    {
        return $albumService->findAlbum($request);
    }

    public function deleteArtist($idArtist, ArtistServices $artistServices)
    {
        $artistServices->deleteArtist($idArtist);
    }

    public function deleteAlbum($idAlbum, AlbumService $albumService)
    {
        $albumService->deleteAlbum($idAlbum);
    }

    public function deleteSong($idSong, SongService $songService)
    {
        $songService->deleteSong($idSong);
    }
}
