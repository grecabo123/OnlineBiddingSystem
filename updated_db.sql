-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 01, 2023 at 02:18 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(14, '2023_10_08_123258_create_tbl_price_table', 9);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 1, 'artamay1@gmail.com_Admin', 'eec9fa4dee43522a32d0d1abe8d8fff2fa50bd119f4d26d07066aa16d97d7245', '[\"server:admin\"]', '2023-11-01 06:00:25', '2023-11-01 05:36:50', '2023-11-01 06:00:25');

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
  `item_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_bidding` double(10,2) NOT NULL,
  `bidding_item_user_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_biddingamount_bidding_amt_fk_foreign` (`bidding_amt_fk`),
  KEY `tbl_biddingamount_bidding_item_user_fk_foreign` (`bidding_item_user_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_biddingamount`
--

INSERT INTO `tbl_biddingamount` (`id`, `bidding_amt_fk`, `item_desc`, `amount_bidding`, `bidding_item_user_fk`, `created_at`, `updated_at`) VALUES
(17, 39, 'I want this Product notice me', 12300.00, 2, '2023-10-07 23:32:27', '2023-10-07 23:32:27'),
(18, 38, 'dawdawdfafga', 13500.00, 2, '2023-10-08 00:44:21', '2023-10-08 00:44:21'),
(19, 37, 'I want this product', 2301.00, 2, '2023-10-22 05:31:52', '2023-10-22 05:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_biddinginfo`
--

DROP TABLE IF EXISTS `tbl_biddinginfo`;
CREATE TABLE IF NOT EXISTS `tbl_biddinginfo` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bidding_brgy_fk` bigint(20) UNSIGNED NOT NULL,
  `bidding_item_fk` bigint(20) UNSIGNED NOT NULL,
  `user_info_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_biddinginfo_bidding_item_fk_foreign` (`bidding_item_fk`),
  KEY `bidding_brgy_fk` (`bidding_brgy_fk`),
  KEY `user_info_fk` (`user_info_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_biddinginfo`
--

INSERT INTO `tbl_biddinginfo` (`id`, `address`, `bidding_brgy_fk`, `bidding_item_fk`, `user_info_fk`, `created_at`, `updated_at`) VALUES
(37, 'Repellendus Et assu', 15, 37, 2, '2023-10-05 05:58:05', '2023-10-05 05:58:05'),
(38, 'Sint aut itaque repr', 24, 38, 4, '2023-10-05 05:58:42', '2023-10-05 05:58:42'),
(39, 'Quia quaerat totam m', 14, 39, 7, '2023-10-05 06:25:22', '2023-10-05 06:25:22'),
(40, 'Repellendus Ut illo', 16, 40, 9, '2023-10-05 07:00:14', '2023-10-05 07:00:14'),
(41, 'Est dolorem sint aut', 51, 43, 2, '2023-10-07 10:14:56', '2023-10-07 10:14:56'),
(42, 'Aut esse explicabo', 11, 44, 2, '2023-10-07 10:48:21', '2023-10-07 10:48:21'),
(43, 'Baan Km 3', 21, 45, 2, '2023-10-07 20:33:18', '2023-10-07 20:33:18'),
(44, 'Et pariatur Odio am', 14, 46, 2, '2023-10-07 22:08:33', '2023-10-07 22:08:33'),
(45, 'Ullam incidunt proi', 51, 47, 2, '2023-10-08 00:20:20', '2023-10-08 00:20:20'),
(46, 'Qui ad corporis in u', 51, 48, 2, '2023-10-08 00:25:37', '2023-10-08 00:25:37'),
(47, 'Nesciunt dignissimo', 81, 49, 2, '2023-10-08 00:44:02', '2023-10-08 00:44:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_biddingitem`
--

DROP TABLE IF EXISTS `tbl_biddingitem`;
CREATE TABLE IF NOT EXISTS `tbl_biddingitem` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniq_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `product_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_status` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date_now` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date_now` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `milliseconds_data` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_biddingitem`
--

INSERT INTO `tbl_biddingitem` (`id`, `uniq_key`, `name`, `price`, `product_type`, `price_status`, `description`, `start_date_now`, `end_date_now`, `milliseconds_data`, `created_at`, `updated_at`) VALUES
(37, 'f25a2fc72690b780b2a14e140ef6a9e0', 'Benedict Ewing', 2301, 'Copras', 1, 'Copra is valued for the coconut oil extracted from it and for the resulting residue, coconut-oil cake, which is used mostly for livestock feed', NULL, NULL, '0', '2023-10-05 05:58:05', '2023-10-05 05:58:05'),
(38, '07cc694b9b3fc636710fa08b6922c42b', 'Kirsten Bright', 13400, 'Copras', 0, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere', 'Oct 8 2023', 'Oct 10 2023', '05:00 pm', '2023-10-05 05:58:42', '2023-10-05 05:58:42'),
(39, '8c0d42ed562b432e5efa4654b4818f0f', 'Jamalia Wong', 12300, 'Whole', 1, 'Copra is valued for the coconut oil extracted from it and for the resulting residue, coconut-oil cake, which is used mostly for livestock feed', NULL, NULL, '0', '2023-10-05 06:25:22', '2023-10-05 06:25:22'),
(40, 'cea7be7af3a1e9d2286067874bdced56', 'Cassandra Rogers', 12345, 'Copras', 0, 'Aliquip aliquip dolo daw8yhdji0aw odjaw 8hdaw9h da9widj a0wi9d uwghuiawh dioawhdiuawdghiuawdghawuidhawiodhawuidhawiodjawiohdawiodhawiodhawopdjawdd', NULL, NULL, '0', '2023-10-05 07:00:14', '2023-10-05 07:00:14'),
(43, '040382cceaa6a001195596406ece1955', 'Robert Price', 1300, 'Copras', 1, 'Sequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur comSequi aspernatur com', NULL, NULL, '0', '2023-10-07 10:14:56', '2023-10-07 10:14:56'),
(44, '328c46589e3b29a5619c3de5f6a62a31', 'Kaye Keith', 1903, 'Copras', 0, 'Adipisci blanditiis Adipisci blanditiis Adipisci blanditiis Adipisci blanditiis Adipisci blanditiis Adipisci blanditiis Adipisci blanditiis Adipisci blanditiis Adipisci blanditiis Adipisci blanditiis Adipisci blanditiis Adipisci blanditiis Adipisci blanditiis', NULL, NULL, '0', '2023-10-07 10:48:21', '2023-10-07 10:48:21'),
(45, '5e26bb3cd43bd8f3f3eb2d0277763914', 'Ignacia Graham', 1230, 'Copras', 0, 'dawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iudawuogdhijwayvbdiuawod iu', NULL, NULL, '0', '2023-10-07 20:33:18', '2023-10-07 20:33:18'),
(46, '4e7bb7abf2eb4bc366747be77b00c381', 'Caryn Hendrix', 2134, 'Copras', 0, 'Eligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita etEligendi expedita et', 'Oct 8 2023', 'Oct 10 2023', '', '2023-10-07 22:08:33', '2023-10-07 22:08:33'),
(47, '5addb4c6f289e508e52cec21c318c29f', 'Cooper Alvarez', 12300, 'Whole', 0, 'Vel consequuntur con', 'Oct 18 2023', 'Oct 8 2023', '05:00 pm', '2023-10-08 00:20:20', '2023-10-08 00:20:20'),
(48, '6ff9480e4e6a20bbb16c7cf00000133b', 'Herrod Rosa', 12393, 'Whole', 0, 'Pariatur Libero cul', 'Oct 8 2023', 'Oct 10 2023', '05:00 pm', '2023-10-08 00:25:37', '2023-10-08 00:25:37'),
(49, '23da69399ba9cb2cb135a8c4857f5810', 'Calista Velazquez', 12300, 'Copras', 0, 'Exercitationem aut o', 'Oct 8 2023', 'Oct 9 2023', '05:00 pm', '2023-10-08 00:44:02', '2023-10-08 00:44:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_bidding_image`
--

INSERT INTO `tbl_bidding_image` (`id`, `image`, `item_fk`, `created_at`, `updated_at`) VALUES
(5, 'Uploads/Files/94d007bb2368625892b9780059691fb7.jpg', 37, '2023-10-05 05:58:05', '2023-10-05 05:58:05'),
(6, 'Uploads/Files/9d283fa9b2883f3cbda55188d5ced9e7.jpg', 38, '2023-10-05 05:58:42', '2023-10-05 05:58:42'),
(7, 'Uploads/Files/21280939b6270a1e55b67b2de975fac9.jpg', 39, '2023-10-05 06:25:22', '2023-10-05 06:25:22'),
(8, 'Uploads/Files/671c7237876e873b774309a7abcf8021.jpg', 40, '2023-10-05 07:00:14', '2023-10-05 07:00:14'),
(9, 'Uploads/Files/531fffd6e96d9cb4bec8bf5e52f0e6c3.jpg', 43, '2023-10-07 10:14:56', '2023-10-07 10:14:56'),
(10, 'Uploads/Files/7d1c5ab45bec23b9a76cf71508fbb0d0.jpg', 44, '2023-10-07 10:48:21', '2023-10-07 10:48:21'),
(11, 'Uploads/Files/3b5f031f339c0bd4f5f003a75ca743a5.jpg', 45, '2023-10-07 20:33:18', '2023-10-07 20:33:18'),
(12, 'Uploads/Files/d293b694f353b1c27f6a5b680c2070a9.jpg', 46, '2023-10-07 22:08:33', '2023-10-07 22:08:33'),
(13, 'Uploads/Files/d0477f42431dfa8eb7b98c88fdb26f6c.jpg', 47, '2023-10-08 00:20:20', '2023-10-08 00:20:20'),
(14, 'Uploads/Files/95d04d90fb0243e32dd29bfc88857049.jpg', 48, '2023-10-08 00:25:38', '2023-10-08 00:25:38'),
(15, 'Uploads/Files/9c66f9123a30cef6d9b59603980f405c.jpg', 49, '2023-10-08 00:44:02', '2023-10-08 00:44:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`id`, `contact_number`, `home_address`, `zipcode`, `contact_user_fk`, `created_at`, `updated_at`) VALUES
(1, '09213123123', 'Baan Km3', '8600', 1, '2023-08-20 05:35:47', '2023-08-20 05:35:47'),
(2, '09213123123', 'Baan Km3', '8600', 2, '2023-08-21 02:58:19', '2023-08-21 02:58:19'),
(3, 'Vel quis sed quasi v', 'Ut excepteur laboris', '39112', 3, '2023-08-22 17:04:19', '2023-08-22 17:04:19'),
(4, '09213123123', 'Et in dolore impedit', '33730', 4, '2023-08-22 17:06:39', '2023-08-22 17:06:39'),
(5, 'Id quibusda', 'Consequat Duis dolo', '90926', 5, '2023-08-22 17:07:45', '2023-08-22 17:07:45'),
(6, 'Dolores non', 'Facere qui earum nis', '44545', 6, '2023-08-22 17:09:28', '2023-08-22 17:09:28'),
(7, 'Et incidunt', 'Culpa soluta repelle', '23913', 7, '2023-08-22 17:11:29', '2023-08-22 17:11:29'),
(8, 'Dolore volu', 'Velit culpa ex labor', '89922', 8, '2023-08-22 17:11:59', '2023-08-22 17:11:59'),
(9, 'In explicab', 'Molestiae natus dolo', '41106', 9, '2023-08-22 17:12:20', '2023-08-22 17:12:20'),
(10, 'Eum eos rem', 'Illo elit sunt volu', '79179', 10, '2023-08-23 03:00:18', '2023-08-23 03:00:18'),
(11, '12312321543', 'Maxime vel dolores s', '68515', 11, '2023-08-23 03:01:29', '2023-08-23 03:01:29'),
(12, '09213254354', 'Perspiciatis quis v', '71548', 12, '2023-08-23 03:02:15', '2023-08-23 03:02:15'),
(13, 'Necessitati', 'Ab ullamco suscipit', '43567', 13, '2023-08-23 03:06:13', '2023-08-23 03:06:13'),
(14, 'Dolor ad cu', 'Nemo velit soluta re', '30635', 14, '2023-08-23 03:13:24', '2023-08-23 03:13:24'),
(15, '09232276437', 'Sunt ullam quisquam', '31054', 15, '2023-08-23 03:18:35', '2023-08-23 03:18:35'),
(16, 'Ullamco sim', 'Et cupiditate vel il', '54916', 16, '2023-08-25 03:31:41', '2023-08-25 03:31:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`id`, `activity`, `user_logs_fk`, `created_at`, `updated_at`) VALUES
(1, 'artamay12@gmail.com Sent Message-Approved', 1, '2023-08-22 04:49:50', '2023-08-22 04:49:50'),
(2, 'jepexuv@mailinator.com Sent Message-Approved', 1, '2023-08-23 03:21:27', '2023-08-23 03:21:27'),
(3, 'byfekufi@mailinator.com Sent Message-Approved', 1, '2023-08-26 07:01:02', '2023-08-26 07:01:02'),
(4, 'Creating Bidding Item Lubi', 2, '2023-09-16 09:20:51', '2023-09-16 09:20:51'),
(5, 'Creating Bidding Item Naida Solomon', 2, '2023-09-16 10:15:43', '2023-09-16 10:15:43'),
(6, 'bihij@mailinator.com Sent Message-Approved', 1, '2023-09-25 06:06:15', '2023-09-25 06:06:15'),
(7, 'Creating Bidding Item Rhona Acevedo', 2, '2023-10-05 05:41:52', '2023-10-05 05:41:52'),
(8, 'Creating Bidding Item Jarrod Riley', 2, '2023-10-05 05:44:25', '2023-10-05 05:44:25'),
(9, 'Creating Bidding Item Travis Avery', 2, '2023-10-05 05:45:41', '2023-10-05 05:45:41'),
(10, 'Creating Bidding Item Quamar Allen', 2, '2023-10-05 05:46:46', '2023-10-05 05:46:46'),
(11, 'Creating Bidding Item Clayton Mccullough', 2, '2023-10-05 05:53:39', '2023-10-05 05:53:39'),
(12, 'Creating Bidding Item Benedict Ewing', 2, '2023-10-05 05:58:05', '2023-10-05 05:58:05'),
(13, 'Creating Bidding Item Kirsten Bright', 2, '2023-10-05 05:58:42', '2023-10-05 05:58:42'),
(14, 'Creating Bidding Item Jamalia Wong', 2, '2023-10-05 06:25:22', '2023-10-05 06:25:22'),
(15, 'Creating Bidding Item Cassandra Rogers', 2, '2023-10-05 07:00:14', '2023-10-05 07:00:14'),
(16, 'Creating Bidding Item Robert Price', 2, '2023-10-07 10:14:56', '2023-10-07 10:14:56'),
(17, 'Creating Bidding Item Kaye Keith', 2, '2023-10-07 10:48:21', '2023-10-07 10:48:21'),
(18, 'Creating Bidding Item Ignacia Graham', 2, '2023-10-07 20:33:18', '2023-10-07 20:33:18'),
(19, 'Creating Bidding Item Caryn Hendrix', 2, '2023-10-07 22:08:33', '2023-10-07 22:08:33'),
(20, 'Creating Bidding Item Cooper Alvarez', 2, '2023-10-08 00:20:20', '2023-10-08 00:20:20'),
(21, 'Creating Bidding Item Herrod Rosa', 2, '2023-10-08 00:25:38', '2023-10-08 00:25:38'),
(22, 'Creating Bidding Item Calista Velazquez', 2, '2023-10-08 00:44:02', '2023-10-08 00:44:02'),
(23, 'Copras Changed Price to 23', 1, '2023-10-29 10:59:33', '2023-10-29 10:59:33'),
(24, 'Copras Changed Price to 38', 1, '2023-10-29 11:05:55', '2023-10-29 11:05:55'),
(25, 'Copras Changed Price to 32.82', 1, '2023-10-29 11:09:24', '2023-10-29 11:09:24'),
(26, 'Copras Changed Price to 32.5', 1, '2023-10-29 11:28:54', '2023-10-29 11:28:54'),
(27, 'Copras Changed Price to 23', 1, '2023-10-29 11:29:30', '2023-10-29 11:29:30'),
(28, 'Copras Changed Price to 31.34', 1, '2023-10-29 11:29:58', '2023-10-29 11:29:58'),
(29, 'Copras Changed Price to 23.4', 1, '2023-10-29 11:32:09', '2023-10-29 11:32:09'),
(30, 'Copras Changed Price to 232', 1, '2023-10-29 11:35:33', '2023-10-29 11:35:33'),
(31, 'Copras Changed Price to 25.51', 1, '2023-10-29 11:42:55', '2023-10-29 11:42:55'),
(32, 'Copras Changed Price to 100', 1, '2023-10-29 11:43:34', '2023-10-29 11:43:34'),
(33, 'Copras Changed Price to 60.4', 1, '2023-10-29 11:45:37', '2023-10-29 11:45:37'),
(34, 'Copras Changed Price to 76.41', 1, '2023-10-29 11:45:57', '2023-10-29 11:45:57'),
(35, 'Copras Changed Price to 14.5', 1, '2023-10-29 11:51:47', '2023-10-29 11:51:47'),
(36, 'Copras Changed Price to 44.41', 1, '2023-10-29 11:53:12', '2023-10-29 11:53:12'),
(37, 'Copras Changed Price to 70.52', 1, '2023-10-29 12:42:38', '2023-10-29 12:42:38'),
(38, 'Copras Changed Price to 71.61', 1, '2023-10-29 23:17:49', '2023-10-29 23:17:49'),
(39, 'Copras Changed Price to 55.54', 1, '2023-10-29 23:26:17', '2023-10-29 23:26:17'),
(40, 'Copras Changed Price to 49.08', 1, '2023-10-29 23:26:55', '2023-10-29 23:26:55'),
(41, 'Copras Changed Price to 54.03', 1, '2023-11-01 05:42:28', '2023-11-01 05:42:28'),
(42, 'Copras Changed Price to 60.26', 1, '2023-11-01 05:43:11', '2023-11-01 05:43:11'),
(43, 'Copras Changed Price to 84.29', 1, '2023-11-01 06:00:16', '2023-11-01 06:00:16'),
(44, 'Copras Changed Price to 79.08', 1, '2023-11-01 06:01:32', '2023-11-01 06:01:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_message`
--

DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE IF NOT EXISTS `tbl_message` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_message_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_message_user_message_fk_foreign` (`user_message_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_message`
--

INSERT INTO `tbl_message` (`id`, `subject`, `message`, `user_message_fk`, `created_at`, `updated_at`) VALUES
(1, 'Approved', '<p>Account Approved</p>', 2, '2023-08-22 04:49:50', '2023-08-22 04:49:50'),
(2, 'Approved', '<p>adihaidhajdaiwhdawhd</p>', 3, '2023-08-23 03:21:27', '2023-08-23 03:21:27'),
(3, 'Approved', '<p>Hello Approved na imong account pwede naka maka login.</p>', 4, '2023-08-26 07:01:02', '2023-08-26 07:01:02'),
(4, 'Approved', '<p>sawdad</p>', 5, '2023-09-25 06:06:15', '2023-09-25 06:06:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_price`
--

INSERT INTO `tbl_price` (`id`, `current_price`, `new_price`, `name_tag`, `name_tag_int`, `created_at`, `updated_at`) VALUES
(14, 0.00, 100.00, NULL, 1, '2023-10-29 11:43:34', '2023-10-29 11:43:34'),
(15, 100.00, 60.40, NULL, 1, '2023-10-29 11:45:37', '2023-10-29 11:45:37'),
(16, 60.40, 76.41, NULL, 1, '2023-10-29 11:45:57', '2023-10-29 11:45:57'),
(17, 0.00, 14.50, NULL, 2, '2023-10-29 11:51:47', '2023-10-29 11:51:47'),
(18, 14.50, 44.41, NULL, 2, '2023-10-29 11:53:12', '2023-10-29 11:53:12'),
(19, 76.41, 70.52, NULL, 1, '2023-10-29 12:42:38', '2023-10-29 12:42:38'),
(20, 70.52, 71.61, NULL, 1, '2023-10-29 23:17:49', '2023-10-29 23:17:49'),
(21, 44.41, 55.54, NULL, 2, '2023-10-29 23:26:17', '2023-10-29 23:26:17'),
(22, 55.54, 49.08, NULL, 2, '2023-10-29 23:26:55', '2023-10-29 23:26:55'),
(23, 71.61, 54.03, NULL, 1, '2023-11-01 05:42:28', '2023-11-01 05:42:28'),
(24, 49.08, 60.26, NULL, 2, '2023-11-01 05:43:11', '2023-11-01 05:43:11'),
(25, 54.03, 84.29, NULL, 1, '2023-11-01 06:00:16', '2023-11-01 06:00:16'),
(26, 84.29, 79.08, NULL, 1, '2023-11-01 06:01:32', '2023-11-01 06:01:32');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_reports`
--

INSERT INTO `tbl_reports` (`id`, `messagecode`, `report_msg`, `user_report_fk`, `created_at`, `updated_at`) VALUES
(1, 'dawda', 'Report Scam', 16, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name_user`, `email`, `user_brgy_fk`, `role`, `status`, `files`, `birthdate`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'arta', 'Georgie Mordeno Recabo', 'artamay1@gmail.com', 9, 1, 1, 'Uploads/Files/Recabo.png', 'August 20 2023', NULL, '$2y$10$qsFKTQZmw6Fx.7teuFIwMuxdqPYb7gbdOHVJcNNdPNRl7vo1LLHAq', NULL, '2023-08-20 05:35:47', '2023-08-20 05:35:47'),
(2, 'arta', 'John Pandaa ArtaMay', 'artamay12@gmail.com', 46, 2, 1, 'Uploads/Files/ArtaMay.png', 'August 24 2023', NULL, '$2y$10$qSITeM88v4gnl4ZZF2KD7eiYtT133xRN1O6L0oIKrAjDiNA1EjRJO', NULL, '2023-08-21 02:58:19', '2023-08-22 04:49:50'),
(3, 'byfyvyq', 'Adrienne Richardson Stephen Guzman Imelda Conner', 'jepexuv@mailinator.com', 29, 2, 1, 'Uploads/Files/Imelda Conner.jpg', 'August 09 2023', NULL, '$2y$10$7DtdfMLCR2HjloK16Uk9/eDKmGQV5zLqLTbVD8P4ppQqSTEv.xHUe', NULL, '2023-08-22 17:04:19', '2023-08-23 03:21:27'),
(4, 'jamefakevi', 'Sherilyn Briones', 'byfekufi@mailinator.com', 2, 2, 1, 'Uploads/Files/Demetria Rose.png', 'August 31 2023', NULL, '$2y$10$F0AvO86B7L2ii.BWPSmzPOxkrlm.xOMBEt7m.zYwHJT.yuhc028Sa', NULL, '2023-08-22 17:06:39', '2023-08-26 07:01:02'),
(5, 'ryhedar', 'Tyrone Meadows Quin Freeman Natalie Barber', 'bihij@mailinator.com', 1, 2, 1, 'Uploads/Files/Natalie Barber.png', 'August 07 2023', NULL, '$2y$10$.y1LQgq.d7luQWjzAFENU.0RAqvKq9hxuYBzZMaVI.VX.HLnQK9ai', NULL, '2023-08-22 17:07:45', '2023-09-25 06:06:15'),
(6, 'jovukis', 'Barrett Bradshaw Kitra Brady Madison Oconnor', 'geti@mailinator.com', 3, 2, 0, 'Uploads/Files/Madison Oconnor.png', 'August 03 2023', NULL, '$2y$10$gifDKibgRydmTUl/WH1Njuy0BvWZp3kegj0gMnpBCJvJrByfFa9Ru', NULL, '2023-08-22 17:09:28', '2023-08-22 17:09:28'),
(7, 'qolykane', 'Alika Hardy August Solomon Kelsie Rodgers', 'nucegolegi@mailinator.com', 3, 2, 0, 'Uploads/Files/Kelsie Rodgers.png', 'August 01 2023', NULL, '$2y$10$c2YbL8F/lACouuv65S9CCebWnC6fM0BtnDnIniu1F34LFhvhNDyU.', NULL, '2023-08-22 17:11:29', '2023-08-22 17:11:29'),
(8, 'zuvewoto', 'Ray Dominguez Michelle Rocha Keefe Ray', 'fybokubyja@mailinator.com', 58, 2, 0, 'Uploads/Files/Keefe Ray.png', 'August 05 2023', NULL, '$2y$10$09FxFKlTdwvnQWLKSgSHvOgNZTI8ldL4suysBIDVYn7FHg9DfjD6a', NULL, '2023-08-22 17:11:59', '2023-08-22 17:11:59'),
(9, 'xugob', 'Abra Carpenter Ethan Wong Oleg Sykes', 'pyfequj@mailinator.com', 3, 2, 0, 'Uploads/Files/Oleg Sykes.png', 'August 20 2023', NULL, '$2y$10$qOQi6hWkW0XdJ.jdvpw28.WQSqVm/j21M4fM9IuuJX0rkrxoe852e', NULL, '2023-08-22 17:12:20', '2023-08-22 17:12:20'),
(10, 'zobuvaf', 'Rafael Howard Tiger Nielsen Xandra Gill', 'lysep@mailinator.com', 46, 2, 0, 'Uploads/Files/Xandra Gill.png', 'August 24 2023', NULL, '$2y$10$U/RZqZtKq17c/kwRegZJ8.EPPqi.t.ctoUr93rqAqWVpFe.0UTq.2', NULL, '2023-08-23 03:00:18', '2023-08-23 03:00:18'),
(11, 'wirudytahu', 'Jenna Banks Suki Wilkinson Wallace Freeman', 'tyfe@mailinator.com', 2, 2, 0, 'Uploads/Files/Wallace Freeman.png', 'November 18 2005', NULL, '$2y$10$O5Zp3cyYXfiTkv7IzBscseag6goJwItAj.xbbczzOjLtqVaHeKu6m', NULL, '2023-08-23 03:01:29', '2023-08-23 03:01:29'),
(12, 'tawuk', 'Lacy Roberts Alexa Oneal Jael Nelson', 'cateju@mailinator.com', 43, 2, 0, 'Uploads/Files/Jael Nelson.png', 'November 30 2005', NULL, '$2y$10$BMDKijeH0D9arqqqLs.30OoT/3ou56hrVOT3cKKgOf/p7sUUy0C5C', NULL, '2023-08-23 03:02:15', '2023-08-23 03:02:15'),
(13, 'xuwymi', 'Karyn Rogers Virginia Hicks Seth Petersen', 'jymy@mailinator.com', 1, 2, 0, 'Uploads/Files/Seth Petersen.png', 'August 24 2023', NULL, '$2y$10$dJrGIbG.wPcF2TzxCCliDOPx3en8Lq7XdojZwSCwGixWiZBPIbm2S', NULL, '2023-08-23 03:06:13', '2023-08-23 03:06:13'),
(14, 'toronalylo', 'Brent Erickson Jerry Blackburn Keelie Cobb', 'tokuva@mailinator.com', 2, 2, 0, 'Uploads/Files/Keelie Cobb.png', 'August 16 2023', NULL, '$2y$10$eRg99Et2U9wIfAEqlbqTROL/fi.cOzyWVB0w0N.u/OrUGoJRY7bNC', NULL, '2023-08-23 03:13:24', '2023-08-23 03:13:24'),
(15, 'fuhadeg', 'Melinda Mendoza Vladimir Carver Taylor Mcneil', 'qolasepuci@mailinator.com', 2, 2, 0, 'Uploads/Files/Taylor Mcneil.png', 'August 13 2023', NULL, '$2y$10$IeQhkkE450c76LBx7qQ3XuSKDVQhY7o0BKfWvw71IicmXOuNE.Vz6', NULL, '2023-08-23 03:18:35', '2023-08-23 03:18:35'),
(16, 'neceqy', 'Yuri Navarro Genevieve Hopper Ashton Scott', 'zigo@mailinator.com', 3, 2, 0, 'Uploads/Files/Ashton Scott.png', 'August 30 2023', NULL, '$2y$10$v6n3e0JggRUxZGjNHpV2sOZcutFOq5XON721F.6gS9rKOmsckhDzS', NULL, '2023-08-25 03:31:41', '2023-08-25 03:31:41');

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
  ADD CONSTRAINT `tbl_biddinginfo_bidding_item_fk_foreign` FOREIGN KEY (`bidding_item_fk`) REFERENCES `tbl_biddingitem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_biddinginfo_ibfk_1` FOREIGN KEY (`bidding_brgy_fk`) REFERENCES `tbl_barangay_coordinates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_biddinginfo_ibfk_2` FOREIGN KEY (`user_info_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  ADD CONSTRAINT `tbl_reports_user_report_fk_foreign` FOREIGN KEY (`user_report_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_brgy_fk`) REFERENCES `tbl_barangay_coordinates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
