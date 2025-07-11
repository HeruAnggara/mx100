<?php

namespace Database\Seeders;

use App\Models\Job;
use App\Models\User;
use Illuminate\Database\Seeder;

class JobSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $employers = User::where('role', 'employer')->get();

        $jobsData = [
            [
                'title' => 'Senior PHP Developer (Laravel)',
                'description' => 'Membangun dan memelihara aplikasi web dengan Laravel. Pengalaman dengan Vue.js adalah nilai tambah.',
                'honorarium' => 'Rp 18.000.000/bulan',
                'status' => 'published',
            ],
            [
                'title' => 'Graphic Designer for Social Media',
                'description' => 'Membuat konten visual untuk Instagram, Facebook, dan TikTok. Mahir menggunakan Adobe Creative Suite.',
                'honorarium' => 'Rp 7.000.000/bulan',
                'status' => 'published',
            ],
            [
                'title' => 'Content Writer (SEO)',
                'description' => 'Menulis artikel blog yang SEO-friendly untuk meningkatkan traffic organik. Topik seputar teknologi dan bisnis.',
                'honorarium' => 'Rp 500.000/artikel',
                'status' => 'draft',
            ],
            [
                'title' => 'Virtual Assistant',
                'description' => 'Membantu tugas administratif, manajemen email, dan penjadwalan meeting. Bekerja secara remote.',
                'honorarium' => 'Rp 6.000.000/bulan',
                'status' => 'published',
            ],
            [
                'title' => 'Project Manager Konstruksi',
                'description' => 'Mengawasi proyek pembangunan dari awal hingga akhir. Memiliki sertifikasi di bidang terkait.',
                'honorarium' => 'Rp 15.000.000 (project-based)',
                'status' => 'published',
            ],
        ];

        $limit = min(count($employers), count($jobsData));

        for ($i = 0; $i < $limit; $i++) {
            Job::create([
                'employer_id' => $employers[$i]->id,
                'title' => $jobsData[$i]['title'],
                'description' => $jobsData[$i]['description'],
                'honorarium' => $jobsData[$i]['honorarium'],
                'status' => $jobsData[$i]['status'],
                'published_at' => $jobsData[$i]['status'] === 'published' ? now() : null,
            ]);
        }
    }
}