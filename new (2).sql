-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 25, 2022 at 04:21 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new`
--

-- --------------------------------------------------------

--
-- Table structure for table `bot`
--

DROP TABLE IF EXISTS `bot`;
CREATE TABLE IF NOT EXISTS `bot` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bot_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bot`
--

INSERT INTO `bot` (`id`, `bot_id`, `chat_id`, `token`, `created_at`, `updated_at`) VALUES
(1, '5709990405', '5026193329', 'AAHjzoiIrhhENrTZvfm8XWl3jg7zuQfTu_U', '2022-10-28 01:41:32', '2022-10-28 02:18:41'),
(2, '1', 'SILA', 'https://sila-fan-sport.vercel.app/', '2022-11-17 19:14:25', '2022-11-17 19:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `code`, `photo`, `detail`, `created_at`, `updated_at`) VALUES
(2, 'SILA', '54224372', '1667444145-eecd8e8dc307c9624acb3598357ee130.png', NULL, '2022-10-09 21:30:10', '2022-11-02 19:55:45'),
(3, 'LIGHT', '40004461', '1666879901-no_image.png.png', NULL, '2022-10-27 07:11:41', '2022-10-27 07:11:41');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `code`, `photo`, `subcategory`, `slug`, `detail`, `created_at`, `updated_at`) VALUES
(1, 'Drink', '12787403', '1666857073-1280-54505310.jpg', '1', '12787403', NULL, '2022-10-09 18:31:25', '2022-10-27 07:33:58'),
(2, 'Ice', '22785143', '1666857166-stock-vector-set-with-different-iced-coffee-types-vector-illustration-for-poster-or-menu-1464074273.jpg', NULL, '22785143', NULL, '2022-10-27 00:52:46', '2022-10-27 00:52:46'),
(3, 'Fruit', '40976629', '1666857408-images.jpg', NULL, '40976629', NULL, '2022-10-27 00:56:48', '2022-10-27 20:04:03'),
(4, 'AccessoryHouse', '12568000', '', NULL, '12568000', NULL, '2022-10-27 19:18:52', '2022-10-27 19:18:52'),
(5, 'Frappe', '92931035', '', NULL, '92931035', NULL, '2022-10-27 19:20:44', '2022-10-27 19:20:44'),
(6, 'SOFT DRINKS', '61965870', '1666924948-xh09b4xfqz1gppbryu6d.webp', NULL, '61965870', NULL, '2022-10-27 19:42:28', '2022-10-27 19:42:28'),
(7, 'FOOD / មុខម្ហូប', '35768716', '1666926452-traditional-food-around-the-world-Travlinmad.jpg', NULL, '35768716', NULL, '2022-10-27 20:04:17', '2022-10-27 20:07:32'),
(8, 'Milk', '15971336', '', NULL, '15971336', NULL, '2022-10-27 20:23:57', '2022-10-27 20:23:57'),
(9, 'Animal', '38838399', '', NULL, '38838399', NULL, '2022-10-27 20:24:13', '2022-10-27 20:24:13'),
(10, 'Baked Goods', '48627538', '', NULL, '48627538', NULL, '2022-10-27 20:25:08', '2022-10-27 20:25:08'),
(11, 'Candy', '58310696', '', NULL, '58310696', NULL, '2022-10-27 20:25:19', '2022-10-27 20:25:19'),
(12, 'Seafood', '20344655', '', NULL, '20344655', NULL, '2022-10-27 20:25:30', '2022-10-27 20:25:30'),
(13, 'Pizza', '61435377', '', NULL, '61435377', NULL, '2022-10-27 20:25:40', '2022-10-27 20:25:40'),
(14, 'Soups', '69379065', '', NULL, '69379065', NULL, '2022-10-27 20:25:50', '2022-10-27 20:25:50'),
(15, 'Meat', '12206773', '', NULL, '12206773', NULL, '2022-10-27 20:26:07', '2022-10-27 20:26:07'),
(16, 'Snack Foods', '29019112', '', NULL, '29019112', NULL, '2022-10-27 20:26:21', '2022-10-27 20:26:21'),
(17, 'Pasta', '96893834', '', NULL, '96893834', NULL, '2022-10-27 20:26:47', '2022-10-27 20:26:47'),
(18, 'Grilling', '21110962', '', NULL, '21110962', NULL, '2022-10-27 20:26:58', '2022-10-27 20:26:58'),
(19, 'BBQ', '23715974', '', NULL, '23715974', NULL, '2022-10-27 20:27:06', '2022-10-27 20:27:06'),
(20, 'Juice', '02137645', '', NULL, '02137645', NULL, '2022-10-27 20:27:16', '2022-10-27 20:27:16'),
(21, 'Beverages', '65708837', '', NULL, '65708837', NULL, '2022-10-27 20:27:34', '2022-10-27 20:27:34');

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
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
CREATE TABLE IF NOT EXISTS `issue` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issue_item`
--

DROP TABLE IF EXISTS `issue_item`;
CREATE TABLE IF NOT EXISTS `issue_item` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `issue_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_06_13_121005_create_product_table', 1),
(5, '2022_06_13_141543_create_brand_table', 1),
(6, '2022_06_13_141852_create_category_table', 1),
(7, '2022_06_13_142136_create_unit_table', 1),
(8, '2022_06_14_150944_create_subcategory_table', 1),
(9, '2022_10_03_035805_create_warehouse_table', 1),
(10, '2022_10_03_041439_create_payment_method_table', 1),
(11, '2022_10_04_030141_create_people_table', 1),
(12, '2022_10_04_080655_create_permission_tables', 1),
(13, '2022_10_05_013709_create_purchases_table', 2),
(15, '2022_10_09_024400_create_purchases_item_table', 3),
(16, '2022_10_10_064207_create_issue_item_table', 4),
(17, '2022_10_10_064500_create_issue_table', 4),
(18, '2022_10_11_045901_create_production_table', 5),
(19, '2022_10_11_075152_create_process_table', 6),
(21, '2022_10_14_032509_create_process_item_table', 7),
(24, '2022_10_26_050719_create_sales_table', 8),
(25, '2022_10_26_050752_create_sale_item_table', 8),
(26, '2022_10_28_082347_create_bot_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5);

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
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `name`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 'NULL', '2022-10-09 21:30:44', '2022-10-09 21:30:44'),
(2, 'ABA', 'NULL', '2022-10-09 21:30:44', '2022-10-09 21:30:44'),
(3, 'ACLEDA', 'NULL', '2022-10-09 21:30:51', '2022-10-09 21:30:51'),
(4, 'WING', 'NULL', '2022-10-09 21:30:51', '2022-10-09 21:30:51'),
(5, 'EMONEY', 'NULL', '2022-10-09 21:30:51', '2022-10-09 21:30:51'),
(6, 'TRUE MONEY', 'NULL', '2022-10-09 21:30:51', '2022-10-09 21:30:51'),
(7, 'Food-Panda', 'NULL', '2022-10-09 21:30:51', '2022-10-09 21:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
CREATE TABLE IF NOT EXISTS `people` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cf1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cf2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `people_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `email`, `phone`, `address`, `city`, `state`, `postal_code`, `country`, `group_id`, `group_price`, `cf1`, `cf2`, `created_at`, `updated_at`) VALUES
(1, 'Supplier Standard', 'Supplier@gmail.com', '0968877203', 'phnom penh', 'phom penh', NULL, '13001', 'Cambodia', '2', NULL, NULL, NULL, '2022-10-04 19:21:00', '2022-10-04 19:21:55'),
(2, 'Walk-in-Customer', 'customer@gmail.com', '0968877203', 'phnom penh', 'phom penh', '98765', '13001', 'Cambodia', '1', NULL, NULL, NULL, '2022-10-20 02:28:36', '2022-10-20 08:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'add product', 'web', '2022-10-04 01:55:18', '2022-10-04 01:55:18'),
(2, 'edit product', 'web', '2022-10-04 01:55:18', '2022-10-04 01:55:18'),
(3, 'delete product', 'web', '2022-10-04 01:55:18', '2022-10-04 01:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
CREATE TABLE IF NOT EXISTS `process` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `process_item`
--

DROP TABLE IF EXISTS `process_item`;
CREATE TABLE IF NOT EXISTS `process_item` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `process_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `row` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `price` decimal(8,2) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `code`, `type`, `quantity`, `row`, `price`, `cost`, `photo`, `brand`, `category`, `unit`, `alert`, `hide`, `status`, `detail`, `created_at`, `updated_at`) VALUES
(1, 'Dewar\'s 15 YO The Monarch - SHOT', '08054774', 'Final', '64', '0', '70.00', '1.00', '1666776574-cambodia-beer.webp', '2', '1', '1', '1', NULL, NULL, NULL, '2022-10-26 02:26:40', '2022-11-10 19:55:26'),
(2, 'Plom', '60659611', 'Final', '91', '0', '2.00', '1.00', '1666779325-7264a05ed4e80762edfcb62c248f9a25.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 03:15:25', '2022-11-10 20:17:07'),
(3, 'Strawberry', '37972118', 'Final', '-3', '0', '3.00', '2.50', '1666834178-0230ead396138fb6eee1f31fded1075b.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 18:29:38', '2022-11-10 20:17:07'),
(4, 'MANGO WITH CHILI POWDER - ស្វាយក្រឡុក', '86600255', 'Final', '0', '0', '2.00', '0.50', '1666834214-37df28aa8981fa71c1b9c73817015490.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 18:30:14', '2022-11-02 00:59:26'),
(5, 'Daimon', '30299060', 'Final', '-9', '0', '5.50', '2.00', '1666839029-54b2ee58f41457dac3ea31cebf4b43a4.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 19:50:29', '2022-11-10 20:17:07'),
(6, 'Tomato', '91416205', 'Final', '-1', '0', '2.00', '1.00', '1666840991-a17edbcfc7ea3a6b028cfdd96cd0e176.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 20:23:11', '2022-11-02 00:59:26'),
(7, 'Pineapple', '94254435', 'Final', '-1', '0', '5.00', '2.50', '1666841129-80e406cfa7f540795520f88da4dce4e0.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 20:25:29', '2022-11-01 20:06:20'),
(8, 'Watermelon', '57440526', 'Final', '0', '0', '2.50', '1.00', '1666841928-fc3cbbce9a2923ef634f4124ff07301f.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 20:38:48', '2022-10-26 20:38:48'),
(9, 'Nectarine', '21036964', 'Final', '0', '0', '3.50', '2.00', '1666841969-544f643f775615f86d38bef1e8351d55.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 20:39:29', '2022-10-26 20:39:29'),
(10, 'Pear', '41011029', 'Final', '0', '0', '2.00', '1.50', '1666842011-4118ce2d5104f423e320aa5669557dd1.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 20:40:11', '2022-10-26 20:40:11'),
(11, 'Jackfruit', '04740041', 'Final', '0', '0', '5.00', '2.00', '1666842057-667ce13c65671f3fb541813b383f5620.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 20:40:57', '2022-10-27 18:53:11'),
(12, 'Cherry', '18146470', 'Final', '13', '0', '3.00', '1.50', '1666842091-689e3bbb043971c572a73cc966ccf93e.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 20:41:31', '2022-11-17 19:15:53'),
(13, 'Peach', '8846015180014', 'Final', '0', '0', '3.20', '2.00', '1666842130-ca35f9d5d107672f49637f03932cecda.jpeg', '2', '1', '1', NULL, NULL, NULL, NULL, '2022-10-26 20:42:10', '2022-11-02 21:35:01'),
(14, 'Pomegranate', '33021373', 'Final', '0', '0', '2.50', '1.00', '1666842189-09be755a727cdd9a46b5d9fd350e4749.jpeg', '2', '3', '1', NULL, NULL, NULL, NULL, '2022-10-26 20:43:09', '2022-10-27 18:53:04'),
(15, 'Chicken pizza (L)', '45546801', 'Final', '1', '0', '25.00', '15.00', '1666842279-a92bc6c03e635878c0d947e689482717.jpg', '2', '7', '1', NULL, NULL, NULL, NULL, '2022-10-26 20:44:39', '2022-11-04 00:12:30'),
(16, 'Iced Coffee Latte', '42869482', 'Final', '0', '0', '2.50', '1.00', '1666921951-Iced-Latte.webp', '2', '2', '1', NULL, NULL, NULL, NULL, '2022-10-27 01:41:45', '2022-10-27 18:52:31'),
(17, 'Iced Cappuccino', '41796118', 'Final', '0', '0', '2.50', '1.00', '1666921852-Iced-Cappuccino.jpg', '2', '2', '1', NULL, NULL, NULL, NULL, '2022-10-27 01:42:13', '2022-10-27 18:50:52'),
(18, 'Iced Mocha', '67639718', 'Final', '0', '0', '2.50', '1.00', '1666921740-f334428ddd566b8f4296f39b94ed80a9.png', '2', '2', '1', NULL, NULL, NULL, NULL, '2022-10-27 01:42:37', '2022-10-27 18:49:00'),
(19, 'Green Tea', '66543160', 'Final', '11', '0', '3.00', '1.00', '1666921610-paqg7ar9teyiyexeeorw.webp', '2', '1', '1', NULL, NULL, NULL, NULL, '2022-10-27 02:10:38', '2022-11-04 00:12:30'),
(20, 'Light-9', '18602971', 'Final', '0', '0', '2.00', '1.00', '1666879950-no_image.png.png', '2', '4', '1', NULL, NULL, NULL, NULL, '2022-10-27 07:12:30', '2022-10-27 19:19:11'),
(21, 'Coffee Frappe', '06028354', 'Final', '0', '0', '2.50', '1.00', '1666924550-Starbucks-Copycat-Coffee-Frappuccino-LowCarbingAsian-Cover.jpg', '2', '5', '1', NULL, NULL, NULL, NULL, '2022-10-27 19:35:50', '2022-10-27 19:35:50'),
(22, 'ABA', 'SILAasdasdasd', 'Middle', '0', '0', '2.00', '1.00', '', '2', '2', '1', NULL, NULL, NULL, NULL, '2022-11-21 01:49:10', '2022-11-21 01:49:10');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(25,2) NOT NULL,
  `grand_total` decimal(25,2) NOT NULL,
  `total_discount` decimal(25,2) NOT NULL,
  `shipping` decimal(25,2) DEFAULT NULL,
  `paid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `date`, `reference_no`, `supplier_id`, `warehouse_id`, `payment_method`, `note`, `total`, `grand_total`, `total_discount`, `shipping`, `paid`, `created_at`, `updated_at`) VALUES
(1, '2022-11-01 09:13:50', 'SILA', '1', '1', '1', NULL, '200.00', '200.00', '0.00', '0.00', NULL, '2022-10-26 03:15:51', '2022-10-26 03:15:51'),
(2, '2022-11-01 20:11:36', 'SILA', '1', '1', '1', NULL, '16.50', '18.50', '0.00', '2.00', '0', '2022-10-26 20:24:04', '2022-11-02 01:02:44'),
(3, '2022-10-31 21:11:29', 'SILA', '1', '1', '1', NULL, '1.50', '1.50', '0.00', '0.00', NULL, '2022-11-01 02:18:03', '2022-11-01 02:18:03'),
(4, '2022-11-03 19:11:22', 'SILA', '1', '1', '1', NULL, '26.00', '26.00', '0.00', '0.00', '0', '2022-11-02 19:46:23', '2022-11-04 00:12:30'),
(5, '2022-11-18 01:11:54', 'SILA', '1', '1', '1', NULL, '1.50', '1.50', '0.00', '0.00', NULL, '2022-11-17 18:59:01', '2022-11-17 18:59:01'),
(6, '2022-11-18 01:11:54', 'SILA', '1', '1', '1', NULL, '1.50', '1.50', '0.00', '0.00', NULL, '2022-11-17 19:01:09', '2022-11-17 19:01:09'),
(7, '2022-11-18 01:11:54', 'SILA', '1', '1', '1', NULL, '1.50', '1.50', '0.00', '0.00', NULL, '2022-11-17 19:03:56', '2022-11-17 19:03:56'),
(8, '2022-11-18 01:11:54', 'SILA', '1', '1', '1', NULL, '1.50', '1.50', '0.00', '0.00', NULL, '2022-11-17 19:08:29', '2022-11-17 19:08:29'),
(9, '2022-11-18 01:11:54', 'SILA', '1', '1', '1', NULL, '1.50', '1.50', '0.00', '0.00', NULL, '2022-11-17 19:14:25', '2022-11-17 19:14:25'),
(10, '2022-11-18 01:11:54', 'SILA', '1', '1', '1', NULL, '1.50', '1.50', '0.00', '0.00', NULL, '2022-11-17 19:15:09', '2022-11-17 19:15:09'),
(11, '2022-11-18 01:11:54', 'SILA', '1', '1', '1', NULL, '1.50', '1.50', '0.00', '0.00', NULL, '2022-11-17 19:15:53', '2022-11-17 19:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `purchases_item`
--

DROP TABLE IF EXISTS `purchases_item`;
CREATE TABLE IF NOT EXISTS `purchases_item` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchases_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_cost` decimal(8,2) NOT NULL,
  `product_tax` decimal(8,2) DEFAULT NULL,
  `product_discount` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_subtotal` decimal(8,2) NOT NULL,
  `product_quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases_item`
--

INSERT INTO `purchases_item` (`id`, `purchases_id`, `product_id`, `product_code`, `product_name`, `product_cost`, `product_tax`, `product_discount`, `product_subtotal`, `product_quantity`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '08054774', 'ANGKOR', '1.00', '0.00', '0', '100.00', '100', '2022-10-26 03:15:53', '2022-10-26 03:15:53'),
(2, '1', '2', '60659611', 'Plom', '1.00', '0.00', '0', '100.00', '100', '2022-10-26 03:15:53', '2022-10-26 03:15:53'),
(12, '4', '19', '66543160', 'Green Tea', '1.00', '0.00', '0', '1.00', '1', '2022-11-04 00:12:30', '2022-11-04 00:12:30'),
(10, '4', '19', '66543160', 'Green Tea', '1.00', '0.00', '0', '10.00', '10', '2022-11-04 00:12:30', '2022-11-04 00:12:30'),
(11, '4', '15', '45546801', 'Chicken pizza (L)', '15.00', '0.00', '0', '15.00', '1', '2022-11-04 00:12:30', '2022-11-04 00:12:30'),
(8, '2', '12', '18146470', 'Cherry', '1.50', '0.00', '0', '16.50', '11', '2022-11-02 01:02:44', '2022-11-02 01:02:44'),
(7, '3', '12', '18146470', 'Cherry', '1.50', '0.00', '0', '1.50', '1', '2022-11-01 02:18:04', '2022-11-01 02:18:04'),
(13, '11', '12', '18146470', 'Cherry', '1.50', '0.00', '0', '1.50', '1', '2022-11-17 19:15:53', '2022-11-17 19:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'owner', 'web', '2022-10-04 01:55:18', '2022-10-04 01:55:18'),
(2, 'admin', 'web', '2022-10-04 01:55:18', '2022-10-04 01:55:18'),
(3, 'staff', 'web', '2022-10-04 01:55:19', '2022-10-04 01:55:19'),
(4, 'general_manager', 'web', '2022-10-04 01:55:20', '2022-10-04 01:55:20');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(2, 3),
(3, 3),
(1, 4),
(2, 4),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paying_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid` decimal(25,2) DEFAULT NULL,
  `paid_khmer` decimal(25,2) DEFAULT NULL,
  `payableprice` decimal(25,2) DEFAULT NULL,
  `payablepricekhmer` decimal(25,2) DEFAULT NULL,
  `grand_total` decimal(25,2) DEFAULT NULL,
  `total` decimal(25,2) DEFAULT NULL,
  `balance` decimal(25,2) DEFAULT NULL,
  `balancekhmer` decimal(25,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `date`, `type`, `customer_id`, `warehouse_id`, `total_item`, `paying_by`, `discount`, `paid`, `paid_khmer`, `payableprice`, `payablepricekhmer`, `grand_total`, `total`, `balance`, `balancekhmer`, `created_at`, `updated_at`) VALUES
