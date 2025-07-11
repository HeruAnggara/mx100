<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProfileRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        $user = $this->user();
        
        if ($user->role === 'freelancer') {
            return [
                'name' => 'sometimes|required|string|max:255',
                'phone_number' => 'sometimes|nullable|string|max:20',
                'cv' => 'sometimes|required|file|mimes:pdf,doc,docx|max:2048',
                'skills' => 'sometimes|nullable|string',
            ];
        }

        if ($user->role === 'employer') {
            return [
                'name' => 'sometimes|required|string|max:255',
                'company_info' => 'sometimes|nullable|string',
            ];
        }
        
        return [];
    }
}