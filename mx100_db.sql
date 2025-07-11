-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 11, 2025 at 04:07 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mx100_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `employer_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `honorarium` varchar(255) DEFAULT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'draft',
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `employer_id`, `title`, `description`, `honorarium`, `status`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Fullstack Developer', 'Full-Time / Jangka Panjang', 'Rp 12.000.000 per bulan', 'published', '2025-07-10 19:06:37', '2025-07-10 19:02:49', '2025-07-10 19:06:37'),
(2, 2, 'Copywriter untuk Website & Iklan', 'Mencari copywriter freelance untuk menulis konten website, artikel blog (SEO-friendly), dan naskah untuk iklan digital. Pengalaman di bidang F&B diutamakan.', 'Rp 4.000.000 per proyek', 'draft', '2025-07-10 19:07:24', '2025-07-10 19:03:58', '2025-07-10 20:32:57'),
(3, 2, 'Senior PHP Developer (Laravel)', 'Membangun dan memelihara aplikasi web dengan Laravel. Pengalaman dengan Vue.js adalah nilai tambah.', 'Rp 18.000.000/bulan', 'published', '2025-07-10 20:37:34', '2025-07-10 20:37:34', '2025-07-10 20:37:34'),
(4, 4, 'Graphic Designer for Social Media', 'Membuat konten visual untuk Instagram, Facebook, dan TikTok. Mahir menggunakan Adobe Creative Suite.', 'Rp 7.000.000/bulan', 'published', '2025-07-10 20:37:34', '2025-07-10 20:37:34', '2025-07-10 20:37:34'),
(5, 5, 'Content Writer (SEO)', 'Menulis artikel blog yang SEO-friendly untuk meningkatkan traffic organik. Topik seputar teknologi dan bisnis.', 'Rp 500.000/artikel', 'draft', NULL, '2025-07-10 20:37:34', '2025-07-10 20:37:34'),
(6, 6, 'Virtual Assistant', 'Membantu tugas administratif, manajemen email, dan penjadwalan meeting. Bekerja secara remote.', 'Rp 6.000.000/bulan', 'published', '2025-07-10 20:37:34', '2025-07-10 20:37:34', '2025-07-10 20:37:34'),
(7, 7, 'Project Manager Konstruksi', 'Mengawasi proyek pembangunan dari awal hingga akhir. Memiliki sertifikasi di bidang terkait.', 'Rp 15.000.000 (project-based)', 'published', '2025-07-10 20:37:34', '2025-07-10 20:37:34', '2025-07-10 20:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint UNSIGNED NOT NULL,
  `job_id` bigint UNSIGNED NOT NULL,
  `freelancer_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `job_id`, `freelancer_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2025-07-10 19:15:34', '2025-07-10 19:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_job_table', 1),
(4, '2025_07_10_130420_create_personal_access_tokens_table', 1),
(5, '2025_07_10_130829_create_profiles_table', 1),
(6, '2025_07_10_130830_create_jobs_table', 1),
(7, '2025_07_10_130831_create_job_applications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'bc6bf6c955b0e500e3ede1654bf82f4b887a194d6a885201e675943ea3831360', '[\"*\"]', '2025-07-10 06:33:26', NULL, '2025-07-10 06:30:03', '2025-07-10 06:33:26'),
(3, 'App\\Models\\User', 2, 'auth_token', 'bdd1611c007d14f248a6d582bf1955e0885630ce0c5d9c12365e892120cb90d1', '[\"*\"]', NULL, NULL, '2025-07-10 09:24:17', '2025-07-10 09:24:17'),
(4, 'App\\Models\\User', 3, 'auth_token', '7454dcee1ca565ffd4ab36c1c3113de4ea4a2873222b7273bf04e992fc26a653', '[\"*\"]', NULL, NULL, '2025-07-10 09:25:07', '2025-07-10 09:25:07'),
(5, 'App\\Models\\User', 2, 'auth_token', 'c25e12837f784091fac77b1699bcad78406c33f8a46257526e41bc2c7775ee34', '[\"*\"]', '2025-07-10 21:04:40', NULL, '2025-07-10 09:26:06', '2025-07-10 21:04:40'),
(6, 'App\\Models\\User', 3, 'auth_token', '76eba53078d91396f327755fa54143f6d0210db37c25e4ae404d7c7d7a8f7421', '[\"*\"]', '2025-07-10 21:06:16', NULL, '2025-07-10 09:26:39', '2025-07-10 21:06:16');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `company_info` text,
  `cv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `phone_number` varchar(20) DEFAULT NULL,
  `skills` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `company_info`, `cv`, `phone_number`, `skills`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, '2025-07-10 06:30:03', '2025-07-10 06:30:03'),