(1, '2022-11-11 02:54:47', '1', '2', '1', '1', '1', '0.00', '100.00', NULL, '70.00', '287000.00', '70.00', '70.00', '-30.00', '-123000.00', '2022-11-10 19:54:47', '2022-11-10 19:54:47'),
(2, '2022-11-12 03:16:50', '1', '2', '1', '2', '1', '0.00', '100.00', NULL, '7.50', '30750.00', '7.50', '7.50', '-92.50', '-379250.00', '2022-11-10 20:16:50', '2022-11-10 20:16:50'),
(3, '2022-11-11 03:17:06', '1', '2', '1', '3', '1', '0.00', '100.00', NULL, '10.50', '43050.00', '10.50', '10.50', '-89.50', '-366950.00', '2022-11-10 20:17:06', '2022-11-10 20:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `sale_item`
--

DROP TABLE IF EXISTS `sale_item`;
CREATE TABLE IF NOT EXISTS `sale_item` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price` decimal(8,2) DEFAULT NULL,
  `product_discount` decimal(8,2) DEFAULT NULL,
  `product_subtotal` decimal(8,2) DEFAULT NULL,
  `product_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_item`
--

INSERT INTO `sale_item` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_price`, `product_discount`, `product_subtotal`, `product_quantity`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '08054774', 'Dewar\'s 15 YO The Monarch - SHOT', '70.00', NULL, '70.00', '1', '2022-11-10 19:55:26', '2022-11-10 19:55:26'),
(2, '2', '2', '60659611', 'Plom', '2.00', NULL, '2.00', '1', '2022-11-10 20:16:51', '2022-11-10 20:16:51'),
(3, '2', '5', '30299060', 'Daimon', '5.50', NULL, '5.50', '1', '2022-11-10 20:16:51', '2022-11-10 20:16:51'),
(4, '3', '2', '60659611', 'Plom', '2.00', NULL, '2.00', '1', '2022-11-10 20:17:07', '2022-11-10 20:17:07'),
(5, '3', '3', '37972118', 'Strawberry', '3.00', NULL, '3.00', '1', '2022-11-10 20:17:07', '2022-11-10 20:17:07'),
(6, '3', '5', '30299060', 'Daimon', '5.50', NULL, '5.50', '1', '2022-11-10 20:17:07', '2022-11-10 20:17:07');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `name`, `code`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'soft-drink', '75809293', '1666881228-88bedc2294480167361d8e1916f63a81.jpg', '2022-10-27 07:33:37', '2022-10-27 07:33:48'),
(2, 'hot-drink', '55651728', '1666881361-a8d48c4e2f2896833d82d1b5d209ff3b.jpg', '2022-10-27 07:36:01', '2022-10-27 07:36:01');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
CREATE TABLE IF NOT EXISTS `unit` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `code`, `photo`, `detail`, `created_at`, `updated_at`) VALUES
(1, 'pcs', '27053117', 'NULL', NULL, '2022-10-09 18:32:40', '2022-10-09 18:32:40'),
(2, 'box', '44984761', 'NULL', NULL, '2022-10-09 18:32:48', '2022-10-09 18:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `status`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'owner', '0968877203', '1', 'owner@gmail.com', '2022-10-04 01:55:20', '$2y$10$K7rQRk8Bpp2TG3RgxEWlYuQEvFJ3AvGbh2fYx8cPy8u7kUFT3DaEC', NULL, '2022-10-04 01:55:20', '2022-10-30 21:18:19'),
(2, 'admin', '0968877203', '2', 'admin@gmail.com', '2022-10-04 01:55:21', '$2y$10$K7rQRk8Bpp2TG3RgxEWlYuQEvFJ3AvGbh2fYx8cPy8u7kUFT3DaEC', NULL, '2022-10-04 01:55:21', '2022-10-30 21:18:32'),
(3, 'staff', '0968877203', '3', 'staff@gmail.com', '2022-10-04 01:55:21', '$2y$10$K7rQRk8Bpp2TG3RgxEWlYuQEvFJ3AvGbh2fYx8cPy8u7kUFT3DaEC', NULL, '2022-10-04 01:55:21', '2022-10-30 20:46:41'),
(4, 'general manager', '0968877203', '4', 'general_manager@gmail.com', '2022-10-04 01:55:22', '$2y$10$K7rQRk8Bpp2TG3RgxEWlYuQEvFJ3AvGbh2fYx8cPy8u7kUFT3DaEC', NULL, '2022-10-04 01:55:22', '2022-10-30 20:46:55'),
(5, 'kongchansila', '0888820390', '2', 'chansila2222@gmail.com', '2022-10-31 03:05:49', '$2y$10$K7rQRk8Bpp2TG3RgxEWlYuQEvFJ3AvGbh2fYx8cPy8u7kUFT3DaEC', NULL, '2022-10-30 19:30:41', '2022-10-30 21:17:32'),
(6, 'sila', '0968877203', NULL, 'sila@gmail.com', NULL, '$2y$10$K7rQRk8Bpp2TG3RgxEWlYuQEvFJ3AvGbh2fYx8cPy8u7kUFT3DaEC', NULL, '2022-10-31 21:01:41', '2022-10-31 21:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `name`, `code`, `photo`, `detail`, `created_at`, `updated_at`) VALUES
(1, 'Bak Tuk', '96766903', 'NULL', NULL, '2022-10-04 19:22:20', '2022-10-04 19:22:20'),
(2, 'Sen Sok', '83376638', 'NULL', NULL, '2022-10-04 19:22:28', '2022-10-04 19:22:28'),
(3, 'SMK', '59616964', 'NULL', NULL, '2022-10-04 19:22:34', '2022-10-04 19:22:34');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
