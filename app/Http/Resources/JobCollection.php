<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class JobCollection extends ResourceCollection
{
    /**
     * Properti ini secara eksplisit memberitahu koleksi untuk menggunakan JobResource
     * dalam mengubah setiap item. Ini adalah praktik yang baik.
     *
     * @var string
     */
    public $collects = JobResource::class;

    /**
     * Menambahkan metadata dan status ke dalam respons.
     */
    public function with(Request $request): array
    {
        return [
            'status' => 200,
            'message' => 'Jobs fetched successfully',
        ];
    }
}