(2, 2, 'Perusahaan kami adalah pemimpin di industri cloud computing dan solusi AI di Asia Tenggara.', NULL, NULL, NULL, '2025-07-10 09:24:17', '2025-07-10 09:44:47'),
(3, 3, NULL, 'public/cvs/DiU2XdlYxQVt0EiqQChuvglVOreoGOYavJ93bEEF.pdf', '081298765432', 'Frontend & Backend Development, API Design, Laravel, NodeJS, Docker', '2025-07-10 09:25:07', '2025-07-10 20:11:42');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('NYVazCBJPLppSidofLkDgEBH91eXhnYpG9QW7Mqe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoick9zcDY2d3JsbmdUUGt1SXVnRjlOdTlLVnJiUU5keExNdlRZQUlLVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1752203704),
('oc0yegf55EW3Rdt0Lnugmxi2S1wvfaS1CbBvs1o4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0tXQ1JwYTh5RDIwempsclhrSmhTSHIwVnE3NHk2M1REREhqOXRtcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752154192);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('employer','freelancer') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tello Doe', 'tello@mail.com', NULL, '$2y$12$y1BJG36c0lpgG0cLX80exuOUTWNB6/Cg74vRuCV8MfgIx0gV2TJMS', 'freelancer', NULL, '2025-07-10 06:30:03', '2025-07-10 06:30:03'),
(2, 'HRD PT. Teknologi ABC', 'hrd@techabc.com', NULL, '$2y$12$eIKp4msWc4VPClqvIpTKCOZI.fzm5PBRkVoqbpSX5N1saVSmzOtAK', 'employer', NULL, '2025-07-10 09:24:17', '2025-07-10 09:44:47'),
(3, 'Heru Anggara', 'heru.susanto@freelance.com', NULL, '$2y$12$kMgh9X/pyKF8tEFZDxqHyu2L3uUF0pDlAdwcCBTwsV7PwZi.BkSk2', 'freelancer', NULL, '2025-07-10 09:25:07', '2025-07-10 09:40:12'),
(4, 'PT. Digital Kreatif', 'hr@digitalkreatif.com', '2025-07-10 20:37:32', '$2y$12$QgmsF19V7j.PeRg/CDQdl.Vf61xm9yh38q1yrcrSvAiqCvOHNHEIS', 'employer', 'prDNmBFfWW', '2025-07-10 20:37:32', '2025-07-10 20:37:32'),
(5, 'Startup Maju Jaya', 'contact@majujaya.dev', '2025-07-10 20:37:33', '$2y$12$BP9tys9pxhxlaYnRDh2qjuisrnWC8chkcp4ho6Wm1vt/Q9xpy3SO6', 'employer', 'QTDqFdAW5q', '2025-07-10 20:37:33', '2025-07-10 20:37:33'),
(6, 'Solusi Teknologi Nusantara', 'recruitment@solusinusantara.id', '2025-07-10 20:37:33', '$2y$12$nfet2ESymxPIE627LL6yh.0taS3MOrtAzinj4TdnZ.fQvDiaoMWrK', 'employer', '2tyqZqYpI0', '2025-07-10 20:37:33', '2025-07-10 20:37:33'),
(7, 'Warung Kopi Digital', 'owner@warungkopidigital.com', '2025-07-10 20:37:33', '$2y$12$blJ2gpVZyq7zIPBU.cH3LudYEoEfP3ygxr6NsORBV8hKD8J/uWlwi', 'employer', 'aTKx44hamh', '2025-07-10 20:37:33', '2025-07-10 20:37:33'),
(8, 'CV. Mitra Bangun Persada', 'mitra.persada@gmail.com', '2025-07-10 20:37:33', '$2y$12$HfhrG/NznKpZPKr8Hs8SOuP33X5DH15eSZ/rr6Iqea4BAhlymQgfa', 'employer', '0EWSjXvLn7', '2025-07-10 20:37:33', '2025-07-10 20:37:33'),
(9, 'Budi Setiawan', 'budi.dev@example.com', '2025-07-10 20:37:33', '$2y$12$QK5BWo4g8QJT/wH14c8oSOeygYeGl03H61tnKg5UnciQl3LvIXZJC', 'freelancer', '1mAbDBXedy', '2025-07-10 20:37:33', '2025-07-10 20:37:33'),
(10, 'Citra Lestari', 'citra.design@example.com', '2025-07-10 20:37:34', '$2y$12$QgJOcBesc3X2fFzNwUKWLesGWnCnSfN5qRfgUhfMHUY050yynPWOq', 'freelancer', 'W93rEnfTqJ', '2025-07-10 20:37:34', '2025-07-10 20:37:34'),
(11, 'Doni Firmansyah', 'doni.writer@example.com', '2025-07-10 20:37:34', '$2y$12$MRf1uxnuxwXygSB0unTjQOm8namzuvoHlykKu2usCMp.ydvcCu2CK', 'freelancer', 'smFRhFVifh', '2025-07-10 20:37:34', '2025-07-10 20:37:34'),
(12, 'Eka Putri', 'eka.marketing@example.com', '2025-07-10 20:37:34', '$2y$12$M1Y5z.OlO1h.C1ipKbtyQe94gpcL63DQhOEa1SnxbiKfq9kHviJaC', 'freelancer', 'blJf0iHmY0', '2025-07-10 20:37:34', '2025-07-10 20:37:34'),
(13, 'Fajar Nugraha', 'fajar.data@example.com', '2025-07-10 20:37:34', '$2y$12$f7xPOQGaEoAePKq54EK0Wep3qDPgx.xga/cZayfkCo21GxPCmMBrm', 'freelancer', 'VSgsZuMx5E', '2025-07-10 20:37:34', '2025-07-10 20:37:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_queue_index` (`queue`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_employer_id_foreign` (`employer_id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_applications_job_id_freelancer_id_unique` (`job_id`,`freelancer_id`),
  ADD KEY `job_applications_freelancer_id_foreign` (`freelancer_id`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_freelancer_id_foreign` FOREIGN KEY (`freelancer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_applications_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
