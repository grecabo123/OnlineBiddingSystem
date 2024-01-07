-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 07, 2024 at 08:02 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(16, '2023_12_16_201612_create_tbl_bidding_history_table', 11),
(17, '2024_01_05_215327_create_tbl_transaction_table', 12),
(18, '2024_01_05_231217_create_tbl_rating_table', 13);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(13, 'App\\Models\\User', 4, 'byfekufi@mailinator.com_User', 'd94f0cd0609c7c2c2df3842728e47c171f1c8046ee7eb8a409a3846217beb060', '[\"server:user\"]', '2024-01-07 12:01:29', '2024-01-07 07:27:20', '2024-01-07 12:01:29'),
(14, 'App\\Models\\User', 1, 'artamay1@gmail.com_Admin', '96f957c54e441423d0b122a8624183c8e87b82d2a2d8f6af5a7165e0f85c1ab0', '[\"server:admin\"]', '2024-01-07 12:02:49', '2024-01-07 07:42:32', '2024-01-07 12:02:49'),
(17, 'App\\Models\\User', 2, 'artamay12@gmail.com_User', '1530afc2148102c5178bb9b05d892e5ccfecccfb302047d1620e372e92a22af3', '[\"server:user\"]', '2024-01-07 10:35:04', '2024-01-07 08:22:31', '2024-01-07 10:35:04'),
(18, 'App\\Models\\User', 2, 'artamay12@gmail.com_User', '9846170232b4374221c120c5684cc44eb11cc8ec65b0976ed8f3ab5b0d905473', '[\"server:user\"]', '2024-01-07 12:02:39', '2024-01-07 10:39:18', '2024-01-07 12:02:39');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  KEY `bidding_brgy_fk` (`bidding_brgy_fk`),
  KEY `user_info_fk` (`user_info_fk`),
  KEY `bidding_item_fk` (`bidding_item_fk`),
  KEY `tbl_productanme_tbl_fk` (`tbl_productanme_tbl_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bidding_history`
--

DROP TABLE IF EXISTS `tbl_bidding_history`;
CREATE TABLE IF NOT EXISTS `tbl_bidding_history` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tbl_biddingitem_fk` bigint(20) UNSIGNED NOT NULL,
  `tbl_biddingprice_fk` double(10,2) NOT NULL,
  `user_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_bidding_history_tbl_biddingitem_fk_foreign` (`tbl_biddingitem_fk`),
  KEY `tbl_bidding_history_user_fk_foreign` (`user_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`id`, `contact_number`, `home_address`, `zipcode`, `contact_user_fk`, `created_at`, `updated_at`) VALUES
