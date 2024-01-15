-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 15, 2024 at 02:59 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bidding`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_18_133452_create_tbl_contact_table', 1),
(6, '2023_08_22_114532_create_tbl_message_table', 2),
(7, '2023_08_22_123832_create_tbl_logs_table', 3),
(8, '2023_08_22_140201_create_tbl_reports_table', 4),
(9, '2023_08_22_140255_create_tbl_biddingitem_table', 5),
(10, '2023_08_22_140704_create_tbl_biddinginfo_table', 6),
(11, '2023_10_04_134715_create_tbl_bidding_image_table', 7),
(13, '2023_10_05_144552_create_tbl_biddingamount_table', 8),
(14, '2023_10_08_123258_create_tbl_price_table', 9),
(15, '2023_11_27_075611_create_tbl_productanme_tbl', 10),
(17, '2024_01_05_215327_create_tbl_transaction_table', 12),
(18, '2024_01_05_231217_create_tbl_rating_table', 13),
(20, '2024_01_10_060008_create_tbl_buyerlist_table', 14),
(21, '2023_12_16_201612_create_tbl_bidding_history_table', 15),
(22, '2024_01_14_205159_create_tbl_acknowledge_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(46, 'App\\Models\\User', 1, 'admin@gmail.com_Admin', '66cbbd5675814387eef21ecfe9ce13def739241440214515908c5c309c964f07', '[\"server:admin\"]', '2024-01-14 18:40:46', '2024-01-14 17:11:15', '2024-01-14 18:40:46'),
(47, 'App\\Models\\User', 2, 'dytiw@mailinator.com_User', '7b8db6105c8d8d28fea6671e13d1e2744624a3174dda41a1d8ce11b509c1981c', '[\"server:user\"]', '2024-01-14 18:58:52', '2024-01-14 17:22:42', '2024-01-14 18:58:52'),
(48, 'App\\Models\\User', 3, 'nyqirihoxa@mailinator.com_User', 'c58c85bf6b14a948d3e368c2ebd8d2b28e1955e46fbd662d5a83595c25c17c2e', '[\"server:user\"]', '2024-01-14 18:58:42', '2024-01-14 17:46:31', '2024-01-14 18:58:42');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_acknowledge`
--

