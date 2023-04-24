<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});*/

Route::post('/auth/register', [AuthController::class, 'register']);
Route::post('/auth/login', [AuthController::class, 'login']);
//Route::get('/getUserFromToken/{token}', [AuthController::class, 'getUserFromToken']);

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/users', [UserController::class, 'index']);
    Route::get('/auth/logout/{token}', [AuthController::class, 'logout']);
    Route::get('/getUserFromToken/{token}', [AuthController::class, 'getUserFromToken']);
});

