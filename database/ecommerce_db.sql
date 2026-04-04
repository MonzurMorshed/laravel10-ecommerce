-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Feb 28, 2026 at 03:14 PM
-- Server version: 8.0.45
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `text_1_icon` text COLLATE utf8mb4_unicode_ci,
  `text_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_1_content` text COLLATE utf8mb4_unicode_ci,
  `text_2_icon` text COLLATE utf8mb4_unicode_ci,
  `text_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_2_content` text COLLATE utf8mb4_unicode_ci,
  `text_3_icon` text COLLATE utf8mb4_unicode_ci,
  `text_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_3_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `image`, `name`, `content`, `text_1_icon`, `text_1`, `text_1_content`, `text_2_icon`, `text_2`, `text_2_content`, `text_3_icon`, `text_3`, `text_3_content`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Shoppers Ecommerce', 'About us article here', 'icon-truck', 'FREE SHIPPING', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.', 'icon-refresh2', 'FREE RETURNS', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.', 'icon-help', 'CUSTOMER SUPPORT', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.', '2026-02-28 14:24:00', '2026-02-28 14:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_ust` int DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `image`, `thumbnail`, `name`, `slug`, `content`, `link`, `cat_ust`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Women', 'women', 'Women Product', NULL, NULL, '1', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(2, NULL, NULL, 'Women Jean', 'women-jean', 'Women Jean Product', NULL, 1, '1', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(3, NULL, NULL, 'Men', 'men', 'Men Product', NULL, NULL, '1', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(4, NULL, NULL, 'Men Jean', 'men-jean', 'Men Jean Product', NULL, 3, '1', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(5, NULL, NULL, 'Children', 'children', 'Children Product', NULL, NULL, '1', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(6, NULL, NULL, 'Children Jean', 'children-jean', 'Children Jean Product', NULL, 5, '1', '2026-02-28 14:24:00', '2026-02-28 14:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_08_14_093727_create_sliders_table', 1),
