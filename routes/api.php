<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\ServerController;

Route::apiResource('servers', ServerController::class);
Route::get('servers/{server}/requests', [ServerController::class, 'requestHistory']);
Route::get('servers/{server}/health-at/{time}', [ServerController::class, 'healthAt']);
