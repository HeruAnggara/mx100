<?php
namespace App\Http\Controllers\Api\Freelancer;

use App\Http\Controllers\Controller;
use App\Models\Job;
use App\Services\JobService;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ApplicationController extends Controller
{
    /**
     * use job service
     */
    public function __construct(protected JobService $jobService)
    {
    }

    /**
     * Apply to job
     */
    public function store(Request $request, Job $job)
    {
        try {
            $wasApplied = $this->jobService->applyToJob($request->user(), $job);

            if ($wasApplied) {
                return response()->json([
                    'status' => '200',
                    'message' => 'Successfully applied to the job.',
                ], 200);
            } else {
                return response()->json([
                    'status' => '200',
                    'message' => 'You have already applied to this job.',
                ], 200);
            }
            
        } catch (Exception $e) {
            return response()->json([
                'status' => '422',
                'message' => $e->getMessage(),
            ], 422);
        }
    }
}