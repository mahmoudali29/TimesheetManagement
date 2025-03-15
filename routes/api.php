<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AttributeController;
use App\Http\Controllers\Api\ProjectAttributeController;
use App\Http\Controllers\Api\ProjectController;
use App\Http\Controllers\Api\AuthController;

use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\TimesheetController;

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


Route::middleware('auth:api')->group(function () {
    // Attribute Management
    Route::post('/attributes', [AttributeController::class, 'store']); // Create an attribute
    Route::put('/attributes/{id}', [AttributeController::class, 'update']); // Update an attribute

    // Assign attributes to projects
    Route::post('/projects/{id}/attributes', [ProjectAttributeController::class, 'assignAttributes']);

    // Fetch projects with attributes
    Route::get('/projects/{id}', [ProjectController::class, 'showWithAttributes']);

    // Filter projects by attributes
    Route::get('/projects', [ProjectController::class, 'filterByAttributes']);
    Route::get('/dynamic_search', [ProjectController::class, 'filterByDynamicAttributes']);
    

    Route::post('/logout', [AuthController::class, 'logout']);

    Route::apiResource('users', UserController::class);
    Route::apiResource('projects', ProjectController::class);
    Route::apiResource('timesheets', TimesheetController::class);
});

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);