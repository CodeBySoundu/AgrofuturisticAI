-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Oct 26, 2026 at 06:27 AM
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
-- Database: `agro_ai`
--

-- --------------------------------------------------------

--
-- Table structure for table `irrigation_data`
--

CREATE TABLE `irrigation_data` (
  `id` int(11) NOT NULL,
  `moisture` int(11) NOT NULL,
  `temperature` int(11) NOT NULL,
  `crop` varchar(50) NOT NULL,
  `soil_type` varchar(50) NOT NULL,
  `rain_expected` tinyint(1) NOT NULL,
  `irrigation_result` varchar(50) NOT NULL,
  `recommendation` varchar(100) NOT NULL,
  `confidence` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `irrigation_data`
--

INSERT INTO `irrigation_data` (`id`, `moisture`, `temperature`, `crop`, `soil_type`, `rain_expected`, `irrigation_result`, `recommendation`, `confidence`, `created_at`) VALUES
(1, 25, 34, 'Rice', 'Clay', 0, 'High Irrigation', 'Start irrigation', 90, '2026-04-27 17:09:15'),
(2, 21, 36, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 84, '2026-04-27 17:24:13'),
(3, 36, 60, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 84, '2026-04-27 17:26:15'),
(4, 36, 60, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 81, '2026-04-27 17:26:17'),
(5, 36, 60, 'Rice', 'Clay', 0, 'Moderate Irrigation', 'Monitor soil', 85, '2026-04-27 17:26:21'),
(6, 36, 41, 'Rice', 'Clay', 0, 'Moderate Irrigation', 'Monitor soil', 84, '2026-04-27 17:26:28'),
(7, 1, 31, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 89, '2026-04-27 18:03:34'),
(8, 22, 35, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 84, '2026-05-03 20:01:20'),
(9, 22, 35, 'Wheat', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 88, '2026-05-03 20:02:43'),
(10, 22, 35, 'Maize', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 84, '2026-05-03 20:02:48'),
(11, 22, 35, 'Maize', 'Clay', 0, 'High Irrigation', 'Start irrigation', 89, '2026-05-03 20:02:52'),
(12, 20, 35, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 80, '2026-05-03 20:20:05'),
(13, 36, 35, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 83, '2026-05-03 20:20:12'),
(14, 3, 35, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 81, '2026-05-03 20:20:18'),
(15, 60, 35, 'Rice', 'Clay', 1, 'Low Irrigation', 'No action', 84, '2026-05-03 20:20:25'),
(16, 60, 35, 'Wheat', 'Loamy', 0, 'Low Irrigation', 'No action', 85, '2026-05-03 20:21:01'),
(17, 6, 35, 'Wheat', 'Loamy', 0, 'High Irrigation', 'Start irrigation', 87, '2026-05-03 20:21:08'),
(18, 30, 65, 'Wheat', 'Loamy', 1, 'Moderate Irrigation', 'Monitor soil', 82, '2026-05-06 15:45:16'),
(19, 5, 23, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 81, '2026-05-09 05:08:32'),
(20, 5, 23, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 80, '2026-05-09 05:21:56'),
(21, 31, 23, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 89, '2026-05-09 05:41:52'),
(22, 3, 23, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 85, '2026-05-09 05:41:59'),
(23, 3, 23, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 82, '2026-05-09 05:42:00'),
(24, 3, 23, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 88, '2026-05-09 05:42:01'),
(25, 3, 35, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 84, '2026-05-09 05:42:06'),
(26, 52, 35, 'Rice', 'Clay', 1, 'Low Irrigation', 'No action', 80, '2026-05-09 05:42:13'),
(27, 52, 3, 'Rice', 'Clay', 1, 'Low Irrigation', 'No action', 80, '2026-05-09 05:42:20'),
(28, 5, 3, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 88, '2026-05-09 05:42:24'),
(29, 55, 32, 'Rice', 'Clay', 1, 'Low Irrigation', 'No action', 85, '2026-05-09 05:42:29'),
(30, 5, 32, 'Rice', 'Clay', 1, 'Moderate Irrigation', 'Monitor soil', 84, '2026-05-09 05:42:33'),
(31, 55, 23, 'Rice', 'Clay', 1, 'Low Irrigation', 'No action', 84, '2026-10-21 18:27:14'),
(32, 55, 23, 'Rice', 'Loamy', 1, 'Low Irrigation', 'No action', 80, '2026-10-21 18:54:56'),
(33, 55, 2, 'Rice', 'Clay', 1, 'Low Irrigation', 'No action', 88, '2026-10-26 05:25:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `irrigation_data`
--
ALTER TABLE `irrigation_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `irrigation_data`
--
ALTER TABLE `irrigation_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
