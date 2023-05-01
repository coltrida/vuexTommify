<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\AlbumService;
use App\Services\ArtistServices;
use App\Services\UserService;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function getArtistWithMyAlbums($idArtist, $idUser, ArtistServices $artistServices )
    {
        return $artistServices->artistConMyAlbum($idArtist, $idUser);
    }
}
