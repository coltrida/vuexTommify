<?php

use App\Http\Controllers\Api\AdminController;
use App\Http\Controllers\Api\AlbumController;
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


Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/auth/logout/{token}', [AuthController::class, 'logout']);
    Route::get('/getUserFromToken/{token}', [AuthController::class, 'getUserFromToken']);

    // ------------------------- Admin ---------------------------//
    Route::get('/users', [AdminController::class, 'users']);
    Route::post('/findUser', [AdminController::class, 'findUser']);
    Route::delete('/deleteUser/{idUser}', [AdminController::class, 'deleteUser']);
    Route::get('/statisticFirstThreeAlbumSales', [AdminController::class, 'statisticFirstThreeAlbumSales']);
    Route::get('/albums', [AdminController::class, 'albums']);
    Route::post('/findAlbum', [AdminController::class, 'findAlbum']);

    // ------------------------- Artist ---------------------------//
    Route::post('/album/create', [UserController::class, 'createAlbum']);
});

