<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\AlbumService;
use App\Services\UserService;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function users(UserService $userService)
    {
        return $userService->listUtenti();
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
}
