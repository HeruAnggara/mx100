<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class ApplicantCollection extends ResourceCollection
{
    /**
     * @var string
     */
    public $collects = ApplicantResource::class;

    /**
     * Menambahkan metadata dan status ke dalam respons.
     */
    public function with(Request $request): array
    {
        return [
            'status' => 200,
            'message' => 'Applicants fetched successfully',
        ];
    }
}