(1, '09213123123', 'Baan Km3', '8600', 1, '2023-08-19 21:35:47', '2023-08-19 21:35:47'),
(2, '09213123123', 'Baan Km3', '8600', 2, '2023-08-20 18:58:19', '2023-08-20 18:58:19'),
(3, 'Vel quis sed quasi v', 'Ut excepteur laboris', '39112', 3, '2023-08-22 09:04:19', '2023-08-22 09:04:19'),
(4, '09213123123', 'Et in dolore impedit', '33730', 4, '2023-08-22 09:06:39', '2023-08-22 09:06:39'),
(5, 'Id quibusda', 'Consequat Duis dolo', '90926', 5, '2023-08-22 09:07:45', '2023-08-22 09:07:45'),
(6, 'Dolores non', 'Facere qui earum nis', '44545', 6, '2023-08-22 09:09:28', '2023-08-22 09:09:28'),
(7, 'Et incidunt', 'Culpa soluta repelle', '23913', 7, '2023-08-22 09:11:29', '2023-08-22 09:11:29'),
(8, 'Dolore volu', 'Velit culpa ex labor', '89922', 8, '2023-08-22 09:11:59', '2023-08-22 09:11:59'),
(9, 'In explicab', 'Molestiae natus dolo', '41106', 9, '2023-08-22 09:12:20', '2023-08-22 09:12:20'),
(10, 'Eum eos rem', 'Illo elit sunt volu', '79179', 10, '2023-08-22 19:00:18', '2023-08-22 19:00:18'),
(11, '12312321543', 'Maxime vel dolores s', '68515', 11, '2023-08-22 19:01:29', '2023-08-22 19:01:29'),
(12, '09213254354', 'Perspiciatis quis v', '71548', 12, '2023-08-22 19:02:15', '2023-08-22 19:02:15'),
(13, 'Necessitati', 'Ab ullamco suscipit', '43567', 13, '2023-08-22 19:06:13', '2023-08-22 19:06:13'),
(14, 'Dolor ad cu', 'Nemo velit soluta re', '30635', 14, '2023-08-22 19:13:24', '2023-08-22 19:13:24'),
(15, '09232276437', 'Sunt ullam quisquam', '31054', 15, '2023-08-22 19:18:35', '2023-08-22 19:18:35'),
(16, 'Ullamco sim', 'Et cupiditate vel il', '54916', 16, '2023-08-24 19:31:41', '2023-08-24 19:31:41'),
(17, '09091234512', 'Quis vel consectetur', '6000', 17, '2023-12-17 03:36:31', '2023-12-17 03:36:31');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_productanme_tbl_tbl_price_fk_foreign` (`product_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `user_brgy_fk` bigint(20) UNSIGNED NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `user_brgy_fk` (`user_brgy_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name_user`, `email`, `user_brgy_fk`, `role`, `status`, `files`, `birthdate`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'arta', 'Mel Exclamador', 'artamay1@gmail.com', 9, 1, 1, 'Uploads/Files/Recabo.png', 'August 20 2023', NULL, '$2y$10$qsFKTQZmw6Fx.7teuFIwMuxdqPYb7gbdOHVJcNNdPNRl7vo1LLHAq', NULL, '2023-08-20 05:35:47', '2023-08-20 05:35:47'),
(2, 'arta', 'John Pandaa ArtaMay', 'artamay12@gmail.com', 46, 2, 1, 'Uploads/Files/ArtaMay.png', 'August 24 2023', NULL, '$2y$10$qSITeM88v4gnl4ZZF2KD7eiYtT133xRN1O6L0oIKrAjDiNA1EjRJO', NULL, '2023-08-21 02:58:19', '2023-08-22 04:49:50'),
(3, 'byfyvyq', 'Adrienne Richardson Stephen Guzman Imelda Conner', 'jepexuv@mailinator.com', 29, 2, 1, 'Uploads/Files/Imelda Conner.jpg', 'August 09 2023', NULL, '$2y$10$7DtdfMLCR2HjloK16Uk9/eDKmGQV5zLqLTbVD8P4ppQqSTEv.xHUe', NULL, '2023-08-22 17:04:19', '2023-08-23 03:21:27'),
(4, 'jamefakevi', 'Sherilyn Briones', 'byfekufi@mailinator.com', 2, 2, 1, 'Uploads/Files/Demetria Rose.png', 'August 31 2023', NULL, '$2y$10$F0AvO86B7L2ii.BWPSmzPOxkrlm.xOMBEt7m.zYwHJT.yuhc028Sa', NULL, '2023-08-22 17:06:39', '2023-08-26 07:01:02'),
(5, 'ryhedar', 'Tyrone Meadows Quin Freeman Natalie Barber', 'bihij@mailinator.com', 1, 2, 1, 'Uploads/Files/Natalie Barber.png', 'August 07 2023', NULL, '$2y$10$.y1LQgq.d7luQWjzAFENU.0RAqvKq9hxuYBzZMaVI.VX.HLnQK9ai', NULL, '2023-08-22 17:07:45', '2023-09-25 06:06:15'),
(6, 'jovukis', 'Barrett Bradshaw Kitra Brady Madison Oconnor', 'geti@mailinator.com', 3, 2, 1, 'Uploads/Files/Madison Oconnor.png', 'August 03 2023', NULL, '$2y$10$gifDKibgRydmTUl/WH1Njuy0BvWZp3kegj0gMnpBCJvJrByfFa9Ru', NULL, '2023-08-22 17:09:28', '2023-12-11 12:34:18'),
(7, 'qolykane', 'Alika Hardy August Solomon Kelsie Rodgers', 'nucegolegi@mailinator.com', 3, 2, 1, 'Uploads/Files/Kelsie Rodgers.png', 'August 01 2023', NULL, '$2y$10$c2YbL8F/lACouuv65S9CCebWnC6fM0BtnDnIniu1F34LFhvhNDyU.', NULL, '2023-08-22 17:11:29', '2023-12-17 22:27:26'),
(8, 'zuvewoto', 'Ray Dominguez Michelle Rocha Keefe Ray', 'fybokubyja@mailinator.com', 58, 2, 1, 'Uploads/Files/Keefe Ray.png', 'August 05 2023', NULL, '$2y$10$09FxFKlTdwvnQWLKSgSHvOgNZTI8ldL4suysBIDVYn7FHg9DfjD6a', NULL, '2023-08-22 17:11:59', '2023-12-17 22:28:36'),
(9, 'xugob', 'Abra Carpenter Ethan Wong Oleg Sykes', 'pyfequj@mailinator.com', 3, 2, 0, 'Uploads/Files/Oleg Sykes.png', 'August 20 2023', NULL, '$2y$10$qOQi6hWkW0XdJ.jdvpw28.WQSqVm/j21M4fM9IuuJX0rkrxoe852e', NULL, '2023-08-22 17:12:20', '2023-08-22 17:12:20'),
(10, 'zobuvaf', 'Rafael Howard Tiger Nielsen Xandra Gill', 'lysep@mailinator.com', 46, 2, 0, 'Uploads/Files/Xandra Gill.png', 'August 24 2023', NULL, '$2y$10$U/RZqZtKq17c/kwRegZJ8.EPPqi.t.ctoUr93rqAqWVpFe.0UTq.2', NULL, '2023-08-23 03:00:18', '2023-08-23 03:00:18'),
(11, 'wirudytahu', 'Jenna Banks Suki Wilkinson Wallace Freeman', 'tyfe@mailinator.com', 2, 2, 0, 'Uploads/Files/Wallace Freeman.png', 'November 18 2005', NULL, '$2y$10$O5Zp3cyYXfiTkv7IzBscseag6goJwItAj.xbbczzOjLtqVaHeKu6m', NULL, '2023-08-23 03:01:29', '2023-08-23 03:01:29'),
(12, 'tawuk', 'Lacy Roberts Alexa Oneal Jael Nelson', 'cateju@mailinator.com', 43, 2, 0, 'Uploads/Files/Jael Nelson.png', 'November 30 2005', NULL, '$2y$10$BMDKijeH0D9arqqqLs.30OoT/3ou56hrVOT3cKKgOf/p7sUUy0C5C', NULL, '2023-08-23 03:02:15', '2023-08-23 03:02:15'),
(13, 'xuwymi', 'Karyn Rogers Virginia Hicks Seth Petersen', 'jymy@mailinator.com', 1, 2, 0, 'Uploads/Files/Seth Petersen.png', 'August 24 2023', NULL, '$2y$10$dJrGIbG.wPcF2TzxCCliDOPx3en8Lq7XdojZwSCwGixWiZBPIbm2S', NULL, '2023-08-23 03:06:13', '2023-08-23 03:06:13'),
(14, 'toronalylo', 'Brent Erickson Jerry Blackburn Keelie Cobb', 'tokuva@mailinator.com', 2, 2, 0, 'Uploads/Files/Keelie Cobb.png', 'August 16 2023', NULL, '$2y$10$eRg99Et2U9wIfAEqlbqTROL/fi.cOzyWVB0w0N.u/OrUGoJRY7bNC', NULL, '2023-08-23 03:13:24', '2023-08-23 03:13:24'),
(15, 'fuhadeg', 'Melinda Mendoza Vladimir Carver Taylor Mcneil', 'qolasepuci@mailinator.com', 2, 2, 1, 'Uploads/Files/Taylor Mcneil.png', 'August 13 2023', NULL, '$2y$10$v6n3e0JggRUxZGjNHpV2sOZcutFOq5XON721F.6gS9rKOmsckhDzS', NULL, '2023-08-23 03:18:35', '2023-08-23 03:18:35'),
(16, 'neceqy', 'Yuri Navarro Genevieve Hopper Ashton Scott', 'zigo@mailinator.com', 3, 2, 1, 'Uploads/Files/Ashton Scott.png', 'August 30 2023', NULL, '$2y$10$v6n3e0JggRUxZGjNHpV2sOZcutFOq5XON721F.6gS9rKOmsckhDzS', NULL, '2023-08-25 03:31:41', '2023-08-25 03:31:41'),
(17, 'muhely', 'Shay Travis Ruth Sampson Dante Suarez', 'xana@mailinator.com', 24, 2, 1, 'Uploads/Files/Dante Suarez.png', 'December 19 2023', NULL, '$2y$10$fLlCLrbkPDkEinHdPF3mpO5Lp4mQvEOowFk9qRw2ztEoYffPH/wqK', NULL, '2023-12-17 11:36:31', '2023-12-17 11:36:31');

--
-- Constraints for dumped tables
--

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
  ADD CONSTRAINT `tbl_biddinginfo_ibfk_1` FOREIGN KEY (`bidding_brgy_fk`) REFERENCES `tbl_barangay_coordinates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
