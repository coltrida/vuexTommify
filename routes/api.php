<?php

use App\Http\Controllers\Api\AdminController;
use App\Http\Controllers\Api\ArtistController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\FrontController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Support\Facades\Route;

/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});*/

Route::post('/auth/register', [AuthController::class, 'register']);
Route::post('/auth/login', [AuthController::class, 'login']);

Route::get('/getAllArtists', [FrontController::class, 'getAllArtists']);
Route::post('/findArtist', [FrontController::class, 'findArtist']);
Route::get('/getArtistWithAlbums/{idArtist}', [FrontController::class, 'getArtistWithAlbums']);
Route::get('/getSongsOfAlbum/{idAlbum}', [FrontController::class, 'getSongsOfAlbum']);


Route::group([], function () {
    Route::get('/auth/logout/{token}', [AuthController::class, 'logout']);
    Route::get('/getUserFromToken/{token}', [AuthController::class, 'getUserFromToken']);

    // ------------------------- Admin ---------------------------//
    Route::get('/users', [AdminController::class, 'users']);
    Route::get('/usersPaginate', [AdminController::class, 'usersPaginate']);
    Route::post('/findUser', [AdminController::class, 'findUser']);
    Route::delete('/deleteUser/{idUser}', [AdminController::class, 'deleteUser']);
    Route::get('/statisticFirstThreeAlbumSales', [AdminController::class, 'statisticFirstThreeAlbumSales']);
    Route::get('/albums', [AdminController::class, 'albums']);
    Route::post('/findAlbum', [AdminController::class, 'findAlbum']);
    Route::delete('/deleteArtist/{idArtist}', [AdminController::class, 'deleteArtist']);
    Route::delete('/deleteAlbum/{idAlbum}', [AdminController::class, 'deleteAlbum']);
    Route::delete('/deleteSong/{idSong}', [AdminController::class, 'deleteSong']);
    Route::get('/getArtistWithMyAlbums/{idArtist}/{idUser}', [UserController::class, 'getArtistWithMyAlbums']);

    // ------------------------- Artist ---------------------------//
    Route::post('/album/create', [ArtistController::class, 'createAlbum']);
    Route::post('/album/create/addSong', [ArtistController::class, 'addSong']);
});