(7, '2023_08_14_104646_create_categories_table', 1),
(8, '2023_08_23_101102_create_abouts_table', 1),
(9, '2023_08_23_171350_create_site_settings_table', 1),
(10, '2023_08_23_181334_create_contacts_table', 1),
(11, '2023_08_24_085710_create_products_table', 1),
(12, '2023_09_05_133324_create_coupons_table', 1),
(13, '2023_09_07_105507_create_orders_table', 1),
(14, '2023_09_07_113040_create_invoices_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `short_text` text COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `image`, `category_id`, `short_text`, `price`, `size`, `color`, `qty`, `status`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Product 1', 'product-1', 'images/cloth_1.jpg', 1, 'short information', 100.00, 'Small', 'White', 10, '1', '<p>This product is very good.</p>', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(2, 'Product 2', 'product-2', 'images/cloth_2.jpg', 2, 'short information 2', 120.00, 'Small', 'White', 2, '1', '<p>This product is very good.</p>', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(3, 'Red M Product', 'red-m-product', NULL, 2, '9 product', 23.00, 'M', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(4, 'Green XL Product', 'green-xl-product', NULL, 4, '3 product', 50.00, 'XL', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(5, 'Red L Product', 'red-l-product', NULL, 3, '9 product', 11.00, 'L', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(6, 'Green XL Product', 'green-xl-product-2', NULL, 3, '5 product', 30.00, 'XL', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(7, 'White M Product', 'white-m-product', NULL, 1, '5 product', 10.00, 'M', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(8, 'Red S Product', 'red-s-product', NULL, 6, '4 product', 28.00, 'S', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(9, 'Green S Product', 'green-s-product', NULL, 1, '5 product', 21.00, 'S', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(10, 'White L Product', 'white-l-product', NULL, 6, '6 product', 19.00, 'L', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(11, 'Red S Product', 'red-s-product-2', NULL, 1, '4 product', 39.00, 'S', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(12, 'Green S Product', 'green-s-product-2', NULL, 3, '9 product', 22.00, 'S', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(13, 'Blue L Product', 'blue-l-product', NULL, 6, '6 product', 31.00, 'L', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(14, 'Red M Product', 'red-m-product-2', NULL, 7, '5 product', 28.00, 'M', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(15, 'Blue XS Product', 'blue-xs-product', NULL, 2, '6 product', 12.00, 'XS', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(16, 'Green XL Product', 'green-xl-product-3', NULL, 6, '3 product', 39.00, 'XL', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(17, 'Red XS Product', 'red-xs-product', NULL, 8, '6 product', 38.00, 'XS', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(18, 'Green XS Product', 'green-xs-product', NULL, 7, '6 product', 30.00, 'XS', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(19, 'Blue L Product', 'blue-l-product-2', NULL, 7, '5 product', 21.00, 'L', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(20, 'Red S Product', 'red-s-product-3', NULL, 4, '7 product', 40.00, 'S', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(21, 'Green XS Product', 'green-xs-product-2', NULL, 5, '1 product', 37.00, 'XS', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(22, 'White S Product', 'white-s-product', NULL, 5, '4 product', 29.00, 'S', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(23, 'Red M Product', 'red-m-product-3', NULL, 4, '7 product', 25.00, 'M', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(24, 'Blue L Product', 'blue-l-product-3', NULL, 1, '6 product', 18.00, 'L', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(25, 'Blue L Product', 'blue-l-product-4', NULL, 1, '2 product', 39.00, 'L', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(26, 'Green XS Product', 'green-xs-product-3', NULL, 6, '7 product', 22.00, 'XS', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(27, 'White XL Product', 'white-xl-product', NULL, 3, '2 product', 21.00, 'XL', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(28, 'Red M Product', 'red-m-product-4', NULL, 4, '2 product', 36.00, 'M', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(29, 'Red XS Product', 'red-xs-product-2', NULL, 7, '3 product', 33.00, 'XS', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(30, 'Blue L Product', 'blue-l-product-5', NULL, 8, '1 product', 50.00, 'L', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(31, 'Blue XL Product', 'blue-xl-product', NULL, 6, '6 product', 46.00, 'XL', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(32, 'Blue M Product', 'blue-m-product', NULL, 6, '3 product', 42.00, 'M', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(33, 'White XL Product', 'white-xl-product-2', NULL, 8, '3 product', 12.00, 'XL', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(34, 'Blue S Product', 'blue-s-product', NULL, 6, '3 product', 32.00, 'S', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(35, 'Blue L Product', 'blue-l-product-6', NULL, 1, '1 product', 43.00, 'L', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(36, 'Blue XL Product', 'blue-xl-product-2', NULL, 3, '8 product', 12.00, 'XL', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(37, 'Blue L Product', 'blue-l-product-7', NULL, 4, '1 product', 16.00, 'L', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(38, 'Green L Product', 'green-l-product', NULL, 8, '4 product', 37.00, 'L', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(39, 'Green L Product', 'green-l-product-2', NULL, 9, '3 product', 48.00, 'L', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(40, 'Red L Product', 'red-l-product-2', NULL, 6, '9 product', 41.00, 'L', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(41, 'White XL Product', 'white-xl-product-3', NULL, 8, '1 product', 24.00, 'XL', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(42, 'Blue S Product', 'blue-s-product-2', NULL, 9, '5 product', 16.00, 'S', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(43, 'Green L Product', 'green-l-product-3', NULL, 9, '8 product', 40.00, 'L', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(44, 'Blue XS Product', 'blue-xs-product-2', NULL, 4, '2 product', 33.00, 'XS', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(45, 'Blue M Product', 'blue-m-product-2', NULL, 8, '8 product', 50.00, 'M', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(46, 'Red S Product', 'red-s-product-4', NULL, 8, '9 product', 27.00, 'S', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(47, 'Red XL Product', 'red-xl-product', NULL, 3, '4 product', 22.00, 'XL', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(48, 'Red XL Product', 'red-xl-product-2', NULL, 9, '8 product', 18.00, 'XL', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(49, 'Blue M Product', 'blue-m-product-3', NULL, 6, '1 product', 13.00, 'M', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(50, 'Blue L Product', 'blue-l-product-8', NULL, 2, '6 product', 19.00, 'L', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(51, 'Red XL Product', 'red-xl-product-3', NULL, 2, '5 product', 32.00, 'XL', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(52, 'Green XS Product', 'green-xs-product-4', NULL, 3, '2 product', 22.00, 'XS', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(53, 'Green XL Product', 'green-xl-product-4', NULL, 4, '4 product', 32.00, 'XL', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(54, 'Red S Product', 'red-s-product-5', NULL, 7, '4 product', 48.00, 'S', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(55, 'Blue XS Product', 'blue-xs-product-3', NULL, 4, '5 product', 42.00, 'XS', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(56, 'Green XL Product', 'green-xl-product-5', NULL, 5, '9 product', 18.00, 'XL', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(57, 'Green XL Product', 'green-xl-product-6', NULL, 2, '2 product', 27.00, 'XL', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(58, 'Green L Product', 'green-l-product-4', NULL, 3, '1 product', 34.00, 'L', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(59, 'Green XS Product', 'green-xs-product-5', NULL, 1, '2 product', 31.00, 'XS', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(60, 'Red XS Product', 'red-xs-product-3', NULL, 1, '4 product', 17.00, 'XS', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(61, 'Red M Product', 'red-m-product-5', NULL, 9, '9 product', 48.00, 'M', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(62, 'Red S Product', 'red-s-product-6', NULL, 9, '4 product', 16.00, 'S', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(63, 'White XL Product', 'white-xl-product-4', NULL, 5, '7 product', 17.00, 'XL', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(64, 'Green S Product', 'green-s-product-3', NULL, 7, '2 product', 19.00, 'S', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(65, 'Blue XS Product', 'blue-xs-product-4', NULL, 4, '4 product', 16.00, 'XS', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(66, 'Red S Product', 'red-s-product-7', NULL, 9, '9 product', 15.00, 'S', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(67, 'Blue XS Product', 'blue-xs-product-5', NULL, 2, '7 product', 33.00, 'XS', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(68, 'Green XL Product', 'green-xl-product-7', NULL, 7, '9 product', 46.00, 'XL', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(69, 'Blue XL Product', 'blue-xl-product-3', NULL, 8, '9 product', 12.00, 'XL', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(70, 'Blue L Product', 'blue-l-product-9', NULL, 1, '3 product', 28.00, 'L', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(71, 'Red XL Product', 'red-xl-product-4', NULL, 1, '4 product', 28.00, 'XL', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(72, 'White XS Product', 'white-xs-product', NULL, 3, '6 product', 28.00, 'XS', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(73, 'Blue M Product', 'blue-m-product-4', NULL, 7, '6 product', 23.00, 'M', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(74, 'Red XL Product', 'red-xl-product-5', NULL, 6, '9 product', 13.00, 'XL', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(75, 'Red L Product', 'red-l-product-3', NULL, 1, '2 product', 25.00, 'L', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(76, 'Blue M Product', 'blue-m-product-5', NULL, 3, '9 product', 42.00, 'M', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(77, 'Green M Product', 'green-m-product', NULL, 4, '1 product', 14.00, 'M', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(78, 'White XL Product', 'white-xl-product-5', NULL, 9, '7 product', 27.00, 'XL', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(79, 'Green XL Product', 'green-xl-product-8', NULL, 6, '1 product', 20.00, 'XL', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(80, 'Green XL Product', 'green-xl-product-9', NULL, 8, '2 product', 30.00, 'XL', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(81, 'Red XS Product', 'red-xs-product-4', NULL, 5, '2 product', 29.00, 'XS', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(82, 'Blue L Product', 'blue-l-product-10', NULL, 5, '6 product', 22.00, 'L', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(83, 'Blue XL Product', 'blue-xl-product-4', NULL, 2, '1 product', 27.00, 'XL', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(84, 'Green L Product', 'green-l-product-5', NULL, 8, '9 product', 15.00, 'L', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(85, 'Blue XL Product', 'blue-xl-product-5', NULL, 2, '6 product', 23.00, 'XL', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(86, 'White XL Product', 'white-xl-product-6', NULL, 3, '7 product', 33.00, 'XL', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(87, 'Green M Product', 'green-m-product-2', NULL, 8, '6 product', 50.00, 'M', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(88, 'Red L Product', 'red-l-product-4', NULL, 9, '3 product', 17.00, 'L', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(89, 'Green XL Product', 'green-xl-product-10', NULL, 3, '2 product', 27.00, 'XL', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(90, 'Blue S Product', 'blue-s-product-3', NULL, 4, '2 product', 24.00, 'S', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(91, 'Green M Product', 'green-m-product-3', NULL, 5, '4 product', 43.00, 'M', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(92, 'Green L Product', 'green-l-product-6', NULL, 4, '7 product', 14.00, 'L', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(93, 'White L Product', 'white-l-product-2', NULL, 7, '8 product', 14.00, 'L', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(94, 'Blue M Product', 'blue-m-product-6', NULL, 4, '6 product', 33.00, 'M', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(95, 'Blue XS Product', 'blue-xs-product-6', NULL, 3, '6 product', 11.00, 'XS', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(96, 'Blue M Product', 'blue-m-product-7', NULL, 2, '3 product', 48.00, 'M', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(97, 'Red XL Product', 'red-xl-product-6', NULL, 6, '4 product', 26.00, 'XL', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(98, 'White M Product', 'white-m-product-2', NULL, 7, '3 product', 15.00, 'M', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:01', '2026-02-28 14:24:01'),
(99, 'Red L Product', 'red-l-product-5', NULL, 6, '8 product', 42.00, 'L', 'Red', 1, '1', 'Product Description', '2026-02-28 14:24:02', '2026-02-28 14:24:02'),
(100, 'Green S Product', 'green-s-product-4', NULL, 5, '5 product', 36.00, 'S', 'Green', 1, '1', 'Product Description', '2026-02-28 14:24:02', '2026-02-28 14:24:02'),
(101, 'White S Product', 'white-s-product-2', NULL, 6, '4 product', 38.00, 'S', 'White', 1, '1', 'Product Description', '2026-02-28 14:24:02', '2026-02-28 14:24:02'),
(102, 'Blue XL Product', 'blue-xl-product-6', NULL, 3, '6 product', 24.00, 'XL', 'Blue', 1, '1', 'Product Description', '2026-02-28 14:24:02', '2026-02-28 14:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `set_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `name`, `data`, `set_type`, `created_at`, `updated_at`) VALUES
(1, 'Title', 'Ecommerce', 'text', '2026-02-28 14:15:37', '2026-02-28 14:15:37'),
(2, 'address', 'The address of the site is here', NULL, '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(3, 'phone', '0 123 456', NULL, '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(4, 'email', 'shoppers@domain.com', NULL, '2026-02-28 14:24:00', '2026-02-28 14:24:00'),
(5, 'map', NULL, NULL, '2026-02-28 14:24:00', '2026-02-28 14:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `name`, `content`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'https://fakeimg.pl/250x100/', 'Slider1', 'Welcome to our e-commerce site', 'product', '1', '2026-02-28 14:24:00', '2026-02-28 14:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` int NOT NULL DEFAULT '0',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Md Monzur Morshed Obyed Ullah', 'monzurmorshedcse@gmail.com', NULL, '$2y$10$oKfb7RnBJoZVeKa2y3o0ie4t7QTtXg4cWfsHBq.HpyF4loR2usQze', 0, '0', NULL, '2026-02-28 14:08:42', '2026-02-28 14:08:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