DROP TABLE IF EXISTS `tbl_acknowledge`;
CREATE TABLE IF NOT EXISTS `tbl_acknowledge` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_fk` bigint(20) UNSIGNED NOT NULL,
  `buyer_fk` bigint(20) UNSIGNED NOT NULL,
  `product_key` bigint(20) UNSIGNED NOT NULL,
  `amout_bid` double(30,2) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_acknowledge_seller_fk_foreign` (`seller_fk`),
  KEY `tbl_acknowledge_buyer_fk_foreign` (`buyer_fk`),
  KEY `product_key` (`product_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_acknowledge`
--

INSERT INTO `tbl_acknowledge` (`id`, `seller_fk`, `buyer_fk`, `product_key`, `amout_bid`, `remark`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 2, 96.70, 'Ok', '2024-01-14 18:44:21', '2024-01-14 18:44:21'),
(2, 3, 2, 1, 60.00, 'Ok', '2024-01-14 18:45:03', '2024-01-14 18:45:03'),
(3, 3, 2, 3, 89.32, 'Ok', '2024-01-14 18:47:01', '2024-01-14 18:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barangay_coordinates`
--

DROP TABLE IF EXISTS `tbl_barangay_coordinates`;
CREATE TABLE IF NOT EXISTS `tbl_barangay_coordinates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brgy_name` varchar(30) NOT NULL,
  `lat` double(10,2) NOT NULL,
  `lng` double(10,2) NOT NULL,
  `marker_color` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1 COMMENT='tbl_barangay_coordinates';

--
-- Dumping data for table `tbl_barangay_coordinates`
--

INSERT INTO `tbl_barangay_coordinates` (`id`, `brgy_name`, `lat`, `lng`, `marker_color`) VALUES
(1, 'Baobaoan', 8.92, 125.56, 'FF776B'),
(2, 'Santo Nino', 9.05, 125.52, 'FF1100'),
(3, 'Anticala', 9.01, 125.62, 'FF8000'),
(4, 'Los Angeles', 9.01, 125.63, 'DFFF00'),
(5, 'Sumilihon', 9.01, 125.63, 'FFBF00'),
(6, 'Cabcabon', 8.98, 125.53, 'FF7F50'),
(7, 'Pianing', 8.98, 125.65, 'DE3163'),
(8, 'Taguibo', 8.98, 125.61, '9FE2BF'),
(9, 'Bugsukan', 8.95, 125.64, '40E0D0'),
(10, 'Antongalon', 8.95, 125.61, '6495ED'),
(11, 'Ampayon', 8.96, 125.60, 'CCCCFF'),
(12, 'Tiniwisan', 8.97, 125.58, 'BDB76B'),
(13, 'Taligaman', 8.94, 125.62, '800000'),
(14, 'Banza', 8.94, 125.56, 'FFA07A'),
(15, 'Baan', 8.95, 125.55, 'FFA500'),
(16, 'Lemon', 8.94, 125.59, 'F0E68C'),
(17, 'Basag', 8.92, 125.60, '3CB371'),
(18, 'Maug', 8.99, 125.53, '00FFFF'),
(19, 'Pagatpatan', 8.99, 125.53, '1E90FF'),
(20, 'Lumbocan', 9.00, 125.49, 'FF00FF'),
(21, 'Agusan Pequeño', 8.98, 125.52, '8A2BE2'),
(22, 'Bading', 8.97, 125.52, '4B0082'),
(23, 'Mahogany', 8.96, 125.54, 'FFE4E1'),
(24, 'Baan Riverside', 8.95, 125.54, 'BC8F8F'),
(25, 'Buhangin', 8.91, 125.52, 'DAA520'),
(26, 'Mahay', 8.93, 125.56, 'F4A460'),
(27, 'Camayahan', 8.91, 125.51, 'A0522D'),
(28, 'Obrero', 8.96, 125.53, '00CED1'),
(29, 'Port Poyohon', 8.96, 125.53, '8A2BE2'),
(30, 'Humabon', 8.95, 125.54, '008080'),
(31, 'Leon Kilat', 8.95, 125.54, '9ACD32'),
(32, 'San Ignacio', 8.95, 125.54, '808080'),
(33, 'Sikatuna', 8.95, 125.54, 'C71585'),
(34, 'Rajah Soliman', 8.95, 125.54, 'FFFFF0'),
(35, 'Urduja', 8.95, 125.54, 'FA8072'),
(36, 'Dagohoy', 8.94, 125.53, 'FF4500'),
(37, 'Golden Ribbon', 8.94, 125.54, '550A35'),
(38, 'Imadejas', 8.94, 125.53, '7F4E52'),
(39, 'JP Rizal', 8.94, 125.53, 'F8B88B'),
(40, 'Lapu-Lapu', 8.95, 125.53, 'FFB6C1'),
(41, 'New Society Village', 8.95, 125.54, 'C25283'),
(42, 'Holy Redeemer', 8.96, 125.52, 'FF00FF'),
(43, 'Limaha', 8.95, 125.53, '583759'),
(44, 'Tandang Sora', 8.95, 125.53, '36013F'),
(45, 'Ambago', 8.97, 125.48, 'CCCCFF'),
(46, 'Bayanihan', 8.95, 125.52, 'C2B280'),
(47, 'Doongan', 8.96, 125.50, 'F75D59'),
(48, 'Manila de Bugabus', 8.81, 125.49, 'BDEDFF'),
(49, 'Babag', 8.97, 125.49, '566D7E'),
(50, 'Ong Yiu', 8.96, 125.54, 'C6AEC7'),
(51, 'Bancasi', 8.95, 125.46, 'ECC5C0'),
(52, 'Dumalagan', 8.93, 125.43, 'E5E4E2'),
(53, 'Libertad', 8.94, 125.48, '2B547E'),
(54, 'Masao', 8.99, 125.47, '16E2F5'),
(55, 'Agao', 8.94, 125.54, '82CAFF'),
(56, 'Datu Silongan', 8.95, 125.54, 'E9AB17'),
(57, 'Diego Silang', 8.95, 125.54, '4D0000'),
(58, 'Pinamanculan', 8.98, 125.45, 'C4535A'),
(59, 'Bonbon', 8.92, 125.49, '005A58'),
(60, 'Kinamlutan', 8.91, 125.51, '441FA8'),
(61, ' Maon', 8.93, 125.54, '65B8A3'),
(62, 'Pangabugan', 8.93, 125.53, 'B2779B'),
(63, 'San Vicente', 8.91, 125.54, '014831'),
(64, 'Villa Kananga', 8.93, 125.52, '689FFF'),
(65, 'Amparo', 8.85, 125.51, '580080'),
(66, 'Bit-os', 8.89, 125.47, 'B03A80'),
(67, 'Bitan-agan', 8.85, 125.49, '665AD0'),
(68, 'Dankias', 8.75, 125.56, '663F34'),
(69, 'Dulag', 8.83, 125.53, '464863'),
(70, 'Bugabus (MJ Santos)', 8.81, 125.55, '929265'),
(71, 'Nong-nong', 8.86, 125.46, '53659f'),
(72, 'San Mateo', 8.79, 125.57, '9EF2B8'),
(73, 'Tungao', 8.79, 125.44, '00E5D1'),
(74, 'Bilay', 8.85, 125.56, '66627D'),
(75, 'Don Francisco', 8.87, 125.57, '002A4C'),
(76, 'Florida', 8.79, 125.58, '421D5C'),
(77, 'Maguinda', 8.82, 125.58, '0C4A00'),
(78, 'Maibu', 8.85, 125.59, '36166B'),
(79, 'Mandamo', 8.76, 125.60, '1E6757'),
(80, 'Sumile', 8.83, 125.60, '956033'),
(81, 'Aupagan', 8.88, 125.54, '856CB8'),
(82, 'Pigdaulan', 8.90, 125.58, '383C75'),
(83, 'Salvacion', 8.87, 125.58, '9D6C58'),
(84, 'Tagabaca', 8.91, 125.55, '66A4AC'),
(85, 'Bobon', 8.98, 125.54, '00D7C3'),
(86, 'De Oro', 8.92, 125.63, '5600A1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_biddingamount`
--

DROP TABLE IF EXISTS `tbl_biddingamount`;
CREATE TABLE IF NOT EXISTS `tbl_biddingamount` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bidding_amt_fk` bigint(20) UNSIGNED NOT NULL,
  `amount_bidding` double(10,2) NOT NULL,
  `bidding_item_user_fk` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_biddingamount_bidding_amt_fk_foreign` (`bidding_amt_fk`),
  KEY `tbl_biddingamount_bidding_item_user_fk_foreign` (`bidding_item_user_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_biddingamount`
--

INSERT INTO `tbl_biddingamount` (`id`, `bidding_amt_fk`, `amount_bidding`, `bidding_item_user_fk`, `created_at`, `updated_at`) VALUES
(1, 1, 60.00, 3, '2024-01-14 18:41:28', '2024-01-14 18:43:27'),
(2, 2, 96.70, 3, '2024-01-14 18:42:34', '2024-01-14 18:43:48'),
(3, 3, 89.32, 3, '2024-01-14 18:46:24', '2024-01-14 18:46:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_biddinginfo`
--

DROP TABLE IF EXISTS `tbl_biddinginfo`;
CREATE TABLE IF NOT EXISTS `tbl_biddinginfo` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price` double(10,2) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bidding_brgy_fk` bigint(20) UNSIGNED NOT NULL,
  `bidding_item_fk` bigint(20) UNSIGNED NOT NULL,
  `user_info_fk` bigint(20) UNSIGNED NOT NULL,
  `tbl_productanme_tbl_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_info_fk` (`user_info_fk`),
  KEY `bidding_item_fk` (`bidding_item_fk`),
  KEY `tbl_productanme_tbl_fk` (`tbl_productanme_tbl_fk`),
  KEY `tbl_biddinginfo_ibfk_1` (`bidding_brgy_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_biddinginfo`
--

INSERT INTO `tbl_biddinginfo` (`id`, `product_name`, `product_price`, `address`, `bidding_brgy_fk`, `bidding_item_fk`, `user_info_fk`, `tbl_productanme_tbl_fk`, `created_at`, `updated_at`) VALUES
(1, NULL, 59.53, 'P-27 Baan Km3', 13, 1, 3, 2, '2024-01-14 18:41:28', '2024-01-14 18:41:28'),
(2, NULL, 54.00, 'P-2 Libertad', 13, 2, 3, 1, '2024-01-14 18:42:34', '2024-01-14 18:42:34'),
(3, NULL, 59.53, 'Surigao', 24, 3, 3, 2, '2024-01-14 18:46:24', '2024-01-14 18:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_biddingitem`
--

DROP TABLE IF EXISTS `tbl_biddingitem`;
CREATE TABLE IF NOT EXISTS `tbl_biddingitem` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniq_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_status` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date_now` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date_now` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `milliseconds_data` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_unit` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_biddingitem`
--

INSERT INTO `tbl_biddingitem` (`id`, `uniq_key`, `name`, `price_status`, `description`, `start_date_now`, `end_date_now`, `milliseconds_data`, `price_unit`, `created_at`, `updated_at`) VALUES
(1, 'b4dd26ee8fb66e72e3916b8a94ae9707', 'Copras', 1, 'dawdwadwa', 'Jan 15 2024', 'Jan 19 2024', '10:40 am', 1, '2024-01-14 18:41:28', '2024-01-14 18:45:31'),
(2, '448620cfc8671255c9e5ea3763d12b34', 'Whole Nut', 1, 'gyhuijokp,ldwadwadawdawdawd', 'Jan 15 2024', 'Jan 18 2024', '10:40 am', 2, '2024-01-14 18:42:34', '2024-01-14 18:44:39'),
(3, 'eee3784d4380a23f9602acea37c47496', 'Copras', 1, 'crtvbyunoim,l.[;daw', 'Jan 15 2024', 'Jan 17 2024', '10:45 am', 1, '2024-01-14 18:46:24', '2024-01-14 18:47:23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bidding_history`
--

DROP TABLE IF EXISTS `tbl_bidding_history`;
CREATE TABLE IF NOT EXISTS `tbl_bidding_history` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tbl_biddingitem_fk` bigint(20) UNSIGNED NOT NULL,
  `tbl_biddingprice_fk` double(10,2) NOT NULL,
  `schedule` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `user_fk` bigint(20) UNSIGNED NOT NULL,
  `buyer_pick` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_bidding_history_tbl_biddingitem_fk_foreign` (`tbl_biddingitem_fk`),
  KEY `tbl_bidding_history_user_fk_foreign` (`user_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_bidding_history`
--

INSERT INTO `tbl_bidding_history` (`id`, `tbl_biddingitem_fk`, `tbl_biddingprice_fk`, `schedule`, `comment`, `status`, `user_fk`, `buyer_pick`, `created_at`, `updated_at`) VALUES
(1, 1, 59.53, NULL, NULL, 0, 3, 0, '2024-01-14 18:41:28', '2024-01-14 18:41:28'),
(2, 2, 54.00, NULL, NULL, 0, 3, 0, '2024-01-14 18:42:34', '2024-01-14 18:42:34'),
(3, 1, 60.00, 'Ok', 'Please Noticed me', 1, 2, 1, '2024-01-14 18:43:27', '2024-01-14 18:45:03'),
(4, 2, 96.70, 'Ok', 'Majority Price', 1, 2, 1, '2024-01-14 18:43:48', '2024-01-14 18:44:21'),
(5, 3, 59.53, NULL, NULL, 0, 3, 0, '2024-01-14 18:46:24', '2024-01-14 18:46:24'),
(6, 3, 89.32, 'Ok', NULL, 1, 2, 1, '2024-01-14 18:46:41', '2024-01-14 18:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bidding_image`
--

DROP TABLE IF EXISTS `tbl_bidding_image`;
CREATE TABLE IF NOT EXISTS `tbl_bidding_image` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_bidding_image_item_fk_foreign` (`item_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_bidding_image`
--

INSERT INTO `tbl_bidding_image` (`id`, `image`, `item_fk`, `created_at`, `updated_at`) VALUES
(1, 'Uploads/Files/b4dd26ee8fb66e72e3916b8a94ae9707.jpg', 1, '2024-01-14 18:41:28', '2024-01-14 18:41:28'),
(2, 'Uploads/Files/448620cfc8671255c9e5ea3763d12b34.png', 2, '2024-01-14 18:42:34', '2024-01-14 18:42:34'),
(3, 'Uploads/Files/eee3784d4380a23f9602acea37c47496.png', 3, '2024-01-14 18:46:24', '2024-01-14 18:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_buyerlist`
--

DROP TABLE IF EXISTS `tbl_buyerlist`;
CREATE TABLE IF NOT EXISTS `tbl_buyerlist` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_buyer_fk` bigint(20) UNSIGNED NOT NULL,
  `schedule_visit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_bid_user` double(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_buyerlist_user_buyer_fk_foreign` (`user_buyer_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
CREATE TABLE IF NOT EXISTS `tbl_contact` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_user_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_contact_contact_user_fk_foreign` (`contact_user_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`id`, `contact_number`, `home_address`, `zipcode`, `contact_user_fk`, `created_at`, `updated_at`) VALUES
(1, '09837217312', 'Do dolorem laborum p', '12935', 2, '2024-01-14 17:13:26', '2024-01-14 17:13:26'),
(2, '09456789312', 'Ut proident rerum e', '71453', 3, '2024-01-14 17:21:47', '2024-01-14 17:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

DROP TABLE IF EXISTS `tbl_logs`;
CREATE TABLE IF NOT EXISTS `tbl_logs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_logs_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_logs_user_logs_fk_foreign` (`user_logs_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`id`, `activity`, `user_logs_fk`, `created_at`, `updated_at`) VALUES
(1, 'dytiw@mailinator.com Sent Message-Approved', 1, '2024-01-14 17:20:11', '2024-01-14 17:20:11'),
(2, 'nyqirihoxa@mailinator.com Sent Message-Approved', 1, '2024-01-14 17:22:11', '2024-01-14 17:22:11'),
(3, 'Creating Bidding Item ', 2, '2024-01-14 17:38:38', '2024-01-14 17:38:38'),
(4, 'Creating Bidding Item ', 2, '2024-01-14 17:43:19', '2024-01-14 17:43:19'),
(5, 'Creating Bidding Item ', 2, '2024-01-14 18:03:37', '2024-01-14 18:03:37'),
(6, 'Creating Bidding Item ', 3, '2024-01-14 18:41:28', '2024-01-14 18:41:28'),
(7, 'Creating Bidding Item ', 3, '2024-01-14 18:42:34', '2024-01-14 18:42:34'),
(8, 'Creating Bidding Item ', 3, '2024-01-14 18:46:24', '2024-01-14 18:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_message`
--

DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE IF NOT EXISTS `tbl_message` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_message_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_message_user_message_fk_foreign` (`user_message_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_message`
--

INSERT INTO `tbl_message` (`id`, `subject`, `message`, `user_message_fk`, `created_at`, `updated_at`) VALUES
(1, 'Approved', '<p>awydvyadgwaduawedrfgthynjm</p>', 2, '2024-01-14 17:20:11', '2024-01-14 17:20:11'),
(2, 'Approved', '<p>xcrvtbynm,l</p>', 3, '2024-01-14 17:22:11', '2024-01-14 17:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_municipality`
--

DROP TABLE IF EXISTS `tbl_municipality`;
CREATE TABLE IF NOT EXISTS `tbl_municipality` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `municipality` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_municipality`
--

INSERT INTO `tbl_municipality` (`id`, `municipality`) VALUES
(1, 'Butuan City'),
(2, 'Tandag'),
(3, 'San Francisco - Agusan del sur'),
(4, 'Alegria'),
(5, 'Gigaquit'),
(6, 'Tagana-an'),
(7, 'Trento'),
(8, 'Madrid'),
(9, 'Nasipit'),
(10, 'Carrascal'),
(11, 'Magallanes'),
(12, 'Surigao City'),
(13, 'Bayugan City'),
(14, 'Tubod'),
(15, 'Bacuag'),
(16, 'Malimono'),
(17, 'Bunawan'),
(18, 'Las Nieves'),
(19, 'Prosperidad'),
(20, 'San Francisco - Surigao del norte'),
(21, 'Cagwait'),
(22, 'La Paz'),
(23, 'Cabadbaran City'),
(24, 'Bislig'),
(25, 'Mainit'),
(26, 'Del Carmen'),
(27, 'Pilar'),
(28, 'Caraga'),
(29, 'Santa Josefa'),
(30, 'Kitcharao'),
(31, 'Jabonga'),
(32, 'Sibagat');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_price`
--

DROP TABLE IF EXISTS `tbl_price`;
CREATE TABLE IF NOT EXISTS `tbl_price` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `current_price` double(10,2) NOT NULL,
  `new_price` double(10,2) NOT NULL,
  `name_tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_tag_int` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productanme_tbl`
--

DROP TABLE IF EXISTS `tbl_productanme_tbl`;
CREATE TABLE IF NOT EXISTS `tbl_productanme_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double(10,2) DEFAULT NULL,
  `type_of_quantity` int(11) NOT NULL COMMENT '1=kilo, 2= per pieces',
  `product_color_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_productanme_tbl_tbl_price_fk_foreign` (`product_price`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_productanme_tbl`
--

INSERT INTO `tbl_productanme_tbl` (`id`, `product_name`, `product_price`, `type_of_quantity`, `product_color_code`, `created_at`, `status`, `updated_at`) VALUES
(1, 'Whole Nut', 54.00, 2, '9c4b9c', '2024-01-14 18:40:18', 1, '2024-01-14 18:40:18'),
(2, 'Copras', 59.53, 1, '5527a1', '2024-01-14 18:40:45', 1, '2024-01-14 18:40:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

DROP TABLE IF EXISTS `tbl_rating`;
CREATE TABLE IF NOT EXISTS `tbl_rating` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_rating_fk` bigint(20) UNSIGNED NOT NULL,
  `rating_num` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_rating_user_rating_fk_foreign` (`user_rating_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reports`
--

DROP TABLE IF EXISTS `tbl_reports`;
CREATE TABLE IF NOT EXISTS `tbl_reports` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `messagecode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_report_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_reports_user_report_fk_foreign` (`user_report_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

DROP TABLE IF EXISTS `tbl_transaction`;
CREATE TABLE IF NOT EXISTS `tbl_transaction` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_seller_fk` bigint(20) UNSIGNED NOT NULL,
  `user_buyer_fk` bigint(20) UNSIGNED NOT NULL,
  `product_fk` bigint(20) UNSIGNED NOT NULL,
  `starting_price` double(20,2) NOT NULL,
  `total_amount` double(10,2) NOT NULL,
  `month` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(20,2) NOT NULL,
  `price_unit` int(11) NOT NULL DEFAULT '0',
  `weight` double(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_transaction_user_seller_fk_foreign` (`user_seller_fk`),
  KEY `tbl_transaction_user_buyer_fk_foreign` (`user_buyer_fk`),
  KEY `tbl_transaction_product_fk_foreign` (`product_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_transaction`
--

INSERT INTO `tbl_transaction` (`id`, `user_seller_fk`, `user_buyer_fk`, `product_fk`, `starting_price`, `total_amount`, `month`, `total`, `price_unit`, `weight`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 2, 39528.00, 96.70, 'Jan', 70784.40, 2, 732.00, '2024-01-14 18:44:39', '2024-01-14 18:44:39'),
(2, 3, 2, 1, 94771.76, 60.00, 'Jan', 95520.00, 1, 1592.00, '2024-01-14 18:45:31', '2024-01-14 18:45:31'),
(3, 3, 2, 3, 50600.50, 89.32, 'Jan', 75922.00, 1, 850.00, '2024-01-14 18:47:23', '2024-01-14 18:47:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_brgy_fk` bigint(20) UNSIGNED DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `user_brgy_fk` (`user_brgy_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name_user`, `email`, `user_brgy_fk`, `role`, `status`, `files`, `birthdate`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'admin@gmail.com', NULL, 1, 1, NULL, 'Nov 18 1996', NULL, '$2y$10$qsFKTQZmw6Fx.7teuFIwMuxdqPYb7gbdOHVJcNNdPNRl7vo1LLHAq', NULL, NULL, NULL),
(2, 'wanoki', 'Wallace Berry Hayfa Booker Jorden Cervantes', 'dytiw@mailinator.com', 21, 2, 1, 'Uploads/Files/Jorden Cervantes.png', 'January 18 2024', NULL, '$2y$10$oVGTbWofOLQfflyEThVgFuvwdrz8iRAVT9IXW60lbA/IxwAVDARc.', NULL, '2024-01-14 17:13:26', '2024-01-14 17:20:11'),
(3, 'rorehiwi', 'Joel Sparks Aphrodite Doyle Elaine Dominguez', 'nyqirihoxa@mailinator.com', 21, 2, 1, 'Uploads/Files/Elaine Dominguez.png', 'January 19 2024', NULL, '$2y$10$uX4Zgg2TXAM/7nu9ko79TuPL4zKJ5JbCVws2tNkVSPg6i0kkFq0eK', NULL, '2024-01-14 17:21:47', '2024-01-14 17:22:11');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_acknowledge`
--
ALTER TABLE `tbl_acknowledge`
  ADD CONSTRAINT `tbl_acknowledge_buyer_fk_foreign` FOREIGN KEY (`buyer_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_acknowledge_ibfk_1` FOREIGN KEY (`product_key`) REFERENCES `tbl_biddingitem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_acknowledge_seller_fk_foreign` FOREIGN KEY (`seller_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_biddingamount`
--
ALTER TABLE `tbl_biddingamount`
  ADD CONSTRAINT `tbl_biddingamount_bidding_amt_fk_foreign` FOREIGN KEY (`bidding_amt_fk`) REFERENCES `tbl_biddingitem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_biddingamount_bidding_item_user_fk_foreign` FOREIGN KEY (`bidding_item_user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_biddinginfo`
--
ALTER TABLE `tbl_biddinginfo`
  ADD CONSTRAINT `tbl_biddinginfo_ibfk_1` FOREIGN KEY (`bidding_brgy_fk`) REFERENCES `tbl_municipality` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_biddinginfo_ibfk_2` FOREIGN KEY (`user_info_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_biddinginfo_ibfk_3` FOREIGN KEY (`bidding_item_fk`) REFERENCES `tbl_biddingitem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_biddinginfo_ibfk_4` FOREIGN KEY (`tbl_productanme_tbl_fk`) REFERENCES `tbl_productanme_tbl` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_bidding_history`
--
ALTER TABLE `tbl_bidding_history`
  ADD CONSTRAINT `tbl_bidding_history_tbl_biddingitem_fk_foreign` FOREIGN KEY (`tbl_biddingitem_fk`) REFERENCES `tbl_biddingitem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_bidding_history_user_fk_foreign` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_bidding_image`
--
ALTER TABLE `tbl_bidding_image`
  ADD CONSTRAINT `tbl_bidding_image_item_fk_foreign` FOREIGN KEY (`item_fk`) REFERENCES `tbl_biddingitem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_buyerlist`
--
ALTER TABLE `tbl_buyerlist`
  ADD CONSTRAINT `tbl_buyerlist_user_buyer_fk_foreign` FOREIGN KEY (`user_buyer_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD CONSTRAINT `tbl_contact_contact_user_fk_foreign` FOREIGN KEY (`contact_user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD CONSTRAINT `tbl_logs_user_logs_fk_foreign` FOREIGN KEY (`user_logs_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_message`
--
ALTER TABLE `tbl_message`
  ADD CONSTRAINT `tbl_message_user_message_fk_foreign` FOREIGN KEY (`user_message_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD CONSTRAINT `tbl_rating_user_rating_fk_foreign` FOREIGN KEY (`user_rating_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  ADD CONSTRAINT `tbl_reports_user_report_fk_foreign` FOREIGN KEY (`user_report_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD CONSTRAINT `tbl_transaction_product_fk_foreign` FOREIGN KEY (`product_fk`) REFERENCES `tbl_biddingitem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaction_user_buyer_fk_foreign` FOREIGN KEY (`user_buyer_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaction_user_seller_fk_foreign` FOREIGN KEY (`user_seller_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_brgy_fk`) REFERENCES `tbl_barangay_coordinates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
