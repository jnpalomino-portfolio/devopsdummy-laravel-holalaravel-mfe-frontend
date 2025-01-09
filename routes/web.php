<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RickAndMortyController;
use App\Http\Controllers\DevopsDummyController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/consultar-rick-and-morty', [RickAndMortyController::class, 'consultarApi']);

Route::get('/consultar-devops-dummy', [DevopsDummyController::class, 'consultarApiDevops']);
