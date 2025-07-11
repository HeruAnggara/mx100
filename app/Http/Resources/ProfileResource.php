<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class ProfileResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'user_id' => $this->user->id,
            'name' => $this->user->name,
            'email' => $this->user->email,
            'role' => $this->user->role,
            
            'profile' => [
                'company_info' => $this->when($this->user->role === 'employer', $this->company_info),
                'phone_number' => $this->when($this->user->role === 'freelancer', $this->phone_number),
                'cv' => $this->when(
                    $this->user->role === 'freelancer' && $this->cv,
                    Storage::url($this->cv)
                ),
                'skills' => $this->when($this->user->role === 'freelancer', $this->skills),
                'profile_updated_at' => $this->updated_at,
            ]
        ];
    }
}
