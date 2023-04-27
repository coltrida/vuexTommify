<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\ArtistServices;
use Illuminate\Http\Request;

class FrontController extends Controller
{
    public function getAllArtists(ArtistServices $artistServices)
    {
        return $artistServices->lista();
    }

    public function getArtistWithAlbums($idArtist, ArtistServices $artistServices)
    {
        return $artistServices->artistConAlbum($idArtist);
    }

    public function findArtist(Request $request, ArtistServices $artistServices)
    {
        return $artistServices->findArtist($request);
    }
}
