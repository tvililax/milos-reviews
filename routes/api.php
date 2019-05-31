<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('artists', 'ArtistController');
Route::resource('songs', 'SongController');
Route::resource('albums', 'AlbumController');
Route::resource('types', 'TypeController');

Route::fallback(function(){
    return response()->json(['message' => 'Not Found!'], 404);
});