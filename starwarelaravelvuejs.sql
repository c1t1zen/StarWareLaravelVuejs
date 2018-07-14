-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 14, 2018 at 02:28 PM
-- Server version: 5.7.14
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `starwarelaravelvuejs`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_07_02_214147_create_customers_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `title`, `content`, `tags`, `created_at`, `updated_at`) VALUES
(1, 0, 'fdfdsfdsfdsfds', 'fdsf df dsf ds<br>', '[\"bbb\",\"sdsadsad\"]', '2018-07-05 23:05:53', '2018-07-13 18:35:46'),
(50, 0, 'fdsfdsfdsfds', 'fdsfdsfds hhhhhhhhhhhhhhh<br>', '[\"dddd\",\"sssssssss\"]', '2018-07-08 12:20:18', '2018-07-13 18:36:02'),
(60, 1, 'ggggggggggggg', 'dsfdsfdsf', '[\"game\",\"test\",\"football\"]', '2018-07-12 20:35:58', '2018-07-13 18:35:26'),
(61, 1, 'dfdsfsdf', 'dsfdsfsdfds da rewrrewe<br>', '[\"php\",\"c++\",\"java\",\"C#\"]', '2018-07-13 12:15:53', '2018-07-13 16:23:32'),
(62, 1, 'first title', 'fdsf dd sf ds<br>', '[\"tag1\",\"tag2\",\"tag3\"]', '2018-07-13 16:24:58', '2018-07-13 16:25:14'),
(63, 1, 'dfdsf', 'fdsf f sdf ds<br>', '[\"ffff\",\"ssss\",\"eeeee\"]', '2018-07-13 16:25:51', '2018-07-13 16:25:51'),
(64, 1, 'test note', 'this is test for new note<br>', '[\"laravel\",\"vue\",\"vuex\"]', '2018-07-13 17:11:21', '2018-07-13 17:11:40'),
(65, 1, 'ddddd', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '[\"fdfdsfdsf\",\"fdfdsfds\",\"dfdsfsdf\"]', '2018-07-13 18:35:14', '2018-07-13 18:36:11'),
(66, 1, 'fdfdfd', 'fdfdfdffd f fdsdsfdsfdf<br>', '[\"ccccc\"]', '2018-07-13 18:49:20', '2018-07-13 23:24:46'),
(67, 2, 'ffff', 'fffffffffddsdddddf ds dsf dsf<br>', '[\"fdsfdsf\",\"fdsfdfdsf\",\"ffdsfdsfds\"]', '2018-07-13 21:30:34', '2018-07-13 21:30:34'),
(68, 7, 'asdfdsafdsaf', 'dsfdsafdsfadsfd', '[\"ffff\",\"sss\",\"aaa\"]', '2018-07-13 23:24:37', '2018-07-13 23:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'test@gmail.com', '$2y$10$2SxqTe6xxgwAf060WXG9c.bRgbqOTErPaEGr0z.3HTuckrUjc9Z6W', NULL, '2018-07-02 19:34:51', '2018-07-02 19:34:51'),
(2, 'admin', 'admin@admin.com', '$2y$10$qukmfaIEANBWprgi3R26EedZ.40XtVYSORSQfPHf67SNIpsBV9WGK', NULL, '2018-07-13 21:29:09', '2018-07-13 21:29:09'),
(3, '44444', 'admrrrrrin@admin.com', '$2y$10$9Z6wdk3gbINIht5aA6rXle9e/tzljZCRg7gnuNlHTTQOaY5aq37KG', NULL, '2018-07-13 22:11:59', '2018-07-13 22:11:59'),
(4, '44444', 'admrr4rin@admin.com', '$2y$10$ldRpP51DYZDKaTTODAiwD.Sm9RRI1.gAtjnC31NtS3aqJVvPbK9ei', NULL, '2018-07-13 22:12:56', '2018-07-13 22:12:56'),
(5, '44444', 'admttr4rin@admin.com', '$2y$10$NZJE.LTeOKm6ExQguj0X9OlxCTZh40NhhtUoSRiYbIhnHcJMZutIG', NULL, '2018-07-13 22:13:40', '2018-07-13 22:13:40'),
(6, 'fdsfff', 'admaaaaaain@admin.com', '$2y$10$Pa2DUs2z5ordVUvVPY7CMOszlTXCFGRy3.CgTjclkewoSlCJNm87m', NULL, '2018-07-13 22:51:09', '2018-07-13 22:51:09'),
(7, 'ddfdfd', 'admin44444@admin.com', '$2y$10$lMG9XkgJrQfvl8He86sOJuMxzEbGnknLZRkOsMfHNyPt7KxZN9Coq', NULL, '2018-07-13 23:22:50', '2018-07-13 23:22:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_index` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
