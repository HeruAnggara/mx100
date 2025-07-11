<?php

namespace App\Http\Requests\Employer;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateJobRequest extends FormRequest
{
    public function authorize(): bool
    {
        $job = $this->route('job');
        return $this->user()->role === 'employer' && $job->employer_id === $this->user()->id;
    }

    public function rules(): array
    {
        return [
            'title' => 'sometimes|required|string|max:255',
            'description' => 'sometimes|required|string',
            'honorarium' => 'sometimes|nullable|string|max:100',
            'status' => ['sometimes', 'required', Rule::in(['draft', 'published'])],
        ];
    }
}