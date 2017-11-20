-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 27, 2017 at 08:58 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hcms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `category`, `code`, `name`, `active`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'INCOME', 1, 'Comprehensive General Cleaning Services', 1, 1, '2017-07-25 16:43:36', '2017-07-25 16:43:36'),
(2, 'EXPENSE', 100, 'Tissues', 1, 1, '2017-07-25 16:49:04', '2017-07-25 16:49:04'),
(3, 'INCOME', 2, 'Fumigation', 1, 1, '2017-07-25 16:49:43', '2017-07-25 16:49:43'),
(4, 'INCOME', 3, 'Blinds', 1, 1, '2017-07-25 16:50:20', '2017-07-25 16:50:20'),
(5, 'INCOME', 4, 'Car Wash', 1, 1, '2017-07-25 16:51:05', '2017-07-25 16:51:05'),
(6, 'EXPENSE', 101, 'Sanitary Services', 0, 1, '2017-07-25 16:52:47', '2017-07-25 16:52:47'),
(8, 'EXPENSE', 222, 'Marketing', 0, 1, '2017-08-25 16:38:42', '2017-08-25 16:38:42'),
(9, 'INCOME', 223, 'Bins', 0, 1, '2017-08-25 16:39:20', '2017-08-25 16:39:20'),
(12, 'INCOME', 2001, 'Payroll', 1, 1, '2017-10-21 06:28:45', '2017-10-21 06:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `id` int(10) UNSIGNED NOT NULL,
  `allowance_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `allowances`
--

INSERT INTO `allowances` (`id`, `allowance_name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'House Allowance', 1, '2017-06-29 09:43:47', '2017-06-29 09:43:47'),
(2, 'Travel Allowance', 1, '2017-06-29 09:44:20', '2017-06-29 09:44:20');

-- --------------------------------------------------------

--
-- Table structure for table `appraisalcategories`
--

CREATE TABLE `appraisalcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate` int(11) DEFAULT '10',
  `organization_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `appraisalcategories`
--

INSERT INTO `appraisalcategories` (`id`, `name`, `rate`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Skill', 10, 1, '2017-10-23 19:27:32', '2017-10-23 19:27:32'),
(2, 'Attitude', 10, 1, '2017-10-23 19:30:48', '2017-10-23 19:30:48'),
(3, 'Test', 10, 1, '2017-10-26 07:42:00', '2017-10-26 07:42:00'),
(4, 'Test2', 10, 1, '2017-10-26 07:42:35', '2017-10-26 07:42:35');

-- --------------------------------------------------------

--
-- Table structure for table `appraisalquestions`
--

CREATE TABLE `appraisalquestions` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `appraisalcategory_id` int(10) UNSIGNED NOT NULL,
  `rate` int(11) DEFAULT '10',
  `organization_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `appraisalquestions`
--

