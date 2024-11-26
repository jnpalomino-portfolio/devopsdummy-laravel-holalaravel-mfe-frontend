<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RickAndMortyController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/consultar-rick-and-morty', [RickAndMortyController::class, 'consultarApi']);
