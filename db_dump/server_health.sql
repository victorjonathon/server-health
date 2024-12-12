-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2024 at 03:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `server_health`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_10_104206_create_servers_table', 1),
(5, '2024_12_10_104212_create_requests_table', 1),
(6, '2024_12_10_110240_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `server_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Success','Failure') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `server_id`, `status`, `created_at`, `updated_at`) VALUES
(23, 1, 'Failure', '2024-12-11 10:32:16', '2024-12-11 10:32:16'),
(24, 2, 'Success', '2024-12-11 10:32:18', '2024-12-11 10:32:18'),
(25, 3, 'Success', '2024-12-11 10:32:19', '2024-12-11 10:32:19'),
(26, 4, 'Success', '2024-12-11 10:32:21', '2024-12-11 10:32:21'),
(27, 1, 'Failure', '2024-12-11 10:33:27', '2024-12-11 10:33:27'),
(28, 2, 'Success', '2024-12-11 10:33:29', '2024-12-11 10:33:29'),
(29, 3, 'Success', '2024-12-11 10:33:30', '2024-12-11 10:33:30'),
(30, 4, 'Success', '2024-12-11 10:33:32', '2024-12-11 10:33:32'),
(31, 1, 'Failure', '2024-12-11 10:33:34', '2024-12-11 10:33:34'),
(32, 2, 'Success', '2024-12-11 10:33:36', '2024-12-11 10:33:36'),
(33, 3, 'Success', '2024-12-11 10:33:37', '2024-12-11 10:33:37'),
(34, 4, 'Success', '2024-12-11 10:33:39', '2024-12-11 10:33:39'),
(35, 1, 'Failure', '2024-12-11 10:33:57', '2024-12-11 10:33:57'),
(36, 2, 'Success', '2024-12-11 10:34:00', '2024-12-11 10:34:00'),
(37, 3, 'Failure', '2024-12-11 10:34:01', '2024-12-11 10:34:01'),
(38, 4, 'Success', '2024-12-11 10:34:03', '2024-12-11 10:34:03'),
(39, 1, 'Failure', '2024-12-11 10:34:04', '2024-12-11 10:34:04'),
(40, 2, 'Success', '2024-12-11 10:34:06', '2024-12-11 10:34:06'),
(41, 3, 'Success', '2024-12-11 10:34:07', '2024-12-11 10:34:07'),
(42, 4, 'Success', '2024-12-11 10:34:09', '2024-12-11 10:34:09'),
(43, 1, 'Failure', '2024-12-12 12:20:09', '2024-12-12 12:20:09'),
(44, 2, 'Success', '2024-12-12 12:20:11', '2024-12-12 12:20:11'),
(45, 3, 'Success', '2024-12-12 12:20:11', '2024-12-12 12:20:11'),
(46, 4, 'Success', '2024-12-12 12:20:13', '2024-12-12 12:20:13'),
(47, 1, 'Failure', '2024-12-12 12:20:44', '2024-12-12 12:20:44'),
(48, 2, 'Success', '2024-12-12 12:20:46', '2024-12-12 12:20:46'),
(49, 3, 'Success', '2024-12-12 12:20:47', '2024-12-12 12:20:47'),
(50, 4, 'Success', '2024-12-12 12:20:49', '2024-12-12 12:20:49'),
(51, 1, 'Failure', '2024-12-12 12:22:14', '2024-12-12 12:22:14'),
(52, 2, 'Success', '2024-12-12 12:22:15', '2024-12-12 12:22:15'),
(53, 3, 'Success', '2024-12-12 12:22:16', '2024-12-12 12:22:16'),
(54, 4, 'Success', '2024-12-12 12:22:18', '2024-12-12 12:22:18'),
(55, 1, 'Failure', '2024-12-12 12:23:23', '2024-12-12 12:23:23'),
(56, 2, 'Success', '2024-12-12 12:23:25', '2024-12-12 12:23:25'),
(57, 3, 'Success', '2024-12-12 12:23:25', '2024-12-12 12:23:25'),
(58, 4, 'Success', '2024-12-12 12:23:27', '2024-12-12 12:23:27'),
(59, 1, 'Failure', '2024-12-12 12:27:59', '2024-12-12 12:27:59'),
(60, 2, 'Success', '2024-12-12 12:28:00', '2024-12-12 12:28:00'),
(61, 3, 'Success', '2024-12-12 12:28:01', '2024-12-12 12:28:01'),
(62, 4, 'Success', '2024-12-12 12:28:03', '2024-12-12 12:28:03'),
(63, 1, 'Failure', '2024-12-12 12:28:45', '2024-12-12 12:28:45'),
(64, 2, 'Success', '2024-12-12 12:28:48', '2024-12-12 12:28:48'),
(65, 3, 'Success', '2024-12-12 12:28:49', '2024-12-12 12:28:49'),
(66, 4, 'Success', '2024-12-12 12:28:51', '2024-12-12 12:28:51'),
(67, 1, 'Failure', '2024-12-12 12:30:29', '2024-12-12 12:30:29'),
(68, 2, 'Success', '2024-12-12 12:30:37', '2024-12-12 12:30:37'),
(69, 3, 'Success', '2024-12-12 12:30:37', '2024-12-12 12:30:37'),
(70, 4, 'Success', '2024-12-12 12:30:39', '2024-12-12 12:30:39'),
(71, 1, 'Failure', '2024-12-12 12:32:07', '2024-12-12 12:32:07'),
(72, 2, 'Success', '2024-12-12 12:32:10', '2024-12-12 12:32:10'),
(73, 3, 'Success', '2024-12-12 12:32:11', '2024-12-12 12:32:11'),
(74, 4, 'Success', '2024-12-12 12:32:13', '2024-12-12 12:32:13'),
(75, 1, 'Failure', '2024-12-12 12:33:15', '2024-12-12 12:33:15'),
(76, 2, 'Success', '2024-12-12 12:33:23', '2024-12-12 12:33:23'),
(77, 3, 'Success', '2024-12-12 12:33:23', '2024-12-12 12:33:23'),
(78, 4, 'Success', '2024-12-12 12:33:25', '2024-12-12 12:33:25');

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `protocol` enum('HTTP','HTTPS','FTP','SSH') NOT NULL,
  `status` enum('Healthy','Unhealthy','Unknown') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `name`, `url`, `protocol`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Updated Server', 'http://updated-example.com', 'HTTPS', 'Unhealthy', '2024-12-11 09:51:41', '2024-12-12 12:33:15'),
(2, 'ISPWP', 'https://www.ispwp.com', 'HTTPS', 'Healthy', '2024-12-11 09:51:54', '2024-12-11 11:25:49'),
(3, 'DLP TEST', 'ftp.dlptest.com', 'FTP', 'Healthy', '2024-12-11 09:52:44', '2024-12-12 12:23:25'),
(4, 'LOGIN Online', 'https://loginonline.net/', 'HTTPS', 'Healthy', '2024-12-11 10:18:37', '2024-12-11 11:34:45');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('JDYHrDskYdQT39Ie9k5b17kW7m1dJFjtK9XxdIja', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibThObktUVHVkYVlUYmNkaHVUVWJPZlI1RUNmSVlMQ0xFbzFHZU42ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734008979);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

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
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requests_server_id_foreign` (`server_id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
