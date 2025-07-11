<?php
namespace App\Http\Controllers\Api\Employer;

use App\Http\Controllers\Controller;
use App\Http\Requests\Employer\StoreJobRequest;
use App\Http\Requests\Employer\UpdateJobRequest;
use App\Http\Resources\JobCollection;
use App\Http\Resources\JobResource;
use App\Models\Job;
use App\Services\JobService;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;

class JobController extends Controller
{
    use AuthorizesRequests;

    /**
     * use job service
     */
    public function __construct(protected JobService $jobService)
    {
    }

    /**
     * List jobs
     */
    public function index(Request $request)
    {
        $jobs = $this->jobService->getJobsForEmployer($request->user());
        return new JobCollection($jobs->loadCount('applicants'));
    }

    /**
     * Create job
     */
    public function store(StoreJobRequest $request)
    {
        $job = $this->jobService->createJob($request->user(), $request->validated());
        return response()->json([
            'status' => '201',
            'message' => 'Job created successfully',
            'data' => new JobResource($job),
        ], 201);
    }

    /**
     * Show job detail
     */
    public function show(Job $job)
    {
        $this->authorize('view', $job);
        return response()->json([
            'status' => '200',
            'message' => 'Job fetched successfully',
            'data' => new JobResource($job->load('applicants')->loadCount('applicants')),
        ], 200);
    }

    /**
     * Update job
     */
    public function update(UpdateJobRequest $request, Job $job)
    {
        $updatedJob = $this->jobService->updateJob($job, $request->validated());
        return response()->json([
            'status' => '200',
            'message' => 'Job updated successfully',
            'data' => new JobResource($updatedJob),
        ], 200);
    }

    /**
     * Delete job
     */
    public function destroy(Job $job)
    {
        $this->authorize('delete', $job);
        $job->delete();
        return response()->json([
            'status' => '200',
            'message' => 'Job deleted successfully',
        ], 200);
    }
}