<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $employers = [
            ['name' => 'PT. Digital Kreatif', 'email' => 'hr@digitalkreatif.com'],
            ['name' => 'Startup Maju Jaya', 'email' => 'contact@majujaya.dev'],
            ['name' => 'Solusi Teknologi Nusantara', 'email' => 'recruitment@solusinusantara.id'],
            ['name' => 'Warung Kopi Digital', 'email' => 'owner@warungkopidigital.com'],
            ['name' => 'CV. Mitra Bangun Persada', 'email' => 'mitra.persada@gmail.com'],
        ];

        foreach ($employers as $emp) {
            User::factory()->create([
                'name' => $emp['name'],
                'email' => $emp['email'],
                'password' => Hash::make('password'),
                'role' => 'employer',
            ]);
        }

        $freelancers = [
            ['name' => 'Budi Setiawan', 'email' => 'budi.dev@example.com'],
            ['name' => 'Citra Lestari', 'email' => 'citra.design@example.com'],
            ['name' => 'Doni Firmansyah', 'email' => 'doni.writer@example.com'],
            ['name' => 'Eka Putri', 'email' => 'eka.marketing@example.com'],
            ['name' => 'Fajar Nugraha', 'email' => 'fajar.data@example.com'],
        ];

        foreach ($freelancers as $free) {
            User::factory()->create([
                'name' => $free['name'],
                'email' => $free['email'],
                'password' => Hash::make('password'),
                'role' => 'freelancer',
            ]);
        }
    }
}