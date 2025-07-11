<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    /**
     * Handle user registration.
     */
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
            'role' => ['required', 'string', Rule::in(['employer', 'freelancer'])],
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role,
        ]);
        
        $user->profile()->create();

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'status' => '201',
            'message' => 'User registered successfully',
            'data' => $user->load('profile'),
            'access_token' => $token,
        ], 201);
    }

    /**
     * Handle user login.
     */
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (!Auth::attempt($request->only('email', 'password'))) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials do not match our records.'],
            ]);
        }

        $user = $request->user();
        
        $token = $user->createToken('auth_token')->plainTextToken;
        
        return response()->json([
            'status' => '200',
            'message' => 'Login successful',
            'access_token' => $token,
        ], 200);
    }

    /**
     * Handle user logout.
     */
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'status' => '200',
            'message' => 'You have successfully been logged out.'
        ], 200);
    }

    /**
     * Get authenticated user's information.
     */
    public function user(Request $request)
    {
        return response()->json([
            'status' => '200',
            'message' => 'User information',
            'data' => $request->user()->load('profile'),
        ], 200);
    }
}