INSERT INTO `appraisalquestions` (`id`, `question`, `appraisalcategory_id`, `rate`, `organization_id`, `created_at`, `updated_at`) VALUES
(2, 'How competent is he/ she?', 1, 10, 1, '2017-10-26 07:48:05', '2017-10-26 07:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `appraisals`
--

CREATE TABLE `appraisals` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `appraisalquestion_id` int(10) UNSIGNED NOT NULL,
  `performance` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL DEFAULT '0',
  `examiner` int(10) UNSIGNED NOT NULL,
  `appraisaldate` date NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `organization_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `appraisals`
--

INSERT INTO `appraisals` (`id`, `employee_id`, `appraisalquestion_id`, `performance`, `rate`, `examiner`, `appraisaldate`, `comment`, `organization_id`, `created_at`, `updated_at`) VALUES
(5, 1, 2, 'Outstanding', 8, 2, '2017-10-26', 'bla', 1, '2017-10-26 15:11:45', '2017-10-26 15:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_roles`
--

CREATE TABLE `assigned_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assigned_roles`
--

INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`, `organization_id`) VALUES
(1, 1, 1, NULL),
(2, 2, 1, NULL),
(4, 4, 2, NULL),
(7, 5, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float(10,0) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `date`, `user`, `action`, `entity`, `amount`, `description`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, '2017-10-27', 'HR', 'view', 'Employee Report', NULL, 'viewed employees report list', NULL, '2017-10-27 04:49:25', '2017-10-27 04:49:25'),
(2, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 04:49:30', '2017-10-27 04:49:30'),
(3, '2017-10-27', 'HR', 'view', 'Employee Next Of Kin Report', NULL, 'viewed employee next of kin report for NSL.1 : Xavier Ikachai', NULL, '2017-10-27 04:50:04', '2017-10-27 04:50:04'),
(4, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 04:50:13', '2017-10-27 04:50:13'),
(5, '2017-10-27', 'HR', 'view', 'Company Property Report', NULL, 'viewed company property report for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 04:50:47', '2017-10-27 04:50:47'),
(6, '2017-10-27', 'HR', 'view', 'Company Property Report', NULL, 'viewed company property report for NSL.1 : Xavier Ikachai for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 04:50:57', '2017-10-27 04:50:57'),
(7, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 04:51:05', '2017-10-27 04:51:05'),
(8, '2017-10-27', 'HR', 'view', 'Employee Appraisal Report', NULL, 'viewed employee appraisal report period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 04:51:35', '2017-10-27 04:51:35'),
(9, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 04:51:51', '2017-10-27 04:51:51'),
(10, '2017-10-27', 'HR', 'view', 'Company Property Report', NULL, 'viewed company property report for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 04:52:00', '2017-10-27 04:52:00'),
(11, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 04:52:02', '2017-10-27 04:52:02'),
(12, '2017-10-27', 'HR', 'view', 'Employee Appraisal Report', NULL, 'viewed employee appraisal report for NSL.1 : Xavier Ikachai for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 04:52:40', '2017-10-27 04:52:40'),
(13, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 04:52:47', '2017-10-27 04:52:47'),
(14, '2017-10-27', 'HR', 'view', 'Employee Appraisal Report', NULL, 'viewed employee appraisal report for NSL.1 : Xavier Ikachai for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 04:53:01', '2017-10-27 04:53:01'),
(15, '2017-10-27', 'HR', 'view', 'Employee Report', NULL, 'viewed employees report list', NULL, '2017-10-27 04:53:19', '2017-10-27 04:53:19'),
(16, '2017-10-27', 'HR', 'view', 'Employee Next Of Kin Report', NULL, 'viewed employee next of kin report for NSL.1 : Xavier Ikachai', NULL, '2017-10-27 04:53:31', '2017-10-27 04:53:31'),
(17, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 04:53:37', '2017-10-27 04:53:37'),
(18, '2017-10-27', 'HR', 'view', 'Company Property Report', NULL, 'viewed company property report for period from 2017-10-01 to 2017-10-30', NULL, '2017-10-27 04:54:00', '2017-10-27 04:54:00'),
(19, '2017-10-27', 'HR', 'view', 'Employee Appraisal Report', NULL, 'viewed employee appraisal report for NSL.1 : Xavier Ikachai for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 04:54:22', '2017-10-27 04:54:22'),
(20, '2017-10-27', 'HR', 'view', 'Leave Application Report', NULL, 'viewed leave application report for department House Keeping for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 04:55:33', '2017-10-27 04:55:33'),
(21, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 04:55:39', '2017-10-27 04:55:39'),
(22, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 04:55:56', '2017-10-27 04:55:56'),
(23, '2017-10-27', 'HR', 'view', 'Leave Approved Report', NULL, 'viewed leave approved report for period from 2017-01-01 to 2017-10-31', NULL, '2017-10-27 05:11:06', '2017-10-27 05:11:06'),
(24, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 05:11:17', '2017-10-27 05:11:17'),
(25, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 05:14:15', '2017-10-27 05:14:15'),
(26, '2017-10-27', 'HR', 'view', 'Leave Approved Report', NULL, 'viewed leave approved report for period from 2017-01-01 to 2017-10-31', NULL, '2017-10-27 05:14:21', '2017-10-27 05:14:21'),
(27, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 05:14:26', '2017-10-27 05:14:26'),
(28, '2017-10-27', 'HR', 'view', 'Leave Approved Report', NULL, 'viewed leave approved report for branch Embassy Hotel for period from 2017-01-01 to 2017-10-31', NULL, '2017-10-27 05:14:43', '2017-10-27 05:14:43'),
(29, '2017-10-27', 'HR', 'view', 'Leave Approved Report', NULL, 'viewed leave approved report for branch for period from 2017-01-01 to 2017-10-31', NULL, '2017-10-27 05:14:50', '2017-10-27 05:14:50'),
(30, '2017-10-27', 'HR', 'view', 'Leave Rejected Report', NULL, 'viewed leave rejected report for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 05:27:27', '2017-10-27 05:27:27'),
(31, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 05:27:37', '2017-10-27 05:27:37'),
(32, '2017-10-27', 'HR', 'view', 'Leave Rejected Report', NULL, 'viewed leave rejected report for department House Keeping for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 05:27:59', '2017-10-27 05:27:59'),
(33, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 05:28:04', '2017-10-27 05:28:04'),
(34, '2017-10-27', 'HR', 'view', 'Leave Rejected Report', NULL, 'viewed leave rejected report for branch Embassy Hotel and department House Keeping for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 05:28:17', '2017-10-27 05:28:17'),
(35, '2017-10-27', 'HR', 'view', 'Leave Rejected Report', NULL, 'viewed leave rejected report for branch Embassy Hotel and department House Keeping for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 05:28:25', '2017-10-27 05:28:25'),
(36, '2017-10-27', 'HR', 'view', 'Vacation Rejected Report', NULL, 'viewed vacation rejected report for branch Embassy Hotel and department House Keeping for period from 2017-10-01 to 2017-10-31', NULL, '2017-10-27 05:31:12', '2017-10-27 05:31:12'),
(37, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 05:31:16', '2017-10-27 05:31:16'),
(38, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 05:32:32', '2017-10-27 05:32:32'),
(39, '2017-10-27', 'HR', 'view', 'vacation balance report for vacation type Maternity', NULL, 'viewed vacation balance report for vacation type Maternity for period from  to ', NULL, '2017-10-27 08:15:07', '2017-10-27 08:15:07'),
(40, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 08:16:57', '2017-10-27 08:16:57'),
(41, '2017-10-27', 'HR', 'view', 'Employees on Vacation report', NULL, 'viewed employees on vacation report for vacation type Maternity for branch Embassy Hotel and department House Keeping for period from  to ', NULL, '2017-10-27 08:32:32', '2017-10-27 08:32:32'),
(42, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 08:32:38', '2017-10-27 08:32:38'),
(43, '2017-10-27', 'HR', 'view', 'Employee Vacation report', NULL, 'viewed employee vacation report for employee NSL.1 : Xavier Ikachai', NULL, '2017-10-27 08:34:05', '2017-10-27 08:34:05'),
(44, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 08:34:18', '2017-10-27 08:34:18'),
(45, '2017-10-27', 'HR', 'view', 'Employee Occurence Report', NULL, 'viewed employee occurence report for NSL.1 : Xavier Ikachai for period between  and ', NULL, '2017-10-27 08:52:44', '2017-10-27 08:52:44'),
(46, '2017-10-27', 'HR', 'view', 'Employee Occurence Report', NULL, 'viewed employee occurence report for NSL.1 : Xavier Ikachai for period between 2017-10-01 and 2017-10-31', NULL, '2017-10-27 08:54:09', '2017-10-27 08:54:09'),
(47, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 08:54:23', '2017-10-27 08:54:23'),
(48, '2017-10-27', 'HR', 'view', 'Employee Occurence Report', NULL, 'viewed employee occurence report for NSL.1 : Xavier Ikachai for period between 2017-09-01 and 2017-09-08', NULL, '2017-10-27 08:54:47', '2017-10-27 08:54:47'),
(49, '2017-10-27', 'HR', 'view', 'Employee Occurence Report', NULL, 'viewed employee occurence report for NSL.1 : Xavier Ikachai for period between 2017-09-01 and 2017-10-31', NULL, '2017-10-27 08:54:55', '2017-10-27 08:54:55'),
(50, '2017-10-27', 'HR', 'view', 'Employee Occurence Report', NULL, 'viewed employee occurence report for NSL.1 : Xavier Ikachai for period between 2017-09-01 and 2017-10-31', NULL, '2017-10-27 08:55:00', '2017-10-27 08:55:00'),
(51, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 08:55:15', '2017-10-27 08:55:15'),
(52, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 09:14:51', '2017-10-27 09:14:51'),
(53, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:15:58', '2017-10-27 09:15:58'),
(54, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:17:10', '2017-10-27 09:17:10'),
(55, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:18:29', '2017-10-27 09:18:29'),
(56, '2017-10-27', 'HR', 'create', 'Education', NULL, 'created education Certification', NULL, '2017-10-27 09:18:39', '2017-10-27 09:18:39'),
(57, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:18:40', '2017-10-27 09:18:40'),
(58, '2017-10-27', 'HR', 'delete', 'Education', NULL, 'deleted education Digirii', NULL, '2017-10-27 09:18:50', '2017-10-27 09:18:50'),
(59, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:18:50', '2017-10-27 09:18:50'),
(60, '2017-10-27', 'HR', 'update', 'Education', NULL, 'updated education Cisco Certification', NULL, '2017-10-27 09:20:21', '2017-10-27 09:20:21'),
(61, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:20:21', '2017-10-27 09:20:21'),
(62, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:20:35', '2017-10-27 09:20:35'),
(63, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 09:20:40', '2017-10-27 09:20:40'),
(64, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:27:05', '2017-10-27 09:27:05'),
(65, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:28:49', '2017-10-27 09:28:49'),
(66, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:31:57', '2017-10-27 09:31:57'),
(67, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:32:50', '2017-10-27 09:32:50'),
(68, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:33:28', '2017-10-27 09:33:28'),
(69, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:34:11', '2017-10-27 09:34:11'),
(70, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:34:39', '2017-10-27 09:34:39'),
(71, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:38:19', '2017-10-27 09:38:19'),
(72, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:39:59', '2017-10-27 09:39:59'),
(73, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:40:45', '2017-10-27 09:40:45'),
(74, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:41:10', '2017-10-27 09:41:10'),
(75, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:42:13', '2017-10-27 09:42:13'),
(76, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:42:48', '2017-10-27 09:42:48'),
(77, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:43:06', '2017-10-27 09:43:06'),
(78, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:44:19', '2017-10-27 09:44:19'),
(79, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:44:23', '2017-10-27 09:44:23'),
(80, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:44:55', '2017-10-27 09:44:55'),
(81, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:46:16', '2017-10-27 09:46:16'),
(82, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:46:37', '2017-10-27 09:46:37'),
(83, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:46:57', '2017-10-27 09:46:57'),
(84, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 09:47:28', '2017-10-27 09:47:28'),
(85, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 09:57:01', '2017-10-27 09:57:01'),
(86, '2017-10-27', 'HR', 'create', 'NextofKins', NULL, 'created:  for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:06:14', '2017-10-27 10:06:14'),
(87, '2017-10-27', 'HR', 'delete', 'NextofKins', NULL, 'deleted:  for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:06:31', '2017-10-27 10:06:31'),
(88, '2017-10-27', 'HR', 'create', 'NextofKins', NULL, 'created:  for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:06:55', '2017-10-27 10:06:55'),
(89, '2017-10-27', 'HR', 'update', 'NextofKins', NULL, 'updated:  for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:08:36', '2017-10-27 10:08:36'),
(90, '2017-10-27', 'HR', 'create', 'NextofKins', NULL, 'created:  for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:09:45', '2017-10-27 10:09:45'),
(91, '2017-10-27', 'HR', 'delete', 'NextofKins', NULL, 'deleted:  for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:09:54', '2017-10-27 10:09:54'),
(92, '2017-10-27', 'HR', 'create', 'Documents', NULL, 'created document  for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:32:43', '2017-10-27 10:32:43'),
(93, '2017-10-27', 'HR', 'create', 'Documents', NULL, 'created document KSCE for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:35:53', '2017-10-27 10:35:53'),
(94, '2017-10-27', 'HR', 'create', 'Documents', NULL, 'created document KSCE for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:43:09', '2017-10-27 10:43:09'),
(95, '2017-10-27', 'HR', 'create', 'Documents', NULL, 'created document KSCE for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:46:43', '2017-10-27 10:46:43'),
(96, '2017-10-27', 'HR', 'delete', 'Documents', NULL, 'deleted document KSCE.xls for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:47:38', '2017-10-27 10:47:38'),
(97, '2017-10-27', 'HR', 'create', 'Documents', NULL, 'created document KSCE for NSL.1-Xavier Ikachai', NULL, '2017-10-27 10:47:53', '2017-10-27 10:47:53'),
(98, '2017-10-27', 'HR', 'update', 'NextofKins', NULL, 'updated kin Test Test for NSL.1-Xavier Ikachai', NULL, '2017-10-27 11:12:31', '2017-10-27 11:12:31'),
(99, '2017-10-27', 'HR', 'update', 'Documents', NULL, 'updated document KSCE.xls for NSL.1-Xavier Ikachai', NULL, '2017-10-27 11:17:59', '2017-10-27 11:17:59'),
(100, '2017-10-27', 'HR', 'update', 'Documents', NULL, 'updated document KSCE.xls for NSL.1-Xavier Ikachai', NULL, '2017-10-27 11:18:55', '2017-10-27 11:18:55'),
(101, '2017-10-27', 'HR', 'delete', 'Documents', NULL, 'deleted document KSCE.xls for NSL.1-Xavier Ikachai', NULL, '2017-10-27 11:19:42', '2017-10-27 11:19:42'),
(102, '2017-10-27', 'HR', 'view', 'Appraisals', NULL, 'viewed appraisals', NULL, '2017-10-27 11:34:58', '2017-10-27 11:34:58'),
(103, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 11:35:49', '2017-10-27 11:35:49'),
(104, '2017-10-27', 'HR', 'activate', 'Employee', NULL, 'activated: PL.2-Test Test', NULL, '2017-10-27 11:36:12', '2017-10-27 11:36:12'),
(105, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 11:36:15', '2017-10-27 11:36:15'),
(106, '2017-10-27', 'HR', 'create', 'Employee Appraisal', NULL, 'created:  for PL.2-Test Test', NULL, '2017-10-27 11:59:47', '2017-10-27 11:59:47'),
(107, '2017-10-27', 'HR', 'update', 'Appraisal Question', NULL, 'updated:  for PL.2-Test Test', NULL, '2017-10-27 12:03:47', '2017-10-27 12:03:47'),
(108, '2017-10-27', 'HR', 'update', 'Appraisal Question', NULL, 'updated appraisal  for PL.2-Test Test', NULL, '2017-10-27 12:05:17', '2017-10-27 12:05:17'),
(109, '2017-10-27', 'HR', 'view', 'Appraisals', NULL, 'viewed appraisals', NULL, '2017-10-27 12:05:27', '2017-10-27 12:05:27'),
(110, '2017-10-27', 'HR', 'update', 'Appraisal Question', NULL, 'updated appraisal  for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:05:39', '2017-10-27 12:05:39'),
(111, '2017-10-27', 'HR', 'view', 'Appraisals', NULL, 'viewed appraisals', NULL, '2017-10-27 12:05:46', '2017-10-27 12:05:46'),
(112, '2017-10-27', 'HR', 'view', 'Appraisals', NULL, 'viewed appraisals', NULL, '2017-10-27 12:08:55', '2017-10-27 12:08:55'),
(113, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 12:08:59', '2017-10-27 12:08:59'),
(114, '2017-10-27', 'HR', 'delete', 'Employee Appraisal', NULL, 'deleted appraisal  for PL.2-Test Test', NULL, '2017-10-27 12:09:56', '2017-10-27 12:09:56'),
(115, '2017-10-27', 'HR', 'view', 'Appraisals', NULL, 'viewed appraisals', NULL, '2017-10-27 12:09:56', '2017-10-27 12:09:56'),
(116, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 12:10:40', '2017-10-27 12:10:40'),
(117, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 12:10:44', '2017-10-27 12:10:44'),
(118, '2017-10-27', 'HR', 'create', 'Employee Appraisal', NULL, 'created appraisal  for PL.2-Test Test', NULL, '2017-10-27 12:11:54', '2017-10-27 12:11:54'),
(119, '2017-10-27', 'HR', 'delete', 'Employee Appraisal', NULL, 'deleted appraisal  for PL.2-Test Test', NULL, '2017-10-27 12:12:02', '2017-10-27 12:12:02'),
(120, '2017-10-27', 'HR', 'create', 'Employee Appraisal', NULL, 'created appraisal  for PL.2-Test Test', NULL, '2017-10-27 12:12:44', '2017-10-27 12:12:44'),
(121, '2017-10-27', 'HR', 'delete', 'Employee Appraisal', NULL, 'deleted appraisal  for PL.2-Test Test', NULL, '2017-10-27 12:12:51', '2017-10-27 12:12:51'),
(122, '2017-10-27', 'HR', 'create', 'NextofKins', NULL, 'created kin Test Test for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:18:39', '2017-10-27 12:18:39'),
(123, '2017-10-27', 'HR', 'update', 'NextofKins', NULL, 'updated kin Test Test for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:18:49', '2017-10-27 12:18:49'),
(124, '2017-10-27', 'HR', 'create', 'Documents', NULL, 'created document bla for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:24:02', '2017-10-27 12:24:02'),
(125, '2017-10-27', 'HR', 'update', 'Documents', NULL, 'updated document bla.doc for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:24:18', '2017-10-27 12:24:18'),
(126, '2017-10-27', 'HR', 'delete', 'Documents', NULL, 'deleted document bla.doc for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:24:28', '2017-10-27 12:24:28'),
(127, '2017-10-27', 'HR', 'delete', 'Documents', NULL, 'deleted document bla.doc for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:24:36', '2017-10-27 12:24:36'),
(128, '2017-10-27', 'HR', 'create', 'Documents', NULL, 'created document Bla for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:24:50', '2017-10-27 12:24:50'),
(129, '2017-10-27', 'HR', 'create', 'Documents', NULL, 'created document bla for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:26:14', '2017-10-27 12:26:14'),
(130, '2017-10-27', 'HR', 'delete', 'Documents', NULL, 'deleted document bla.xls for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:26:21', '2017-10-27 12:26:21'),
(131, '2017-10-27', 'HR', 'create', 'Documents', NULL, 'created document Bla for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:26:34', '2017-10-27 12:26:34'),
(132, '2017-10-27', 'HR', 'delete', 'Documents', NULL, 'deleted document Bla.doc for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:26:41', '2017-10-27 12:26:41'),
(133, '2017-10-27', 'HR', 'create', 'Properties', NULL, 'created property Bla for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:33:47', '2017-10-27 12:33:47'),
(134, '2017-10-27', 'HR', 'update', 'Properties', NULL, 'updated property Bla for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:34:44', '2017-10-27 12:34:44'),
(135, '2017-10-27', 'HR', 'update', 'Properties', NULL, 'updated property Bla for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:36:15', '2017-10-27 12:36:15'),
(136, '2017-10-27', 'HR', 'update', 'Properties', NULL, 'updated property Bla for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:37:02', '2017-10-27 12:37:02'),
(137, '2017-10-27', 'HR', 'view', 'Properties', NULL, 'viewed company properties', NULL, '2017-10-27 12:37:19', '2017-10-27 12:37:19'),
(138, '2017-10-27', 'HR', 'view', 'Properties', NULL, 'viewed company properties', NULL, '2017-10-27 12:38:36', '2017-10-27 12:38:36'),
(139, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 12:38:44', '2017-10-27 12:38:44'),
(140, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 12:38:57', '2017-10-27 12:38:57'),
(141, '2017-10-27', 'HR', 'view', 'Properties', NULL, 'viewed company properties', NULL, '2017-10-27 12:39:47', '2017-10-27 12:39:47'),
(142, '2017-10-27', 'HR', 'view', 'Properties', NULL, 'viewed company properties', NULL, '2017-10-27 12:39:53', '2017-10-27 12:39:53'),
(143, '2017-10-27', 'HR', 'update', 'Properties', NULL, 'updated property Bla for NSL.1-Xavier Ikachai', NULL, '2017-10-27 12:40:02', '2017-10-27 12:40:02'),
(144, '2017-10-27', 'HR', 'view', 'Properties', NULL, 'viewed company properties', NULL, '2017-10-27 12:40:06', '2017-10-27 12:40:06'),
(145, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 12:40:14', '2017-10-27 12:40:14'),
(146, '2017-10-27', 'HR', 'create', 'Occurences', NULL, 'created occurence bla for PL.2-Test Test', NULL, '2017-10-27 12:48:53', '2017-10-27 12:48:53'),
(147, '2017-10-27', 'HR', 'create', 'Occurences', NULL, 'created occurence bla for PL.2-Test Test', NULL, '2017-10-27 12:50:13', '2017-10-27 12:50:13'),
(148, '2017-10-27', 'HR', 'update', 'Occurences', NULL, 'updated occurence bla1 for PL.2-Test Test', NULL, '2017-10-27 12:50:30', '2017-10-27 12:50:30'),
(149, '2017-10-27', 'HR', 'update', 'Occurences', NULL, 'updated occurence bla for PL.2-Test Test', NULL, '2017-10-27 12:50:59', '2017-10-27 12:50:59'),
(150, '2017-10-27', 'HR', 'view', 'Occurences', NULL, 'viewed occurences', NULL, '2017-10-27 12:51:15', '2017-10-27 12:51:15'),
(151, '2017-10-27', 'HR', 'update', 'Occurences', NULL, 'updated occurence bla for PL.2-Test Test', NULL, '2017-10-27 12:51:36', '2017-10-27 12:51:36'),
(152, '2017-10-27', 'HR', 'view', 'Occurences', NULL, 'viewed occurences', NULL, '2017-10-27 12:51:44', '2017-10-27 12:51:44'),
(153, '2017-10-27', 'HR', 'view', 'Occurences', NULL, 'viewed occurences', NULL, '2017-10-27 12:52:40', '2017-10-27 12:52:40'),
(154, '2017-10-27', 'HR', 'view', 'Occurences', NULL, 'viewed occurences', NULL, '2017-10-27 12:52:45', '2017-10-27 12:52:45'),
(155, '2017-10-27', 'HR', 'update', 'Occurences', NULL, 'updated occurence bla1 for PL.2-Test Test', NULL, '2017-10-27 12:52:51', '2017-10-27 12:52:51'),
(156, '2017-10-27', 'HR', 'view', 'Occurences', NULL, 'viewed occurences', NULL, '2017-10-27 12:52:55', '2017-10-27 12:52:55'),
(157, '2017-10-27', 'HR', 'delete', 'Occurences', NULL, 'deleted occurence bla1 for PL.2-Test Test', NULL, '2017-10-27 12:53:13', '2017-10-27 12:53:13'),
(158, '2017-10-27', 'HR', 'view', 'Occurences', NULL, 'viewed occurences', NULL, '2017-10-27 12:53:14', '2017-10-27 12:53:14'),
(159, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 12:53:20', '2017-10-27 12:53:20'),
(160, '2017-10-27', 'HR', 'delete', 'Occurences', NULL, 'deleted occurence bla for PL.2-Test Test', NULL, '2017-10-27 12:53:33', '2017-10-27 12:53:33'),
(161, '2017-10-27', 'HR', 'view', 'Occurences', NULL, 'viewed occurences', NULL, '2017-10-27 12:53:34', '2017-10-27 12:53:34'),
(162, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 12:54:40', '2017-10-27 12:54:40'),
(163, '2017-10-27', 'HR', 'create', 'Occurences', NULL, 'created occurence bla for PL.2-Test Test', NULL, '2017-10-27 12:55:05', '2017-10-27 12:55:05'),
(164, '2017-10-27', 'HR', 'delete', 'Occurences', NULL, 'deleted occurence bla for PL.2-Test Test', NULL, '2017-10-27 12:55:27', '2017-10-27 12:55:27'),
(165, '2017-10-27', 'HR', 'create', 'Occurences', NULL, 'created occurence bla for PL.2-Test Test', NULL, '2017-10-27 12:56:27', '2017-10-27 12:56:27'),
(166, '2017-10-27', 'HR', 'delete', 'Occurences', NULL, 'deleted occurence bla for PL.2-Test Test', NULL, '2017-10-27 12:56:37', '2017-10-27 12:56:37'),
(167, '2017-10-27', 'HR', 'create', 'Properties', NULL, 'created property bla for PL.2-Test Test', NULL, '2017-10-27 12:56:56', '2017-10-27 12:56:56'),
(168, '2017-10-27', 'HR', 'delete', 'Properties', NULL, 'deleted property bla for PL.2-Test Test', NULL, '2017-10-27 12:57:03', '2017-10-27 12:57:03'),
(169, '2017-10-27', 'HR', 'view', 'Organization', NULL, 'viewed organization details', NULL, '2017-10-27 13:22:17', '2017-10-27 13:22:17'),
(170, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 13:23:31', '2017-10-27 13:23:31'),
(171, '2017-10-27', 'HR', 'view', 'Organization', NULL, 'viewed organization details', NULL, '2017-10-27 13:30:19', '2017-10-27 13:30:19'),
(172, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 13:30:39', '2017-10-27 13:30:39'),
(173, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 13:33:08', '2017-10-27 13:33:08'),
(174, '2017-10-27', 'HR', 'view', 'Organization', NULL, 'viewed organization details', NULL, '2017-10-27 13:33:13', '2017-10-27 13:33:13'),
(175, '2017-10-27', 'HR', 'view', 'Users', NULL, 'viewed system users', NULL, '2017-10-27 13:35:36', '2017-10-27 13:35:36'),
(176, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 13:49:26', '2017-10-27 13:49:26'),
(177, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 13:49:37', '2017-10-27 13:49:37'),
(178, '2017-10-27', 'HR', 'view', 'Users', NULL, 'viewed system users', NULL, '2017-10-27 13:50:20', '2017-10-27 13:50:20'),
(179, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 13:53:36', '2017-10-27 13:53:36'),
(180, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 13:54:03', '2017-10-27 13:54:03'),
(181, '2017-10-27', 'HR', 'view', 'Users', NULL, 'viewed system users', NULL, '2017-10-27 13:54:07', '2017-10-27 13:54:07'),
(182, '2017-10-27', 'HR', 'view', 'Audit Trails', NULL, 'viewed audit trails', NULL, '2017-10-27 13:56:41', '2017-10-27 13:56:41'),
(183, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 13:57:08', '2017-10-27 13:57:08'),
(184, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 13:57:22', '2017-10-27 13:57:22'),
(185, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 14:03:59', '2017-10-27 14:03:59'),
(186, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 14:05:52', '2017-10-27 14:05:52'),
(187, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 14:06:01', '2017-10-27 14:06:01'),
(188, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 14:06:16', '2017-10-27 14:06:16'),
(189, '2017-10-27', 'HR', 'view', 'Users', NULL, 'viewed system users', NULL, '2017-10-27 14:06:25', '2017-10-27 14:06:25'),
(190, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 14:06:31', '2017-10-27 14:06:31'),
(191, '2017-10-27', 'HR', 'view', 'Branch', NULL, 'viewed branches', NULL, '2017-10-27 14:08:39', '2017-10-27 14:08:39'),
(192, '2017-10-27', 'HR', 'view', 'Branch', NULL, 'viewed branches', NULL, '2017-10-27 14:10:30', '2017-10-27 14:10:30'),
(193, '2017-10-27', 'HR', 'view', 'Branch', NULL, 'viewed branches', NULL, '2017-10-27 14:10:36', '2017-10-27 14:10:36'),
(194, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 14:11:03', '2017-10-27 14:11:03'),
(195, '2017-10-27', 'HR', 'view', 'Departments', NULL, 'viewed departments', NULL, '2017-10-27 14:11:16', '2017-10-27 14:11:16'),
(196, '2017-10-27', 'HR', 'view', 'Branch', NULL, 'viewed branches', NULL, '2017-10-27 14:15:43', '2017-10-27 14:15:43'),
(197, '2017-10-27', 'HR', 'view', 'Branch', NULL, 'viewed branches', NULL, '2017-10-27 14:18:11', '2017-10-27 14:18:11'),
(198, '2017-10-27', 'HR', 'view', 'Branch', NULL, 'viewed branches', NULL, '2017-10-27 14:18:17', '2017-10-27 14:18:17'),
(199, '2017-10-27', 'HR', 'view', 'Banks', NULL, 'viewed banks', NULL, '2017-10-27 14:18:33', '2017-10-27 14:18:33'),
(200, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 14:22:27', '2017-10-27 14:22:27'),
(201, '2017-10-27', 'HR', 'view', 'Banks', NULL, 'viewed banks', NULL, '2017-10-27 14:22:36', '2017-10-27 14:22:36'),
(202, '2017-10-27', 'HR', 'view', 'Banks', NULL, 'viewed banks', NULL, '2017-10-27 14:22:56', '2017-10-27 14:22:56'),
(203, '2017-10-27', 'HR', 'view', 'Banks', NULL, 'viewed banks', NULL, '2017-10-27 14:23:13', '2017-10-27 14:23:13'),
(204, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 14:23:28', '2017-10-27 14:23:28'),
(205, '2017-10-27', 'HR', 'view', 'Banks', NULL, 'viewed banks', NULL, '2017-10-27 14:24:43', '2017-10-27 14:24:43'),
(206, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 14:24:53', '2017-10-27 14:24:53'),
(207, '2017-10-27', 'HR', 'view', 'Banks', NULL, 'viewed banks', NULL, '2017-10-27 14:25:13', '2017-10-27 14:25:13'),
(208, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 14:25:58', '2017-10-27 14:25:58'),
(209, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 14:26:26', '2017-10-27 14:26:26'),
(210, '2017-10-27', 'HR', 'view', 'Departments', NULL, 'viewed departments', NULL, '2017-10-27 14:26:33', '2017-10-27 14:26:33'),
(211, '2017-10-27', 'HR', 'update', 'Department', NULL, 'updated: Information Technology', NULL, '2017-10-27 14:26:43', '2017-10-27 14:26:43'),
(212, '2017-10-27', 'HR', 'view', 'Departments', NULL, 'viewed departments', NULL, '2017-10-27 14:26:43', '2017-10-27 14:26:43'),
(213, '2017-10-27', 'HR', 'view', 'Departments', NULL, 'viewed departments', NULL, '2017-10-27 14:29:52', '2017-10-27 14:29:52'),
(214, '2017-10-27', 'HR', 'update', 'Department', NULL, 'updated: Management', NULL, '2017-10-27 14:30:23', '2017-10-27 14:30:23'),
(215, '2017-10-27', 'HR', 'view', 'Departments', NULL, 'viewed departments', NULL, '2017-10-27 14:30:24', '2017-10-27 14:30:24'),
(216, '2017-10-27', 'HR', 'update', 'Department', NULL, 'updated: Information Technology', NULL, '2017-10-27 14:30:31', '2017-10-27 14:30:31'),
(217, '2017-10-27', 'HR', 'view', 'Departments', NULL, 'viewed departments', NULL, '2017-10-27 14:30:32', '2017-10-27 14:30:32'),
(218, '2017-10-27', 'HR', 'view', 'Departments', NULL, 'viewed departments', NULL, '2017-10-27 14:30:39', '2017-10-27 14:30:39'),
(219, '2017-10-27', 'HR', 'view', 'Bank Branch', NULL, 'view bank branches', NULL, '2017-10-27 14:30:51', '2017-10-27 14:30:51'),
(220, '2017-10-27', 'HR', 'view', 'Bank Branch', NULL, 'view bank branches', NULL, '2017-10-27 14:30:51', '2017-10-27 14:30:51'),
(221, '2017-10-27', 'HR', 'view', 'Bank Branch', NULL, 'view bank branches', NULL, '2017-10-27 14:39:47', '2017-10-27 14:39:47'),
(222, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 14:42:03', '2017-10-27 14:42:03'),
(223, '2017-10-27', 'HR', 'view', 'Bank Branch', NULL, 'view bank branches', NULL, '2017-10-27 14:42:14', '2017-10-27 14:42:14'),
(224, '2017-10-27', 'HR', 'view', 'Bank Branch', NULL, 'view bank branches', NULL, '2017-10-27 14:44:03', '2017-10-27 14:44:03'),
(225, '2017-10-27', 'HR', 'view', 'Bank Branch', NULL, 'view bank branches', NULL, '2017-10-27 14:46:06', '2017-10-27 14:46:06'),
(226, '2017-10-27', 'HR', 'view', 'Bank Branch', NULL, 'view bank branches', NULL, '2017-10-27 14:46:22', '2017-10-27 14:46:22'),
(227, '2017-10-27', 'HR', 'view', 'Employee Type', NULL, 'viewed employee types', NULL, '2017-10-27 14:46:34', '2017-10-27 14:46:34'),
(228, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 14:51:50', '2017-10-27 14:51:50'),
(229, '2017-10-27', 'HR', 'view', 'Employee Type', NULL, 'viewed employee types', NULL, '2017-10-27 14:52:06', '2017-10-27 14:52:06'),
(230, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 14:52:37', '2017-10-27 14:52:37'),
(231, '2017-10-27', 'HR', 'view', 'Employee Type', NULL, 'viewed employee types', NULL, '2017-10-27 14:54:18', '2017-10-27 14:54:18'),
(232, '2017-10-27', 'HR', 'view', 'Employee Type', NULL, 'viewed employee types', NULL, '2017-10-27 14:54:22', '2017-10-27 14:54:22'),
(233, '2017-10-27', 'HR', 'view', 'Job Group', NULL, 'viewed job groups', NULL, '2017-10-27 14:57:16', '2017-10-27 14:57:16'),
(234, '2017-10-27', 'HR', 'view', 'Job Group', NULL, 'viewed job groups', NULL, '2017-10-27 14:58:58', '2017-10-27 14:58:58'),
(235, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 15:03:16', '2017-10-27 15:03:16'),
(236, '2017-10-27', 'HR', 'view', 'Job Group', NULL, 'viewed job groups', NULL, '2017-10-27 15:03:20', '2017-10-27 15:03:20'),
(237, '2017-10-27', 'HR', 'view', 'Job Group', NULL, 'viewed job groups', NULL, '2017-10-27 15:03:45', '2017-10-27 15:03:45'),
(238, '2017-10-27', 'HR', 'view', 'Job Group', NULL, 'viewed job groups', NULL, '2017-10-27 15:03:50', '2017-10-27 15:03:50'),
(239, '2017-10-27', 'HR', 'view', 'Job Group', NULL, 'viewed job groups', NULL, '2017-10-27 15:03:50', '2017-10-27 15:03:50'),
(240, '2017-10-27', 'HR', 'view', 'Occurencesettings', NULL, 'viewed occurence settings', NULL, '2017-10-27 15:04:00', '2017-10-27 15:04:00'),
(241, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 15:10:03', '2017-10-27 15:10:03'),
(242, '2017-10-27', 'HR', 'view', 'Occurencesettings', NULL, 'viewed occurence settings', NULL, '2017-10-27 15:10:11', '2017-10-27 15:10:11'),
(243, '2017-10-27', 'HR', 'view', 'Occurencesettings', NULL, 'viewed occurence settings', NULL, '2017-10-27 15:14:00', '2017-10-27 15:14:00'),
(244, '2017-10-27', 'HR', 'view', 'Occurencesettings', NULL, 'viewed occurence settings', NULL, '2017-10-27 15:14:18', '2017-10-27 15:14:18'),
(245, '2017-10-27', 'HR', 'view', 'Citizenships', NULL, 'viewed citizenships', NULL, '2017-10-27 15:15:42', '2017-10-27 15:15:42'),
(246, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 15:16:48', '2017-10-27 15:16:48'),
(247, '2017-10-27', 'HR', 'view', 'Occurencesettings', NULL, 'viewed occurrence settings', NULL, '2017-10-27 15:19:48', '2017-10-27 15:19:48'),
(248, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 15:20:04', '2017-10-27 15:20:04'),
(249, '2017-10-27', 'HR', 'view', 'Citizenships', NULL, 'viewed citizenships', NULL, '2017-10-27 15:20:14', '2017-10-27 15:20:14'),
(250, '2017-10-27', 'HR', 'view', 'Citizenships', NULL, 'viewed citizenships', NULL, '2017-10-27 15:20:19', '2017-10-27 15:20:19'),
(251, '2017-10-27', 'HR', 'view', 'Citizenships', NULL, 'viewed citizenships', NULL, '2017-10-27 15:20:35', '2017-10-27 15:20:35'),
(252, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 15:20:44', '2017-10-27 15:20:44'),
(253, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 15:26:52', '2017-10-27 15:26:52'),
(254, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 15:27:00', '2017-10-27 15:27:00'),
(255, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 15:27:35', '2017-10-27 15:27:35'),
(256, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 15:29:25', '2017-10-27 15:29:25'),
(257, '2017-10-27', 'HR', 'view', 'Education', NULL, 'viewed educations', NULL, '2017-10-27 15:29:32', '2017-10-27 15:29:32'),
(258, '2017-10-27', 'HR', 'view', 'Appraisalcategories', NULL, 'viewed appraisal categories', NULL, '2017-10-27 15:29:45', '2017-10-27 15:29:45'),
(259, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 15:35:16', '2017-10-27 15:35:16'),
(260, '2017-10-27', 'HR', 'view', 'Appraisalcategories', NULL, 'viewed appraisal categories', NULL, '2017-10-27 15:35:27', '2017-10-27 15:35:27'),
(261, '2017-10-27', 'HR', 'view', 'Appraisal Settings', NULL, 'viewed appraisal settings', NULL, '2017-10-27 15:36:12', '2017-10-27 15:36:12'),
(262, '2017-10-27', 'HR', 'view', 'Appraisalcategories', NULL, 'viewed appraisal categories', NULL, '2017-10-27 15:36:27', '2017-10-27 15:36:27'),
(263, '2017-10-27', 'HR', 'view', 'Appraisal Settings', NULL, 'viewed appraisal settings', NULL, '2017-10-27 15:40:24', '2017-10-27 15:40:24'),
(264, '2017-10-27', 'HR', 'view', 'Appraisal Settings', NULL, 'viewed appraisal settings', NULL, '2017-10-27 15:45:05', '2017-10-27 15:45:05'),
(265, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 15:50:22', '2017-10-27 15:50:22'),
(266, '2017-10-27', 'HR', 'view', 'Appraisal Settings', NULL, 'viewed appraisal settings', NULL, '2017-10-27 15:50:37', '2017-10-27 15:50:37'),
(267, '2017-10-27', 'HR', 'view', 'Appraisal Settings', NULL, 'viewed appraisal settings', NULL, '2017-10-27 15:51:11', '2017-10-27 15:51:11'),
(268, '2017-10-27', 'HR', 'view', 'Leave Type', NULL, 'viewed leave types', NULL, '2017-10-27 15:51:25', '2017-10-27 15:51:25'),
(269, '2017-10-27', 'HR', 'view', 'Leave Type', NULL, 'viewed leave types', NULL, '2017-10-27 15:58:19', '2017-10-27 15:58:19'),
(270, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 15:58:49', '2017-10-27 15:58:49'),
(271, '2017-10-27', 'HR', 'view', 'Leave Type', NULL, 'viewed leave types', NULL, '2017-10-27 15:59:21', '2017-10-27 15:59:21'),
(272, '2017-10-27', 'HR', 'view', 'Leave Type', NULL, 'viewed leave types', NULL, '2017-10-27 15:59:27', '2017-10-27 15:59:27'),
(273, '2017-10-27', 'HR', 'view', 'Holiday', NULL, 'viewed holidays', NULL, '2017-10-27 15:59:40', '2017-10-27 15:59:40'),
(274, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 16:06:50', '2017-10-27 16:06:50'),
(275, '2017-10-27', 'HR', 'view', 'Holiday', NULL, 'viewed holidays', NULL, '2017-10-27 16:07:11', '2017-10-27 16:07:11'),
(276, '2017-10-27', 'HR', 'view', 'Holiday', NULL, 'viewed holidays', NULL, '2017-10-27 16:09:18', '2017-10-27 16:09:18'),
(277, '2017-10-27', 'HR', 'create', 'Holiday', NULL, 'created holiday Chrismas', NULL, '2017-10-27 16:09:35', '2017-10-27 16:09:35'),
(278, '2017-10-27', 'HR', 'view', 'Holiday', NULL, 'viewed holidays', NULL, '2017-10-27 16:09:35', '2017-10-27 16:09:35'),
(279, '2017-10-27', 'HR', 'update', 'Holiday', NULL, 'updated holiday Chrismas', NULL, '2017-10-27 16:09:43', '2017-10-27 16:09:43'),
(280, '2017-10-27', 'HR', 'view', 'Holiday', NULL, 'viewed holidays', NULL, '2017-10-27 16:09:43', '2017-10-27 16:09:43'),
(281, '2017-10-27', 'HR', 'update', 'Holiday', NULL, 'updated holiday Chrismas', NULL, '2017-10-27 16:10:15', '2017-10-27 16:10:15'),
(282, '2017-10-27', 'HR', 'view', 'Holiday', NULL, 'viewed holidays', NULL, '2017-10-27 16:10:15', '2017-10-27 16:10:15'),
(283, '2017-10-27', 'HR', 'view', 'Accounts', NULL, 'view chart of accounts', NULL, '2017-10-27 16:10:33', '2017-10-27 16:10:33'),
(284, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 16:14:20', '2017-10-27 16:14:20'),
(285, '2017-10-27', 'HR', 'view', 'Accounts', NULL, 'view chart of accounts', NULL, '2017-10-27 16:14:26', '2017-10-27 16:14:26'),
(286, '2017-10-27', 'HR', 'view', 'Accounts', NULL, 'view chart of accounts', NULL, '2017-10-27 16:16:31', '2017-10-27 16:16:31'),
(287, '2017-10-27', 'HR', 'view', 'Accounts', NULL, 'view chart of accounts', NULL, '2017-10-27 16:16:37', '2017-10-27 16:16:37'),
(288, '2017-10-27', 'HR', 'view', 'Allowance', NULL, 'viewed allowances', NULL, '2017-10-27 16:16:50', '2017-10-27 16:16:50'),
(289, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 16:24:21', '2017-10-27 16:24:21'),
(290, '2017-10-27', 'HR', 'view', 'Allowance', NULL, 'viewed allowances', NULL, '2017-10-27 16:24:36', '2017-10-27 16:24:36'),
(291, '2017-10-27', 'HR', 'view', 'Allowance', NULL, 'viewed allowances', NULL, '2017-10-27 16:24:46', '2017-10-27 16:24:46'),
(292, '2017-10-27', 'HR', 'view', 'Allowance', NULL, 'viewed allowances', NULL, '2017-10-27 16:24:58', '2017-10-27 16:24:58'),
(293, '2017-10-27', 'HR', 'view', 'Relief', NULL, 'viewed reliefs', NULL, '2017-10-27 16:25:10', '2017-10-27 16:25:10'),
(294, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 16:33:33', '2017-10-27 16:33:33'),
(295, '2017-10-27', 'HR', 'view', 'Relief', NULL, 'viewed reliefs', NULL, '2017-10-27 16:33:44', '2017-10-27 16:33:44'),
(296, '2017-10-27', 'HR', 'view', 'Deductions', NULL, 'viewed deduction list ', NULL, '2017-10-27 16:35:07', '2017-10-27 16:35:07'),
(297, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 16:45:19', '2017-10-27 16:45:19'),
(298, '2017-10-27', 'HR', 'view', 'Deductions', NULL, 'viewed deduction list ', NULL, '2017-10-27 16:45:32', '2017-10-27 16:45:32'),
(299, '2017-10-27', 'HR', 'view', 'Deductions', NULL, 'viewed deduction list ', NULL, '2017-10-27 16:47:17', '2017-10-27 16:47:17'),
(300, '2017-10-27', 'HR', 'view', 'Deductions', NULL, 'viewed deduction list ', NULL, '2017-10-27 16:47:26', '2017-10-27 16:47:26'),
(301, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 16:54:39', '2017-10-27 16:54:39'),
(302, '2017-10-27', 'HR', 'view', 'NHIF Rates', NULL, 'viewed NHIF Rates ', NULL, '2017-10-27 16:55:24', '2017-10-27 16:55:24'),
(303, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 16:59:16', '2017-10-27 16:59:16'),
(304, '2017-10-27', 'HR', 'view', 'NHIF Rates', NULL, 'viewed NHIF Rates ', NULL, '2017-10-27 16:59:31', '2017-10-27 16:59:31'),
(305, '2017-10-27', 'HR', 'view', 'NHIF Rates', NULL, 'viewed NHIF Rates ', NULL, '2017-10-27 17:06:18', '2017-10-27 17:06:18'),
(306, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 17:08:16', '2017-10-27 17:08:16'),
(307, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 17:08:43', '2017-10-27 17:08:43'),
(308, '2017-10-27', 'HR', 'view', 'EarningSettings', NULL, 'viewed allowances', NULL, '2017-10-27 17:09:01', '2017-10-27 17:09:01'),
(309, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 17:09:10', '2017-10-27 17:09:10'),
(310, '2017-10-27', 'HR', 'view', 'Roles', NULL, 'viewed system roles', NULL, '2017-10-27 17:10:38', '2017-10-27 17:10:38'),
(311, '2017-10-27', 'HR', 'view', 'EarningSettings', NULL, 'viewed allowances', NULL, '2017-10-27 17:11:41', '2017-10-27 17:11:41'),
(312, '2017-10-27', 'HR', 'create', 'EarningSettings', NULL, 'created: Commission', NULL, '2017-10-27 17:12:03', '2017-10-27 17:12:03'),
(313, '2017-10-27', 'HR', 'view', 'EarningSettings', NULL, 'viewed allowances', NULL, '2017-10-27 17:12:04', '2017-10-27 17:12:04'),
(314, '2017-10-27', 'HR', 'update', 'EarningSettings', NULL, 'updated: Commission1', NULL, '2017-10-27 17:12:44', '2017-10-27 17:12:44'),
(315, '2017-10-27', 'HR', 'view', 'EarningSettings', NULL, 'viewed allowances', NULL, '2017-10-27 17:12:44', '2017-10-27 17:12:44'),
(316, '2017-10-27', 'HR', 'delete', 'EarningSettings', NULL, 'deleted: Commission1', NULL, '2017-10-27 17:12:53', '2017-10-27 17:12:53'),
(317, '2017-10-27', 'HR', 'view', 'EarningSettings', NULL, 'viewed allowances', NULL, '2017-10-27 17:12:53', '2017-10-27 17:12:53'),
(318, '2017-10-27', 'HR', 'create', 'EarningSettings', NULL, 'created: Commission', NULL, '2017-10-27 17:13:01', '2017-10-27 17:13:01'),
(319, '2017-10-27', 'HR', 'view', 'EarningSettings', NULL, 'viewed allowances', NULL, '2017-10-27 17:13:01', '2017-10-27 17:13:01'),
(320, '2017-10-27', 'HR', 'view', 'EarningSettings', NULL, 'viewed allowances', NULL, '2017-10-27 17:13:29', '2017-10-27 17:13:29'),
(321, '2017-10-27', 'HR', 'view', 'EarningSettings', NULL, 'viewed allowances', NULL, '2017-10-27 17:15:01', '2017-10-27 17:15:01'),
(322, '2017-10-27', 'HR', 'view', 'EarningSettings', NULL, 'viewed allowances', NULL, '2017-10-27 17:15:06', '2017-10-27 17:15:06'),
(323, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 17:23:05', '2017-10-27 17:23:05'),
(324, '2017-10-27', 'HR', 'view', 'Nontaxables', NULL, 'viewed non taxable income list ', NULL, '2017-10-27 17:23:12', '2017-10-27 17:23:12'),
(325, '2017-10-27', 'HR', 'create', 'Nontaxables', NULL, 'created: Refunds', NULL, '2017-10-27 17:23:19', '2017-10-27 17:23:19'),
(326, '2017-10-27', 'HR', 'view', 'Nontaxables', NULL, 'viewed non taxable income list ', NULL, '2017-10-27 17:23:20', '2017-10-27 17:23:20'),
(327, '2017-10-27', 'HR', 'create', 'Nontaxables', NULL, 'created: bla', NULL, '2017-10-27 17:23:25', '2017-10-27 17:23:25'),
(328, '2017-10-27', 'HR', 'view', 'Nontaxables', NULL, 'viewed non taxable income list ', NULL, '2017-10-27 17:23:26', '2017-10-27 17:23:26'),
(329, '2017-10-27', 'HR', 'update', 'Nontaxable', NULL, 'updated: bla1', NULL, '2017-10-27 17:23:39', '2017-10-27 17:23:39'),
(330, '2017-10-27', 'HR', 'view', 'Nontaxables', NULL, 'viewed non taxable income list ', NULL, '2017-10-27 17:23:39', '2017-10-27 17:23:39'),
(331, '2017-10-27', 'HR', 'view', 'Nontaxables', NULL, 'viewed non taxable income list ', NULL, '2017-10-27 17:24:50', '2017-10-27 17:24:50'),
(332, '2017-10-27', 'HR', 'delete', 'Nontaxables', NULL, 'deleted: bla1', NULL, '2017-10-27 17:24:56', '2017-10-27 17:24:56'),
(333, '2017-10-27', 'HR', 'view', 'Nontaxables', NULL, 'viewed non taxable income list ', NULL, '2017-10-27 17:24:56', '2017-10-27 17:24:56'),
(334, '2017-10-27', 'HR', 'view', 'Nontaxables', NULL, 'viewed non taxable income list ', NULL, '2017-10-27 17:40:27', '2017-10-27 17:40:27'),
(335, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 17:52:03', '2017-10-27 17:52:03'),
(336, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 17:52:11', '2017-10-27 17:52:11'),
(337, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 17:52:27', '2017-10-27 17:52:27'),
(338, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 17:52:34', '2017-10-27 17:52:34'),
(339, '2017-10-27', 'HR', 'deactivate', 'Employee', NULL, 'deactivated employee PL.2-Test Test', NULL, '2017-10-27 17:52:42', '2017-10-27 17:52:42'),
(340, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 17:52:42', '2017-10-27 17:52:42'),
(341, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 17:53:01', '2017-10-27 17:53:01'),
(342, '2017-10-27', 'HR', 'activate', 'Employee', NULL, 'activated employee PL.2-Test Test', NULL, '2017-10-27 17:53:28', '2017-10-27 17:53:28'),
(343, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 17:57:18', '2017-10-27 17:57:18'),
(344, '2017-10-27', 'HR', 'view', 'Employees', NULL, 'viewed employee list', NULL, '2017-10-27 17:57:40', '2017-10-27 17:57:40'),
(345, '2017-10-27', 'HR', 'view', 'Employee', NULL, 'viewed employee NSL.1-Xavier Ikachai', NULL, '2017-10-27 17:57:49', '2017-10-27 17:57:49'),
(346, '2017-10-27', 'HR', 'view', 'Appraisals', NULL, 'viewed appraisals', NULL, '2017-10-27 17:58:14', '2017-10-27 17:58:14'),
(347, '2017-10-27', 'HR', 'view', 'Appraisals', NULL, 'viewed appraisals', NULL, '2017-10-27 17:59:00', '2017-10-27 17:59:00'),
(348, '2017-10-27', 'HR', 'view', 'Appraisals', NULL, 'viewed appraisals', NULL, '2017-10-27 18:01:36', '2017-10-27 18:01:36'),
(349, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 18:08:11', '2017-10-27 18:08:11'),
(350, '2017-10-27', 'HR', 'view', 'Appraisals', NULL, 'viewed appraisals', NULL, '2017-10-27 18:08:17', '2017-10-27 18:08:17'),
(351, '2017-10-27', 'HR', 'view', 'Occurences', NULL, 'viewed occurences', NULL, '2017-10-27 18:08:40', '2017-10-27 18:08:40'),
(352, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 18:13:40', '2017-10-27 18:13:40'),
(353, '2017-10-27', 'HR', 'view', 'Occurrences', NULL, 'viewed occurrences', NULL, '2017-10-27 18:13:49', '2017-10-27 18:13:49'),
(354, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 18:17:59', '2017-10-27 18:17:59'),
(355, '2017-10-27', 'HR', 'view', 'Properties', NULL, 'viewed company properties', NULL, '2017-10-27 18:18:05', '2017-10-27 18:18:05'),
(356, '2017-10-27', 'HR', 'view', 'Properties', NULL, 'viewed company properties', NULL, '2017-10-27 18:18:05', '2017-10-27 18:18:05'),
(357, '2017-10-27', 'HR', 'view', 'Leave Type', NULL, 'viewed leave types', NULL, '2017-10-27 18:37:31', '2017-10-27 18:37:31'),
(358, '2017-10-27', 'HR', 'view', 'Holiday', NULL, 'viewed holidays', NULL, '2017-10-27 18:37:35', '2017-10-27 18:37:35');
INSERT INTO `audits` (`id`, `date`, `user`, `action`, `entity`, `amount`, `description`, `organization_id`, `created_at`, `updated_at`) VALUES
(359, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 18:39:17', '2017-10-27 18:39:17'),
(360, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 18:39:56', '2017-10-27 18:39:56'),
(361, '2017-10-27', 'HR', 'view', 'Appraisals', NULL, 'viewed appraisals', NULL, '2017-10-27 18:40:07', '2017-10-27 18:40:07'),
(362, '2017-10-27', 'HR', 'update', 'Roles', NULL, 'updated role superadmin', NULL, '2017-10-27 18:40:33', '2017-10-27 18:40:33'),
(363, '2017-10-27', 'HR', 'cancel', 'Vacation Application', NULL, 'cancelled vacation application for employee NSL.1 : Xavier Ikachai vacation type Maternity for period from 2017-10-26 to 2018-03-02 (92)', NULL, '2017-10-27 18:48:05', '2017-10-27 18:48:05'),
(364, '2017-10-27', 'HR', 'update', 'Vacation Application', NULL, 'updated vacation application for employee NSL.1 : Xavier Ikachai vacation type Day off for period from 2017-03-21 to 2017-03-21 (1)', NULL, '2017-10-27 18:53:12', '2017-10-27 18:53:12'),
(365, '2017-10-27', 'HR', 'approve', 'Vacation Application', NULL, 'approved vacation application for employee NSL.1 : Xavier Ikachai vacation type Paternity for period from 2017-05-25 to 2017-06-05 (8)', NULL, '2017-10-27 18:53:35', '2017-10-27 18:53:35'),
(366, '2017-10-27', 'HR', 'reject', 'Vacation Application', NULL, 'rejected vacation application for employee NSL.1 : Xavier Ikachai vacation type Maternity for period from 2017-10-26 to 2018-03-02 (92)', NULL, '2017-10-27 18:53:46', '2017-10-27 18:53:46'),
(367, '2017-10-27', 'HR', 'cancel', 'Vacation Application', NULL, 'cancelled vacation application for employee NSL.1 : Xavier Ikachai vacation type Paternity for period from 2017-05-25 to 2017-06-05 (8)', NULL, '2017-10-27 18:54:08', '2017-10-27 18:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(10) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bank_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `bank_name`, `bank_code`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'AFRICAN BANKING CORPORATION', '35', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(2, 'BANK OF AFRICA (K) LTD. ', '19', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(3, 'BANK OF BARODA (K) LTD. ', '6', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(4, 'BANK OF INDIA', '5', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(5, 'BARCLAYS BANK OF (K) LTD. ', '3', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(6, 'CENTRAL BANK OF KENYA', '9', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(7, 'CFCSTANBIC BANK KENYA LTD. ', '31', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(8, 'CHASE BANK LTD. ', '30', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(9, 'CITIBANK', '16', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(10, 'COMMERCIAL BANK OF AFRICA LTD. ', '7', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(11, 'CONSOLIDATED BANK OF (K) LTD. ', '23', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(12, 'CO-OP BANK OF (K) LTD. ', '11', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(13, 'CREDIT BANK LTD. ', '25', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(14, 'DEVELOPMENT BANK (K) LTD. ', '59', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(15, 'DIAMOND TRUST BANK LTD. ', '63', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(16, 'DUBAI BANK LTD. ', '20', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(17, 'ECOBANK LTD. ', '43', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(18, 'EQUATORAL COMMERCIAL BANK LTD. ', '49', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(19, 'EQUITY BANK LTD. ', '68', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(20, 'FAMILY BANK LTD. ', '70', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(21, 'FAULU KENYA', '0', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(22, 'FINA BANK LTD. ', '0', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(23, 'FIRST COMMUNITY BANK LTD. ', '74', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(24, 'GIRO COMMERCIAL BANK LTD. ', '42', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(25, 'GUARDIAN BANK LTD. ', '55', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(26, 'GUARANTY TRUST BANK (KENYA) LTD.', '53', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(27, 'GULF AFRICAN BANK', '72', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(28, 'HABIB BANK A.G. ZURICH', '17', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(29, 'HABIB BANK LTD. ', '8', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(30, 'HOUSING FINANCE. ', '61', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(31, 'I&M BANK LTD. ', '57', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(32, 'IMPERIAL BANK LTD. ', '39', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(33, 'JAMII BORA BANK LTD. ', '51', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(34, 'KENYA COMMERCIALIAL BANK LTD. ', '1', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(35, 'KENYA WOMEN MICROFINANCE BANK LTD.', '0', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(36, 'K-REP BANK LTD. ', '66', 1, '2017-04-21 18:12:43', '2017-04-21 18:12:43'),
(37, 'MIDDLE EAST BANK (K) LTD. ', '18', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(38, 'NATIONAL BANK  ', '12', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(39, 'NIC BANK LTD. ', '41', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(40, 'ORIENTAL COMMERCIAL BANK LTD. ', '14', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(41, 'PARAMAOUNT UNIVERSAL BANK LTD. ', '50', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(42, 'PRIME BANK LTD. ', '10', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(43, 'POST BANK.', '0', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(44, 'STANDARD CHARTERED BANK (K) LTD. ', '2', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(45, 'TRANS-NATIONAL BANK LTD. ', '26', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(46, 'UBA BANK', '76', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(47, 'VICTORIA COMMERCIAL BANK LTD. ', '54', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(48, ' FIDELITY COMMERCIAL BANK ', '60', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44'),
(49, ' CHARTERHOUSE BANK LTD ', '64', 1, '2017-04-21 18:12:44', '2017-04-21 18:12:44');

-- --------------------------------------------------------

--
-- Table structure for table `bank_branches`
--

CREATE TABLE `bank_branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_branch_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bank_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bank_branches`
--

INSERT INTO `bank_branches` (`id`, `branch_code`, `bank_branch_name`, `bank_id`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, '0', 'Head Office/koinange St. ', '1', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(2, '1', 'Westlands', '1', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(3, '2', 'Industrial Area Branch ', '1', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(4, '3', 'Nkrumah Road Branch/mombasa', '1', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(5, '4', 'Kisumu Branch ', '1', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(6, '5', 'Eldoret Branch', '1', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(7, '6', 'Meru Branch ', '1', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(8, '7', 'Libra House ', '1', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(9, '8', 'Nakuru', '1', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(10, '9', 'Lamu', '1', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(11, '0', 'Reinsurance Plaza Nairobi', '2', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(12, '1', 'Mombasa', '2', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(13, '2', 'Westlands', '2', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(14, '3', 'Uhuru Highway', '2', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(15, '4', 'River Road', '2', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(16, '5', 'Thika ', '2', 1, '2017-04-21 18:21:45', '2017-04-21 18:21:45'),
(17, '6', 'Kisumu ', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(18, '7', 'Ruaraka ', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(19, '8', 'Monrovia Street ', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(20, '9', 'Nakuru ', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(21, '10', 'Ngong Road ', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(22, '11', 'Eldoret ', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(23, '12', 'Embakasi ', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(24, '13', 'Kericho ', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(25, '14', 'Ongata Rongai', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(26, '15', 'Changamwe', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(27, '16', 'Bungoma', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(28, '17', 'KISII', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(29, '18', 'MERU', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(30, '19', 'Kitengela', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(31, '20', 'Nyali', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(32, '21', 'Galleria', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(33, '22', 'Greenspan Mall', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(34, '23', 'Upper Hilll', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(35, '24', 'Nanyuki', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(36, '25', 'Lunga Lunga Road', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(37, '26', 'Kenyatta Avenue', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(38, '27', 'Sameer Business Park', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(39, '28', 'Moi Avenue, Mombasa', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(40, '29', 'Ongata Rongai II', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(41, '30', 'Gikomba', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(42, '31', 'Githurai', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(43, '32', 'Embu', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(44, '33', 'Gateway Mall', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(45, '34', 'Kitale', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(46, '35', 'South B', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(47, '36', 'Digo Road', '2', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(48, '0', 'Nairobi Main', '3', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(49, '2', 'Digo Road, Mombasa', '3', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(50, '4', 'Thika', '3', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(51, '5', 'Kisumu ', '3', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(52, '6', 'Sarit Centre ', '3', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(53, '7', 'Industrial Area', '3', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(54, '8', 'Eldoret', '3', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(55, '9', 'Nakuru', '3', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(56, '10', 'Kakamega', '3', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(57, '11', 'Nyali Mombasa', '3', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(58, '0', 'Kenyatta Avenue , Nairobi ', '4', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(59, '1', 'Nkrumah Road , Mombasa ', '4', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(60, '2', 'Industrial Area ', '4', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(61, '3', 'Westlands ', '4', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(62, '4', 'Kisumu', '4', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(63, '5', 'Eldoret', '4', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(64, '1', 'Head Office - Vpc ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(65, '2', 'Kapsabet Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(66, '3', 'Eldoret Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(67, '4', 'Embu Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(68, '5', 'Murang A Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(69, '6', 'Kapenguria Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(70, '7', 'Kericho Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(71, '8', 'Kisii Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(72, '9', 'Kisumu Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(73, '10', 'South C Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(74, '11', 'Limuru Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(75, '12', 'Malindi Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(76, '13', 'Meru Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(77, '14', 'Eastleigh Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(78, '15', 'Kitui Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(79, '16', 'Nkrumah Road Branch ', '5', 1, '2017-04-21 18:21:46', '2017-04-21 18:21:46'),
(80, '17', 'Garissa Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(81, '18', 'Nyamira Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(82, '19', 'Kilifi Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(83, '20', 'Office Park Westlands ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(84, '21', 'Barclaycard Operations ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(85, '22', 'Paymants And International Services ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(86, '23', 'Gilgil Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(87, '24', 'Thika Road Mall', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(88, '26', 'Kakamega Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(89, '27', 'Nakuru East ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(90, '28', 'Buruburu ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(91, '29', 'Bomet ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(92, '30', 'Nyeri Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(93, '31', 'Thika Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(94, '32', 'Port Mombasa ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(95, '33', 'Gikomba ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(96, '34', 'Kawangware ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(97, '35', 'Mbale ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(98, '36', 'Plaza Premier Centre ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(99, '37', 'River Road Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(100, '38', 'Chomba House-river Road ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(101, '39', 'Mumias Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(102, '40', 'Machakos Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(103, '41', 'Narok Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(104, '42', 'Isiolo Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(105, '43', 'Ngong Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(106, '44', 'Maua Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(107, '45', 'Hurlingham Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(108, '46', 'Makupa Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(109, '47', 'Development House Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(110, '48', 'Bungoma ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(111, '49', 'Lavington Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(112, '50', 'Tala ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(113, '51', 'Homa Bay Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(114, '52', 'Ongata Rongai Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(115, '53', 'Othaya Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(116, '54', 'Voi Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(117, '55', 'Muthaiga Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(118, '56', 'Barclays Advisory And Reg. Services ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(119, '57', 'Githunguri Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(120, '58', 'Webuye Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(121, '59', 'Kasarani Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(122, '60', 'Chuka Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(123, '61', 'Nakumatt-westgate Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(124, '62', 'Kabarnet Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(125, '63', 'Kerugoya Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(126, '64', 'Taveta Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(127, '65', 'Karen Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(128, '66', 'Wundanyi Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(129, '67', 'Ruaraka Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(130, '68', 'Pamoja Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(131, '69', 'Wote Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(132, '70', 'Enterprise Road Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(133, '71', 'Nakumatt Meru Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(134, '72', 'Juja Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(135, '73', 'Westlands Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(136, '74', 'Kikuyu Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(137, '75', 'Moi Avenue-nairobi Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(138, '76', 'Kenyatta Avenue ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(139, '77', 'Barcalys Plaza Corporate Service Centre ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(140, '78', 'Kiriaini Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(141, '79', 'Butere Road Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(142, '80', 'Migori Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(143, '81', 'Digo Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(144, '82', 'Haile Selassie Avenue Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(145, '83', 'Nairobi University Branch ', '5', 1, '2017-04-21 18:21:47', '2017-04-21 18:21:47'),
(146, '84', 'Bunyala Road ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(147, '86', 'Nairobi West Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(148, '87', 'Parklands ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(149, '88', 'Busia ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(150, '89', 'Pangani Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(151, '90', 'Abc Premier Life Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(152, '93', 'Kariobangi Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(153, '94', 'Queensway House Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(154, '95', 'Nakumatt Embakasi Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(155, '96', 'Barclays Merchant Finance Ltd. ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(156, '97', 'Barclays Securities Services (k ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(157, '100', 'Diani Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(158, '103', 'Nairobi J.k.i.a Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(159, '105', 'Village Market - Premier Life Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(160, '106', 'Sarit Centre - Premier Life Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(161, '109', 'Yaya Centre- Premier Life Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(162, '111', 'Naivasha Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(163, '113', 'Market Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(164, '114', 'Changamwe Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(165, '117', 'Rahimtulla Trust Towers - Premier Life Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(166, '125', 'Nakuru West Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(167, '128', 'Bamburi Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(168, '130', 'Harambee Ave - Premier Life Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(169, '132', 'Kitale Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(170, '139', 'Nyahururu Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(171, '144', 'Treasury Operations', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(172, '145', 'Moi Avenue Mombasa -  Premier Life Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(173, '151', 'Cash Monitoring Unit ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(174, '190', 'Nanyuki Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(175, '206', 'Karatina Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(176, '220', 'Mombasa Nyerere Ave -  Premier Life Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(177, '273', 'Consumer Operations ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(178, '300', 'Finance Department ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(179, '337', 'Documents And Securities  Dsc ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(180, '340', 'Retail Credit Team ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(181, '354', 'Credit Operations ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(182, '400', 'Head office', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(183, '138', 'Malindi -  Premier Life Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(184, '139', 'Nyahururu Branch ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(185, '142', 'Nakuru West - Premier Life Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(186, '144', 'Treasury Operations', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(187, '145', 'Moi Avenue Mombasa -  Premier Life Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(188, '146', 'Karen -  Premier Life Center ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(189, '148', 'Muthaiga Premier ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(190, '151', 'Cash Monitoring Unit ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(191, '156', 'Nakuru Local Business Club ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(192, '158', 'Queensway Business Suite ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(193, '159', 'Digo Prestige ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(194, '162', 'Nkrumah Road Corporate Service Centre ', '5', 1, '2017-04-21 18:21:48', '2017-04-21 18:21:48'),
(195, '165', 'Queensway Premier ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(196, '179', 'Westgate Premier ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(197, '190', 'Nanyuki Branch ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(198, '206', 'Karatina Branch ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(199, '208', 'Plaza Premier Life Centre ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(200, '220', 'Mombasa Nyerere Ave -  Premier Life Centre ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(201, '273', 'Consumer Operations ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(202, '287', 'Corporate Credit Team ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(203, '290', 'Barclays Business Support  Bbs ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(204, '300', 'Finance Department ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(205, '323', 'Tba ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(206, '337', 'Documents And Securities  Dsc ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(207, '340', 'Retail Credit Team ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(208, '354', 'Credit Operations ', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(209, '400', 'Head office', '5', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(210, '0', 'Head Office ', '6', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(211, '1', 'Head Office ', '6', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(212, '2', 'Mombasa ', '6', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(213, '3', 'Kisumu ', '6', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(214, '4', 'Eldoret ', '6', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(215, '0', 'CFC Stanbic Head Office', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(216, '2', 'Kenyatta Ave ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(217, '3', 'Digo road', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(218, '4', 'Waiyaki Way ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(219, '5', 'Industrial Area ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(220, '6', 'Harambee Avenue ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(221, '7', 'Chiromo Road ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(222, '8', 'International House ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(223, '10', 'Upper Hill ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(224, '11', 'Naivasha ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(225, '12', 'Wesgate ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(226, '13', 'Kisumu ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(227, '14', 'Nakuru ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(228, '15', 'Thika ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(229, '17', 'Nanyuki ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(230, '18', 'Meru', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(231, '19', 'Buruburu', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(232, '20', 'Gikomba', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(233, '21', 'Garden city', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(234, '22', 'ELDORET', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(235, '23', 'KAREN', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(236, '24', 'Kisii', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(237, '25', 'Warwick', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(238, '26', 'Private Clients', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(239, '27', 'Nyali', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(240, '28', 'Malindi', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(241, '999', 'Central Processing H/o ', '7', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(242, '0', 'Head Office', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(243, '1', 'City Centre Branch', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(244, '3', 'Village Market ', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(245, '4', 'Mombasa Moi Avenue', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(246, '5', 'Hurlingham ', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(247, '6', 'Eastleigh ', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(248, '7', 'Parklands ', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(249, '8', 'Riverside Mews ', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(250, '10', 'Thika ', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(251, '11', 'Nakuru ', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(252, '12', 'Donholm ', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(253, '13', 'Bondeni Chase Iman ', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(254, '14', 'Ngara Mini ', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(255, '15', 'Kisumu ', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(256, '16', 'Eldoret', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(257, '17', 'Diamond Plaza', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(258, '18', 'Windsor', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(259, '19', 'Malindi', '8', 1, '2017-04-21 18:21:49', '2017-04-21 18:21:49'),
(260, '20', 'Embakasi', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(261, '21', 'Upper Hill', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(262, '22', 'Nyali', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(263, '23', 'Buru Buru', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(264, '24', 'Strathmore', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(265, '25', 'Kisii', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(266, '26', 'Virtual ', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(267, '27', 'Rafiki DTM Clearing Center', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(268, '28', 'Chase Xpress - Ngong Road', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(269, '29', 'Chase Elite ABC Place', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(270, '30', 'Sameer Business Park', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(271, '31', 'Mtwapa', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(272, '32', 'Ongata Rongai ', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(273, '33', 'Westlands', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(274, '34', 'Machakos', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(275, '35', 'Mombasa Old Town', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(276, '36', 'River Road', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(277, '37', 'Lunga Lunga', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(278, '38', 'Chase Xpress Dagoretti Corner', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(279, '39', 'Chase Xpress Madaraka Corner', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(280, '40', 'Kitale', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(281, '41', 'Kimathi', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(282, '42', 'Narok', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(283, '43', 'SACCO Processing Centre', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(284, '44', 'Garissa', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(285, '45', 'KPA', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(286, '46', 'Lavington', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(287, '47', 'Kericho', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(288, '48', 'Karen', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(289, '49', 'Kilimani', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(290, '50', 'Kasuku Centre', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(291, '51', 'Kilifi', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(292, '52', 'Kisumu Naivas', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(293, '53', 'Ruaka', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(294, '54', 'Garden City', '8', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(295, '0', 'Head Office , Nairobi ', '9', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(296, '400', 'Mombasa ', '9', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(297, '500', 'Gigiri Agency ', '9', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(298, '700', 'Kisumu ', '9', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(299, '0', 'Head Office', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(300, '1', 'Upper Hill', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(301, '2', 'Wabera Street', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(302, '3', 'Mama Ngina', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(303, '4', 'Westlands Branch', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(304, '5', 'Industrial Area ', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(305, '6', 'Mamlaka', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(306, '7', 'Village Market', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(307, '8', 'Cargo Centre', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(308, '9', 'Park Side', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(309, '16', 'Galleria Mall ', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(310, '17', 'Junction', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(311, '18', 'Thika Road Mall', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(312, '19', 'Greenspan Mall', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(313, '20', 'Moi Avenue Mombasa ', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(314, '21', 'Meru', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(315, '22', 'Nakuru', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(316, '23', 'Bamburi', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(317, '24', 'Diani', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(318, '25', 'Changamwe', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(319, '26', 'Eldoret', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(320, '27', 'Kisumu', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(321, '28', 'Thika', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(322, '29', 'Nanyuki', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(323, '30', 'Yaya Centre', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(324, '31', 'Lavington', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(325, '32', 'Machakos', '10', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(326, '0', 'Harambee Avenue ', '11', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(327, '1', 'Muranga ', '11', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(328, '2', 'Embu ', '11', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(329, '3', 'Mombasa ', '11', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(330, '4', 'Koinange Street ', '11', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(331, '5', 'Thika ', '11', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(332, '6', 'Meru ', '11', 1, '2017-04-21 18:21:50', '2017-04-21 18:21:50'),
(333, '7', 'Nyeri ', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(334, '8', 'Laare', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(335, '9', 'Maua ', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(336, '10', 'Isiolo ', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(337, '11', 'Head Office ', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(338, '12', 'Corporate', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(339, '13', 'Umoja ', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(340, '14', 'River Road ', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(341, '15', 'Eldoret', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(342, '16', 'Nakuru', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(343, '17', 'Kitengela', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(344, '18', 'Taj Mall', '11', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(345, '0', 'Head Office ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(346, '1', 'Finance And Accounts ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(347, '2', 'Co-op House ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(348, '3', 'Kisumu ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(349, '4', 'Nkurumah Road', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(350, '5', 'Meru ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(351, '6', 'Nakuru ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(352, '7', 'Industrial Area ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(353, '8', 'Kisii ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(354, '9', 'Machakos ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(355, '10', 'Nyeri ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(356, '11', 'Ukulima ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(357, '12', 'Kerugoya ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(358, '13', 'Eldoret ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(359, '14', 'Moi Avenue ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(360, '15', 'Naivasha ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(361, '17', 'Nyahururu ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(362, '18', 'Chuka ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(363, '19', 'Wakulima Market ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(364, '20', 'Eastleigh ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(365, '21', 'Kiambu ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(366, '22', 'Homa Bay ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(367, '23', 'Embu ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(368, '24', 'Kericho ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(369, '25', 'Bungoma ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(370, '26', 'Muranga ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(371, '27', 'Kayole ', '12', 1, '2017-04-21 18:21:51', '2017-04-21 18:21:51'),
(372, '28', 'Karatina ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(373, '29', 'Ukunda ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(374, '30', 'Mtwapa ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(375, '31', 'University Way ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(376, '32', 'Buru Buru ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(377, '33', 'Athi River ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(378, '34', 'Mumias ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(379, '35', 'Stima Plaza ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(380, '36', 'Westlands ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(381, '37', 'Upper Hill ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(382, '38', 'Ongata Rongai ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(383, '39', 'Thika ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(384, '40', 'Nacico ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(385, '41', 'Kariobangi ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(386, '42', 'Kawangware ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(387, '43', 'Makutano ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(388, '44', 'Canon House ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(389, '45', 'Kimathi Street ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(390, '46', 'Kitale ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(391, '47', 'Githurai ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(392, '48', 'Maua ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(393, '49', 'City  Hall ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(394, '50', 'Digo Rd ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(395, '51', 'Nbc ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(396, '52', 'Kakamega', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(397, '53', 'Migori ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(398, '54', 'Kenyatta Avenue ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(399, '55', 'Nkubu ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(400, '56', 'Enterprise Road ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(401, '57', 'Busia ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(402, '58', 'Siaya ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(403, '59', 'Voi ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(404, '60', 'Mariakani ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(405, '61', 'Malindi ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(406, '62', 'Zimmerman ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(407, '63', 'Nakuru East ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(408, '64', 'Kitengela ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(409, '65', 'Aga Khan Walk ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(410, '66', 'Narok ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(411, '67', 'Kitui ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(412, '68', 'Nanyuki ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(413, '69', 'Embakasi ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(414, '70', 'Kibera ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(415, '71', 'Siakago ', '12', 1, '2017-04-21 18:21:52', '2017-04-21 18:21:52'),
(416, '72', 'Kapsabet ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(417, '73', 'Mbita ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(418, '74', 'Kangemi ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(419, '75', 'Dandora ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(420, '76', 'Kajiado ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(421, '77', 'Tala ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(422, '78', 'Gikomba ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(423, '79', 'River Road ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(424, '80', 'Nyamira ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(425, '81', 'Garisa ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(426, '82', 'Bomet ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(427, '83', 'Keroka ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(428, '84', 'Gilgil ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(429, '85', 'Tom Mboya ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(430, '86', 'Likoni ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(431, '87', 'Donholm ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(432, '88', 'Mwingi ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(433, '89', 'Ruaka', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(434, '90', 'Webuye', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(435, '94', 'Sacco Clearing Unit', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(436, '97', 'clearing Centre', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(437, '100', 'Ndhiwa', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(438, '101', 'Oyugis', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(439, '102', 'Isiolo', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(440, '103', 'Eldoret West', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(441, '104', 'Changamwe', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(442, '105', 'Kisumu East', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(443, '106', 'Githurai Kimbo', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(444, '107', 'Mlolongo', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(445, '108', 'Kilifi', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(446, '109', 'Ol Kalau', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(447, '110', 'Mbale', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(448, '111', 'Kimilili', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(449, '112', 'Kisii East', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(450, '113', 'Kilgoris', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(451, '114', 'Wote', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(452, '116', 'Malaba', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(453, '117', 'Molo', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(454, '118', 'Mwea', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(455, '119', 'Kutus', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(456, '120', 'Umoja', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(457, '121', 'Embakasi Junction', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(458, '122', 'Kongowea ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(459, '123', 'Langata Road', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(460, '124', 'Juja', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(461, '125', 'Ngong', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(462, '126', 'Kawangware 46', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(463, '127', 'Mombasa Road', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(464, '128', 'Marsabit', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(465, '130', 'Dagoretti', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(466, '131', 'Othaya', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(467, '132', 'Limuru', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(468, '133', 'Kikuyu', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(469, '134', 'Githunguri', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(470, '135', 'Karen', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(471, '136', 'Mpeketoni', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(472, '137', 'Gatundu', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(473, '138', 'Ruiru', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(474, '139', 'Nyali Mall ', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(475, '140', 'Yala', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(476, '141', 'Maasai Mall - Ongata Rongai', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(477, '142', 'Thika Road Mall', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(478, '143', 'Kiserian', '12', 1, '2017-04-21 18:21:53', '2017-04-21 18:21:53'),
(479, '144', 'Nandi Hills', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(480, '145', 'Lodwar', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(481, '147', 'Engineer', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(482, '148', 'Rongo', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(483, '149', 'Lavington Mall', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(484, '150', 'Bondo', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(485, '151', 'Gigiri Mall', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(486, '152', 'United Mall, Kisumu', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(487, '153', 'Green House Mall', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(488, '228', 'Shares Operations ', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(489, '247', 'Back Office Operations', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(490, '250', 'E- Channels Unit', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(491, '254', 'Diaspora Banking', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(492, '266', 'Kilindini Port ', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(493, '270', 'Money Transfers Agency ', '12', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(494, '0', 'Head Office', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(495, '1', 'Koinange Street', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(496, '2', 'Kisumu', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(497, '3', 'Nakuru', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(498, '4', 'Kisii', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(499, '5', 'Westlands ', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(500, '6', 'Industrial Area ', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(501, '8', 'Nakuru, Kenyatta Avenue', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(502, '9', 'Eldoret', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(503, '10', 'Rongai', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(504, '11', 'Mombasa- Nyali Centre', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(505, '12', 'Thika', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(506, '13', 'Lavington Mall', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(507, '14', 'Machakos', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(508, '15', 'Kitengela', '13', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(509, '0', 'Head Office', '14', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(510, '1', 'Loita Street', '14', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(511, '0', 'Head Office ', '15', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(512, '1', 'Nation Centre ', '15', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(513, '2', 'Mombasa ', '15', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(514, '3', 'Kisumu ', '15', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(515, '5', 'Parklands ', '15', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(516, '6', 'Westgate ', '15', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(517, '8', 'Mombasa Rd ', '15', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(518, '9', 'Ind Area ', '15', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(519, '10', 'Kisii ', '15', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(520, '11', 'Malindi ', '15', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(521, '12', 'Thika ', '15', 1, '2017-04-21 18:21:54', '2017-04-21 18:21:54'),
(522, '13', 'Otc ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(523, '14', 'Eldoret ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(524, '15', 'Eastleigh ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(525, '16', 'Changamwe ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(526, '17', 'T-mall ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(527, '18', 'Nakuru ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(528, '19', 'Village Market ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(529, '20', 'Diani ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(530, '21', 'Bungoma ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(531, '22', 'Kitale ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(532, '23', 'Prestige ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(533, '24', 'Buru Buru ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(534, '25', 'Kitengela ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(535, '26', 'Jomo Kenyatta Branch ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(536, '27', 'Kakamega ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(537, '28', 'Kericho ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(538, '29', 'Upper Hill ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(539, '30', 'Wabera Street ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(540, '31', 'Karen ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(541, '32', 'Voi ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(542, '33', 'Shimanzi ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(543, '34', 'Meru ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(544, '35', 'Diamond Plaza ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(545, '36', 'crossroad', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(546, '37', 'JKIA', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(547, '38', 'Nyali ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(548, '39', 'Migori Branch', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(549, '40', 'Madina Mall', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(550, '41', 'Courtyard Branch', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(551, '42', 'Mtwapa Branch', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(552, '43', 'Lamu Branch', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(553, '44', 'Kilifi Branch', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(554, '45', 'Mariakani Branch', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(555, '46', 'Thika Road Mall', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(556, '47', 'Ronald Ngala', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(557, '48', 'Busia', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(558, '49', 'West End Mall - Kisumu', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(559, '50', 'Tom Mboya ', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(560, '52', 'DTB Centre', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(561, '53', 'South C', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(562, '54', 'Lavington', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(563, '55', '9 West', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(564, '56', 'Biashara street, Nakuru', '15', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(565, '0', 'Head Office ', '16', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(566, '1', 'Eastleigh ', '16', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(567, '2', 'Mombasa ', '16', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(568, '3', 'Mombasa ', '16', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(569, '4', 'Nakuru ', '16', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(570, '20', 'Nakuru ', '16', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(571, '0', 'Fedha Branch , Head Office ', '17', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(572, '1', 'Moi Avenue Nairobi ', '17', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(573, '2', 'Akiba Hse Mombasa ', '17', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(574, '3', 'Plaza 2000 ', '17', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(575, '4', 'Westminister ', '17', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(576, '5', 'Chambers ', '17', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(577, '6', 'Thika ', '17', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(578, '7', 'Eldoret ', '17', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(579, '8', 'Kisumu ', '17', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(580, '9', 'Kisii ', '17', 1, '2017-04-21 18:21:55', '2017-04-21 18:21:55'),
(581, '10', 'Kitale ', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(582, '11', 'Industrial Area ', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(583, '12', 'Karatina ', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(584, '13', 'Westlands ', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(585, '14', 'United Mall ', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(586, '15', 'Nakuru ', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(587, '16', 'Jomo Kenyatta Avenue ', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(588, '17', 'Nyeri ', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(589, '18', 'Busia ', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(590, '19', 'Malindi ', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(591, '20', 'Meru', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(592, '21', 'Gikomba', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(593, '22', 'UpperHill', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(594, '23', 'Valley Arcade', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(595, '24', 'Karen', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(596, '25', 'Nyali Mombasa', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(597, '26', 'Ongata Rongai', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(598, '27', 'Embakasi', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(599, '28', 'Kitengela', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(600, '29', 'Thika Mall', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(601, '100', 'Head Office ', '17', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(602, '0', 'Nairobi ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(603, '1', 'Nyerere ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(604, '2', 'Mombasa ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(605, '3', 'Westlands ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(606, '4', 'Mombasa Road ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(607, '5', 'Chester ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(608, '7', 'Waiyaki Way ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(609, '8', 'Kakamega ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(610, '9', 'Eldoret ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(611, '10', 'Senator Cards', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56');
INSERT INTO `bank_branches` (`id`, `branch_code`, `bank_branch_name`, `bank_id`, `organization_id`, `created_at`, `updated_at`) VALUES
(612, '11', 'Nyali ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(613, '12', 'Kisumu ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(614, '13', 'Industrial Area ', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(615, '15', 'Nakuru', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(616, '16', 'Ongata Rongai', '18', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(617, '0', 'Equity Bank Head Office ', '19', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(618, '1', 'Equity Bank Corporate ', '19', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(619, '2', 'Equity Bank Fourways ', '19', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(620, '3', 'Kangema ', '19', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(621, '4', 'Karatina ', '19', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(622, '5', 'Kiriaini ', '19', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(623, '6', 'Murarandia ', '19', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(624, '7', 'Kangari ', '19', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(625, '8', 'Othaya ', '19', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(626, '9', 'Thika / Equity Plaza ', '19', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(627, '10', 'Kerugoya ', '19', 1, '2017-04-21 18:21:56', '2017-04-21 18:21:56'),
(628, '11', 'Nyeri ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(629, '12', 'Tom Mboya ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(630, '13', 'Nakuru ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(631, '14', 'Meru ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(632, '15', 'Mama Ngina ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(633, '16', 'Nyahururu ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(634, '17', 'Community ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(635, '18', 'Community Corporate ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(636, '19', 'Embu ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(637, '20', 'Naivasha ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(638, '21', 'Chuka ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(639, '22', 'Muranga ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(640, '23', 'Molo ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(641, '24', 'Harambee Avenu ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(642, '25', 'Mombasa ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(643, '26', 'Kimathi Street ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(644, '27', 'Nanyuki ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(645, '28', 'Kericho ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(646, '29', 'Kisumu ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(647, '30', 'Eldoret ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(648, '31', 'Nakuru Kenyatta Avenue ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(649, '32', 'Kariobangi ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(650, '33', 'Kitale ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(651, '34', 'Thika Kenyatta Avenue ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(652, '35', 'Knut House ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(653, '36', 'Narok ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(654, '37', 'Nkubu ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(655, '38', 'Mwea ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(656, '39', 'Matuu ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(657, '40', 'Maua ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(658, '41', 'Isiolo ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(659, '42', 'Kagio ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(660, '43', 'Gikomba ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(661, '44', 'Ukunda ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(662, '45', 'Malindi ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(663, '46', 'Mombasa Digo Road ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(664, '47', 'Moi Avenue ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(665, '48', 'Bungoma ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(666, '49', 'Kapsabet ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(667, '50', 'Kakamega ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(668, '51', 'Kisii ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(669, '52', 'Nyamira ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(670, '53', 'Litein ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(671, '54', 'Equity Centre Diaspora', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(672, '55', 'Westlands ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(673, '56', 'Industrial Area Kenpipe Plaza ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(674, '57', 'Kikuyu ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(675, '58', 'Garissa ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(676, '59', 'Mwingi ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(677, '60', 'Machakos ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(678, '61', 'Ongata Rongai ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(679, '62', 'Ol-kalao ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(680, '63', 'Kawangware ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(681, '64', 'Kiambu ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(682, '65', 'Kayole ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(683, '66', 'Gatundu ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(684, '67', 'Wote ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(685, '68', 'Mumias ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(686, '69', 'Limuru ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(687, '70', 'Kitengela ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(688, '71', 'Githurai ', '19', 1, '2017-04-21 18:21:57', '2017-04-21 18:21:57'),
(689, '72', 'Kitui ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(690, '73', 'Ngong ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(691, '74', 'Loitoktok ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(692, '75', 'Bondo ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(693, '76', 'Mbita ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(694, '77', 'Gilgil ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(695, '78', 'Busia ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(696, '79', 'Voi ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(697, '80', 'Enterprise Road ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(698, '81', 'Equity Centre ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(699, '82', 'Donholm ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(700, '83', 'Mukurwe-ini ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(701, '84', 'Eastleigh ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(702, '85', 'Namanga ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(703, '86', 'Kajiado ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(704, '87', 'Ruiru ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(705, '88', 'Otc ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(706, '89', 'Kenol ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(707, '90', 'Tala ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(708, '91', 'Ngara ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(709, '92', 'Nandi Hills ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(710, '93', 'Githunguri ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(711, '94', 'Tea Room ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(712, '95', 'Buru Buru ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(713, '96', 'Mbale ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(714, '97', 'Siaya ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(715, '98', 'Homa Bay ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(716, '99', 'Lodwar ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(717, '100', 'Mandera ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(718, '101', 'Marsabit ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(719, '102', 'Moyale ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(720, '103', 'Wajir ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(721, '104', 'Meru Makutano ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(722, '105', 'Malaba Town ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(723, '106', 'Kilifi ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(724, '107', 'Kapenguria ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(725, '108', 'Mombasa Road ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(726, '109', 'Eldoret Market ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(727, '110', 'Maralal ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(728, '111', 'Kimende ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(729, '112', 'Luanda ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(730, '113', 'Ku Sub Branch ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(731, '114', 'Kengeleni ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(732, '115', 'Nyeri Kimathi Way ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(733, '116', 'Migori ', '19', 1, '2017-04-21 18:21:58', '2017-04-21 18:21:58'),
(734, '117', 'Kibera ', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(735, '118', 'Kasarani ', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(736, '119', 'Mtwapa ', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(737, '120', 'Changamwe ', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(738, '121', 'Hola ', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(739, '122', 'Bomet ', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(740, '123', 'Kilgoris ', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(741, '124', 'Keroka ', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(742, '125', 'KAREN', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(743, '126', 'KISUMU ANGAWA AVE', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(744, '127', 'MPEKETONI', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(745, '128', 'NAIROBI WEST', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(746, '129', 'KENYATTA AVENUE', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(747, '130', 'City Hall', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(748, '131', 'Eldama Ravine', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(749, '132', 'Embakasi', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(750, '133', 'KPCU', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(751, '134', 'Ridgeways', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(752, '135', 'Runyenjes Sub Branch', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(753, '136', 'Dadaad', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(754, '137', 'Kangemi', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(755, '138', 'Nyali Centre Corporate', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(756, '139', 'Kabarnet', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(757, '140', 'Westlands Corporate', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(758, '141', 'Lavington Corporate', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(759, '142', 'Taita Taveta', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(760, '143', 'Awendo', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(761, '144', 'Ruai', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(762, '145', 'Kilimani', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(763, '146', 'Nakuru Westside Mall', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(764, '147', 'Kilimani Supreme', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(765, '148', 'JKIA Cargo Centre', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(766, '149', 'EPZ Athi River', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(767, '150', 'Oyugis', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(768, '151', 'Mayfair Supreme Centre', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(769, '152', 'Juja', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(770, '153', 'Iten', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(771, '154', 'Nyali Supreme Centre', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(772, '155', 'Thika Supreme Centre', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(773, '156', 'Mombasa Supreme Centre', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(774, '157', 'Kapsowar Sub-Branch', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(775, '158', 'Kwale', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(776, '159', 'Lamu', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(777, '160', 'Kenyatta Avenue Supreme', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(778, '161', 'KPA Sub-Branch Mombasa', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(779, '162', 'Gigiri Supreme Centre', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(780, '163', 'Karen Supreme Centre', '19', 1, '2017-04-21 18:21:59', '2017-04-21 18:21:59'),
(781, '164', 'Eldoret Supreme Centre', '19', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(782, '165', 'Kakuma', '19', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(783, '166', 'Archers Post ', '19', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(784, '167', 'Mutomo', '19', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(785, '168', 'Kiserian Sub Branch', '19', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(786, '169', 'Dagoretti Corner', '19', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(787, '170', 'Kisumu Supreme Centre', '19', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(788, '171', 'Thika Makongeni', '19', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(789, '777', 'Equity Hapo Hapo', '19', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(790, '0', 'Head Office ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(791, '1', 'Kiambu ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(792, '2', 'Githunguri ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(793, '3', 'Sonalux ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(794, '4', 'Gatundu ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(795, '5', 'Thika ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(796, '6', 'Muranga ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(797, '7', 'Kangari ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(798, '8', 'Kiria-ini ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(799, '9', 'Kangema ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(800, '11', 'Othaya ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(801, '12', 'Kenyatta Avenue ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(802, '14', 'Cargen House ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(803, '15', 'Laptrust', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(804, '16', 'City Hall Annex', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(805, '17', 'Kasarani', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(806, '18', 'Nakuru Finance House ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(807, '19', 'Nakuru Market', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(808, '21', 'Dagoretti', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(809, '22', 'Kericho', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(810, '23', 'Nyahururu', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(811, '24', 'Ruiru ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(812, '25', 'Kisumu Reliance', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(813, '26', 'Nyamira ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(814, '27', 'Kisii ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(815, '28', 'Kisumu Al Imran', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(816, '29', 'Narok', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(817, '31', 'Industrial Area ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(818, '32', 'Thika Makongeni', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(819, '33', 'Donholm ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(820, '34', 'Utawala', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(821, '35', 'Fourways Retail Branch', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(822, '37', 'Olkalou', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(823, '38', 'Ktda Plaza ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(824, '41', 'Kariobangi ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(825, '42', 'Gikomba Area 42', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(826, '43', 'Sokoni ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(827, '45', 'Githurai ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(828, '46', 'Yaya ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(829, '47', 'Limuru ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(830, '48', 'Westlands', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(831, '49', 'Kagwe', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(832, '51', 'Banana ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(833, '53', 'Naivasha ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(834, '54', 'Chuka', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(835, '55', 'Nyeri ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(836, '56', 'Karatina', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(837, '57', 'Kerugoya ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(838, '58', 'Tom Mboya ', '20', 1, '2017-04-21 18:22:00', '2017-04-21 18:22:00'),
(839, '59', 'River Road ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(840, '61', 'Kayole ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(841, '62', 'Nkubu ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(842, '63', 'Meru ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(843, '64', 'Nanyuki', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(844, '65', 'Ktda Plaza Corporate ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(845, '66', 'Ongata Rongai ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(846, '67', 'Kajiado', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(847, '68', 'Fourways Corporate Branch ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(848, '69', 'Ngara', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(849, '71', 'Kitengela ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(850, '72', 'Kitui', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(851, '73', 'Mackakos ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(852, '74', 'Migori', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(853, '75', 'Embu ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(854, '76', 'Mwea', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(855, '77', 'Bungoma ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(856, '78', 'Kakamega ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(857, '79', 'Busia ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(858, '81', 'Mumias', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(859, '82', 'Eldoret West', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(860, '83', 'Molo ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(861, '84', 'Bomet', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(862, '85', 'Eldoret ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(863, '87', 'Leitin', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(864, '89', 'Bamburi', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(865, '91', 'Ukunda', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(866, '92', 'Digo', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(867, '93', 'Kitale ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(868, '94', 'Mtwapa', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(869, '95', 'Mombasa Nkrumah Road', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(870, '96', 'Mombasa Jomo Kenyatta Avenue', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(871, '97', 'Kapsabet ', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(872, '98', 'Malindi', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(873, '102', 'Kikuyu', '20', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(874, NULL, 'head office', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(875, NULL, 'Kariobangi', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(876, NULL, 'Kawangware', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(877, NULL, 'Ngong Road', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(878, NULL, 'Kayole Branch', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(879, NULL, 'OTC', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(880, NULL, 'Thika Road', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(881, NULL, 'Kibera', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(882, NULL, 'Kimathi Street', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(883, NULL, 'Kitengela', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(884, NULL, 'Kitui', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(885, NULL, 'Emali', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(886, NULL, 'Wote', '21', 1, '2017-04-21 18:22:01', '2017-04-21 18:22:01'),
(887, NULL, 'Mwingi', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(888, NULL, 'Makutano', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(889, NULL, 'Nkubu', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(890, NULL, 'Meru', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(891, NULL, 'Maua', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(892, NULL, 'Isiolo', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(893, NULL, 'Embu', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(894, NULL, 'Mwea', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(895, NULL, 'Machakos', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(896, NULL, 'Tala Plaza', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(897, NULL, 'Kiserian', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(898, NULL, 'Matuu', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(899, NULL, 'Kiambu', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(900, NULL, 'Muranga ', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(901, NULL, 'Nanyuki', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(902, NULL, 'Timau', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(903, NULL, 'Thika', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(904, NULL, 'Githunguri', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(905, NULL, 'Kerugoya', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(906, NULL, 'Nyeri', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(907, NULL, 'Karatina', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(908, NULL, 'Rongai', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(909, NULL, 'Narumoru', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(910, NULL, 'Bungoma', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(911, NULL, 'Webuye', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(912, NULL, 'Mumias', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(913, NULL, 'Kakamega', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(914, NULL, 'Busia', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(915, NULL, 'Kimilili', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(916, NULL, 'Kapenguria', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(917, NULL, 'Bomet', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(918, NULL, 'Litein', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(919, NULL, 'Kericho', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(920, NULL, 'Kapsabet', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(921, NULL, 'Kitale', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(922, NULL, 'Kabarnet', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(923, NULL, 'Rware Shop', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(924, NULL, 'Maralal', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(925, NULL, 'Olenguruone', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(926, NULL, 'Eldoret', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(927, NULL, 'Rumuruti', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(928, NULL, 'Nyahururu', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(929, NULL, 'Nakuru', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(930, NULL, 'Eldama Ravine', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(931, NULL, 'Naivasha ', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(932, NULL, 'Njambini', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(933, NULL, 'Narok', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(934, NULL, 'Molo', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(935, NULL, 'Kinamba', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(936, NULL, 'Njoro', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(937, NULL, 'Mombasa Central', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(938, NULL, 'Malindi', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(939, NULL, 'Kengeleni', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(940, NULL, 'Voi ', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(941, NULL, 'Changamwe', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(942, NULL, 'Kongowea ', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(943, NULL, 'Ukunda', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(944, NULL, 'Mpeketoni', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(945, NULL, 'Kisumu', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(946, NULL, 'Ugunja', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(947, NULL, 'Bondo', '21', 1, '2017-04-21 18:22:02', '2017-04-21 18:22:02'),
(948, '0', 'Head Office', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(949, '1', 'Kimathi Street', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(950, '2', 'Ind Area ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(951, '3', 'Westlands ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(952, '4', 'Lavington ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(953, '5', 'Nkrumah Road , Mombasa ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(954, '6', 'Nakuru ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(955, '7', 'Eldoret ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(956, '8', 'Muthaiga ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(957, '9', 'Nanyuki ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(958, '10', 'Thika ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(959, '11', 'Gikomba ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(960, '12', 'Ngong Road ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(961, '13', 'Meru ', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(962, '14', 'Nyali', '22', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(963, '1', 'Wabera Street ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(964, '2', 'Eastleigh 1 ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(965, '3', 'Mombasa 1 ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(966, '4', 'Garissa ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(967, '5', 'Eastleigh 2 - General Waruinge ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(968, '6', 'Malindi ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(969, '7', 'Kisumu ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(970, '8', 'Kimathi Street ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(971, '9', 'Westlands ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(972, '10', 'South C ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(973, '11', 'Industrial Area ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(974, '12', 'Masalani ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(975, '13', 'Habasweni ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(976, '14', 'Wajir ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(977, '15', 'Moyale ', '23', 1, '2017-04-21 18:22:03', '2017-04-21 18:22:03'),
(978, '16', 'Nakuru ', '23', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(979, '17', 'Mombasa 2 ', '23', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(980, '18', 'Lunga Lunga', '23', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(981, '999', 'Head Office/clearing Center ', '23', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(982, '0', 'Banda', '24', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(983, '1', 'Mombasa ', '24', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(984, '2', 'Industrial Area ', '24', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(985, '3', 'Kimathi St.', '24', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(986, '4', 'Kisumu Branch ', '24', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(987, '5', 'Westlands ', '24', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(988, '7', 'Parklands 3rd Avenue ', '24', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(989, '1', 'Head Office ', '25', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(990, '2', 'Westlands ', '25', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(991, '3', 'Mombasa ', '25', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(992, '4', 'Eldoret ', '25', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(993, '5', 'Kisumu ', '25', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(994, '6', 'Moi Ave ', '25', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(995, '7', 'Mombasa Road ', '25', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(996, '8', 'Nyali', '25', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(997, '9', 'Ngong Road', '25', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(998, '10', 'Nakuru', '25', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(999, '0', 'Head Office', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1000, '1', 'Kimathi Street', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1001, '2', 'Ind Area ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1002, '3', 'Westlands ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1003, '4', 'Lavington ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1004, '5', 'Nkrumah Road , Mombasa ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1005, '6', 'Nakuru ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1006, '7', 'Eldoret ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1007, '8', 'Muthaiga ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1008, '9', 'Nanyuki ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1009, '10', 'Thika ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1010, '11', 'Gikomba ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1011, '12', 'Ngong Road ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1012, '13', 'Meru ', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1013, '14', 'Nyali', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1014, '15', 'Sky Park', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1015, '16', 'Karen', '26', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1016, '0', 'Head Office ', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1017, '1', 'Central Clearing Centre ', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1018, '2', 'Upperhill ', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1019, '3', 'Eastleigh ', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1020, '4', 'Kenyatta Avenue ', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1021, '5', 'Mombasa ', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1022, '6', 'Garissa ', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1023, '7', 'Lamu ', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1024, '8', 'Malindi ', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1025, '9', 'Muthaiga ', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1026, '10', 'Bondeni ', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1027, '11', 'Eastleigh 7th Street', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1028, '12', 'Eastleigh Athumani Kipanga Street', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1029, '13', 'Westlands', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1030, '14', 'Industrial Area', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1031, '15', 'Jomo Kenyatta Avenue', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1032, '16', 'Bombululu', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1033, '17', 'Mombasa Road', '27', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1034, '0', 'Head Office ', '28', 1, '2017-04-21 18:22:04', '2017-04-21 18:22:04'),
(1035, '1', 'Mombasa ', '28', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1036, '2', 'Industrial Area ', '28', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1037, '3', 'Westlands ', '28', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1038, '4', 'Nyali', '28', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1039, '46', 'Mombasa ', '29', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1040, '47', 'Malindi ', '29', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1041, '48', 'Kimathi Street ', '29', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1042, '49', 'Kenyatta Avenue ', '29', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1043, '86', 'Kisumu ', '29', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1044, '108', 'Industrial Area', '29', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1045, '109', 'HBL Westlands', '29', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1046, '16', 'Kitengela', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1047, '17', 'Naivasha', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1048, '100', 'Head Office', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1049, '200', 'Rehani House', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1050, '210', 'Kenyatta Market', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1051, '220', 'Gill House', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1052, '230', 'Buru Buru', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1053, '260', 'Thika Road Mall', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1054, '270', 'Sameer Business Park', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1055, '280', 'Westlands', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1056, '300', 'Mombasa', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1057, '310', 'Nyali ', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1058, '400', 'Nakuru', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1059, '410', 'Eldoret', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1060, '500', 'Thika', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1061, '510', 'Nyeri', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1062, '520', 'Meru', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1063, '600', 'Kisumu', '30', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1064, '0', 'Kenyatta Avenue ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1065, '1', '2nd Nong Avenue ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1066, '2', 'Sarit Centre ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1067, '3', 'Head Office ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1068, '4', 'Biashara St ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1069, '5', 'Mombasa ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1070, '6', 'Industrial Area ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1071, '7', 'Kisumu ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1072, '8', 'Karen ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1073, '9', 'Panari Centre ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1074, '10', 'Parklands ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1075, '11', 'Wilson Airport ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1076, '12', 'Ongata Rongai ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1077, '13', 'South C Shopping Centre ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1078, '14', 'Nyali Cinemax ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1079, '15', 'Langata Link ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1080, '16', 'Lavington ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1081, '17', 'Eldoret ', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1082, '18', 'NAKURU', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1083, '19', 'Riversid Drive Branch', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1084, '20', 'Kisii', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1085, '21', 'Changamwe', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1086, '22', 'Malindi', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1087, '23', 'Nyeri', '31', 1, '2017-04-21 18:22:05', '2017-04-21 18:22:05'),
(1088, '24', 'Thika', '31', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1089, '25', 'Gigiri', '31', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1090, '26', 'Mtwapa', '31', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1091, '27', 'Lavington Mall', '31', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1092, '28', 'Kitale', '31', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1093, '29', 'Lunga Lunga', '31', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1094, '30', 'Yaya Centre', '31', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1095, '31', 'I&M Bank Ltd Gateway Mall, Syokimau', '31', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1096, '32', 'Garden City Mall', '31', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1097, '98', 'Card Center ', '31', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1098, '1', 'IPS', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1099, '2', 'Mombasa ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1100, '3', 'Upper Hill ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1101, '4', 'Parklands ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1102, '5', 'Malindi ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1103, '6', 'Industrial Area ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1104, '7', 'Watamu ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1105, '8', 'Diani ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1106, '9', 'Kilifi ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1107, '10', 'Eldoret ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1108, '11', 'Karen ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1109, '12', 'Thika ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1110, '14', 'Changamwe ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1111, '15', 'Riverside ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1112, '16', 'Likoni ', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1113, '17', 'HAILE SELASSIE ROAD', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1114, '18', 'Village Market', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1115, '19', 'Bamburi', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1116, '20', 'Junction Mall', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1117, '21', 'Greenspan mall', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1118, '22', 'Westside Mall', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1119, '23', 'Kenyatta Street Eldoret', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1120, '24', 'Westlands', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1121, '26', 'Highridge Branch', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1122, '27', 'Nyali Cinemax', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1123, '28', 'Garden City', '32', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1124, '0', 'Head Office ', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1125, '1', 'Koinange Street', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1126, '100', 'Kiongozi', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1127, '101', 'Kayole', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1128, '102', 'Eastleigh', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1129, '105', 'Kawangware', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1130, '106', 'Kibera', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1131, '107', 'Kariobangi', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1132, '111', 'Central Clearing Center', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1133, '114', 'Funzi Road', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1134, '115', 'Ngong Road', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1135, '116', 'Kirinyaga Road', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1136, '209', 'Machakos', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1137, '210', 'Mtwapa', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1138, '213', 'Kiritiri', '33', 1, '2017-04-21 18:22:06', '2017-04-21 18:22:06'),
(1139, '301', 'Thika', '33', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1140, '303', 'Muranga ', '33', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1141, '306', 'Kikuyu', '33', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1142, '307', 'Banana', '33', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1143, '310', 'Utawala', '33', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1144, '316', 'Nyeri', '33', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1145, '402', 'Kisumu', '33', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1146, '502', 'Ongata Rongai', '33', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1147, '503', 'Kitengela', '33', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1148, '507', 'Nakuru', '33', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1149, '603', 'Mombasa', '33', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1150, '91', 'Eastleigh ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1151, '92', 'KCB CPC', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1152, '94', 'Head Office ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1153, '95', 'Wote ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1154, '96', 'Head Office Finance', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1155, '100', 'Moi Avenue Nairobi ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1156, '101', 'Kipande House ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1157, '102', 'Treasury Sq Mombasa ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1158, '103', 'Nakuru ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1159, '104', 'Kicc ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1160, '105', 'Kisumu ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1161, '106', 'Kericho ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1162, '107', 'Tom Mboya ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1163, '108', 'Thika ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1164, '109', 'Eldoret ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1165, '110', 'Kakamega ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1166, '111', 'Kilindini Mombasa ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1167, '112', 'Nyeri ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1168, '113', 'Industrial Area Nairobi ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1169, '114', 'River Road ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1170, '115', 'Muranga ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1171, '116', 'Embu ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1172, '117', 'Kangema ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1173, '119', 'Kiambu ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1174, '120', 'Karatina ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1175, '121', 'Siaya ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1176, '122', 'Nyahururu ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1177, '123', 'Meru ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1178, '124', 'Mumias ', '34', 1, '2017-04-21 18:22:07', '2017-04-21 18:22:07'),
(1179, '125', 'Nanyuki ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1180, '127', 'Moyale ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1181, '129', 'Kikuyu ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1182, '130', 'Tala ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1183, '131', 'Kajiado ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1184, '133', 'KCB Custody services', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1185, '134', 'Matuu ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1186, '135', 'Kitui ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1187, '136', 'Mvita ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1188, '137', 'Jogoo Rd Nairobi ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1189, '139', 'Card Centre ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1190, '140', 'Marsabit ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1191, '141', 'Sarit Centre ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1192, '142', 'Loitokitok ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1193, '143', 'Nandi Hills ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1194, '144', 'Lodwar ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1195, '145', 'Un Gigiri ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1196, '146', 'Hola ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1197, '147', 'Ruiru ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1198, '148', 'Mwingi ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1199, '149', 'Kitale ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1200, '150', 'Mandera ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1201, '151', 'Kapenguria ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1202, '152', 'Kabarnet ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1203, '153', 'Wajir ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1204, '154', 'Maralal ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1205, '155', 'Limuru ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1206, '157', 'Ukunda ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1207, '158', 'Iten ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1208, '159', 'Gilgil ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1209, '161', 'Ongata Rongai ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1210, '162', 'Kitengela ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1211, '163', 'Eldama Ravine ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1212, '164', 'Kibwezi ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1213, '166', 'Kapsabet ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1214, '167', 'University Way ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1215, '168', 'KCB Eldoret West', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1216, '169', 'Garissa ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1217, '173', 'Lamu ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1218, '174', 'Kilifi ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1219, '175', 'Milimani ', '34', 1, '2017-04-21 18:22:08', '2017-04-21 18:22:08'),
(1220, '176', 'Nyamira ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1221, '177', 'Mukuruweini ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1222, '180', 'Village Market ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1223, '181', 'Bomet ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1224, '183', 'Mbale ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1225, '184', 'Narok ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1226, '185', 'Othaya ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1227, '186', 'Voi ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1228, '188', 'Webuye ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1229, '189', 'Sotik ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1230, '190', 'Naivasha ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1231, '191', 'Kisii ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09');
INSERT INTO `bank_branches` (`id`, `branch_code`, `bank_branch_name`, `bank_id`, `organization_id`, `created_at`, `updated_at`) VALUES
(1232, '192', 'Migori ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1233, '193', 'Githunguri ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1234, '194', 'Machakos ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1235, '195', 'Kerugoya ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1236, '196', 'Chuka ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1237, '197', 'Bungoma ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1238, '198', 'Wundanyi ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1239, '199', 'Malindi ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1240, '201', 'Capital Hill ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1241, '202', 'Karen ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1242, '203', 'Lokichogio ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1243, '204', 'Gateway Msa Road ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1244, '205', 'Buruburu ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1245, '206', 'Chogoria ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1246, '207', 'Kangare ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1247, '208', 'Kianyaga ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1248, '209', 'Nkubu ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1249, '210', 'Ol Kalou ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1250, '211', 'Makuyu ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1251, '212', 'Mwea ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1252, '213', 'Njambini ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1253, '214', 'Gatundu ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1254, '215', 'Emali ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1255, '216', 'Isiolo ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1256, '217', 'KCB Flamingo', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1257, '218', 'Njoro ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1258, '219', 'Mutomo ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1259, '220', 'Mariakani ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1260, '221', 'Mpeketoni ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1261, '222', 'Mtitu Andei ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1262, '223', 'Mtwapa ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1263, '224', 'Taveta ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1264, '225', 'Kengeleni ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1265, '226', 'Garsen ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1266, '227', 'Watamu ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1267, '228', 'Bondo ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1268, '229', 'Busia ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1269, '230', 'Homa Bay ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1270, '231', 'Kapsowar ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1271, '232', 'Kehancha ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1272, '233', 'Keroka ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1273, '234', 'Kilgoris ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1274, '235', 'Kimilili ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1275, '236', 'Litein ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1276, '237', 'Londiani Branch ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1277, '238', 'Luanda ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1278, '239', 'Malaba ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1279, '240', 'Muhoroni ', '34', 1, '2017-04-21 18:22:09', '2017-04-21 18:22:09'),
(1280, '241', 'Oyugis ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1281, '242', 'Ugunja ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1282, '243', 'United Mall ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1283, '244', 'Serem ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1284, '245', 'Sondu ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1285, '246', 'Kisumu West ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1286, '247', 'Marigat ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1287, '248', 'Mois Bridge ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1288, '249', 'Mashariki ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1289, '250', 'Naro Moro ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1290, '251', 'Kiriaini ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1291, '252', 'Egerton University ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1292, '253', 'Maua ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1293, '254', 'Kawangare ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1294, '255', 'Kimathi ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1295, '256', 'Namanga ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1296, '257', 'Gikomba ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1297, '258', 'Kwale ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1298, '259', 'Prestige Plaza ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1299, '260', 'Kariobangi ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1300, '263', 'Biashara Street ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1301, '266', 'Ngara ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1302, '267', 'Kyuso ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1303, '270', 'Masii ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1304, '271', 'Menengai Crater', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1305, '272', 'Town Centre ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1306, '278', 'Makindu ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1307, '283', 'Rongo ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1308, '284', 'Isibania ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1309, '285', 'Kiserian ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1310, '286', 'Mwembe Tayari ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1311, '287', 'Kisauni ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1312, '288', 'Haile Selassie ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1313, '289', 'Salama House Mortgage Centre', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1314, '290', 'Garden Plaza ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1315, '291', 'Sarit Centre Mortgage Centre', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1316, '292', 'Cpc Bulk Corporate Cheques ', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1317, '293', 'Trade Services', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1318, '295', 'Nairobi High Court', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1319, '296', 'Mombasa High Court', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1320, '297', 'Kisumu Airport', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1321, '298', 'Port Victoria', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1322, '299', 'Moi International Airport', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1323, '300', 'Nyali', '34', 1, '2017-04-21 18:22:10', '2017-04-21 18:22:10'),
(1324, '301', 'Westgate Advantage', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1325, '302', 'Diaspora ', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1326, '303', 'Kisii West ', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1327, '304', 'Mbita', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1328, '305', 'Sori', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1329, '306', 'Hurlingham', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1330, '307', 'Kibera', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1331, '308', 'Thika Road Mall Branch', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1332, '309', 'Kasarani Branch', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1333, '310', 'KCB Maasai Mara', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1334, '311', 'KCB Kabartonjo', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1335, '312', 'KCB Eldoret East', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1336, '313', 'Kikim', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1337, '314', 'KCB JKUAT', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1338, '315', 'KCB Changamwe', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1339, '316', 'KCB Makongeni', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1340, '317', 'KCB Syokimau', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1341, '318', 'KCB Moi Referral Hospital', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1342, '319', 'KCB Kitale Advantage', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1343, '320', 'KCB Lavington', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1344, '321', 'KCB ICD Kibarani', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1345, '322', 'KCB Riverside Advantage', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1346, '323', 'KCB Gigiri Square', '34', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1347, NULL, 'head quarters', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1348, NULL, 'North –Rift', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1349, NULL, 'Nandi hills', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1350, NULL, 'Eldoret', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1351, NULL, 'Trans-Nzoia', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1352, NULL, 'Bomet', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1353, NULL, 'Kericho', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1354, NULL, 'Lodwar ', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1355, NULL, 'Malaba ', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1356, NULL, 'Kakamega', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1357, NULL, 'Serem ', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1358, NULL, 'Nakuru', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1359, NULL, 'Njambini', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1360, NULL, 'Gilgil ', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1361, NULL, 'Embu', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1362, NULL, 'Mwea', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1363, NULL, 'Tharaka', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1364, NULL, 'Mbeere', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1365, NULL, 'Nkubu', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1366, NULL, 'Meru', '35', 1, '2017-04-21 18:22:11', '2017-04-21 18:22:11'),
(1367, NULL, 'Maua', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1368, NULL, 'Mount Kenya', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1369, NULL, 'Narumoru', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1370, NULL, 'Othaya', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1371, NULL, 'Mukurweini', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1372, NULL, 'Machakos', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1373, NULL, 'Matuu ', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1374, NULL, 'Masii ', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1375, NULL, 'Kyuso', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1376, NULL, 'Machakos 760 Hotel', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1377, NULL, 'Mwingi ', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1378, NULL, 'Tala ', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1379, NULL, 'Kitui', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1380, NULL, 'Migori', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1381, NULL, 'Thika', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1382, NULL, 'Ruiru', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1383, NULL, 'Gatundu ', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1384, NULL, 'Githurai 45', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1385, NULL, 'Kiambu', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1386, NULL, 'Nairobi', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1387, NULL, 'Gikomba', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1388, NULL, 'Nairobi west', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1389, NULL, 'Embakasi', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1390, NULL, 'River road', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1391, NULL, 'Kibwezi ', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1392, NULL, 'Emali', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1393, NULL, 'Nunguni', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1394, NULL, 'Wote ', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1395, NULL, 'Loitoktok', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1396, NULL, 'Taveta ', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1397, NULL, 'Garsen', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1398, NULL, 'Wundanyi ', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1399, NULL, 'Mwatate', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1400, NULL, 'Voi ', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1401, NULL, 'Kitengela', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1402, NULL, 'Mombasa', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1403, NULL, 'Malindi', '35', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1404, '0', 'Head Office ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1405, '1', 'Main Office ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1406, '2', 'Mombasa ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1407, '3', 'Kenyatta Ave Nbi ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1408, '4', 'Nakuru ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1409, '5', 'Nyeri ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1410, '6', 'Buruburu ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1411, '7', 'Embu ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1412, '8', 'Eldoret ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1413, '9', 'Kisumu ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1414, '10', 'Kericho ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1415, '11', 'Mlolongo', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1416, '12', 'Thika ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1417, '13', 'Kerugoya', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1418, '14', 'Kenyatta Market ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1419, '15', 'Kisii ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1420, '16', 'CHUKA', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1421, '17', 'Kitui ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1422, '18', 'Machakos ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1423, '19', 'Nanyuki ', '36', 1, '2017-04-21 18:22:12', '2017-04-21 18:22:12'),
(1424, '20', 'Kangemi', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1425, '21', 'Email', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1426, '22', 'Naivasha ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1427, '23', 'Nyahururu ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1428, '24', 'Isiolo ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1429, '25', 'Meru ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1430, '26', 'Kitale ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1431, '27', 'Kibwezi ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1432, '28', 'Bungoma ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1433, '29', 'Kajiado ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1434, '30', 'Nkubu', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1435, '31', 'Mtwapa ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1436, '32', 'Busia', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1437, '33', 'Moi Nbi ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1438, '34', 'Mwea ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1439, '35', 'Kengeleni ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1440, '36', 'Kilimani ', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1441, '37', 'Rongai', '36', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1442, '0', 'Head Office ', '37', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1443, '1', 'Nairobi ', '37', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1444, '2', 'Mombasa ', '37', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1445, '3', 'Milimani ', '37', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1446, '4', 'Industrial Area', '37', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1447, '5', 'Eldoret', '37', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1448, '0', 'Central Business Unit', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1449, '2', 'Kenyatta', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1450, '3', 'Harambee ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1451, '4', 'Hill ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1452, '5', 'Busia ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1453, '6', 'Kiambu', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1454, '7', 'Meru ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1455, '8', 'Karatina ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1456, '9', 'Narok ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1457, '10', 'Kisii ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1458, '11', 'Malindi ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1459, '12', 'Nyeri ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1460, '13', 'Kitale ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1461, '15', 'Eastleigh', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1462, '16', 'Limuru ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1463, '17', 'Kitui ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1464, '18', 'Molo ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1465, '19', 'Bungoma ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1466, '20', 'Nkrumah', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1467, '21', 'Kapsabet ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1468, '22', 'Awendo ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1469, '23', 'Portway-msa ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1470, '25', 'Hospital Br. ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1471, '26', 'Ruiru ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1472, '27', 'Ongata Rongai ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1473, '28', 'Embu ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1474, '29', 'Kakamega ', '38', 1, '2017-04-21 18:22:13', '2017-04-21 18:22:13'),
(1475, '30', 'Nakuru ', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1476, '31', 'Ukunda ', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1477, '32', 'Upper Hill ', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1478, '33', 'Nandi Hills ', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1479, '34', 'Migori ', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1480, '35', 'Westlands ', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1481, '36', 'Times Tower', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1482, '37', 'Maua', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1483, '38', 'WILSON AIRPORT', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1484, '39', 'J.K.I.A.', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1485, '40', 'Eldoret ', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1486, '41', 'MOIS BRIDGE', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1487, '42', 'MUTOMO', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1488, '43', 'KIANJAI', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1489, '44', 'KENYATTA UNIVERSITY', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1490, '45', 'ST PAULS UNIVERSITY', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1491, '46', 'MOI UNIVERSITY ELDORET', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1492, '47', 'MOI INT AIRPORT MOMBASA', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1493, '48', 'Machakos', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1494, '49', 'Kitengela', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1495, '50', 'Kisumu ', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1496, '51', 'Mtwapa', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1497, '52', 'Changamwe', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1498, '53', 'Garissa', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1499, '54', 'Thika', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1500, '55', 'Momasa Polytechnic University College', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1501, '56', 'Bomet', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1502, '58', 'Greenspan', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1503, '59', 'Sameer Park', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1504, '60', 'SEKU', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1505, '61', 'Ngong Road', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1506, '62', 'Moi Avenue', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1507, '63', 'Mountain Mall', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1508, '65', 'Nyali Centre', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1509, '66', 'Kilifi', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1510, '67', 'South C Branch- KEBS', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1511, '68', 'Kericho', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1512, '70', 'Isiolo', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1513, '71', 'South C - Red Cross', '38', 1, '2017-04-21 18:22:14', '2017-04-21 18:22:14'),
(1514, '72', 'National Bank Premium Banking Kisumu', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1515, '73', 'Yaya Centre', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1516, '74', 'Gigiri', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1517, '93', 'Wajir', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1518, '94', 'Bondeni', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1519, '95', 'Lunga Lunga', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1520, '96', 'Mandera', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1521, '98', 'Card Centre ', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1522, '99', 'Head Office', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1523, '198', 'Central CLearing Centre', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1524, '200', 'Head Office Amanah', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1525, '201', 'Card Centre Amanah', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1526, '202', 'Eastleigh Amanah', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1527, '203', 'Kenyatta Ave Amanah', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1528, '204', 'Wajir Amanah', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1529, '205', 'Bondeni Amanah', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1530, '206', 'Garissa Amanah', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1531, '207', 'Mandera Amanah', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1532, '208', 'Isiolo Amanah', '38', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1533, '0', 'Head Office', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1534, '101', 'City Centre', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1535, '102', 'NIC House', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1536, '103', 'Harbour House ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1537, '104', 'Head Office-Fargo', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1538, '105', 'Westlands ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1539, '106', 'The Junction Br. ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1540, '107', 'Nakuru ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1541, '108', 'Nyali ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1542, '109', 'Nkrumah Road ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1543, '110', 'Harambee ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1544, '111', 'Prestige - Ngong Road ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1545, '112', 'Kisumu ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1546, '113', 'Thika ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1547, '114', 'Meru', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1548, '115', 'Galleria (bomas ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1549, '116', 'ELDORET', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1550, '117', 'VILLAGE MARKET', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1551, '118', 'SAMEER PARK', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1552, '119', 'Karen', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1553, '121', 'Taj Mall', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1554, '122', 'ABC', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1555, '123', 'Thika Road Mall ', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1556, '124', 'Changamwe Branch', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1557, '125', 'Kenyatta Avenue', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1558, '126', 'Riverside', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1559, '127', 'Machakos', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1560, '128', 'Lunga Lunga', '39', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1561, '0', 'Head Office ', '40', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1562, '1', 'Koinange Street ', '40', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1563, '3', 'Nakuru ', '40', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1564, '4', 'Nakuru ', '40', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1565, '5', 'Eldoret ', '40', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1566, '6', 'Kitale ', '40', 1, '2017-04-21 18:22:15', '2017-04-21 18:22:15'),
(1567, '7', 'Westlands ', '40', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1568, '8', 'Nakumatt Mega', '40', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1569, '9', 'Thika Road Mall', '40', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1570, '10', 'Mombasa', '40', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1571, '0', 'Head Office ', '41', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1572, '1', 'Westlands ', '41', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1573, '2', 'Parklands ', '41', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1574, '3', 'Koinange Street ', '41', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1575, '4', 'Mombasa ', '41', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1576, '6', 'Eldoret', '41', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1577, '7', 'Industrial Area', '41', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1578, '0', 'H/o Riverside ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1579, '1', 'Kenindia ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1580, '2', 'Biashara ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1581, '3', 'Mombasa ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1582, '4', 'Westlands ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1583, '5', 'Industrial Area ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1584, '6', 'Kisumu ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1585, '7', 'Parklands ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1586, '8', 'Riverside Drive ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1587, '9', 'Card Centre ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1588, '10', 'Hurlingham ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1589, '11', 'Capital Centre ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1590, '12', 'Nyali ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1591, '14', 'Kamukunji ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1592, '15', 'Eldoret', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1593, '16', 'Karen ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1594, '17', 'Nakuru ', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1595, '18', 'Gigiri', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1596, '19', 'Thika', '42', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1597, NULL, 'Head Office', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1598, NULL, 'Kenyatta Market', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1599, NULL, 'Karen', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1600, NULL, 'Tom Mboya', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1601, NULL, 'Ngong', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1602, NULL, 'Wote - Makueni ', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1603, NULL, 'Machakos', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1604, NULL, 'Ongata Rongai', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1605, NULL, 'Kibwezi', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1606, NULL, 'Athi River', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1607, NULL, 'Emali', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1608, NULL, 'Mlolongo', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1609, NULL, 'Kajiado', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1610, NULL, 'Westlands', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1611, NULL, 'Ngara', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1612, NULL, 'Uthiru', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1613, NULL, 'Kikuyu', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1614, NULL, 'Limuru', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1615, NULL, 'Adams Arcade', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1616, NULL, 'Kitengela', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1617, NULL, 'Karuri', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1618, NULL, 'Kawangware', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1619, NULL, 'Ruiru', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1620, NULL, 'Githurai', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1621, NULL, 'Mwingi', '43', 1, '2017-04-21 18:22:16', '2017-04-21 18:22:16'),
(1622, NULL, 'Eastleigh', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1623, NULL, 'Thika', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1624, NULL, 'Kiambu', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1625, NULL, 'Garissa', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1626, NULL, 'Matuu', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1627, NULL, 'Dandora', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1628, NULL, 'Afya Center', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1629, NULL, 'Cannon House', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1630, NULL, 'Viwandani', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1631, NULL, 'Kitui', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1632, NULL, 'Ronald Ngala', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1633, NULL, 'Enterprise Post Office', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1634, NULL, 'Jogoo Road', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1635, NULL, 'Nacico', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1636, NULL, 'Kangundo', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1637, NULL, 'Kenyatta', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1638, NULL, 'Kariobangi', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1639, NULL, 'Nakuru', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1640, NULL, 'Naivasha', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1641, NULL, 'Narok', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1642, NULL, 'Eldoret', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1643, NULL, 'Kapsabet', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1644, NULL, 'Molo', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1645, NULL, 'Kabarnet', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1646, NULL, 'Nandi Hills', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1647, NULL, 'Kitale', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1648, NULL, 'Gilgil', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1649, NULL, 'Kapenguria', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1650, NULL, 'Nyahururu', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1651, NULL, 'Lodwar', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1652, NULL, 'Eldama Ravine', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1653, NULL, 'Maralal', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1654, NULL, 'Iten', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1655, NULL, 'Kisumu', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1656, NULL, 'Kakamega', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1657, NULL, 'Bungoma', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1658, NULL, 'HomaBay', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1659, NULL, 'Busia', '43', 1, '2017-04-21 18:22:17', '2017-04-21 18:22:17'),
(1660, NULL, 'Mumias', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1661, NULL, 'Siaya', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1662, NULL, 'Kisii', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1663, NULL, 'Webuye', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1664, NULL, 'Suna Migori', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1665, NULL, 'Sare Awendo', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1666, NULL, 'Luanda', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1667, NULL, 'Keroka', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1668, NULL, 'Kehancha', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1669, NULL, 'Nyamira', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1670, NULL, 'Bomet', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1671, NULL, 'Kericho', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1672, NULL, 'Mbale', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1673, NULL, 'Oyugis', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1674, NULL, 'Mbita', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1675, NULL, 'Bondo', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1676, NULL, 'Chaani', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1677, NULL, 'Ukunda', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1678, NULL, 'Voi', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1679, NULL, 'Kilifi', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1680, NULL, 'Likoni', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1681, NULL, 'Mombasa', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1682, NULL, 'Moi Avenue', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1683, NULL, 'Malindi', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1684, NULL, 'Mtwapa', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1685, NULL, 'Kisauni', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1686, NULL, 'Mariakani', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1687, NULL, 'Taveta', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1688, NULL, 'Watamu', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1689, NULL, 'Kerugoya', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1690, NULL, 'Embu', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1691, NULL, 'Meru', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1692, NULL, 'Nanyuki', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1693, NULL, 'Muranga', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1694, NULL, 'Nyeri', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1695, NULL, 'Karatina', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1696, NULL, 'Chuka', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1697, NULL, 'Wanguru', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1698, NULL, 'Maua', '43', 1, '2017-04-21 18:22:18', '2017-04-21 18:22:18'),
(1699, NULL, 'Isiolo', '43', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1700, '0', 'Eldoret ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1701, '1', 'Kericho ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1702, '2', 'Kisumu ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1703, 's', 'Kitale ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1704, '4', 'Treasury Square ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1705, '5', 'Kilindini ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1706, '6', 'Kenyatta Avenue ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1707, '8', 'Moi Avenue ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1708, '9', 'Nakuru ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1709, '10', 'Nanyuki ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1710, '11', 'Nyeri ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1711, '12', 'Thika ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1712, '15', 'Westlands ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1713, '16', 'Machakos ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1714, '17', 'Meru ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1715, '19', 'Harambee Avenue ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1716, '20', 'Kiambu ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1717, '53', 'Industrial Area ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1718, '54', 'Kakamega ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1719, '60', 'Malindi ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1720, '64', 'Koinage', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1721, '71', 'Yaya Centre Branch ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1722, '72', 'Ruaraka ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1723, '73', 'Langata ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1724, '74', 'Makupa ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1725, '75', 'Karen ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1726, '76', 'Muthaiga ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1727, '78', 'C.o.u ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1728, '79', 'Ukay ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1729, '80', 'Eastleigh ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1730, '81', 'Kisii ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1731, '82', 'Upper Hill Branch ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1732, '83', 'Nyali ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1733, '84', 'Chiromo', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1734, '85', 'Greenspan', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1735, '86', 'The T-Mall', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1736, '87', 'The Junction', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1737, '89', 'Kitengela', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1738, '90', 'Bungoma ', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1739, '91', 'Thika Road Mall', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1740, '92', 'UN Gigiri', '44', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1741, '1', 'Head Office ', '45', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1742, '2', 'Mombasa ', '45', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1743, '3', 'Eldoret ', '45', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1744, '4', 'Nakuru ', '45', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1745, '5', 'Mia ', '45', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1746, '6', 'Jkia ', '45', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1747, '7', 'Kirinyaga Rd Nakuru ', '45', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1748, '8', 'Kabarak ', '45', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1749, '9', 'Olenguruone ', '45', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1750, '10', 'Kericho ', '45', 1, '2017-04-21 18:22:19', '2017-04-21 18:22:19'),
(1751, '11', 'Nandi Hills', '45', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1752, '12', 'Epz ', '45', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1753, '13', 'Sheikh Karume ', '45', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1754, '14', 'Kabarnet ', '45', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1755, '15', 'Kitale', '45', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1756, '16', 'Narok', '45', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1757, '17', 'Bomet', '45', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1758, '18', 'Iten', '45', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1759, '1', 'Westlands ', '46', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1760, '2', 'Enterprise Road ', '46', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1761, '3', 'Upper Hill ', '46', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1762, '99', 'Head Office ', '46', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1763, '1', 'Victoria Towers, Upperhill', '47', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1764, '2', 'Riverside Drive', '47', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1765, '3', 'Lunga Lunga Square', '47', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1766, '0', 'Head Office', '48', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1767, '1', 'City Centre', '48', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1768, '2', 'Westlands', '48', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1769, '3', 'Industrial Area ', '48', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1770, '4', 'Diani', '48', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1771, '5', 'Malindi', '48', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1772, '6', 'Mombasa', '48', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1773, '7', 'Changamwe', '48', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1774, '8', 'Kilimani ', '48', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1775, '9', 'New Muthaiga', '48', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1776, '10', 'Nyali', '48', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1777, '0', 'Longonot Place - Kijabe Street', '49', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1778, '2', 'Mombasa', '49', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1779, '3', 'Ngong', '49', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1780, '4', 'Uhuru H/way', '49', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1781, '5', 'Westlands', '49', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1782, '6', 'Village Market', '49', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1783, '7', 'Nyali', '49', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1784, '8', 'Likoni', '49', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20'),
(1785, '9', 'Mega city', '49', 1, '2017-04-21 18:22:20', '2017-04-21 18:22:20');

-- --------------------------------------------------------

--
-- Table structure for table `benefitsettings`
--

CREATE TABLE `benefitsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `benefit_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Head Office', NULL, '2017-03-18 08:09:24', '2017-03-18 08:09:24'),
(2, 'Embassy Hotel', 1, '2017-07-12 06:17:40', '2017-07-12 06:17:40');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, '\r\nScheme Summary', NULL, NULL, NULL),
(2, 'Scheme Membership Statistics', NULL, NULL, NULL),
(4, 'List of New Entrants', NULL, NULL, NULL),
(5, 'Reinstated Members', NULL, NULL, NULL),
(6, 'Deferred Members', NULL, NULL, NULL),
(7, 'Fund Contribution', NULL, NULL, NULL),
(8, 'Withdrawals', NULL, NULL, NULL),
(9, 'Expenses', NULL, NULL, NULL),
(10, 'Compliance', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `citizenships`
--

CREATE TABLE `citizenships` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `citizenships`
--

INSERT INTO `citizenships` (`id`, `name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Kenyan', 1, '2017-03-20 10:31:31', '2017-03-20 10:31:31'),
(2, 'Ugandan', 1, '2017-10-25 10:48:40', '2017-10-25 10:48:40');

-- --------------------------------------------------------

--
-- Table structure for table `company_property`
--

CREATE TABLE `company_property` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `property_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_description` text COLLATE utf8_unicode_ci,
  `property_serial_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_digital_serial_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issued_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_issue_date` date NOT NULL,
  `property_return_date` date NOT NULL,
  `property_amount` double(15,2) NOT NULL DEFAULT '0.00',
  `returned` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `received_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `shortname`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Kenyan Shillings', 'KES', NULL, '2017-03-18 08:09:24', '2017-03-18 08:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` int(10) UNSIGNED NOT NULL,
  `deduction_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`id`, `deduction_name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Salary Advance', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Loans', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Savings', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Breakages and spoilages', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `codes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `codes`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Information Technology', '001', 1, '0000-00-00 00:00:00', '2017-10-27 14:26:43'),
(2, 'Management', '003', 1, '0000-00-00 00:00:00', '2017-10-27 14:30:23'),
(3, 'Marketing', '', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Finance', '', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Human Resource', '', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'House Keeping', '002', 1, '2017-07-12 06:19:16', '2017-07-12 06:19:16'),
(7, 'bla', '12', 1, '2017-10-25 11:19:05', '2017-10-25 11:19:05');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `document_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `document_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `employee_id`, `document_name`, `document_path`, `description`, `created_at`, `updated_at`) VALUES
(4, 5, 'KCPE Cert.doc', '1508947209-Account_Opening-Board_Resolution.doc', NULL, '2017-10-25 13:00:09', '2017-10-25 13:00:09'),
(5, 5, 'KSCE Cert.sql', '1508947209-afyapepe.sql', NULL, '2017-10-25 13:00:09', '2017-10-25 13:00:09'),
(6, 5, 'Bachelor Degree.sql', '1508947209-banks.sql', NULL, '2017-10-25 13:00:09', '2017-10-25 13:00:09'),
(20, 1, 'Bla.xls', '1509107193-Active Employee Report.xls', 'bla', '2017-10-27 12:26:33', '2017-10-27 12:26:33');

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `earning_id` int(11) NOT NULL,
  `narrative` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `formular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instalments` int(11) NOT NULL,
  `earnings_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `earning_date` date NOT NULL,
  `first_day_month` date NOT NULL,
  `last_day_month` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `earnings`
--

INSERT INTO `earnings` (`id`, `employee_id`, `earning_id`, `narrative`, `formular`, `instalments`, `earnings_amount`, `earning_date`, `first_day_month`, `last_day_month`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '', 'One Time', 0, '300.00', '2017-06-01', '2017-06-01', '2017-06-30', '2017-06-02 13:57:42', '2017-06-02 13:57:42'),
(2, 1, 1, 'Employee of the Month', 'One Time', 0, '10000.00', '2017-06-01', '2017-06-01', '2017-06-30', '2017-06-29 09:42:57', '2017-06-29 09:42:57'),
(3, 2, 1, 'Manager Bonus', 'One Time', 0, '20000.00', '2017-06-01', '2017-06-01', '2017-06-30', '2017-06-29 09:43:26', '2017-06-29 09:43:26');

-- --------------------------------------------------------

--
-- Table structure for table `earningsettings`
--

CREATE TABLE `earningsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `earning_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `earningsettings`
--

INSERT INTO `earningsettings` (`id`, `earning_name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Bonus', 1, '2017-06-29 09:42:35', '2017-06-29 09:42:35'),
(3, 'Commission', 1, '2017-10-27 17:13:01', '2017-10-27 17:13:01');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` int(10) UNSIGNED NOT NULL,
  `education_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `education_name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Primary School', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Secondary School', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'College - Certificate', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'College - Diploma', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Degree', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Masters Degree', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'PHD', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'None', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Cisco Certification', 1, '2017-10-27 09:18:39', '2017-10-27 09:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `emergencycontacts`
--

CREATE TABLE `emergencycontacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relationship` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `same_address_employee` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `county` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cellular_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_road` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landmark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `personal_file_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `passport_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `basic_pay` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `vol_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `pin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `social_security_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_insurance_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_permit_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `department_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `job_group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marital_status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yob` date DEFAULT NULL,
  `citizenship` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `income_tax_applicable` int(11) NOT NULL DEFAULT '0',
  `income_tax_relief_applicable` int(11) NOT NULL DEFAULT '0',
  `hospital_insurance_applicable` int(11) NOT NULL DEFAULT '0',
  `social_security_applicable` int(11) NOT NULL DEFAULT '0',
  `mode_of_payment` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_id` int(10) UNSIGNED DEFAULT '0',
  `bank_branch_id` int(11) DEFAULT NULL,
  `citizenship_id` int(11) DEFAULT NULL,
  `bank_account_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_eft_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `swift_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_clock_rate_normal` double(15,2) NOT NULL DEFAULT '0.00',
  `day_clock_rate_normal` double(15,2) NOT NULL DEFAULT '0.00',
  `time_clock_rate_weekday` double(15,2) NOT NULL DEFAULT '0.00',
  `day_clock_rate_weekday` double(15,2) NOT NULL DEFAULT '0.00',
  `time_clock_rate_saturday` double(15,2) NOT NULL DEFAULT '0.00',
  `day_clock_rate_saturday` double(15,2) NOT NULL DEFAULT '0.00',
  `time_clock_rate_sunday` double(15,2) NOT NULL DEFAULT '0.00',
  `day_clock_rate_sunday` double(15,2) NOT NULL DEFAULT '0.00',
  `time_clock_rate_holiday` double(15,2) NOT NULL DEFAULT '0.00',
  `day_clock_rate_holiday` double(15,2) NOT NULL DEFAULT '0.00',
  `medical_smoker` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medical_blood_group` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medical_disabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medical_conditions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_office` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_personal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone_office` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone_extension_office` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone_mobile` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_zip` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_joined` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bf_leave_days` int(11) NOT NULL DEFAULT '0',
  `annual_leave_days` int(11) NOT NULL DEFAULT '0',
  `custom_field1` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `in_employment` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `organization_id`, `personal_file_number`, `first_name`, `last_name`, `middle_name`, `identity_number`, `passport_number`, `basic_pay`, `vol_amount`, `pin`, `social_security_number`, `hospital_insurance_number`, `work_permit_number`, `job_title`, `branch_id`, `department_id`, `job_group_id`, `type_id`, `photo`, `signature`, `gender`, `marital_status`, `yob`, `citizenship`, `education_type_id`, `income_tax_applicable`, `income_tax_relief_applicable`, `hospital_insurance_applicable`, `social_security_applicable`, `mode_of_payment`, `bank_id`, `bank_branch_id`, `citizenship_id`, `bank_account_number`, `bank_eft_code`, `swift_code`, `time_clock_rate_normal`, `day_clock_rate_normal`, `time_clock_rate_weekday`, `day_clock_rate_weekday`, `time_clock_rate_saturday`, `day_clock_rate_saturday`, `time_clock_rate_sunday`, `day_clock_rate_sunday`, `time_clock_rate_holiday`, `day_clock_rate_holiday`, `medical_smoker`, `medical_blood_group`, `medical_disabilities`, `medical_conditions`, `email_office`, `email_personal`, `telephone_office`, `telephone_extension_office`, `telephone_mobile`, `postal_address`, `postal_zip`, `date_joined`, `bf_leave_days`, `annual_leave_days`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `start_date`, `end_date`, `in_employment`, `created_at`, `updated_at`) VALUES
(1, 1, 'NSL.1', 'Xavier', 'Ikachai', '', '33433588', NULL, '9000.00', '0.00', 'A009673824B', '2012491326', '6320237', NULL, 'Steward', 2, 6, 1, 1, 'default_photo.png', 'sign_av.jpg', 'male', 'Single', '1995-08-12', NULL, 4, 0, 0, 1, 1, 'Bank', 12, 470, 1, '01116620144900', NULL, 'KCOOKENA', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 'ikachaixaviour@gmail.com', 'ikachaixaviour@gmail.com', NULL, NULL, '0792173434', '', '254', '01-Jun-2017', 0, 0, '', NULL, NULL, NULL, '0000-00-00', '0000-00-00', 'Y', '2017-07-12 11:23:49', '2017-07-12 11:23:49'),
(5, 1, 'PL.2', 'Test', 'Test', 'Test', '1234', NULL, '50000.00', '0.00', '12313', '12312312', '1312321', '33223', 'Software Developer', 1, 1, 1, 1, '1508944486-2Hi9agvAFTFm.jpg', '1508944486-bmpg2vI6zqpK.png', 'female', 'Married', '1985-01-01', NULL, 5, 1, 1, 1, 1, 'Bank', 19, 786, 1, '26237482', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 'ken.wango@lixnet.net', 'wangoken2@gmail.com', NULL, NULL, '0725145304', NULL, NULL, '13-Jul-2015', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', '2017-10-25 12:14:46', '2017-10-25 12:57:14');

-- --------------------------------------------------------

--
-- Table structure for table `employeebenefits`
--

CREATE TABLE `employeebenefits` (
  `id` int(10) UNSIGNED NOT NULL,
  `jobgroup_id` int(10) UNSIGNED NOT NULL,
  `benefit_id` int(10) UNSIGNED NOT NULL,
  `amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employeenontaxables`
--

CREATE TABLE `employeenontaxables` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `nontaxable_id` int(10) UNSIGNED NOT NULL,
  `formular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instalments` int(11) DEFAULT '0',
  `nontaxable_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `nontaxable_date` date NOT NULL,
  `first_day_month` date NOT NULL,
  `last_day_month` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_allowances`
--

CREATE TABLE `employee_allowances` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `allowance_id` int(10) UNSIGNED NOT NULL,
  `formular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instalments` int(11) DEFAULT '0',
  `allowance_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `allowance_date` date NOT NULL,
  `first_day_month` date NOT NULL,
  `last_day_month` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_allowances`
--

INSERT INTO `employee_allowances` (`id`, `employee_id`, `allowance_id`, `formular`, `instalments`, `allowance_amount`, `allowance_date`, `first_day_month`, `last_day_month`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Recurring', 1, '10000.00', '2017-06-01', '2017-06-01', '2017-06-30', '2017-06-29 09:44:01', '2017-06-29 09:44:01'),
(2, 2, 2, 'Recurring', 1, '5000.00', '2017-06-01', '2017-06-01', '2017-06-30', '2017-06-29 09:44:31', '2017-06-29 09:44:31');

-- --------------------------------------------------------

--
-- Table structure for table `employee_deductions`
--

CREATE TABLE `employee_deductions` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `deduction_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `formular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instalments` int(11) DEFAULT '0',
  `deduction_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `deduction_date` date NOT NULL,
  `first_day_month` date NOT NULL,
  `last_day_month` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_deductions`
--

INSERT INTO `employee_deductions` (`id`, `employee_id`, `deduction_id`, `formular`, `instalments`, `deduction_amount`, `deduction_date`, `first_day_month`, `last_day_month`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'One Time', 0, '1000.00', '2017-06-02', '2017-06-01', '2017-06-30', '2017-06-02 14:00:15', '2017-06-02 14:00:15'),
(2, 3, 1, 'One Time', 0, '2000.00', '2017-06-01', '2017-06-01', '2017-06-30', '2017-06-29 09:44:57', '2017-06-29 09:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `employee_relief`
--

CREATE TABLE `employee_relief` (
  `id` int(10) UNSIGNED NOT NULL,
  `relief_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `employee_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `relief_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_type`
--

CREATE TABLE `employee_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_type`
--

INSERT INTO `employee_type` (`id`, `employee_type_name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Full Time', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Contract', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Internship', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospital_insurance`
--

CREATE TABLE `hospital_insurance` (
  `id` int(10) UNSIGNED NOT NULL,
  `income_from` double(15,2) NOT NULL DEFAULT '0.00',
  `income_to` double(15,2) NOT NULL DEFAULT '0.00',
  `hi_amount` double(15,2) NOT NULL DEFAULT '0.00',
  `organization_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hospital_insurance`
--

INSERT INTO `hospital_insurance` (`id`, `income_from`, `income_to`, `hi_amount`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 0.00, 0.00, 0.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1.00, 5999.00, 150.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 6000.00, 7999.00, 300.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 8000.00, 11999.00, 400.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 12000.00, 14999.00, 500.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 15000.00, 19999.00, 600.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 20000.00, 24999.00, 750.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 25000.00, 29999.00, 850.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 30000.00, 34999.00, 900.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 35000.00, 39999.00, 950.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 40000.00, 44999.00, 1000.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 45000.00, 49999.00, 1100.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 50000.00, 59999.00, 1200.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 60000.00, 69999.00, 1300.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 70000.00, 79999.00, 1400.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 80000.00, 89999.00, 1500.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 90000.00, 99999.00, 1600.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 100000.00, 99000000.00, 1700.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `job_group`
--

CREATE TABLE `job_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job_group`
--

INSERT INTO `job_group` (`id`, `job_group_name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Junior Staff', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Management', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Marketing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Finance', 1, '2017-10-25 15:52:11', '2017-10-25 15:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `trans_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `amount` float(10,0) NOT NULL,
  `initiated_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `void` tinyint(1) DEFAULT '0',
  `organization_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `date`, `trans_no`, `account_id`, `amount`, `initiated_by`, `type`, `description`, `created_at`, `updated_at`, `void`, `organization_id`) VALUES
(1, '2017-03-30', '1490871824', 1, 2241, 'superadmin', 'credit', 'LLL', '2017-03-30 21:33:44', '2017-03-30 21:33:44', 0, NULL),
(2, '2017-03-30', '1490871824', 1, 2241, 'superadmin', 'debit', 'LLL', '2017-03-30 21:33:44', '2017-03-30 21:33:44', 0, NULL),
(3, '2017-04-01', '1492776272', 1, 800, 'superadmin', 'credit', 'Office Glasses', '2017-04-21 22:37:32', '2017-04-21 22:37:32', 0, NULL),
(4, '2017-04-01', '1492776272', 1, 800, 'superadmin', 'debit', 'Office Glasses', '2017-04-21 22:37:32', '2017-04-21 22:37:32', 0, NULL),
(5, '2017-04-01', '1492776288', 1, 0, 'superadmin', 'credit', 'Juice Glasses', '2017-04-21 22:38:48', '2017-04-21 22:38:48', 0, NULL),
(6, '2017-04-01', '1492776288', 1, 0, 'superadmin', 'debit', 'Juice Glasses', '2017-04-21 22:38:48', '2017-04-21 22:38:48', 0, NULL),
(7, '2017-04-21', '1492776245', 1, 340, 'superadmin', 'credit', 'Juice Glasses', '2017-04-21 22:43:05', '2017-04-21 22:43:05', 0, NULL),
(8, '2017-04-21', '1492776245', 1, 340, 'superadmin', 'debit', 'Juice Glasses', '2017-04-21 22:43:05', '2017-04-21 22:43:05', 0, NULL),
(9, '2017-04-01', '1492776291', 1, 210, 'superadmin', 'credit', '3 Dust Bins ', '2017-04-21 22:49:51', '2017-04-21 22:49:51', 0, NULL),
(10, '2017-04-01', '1492776291', 1, 210, 'superadmin', 'debit', '3 Dust Bins ', '2017-04-21 22:49:51', '2017-04-21 22:49:51', 0, NULL),
(11, '2017-04-01', '1492776285', 1, 600, 'superadmin', 'credit', 'Kitchen Towels', '2017-04-21 22:57:45', '2017-04-21 22:57:45', 0, NULL),
(12, '2017-04-01', '1492776285', 1, 600, 'superadmin', 'debit', 'Kitchen Towels', '2017-04-21 22:57:45', '2017-04-21 22:57:45', 0, NULL),
(13, '2017-04-01', '1492779890', 1, 0, 'superadmin', 'credit', 'Ariel Soap 10 Packets', '2017-04-21 23:00:50', '2017-04-21 23:00:50', 0, NULL),
(14, '2017-04-01', '1492779890', 1, 0, 'superadmin', 'debit', 'Ariel Soap 10 Packets', '2017-04-21 23:00:50', '2017-04-21 23:00:50', 0, NULL),
(15, '2017-04-21', '1492779854', 1, 2860, 'superadmin', 'credit', 'Ariel Detergent 10 Packets', '2017-04-21 23:02:14', '2017-04-21 23:02:14', 0, NULL),
(16, '2017-04-21', '1492779854', 1, 2860, 'superadmin', 'debit', 'Ariel Detergent 10 Packets', '2017-04-21 23:02:14', '2017-04-21 23:02:14', 0, NULL),
(17, '2017-04-01', '1492779879', 1, 690, 'superadmin', 'credit', 'Sunlight 3 Packets at Ksh 230 per Packet', '2017-04-21 23:04:39', '2017-04-21 23:04:39', 0, NULL),
(18, '2017-04-01', '1492779879', 1, 690, 'superadmin', 'debit', 'Sunlight 3 Packets at Ksh 230 per Packet', '2017-04-21 23:04:39', '2017-04-21 23:04:39', 0, NULL),
(19, '2017-04-01', '1492779848', 1, 400, 'superadmin', 'credit', '2 Cello tapes at 200 each', '2017-04-21 23:06:08', '2017-04-21 23:06:08', 0, NULL),
(20, '2017-04-01', '1492779848', 1, 400, 'superadmin', 'debit', '2 Cello tapes at 200 each', '2017-04-21 23:06:08', '2017-04-21 23:06:08', 0, NULL),
(21, '2017-04-01', '1492779876', 1, 950, 'superadmin', 'credit', '19 Pieces T/Duster at Ksh 50 each', '2017-04-21 23:08:36', '2017-04-21 23:08:36', 0, NULL),
(22, '2017-04-01', '1492779876', 1, 950, 'superadmin', 'debit', '19 Pieces T/Duster at Ksh 50 each', '2017-04-21 23:08:36', '2017-04-21 23:08:36', 0, NULL),
(23, '2017-04-01', '1492779891', 1, 1300, 'superadmin', 'credit', '2 pieces Bath towels at Ksh 650 each', '2017-04-21 23:10:51', '2017-04-21 23:10:51', 0, NULL),
(24, '2017-04-01', '1492779891', 1, 1300, 'superadmin', 'debit', '2 pieces Bath towels at Ksh 650 each', '2017-04-21 23:10:51', '2017-04-21 23:10:51', 0, NULL),
(25, '2017-04-01', '1492779874', 1, 2250, 'superadmin', 'credit', 'Rubber Gloves at Ksh 150 each', '2017-04-21 23:14:34', '2017-04-21 23:14:34', 0, NULL),
(26, '2017-04-01', '1492779874', 1, 2250, 'superadmin', 'debit', 'Rubber Gloves at Ksh 150 each', '2017-04-21 23:14:34', '2017-04-21 23:14:34', 0, NULL),
(27, '2017-04-01', '1492779888', 1, 360, 'superadmin', 'credit', '1 dozen Roller Mask', '2017-04-21 23:15:48', '2017-04-21 23:15:48', 0, NULL),
(28, '2017-04-01', '1492779888', 1, 360, 'superadmin', 'debit', '1 dozen Roller Mask', '2017-04-21 23:15:48', '2017-04-21 23:15:48', 0, NULL),
(29, '2017-04-01', '1492779841', 1, 2280, 'superadmin', 'credit', '1 Dozen Mop Buckets ', '2017-04-21 23:23:01', '2017-04-21 23:23:01', 0, NULL),
(30, '2017-04-01', '1492779841', 1, 2280, 'superadmin', 'debit', '1 Dozen Mop Buckets ', '2017-04-21 23:23:01', '2017-04-21 23:23:01', 0, NULL),
(31, '2017-04-01', '1492779845', 1, 3430, 'superadmin', 'credit', '14 Mop Sticks ', '2017-04-21 23:26:05', '2017-04-21 23:26:05', 0, NULL),
(32, '2017-04-01', '1492779845', 1, 3430, 'superadmin', 'debit', '14 Mop Sticks ', '2017-04-21 23:26:05', '2017-04-21 23:26:05', 0, NULL),
(33, '2017-04-01', '1492779860', 1, 300, 'superadmin', 'credit', '5 Buckets', '2017-04-21 23:28:20', '2017-04-21 23:28:20', 0, NULL),
(34, '2017-04-01', '1492779860', 1, 300, 'superadmin', 'debit', '5 Buckets', '2017-04-21 23:28:20', '2017-04-21 23:28:20', 0, NULL),
(35, '2017-04-01', '1492779876', 1, 110, 'superadmin', 'credit', 'One Pump', '2017-04-21 23:29:36', '2017-04-21 23:29:36', 0, NULL),
(36, '2017-04-01', '1492779876', 1, 110, 'superadmin', 'debit', 'One Pump', '2017-04-21 23:29:36', '2017-04-21 23:29:36', 0, NULL),
(37, '2017-04-01', '1492779864', 1, 280, 'superadmin', 'credit', 'One dozen of Paperbags ', '2017-04-21 23:31:24', '2017-04-21 23:31:24', 0, NULL),
(38, '2017-04-01', '1492779864', 1, 280, 'superadmin', 'debit', 'One dozen of Paperbags ', '2017-04-21 23:31:24', '2017-04-21 23:31:24', 0, NULL),
(39, '2017-04-01', '1492779842', 1, 195, 'superadmin', 'credit', '3 Hand Washing Brushes ', '2017-04-21 23:33:02', '2017-04-21 23:33:02', 0, NULL),
(40, '2017-04-01', '1492779842', 1, 195, 'superadmin', 'debit', '3 Hand Washing Brushes ', '2017-04-21 23:33:02', '2017-04-21 23:33:02', 0, NULL),
(41, '2017-04-01', '1492783492', 1, 700, 'superadmin', 'credit', 'Trays', '2017-04-22 00:51:52', '2017-04-22 00:51:52', 0, NULL),
(42, '2017-04-01', '1492783492', 1, 700, 'superadmin', 'debit', 'Trays', '2017-04-22 00:51:52', '2017-04-22 00:51:52', 0, NULL),
(43, '2017-04-01', '1492783485', 1, 390, 'superadmin', 'credit', 'Trays', '2017-04-22 00:52:45', '2017-04-22 00:52:45', 0, NULL),
(44, '2017-04-01', '1492783485', 1, 390, 'superadmin', 'debit', 'Trays', '2017-04-22 00:52:45', '2017-04-22 00:52:45', 0, NULL),
(45, '2017-04-01', '1492783493', 1, 3800, 'superadmin', 'credit', 'Air Freshners', '2017-04-22 00:55:53', '2017-04-22 00:55:53', 0, NULL),
(46, '2017-04-01', '1492783493', 1, 3800, 'superadmin', 'debit', 'Air Freshners', '2017-04-22 00:55:53', '2017-04-22 00:55:53', 0, NULL),
(47, '2017-04-01', '1492783489', 1, 250, 'superadmin', 'credit', 'Yellow Dusters', '2017-04-22 00:58:49', '2017-04-22 00:58:49', 0, NULL),
(48, '2017-04-01', '1492783489', 1, 250, 'superadmin', 'debit', 'Yellow Dusters', '2017-04-22 00:58:49', '2017-04-22 00:58:49', 0, NULL),
(49, '2017-04-21', '1492787068', 1, 200, 'superadmin', 'credit', 'Containers', '2017-04-22 01:07:28', '2017-04-22 01:07:28', 0, NULL),
(50, '2017-04-21', '1492787068', 1, 200, 'superadmin', 'debit', 'Containers', '2017-04-22 01:07:28', '2017-04-22 01:07:28', 0, NULL),
(51, '2017-04-01', '1492787078', 1, 700, 'superadmin', 'credit', 'Containers', '2017-04-22 01:09:38', '2017-04-22 01:09:38', 0, NULL),
(52, '2017-04-01', '1492787078', 1, 700, 'superadmin', 'debit', 'Containers', '2017-04-22 01:09:38', '2017-04-22 01:09:38', 0, NULL),
(53, '2017-04-01', '1492787071', 1, 240, 'superadmin', 'credit', 'Carton', '2017-04-22 01:10:31', '2017-04-22 01:10:31', 0, NULL),
(54, '2017-04-01', '1492787071', 1, 240, 'superadmin', 'debit', 'Carton', '2017-04-22 01:10:31', '2017-04-22 01:10:31', 0, NULL),
(55, '2017-04-01', '1492787048', 1, 1750, 'superadmin', 'credit', 'Hard or Soft Broom', '2017-04-22 01:17:08', '2017-04-22 01:17:08', 0, NULL),
(56, '2017-04-01', '1492787048', 1, 1750, 'superadmin', 'debit', 'Hard or Soft Broom', '2017-04-22 01:17:08', '2017-04-22 01:17:08', 0, NULL),
(57, '2017-04-01', '1492787092', 1, 1250, 'superadmin', 'credit', 'Cob web remover', '2017-04-22 01:18:52', '2017-04-22 01:18:52', 0, NULL),
(58, '2017-04-01', '1492787092', 1, 1250, 'superadmin', 'debit', 'Cob web remover', '2017-04-22 01:18:52', '2017-04-22 01:18:52', 0, NULL),
(59, '2017-04-27', '1493276658', 1, 3000, 'superadmin', 'credit', 'Valve', '2017-04-27 17:01:18', '2017-04-27 17:01:18', 0, NULL),
(60, '2017-04-27', '1493276658', 1, 3000, 'superadmin', 'debit', 'Valve', '2017-04-27 17:01:18', '2017-04-27 17:01:18', 0, NULL),
(61, '2017-04-27', '1493298296', 1, 3400, 'superadmin', 'credit', 'Black Catridge', '2017-04-27 23:49:56', '2017-04-27 23:49:56', 0, NULL),
(62, '2017-04-27', '1493298296', 1, 3400, 'superadmin', 'debit', 'Black Catridge', '2017-04-27 23:49:56', '2017-04-27 23:49:56', 0, NULL),
(63, '2017-05-25', '1495699539', 1, 1245, 'superadmin', 'credit', 'Purchase of mops', '2017-05-25 13:28:39', '2017-05-25 13:28:39', 0, NULL),
(64, '2017-05-25', '1495699539', 1, 1245, 'superadmin', 'debit', 'Purchase of mops', '2017-05-25 13:28:39', '2017-05-25 13:28:39', 0, NULL),
(65, '2017-05-25', '1495699540', 1, 498, 'superadmin', 'credit', 'mops', '2017-05-25 13:33:40', '2017-05-25 13:33:40', 0, NULL),
(66, '2017-05-25', '1495699540', 1, 498, 'superadmin', 'debit', 'mops', '2017-05-25 13:33:40', '2017-05-25 13:33:40', 0, NULL),
(67, '2017-05-29', '1496048746', 1, 3480000, 'superadmin', 'credit', 'Supply of high quality lessos', '2017-05-29 14:04:46', '2017-05-29 14:04:46', 0, NULL),
(68, '2017-05-29', '1496048746', 1, 3480000, 'superadmin', 'debit', 'Supply of high quality lessos', '2017-05-29 14:04:46', '2017-05-29 14:04:46', 0, NULL),
(69, '2017-05-29', '1496048735', 1, 3002080, 'superadmin', 'credit', 'Supply of high quality lessos', '2017-05-29 14:27:35', '2017-05-29 14:27:35', 0, NULL),
(70, '2017-05-29', '1496048735', 1, 3002080, 'superadmin', 'debit', 'Supply of high quality lessos', '2017-05-29 14:27:35', '2017-05-29 14:27:35', 0, NULL),
(71, '2017-06-21', '1498061205', 1, 0, 'superadmin', 'credit', 'Smaple', '2017-06-21 16:48:45', '2017-06-21 16:48:45', 0, NULL),
(72, '2017-06-21', '1498061205', 2, 0, 'superadmin', 'debit', 'Smaple', '2017-06-21 16:48:45', '2017-06-21 16:48:45', 0, NULL),
(73, '2017-06-28', '1498637188', 1, 27840, 'superadmin', 'credit', 'cdfvg', '2017-06-28 08:47:28', '2017-06-28 08:47:28', 0, NULL),
(74, '2017-06-28', '1498637188', 2, 27840, 'superadmin', 'debit', 'cdfvg', '2017-06-28 08:47:28', '2017-06-28 08:47:28', 0, NULL),
(75, '2017-06-28', '1498651605', 1, 2888, 'superadmin', 'credit', 'available', '2017-06-28 12:46:45', '2017-06-28 12:46:45', 0, NULL),
(76, '2017-06-28', '1498651605', 2, 2888, 'superadmin', 'debit', 'available', '2017-06-28 12:46:45', '2017-06-28 12:46:45', 0, NULL),
(77, '2017-06-29', '1498719989', 1, 1000, 'superadmin', 'credit', 'nggg', '2017-06-29 07:19:29', '2017-06-29 07:19:29', 0, NULL),
(78, '2017-06-29', '1498719989', 1, 1000, 'superadmin', 'debit', 'nggg', '2017-06-29 07:19:29', '2017-06-29 07:19:29', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leaveapplications`
--

CREATE TABLE `leaveapplications` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `application_date` date DEFAULT NULL,
  `applied_start_date` date DEFAULT NULL,
  `applied_end_date` date DEFAULT NULL,
  `leavetype_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_approved` date DEFAULT NULL,
  `date_rejected` date DEFAULT NULL,
  `date_amended` date DEFAULT NULL,
  `date_cancelled` date DEFAULT NULL,
  `approved_start_date` date DEFAULT NULL,
  `approved_end_date` date DEFAULT NULL,
  `actual_start_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `is_supervisor_approved` int(11) NOT NULL,
  `is_weekend` int(11) NOT NULL,
  `is_holiday` int(11) NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leaveapplications`
--

INSERT INTO `leaveapplications` (`id`, `employee_id`, `application_date`, `applied_start_date`, `applied_end_date`, `leavetype_id`, `status`, `date_approved`, `date_rejected`, `date_amended`, `date_cancelled`, `approved_start_date`, `approved_end_date`, `actual_start_date`, `actual_end_date`, `is_supervisor_approved`, `is_weekend`, `is_holiday`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-03-20', '2017-04-03', '2017-04-19', 1, 'rejected', NULL, '2017-10-26', '2017-10-26', '2017-10-26', NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2017-03-20 20:42:27', '2017-10-26 14:17:28'),
(2, 1, '2017-03-20', '2017-03-21', '2017-03-21', 2, 'amended', '2017-10-26', '2017-10-27', '2017-10-27', '2017-10-27', '2017-03-21', '2017-03-21', NULL, NULL, 0, 0, 0, 1, '2017-03-20 20:43:39', '2017-10-27 18:53:12'),
(3, 1, '2017-05-25', '2017-05-25', '2017-06-05', 4, 'cancelled', '2017-10-27', NULL, '2017-10-26', '2017-10-27', '2017-05-25', '2017-06-05', NULL, NULL, 0, 0, 0, 1, '2017-05-25 14:13:24', '2017-10-27 18:54:07'),
(4, 1, '2017-10-30', '2017-10-26', '2018-03-02', 3, 'rejected', '2017-10-26', '2017-10-27', '2017-10-26', '2017-10-27', '2017-10-30', '2018-03-02', NULL, NULL, 0, 0, 0, 1, '2017-10-26 09:12:21', '2017-10-27 18:53:46');

-- --------------------------------------------------------

--
-- Table structure for table `leavetypes`
--

CREATE TABLE `leavetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `days` int(11) DEFAULT '0',
  `organization_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leavetypes`
--

INSERT INTO `leavetypes` (`id`, `name`, `days`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Annual', 21, 1, '2017-03-20 20:41:18', '2017-03-20 20:41:18'),
(2, 'Day off', 1, 1, '2017-03-20 20:42:46', '2017-03-20 20:42:46'),
(3, 'Maternity', 90, 1, '2017-10-26 12:09:23', '2017-10-26 12:09:23'),
(4, 'Paternity', 14, 1, '2017-10-26 16:20:49', '2017-10-26 16:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `mails`
--

CREATE TABLE `mails` (
  `id` int(10) UNSIGNED NOT NULL,
  `driver` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'smtp',
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encryption` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sender_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mails`
--

INSERT INTO `mails` (`id`, `driver`, `host`, `username`, `password`, `port`, `encryption`, `sender_name`, `created_at`, `updated_at`) VALUES
(1, 'smtp', NULL, NULL, NULL, NULL, '', NULL, '2017-03-18 08:09:24', '2017-03-18 08:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_06_29_104738_create_mails_table', 1),
('2015_11_12_192002_create_appraisalcategories_table', 1),
('2015_11_13_192002_create_appraisal_questions_table', 1),
('2015_11_13_192002_create_occurencesettings_table', 1),
('2015_11_13_192002_create_x_account_table', 1),
('2015_11_13_192002_create_x_accounts_table', 1),
('2015_11_13_192002_create_x_assigned_roles_table', 1),
('2015_11_13_192002_create_x_audits_table', 1),
('2015_11_13_192002_create_x_banking_table', 1),
('2015_11_13_192002_create_x_branches_table', 1),
('2015_11_13_192002_create_x_categories_table', 1),
('2015_11_13_192002_create_x_charge_loanproduct_table', 1),
('2015_11_13_192002_create_x_charge_savingproduct_table', 1),
('2015_11_13_192002_create_x_charges_table', 1),
('2015_11_13_192002_create_x_currencies_table', 1),
('2015_11_13_192002_create_x_groups_table', 1),
('2015_11_13_192002_create_x_journals_table', 1),
('2015_11_13_192002_create_x_kins_table', 1),
('2015_11_13_192002_create_x_loanaccounts_table', 1),
('2015_11_13_192002_create_x_loanguarantors_table', 1),
('2015_11_13_192002_create_x_loanpostings_table', 1),
('2015_11_13_192002_create_x_loanproducts_table', 1),
('2015_11_13_192002_create_x_loanrepayments_table', 1),
('2015_11_13_192002_create_x_loantransactions_table', 1),
('2015_11_13_192002_create_x_members_table', 1),
('2015_11_13_192002_create_x_orders_table', 1),
('2015_11_13_192002_create_x_organizations_table', 1),
('2015_11_13_192002_create_x_password_reminders_table', 1),
('2015_11_13_192002_create_x_permission_role_table', 1),
('2015_11_13_192002_create_x_permissions_table', 1),
('2015_11_13_192002_create_x_products_table', 1),
('2015_11_13_192002_create_x_roles_table', 1),
('2015_11_13_192002_create_x_savingaccounts_table', 1),
('2015_11_13_192002_create_x_savingpostings_table', 1),
('2015_11_13_192002_create_x_savingproducts_table', 1),
('2015_11_13_192002_create_x_savingtransactions_table', 1),
('2015_11_13_192002_create_x_shareaccounts_table', 1),
('2015_11_13_192002_create_x_shares_table', 1),
('2015_11_13_192002_create_x_sharetransactions_table', 1),
('2015_11_13_192002_create_x_supervisors_table', 1),
('2015_11_13_192002_create_x_tax_orders_table', 1),
('2015_11_13_192002_create_x_tax_table', 1),
('2015_11_13_192002_create_x_user_role_table', 1),
('2015_11_13_192002_create_x_users_table', 1),
('2015_11_13_192002_create_x_vendors_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_assigned_roles_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_charge_loanproduct_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_charge_savingproduct_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_journals_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_kins_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_loanaccounts_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_loanguarantors_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_loanpostings_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_loanrepayments_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_loantransactions_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_members_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_orders_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_permission_role_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_products_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_savingaccounts_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_savingpostings_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_savingtransactions_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_shareaccounts_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_sharetransactions_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_user_role_table', 1),
('2015_11_13_192006_add_foreign_keys_to_x_users_table', 1),
('2015_11_20_083755_create_autoprocesses_table', 1),
('2015_11_30_072830_create_employee_table', 1),
('2015_11_30_101925_create_departments_table', 1),
('2015_11_30_102341_create_job_group_table', 1),
('2015_11_30_103046_create_education_table', 1),
('2015_11_30_104021_create_employee_type_table', 1),
('2015_11_30_104621_create_bank_table', 1),
('2015_11_30_104621_create_budget_table', 1),
('2015_11_30_104621_create_expensesettings_table', 1),
('2015_11_30_105006_create_deductions_table', 1),
('2015_11_30_105006_create_nontaxables_table', 1),
('2015_11_30_105430_create_relief_table', 1),
('2015_11_30_105530_create_employee_relief_table', 1),
('2015_11_30_122642_create_earnings_table', 1),
('2015_11_30_125654_create_allowances_table', 1),
('2015_11_30_125654_create_benefitsettings_table', 1),
('2015_11_30_125654_create_citizenships_table', 1),
('2015_11_30_125654_create_earningsettings_table', 1),
('2015_11_30_131641_create_bank_branches_table', 1),
('2015_11_30_132013_create_employee_deductions_table', 1),
('2015_11_30_132807_create_transact_allowances_table', 1),
('2015_11_30_132807_create_transact_deductions_table', 1),
('2015_11_30_133021_create_transact_earnings_table', 1),
('2015_11_30_133337_create_transact_table', 1),
('2015_11_30_134419_create_documents_table', 1),
('2015_11_30_134623_create_next_of_kin_table', 1),
('2015_11_30_135019_create_company_property_table', 1),
('2015_12_02_060131_create_nssf_table', 1),
('2015_12_02_060202_create_nhif_table', 1),
('2015_12_11_073943_create_leavetypes_table', 1),
('2015_12_11_074541_create_holidays_table', 1),
('2015_12_11_075243_create_leaveapplications_table', 1),
('2015_12_17_092634_create_items_table', 1),
('2015_12_17_093206_create_clients_table', 1),
('2015_12_17_093509_create_paymentmethods_table', 1),
('2015_12_17_094052_create_locations_table', 1),
('2015_12_17_094633_create_expenses_table', 1),
('2015_12_17_095700_create_erporders_table', 1),
('2015_12_17_101046_create_erporderitems_table', 1),
('2015_12_17_104147_create_payments_table', 1),
('2015_12_17_104738_create_stocks_table', 1),
('2016_03_09_054131_create_tests_table', 1),
('2016_09_08_161324_add_comment_column_in_erporder', 1),
('2016_10_06_145141_add_x_ref_no_to_expenses_table', 1),
('2016_10_13_144052_create_bank_reconciliation_tables', 1),
('2016_10_24_230950_create_table_account_transactions', 1),
('2016_11_13_192002_create_employeebenefits_table', 1),
('2016_11_13_202002_create_appraisals_table', 1),
('2016_11_13_202002_create_emergency_contacts_table', 1),
('2016_11_17_140412_create_x_petty_cash_items_table', 1),
('2016_11_23_231625_create_x_expense_claims_tables', 1),
('2016_12_13_103925_create_asset_management_tables', 1),
('2016_12_20_174718_create_tasks_table', 1),
('2017_11_13_192002_create_properties_table', 1),
('2017_11_13_192002_create_x_occurences_table', 1),
('2017_11_13_202002_create_next_of_kins_table', 1),
('2017_11_30_122642_create_overtimes_table', 1),
('2017_11_30_130039_create_employee_allowances_table', 1),
('2017_11_30_132013_create_employeenontaxables_table', 1),
('2017_11_30_132807_create_transact_nontaxables_table', 1),
('2017_11_30_133021_create_transact_overtimes_table', 1),
('2017_11_30_133021_create_transact_reliefs_table', 1),
('2017_11_30_133337_create_transact_advances_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nextofkins`
--

CREATE TABLE `nextofkins` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relationship` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` text COLLATE utf8_unicode_ci,
  `goodwill` float(10,0) DEFAULT NULL,
  `id_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nextofkins`
--

INSERT INTO `nextofkins` (`id`, `first_name`, `middle_name`, `last_name`, `relationship`, `contact`, `goodwill`, `id_number`, `employee_id`, `created_at`, `updated_at`) VALUES
(7, 'George', 'Wachira', 'Wango', 'Father', '0722292106', NULL, '12345', 5, '2017-10-25 13:00:08', '2017-10-25 13:18:47'),
(8, 'Grace', NULL, 'Wanjiku', 'Mother', NULL, NULL, '54646', 5, '2017-10-25 13:00:09', '2017-10-25 13:00:09'),
(10, 'Test', 'Test', 'Test', 'Test', 'Test', NULL, '123123', 1, '2017-10-27 10:06:55', '2017-10-27 11:12:31'),
(12, 'Test', NULL, 'Test', NULL, NULL, NULL, NULL, 1, '2017-10-27 12:18:39', '2017-10-27 12:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `next_of_kin`
--

CREATE TABLE `next_of_kin` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `kin_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nontaxables`
--

CREATE TABLE `nontaxables` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nontaxables`
--

INSERT INTO `nontaxables` (`id`, `name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Refunds', 1, '2017-10-27 17:23:19', '2017-10-27 17:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `occurences`
--

CREATE TABLE `occurences` (
  `id` int(10) UNSIGNED NOT NULL,
  `occurence_brief` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `occurencesetting_id` int(10) UNSIGNED NOT NULL,
  `narrative` text COLLATE utf8_unicode_ci,
  `doc_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `occurence_date` date NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `occurences`
--

INSERT INTO `occurences` (`id`, `occurence_brief`, `employee_id`, `occurencesetting_id`, `narrative`, `doc_path`, `occurence_date`, `organization_id`, `created_at`, `updated_at`) VALUES
(2, 'Drunkardness', 1, 1, 'Come drunk', NULL, '2017-10-30', 1, '2017-10-26 15:14:47', '2017-10-26 15:14:47');

-- --------------------------------------------------------

--
-- Table structure for table `occurencesettings`
--

CREATE TABLE `occurencesettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `occurence_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `occurencesettings`
--

INSERT INTO `occurencesettings` (`id`, `occurence_type`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Job Lateness', 1, '2017-10-26 08:18:04', '2017-10-26 08:18:04'),
(2, 'Test', 1, '2017-10-26 08:24:14', '2017-10-26 08:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'XARA FINANCIALS',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kra_pin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nssf_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nhif_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_id` int(10) UNSIGNED DEFAULT '0',
  `bank_branch_id` int(10) UNSIGNED DEFAULT '0',
  `bank_account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `swift_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_license_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'evaluation',
  `erp_license_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'evaluation',
  `cbs_license_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'evaluation',
  `license_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_license_key` int(11) NOT NULL DEFAULT '0',
  `erp_license_key` int(11) NOT NULL DEFAULT '0',
  `cbs_license_key` int(11) NOT NULL DEFAULT '0',
  `erp_client_licensed` bigint(20) DEFAULT '10',
  `erp_item_licensed` bigint(20) DEFAULT '5',
  `payroll_licensed` bigint(20) DEFAULT '10',
  `cbs_licensed` bigint(20) DEFAULT '100',
  `payroll_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'P3110',
  `erp_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'E3110',
  `cbs_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'C3110',
  `payroll_support_period` date DEFAULT NULL,
  `erp_support_period` date DEFAULT NULL,
  `cbs_support_period` date DEFAULT NULL,
  `is_payroll_active` bigint(20) DEFAULT '0',
  `is_erp_active` bigint(20) DEFAULT '0',
  `is_cbs_active` bigint(20) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `logo`, `email`, `website`, `address`, `phone`, `kra_pin`, `nssf_no`, `nhif_no`, `bank_id`, `bank_branch_id`, `bank_account_number`, `swift_code`, `payroll_license_type`, `erp_license_type`, `cbs_license_type`, `license_code`, `payroll_license_key`, `erp_license_key`, `cbs_license_key`, `erp_client_licensed`, `erp_item_licensed`, `payroll_licensed`, `cbs_licensed`, `payroll_code`, `erp_code`, `cbs_code`, `payroll_support_period`, `erp_support_period`, `cbs_support_period`, `is_payroll_active`, `is_erp_active`, `is_cbs_active`, `created_at`, `updated_at`) VALUES
(1, 'PENSION LTD', 'JkSh4oB6lbv4.png', 'info@nedamservices.co.ke', 'www.nedamservices.co.ke', 'Nandi Road,Karen Shopping Centre\r\nP.O.BOX 3088-00506\r\nNairobi Kenya', '0722310178', 'P051202596D', '02106345', '51537', 19, 786, NULL, NULL, 'evaluation', 'evaluation', 'evaluation', NULL, 0, 0, 0, 10, 5, 10, 100, 'P3110', 'E3110', 'C3110', NULL, NULL, NULL, 0, 0, 0, '2017-03-18 08:09:24', '2017-10-21 07:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `overtimes`
--

CREATE TABLE `overtimes` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `period` float(15,2) NOT NULL,
  `formular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instalments` int(11) DEFAULT '0',
  `amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `overtime_date` date NOT NULL,
  `first_day_month` date NOT NULL,
  `last_day_month` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reminders`
--

CREATE TABLE `password_reminders` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pensions`
--

CREATE TABLE `pensions` (
  `id` int(11) NOT NULL,
  `payroll_no` int(11) NOT NULL,
  `employee_contribution` varchar(100) NOT NULL,
  `employer_contribution` varchar(100) NOT NULL,
  `employee_percentage` float DEFAULT NULL,
  `employer_percentage` float DEFAULT NULL,
  `interest` varchar(100) NOT NULL,
  `monthly_deduction` varchar(100) NOT NULL,
  `comments` text NOT NULL,
  `entered_by` varchar(100) NOT NULL,
  `month` varchar(20) NOT NULL,
  `year` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pensions`
--

INSERT INTO `pensions` (`id`, `payroll_no`, `employee_contribution`, `employer_contribution`, `employee_percentage`, `employer_percentage`, `interest`, `monthly_deduction`, `comments`, `entered_by`, `month`, `year`, `created_at`, `updated_at`) VALUES
(1, 1001, '3084', '2467', 0, 0, '', '5551', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1002, '1959', '1959', 0, 0, '', '3918', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1003, '2099', '1679', 0, 0, '', '3778', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1004, '6549', '5239', 0, 0, '', '11788', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1006, '2798', '2798', 0, 0, '', '5596', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1008, '5286', '4228', 0, 0, '', '9514', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1010, '4532', '3625', 0, 0, '', '8157', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1011, '2644', '2115', 0, 0, '', '4759', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1012, '7800', '6240', 0, 0, '', '14040', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1013, '4532', '3625', 0, 0, '', '8157', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1014, '1796', '1437', 0, 0, '', '3233', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 1016, '15696', '12557', 0, 0, '', '28253', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 1017, '2267', '1814', 0, 0, '', '4081', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 1018, '1666', '1333', 0, 0, '', '2999', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 1019, '13967', '11174', 0, 0, '', '25141', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 1024, '3915', '3915', 0, 0, '', '7830', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 1027, '6549', '5239', 0, 0, '', '11788', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 1030, '15696', '12557', 0, 0, '', '28253', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 1033, '4688', '3750', 0, 0, '', '8438', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 1035, '2115', '2115', 0, 0, '', '4230', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 1036, '1143', '1143', 0, 0, '17817', '20103', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 1037, '8852', '8852', 0, 0, '', '17704', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 1038, '2267', '1814', 0, 0, '', '4081', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 1039, '907', '907', 0, 0, '', '1814', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 1040, '1134', '907', 0, 0, '', '2041', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 1041, '1134', '907', 0, 0, '', '2041', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 1042, '6549', '5239', 0, 0, '', '11788', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 1044, '907', '907', 0, 0, '', '1814', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 1049, '1814', '1814', 0, 0, '', '3628', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 1052, '907', '907', 0, 0, '', '1814', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 1058, '1436.64', '1436.64', 0, 0, '', '2873.28', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 1059, '907.2', '907.2', 0, 0, '', '1814.4', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 1061, '1813.5', '1813.5', 0, 0, '', '3627', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 1063, '7432.2', '7432.2', 0, 0, '', '14864.4', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 1064, '16576.7', '9946.02', 0, 0, '', '26522.72', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 1066, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 1073, '3108', '3108', 0, 0, '', '6216', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 1074, '3108', '3108', 0, 0, '', '6216', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 1075, '2664.6', '2664.6', 0, 0, '', '5329.2', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 1076, '7878.18', '7878.18', 0, 0, '', '15756.36', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 1077, '7011.54', '7011.54', 0, 0, '', '14023.08', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 1081, '12556.56', '12556.56', 0, 0, '', '25113.12', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 1086, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 1088, '11175.3', '11175.3', 0, 0, '', '22350.6', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 1091, '5239.44', '5239.44', 0, 0, '', '10478.88', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 1092, '6614.64', '6614.64', 0, 0, '', '13229.28', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 1093, '7432', '7432', 0, 0, '', '14864', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 1098, '6240', '6240', 0, 0, '', '12480', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 1099, '1333', '1333', 0, 0, '', '2666', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 1100, '4663', '4663', 0, 0, '', '9326', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 1102, '4500', '4500', 0, 0, '', '9000', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 1108, '2467', '2467', 0, 0, '', '4934', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 1110, '8852', '8852', 0, 0, '', '17704', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 1112, '5554', '5554', 0, 0, '', '11108', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 1113, '6240', '6240', 0, 0, '', '12480', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 1119, '3915', '3915', 0, 0, '', '7830', '', '1', 'April', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 1001, '3084', '2467', 0, 0, '', '5551', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 1002, '1959', '1959', 0, 0, '', '3918', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 1003, '2099', '1679', 0, 0, '', '3778', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 1004, '6549', '5239', 0, 0, '', '11788', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 1006, '2798', '2798', 0, 0, '', '5596', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 1008, '5286', '4228', 0, 0, '', '9514', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 1010, '4532', '3625', 0, 0, '', '8157', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 1011, '2644', '2115', 0, 0, '', '4759', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 1012, '7800', '6240', 0, 0, '', '14040', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 1013, '4532', '3625', 0, 0, '', '8157', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 1014, '1796', '1437', 0, 0, '', '3233', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 1016, '15696', '12557', 0, 0, '', '28253', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 1017, '2267', '1814', 0, 0, '', '4081', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 1018, '1666', '1333', 0, 0, '', '2999', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 1019, '13967', '11174', 0, 0, '', '25141', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 1024, '3915', '3915', 0, 0, '', '7830', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 1027, '6549', '5239', 0, 0, '', '11788', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 1030, '15696', '12557', 0, 0, '', '28253', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 1033, '4688', '3750', 0, 0, '', '8438', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 1035, '2115', '2115', 0, 0, '', '4230', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 1036, '1143', '1143', 0, 0, '17817', '20103', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 1037, '8852', '8852', 0, 0, '', '17704', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 1038, '2267', '1814', 0, 0, '', '4081', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 1039, '907', '907', 0, 0, '', '1814', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 1040, '1134', '907', 0, 0, '', '2041', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 1041, '1134', '907', 0, 0, '', '2041', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 1042, '6549', '5239', 0, 0, '', '11788', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 1044, '907', '907', 0, 0, '', '1814', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 1049, '1814', '1814', 0, 0, '', '3628', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 1052, '907', '907', 0, 0, '', '1814', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 1058, '1436.64', '1436.64', 0, 0, '', '2873.28', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 1059, '907.2', '907.2', 0, 0, '', '1814.4', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 1061, '1813.5', '1813.5', 0, 0, '', '3627', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 1063, '7432.2', '7432.2', 0, 0, '', '14864.4', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 1064, '16576.7', '9946.02', 0, 0, '', '26522.72', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 1066, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 1073, '3108', '3108', 0, 0, '', '6216', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 1074, '3108', '3108', 0, 0, '', '6216', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 1075, '2664.6', '2664.6', 0, 0, '', '5329.2', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 1076, '7878.18', '7878.18', 0, 0, '', '15756.36', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 1077, '7011.54', '7011.54', 0, 0, '', '14023.08', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 1081, '12556.56', '12556.56', 0, 0, '', '25113.12', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 1086, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 1088, '11175.3', '11175.3', 0, 0, '', '22350.6', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 1091, '5239.44', '5239.44', 0, 0, '', '10478.88', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 1092, '6614.64', '6614.64', 0, 0, '', '13229.28', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 1093, '7432', '7432', 0, 0, '', '14864', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 1098, '6240', '6240', 0, 0, '', '12480', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 1099, '1333', '1333', 0, 0, '', '2666', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 1100, '4663', '4663', 0, 0, '', '9326', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 1102, '4500', '4500', 0, 0, '', '9000', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 1108, '2467', '2467', 0, 0, '', '4934', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 1110, '8852', '8852', 0, 0, '', '17704', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 1112, '5554', '5554', 0, 0, '', '11108', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 1113, '6240', '6240', 0, 0, '', '12480', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 1119, '3915', '3915', 0, 0, '', '7830', '', '1', 'May', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 1001, '3084', '2467', 0, 0, '', '5551', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 1002, '1959', '1959', 0, 0, '', '3918', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 1003, '2099', '1679', 0, 0, '', '3778', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 1004, '6549', '5239', 0, 0, '', '11788', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 1006, '2798', '2798', 0, 0, '', '5596', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 1008, '5286', '4228', 0, 0, '', '9514', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 1010, '4532', '3625', 0, 0, '', '8157', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 1011, '2644', '2115', 0, 0, '', '4759', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 1012, '7800', '6240', 0, 0, '', '14040', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 1013, '4532', '3625', 0, 0, '', '8157', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 1014, '1796', '1437', 0, 0, '', '3233', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 1016, '15696', '12557', 0, 0, '', '28253', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 1017, '2267', '1814', 0, 0, '', '4081', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 1018, '1666', '1333', 0, 0, '', '2999', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 1019, '13967', '11174', 0, 0, '', '25141', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 1024, '3915', '3915', 0, 0, '', '7830', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 1027, '6549', '5239', 0, 0, '', '11788', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 1030, '15696', '12557', 0, 0, '', '28253', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 1033, '4688', '3750', 0, 0, '', '8438', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 1035, '2115', '2115', 0, 0, '', '4230', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 1036, '1143', '1143', 0, 0, '17817', '20103', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 1037, '8852', '8852', 0, 0, '', '17704', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 1038, '2267', '1814', 0, 0, '', '4081', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 1039, '907', '907', 0, 0, '', '1814', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 1040, '1134', '907', 0, 0, '', '2041', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 1041, '1134', '907', 0, 0, '', '2041', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 1042, '6549', '5239', 0, 0, '', '11788', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 1044, '907', '907', 0, 0, '', '1814', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 1049, '1814', '1814', 0, 0, '', '3628', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 1052, '907', '907', 0, 0, '', '1814', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 1058, '1436.64', '1436.64', 0, 0, '', '2873.28', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 1059, '907.2', '907.2', 0, 0, '', '1814.4', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 1061, '1813.5', '1813.5', 0, 0, '', '3627', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 1063, '7432.2', '7432.2', 0, 0, '', '14864.4', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 1064, '16576.7', '9946.02', 0, 0, '', '26522.72', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 1066, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 1073, '3108', '3108', 0, 0, '', '6216', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 1074, '3108', '3108', 0, 0, '', '6216', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 1075, '2664.6', '2664.6', 0, 0, '', '5329.2', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 1076, '7878.18', '7878.18', 0, 0, '', '15756.36', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 1077, '7011.54', '7011.54', 0, 0, '', '14023.08', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 1081, '12556.56', '12556.56', 0, 0, '', '25113.12', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 1086, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 1088, '11175.3', '11175.3', 0, 0, '', '22350.6', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 1091, '5239.44', '5239.44', 0, 0, '', '10478.88', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 1092, '6614.64', '6614.64', 0, 0, '', '13229.28', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 1093, '7432', '7432', 0, 0, '', '14864', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 1098, '6240', '6240', 0, 0, '', '12480', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 1099, '1333', '1333', 0, 0, '', '2666', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 1100, '4663', '4663', 0, 0, '', '9326', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 1102, '4500', '4500', 0, 0, '', '9000', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 1108, '2467', '2467', 0, 0, '', '4934', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 1110, '8852', '8852', 0, 0, '', '17704', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 1112, '5554', '5554', 0, 0, '', '11108', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 1113, '6240', '6240', 0, 0, '', '12480', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 1119, '3915', '3915', 0, 0, '', '7830', '', '1', 'June', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 1001, '3084', '2467', 0, 0, '', '5551', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 1002, '1959', '1959', 0, 0, '', '3918', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 1003, '2099', '1679', 0, 0, '', '3778', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 1004, '6549', '5239', 0, 0, '', '11788', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 1006, '2798', '2798', 0, 0, '', '5596', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 1008, '5286', '4228', 0, 0, '', '9514', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 1010, '4532', '3625', 0, 0, '', '8157', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 1011, '2644', '2115', 0, 0, '', '4759', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 1012, '7800', '6240', 0, 0, '', '14040', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 1013, '4532', '3625', 0, 0, '', '8157', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 1014, '1796', '1437', 0, 0, '', '3233', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 1016, '15696', '12557', 0, 0, '', '28253', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 1017, '2267', '1814', 0, 0, '', '4081', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 1018, '1666', '1333', 0, 0, '', '2999', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 1019, '13967', '11174', 0, 0, '', '25141', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 1024, '3915', '3915', 0, 0, '', '7830', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 1027, '6549', '5239', 0, 0, '', '11788', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 1030, '15696', '12557', 0, 0, '', '28253', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 1033, '4688', '3750', 0, 0, '', '8438', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 1035, '2115', '2115', 0, 0, '', '4230', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 1036, '1143', '1143', 0, 0, '17817', '20103', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 1037, '8852', '8852', 0, 0, '', '17704', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 1038, '2267', '1814', 0, 0, '', '4081', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 1039, '907', '907', 0, 0, '', '1814', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 1040, '1134', '907', 0, 0, '', '2041', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 1041, '1134', '907', 0, 0, '', '2041', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 1042, '6549', '5239', 0, 0, '', '11788', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 1044, '907', '907', 0, 0, '', '1814', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 1049, '1814', '1814', 0, 0, '', '3628', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 1052, '907', '907', 0, 0, '', '1814', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 1058, '1436.64', '1436.64', 0, 0, '', '2873.28', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 1059, '907.2', '907.2', 0, 0, '', '1814.4', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 1061, '1813.5', '1813.5', 0, 0, '', '3627', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 1063, '7432.2', '7432.2', 0, 0, '', '14864.4', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 1064, '16576.7', '9946.02', 0, 0, '', '26522.72', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 1066, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 1073, '3108', '3108', 0, 0, '', '6216', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 1074, '3108', '3108', 0, 0, '', '6216', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 1075, '2664.6', '2664.6', 0, 0, '', '5329.2', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 1076, '7878.18', '7878.18', 0, 0, '', '15756.36', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 1077, '7011.54', '7011.54', 0, 0, '', '14023.08', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 1081, '12556.56', '12556.56', 0, 0, '', '25113.12', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 1086, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 1088, '11175.3', '11175.3', 0, 0, '', '22350.6', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 1091, '5239.44', '5239.44', 0, 0, '', '10478.88', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 1092, '6614.64', '6614.64', 0, 0, '', '13229.28', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 1093, '7432', '7432', 0, 0, '', '14864', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 1098, '6240', '6240', 0, 0, '', '12480', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 1099, '1333', '1333', 0, 0, '', '2666', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 1100, '4663', '4663', 0, 0, '', '9326', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 1102, '4500', '4500', 0, 0, '', '9000', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 1108, '2467', '2467', 0, 0, '', '4934', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 1110, '8852', '8852', 0, 0, '', '17704', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 1112, '5554', '5554', 0, 0, '', '11108', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 1113, '6240', '6240', 0, 0, '', '12480', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 1117, '12557', '12557', 0, 0, '', '25114', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 1119, '3915', '3915', 0, 0, '', '7830', '', '1', 'July', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 1001, '3084', '2467', 0, 0, '', '5551', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 1002, '1959', '1959', 0, 0, '', '3918', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 1003, '2099', '1679', 0, 0, '', '3778', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 1004, '6549', '5239', 0, 0, '', '11788', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 1006, '2798', '2798', 0, 0, '', '5596', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 1008, '5286', '4228', 0, 0, '', '9514', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 1010, '4532', '3625', 0, 0, '', '8157', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 1011, '2644', '2115', 0, 0, '', '4759', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 1012, '7800', '6240', 0, 0, '', '14040', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 1013, '4532', '3625', 0, 0, '', '8157', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 1014, '1796', '1437', 0, 0, '', '3233', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 1016, '15696', '12557', 0, 0, '', '28253', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 1017, '2267', '1814', 0, 0, '', '4081', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 1018, '1666', '1333', 0, 0, '', '2999', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 1019, '13967', '11174', 0, 0, '', '25141', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 1024, '3915', '3915', 0, 0, '', '7830', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 1027, '6549', '5239', 0, 0, '', '11788', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 1030, '15696', '12557', 0, 0, '', '28253', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 1033, '4688', '3750', 0, 0, '', '8438', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 1035, '2115', '2115', 0, 0, '', '4230', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 1036, '1143', '1143', 0, 0, '2041', '4327', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 1037, '8852', '8852', 0, 0, '', '17704', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 1038, '2267', '1814', 0, 0, '', '4081', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 1039, '907', '907', 0, 0, '', '1814', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 1040, '1134', '907', 0, 0, '', '2041', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 1041, '1134', '907', 0, 0, '', '2041', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 1042, '6549', '5239', 0, 0, '', '11788', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 1044, '907', '907', 0, 0, '', '1814', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 1049, '1814', '1814', 0, 0, '', '3628', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 1052, '907', '907', 0, 0, '', '1814', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 1058, '1436.64', '1436.64', 0, 0, '', '2873.28', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 1059, '907.2', '907.2', 0, 0, '', '1814.4', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 1061, '1813.5', '1813.5', 0, 0, '', '3627', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 1063, '7432.2', '7432.2', 0, 0, '', '14864.4', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 1064, '16576.7', '9946.02', 0, 0, '', '26522.72', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 1066, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 1073, '3108', '3108', 0, 0, '', '6216', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 1074, '3108', '3108', 0, 0, '', '6216', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 1075, '2664.6', '2664.6', 0, 0, '', '5329.2', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 1076, '7878.18', '7878.18', 0, 0, '', '15756.36', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 1077, '7011.54', '7011.54', 0, 0, '', '14023.08', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 1081, '12556.56', '12556.56', 0, 0, '', '25113.12', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 1086, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 1088, '11175.3', '11175.3', 0, 0, '', '22350.6', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 1091, '5239.44', '5239.44', 0, 0, '', '10478.88', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 1092, '6614.64', '6614.64', 0, 0, '', '13229.28', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 1093, '7432', '7432', 0, 0, '', '14864', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 1098, '6240', '6240', 0, 0, '', '12480', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 1099, '1333', '1333', 0, 0, '', '2666', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 1100, '4663', '4663', 0, 0, '', '9326', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 1102, '4500', '4500', 0, 0, '', '9000', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 1108, '2467', '2467', 0, 0, '', '4934', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 1110, '8852', '8852', 0, 0, '', '17704', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 1112, '5554', '5554', 0, 0, '', '11108', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 1113, '6240', '6240', 0, 0, '', '12480', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 1117, '12557', '12557', 0, 0, '', '25114', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 1119, '3915', '3915', 0, 0, '', '7830', '', '1', 'August', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 1001, '3084', '2467', 0, 0, '', '5551', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 1002, '1959', '1959', 0, 0, '', '3918', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 1003, '2099', '1679', 0, 0, '', '3778', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 1004, '6549', '5239', 0, 0, '', '11788', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 1006, '2798', '2798', 0, 0, '', '5596', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 1008, '5286', '4228', 0, 0, '', '9514', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 1010, '4532', '3625', 0, 0, '', '8157', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 1011, '2644', '2115', 0, 0, '', '4759', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 1012, '7800', '6240', 0, 0, '', '14040', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 1013, '4532', '3625', 0, 0, '', '8157', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 1014, '1796', '1437', 0, 0, '', '3233', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 1016, '15696', '12557', 0, 0, '', '28253', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 1017, '2267', '1814', 0, 0, '', '4081', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 1018, '1666', '1333', 0, 0, '', '2999', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 1019, '13967', '11174', 0, 0, '', '25141', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 1024, '3915', '3915', 0, 0, '', '7830', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 1027, '6549', '5239', 0, 0, '', '11788', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 1030, '15696', '12557', 0, 0, '', '28253', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 1033, '4688', '3750', 0, 0, '', '8438', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 1035, '2115', '2115', 0, 0, '', '4230', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 1036, '1143', '1143', 0, 0, '', '2286', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 1037, '8852', '8852', 0, 0, '', '17704', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 1038, '2267', '1814', 0, 0, '', '4081', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 1039, '907', '907', 0, 0, '', '1814', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 1040, '1134', '907', 0, 0, '', '2041', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 1041, '1134', '907', 0, 0, '', '2041', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 1042, '6549', '5239', 0, 0, '', '11788', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 1044, '907', '907', 0, 0, '', '1814', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 1049, '1814', '1814', 0, 0, '', '3628', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 1052, '907', '907', 0, 0, '', '1814', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 1058, '1436.64', '1436.64', 0, 0, '', '2873.28', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 1059, '907.2', '907.2', 0, 0, '', '1814.4', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 1061, '1813.5', '1813.5', 0, 0, '', '3627', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 1063, '7432.2', '7432.2', 0, 0, '', '14864.4', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 1064, '16576.7', '9946.02', 0, 0, '', '26522.72', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 1066, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 1073, '3108', '3108', 0, 0, '', '6216', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 1074, '3108', '3108', 0, 0, '', '6216', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 1075, '2664.6', '2664.6', 0, 0, '', '5329.2', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 1076, '7878.18', '7878.18', 0, 0, '', '15756.36', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 1077, '7011.54', '7011.54', 0, 0, '', '14023.08', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 1081, '12556.56', '12556.56', 0, 0, '', '25113.12', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 1086, '8851.92', '8851.92', 0, 0, '', '17703.84', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 1088, '14108.58', '14108.58', 0, 0, '', '28217.16', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 1091, '5239.44', '5239.44', 0, 0, '', '10478.88', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 1092, '6614.64', '6614.64', 0, 0, '', '13229.28', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 1093, '7432', '7432', 0, 0, '', '14864', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 1098, '6240', '6240', 0, 0, '', '12480', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 1099, '1333', '1333', 0, 0, '', '2666', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 1100, '4663', '4663', 0, 0, '', '9326', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 1102, '4500', '4500', 0, 0, '', '9000', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 1108, '2467', '2467', 0, 0, '', '4934', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 1110, '8852', '8852', 0, 0, '', '17704', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 1112, '5554', '5554', 0, 0, '', '11108', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 1113, '6240', '6240', 0, 0, '', '12480', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 1117, '12557', '12557', 0, 0, '', '25114', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 1119, '3915', '3915', 0, 0, '', '7830', '', '1', 'September', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 1001, '3084', '2467', 7.5, 6, '', '5551', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 1002, '1959', '1959', 6, 6, '', '3918', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 1003, '2099', '1679', 7.5, 6, '', '3778', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 1004, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 1006, '2798', '2798', 6, 6, '', '5596', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 1008, '5286', '4228', 7.5, 6, '', '9514', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 1010, '4532', '3625', 7.5, 6, '', '8157', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 1011, '2644', '2115', 7.5, 6, '', '4759', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 1012, '7800', '6240', 7.5, 6, '', '14040', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 1013, '4532', '3625', 7.5, 6, '', '8157', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 1014, '1796', '1437', 7.5, 6, '', '3233', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 1016, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 1017, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 1018, '1666', '1333', 7.5, 6, '', '2999', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 1019, '13967', '11174', 7.5, 6, '', '25141', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 1024, '3915', '3915', 6, 6, '', '7830', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 1027, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 1030, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 1035, '2115', '2115', 6, 6, '', '4230', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 1036, '1143', '1143', 6, 6, '', '2286', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 1037, '8852', '8852', 6, 6, '', '17704', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 1038, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 1039, '907', '907', 6, 6, '', '1814', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 1040, '1134', '907', 7.5, 6, '', '2041', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 1041, '1134', '907', 7.5, 6, '', '2041', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 1042, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 1044, '907', '907', 6, 6, '', '1814', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 1049, '1814', '1814', 6, 6, '', '3628', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 1052, '907', '907', 6, 6, '', '1814', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 1058, '1436.64', '1436.64', 6, 6, '', '2873.28', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 1059, '907.2', '907.2', 6, 6, '', '1814.4', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 1061, '1813.5', '1813.5', 6, 6, '', '3627', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 1063, '7432.2', '7432.2', 6, 6, '', '14864.4', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 1064, '16576.7', '9946.02', 10, 6, '', '26522.72', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 1066, '8851.92', '8851.92', 6, 6, '', '17703.84', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 1073, '3108', '3108', 6, 6, '', '6216', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 1074, '3108', '3108', 6, 6, '', '6216', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 1075, '2664.6', '2664.6', 6, 6, '', '5329.2', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 1076, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 1077, '7011.54', '7011.54', 6, 6, '', '14023.08', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 1081, '12556.56', '12556.56', 6, 6, '', '25113.12', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 1086, '10648.24', '10648.24', 6, 6, '', '21296.48', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 1088, '14108.58', '14108.58', 6, 6, '', '28217.16', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 1091, '5239.44', '5239.44', 6, 6, '', '10478.88', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 1092, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 1093, '7432', '7432', 6, 6, '', '14864', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 1098, '6240', '6240', 6, 6, '', '12480', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 1099, '1333', '1333', 6, 6, '', '2666', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 1100, '4663', '4663', 6, 6, '', '9326', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 1102, '4500', '4500', 6, 6, '', '9000', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 1108, '2467', '2467', 6, 6, '', '4934', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 1110, '8852', '8852', 6, 6, '', '17704', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 1112, '5554', '5554', 6, 6, '', '11108', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 1113, '6240', '6240', 6, 6, '', '12480', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 1117, '12557', '12557', 6, 6, '', '25114', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 1119, '3915', '3915', 6, 6, '', '7830', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 1129, '6240', '6240', 6, 6, '', '12480', '', '1', 'October', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 1001, '3084', '2467', 7.5, 6, '', '5551', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 1002, '1959', '1959', 6, 6, '', '3918', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 1003, '2099', '1679', 7.5, 6, '', '3778', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 1004, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 1006, '2798', '2798', 6, 6, '', '5596', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 1008, '5286', '4228', 7.5, 6, '', '9514', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 1010, '4532', '3625', 7.5, 6, '', '8157', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 1011, '2644', '2115', 7.5, 6, '', '4759', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 1012, '7800', '6240', 7.5, 6, '', '14040', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 1013, '5188', '4150', 7.5, 6, '', '9338', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 1014, '1796', '1437', 7.5, 6, '', '3233', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 1016, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 1017, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 1018, '1666', '1333', 7.5, 6, '', '2999', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 1019, '13967', '11174', 7.5, 6, '', '25141', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 1024, '3915', '3915', 6, 6, '', '7830', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 1027, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 1030, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 1035, '2115', '2115', 6, 6, '', '4230', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pensions` (`id`, `payroll_no`, `employee_contribution`, `employer_contribution`, `employee_percentage`, `employer_percentage`, `interest`, `monthly_deduction`, `comments`, `entered_by`, `month`, `year`, `created_at`, `updated_at`) VALUES
(416, 1036, '1143', '1143', 6, 6, '', '2286', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 1037, '8852', '8852', 6, 6, '', '17704', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 1038, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 1039, '907', '907', 6, 6, '', '1814', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 1040, '1134', '907', 7.5, 6, '', '2041', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 1041, '1134', '907', 7.5, 6, '', '2041', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 1042, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 1044, '907', '907', 6, 6, '', '1814', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 1049, '1814', '1814', 6, 6, '', '3628', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 1052, '907', '907', 6, 6, '', '1814', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 1058, '1436.64', '1436.64', 6, 6, '', '2873.28', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 1059, '907.2', '907.2', 6, 6, '', '1814.4', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 1061, '1813.5', '1813.5', 6, 6, '', '3627', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 1063, '7432.2', '7432.2', 6, 6, '', '14864.4', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 1064, '16576.7', '9946.02', 10, 6, '', '26522.72', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 1066, '8851.92', '8851.92', 6, 6, '', '17703.84', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 1073, '3108', '3108', 6, 6, '', '6216', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 1074, '3108', '3108', 6, 6, '', '6216', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 1075, '2664.6', '2664.6', 6, 6, '', '5329.2', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 1076, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 1077, '7011.54', '7011.54', 6, 6, '', '14023.08', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 1081, '12556.56', '12556.56', 6, 6, '', '25113.12', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 1086, '11845.86', '11845.86', 6, 6, '', '23691.72', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 1088, '14108.58', '14108.58', 6, 6, '', '28217.16', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 1091, '5239.44', '5239.44', 6, 6, '', '10478.88', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 1092, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, 1093, '7432', '7432', 6, 6, '', '14864', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, 1098, '6240', '6240', 6, 6, '', '12480', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, 1099, '1333', '1333', 6, 6, '', '2666', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 1100, '4663', '4663', 6, 6, '', '9326', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 1102, '4500', '4500', 6, 6, '', '9000', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, 1108, '2467', '2467', 6, 6, '', '4934', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, 1110, '8852', '8852', 6, 6, '', '17704', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 1112, '5554', '5554', 6, 6, '', '11108', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, 1113, '6240', '6240', 6, 6, '', '12480', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, 1117, '12557', '12557', 6, 6, '', '25114', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 1119, '3915', '3915', 6, 6, '', '7830', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 1129, '6240', '6240', 6, 6, '', '12480', '', '1', 'November', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, 1001, '3084', '2467', 7.5, 6, '', '5551', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, 1002, '1959', '1959', 6, 6, '', '3918', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, 1003, '2099', '1679', 7.5, 6, '', '3778', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, 1004, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, 1006, '2798', '2798', 6, 6, '', '5596', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, 1008, '5286', '4228', 7.5, 6, '', '9514', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, 1010, '4532', '3625', 7.5, 6, '', '8157', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, 1011, '2644', '2115', 7.5, 6, '', '4759', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, 1012, '7800', '6240', 7.5, 6, '', '14040', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 1013, '5188', '4150', 7.5, 6, '', '9338', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, 1014, '1796', '1437', 7.5, 6, '', '3233', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, 1016, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, 1017, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, 1018, '1666', '1333', 7.5, 6, '', '2999', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, 1019, '13967', '11174', 7.5, 6, '', '25141', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, 1024, '3915', '3915', 6, 6, '', '7830', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, 1027, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, 1030, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 1035, '2115', '2115', 6, 6, '', '4230', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, 1036, '1143', '1143', 6, 6, '', '2286', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, 1037, '8852', '8852', 6, 6, '', '17704', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, 1038, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, 1039, '907', '907', 6, 6, '', '1814', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, 1040, '1134', '907', 7.5, 6, '', '2041', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, 1041, '1134', '907', 7.5, 6, '', '2041', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, 1042, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, 1044, '907', '907', 6, 6, '', '1814', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, 1049, '1814', '1814', 6, 6, '', '3628', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, 1052, '907', '907', 6, 6, '', '1814', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, 1058, '1436.64', '1436.64', 6, 6, '', '2873.28', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, 1059, '907.2', '907.2', 6, 6, '', '1814.4', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, 1061, '1813.5', '1813.5', 6, 6, '', '3627', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, 1063, '7432.2', '7432.2', 6, 6, '', '14864.4', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, 1064, '16576.7', '9946.02', 10, 6, '', '26522.72', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, 1066, '8851.92', '8851.92', 6, 6, '', '17703.84', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, 1073, '3108', '3108', 6, 6, '', '6216', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, 1074, '3108', '3108', 6, 6, '', '6216', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, 1075, '2664.6', '2664.6', 6, 6, '', '5329.2', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, 1076, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, 1077, '7011.54', '7011.54', 6, 6, '', '14023.08', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, 1081, '12556.56', '12556.56', 6, 6, '', '25113.12', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(495, 1086, '11845.86', '11845.86', 6, 6, '', '23691.72', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 1088, '14108.58', '14108.58', 6, 6, '', '28217.16', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, 1091, '5239.44', '5239.44', 6, 6, '', '10478.88', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, 1092, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, 1093, '7432', '7432', 6, 6, '', '14864', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, 1098, '6240', '6240', 6, 6, '', '12480', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, 1099, '1333', '1333', 6, 6, '', '2666', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(502, 1100, '4663', '4663', 6, 6, '', '9326', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, 1102, '4500', '4500', 6, 6, '', '9000', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, 1108, '2467', '2467', 6, 6, '', '4934', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, 1110, '8852', '8852', 6, 6, '', '17704', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, 1112, '5554', '5554', 6, 6, '', '11108', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(507, 1113, '6240', '6240', 6, 6, '', '12480', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(508, 1117, '12557', '12557', 6, 6, '', '25114', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, 1119, '3915', '3915', 6, 6, '', '7830', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, 1129, '6240', '6240', 6, 6, '', '12480', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(511, 1121, '5239', '47151', 6, 6, '', '52390', '', '1', 'December', '2016', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(513, 1001, '3084', '2467', 7.5, 6, '', '5551', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(514, 1002, '1959', '1959', 6, 6, '', '3918', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, 1003, '2099', '1679', 7.5, 6, '', '3778', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, 1004, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(517, 1006, '2798', '2798', 6, 6, '', '5596', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(518, 1008, '5286', '4228', 7.5, 6, '', '9514', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(519, 1010, '4532', '3625', 7.5, 6, '', '8157', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, 1011, '2644', '2115', 7.5, 6, '', '4759', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, 1012, '7800', '6240', 7.5, 6, '', '14040', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, 1013, '5188', '4150', 7.5, 6, '', '9338', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, 1014, '1796', '1437', 7.5, 6, '', '3233', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, 1016, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(525, 1017, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(526, 1018, '1666', '1333', 7.5, 6, '', '2999', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, 1019, '13967', '11174', 7.5, 6, '', '25141', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(528, 1024, '3915', '3915', 6, 6, '', '7830', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(529, 1027, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(530, 1030, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, 1035, '2115', '2115', 6, 6, '', '4230', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, 1036, '1143', '1143', 6, 6, '', '2286', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 1037, '8852', '8852', 6, 6, '', '17704', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, 1038, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(535, 1039, '907', '907', 6, 6, '', '1814', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(536, 1040, '1134', '907', 7.5, 6, '', '2041', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(537, 1041, '1134', '907', 7.5, 6, '', '2041', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, 1042, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, 1044, '907', '907', 6, 6, '', '1814', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 1049, '1814', '1814', 6, 6, '', '3628', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, 1052, '907', '907', 6, 6, '', '1814', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, 1058, '1436.64', '1436.64', 6, 6, '', '2873.28', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, 1059, '907.2', '907.2', 6, 6, '', '1814.4', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, 1061, '1813.5', '1813.5', 6, 6, '', '3627', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 1063, '7432.2', '7432.2', 6, 6, '', '14864.4', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, 1064, '24865.05', '9946.02', 10, 6, '', '34811.07', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(547, 1066, '8851.92', '8851.92', 6, 6, '', '17703.84', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(548, 1073, '3108', '3108', 6, 6, '', '6216', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(549, 1074, '3108', '3108', 6, 6, '', '6216', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, 1075, '2664.6', '2664.6', 6, 6, '', '5329.2', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, 1076, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, 1077, '7011.54', '7011.54', 6, 6, '', '14023.08', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(553, 1081, '12556.56', '12556.56', 6, 6, '', '25113.12', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(554, 1086, '11845.86', '11845.86', 6, 6, '', '23691.72', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(555, 1088, '14108.58', '14108.58', 6, 6, '', '28217.16', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(556, 1091, '5239.44', '5239.44', 6, 6, '', '10478.88', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(557, 1092, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, 1093, '7432', '7432', 6, 6, '', '14864', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, 1097, '2665', '2665', 6, 6, '', '5330', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(560, 1098, '6240', '6240', 6, 6, '', '12480', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(561, 1099, '1333', '1333', 6, 6, '', '2666', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(562, 1100, '4663', '4663', 6, 6, '', '9326', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(563, 1102, '4500', '4500', 6, 6, '', '9000', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(564, 1103, '2665', '2665', 6, 6, '', '5330', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(565, 1108, '2467', '2467', 6, 6, '', '4934', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(566, 1110, '8852', '8852', 6, 6, '', '17704', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(567, 1112, '5554', '5554', 6, 6, '', '11108', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(568, 1113, '6240', '6240', 6, 6, '', '12480', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(569, 1117, '12557', '12557', 6, 6, '', '25114', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(570, 1119, '3915', '3915', 6, 6, '', '7830', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(571, 1123, '5554', '5554', 6, 6, '', '11108', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(572, 1125, '6615', '6615', 6, 6, '', '13230', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(573, 1129, '6240', '6240', 6, 6, '', '12480', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(574, 1130, '5554', '5554', 6, 6, '', '11108', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(575, 1133, '6240', '6240', 6, 6, '', '12480', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(576, 1134, '3357', '3357', 6, 6, '', '6714', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(577, 1135, '12557', '12557', 6, 6, '', '25114', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(578, 1136, '2115', '2115', 6, 6, '', '4230', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(579, 1137, '2115', '2115', 6, 6, '', '4230', '', '1', 'January', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, 1001, '3084', '2467', 7.5, 6, '', '5551', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(581, 1002, '1959', '1959', 6, 6, '', '3918', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(582, 1003, '2099', '1679', 7.5, 6, '', '3778', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(583, 1004, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(584, 1006, '2798', '2798', 6, 6, '', '5596', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(585, 1008, '5286', '4228', 7.5, 6, '', '9514', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(586, 1010, '4532', '3625', 7.5, 6, '', '8157', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, 1011, '2644', '2115', 7.5, 6, '', '4759', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, 1012, '7800', '6240', 7.5, 6, '', '14040', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, 1013, '5188', '4150', 7.5, 6, '', '9338', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(590, 1014, '1796', '1437', 7.5, 6, '', '3233', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(591, 1016, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(592, 1017, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(593, 1018, '1666', '1333', 7.5, 6, '', '2999', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, 1019, '13967', '11174', 7.5, 6, '', '25141', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(595, 1020, '0', '0', 6, 6, '', '0', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(596, 1024, '3915', '3915', 7.5, 6, '', '7830', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(597, 1027, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(598, 1030, '15696', '12557', 6, 6, '', '28253', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(599, 1035, '2115', '2115', 6, 6, '', '4230', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(600, 1036, '1143', '1143', 6, 6, '', '2286', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(601, 1037, '8852', '8852', 7.5, 6, '', '17704', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(602, 1038, '2267', '1814', 6, 6, '', '4081', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(603, 1039, '907', '907', 7.5, 6, '', '1814', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(604, 1040, '1134', '907', 7.5, 6, '', '2041', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(605, 1041, '1134', '907', 7.5, 6, '', '2041', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(606, 1042, '6549', '5239', 6, 6, '', '11788', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(607, 1044, '907', '907', 6, 6, '', '1814', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(608, 1049, '1814', '1814', 6, 6, '', '3628', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(609, 1052, '907', '907', 6, 6, '', '1814', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(610, 1058, '1436.64', '1436.64', 6, 6, '', '2873.28', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(611, 1059, '907.2', '907.2', 6, 6, '', '1814.4', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(612, 1061, '1813.5', '1813.5', 6, 6, '', '3627', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(613, 1063, '7432.2', '7432.2', 10, 6, '', '14864.4', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(614, 1064, '24865.05', '9946.02', 6, 6, '', '34811.07', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(615, 1065, '0', '0', 6, 6, '', '0', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(616, 1066, '8851.92', '8851.92', 6, 6, '', '17703.84', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(617, 1073, '3108', '3108', 6, 6, '', '6216', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(618, 1074, '3108', '3108', 6, 6, '', '6216', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(619, 1075, '2664.6', '2664.6', 6, 6, '', '5329.2', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(620, 1076, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(621, 1077, '7011.54', '7011.54', 6, 6, '', '14023.08', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(622, 1081, '12556.56', '12556.56', 6, 6, '', '25113.12', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(623, 1085, '0', '0', 6, 6, '', '0', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(624, 1086, '11845.86', '11845.86', 6, 6, '', '23691.72', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(625, 1088, '14108.58', '14108.58', 6, 6, '', '28217.16', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(626, 1091, '5239.44', '5239.44', 6, 6, '', '10478.88', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(627, 1092, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(628, 1093, '7432', '7432', 6, 6, '', '14864', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(629, 1097, '2665', '2665', 6, 6, '', '5330', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(630, 1098, '6240', '6240', 6, 6, '', '12480', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(631, 1099, '1333', '1333', 6, 6, '', '2666', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(632, 1100, '4663', '4663', 6, 6, '', '9326', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(633, 1102, '4500', '4500', 6, 6, '', '9000', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(634, 1103, '2665', '2665', 6, 6, '', '5330', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(635, 1108, '2467', '2467', 6, 6, '', '4934', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(636, 1110, '8852', '8852', 6, 6, '', '17704', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(637, 1112, '5554', '5554', 6, 6, '', '11108', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(638, 1113, '6240', '6240', 6, 6, '', '12480', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(639, 1117, '12557', '12557', 6, 6, '', '25114', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(640, 1119, '3915', '3915', 6, 6, '', '7830', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(641, 1123, '5554', '5554', 6, 6, '', '11108', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(642, 1125, '6615', '6615', 6, 6, '', '13230', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, 1129, '6240', '6240', 6, 6, '', '12480', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(644, 1130, '5554', '5554', 6, 6, '', '11108', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(645, 1133, '6240', '6240', 6, 6, '', '12480', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(646, 1134, '3357', '3357', 6, 6, '', '6714', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(647, 1135, '12557', '12557', 6, 6, '', '25114', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(648, 1136, '2115', '2115', 6, 6, '', '4230', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(649, 1137, '2115', '2115', 6, 6, '', '4230', '', '1', 'February', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(650, 1001, '3084', '2467', 7.5, 6, '', '5551', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(651, 1002, '1959', '1959', 6, 6, '', '3918', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(652, 1003, '2099', '1679', 7.5, 6, '', '3778', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(653, 1004, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(654, 1006, '2798', '2798', 6, 6, '', '5596', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(655, 1008, '5286', '4228', 7.5, 6, '', '9514', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(656, 1010, '4532', '3625', 7.5, 6, '', '8157', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(657, 1011, '2644', '2115', 7.5, 6, '', '4759', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(658, 1012, '7800', '6240', 7.5, 6, '', '14040', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(659, 1013, '5188', '4150', 7.5, 6, '', '9338', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(660, 1014, '1796', '1437', 7.5, 6, '', '3233', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, 1016, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(662, 1017, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(663, 1018, '1666', '1333', 7.5, 6, '', '2999', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(664, 1019, '13967', '11174', 7.5, 6, '', '25141', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(665, 1020, '0', '0', 6, 6, '', '0', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(666, 1024, '3915', '3915', 7.5, 6, '', '7830', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(667, 1027, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(668, 1030, '15696', '12557', 6, 6, '', '28253', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(669, 1035, '2115', '2115', 6, 6, '', '4230', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(670, 1036, '1143', '1143', 6, 6, '', '2286', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(671, 1037, '8852', '8852', 7.5, 6, '', '17704', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(672, 1038, '2267', '1814', 6, 6, '', '4081', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(673, 1039, '907', '907', 7.5, 6, '', '1814', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(674, 1040, '1134', '907', 7.5, 6, '', '2041', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(675, 1041, '1134', '907', 7.5, 6, '', '2041', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(676, 1042, '6549', '5239', 6, 6, '', '11788', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(677, 1044, '907', '907', 6, 6, '', '1814', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(678, 1049, '1814', '1814', 6, 6, '', '3628', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(679, 1052, '907', '907', 6, 6, '', '1814', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(680, 1058, '1436.64', '1436.64', 6, 6, '', '2873.28', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(681, 1059, '907.2', '907.2', 6, 6, '', '1814.4', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(682, 1061, '1813.5', '1813.5', 6, 6, '', '3627', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(683, 1063, '7432.2', '7432.2', 10, 6, '', '14864.4', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(684, 1064, '24865.05', '9946.02', 6, 6, '', '34811.07', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(685, 1065, '0', '0', 6, 6, '', '0', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(686, 1066, '8851.92', '8851.92', 6, 6, '', '17703.84', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(687, 1073, '3108', '3108', 6, 6, '', '6216', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(688, 1074, '3108', '3108', 6, 6, '', '6216', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(689, 1075, '2664.6', '2664.6', 6, 6, '', '5329.2', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(690, 1076, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(691, 1077, '7011.54', '7011.54', 6, 6, '', '14023.08', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(692, 1081, '12556.56', '12556.56', 6, 6, '', '25113.12', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(693, 1086, '11845.86', '11845.86', 6, 6, '', '23691.72', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(694, 1088, '14108.58', '14108.58', 6, 6, '', '28217.16', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, 1091, '5239.44', '5239.44', 6, 6, '', '10478.88', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, 1092, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(697, 1093, '7432', '7432', 6, 6, '', '14864', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(698, 1097, '2665', '2665', 6, 6, '', '5330', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(699, 1098, '6240', '6240', 6, 6, '', '12480', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(700, 1099, '1333', '1333', 6, 6, '', '2666', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(701, 1100, '4663', '4663', 6, 6, '', '9326', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(702, 1102, '4500', '4500', 6, 6, '', '9000', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(703, 1103, '2665', '2665', 6, 6, '', '5330', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(704, 1108, '2467', '2467', 6, 6, '', '4934', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(705, 1110, '8852', '8852', 6, 6, '', '17704', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, 1112, '5554', '5554', 6, 6, '', '11108', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(707, 1113, '6240', '6240', 6, 6, '', '12480', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(708, 1117, '12557', '12557', 6, 6, '', '25114', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(709, 1119, '3915', '3915', 6, 6, '', '7830', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(710, 1123, '5554', '5554', 6, 6, '', '11108', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(711, 1125, '6615', '6615', 6, 6, '', '13230', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(712, 1129, '6240', '6240', 6, 6, '', '12480', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(713, 1130, '5554', '5554', 6, 6, '', '11108', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(714, 1133, '6240', '6240', 6, 6, '', '12480', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(715, 1134, '3357', '3357', 6, 6, '', '6714', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(716, 1135, '12557', '12557', 6, 6, '', '25114', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(717, 1136, '2115', '2115', 6, 6, '', '4230', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(718, 1137, '2115', '2115', 6, 6, '', '4230', '', '1', 'March', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(719, 1001, '3084', '2467', 7.5, 6, '', '5551', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(720, 1002, '1959', '1959', 6, 6, '', '3918', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(721, 1003, '2099', '1679', 7.5, 6, '', '3778', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(722, 1004, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, 1006, '2798', '2798', 6, 6, '', '5596', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(724, 1008, '5286', '4228', 7.5, 6, '', '9514', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(725, 1010, '4532', '3625', 7.5, 6, '', '8157', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(726, 1011, '2644', '2115', 7.5, 6, '', '4759', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(727, 1012, '7800', '6240', 7.5, 6, '', '14040', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(728, 1013, '5188', '4150', 7.5, 6, '', '9338', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(729, 1014, '1796', '1437', 7.5, 6, '', '3233', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, 1016, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(731, 1017, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(732, 1018, '1666', '1333', 7.5, 6, '', '2999', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(733, 1019, '13967', '11174', 7.5, 6, '', '25141', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(734, 1020, '0', '0', 6, 6, '', '0', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(735, 1024, '3915', '3915', 7.5, 6, '', '7830', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(736, 1027, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(737, 1030, '15696', '12557', 6, 6, '', '28253', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(738, 1035, '2115', '2115', 6, 6, '', '4230', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(739, 1036, '1143', '1143', 6, 6, '', '2286', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, 1037, '8852', '8852', 7.5, 6, '', '17704', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(741, 1038, '2267', '1814', 6, 6, '', '4081', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(742, 1039, '907', '907', 7.5, 6, '', '1814', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(743, 1040, '1134', '907', 7.5, 6, '', '2041', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(744, 1041, '1134', '907', 7.5, 6, '', '2041', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(745, 1042, '6549', '5239', 6, 6, '', '11788', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, 1044, '907', '907', 6, 6, '', '1814', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(747, 1049, '1814', '1814', 6, 6, '', '3628', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(748, 1052, '907', '907', 6, 6, '', '1814', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(749, 1058, '1436.64', '1436.64', 6, 6, '', '2873.28', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(750, 1059, '907.2', '907.2', 6, 6, '', '1814.4', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(751, 1061, '1813.5', '1813.5', 6, 6, '', '3627', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(752, 1063, '7432.2', '7432.2', 10, 6, '', '14864.4', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, 1064, '24865.05', '9946.02', 6, 6, '', '34811.07', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(754, 1065, '0', '0', 6, 6, '', '0', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(755, 1066, '8851.92', '8851.92', 6, 6, '', '17703.84', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(756, 1073, '3108', '3108', 6, 6, '', '6216', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(757, 1074, '3108', '3108', 6, 6, '', '6216', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(758, 1075, '2664.6', '2664.6', 6, 6, '', '5329.2', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(759, 1076, '9383.04', '9383.04', 6, 6, '', '18766.08', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(760, 1077, '7011.54', '7011.54', 6, 6, '', '14023.08', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(761, 1081, '12556.56', '12556.56', 6, 6, '', '25113.12', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(762, 1085, '0', '0', 6, 6, '', '0', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(763, 1086, '11845.86', '11845.86', 6, 6, '', '23691.72', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, 1088, '14108.58', '14108.58', 6, 6, '', '28217.16', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(765, 1091, '5239.44', '5239.44', 6, 6, '', '10478.88', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, 1092, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, 1093, '7432', '7432', 6, 6, '', '14864', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(768, 1097, '2665', '2665', 6, 6, '', '5330', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(769, 1098, '6240', '6240', 6, 6, '', '12480', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(770, 1099, '1333', '1333', 6, 6, '', '2666', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(771, 1100, '4663', '4663', 6, 6, '', '9326', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(772, 1103, '2665', '2665', 6, 6, '', '5330', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(773, 1108, '2467', '2467', 6, 6, '', '4934', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(774, 1110, '8852', '8852', 6, 6, '', '17704', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(775, 1112, '5554', '5554', 6, 6, '', '11108', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(776, 1113, '6240', '6240', 6, 6, '', '12480', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(777, 1117, '12557', '12557', 6, 6, '', '25114', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(778, 1119, '3915', '3915', 6, 6, '', '7830', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(779, 1123, '5554', '5554', 6, 6, '', '11108', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(780, 1125, '6615', '6615', 6, 6, '', '13230', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(781, 1129, '6240', '6240', 6, 6, '', '12480', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(782, 1130, '5554', '5554', 6, 6, '', '11108', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(783, 1133, '6240', '6240', 6, 6, '', '12480', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(784, 1134, '3357', '3357', 6, 6, '', '6714', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(785, 1135, '12557', '12557', 6, 6, '', '25114', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(786, 1136, '2115', '2115', 6, 6, '', '4230', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(787, 1137, '2115', '2115', 6, 6, '', '4230', '', '1', 'April', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(788, 1001, '3084', '2467', 7.5, 6, '', '5551', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(789, 1002, '1959', '1959', 6, 6, '', '3918', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(790, 1003, '2099', '1679', 7.5, 6, '', '3778', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(791, 1004, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(792, 1006, '2798', '2798', 6, 6, '', '5596', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(793, 1008, '5286', '4228', 7.5, 6, '', '9514', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(794, 1010, '4532', '3625', 7.5, 6, '', '8157', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(795, 1011, '2644', '2115', 7.5, 6, '', '4759', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(796, 1012, '7800', '6240', 7.5, 6, '', '14040', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(797, 1013, '5188', '4150', 7.5, 6, '', '9338', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(798, 1014, '1796', '1437', 7.5, 6, '', '3233', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(799, 1016, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(800, 1017, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(801, 1018, '1666', '1333', 7.5, 6, '', '2999', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(802, 1019, '13967', '11174', 7.5, 6, '', '25141', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(803, 1020, '0', '0', 6, 6, '', '0', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(804, 1024, '3915', '3915', 7.5, 6, '', '7830', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(805, 1027, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(806, 1030, '15696', '12557', 6, 6, '', '28253', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(807, 1035, '2115', '2115', 6, 6, '', '4230', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(808, 1036, '1143', '1143', 6, 6, '', '2286', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(809, 1037, '8852', '8852', 7.5, 6, '', '17704', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(810, 1038, '2267', '1814', 6, 6, '', '4081', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(811, 1039, '907', '907', 7.5, 6, '', '1814', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(812, 1040, '1134', '907', 7.5, 6, '', '2041', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(813, 1041, '1134', '907', 7.5, 6, '', '2041', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(814, 1042, '6549', '5239', 6, 6, '', '11788', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(815, 1044, '907', '907', 6, 6, '', '1814', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(816, 1049, '1814', '1814', 6, 6, '', '3628', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(817, 1052, '907', '907', 6, 6, '', '1814', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(818, 1058, '1436.64', '1436.64', 6, 6, '', '2873.28', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(819, 1059, '907.2', '907.2', 6, 6, '', '1814.4', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(820, 1061, '1813.5', '1813.5', 6, 6, '', '3627', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(821, 1063, '7432.2', '7432.2', 10, 6, '', '14864.4', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(822, 1064, '24865.05', '9946.02', 6, 6, '', '34811.07', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(823, 1065, '0', '0', 6, 6, '', '0', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(824, 1066, '8851.92', '8851.92', 6, 6, '', '17703.84', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(825, 1073, '3108', '3108', 6, 6, '', '6216', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(826, 1074, '3108', '3108', 6, 6, '', '6216', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(827, 1075, '2664.6', '2664.6', 6, 6, '', '5329.2', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pensions` (`id`, `payroll_no`, `employee_contribution`, `employer_contribution`, `employee_percentage`, `employer_percentage`, `interest`, `monthly_deduction`, `comments`, `entered_by`, `month`, `year`, `created_at`, `updated_at`) VALUES
(828, 1076, '9383.04', '9383.04', 6, 6, '', '18766.08', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(829, 1077, '7011.54', '7011.54', 6, 6, '', '14023.08', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(830, 1081, '12556.56', '12556.56', 6, 6, '', '25113.12', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(831, 1085, '0', '0', 6, 6, '', '0', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(832, 1086, '11845.86', '11845.86', 6, 6, '', '23691.72', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(833, 1088, '14108.58', '14108.58', 6, 6, '', '28217.16', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(834, 1091, '5239.44', '5239.44', 6, 6, '', '10478.88', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(835, 1092, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(836, 1093, '7432', '7432', 6, 6, '', '14864', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(837, 1097, '2665', '2665', 6, 6, '', '5330', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(838, 1098, '6240', '6240', 6, 6, '', '12480', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(839, 1099, '1333', '1333', 6, 6, '', '2666', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(840, 1100, '4663', '4663', 6, 6, '', '9326', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(841, 1102, '4500', '4500', 6, 6, '', '9000', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(842, 1103, '2665', '2665', 6, 6, '', '5330', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(843, 1108, '2467', '2467', 6, 6, '', '4934', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(844, 1110, '8852', '8852', 6, 6, '', '17704', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(845, 1112, '5554', '5554', 6, 6, '', '11108', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(846, 1113, '6240', '6240', 6, 6, '', '12480', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(847, 1117, '12557', '12557', 6, 6, '', '25114', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(848, 1119, '3915', '3915', 6, 6, '', '7830', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(849, 1123, '5554', '5554', 6, 6, '', '11108', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(850, 1125, '6615', '6615', 6, 6, '', '13230', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(851, 1129, '6240', '6240', 6, 6, '', '12480', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(852, 1130, '5554', '5554', 6, 6, '', '11108', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(853, 1133, '6240', '6240', 6, 6, '', '12480', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(854, 1134, '3357', '3357', 6, 6, '', '6714', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(855, 1135, '12557', '12557', 6, 6, '', '25114', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(856, 1136, '2115', '2115', 6, 6, '', '4230', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(857, 1137, '2115', '2115', 6, 6, '', '4230', '', '1', 'May', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(858, 1001, '3084', '2467', 7.5, 6, '', '5551', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(859, 1002, '1959', '1959', 6, 6, '', '3918', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(860, 1003, '2099', '1679', 7.5, 6, '', '3778', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(861, 1004, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(862, 1006, '2798', '2798', 6, 6, '', '5596', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(863, 1008, '5286', '4228', 7.5, 6, '', '9514', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(864, 1010, '4532', '3625', 7.5, 6, '', '8157', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(865, 1011, '2644', '2115', 7.5, 6, '', '4759', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(866, 1012, '7800', '6240', 7.5, 6, '', '14040', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(867, 1013, '5188', '4150', 7.5, 6, '', '9338', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(868, 1014, '1796', '1437', 7.5, 6, '', '3233', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(869, 1016, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(870, 1017, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(871, 1018, '1666', '1333', 7.5, 6, '', '2999', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(872, 1019, '13967', '11174', 7.5, 6, '', '25141', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(873, 1020, '0', '0', 6, 6, '', '0', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(874, 1024, '3915', '3915', 7.5, 6, '', '7830', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(875, 1027, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(876, 1030, '15696', '12557', 6, 6, '', '28253', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(877, 1035, '2115', '2115', 6, 6, '', '4230', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(878, 1036, '1143', '1143', 6, 6, '', '2286', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(879, 1037, '8852', '8852', 7.5, 6, '', '17704', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(880, 1038, '2267', '1814', 6, 6, '', '4081', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(881, 1039, '907', '907', 7.5, 6, '', '1814', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(882, 1040, '1134', '907', 7.5, 6, '', '2041', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(883, 1041, '1134', '907', 7.5, 6, '', '2041', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(884, 1042, '6549', '5239', 6, 6, '', '11788', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(885, 1044, '907', '907', 6, 6, '', '1814', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(886, 1049, '1814', '1814', 6, 6, '', '3628', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(887, 1052, '907', '907', 6, 6, '', '1814', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(888, 1058, '1436.64', '1436.64', 6, 6, '', '2873.28', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(889, 1059, '907.2', '907.2', 6, 6, '', '1814.4', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(890, 1061, '1813.5', '1813.5', 6, 6, '', '3627', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(891, 1063, '7432.2', '7432.2', 10, 6, '', '14864.4', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(892, 1064, '24865.05', '9946.02', 6, 6, '', '34811.07', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(893, 1065, '0', '0', 6, 6, '', '0', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(894, 1066, '8851.92', '8851.92', 6, 6, '', '17703.84', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(895, 1074, '3108', '3108', 6, 6, '', '6216', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(896, 1075, '2664.6', '2664.6', 6, 6, '', '5329.2', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(897, 1076, '9383.04', '9383.04', 6, 6, '', '18766.08', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(898, 1077, '7011.54', '7011.54', 6, 6, '', '14023.08', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(899, 1081, '12556.56', '12556.56', 6, 6, '', '25113.12', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(900, 1085, '0', '0', 6, 6, '', '0', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(901, 1086, '11845.86', '11845.86', 6, 6, '', '23691.72', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(902, 1088, '14108.58', '14108.58', 6, 6, '', '28217.16', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(903, 1091, '5239.44', '5239.44', 6, 6, '', '10478.88', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(904, 1092, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(905, 1093, '7432', '7432', 6, 6, '', '14864', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(906, 1097, '2665', '2665', 6, 6, '', '5330', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(907, 1098, '6240', '6240', 6, 6, '', '12480', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(908, 1099, '1333', '1333', 6, 6, '', '2666', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(909, 1100, '4663', '4663', 6, 6, '', '9326', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(910, 1102, '4500', '4500', 6, 6, '', '9000', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(911, 1103, '2665', '2665', 6, 6, '', '5330', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(912, 1108, '2467', '2467', 6, 6, '', '4934', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(913, 1110, '8852', '8852', 6, 6, '', '17704', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(914, 1112, '5554', '5554', 6, 6, '', '11108', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(915, 1113, '6240', '6240', 6, 6, '', '12480', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(916, 1117, '12557', '12557', 6, 6, '', '25114', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(917, 1119, '3915', '3915', 6, 6, '', '7830', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(918, 1123, '5554', '5554', 6, 6, '', '11108', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(919, 1125, '6615', '6615', 6, 6, '', '13230', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(920, 1129, '6240', '6240', 6, 6, '', '12480', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(921, 1130, '5554', '5554', 6, 6, '', '11108', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(922, 1133, '6240', '6240', 6, 6, '', '12480', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(923, 1134, '3357', '3357', 6, 6, '', '6714', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(924, 1135, '12557', '12557', 6, 6, '', '25114', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(925, 1136, '2115', '2115', 6, 6, '', '4230', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(926, 1137, '2115', '2115', 6, 6, '', '4230', '', '1', 'June', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(927, 1001, '3084', '2467', 7.5, 6, '', '5551', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(928, 1002, '1959', '1959', 6, 6, '', '3918', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(929, 1003, '2099', '1679', 7.5, 6, '', '3778', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(930, 1004, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(931, 1006, '2798', '2798', 6, 6, '', '5596', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(932, 1008, '5286', '4228', 7.5, 6, '', '9514', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(933, 1010, '4532', '3625', 7.5, 6, '', '8157', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(934, 1011, '2644', '2115', 7.5, 6, '', '4759', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(935, 1012, '7800', '6240', 7.5, 6, '', '14040', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(936, 1013, '5188', '4150', 7.5, 6, '', '9338', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(937, 1014, '1796', '1437', 7.5, 6, '', '3233', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(938, 1016, '15696', '12557', 7.5, 6, '', '28253', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(939, 1017, '2267', '1814', 7.5, 6, '', '4081', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(940, 1018, '1666', '1333', 7.5, 6, '', '2999', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(941, 1019, '13967', '11174', 7.5, 6, '', '25141', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(942, 1020, '0', '0', 6, 6, '', '0', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(943, 1024, '3915', '3915', 7.5, 6, '', '7830', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(944, 1027, '6549', '5239', 7.5, 6, '', '11788', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(945, 1030, '15696', '12557', 6, 6, '', '28253', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(946, 1035, '2115', '2115', 6, 6, '', '4230', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(947, 1036, '1143', '1143', 6, 6, '', '2286', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(948, 1037, '8852', '8852', 7.5, 6, '', '17704', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(949, 1038, '2267', '1814', 6, 6, '', '4081', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(950, 1039, '907', '907', 7.5, 6, '', '1814', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(951, 1040, '1134', '907', 7.5, 6, '', '2041', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(952, 1041, '1134', '907', 7.5, 6, '', '2041', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(953, 1042, '6549', '5239', 6, 6, '', '11788', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(954, 1044, '907', '907', 6, 6, '', '1814', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(955, 1049, '1814', '1814', 6, 6, '', '3628', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(956, 1052, '907', '907', 6, 6, '', '1814', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(957, 1058, '1436.64', '1436.64', 6, 6, '', '2873.28', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(958, 1059, '907.2', '907.2', 6, 6, '', '1814.4', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(959, 1061, '1813.5', '1813.5', 6, 6, '', '3627', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(960, 1063, '7432.2', '7432.2', 10, 6, '', '14864.4', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(961, 1064, '24865.05', '9946.02', 6, 6, '', '34811.07', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(962, 1065, '0', '0', 6, 6, '', '0', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(963, 1066, '8851.92', '8851.92', 6, 6, '', '17703.84', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(964, 1073, '3108', '3108', 6, 6, '', '6216', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(965, 1074, '3108', '3108', 6, 6, '', '6216', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(966, 1075, '2664.6', '2664.6', 6, 6, '', '5329.2', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(967, 1076, '9383.04', '9383.04', 6, 6, '', '18766.08', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(968, 1077, '7011.54', '7011.54', 6, 6, '', '14023.08', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(969, 1081, '12556.56', '12556.56', 6, 6, '', '25113.12', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(970, 1085, '0', '0', 6, 6, '', '0', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(971, 1086, '11845.86', '11845.86', 6, 6, '', '23691.72', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(972, 1088, '14108.58', '14108.58', 6, 6, '', '28217.16', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(973, 1091, '5239.44', '5239.44', 6, 6, '', '10478.88', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(974, 1092, '7878.18', '7878.18', 6, 6, '', '15756.36', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(975, 1093, '7432', '7432', 6, 6, '', '14864', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(976, 1097, '2665', '2665', 6, 6, '', '5330', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(977, 1098, '6240', '6240', 6, 6, '', '12480', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(978, 1099, '1333', '1333', 6, 6, '', '2666', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(979, 1100, '4663', '4663', 6, 6, '', '9326', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(980, 1102, '4500', '4500', 6, 6, '', '9000', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(981, 1103, '2665', '2665', 6, 6, '', '5330', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(982, 1108, '2467', '2467', 6, 6, '', '4934', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(983, 1110, '8852', '8852', 6, 6, '', '17704', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(984, 1112, '5554', '5554', 6, 6, '', '11108', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(985, 1113, '6240', '6240', 6, 6, '', '12480', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(986, 1117, '12557', '12557', 6, 6, '', '25114', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(987, 1119, '3915', '3915', 6, 6, '', '7830', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(988, 1123, '5554', '5554', 6, 6, '', '11108', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(989, 1125, '6615', '6615', 6, 6, '', '13230', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(990, 1129, '6240', '6240', 6, 6, '', '12480', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(991, 1130, '5554', '5554', 6, 6, '', '11108', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(992, 1133, '6240', '6240', 6, 6, '', '12480', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(993, 1134, '3357', '3357', 6, 6, '', '6714', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(994, 1135, '12557', '12557', 6, 6, '', '25114', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(995, 1136, '2115', '2115', 6, 6, '', '4230', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(996, 1137, '2115', '2115', 6, 6, '', '4230', '', '1', 'July', '2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `category`, `created_at`, `updated_at`) VALUES
(1, 'create_employee', 'Create employee', 'Employee', '2017-03-18 08:09:24', '2017-03-18 08:09:24'),
(2, 'update_employee', 'Update employee', 'Employee', '2017-03-18 08:09:24', '2017-03-18 08:09:24'),
(3, 'deactivate_employee', 'Deactivate employee', 'Employee', '2017-03-18 08:09:24', '2017-03-18 08:09:24'),
(4, 'view_employee', 'View employee', 'Employee', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(5, 'manage_earning', 'Manage earnings', 'Payroll', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(6, 'manage_deduction', 'Manage deductions', 'Payroll', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(7, 'manage_allowance', 'Manage allowance', 'Payroll', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(8, 'manage_relief', 'Manage releif', 'Payroll', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(9, 'manage_benefit', 'Manage benefits', 'Payroll', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(10, 'process_payroll', 'Process payroll', 'Payroll', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(11, 'view_payroll_report', 'View reports', 'Payroll', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(12, 'manage_settings', 'Manage settings', 'Payroll', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(13, 'view_application', 'View applications', 'Vacation', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(14, 'amend_application', 'Amend applications', 'Vacation', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(15, 'approve_application', 'Approve applications', 'Vacation', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(16, 'reject_application', 'Reject applications', 'Vacation', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(17, 'cancel_application', 'Cancel applications', 'Vacation', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(18, 'view_leave_type', 'view vacation types', 'Vacation Setting', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(19, 'view_holiday', 'view holidays', 'Vacation Setting', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(20, 'view_leave_report', 'View reports', 'HR Report', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(21, 'manage_organization', 'manage organization', 'System', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(22, 'view_branch', 'view branches', 'Branch', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(25, 'view_user', 'view users', 'User', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(26, 'view_role', 'view roles', 'Role', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(27, 'manage_audit', 'manage audits', 'System', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(32, 'manager_payroll', 'Management payroll', 'Payroll', '2017-06-29 09:04:00', '2017-06-29 09:04:00'),
(33, 'create_user', 'create users', 'User', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(34, 'update_user', 'update users', 'User', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(35, 'delete_user', 'delete users', 'User', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(36, 'deactivate_user', 'deactivate users', 'User', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(37, 'activate_user', 'activate users', 'User', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(38, 'create_role', 'create roles', 'Role', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(39, 'update_role', 'update roles', 'Role', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(40, 'create_branch', 'create branches', 'Branch', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(41, 'update_branch', 'update branches', 'Branch', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(42, 'delete_branch', 'delete branches', 'Branch', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(43, 'view_department', 'view departments', 'Department', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(44, 'create_department', 'create departments', 'Department', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(45, 'update_department', 'update departments', 'Department', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(46, 'delete_department', 'delete departments', 'Department', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(47, 'view_bank', 'view banks', 'Bank', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(48, 'create_bank', 'create banks', 'Bank', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(49, 'update_bank', 'update banks', 'Bank', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(50, 'delete_bank', 'delete banks', 'Bank', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(51, 'view_bank_branch', 'view bank branches', 'Bank Branch', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(52, 'create_bank_branch', 'create bank branches', 'Bank Branch', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(53, 'update_bank_branch', 'update bank branches', 'Bank Branch', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(54, 'delete_bank_branch', 'delete bank branches', 'Bank Branch', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(55, 'view_employee_type', 'view employee types', 'Employee Type', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(56, 'create_employee_type', 'create employee types', 'Employee Type', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(57, 'update_employee_type', 'update employee types', 'Employee Type', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(58, 'delete_employee_type', 'delete employee types', 'Employee Type', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(59, 'view_job_group', 'view job group', 'Job Group', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(60, 'create_job_group', 'create job group', 'Job Group', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(61, 'update_job_group', 'update job group', 'Job Group', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(62, 'delete_job_group', 'delete job group', 'Job Group', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(63, 'view_occurrence_setting', 'view occurrence settings', 'Occurrence', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(64, 'create_occurrence_setting', 'create occurrence settings', 'Occurrence', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(65, 'update_occurrence_setting', 'update occurrence settings', 'Occurrence', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(66, 'delete_occurrence_setting', 'delete occurrence settings', 'Occurrence', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(67, 'view_citizenship', 'view citizenships', 'Citizenship', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(68, 'create_citizenship', 'create citizenships', 'Citizenship', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(69, 'update_citizenship', 'update citizenships', 'Citizenship', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(70, 'delete_citizenship', 'delete citizenships', 'Citizenship', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(71, 'view_education', 'view educations', 'Education', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(72, 'create_education', 'create educations', 'Education', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(73, 'update_education', 'update educations', 'Education', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(74, 'delete_education', 'delete educations', 'Education', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(75, 'view_appraisal_category', 'view appraisal categories', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(76, 'create_appraisal_category', 'create appraisal categories', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(77, 'update_appraisal_category', 'update appraisal categories', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(78, 'delete_appraisal_category', 'delete appraisal categories', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(79, 'view_appraisal_setting', 'view appraisal settings', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(80, 'create_appraisal_setting', 'create appraisal settings', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(81, 'update_appraisal_setting', 'update appraisal settings', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(82, 'delete_appraisal_setting', 'delete appraisal settings', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(83, 'create_leave_type', 'create vacation types', 'Vacation Setting', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(84, 'update_leave_type', 'update vacation types', 'Vacation Setting', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(85, 'delete_leave_type', 'delete vacation types', 'Vacation Setting', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(86, 'create_holiday', 'create holidays', 'Vacation Setting', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(87, 'update_holiday', 'update holidays', 'Vacation Setting', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(88, 'delete_holiday', 'delete holidays', 'Vacation Setting', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(89, 'view_account', 'view accounts', 'Account', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(90, 'create_account', 'create accounts', 'Account', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(91, 'update_account', 'update accounts', 'Account', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(92, 'delete_account', 'delete accounts', 'Account', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(93, 'view_allowance', 'view allowances', 'Allowance', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(94, 'create_allowance', 'create allowances', 'Allowance', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(95, 'update_allowance', 'update allowances', 'Allowance', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(96, 'delete_allowance', 'delete allowances', 'Allowance', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(97, 'view_relief', 'view reliefs', 'Relief', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(98, 'create_relief', 'create reliefs', 'Relief', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(99, 'update_relief', 'update reliefs', 'Relief', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(100, 'delete_relief', 'delete reliefs', 'Relief', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(101, 'view_deduction', 'view deductions', 'Deduction', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(102, 'create_deduction', 'create deductions', 'Deduction', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(103, 'update_deduction', 'update deductions', 'Deduction', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(104, 'delete_deduction', 'delete deductions', 'Deduction', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(105, 'view_nssf', 'view NSSF Rates', 'NSSF Rates', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(106, 'create_nssf', 'create NSSF Rates', 'NSSF Rates', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(107, 'update_nssf', 'update NSSF Rates', 'NSSF Rates', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(108, 'delete_nssf', 'delete NSSF Rates', 'NSSF Rates', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(109, 'view_nhif', 'view NHIF Rates', 'NHIF Rates', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(110, 'create_nhif', 'create NHIF Rates', 'NHIF Rates', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(111, 'update_nhif', 'update NHIF Rates', 'NHIF Rates', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(112, 'delete_nhif', 'delete NHIF Rates', 'NHIF Rates', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(113, 'view_earning_setting', 'view earning settings', 'Earning', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(114, 'create_earning_setting', 'create earning settings', 'Earning', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(115, 'update_earning_setting', 'update earning settings', 'Earning', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(116, 'delete_earning_setting', 'delete earning settings', 'Earning', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(117, 'view_nontaxable_setting', 'view nontaxable settings', 'Non Taxable', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(118, 'create_nontaxable_setting', 'create nontaxable settings', 'Non Taxable', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(119, 'update_nontaxable_setting', 'update nontaxable settings', 'Non Taxable', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(120, 'delete_nontaxable_setting', 'delete nontaxable settings', 'Non Taxable', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(121, 'activate_employee', 'activate employee', 'Employee', '2017-03-18 08:09:24', '2017-03-18 08:09:24'),
(122, 'view_deactive_employee', 'View deactivated employee', 'Employee', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(123, 'view_appraisal', 'view appraisals', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(124, 'create_appraisal', 'create appraisals', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(125, 'update_appraisal', 'update appraisals', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(126, 'delete_appraisal', 'delete appraisals', 'Appraisal', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(127, 'view_occurrence', 'view occurrences', 'Occurrence', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(128, 'create_occurrence', 'create occurrences', 'Occurrence', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(129, 'update_occurrence', 'update occurrences', 'Occurrence', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(130, 'delete_occurrence', 'delete occurrences', 'Occurrence', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(131, 'view_property', 'view properties', 'Property', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(132, 'create_property', 'create properties', 'Property', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(133, 'update_property', 'update properties', 'Property', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(134, 'delete_property', 'delete properties', 'Property', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(135, 'create_application', 'create applications', 'Vacation', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(136, 'view_approved_application', 'View approved applications', 'Vacation', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(137, 'view_amended_application', 'View amended applications', 'Vacation', '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(138, 'view_rejected_application', 'View rejected applications', 'Vacation', '2017-03-18 08:09:25', '2017-03-18 08:09:25');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(22, 22, 1),
(25, 25, 1),
(26, 26, 1),
(37, 32, 1),
(38, 21, 2),
(39, 22, 2),
(40, 24, 2),
(41, 26, 2),
(42, 27, 2),
(43, 1, 3),
(44, 2, 3),
(45, 21, 1),
(46, 33, 1),
(47, 34, 1),
(48, 35, 1),
(49, 36, 1),
(50, 37, 1),
(51, 27, 1),
(52, 38, 1),
(53, 39, 1),
(54, 40, 1),
(55, 41, 1),
(56, 42, 1),
(57, 47, 1),
(58, 48, 1),
(59, 49, 1),
(60, 50, 1),
(61, 43, 1),
(62, 44, 1),
(63, 45, 1),
(64, 46, 1),
(65, 51, 1),
(66, 52, 1),
(67, 53, 1),
(68, 54, 1),
(69, 55, 1),
(70, 56, 1),
(71, 57, 1),
(72, 58, 1),
(73, 59, 1),
(74, 60, 1),
(75, 61, 1),
(76, 62, 1),
(77, 63, 1),
(78, 64, 1),
(79, 65, 1),
(80, 66, 1),
(81, 67, 1),
(82, 68, 1),
(83, 69, 1),
(84, 70, 1),
(85, 71, 1),
(86, 72, 1),
(87, 73, 1),
(88, 74, 1),
(89, 75, 1),
(90, 76, 1),
(91, 77, 1),
(92, 78, 1),
(93, 79, 1),
(94, 80, 1),
(95, 81, 1),
(96, 82, 1),
(97, 83, 1),
(98, 84, 1),
(99, 85, 1),
(100, 86, 1),
(101, 87, 1),
(102, 88, 1),
(103, 89, 1),
(104, 90, 1),
(105, 91, 1),
(106, 92, 1),
(107, 93, 1),
(108, 94, 1),
(109, 95, 1),
(110, 96, 1),
(111, 97, 1),
(112, 98, 1),
(113, 99, 1),
(114, 100, 1),
(115, 101, 1),
(116, 102, 1),
(117, 103, 1),
(118, 104, 1),
(119, 105, 1),
(120, 106, 1),
(121, 107, 1),
(122, 108, 1),
(123, 109, 1),
(124, 110, 1),
(125, 111, 1),
(126, 112, 1),
(127, 113, 1),
(128, 114, 1),
(129, 115, 1),
(130, 116, 1),
(131, 117, 1),
(132, 118, 1),
(133, 119, 1),
(134, 120, 1),
(135, 1, 1),
(136, 121, 1),
(137, 122, 1),
(138, 123, 1),
(139, 124, 1),
(140, 125, 1),
(141, 126, 1),
(142, 127, 1),
(143, 128, 1),
(144, 129, 1),
(145, 130, 1),
(146, 131, 1),
(147, 132, 1),
(148, 133, 1),
(149, 134, 1),
(150, 135, 1),
(151, 136, 1),
(152, 137, 1),
(153, 138, 1),
(154, 14, 1),
(155, 15, 1),
(156, 16, 1),
(157, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digitalserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monetary` float(15,2) NOT NULL DEFAULT '0.00',
  `issued_by` int(10) UNSIGNED NOT NULL,
  `issue_date` date NOT NULL,
  `scheduled_return_date` date NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `received_by` int(10) UNSIGNED DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `employee_id`, `name`, `description`, `serial`, `digitalserial`, `monetary`, `issued_by`, `issue_date`, `scheduled_return_date`, `state`, `received_by`, `return_date`, `created_at`, `updated_at`) VALUES
(2, 1, 'Laptop', 'Company Laptop', 'AX21312321L', NULL, 70000.00, 2, '2017-10-26', '2017-10-26', 0, 0, NULL, '2017-10-26 15:21:47', '2017-10-26 15:21:47'),
(3, 1, 'Bla', 'bla', NULL, NULL, 878.78, 2, '2017-10-27', '2017-10-27', 0, 0, NULL, '2017-10-27 12:33:47', '2017-10-27 12:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `relief`
--

CREATE TABLE `relief` (
  `id` int(10) UNSIGNED NOT NULL,
  `relief_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `relief`
--

INSERT INTO `relief` (`id`, `relief_name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Insurance Relief', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', NULL, '2017-03-18 08:09:25', '2017-03-18 08:09:25'),
(2, 'Manager', NULL, '2017-06-29 06:54:42', '2017-06-29 06:54:42'),
(3, 'Test', NULL, '2017-10-24 14:53:51', '2017-10-24 14:53:51');

-- --------------------------------------------------------

--
-- Table structure for table `schemes`
--

CREATE TABLE `schemes` (
  `id` int(11) NOT NULL,
  `document_name` varchar(200) NOT NULL,
  `year` varchar(20) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `quarter` varchar(100) DEFAULT NULL,
  `uploaded_by` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schemes`
--

INSERT INTO `schemes` (`id`, `document_name`, `year`, `type`, `quarter`, `uploaded_by`, `created_at`, `updated_at`, `path`) VALUES
(12, 'FUND ADMINISTRATION REPORT', '2017', 'pdf', '2nd Quarter', '6', '2017-09-27 07:58:11', '2017-09-27 07:58:11', 'uploads/NEGST Q3 30-06-17.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `social_security`
--

CREATE TABLE `social_security` (
  `id` int(10) UNSIGNED NOT NULL,
  `tier` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `income_from` double(15,2) NOT NULL DEFAULT '0.00',
  `income_to` double(15,2) NOT NULL DEFAULT '0.00',
  `ss_amount_employee` double(15,2) NOT NULL DEFAULT '0.00',
  `ss_amount_employer` double(15,2) NOT NULL DEFAULT '0.00',
  `organization_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social_security`
--

INSERT INTO `social_security` (`id`, `tier`, `income_from`, `income_to`, `ss_amount_employee`, `ss_amount_employer`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'Tier I', 0.00, 0.00, 0.00, 0.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Tier I', 1.00, 99000000.00, 200.00, 200.00, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `supervisors`
--

CREATE TABLE `supervisors` (
  `id` int(10) UNSIGNED NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transact`
--

CREATE TABLE `transact` (
  `id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `employee_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `basic_pay` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `earning_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `taxable_income` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `paye` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `relief` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `nssf_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `vol_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `nhif_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `other_deductions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `total_deductions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `net` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `process_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `financial_month_year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transact`
--

INSERT INTO `transact` (`id`, `organization_id`, `employee_id`, `account_id`, `basic_pay`, `earning_amount`, `taxable_income`, `paye`, `relief`, `nssf_amount`, `vol_amount`, `nhif_amount`, `other_deductions`, `total_deductions`, `net`, `process_type`, `financial_month_year`, `created_at`, `updated_at`) VALUES
(1, 1, 'NSL.1', 1, '80000.00', '0', '80000', '17263.21', '1280', '200', '0.00', '1500', '0', '18963.21', '61036.79', 'management', '6-2017', '2017-06-29 11:16:37', '2017-06-29 11:16:37'),
(2, 1, 'NSL.2', 1, '100000.00', '5000', '105000', '24763.21', '1280', '200', '0.00', '1700', '0', '26663.21', '78336.79', 'management', '6-2017', '2017-06-29 11:16:37', '2017-06-29 11:16:37'),
(3, 1, 'NSL.6', 1, '1000.00', '10000', '11000', '0', '1280', '0', '0.00', '0', '2000', '2000', '9000', 'normal', '6-2017', '2017-06-29 12:09:55', '2017-06-29 12:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `transact_advances`
--

CREATE TABLE `transact_advances` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `financial_month_year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transact_allowances`
--

CREATE TABLE `transact_allowances` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `employee_allowance_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `organization_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `allowance_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `allowance_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allowance_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `process_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `financial_month_year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transact_allowances`
--

INSERT INTO `transact_allowances` (`id`, `employee_id`, `employee_allowance_id`, `organization_id`, `allowance_id`, `allowance_name`, `allowance_amount`, `process_type`, `financial_month_year`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 1, 2, 'Travel Allowance', '5000.00', 'management', '6-2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 3, 1, 1, 1, 'House Allowance', '10000.00', 'normal', '6-2017', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transact_deductions`
--

CREATE TABLE `transact_deductions` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `employee_deduction_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `organization_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `deduction_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `deduction_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deduction_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `financial_month_year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `process_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transact_deductions`
--

INSERT INTO `transact_deductions` (`id`, `employee_id`, `employee_deduction_id`, `organization_id`, `deduction_id`, `deduction_name`, `deduction_amount`, `financial_month_year`, `process_type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 'Salary Advance', '1000.00', '6-2017', 'management', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 3, 2, 1, 1, 'Salary Advance', '2000.00', '6-2017', 'normal', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transact_earnings`
--

CREATE TABLE `transact_earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `earning_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `earningsetting_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `organization_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `earning_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `earning_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `financial_month_year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `process_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transact_earnings`
--

INSERT INTO `transact_earnings` (`id`, `employee_id`, `earning_id`, `earningsetting_id`, `organization_id`, `earning_name`, `earning_amount`, `financial_month_year`, `process_type`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 1, 'Bonus', '10000.00', '6-2017', 'management', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 3, 1, 1, 'Bonus', '20000.00', '6-2017', 'management', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transact_nontaxables`
--

CREATE TABLE `transact_nontaxables` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `employee_nontaxable_id` int(10) UNSIGNED NOT NULL,
  `nontaxable_id` int(10) UNSIGNED NOT NULL,
  `nontaxable_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nontaxable_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `financial_month_year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `process_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transact_overtimes`
--

CREATE TABLE `transact_overtimes` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `overtime_id` int(10) UNSIGNED NOT NULL,
  `overtime_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `overtime_period` float(15,2) NOT NULL,
  `overtime_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `financial_month_year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `process_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transact_reliefs`
--

CREATE TABLE `transact_reliefs` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `employee_relief_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `relief_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `relief_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relief_amount` double(15,2) NOT NULL DEFAULT '0.00',
  `financial_month_year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `process_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '1',
  `role` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'admin',
  `is_active` tinyint(1) DEFAULT NULL,
  `branch_id` int(10) UNSIGNED DEFAULT NULL,
  `organization_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `confirmation_code`, `remember_token`, `confirmed`, `role`, `is_active`, `branch_id`, `organization_id`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'superadmin@lixnet.net', '$2y$10$MkAeCTBw3V7KrucqtKwksOKW6iJpQlFRhjY5tjdjniirlv5E5/ery', 'ec11812db74334c0b07c5118430e9b6a', 'aeaYNmL6oxveUPTiG6VM856NYej9twF4tR8MJ2K0apP9KnAb37YlioA6xuqG', 1, 'Admin', NULL, NULL, 1, '2017-03-18 08:09:26', '2017-08-29 16:23:12'),
(2, 'HR', 'hr@lixnet.net', '$2y$10$ws.eU5qPy5jTy4bmgcEse.4kdKw8ZI1tzA4ZVK8m6n0D.DA.oZVE2', 'e4c4b8527a64a213afc3a118efb9e03f', 'Z8xFHgVqWembLV7U6PHJBFkJG3J8GkLSZYowbdx78LtWspnOyy2nDYwWv86S', 1, 'Human Resource', NULL, NULL, 1, '2017-03-20 19:44:20', '2017-10-25 04:55:12'),
(4, 'Dorothy', 'info@lixnet.net', '$2y$10$MkAeCTBw3V7KrucqtKwksOKW6iJpQlFRhjY5tjdjniirlv5E5/ery', '0730d80b6954e27ee46f76c66f18dc44', NULL, 1, 'Employee', NULL, NULL, 1, '2017-08-24 21:43:27', '2017-08-24 21:43:27'),
(5, 'kenkode', 'wangoken2@gmail.com', '$2y$10$O2cRtUJiI4WQNI1oUY6gleNaeBuOacIsLuO9JIwYPxMk67cvAccJy', 'f1728941047ca39180759663e155fee8', 'Qe2rv4KeuNhKDeCkRAzkoYdatMNtTKdg1O60PQQlFwiIJgE340D7xSKHZqwl', 1, 'Employee', NULL, NULL, 1, '2017-10-24 16:20:06', '2017-10-25 05:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `allowances_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `appraisalcategories`
--
ALTER TABLE `appraisalcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appraisalquestions`
--
ALTER TABLE `appraisalquestions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appraisalquestions_appraisalcategory_id_foreign` (`appraisalcategory_id`);

--
-- Indexes for table `appraisals`
--
ALTER TABLE `appraisals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appraisals_employee_id_foreign` (`employee_id`),
  ADD KEY `appraisals_appraisalquestion_id_foreign` (`appraisalquestion_id`),
  ADD KEY `appraisals_examiner_foreign` (`examiner`);

--
-- Indexes for table `assigned_roles`
--
ALTER TABLE `assigned_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_roles_user_id_foreign` (`user_id`),
  ADD KEY `assigned_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banks_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `bank_branches`
--
ALTER TABLE `bank_branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_branches_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `benefitsettings`
--
ALTER TABLE `benefitsettings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `benefitsettings_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `citizenships`
--
ALTER TABLE `citizenships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenships_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `company_property`
--
ALTER TABLE `company_property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_property_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deductions_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earnings_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `earningsettings`
--
ALTER TABLE `earningsettings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earningsettings_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `education_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `emergencycontacts`
--
ALTER TABLE `emergencycontacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emergencycontacts_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_personal_file_number_unique` (`personal_file_number`),
  ADD UNIQUE KEY `employee_identity_number_unique` (`identity_number`),
  ADD UNIQUE KEY `employee_passport_number_unique` (`passport_number`),
  ADD UNIQUE KEY `employee_pin_unique` (`pin`),
  ADD UNIQUE KEY `employee_social_security_number_unique` (`social_security_number`),
  ADD UNIQUE KEY `employee_hospital_insurance_number_unique` (`hospital_insurance_number`),
  ADD UNIQUE KEY `employee_work_permit_number_unique` (`work_permit_number`),
  ADD UNIQUE KEY `employee_bank_account_number_unique` (`bank_account_number`),
  ADD UNIQUE KEY `employee_bank_eft_code_unique` (`bank_eft_code`),
  ADD UNIQUE KEY `employee_swift_code_unique` (`swift_code`),
  ADD UNIQUE KEY `employee_email_office_unique` (`email_office`),
  ADD UNIQUE KEY `employee_email_personal_unique` (`email_personal`),
  ADD UNIQUE KEY `employee_telephone_office_unique` (`telephone_office`),
  ADD UNIQUE KEY `employee_telephone_extension_office_unique` (`telephone_extension_office`),
  ADD UNIQUE KEY `employee_telephone_mobile_unique` (`telephone_mobile`),
  ADD KEY `employee_organization_id_foreign` (`organization_id`),
  ADD KEY `employee_branch_id_foreign` (`branch_id`),
  ADD KEY `employee_department_id_foreign` (`department_id`),
  ADD KEY `employee_job_group_id_foreign` (`job_group_id`),
  ADD KEY `employee_type_id_foreign` (`type_id`),
  ADD KEY `employee_education_type_id_foreign` (`education_type_id`),
  ADD KEY `employee_bank_id_foreign` (`bank_id`);

--
-- Indexes for table `employeebenefits`
--
ALTER TABLE `employeebenefits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employeebenefits_jobgroup_id_foreign` (`jobgroup_id`),
  ADD KEY `employeebenefits_benefit_id_foreign` (`benefit_id`);

--
-- Indexes for table `employeenontaxables`
--
ALTER TABLE `employeenontaxables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employeenontaxables_employee_id_foreign` (`employee_id`),
  ADD KEY `employeenontaxables_nontaxable_id_foreign` (`nontaxable_id`);

--
-- Indexes for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_allowances_employee_id_foreign` (`employee_id`),
  ADD KEY `employee_allowances_allowance_id_foreign` (`allowance_id`);

--
-- Indexes for table `employee_deductions`
--
ALTER TABLE `employee_deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_deductions_employee_id_foreign` (`employee_id`),
  ADD KEY `employee_deductions_deduction_id_foreign` (`deduction_id`);

--
-- Indexes for table `employee_relief`
--
ALTER TABLE `employee_relief`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_relief_relief_id_foreign` (`relief_id`),
  ADD KEY `employee_relief_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_type`
--
ALTER TABLE `employee_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_type_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `hospital_insurance`
--
ALTER TABLE `hospital_insurance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_group`
--
ALTER TABLE `job_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_group_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journals_account_id_foreign` (`account_id`);

--
-- Indexes for table `leaveapplications`
--
ALTER TABLE `leaveapplications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaveapplications_employee_id_foreign` (`employee_id`),
  ADD KEY `leaveapplications_leavetype_id_foreign` (`leavetype_id`),
  ADD KEY `leaveapplications_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `leavetypes`
--
ALTER TABLE `leavetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leavetypes_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nextofkins`
--
ALTER TABLE `nextofkins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nextofkins_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `next_of_kin`
--
ALTER TABLE `next_of_kin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `next_of_kin_contact_unique` (`contact`),
  ADD UNIQUE KEY `next_of_kin_id_number_unique` (`id_number`),
  ADD KEY `next_of_kin_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `nontaxables`
--
ALTER TABLE `nontaxables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nontaxables_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `occurences`
--
ALTER TABLE `occurences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occurences_employee_id_foreign` (`employee_id`),
  ADD KEY `occurences_occurencesetting_id_foreign` (`occurencesetting_id`),
  ADD KEY `occurences_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `occurencesettings`
--
ALTER TABLE `occurencesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_bank_id_foreign` (`bank_id`),
  ADD KEY `organization_bank_branch_id_foreign` (`bank_branch_id`);

--
-- Indexes for table `overtimes`
--
ALTER TABLE `overtimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `overtimes_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pensions`
--
ALTER TABLE `pensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `properties_employee_id_foreign` (`employee_id`),
  ADD KEY `properties_issued_by_foreign` (`issued_by`),
  ADD KEY `properties_received_by_foreign` (`received_by`);

--
-- Indexes for table `relief`
--
ALTER TABLE `relief`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relief_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `schemes`
--
ALTER TABLE `schemes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_security`
--
ALTER TABLE `social_security`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supervisors`
--
ALTER TABLE `supervisors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transact`
--
ALTER TABLE `transact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transact_employee_id_foreign` (`employee_id`),
  ADD KEY `transact_account_id_foreign` (`account_id`);

--
-- Indexes for table `transact_advances`
--
ALTER TABLE `transact_advances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transact_advances_employee_id_foreign` (`employee_id`),
  ADD KEY `transact_account_id_foreign` (`account_id`);

--
-- Indexes for table `transact_allowances`
--
ALTER TABLE `transact_allowances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transact_allowances_employee_id_foreign` (`employee_id`),
  ADD KEY `transact_allowances_employee_allowance_id_foreign` (`employee_allowance_id`),
  ADD KEY `transact_allowances_organization_id_foreign` (`organization_id`),
  ADD KEY `transact_allowances_allowance_id_foreign` (`allowance_id`);

--
-- Indexes for table `transact_deductions`
--
ALTER TABLE `transact_deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transact_deductions_employee_id_foreign` (`employee_id`),
  ADD KEY `transact_deductions_employee_deduction_id_foreign` (`employee_deduction_id`),
  ADD KEY `ttransact_deductions_organization_id_foreign` (`organization_id`),
  ADD KEY `transact_deductions_deduction_id_foreign` (`deduction_id`);

--
-- Indexes for table `transact_earnings`
--
ALTER TABLE `transact_earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transact_earnings_employee_id_foreign` (`employee_id`),
  ADD KEY `transact_earnings_earning_id_foreign` (`earning_id`),
  ADD KEY `transact_earnings_earningsetting_id_foreign` (`earningsetting_id`),
  ADD KEY `transact_earnings_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `transact_nontaxables`
--
ALTER TABLE `transact_nontaxables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transact_nontaxables_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `transact_overtimes`
--
ALTER TABLE `transact_overtimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transact_overtimes_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `transact_reliefs`
--
ALTER TABLE `transact_reliefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transact_reliefs_employee_id_foreign` (`employee_id`),
  ADD KEY `transact_reliefs_employee_relief_id_foreign` (`employee_relief_id`),
  ADD KEY `transact_reliefs_relief_id_foreign` (`relief_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`name`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `x_user_role_fk1` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `appraisalcategories`
--
ALTER TABLE `appraisalcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `appraisalquestions`
--
ALTER TABLE `appraisalquestions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `appraisals`
--
ALTER TABLE `appraisals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `assigned_roles`
--
ALTER TABLE `assigned_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=368;
--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `bank_branches`
--
ALTER TABLE `bank_branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1786;
--
-- AUTO_INCREMENT for table `benefitsettings`
--
ALTER TABLE `benefitsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `citizenships`
--
ALTER TABLE `citizenships`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `company_property`
--
ALTER TABLE `company_property`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `earningsettings`
--
ALTER TABLE `earningsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `emergencycontacts`
--
ALTER TABLE `emergencycontacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `employeebenefits`
--
ALTER TABLE `employeebenefits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeenontaxables`
--
ALTER TABLE `employeenontaxables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee_deductions`
--
ALTER TABLE `employee_deductions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee_relief`
--
ALTER TABLE `employee_relief`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_type`
--
ALTER TABLE `employee_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hospital_insurance`
--
ALTER TABLE `hospital_insurance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `job_group`
--
ALTER TABLE `job_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `leaveapplications`
--
ALTER TABLE `leaveapplications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `leavetypes`
--
ALTER TABLE `leavetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mails`
--
ALTER TABLE `mails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `nextofkins`
--
ALTER TABLE `nextofkins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `next_of_kin`
--
ALTER TABLE `next_of_kin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nontaxables`
--
ALTER TABLE `nontaxables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `occurences`
--
ALTER TABLE `occurences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `occurencesettings`
--
ALTER TABLE `occurencesettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `overtimes`
--
ALTER TABLE `overtimes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pensions`
--
ALTER TABLE `pensions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=997;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;
--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `relief`
--
ALTER TABLE `relief`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `schemes`
--
ALTER TABLE `schemes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `social_security`
--
ALTER TABLE `social_security`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `supervisors`
--
ALTER TABLE `supervisors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transact`
--
ALTER TABLE `transact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transact_advances`
--
ALTER TABLE `transact_advances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transact_allowances`
--
ALTER TABLE `transact_allowances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transact_deductions`
--
ALTER TABLE `transact_deductions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transact_earnings`
--
ALTER TABLE `transact_earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transact_nontaxables`
--
ALTER TABLE `transact_nontaxables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transact_overtimes`
--
ALTER TABLE `transact_overtimes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transact_reliefs`
--
ALTER TABLE `transact_reliefs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `appraisalquestions`
--
ALTER TABLE `appraisalquestions`
  ADD CONSTRAINT `appraisalquestions_appraisalcategory_id_foreign` FOREIGN KEY (`appraisalcategory_id`) REFERENCES `appraisalcategories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `appraisals`
--
ALTER TABLE `appraisals`
  ADD CONSTRAINT `appraisals_appraisalquestion_id_foreign` FOREIGN KEY (`appraisalquestion_id`) REFERENCES `appraisalquestions` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `appraisals_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `appraisals_examiner_foreign` FOREIGN KEY (`examiner`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `assigned_roles`
--
ALTER TABLE `assigned_roles`
  ADD CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `assigned_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `benefitsettings`
--
ALTER TABLE `benefitsettings`
  ADD CONSTRAINT `benefitsettings_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `citizenships`
--
ALTER TABLE `citizenships`
  ADD CONSTRAINT `citizenships_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `earningsettings`
--
ALTER TABLE `earningsettings`
  ADD CONSTRAINT `earningsettings_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `emergencycontacts`
--
ALTER TABLE `emergencycontacts`
  ADD CONSTRAINT `emergencycontacts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `employeebenefits`
--
ALTER TABLE `employeebenefits`
  ADD CONSTRAINT `employeebenefits_benefit_id_foreign` FOREIGN KEY (`benefit_id`) REFERENCES `benefitsettings` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employeebenefits_jobgroup_id_foreign` FOREIGN KEY (`jobgroup_id`) REFERENCES `job_group` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `employeenontaxables`
--
ALTER TABLE `employeenontaxables`
  ADD CONSTRAINT `employeenontaxables_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employeenontaxables_nontaxable_id_foreign` FOREIGN KEY (`nontaxable_id`) REFERENCES `nontaxables` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
