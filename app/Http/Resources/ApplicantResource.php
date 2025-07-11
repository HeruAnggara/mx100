<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class ApplicantResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'skills' => $this->profile->skills,
            'cv' => $this->profile->cv ? Storage::url($this->profile->cv) : null,
            'applied_at' => $this->pivot->created_at->diffForHumans(),
        ];
    }
}