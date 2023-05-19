<?php

namespace App\Services;

use App\Models\Artist;
use App\Models\User;
use Stripe\Stripe;

class ArtistServices
{
    public function lista()
    {
        return Artist::with(['albums' => function($q){
            $q->with('songs');
        }])
            ->withCount('albums')
            ->orderBy('name')
            ->get();
    }

    public function listaPaginate()
    {
        return Artist::with(['albums' => function($q){
            $q->with('songs');
        }])
            ->withCount('albums')
            ->orderBy('name')
            ->paginate(10);
    }

    public function listaConAlbum()
    {
        return Artist::with(['albums' => function($q){
            $q->withCount('songs');
        }])->orderBy('name')->get();
    }

    public function myArtistsConAlbum()
    {
        return User::with(['artistsales' => function($q){
            $q->with('albums');
        }])->find(\Auth::id())->artistsales;
    }

    public function findMyArtistsConAlbum($request)
    {
        return User::with(['artistsales' => function($q) use ($request){
            $q->with('albums')->where('name', 'like', '%'.$request->name.'%');
        }])->find(\Auth::id())->artistsales;
    }

    public function artistConAlbum($idArtist)
    {
        return Artist::with(['albums' => function($q){
            $q->with('songs')->withCount('songs')->withCount('albumsales')->latest();
        }])->orderBy('name')->find($idArtist);
    }

    public function artistConMyAlbum($idArtist, $idUser)
    {
        return Artist::with(['albums' => function($q) use($idUser){
            $q->whereHas('albumsales', function ($query) use ($idUser) {
                $query->where('user_id', $idUser);
            })->with('songs')->withCount('songs')->withCount('albumsales')->latest();
        }])->orderBy('name')->find($idArtist);
    }

    public function insert($request)
    {
        $productStripe = $this->saveArtistStripe($request);
        Artist::create([
            'name' => $request->name,
            'user_id' => auth()->id(),
            'cost' => (float)$request->cost,
            'stripe_id' => isset($productStripe->id) ? $productStripe->id : null,
        ]);
    }

    public function saveArtistStripe($request)
    {
        ini_set("memory_limit", "-1");
        $stripe = new \Stripe\StripeClient('sk_test_tqFIGSA54WEaXkE4LXrZGTtX00gRqA2x26');

        try {
            return $stripe->products->create(
                [
                    'name' => 'Discography of '.$request->name,
                    'description' => 'Discography',
                    'metadata' => [
                        'tipo' => 'discography'
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

    public function findArtist($request)
    {
        return Artist::where('name', 'like', '%'.$request->nameToFind.'%')
            ->with(['albums' => function($q){
                $q->with('songs');
            }])
            ->withCount('albums')
            ->paginate(10);
    }

    public function deleteArtist($idArtist)
    {
        $artist = Artist::with('user')->find($idArtist);
        $artist->user()->delete();
        $artist->delete();
    }

}
