<?php

namespace App\Services;

use App\Models\Job;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Pagination\LengthAwarePaginator;

class JobService
{
    /**
     * @return \Illuminate\Pagination\LengthAwarePaginator
     */
    public function getPublishedJobs(): LengthAwarePaginator
    {
        return Job::where('status', 'published')
                    ->with('employer:id,name')
                    ->latest('published_at')
                    ->paginate(10);
    }

    /**
     * @param \App\Models\User $employer
     * @return \Illuminate\Pagination\LengthAwarePaginator
     */
    public function getJobsForEmployer(User $employer): LengthAwarePaginator
    {
        return $employer->jobs()->latest()->paginate(10);
    }

    /**     *
     * @param \App\Models\User $employer
     * @param array $data Data yang tervalidasi dari request.
     * @return \App\Models\Job
     */
    public function createJob(User $employer, array $data): Job
    {
        return $employer->jobs()->create($data);
    }

    /**
     * @param \App\Models\Job $job
     * @param array $data Data yang tervalidasi dari request.
     * @return \App\Models\Job
     */
    public function updateJob(Job $job, array $data): Job
    {
        if (isset($data['status']) && $data['status'] === 'published' && is_null($job->published_at)) {
            $data['published_at'] = Carbon::now();
        }

        $job->update($data);
        return $job;
    }

    /**
     * @param \App\Models\User $freelancer
     * @param \App\Models\Job $job
     * @return bool
     * @throws \Exception
     */
    public function applyToJob(User $freelancer, Job $job): bool
    {
        if ($job->status !== 'published') {
            throw new Exception("You can only apply to published jobs.");
        }

        $result = $freelancer->applications()->syncWithoutDetaching([$job->id]);

        return !empty($result['attached']);
    }
}