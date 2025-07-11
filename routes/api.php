<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\Employer\ApplicantController as EmployerApplicantController;
use App\Http\Controllers\Api\Employer\JobController as EmployerJobController;
use App\Http\Controllers\Api\Freelancer\ApplicationController as FreelancerApplicationController;
use App\Http\Controllers\Api\Freelancer\JobController as FreelancerJobController;
use App\Http\Controllers\Api\ProfileController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', [AuthController::class, 'user']);

    // Profile Routes
    Route::get('/profile', [ProfileController::class, 'show']);
    Route::put('/profile', [ProfileController::class, 'update']);

    // Employer Routes
    Route::middleware('role:employer')->prefix('employer')->group(function () {
        Route::apiResource('jobs', EmployerJobController::class);
        Route::get('jobs/{job}/applicants', [EmployerApplicantController::class, 'index']);
    });

    // Freelancer Routes
    Route::middleware('role:freelancer')->prefix('freelancer')->group(function () {
        Route::get('jobs', [FreelancerJobController::class, 'index']);
        Route::get('jobs/{job}', [FreelancerJobController::class, 'show']);
        Route::post('jobs/{job}/apply', [FreelancerApplicationController::class, 'store']);
    });
});
