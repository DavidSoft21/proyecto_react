<?php

use App\Http\Controllers\EmpresaController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\IndexController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/index/{year}',[IndexController::class,'indexByYear'])->middleware('api');
Route::get('/index/empresa/{id}/{year}',[IndexController::class,'indexByCompany'])->middleware('api');
Route::apiResource('/index', IndexController::class)->middleware('api');  
Route::apiResource('/empresa', EmpresaController::class)->middleware('api');