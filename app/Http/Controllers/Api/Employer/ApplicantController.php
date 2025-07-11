<?php

namespace App\Http\Controllers\Api\Employer;

use App\Http\Controllers\Controller;
use App\Http\Resources\ApplicantCollection;
use App\Http\Resources\ApplicantResource;
use App\Models\Job;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class ApplicantController extends Controller
{
    use AuthorizesRequests;
    /**
     * List applicants for a job
     */
    public function index(Job $job)
    {
        $this->authorize('view', $job);

        $applicants = $job->applicants()->with('profile')->paginate(10);
        return new ApplicantCollection($applicants);
    }
}