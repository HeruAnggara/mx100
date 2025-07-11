<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class JobResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
            'honorarium' => $this->honorarium,
            'status' => $this->status,
            'employer' => new EmployerResource($this->whenLoaded('employer')),
            'applicants_count' => $this->whenCounted('applicants'),
            // 'applicants' => ApplicantResource::collection($this->whenLoaded('applicants')),
            'published_at' => $this->published_at?->toFormattedDateString(),
            'created_at' => $this->created_at->toFormattedDateString(),
        ];
    }
}