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

Route::group(['prefix' => 'auth'], function ($router) {
    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('register', 'Auth\RegisterController@register');    
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
});



Route::group(['middleware' => 'jwt.auth'], function ($router) {

    Route::get('notes', 'NotesController@all');
    Route::get('notes/{id}', 'NotesController@get');
    Route::post('notes/new', 'NotesController@store');
    // Update Row
    Route::put('notes/update/{id}', 'NotesController@update');    
    // Delete Row
    Route::delete('notes/{id}', 'NotesController@destroy');    

});

