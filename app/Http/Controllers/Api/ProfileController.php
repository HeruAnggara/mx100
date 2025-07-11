<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateProfileRequest;
use App\Http\Resources\ProfileResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller
{
    /**
     * Show user profile
     */
    public function show(Request $request)
    {
        $profile = $request->user()->profile;
        return response()->json([
            'message' => 'Profile fetched successfully',
            'data' => new ProfileResource($profile),
        ], 200);
    }

    /**
     * Update user profile
     */
    public function update(UpdateProfileRequest $request)
    {
        $user = $request->user();
        $profile = $user->profile;
        $validatedData = $request->validated();
        
        if ($request->hasFile('cv')) {
            if ($profile->cv) {
                Storage::delete($profile->cv);
            }

            $path = $request->file('cv')->store('public/cvs');

            $profileData['cv'] = $path;
        }
        
        if (isset($validatedData['name'])) {
            $user->update(['name' => $validatedData['name']]);
        }
        
        unset($validatedData['name'], $validatedData['cv']);
        
        $profileData = array_merge($profileData ?? [], $validatedData);

        if (!empty($profileData)) {
            $profile->update($profileData);
        }

        return response()->json([
            'message' => 'Profile updated successfully',
            'data' => new ProfileResource($profile->fresh()),
        ], 200);
    }
}