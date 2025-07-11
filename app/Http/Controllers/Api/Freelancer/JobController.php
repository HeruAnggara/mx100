<?php

namespace App\Http\Controllers\Api\Freelancer;

use App\Http\Controllers\Controller;
use App\Http\Resources\JobCollection;
use App\Http\Resources\JobResource;
use App\Models\Job;
use App\Services\JobService;
use Illuminate\Http\Response;

class JobController extends Controller
{
    /**
     * use job service
     */
    public function __construct(protected JobService $jobService)
    {
    }

    /**
     * List published jobs
     */
    public function index()
    {
        $jobs = $this->jobService->getPublishedJobs();

        return new JobCollection($jobs);
    }

    /**
     * Show job detail
     */
    public function show(Job $job)
    {
        if ($job->status !== 'published') {
            return response()->json([
                'status' => '404',
                'message' => 'Job not found.',
            ], 404);
        }
        
        return response()->json([
            'status' => '200',
            'message' => 'Job fetched successfully',
            'data' => new JobResource($job->load('employer')),
        ], 200);
    }
}