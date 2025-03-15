-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2025 at 09:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `timesheet_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('text','date','number','select') NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `type`, `options`, `created_at`, `updated_at`) VALUES
(1, 'department', 'select', '\"[\\\"IT\\\",\\\"HR\\\",\\\"Finance\\\",\\\"Marketing\\\"]\"', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(2, 'start_date', 'date', NULL, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(3, 'end_date', 'date', NULL, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(4, 'budget', 'number', NULL, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(5, 'priority', 'select', '\"[\\\"Low\\\",\\\"Medium\\\",\\\"High\\\"]\"', '2025-03-15 18:35:52', '2025-03-15 18:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `project_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Marketing', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(2, 2, 1, '2008-01-08', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(3, 3, 1, '2000-06-22', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(4, 4, 1, '23122', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(5, 5, 1, 'Low', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(6, 1, 2, 'Finance', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(7, 2, 2, '1989-05-25', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(8, 3, 2, '2009-06-09', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(9, 4, 2, '39328', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(10, 5, 2, 'High', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(11, 1, 3, 'Finance', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(12, 2, 3, '2012-09-16', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(13, 3, 3, '1975-02-22', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(14, 4, 3, '34200', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(15, 5, 3, 'High', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(16, 1, 4, 'HR', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(17, 2, 4, '2008-02-24', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(18, 3, 4, '1987-02-16', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(19, 4, 4, '34499', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(20, 5, 4, 'Medium', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(21, 1, 5, 'Finance', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(22, 2, 5, '1978-11-19', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(23, 3, 5, '2016-06-05', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(24, 4, 5, '63491', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(25, 5, 5, 'High', '2025-03-15 18:35:52', '2025-03-15 18:35:52');

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
(15, '2014_10_12_000000_create_users_table', 1),
(16, '2014_10_12_100000_create_password_resets_table', 1),
(17, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(18, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(19, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(20, '2016_06_01_000004_create_oauth_clients_table', 1),
(21, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(22, '2019_08_19_000000_create_failed_jobs_table', 1),
(23, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(24, '2025_03_13_145152_create_projects_table', 1),
(25, '2025_03_13_145540_create_timesheets_table', 1),
(26, '2025_03_13_150606_create_project_user_table', 1),
(27, '2025_03_14_022158_create_attributes_table', 1),
(28, '2025_03_14_024546_create_attribute_values_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Stanton Inc', 'active', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(2, 'Ledner PLC', 'inactive', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(3, 'Dare, Bogan and Halvorson', 'inactive', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(4, 'Block Group', 'inactive', '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(5, 'Hackett and Sons', 'inactive', '2025-03-15 18:35:52', '2025-03-15 18:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `project_user`
--

CREATE TABLE `project_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_user`
--

INSERT INTO `project_user` (`id`, `user_id`, `project_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 1, 4, NULL, NULL),
(3, 2, 1, NULL, NULL),
(4, 2, 3, NULL, NULL),
(5, 3, 1, NULL, NULL),
(6, 3, 5, NULL, NULL),
(7, 4, 2, NULL, NULL),
(8, 4, 3, NULL, NULL),
(9, 5, 3, NULL, NULL),
(10, 5, 5, NULL, NULL),
(11, 6, 3, NULL, NULL),
(12, 6, 4, NULL, NULL),
(13, 7, 3, NULL, NULL),
(14, 7, 4, NULL, NULL),
(15, 8, 1, NULL, NULL),
(16, 8, 5, NULL, NULL),
(17, 9, 2, NULL, NULL),
(18, 9, 3, NULL, NULL),
(19, 10, 3, NULL, NULL),
(20, 10, 5, NULL, NULL),
(21, 11, 4, NULL, NULL),
(22, 11, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timesheets`
--

CREATE TABLE `timesheets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hours` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timesheets`
--

INSERT INTO `timesheets` (`id`, `user_id`, `project_id`, `task_name`, `date`, `hours`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Rerum quis rerum.', '1974-02-07', 8, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(2, 1, 4, 'Error aut perferendis ut.', '2010-01-22', 8, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(3, 2, 3, 'Id explicabo quae quibusdam.', '1990-05-01', 7, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(4, 2, 5, 'Culpa ab aut quidem.', '1980-01-03', 6, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(5, 3, 4, 'Veritatis facilis voluptatibus voluptatem et.', '1972-11-10', 8, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(6, 3, 5, 'Voluptates ad fugit.', '1995-07-26', 8, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(7, 4, 1, 'Voluptatem nesciunt illo.', '2014-02-23', 6, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(8, 4, 5, 'Nisi quod eum quae.', '2003-01-09', 3, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(9, 5, 2, 'Alias consequatur tenetur.', '1987-12-04', 2, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(10, 5, 5, 'Autem similique voluptas sed rerum.', '2005-12-02', 1, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(11, 6, 3, 'Repellat velit quod.', '1995-03-06', 3, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(12, 6, 4, 'Esse facilis sed voluptate.', '2000-03-11', 6, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(13, 7, 2, 'Unde ut aliquam.', '2000-01-11', 1, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(14, 7, 5, 'Dicta voluptatem.', '1998-03-12', 6, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(15, 8, 2, 'Nihil aliquam voluptates aspernatur.', '2024-12-20', 7, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(16, 8, 5, 'Est commodi mollitia temporibus.', '2004-09-09', 6, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(17, 9, 1, 'Voluptatum possimus quia deserunt.', '2010-04-11', 3, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(18, 9, 4, 'Qui saepe iste.', '1970-11-08', 5, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(19, 10, 1, 'Et ullam ipsum qui.', '2009-01-11', 7, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(20, 10, 2, 'Provident facilis perferendis occaecati reiciendis.', '2008-06-11', 4, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(21, 11, 2, 'Et exercitationem.', '2021-06-28', 3, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(22, 11, 3, 'Aut temporibus adipisci cumque.', '1995-05-03', 3, '2025-03-15 18:35:52', '2025-03-15 18:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mahmoud', 'Ali', 'admin@admin.com', NULL, '$2y$10$ROOoaKmBVZWrZMnLnQOM0ubMdfFQai5WQRFVFOqeHPxI3857YAXdS', NULL, '2025-03-15 18:35:50', '2025-03-15 18:35:50'),
(2, 'Trycia', 'Baumbach', 'block.keyshawn@example.org', NULL, '$2y$10$8n.F2iqriyDnbXbQa6ISEueBqWAp3TF0oFjpudC7bST9JJ7IThGye', NULL, '2025-03-15 18:35:51', '2025-03-15 18:35:51'),
(3, 'Annamae', 'Mertz', 'candice.veum@example.net', NULL, '$2y$10$ZOI0qpdK8JfnDrFnMBDCX.K1AIly1cpqt9D18svkKY6Kghxtip.Ji', NULL, '2025-03-15 18:35:51', '2025-03-15 18:35:51'),
(4, 'Lacy', 'Keeling', 'jude.mertz@example.net', NULL, '$2y$10$7PoSfpkwu/AmbsLPktqZHOc345JL4ahfk2iof7nGgQ56yXRQ0r136', NULL, '2025-03-15 18:35:51', '2025-03-15 18:35:51'),
(5, 'Bonnie', 'Johnston', 'stephany23@example.com', NULL, '$2y$10$BfXmkY2Xhcqoc6.3WUSD5.Q0buEOMWTmzW8wqw9LhMLrR2wEJSMZG', NULL, '2025-03-15 18:35:51', '2025-03-15 18:35:51'),
(6, 'Antonia', 'Bergnaum', 'amparo.rosenbaum@example.org', NULL, '$2y$10$9Jycm.rBUuUBApH9lCqvOeU1Tz9xjHKRaR.ORlwC2q/7N7X73Qltm', NULL, '2025-03-15 18:35:51', '2025-03-15 18:35:51'),
(7, 'Melvina', 'Nienow', 'nikolaus.michele@example.com', NULL, '$2y$10$bLcr6bqHfHDomPh2VstH5ejIAzBScaeD1dFaXVsdZNs30HQ9QYv4G', NULL, '2025-03-15 18:35:51', '2025-03-15 18:35:51'),
(8, 'Kareem', 'Cronin', 'rosa32@example.com', NULL, '$2y$10$GlLPzwntMnuFcAE58LeYKuLVXx26QETBU3PewBh9Cs/CV3Hi4AC22', NULL, '2025-03-15 18:35:51', '2025-03-15 18:35:51'),
(9, 'Duncan', 'Collier', 'fannie86@example.org', NULL, '$2y$10$rlM7iA0BBGIiVPYX6cSUNesIQVMtNytYvX9wJ2A0Re6VmYpmb9k92', NULL, '2025-03-15 18:35:51', '2025-03-15 18:35:51'),
(10, 'Mandy', 'Schumm', 'dhilpert@example.com', NULL, '$2y$10$4.7ZFNFAXUJl4Uw2x4rZTO8t7aUgwwXqvJ9Ky61evAdhOJ2dWsdWK', NULL, '2025-03-15 18:35:52', '2025-03-15 18:35:52'),
(11, 'Derrick', 'McCullough', 'seamus40@example.org', NULL, '$2y$10$lzkWvFKRe0MOEdMQ35UHvuHl2RyHDhCkubCbIfI.2jy7YNKeZHQca', NULL, '2025-03-15 18:35:52', '2025-03-15 18:35:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_name_unique` (`name`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_values_attribute_id_project_id_unique` (`attribute_id`,`project_id`),
  ADD KEY `attribute_values_project_id_foreign` (`project_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_user`
--
ALTER TABLE `project_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_user_user_id_project_id_unique` (`user_id`,`project_id`),
  ADD KEY `project_user_project_id_foreign` (`project_id`);

--
-- Indexes for table `timesheets`
--
ALTER TABLE `timesheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timesheets_user_id_foreign` (`user_id`),
  ADD KEY `timesheets_project_id_foreign` (`project_id`);

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
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_user`
--
ALTER TABLE `project_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `timesheets`
--
ALTER TABLE `timesheets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_values_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_user`
--
ALTER TABLE `project_user`
  ADD CONSTRAINT `project_user_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `timesheets`
--
ALTER TABLE `timesheets`
  ADD CONSTRAINT `timesheets_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timesheets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
