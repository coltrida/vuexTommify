<?php

namespace App\Services;

use App\Models\Album;
use App\Models\Artist;
use Illuminate\Support\Facades\Storage;

class AlbumService
{
    // crea Album
    public function insert($request)
    {
        $productStripe = $this->saveAlbumStripe($request);
        $album = Album::create([
            'name' => $request->name,
            'type' => 'A',
            'artist_id' => $request->artist_id,
            'cost' => (float)$request->cost,
            'stripe_id' => isset($productStripe->id) ? $productStripe->id : null,
        ]);

        if ($request->hasFile('cover')) {
            $file = $request->file('cover');
            $filename = $album->id . '.' . $file->extension();
            Storage::disk('public')->putFileAs('/covers', $file, $filename);
        }
        return $album;
    }

    // Crea Album e Canzone contemporanemante
    public function createAlbumLikeSong($request)
    {
        $productStripe = $this->saveAlbumStripe($request);
        $album = Album::create([
            'name' => $request->name,
            'type' => 'S',
            'artist_id' => $request->artist_id,
            'cost' => (float)$request->cost,
            'stripe_id' => isset($productStripe->id) ? $productStripe->id : null,
        ]);

        if ($request->hasFile('cover')) {
            $file = $request->file('cover');
            $filename = $album->id . '.' . $file->extension();
            Storage::disk('public')->putFileAs('/covers', $file, $filename);
        }
        return $album;
    }

    public function saveAlbumStripe($request)
    {
        ini_set("memory_limit", "-1");
        $stripe = new \Stripe\StripeClient('sk_test_tqFIGSA54WEaXkE4LXrZGTtX00gRqA2x26');

        try {
            return $stripe->products->create(
                [
                    'name' => 'Album '.$request->name,
                    'description' => 'Album',
                    'metadata' => [
                        'tipo' => 'album'
                    ],
                    'default_price_data' => [
                        'unit_amount' => (float)$request->cost * 100,
                        'currency' => 'usd',
                    ],
                    'expand' => ['default_price'],
                ]
            );
        } catch (\Exception $exception){
            print_r($exception);
        }

    }

    // elimina Album
    public function deleteAlbum($idAlbum)
    {
        $album = Album::with('songs')->find($idAlbum);
        if (count($album->songs) > 0){
            foreach ($album->songs as $song){
                Storage::disk('public')->delete("/songs/$song->id.mp3");
            }
        }
        Storage::disk('public')->delete("/covers/$idAlbum.jpg");
        Album::destroy($idAlbum);
    }

    /*public function albumConSongs($idAlbum)
    {
        return Album::with('songs', 'artist')->where('id', $idAlbum)->get();
    }*/

    public function albumConSongs($idAlbum)
    {
        return Album::with('songs', 'artist')->find($idAlbum);
    }

    public function albumsConSongs()
    {
        return Album::with('songs', 'artist')->get();
    }

    public function myAlbums()
    {
        return \Auth::user()->albumsales;
    }

    public function albumsOfArtist($idArtist)
    {
        return Artist::with('albums')->find($idArtist)->albums;
    }

    public function statisticFirstThreeAlbumSales()
    {
        return Album::with('albumsales')
            ->withCount('albumsales')
            ->orderBy('albumsales_count', 'desc')
            ->limit(3)
            ->get();
    }

    public function findAlbum($request)
    {
        return Album::with('artist')->where('name', 'like', '%'.$request->nameToFind.'%')->get();
    }
}
