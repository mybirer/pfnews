-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2017 at 01:12 PM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pf_news`
--
CREATE DATABASE IF NOT EXISTS `pf_news` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pf_news`;

-- --------------------------------------------------------

--
-- Table structure for table `pf_adverts`
--

DROP TABLE IF EXISTS `pf_adverts`;
CREATE TABLE IF NOT EXISTS `pf_adverts` (
  `pkadvert` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `location` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `finish_date` timestamp NULL DEFAULT NULL,
  `embed` text,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `click` int(11) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pkadvert`),
  KEY `location` (`location`),
  KEY `created_by` (`created_by`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_adverts`
--

INSERT INTO `pf_adverts` (`pkadvert`, `name`, `description`, `location`, `created_at`, `created_by`, `start_date`, `finish_date`, `embed`, `image`, `link`, `click`, `view`, `active`) VALUES
(2, 'name', 'description', 'location', '2017-07-13 15:09:40', 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pf_articles`
--

DROP TABLE IF EXISTS `pf_articles`;
CREATE TABLE IF NOT EXISTS `pf_articles` (
  `pkarticle` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `summary` text,
  `content` longtext NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `allow_comments` tinyint(1) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  `state` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pkarticle`),
  KEY `fk_category` (`category_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_bulletins`
--

DROP TABLE IF EXISTS `pf_bulletins`;
CREATE TABLE IF NOT EXISTS `pf_bulletins` (
  `pkbulletin` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `news` text NOT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`pkbulletin`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_categories`
--

DROP TABLE IF EXISTS `pf_categories`;
CREATE TABLE IF NOT EXISTS `pf_categories` (
  `pkcategory` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'Kategorinin görünen ismi',
  `name` varchar(255) NOT NULL COMMENT 'Kategorinin kısaltma ismi.(unique)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL COMMENT 'Kategorinin görüntülenme sırası',
  `top_menu` tinyint(1) DEFAULT NULL COMMENT 'Bu kategori menüde yer alacak mı',
  `type` varchar(25) NOT NULL COMMENT 'article,news,video,gallery',
  `params` text,
  PRIMARY KEY (`pkcategory`),
  KEY `created_by` (`created_by`),
  KEY `parent_category` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_comments`
--

DROP TABLE IF EXISTS `pf_comments`;
CREATE TABLE IF NOT EXISTS `pf_comments` (
  `pkcomment` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `content` text NOT NULL,
  `object_id` int(11) NOT NULL COMMENT 'news_id,article_id',
  `module_name` varchar(20) NOT NULL COMMENT 'page,news,article',
  `ip` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `subscriber_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `dislikes` int(11) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'pending' COMMENT 'Approved, Pending, Spam',
  PRIMARY KEY (`pkcomment`),
  KEY `fk_subscriber` (`subscriber_id`),
  KEY `fk_user` (`user_id`),
  KEY `fk_parent_comment` (`parent_id`),
  KEY `comment_index` (`object_id`,`module_name`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_comments`
--

INSERT INTO `pf_comments` (`pkcomment`, `fullname`, `email`, `content`, `object_id`, `module_name`, `ip`, `created_at`, `updated_at`, `subscriber_id`, `user_id`, `parent_id`, `likes`, `dislikes`, `status`) VALUES
(2, 'Muhammed Yusuf ERDEn', 'cwyusef@gmail.com', 'teşekkürler teşekkürler teşekkürler teşekkürler teşekkürler teşekkürler teşekkürler .', 22, 'news', '127.0.0.1', '2017-07-16 11:14:48', '2017-07-16 11:14:48', NULL, NULL, NULL, 0, 0, 'approved'),
(3, 'Muhammed Yusuf ERDEn', 'cwyusef@gmail.com', 'örnek bir yorum yapıyorum haciiiiiiiii.\r\nBu yorum benden Grup Yorum\'a gelsin.\r\nSaygılar, selamlar.\r\n\r\n//edit. Deneme', 22, 'news', '127.0.0.1', '2017-07-16 11:14:48', '2017-07-16 11:14:48', NULL, NULL, NULL, 0, 0, 'spam'),
(4, '', 'cwyusef@gmail.com', 'ilk yorumumu deniyorum arkadaşlar.', 5, 'pages', NULL, '2017-07-31 08:08:42', '2017-07-31 08:08:42', NULL, 1, NULL, 0, 0, 'approved'),
(5, '', 'cwyusef@gmail.com', 'elma armut kiraz meyve sebze yorummm\r\nasdasdasd', 5, 'pages', NULL, '2017-07-31 08:36:29', '2017-07-31 08:36:29', NULL, 1, NULL, 0, 0, 'pending'),
(6, '', 'cwyusef1@gmail.com', 'Yaa meteroloji bazen sallıyor ya inanmayın', 5, 'pages', NULL, '2017-07-31 08:51:19', '2017-07-31 08:51:19', NULL, 1, NULL, 0, 0, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `pf_forms`
--

DROP TABLE IF EXISTS `pf_forms`;
CREATE TABLE IF NOT EXISTS `pf_forms` (
  `pkform` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `params` text,
  PRIMARY KEY (`pkform`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_galleries`
--

DROP TABLE IF EXISTS `pf_galleries`;
CREATE TABLE IF NOT EXISTS `pf_galleries` (
  `pkgallery` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order_number` int(11) DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `allow_comments` tinyint(1) NOT NULL DEFAULT '1',
  `comments` int(11) NOT NULL DEFAULT '0',
  `state` varchar(30) DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`pkgallery`),
  KEY `created_by` (`created_by`),
  KEY `fk_category` (`category_id`),
  KEY `fk_news` (`news_id`),
  KEY `fk_video` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_gallery_images`
--

DROP TABLE IF EXISTS `pf_gallery_images`;
CREATE TABLE IF NOT EXISTS `pf_gallery_images` (
  `pkgalleryimage` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order_number` int(11) DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `likes` int(11) NOT NULL DEFAULT '0',
  `dislikes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pkgalleryimage`),
  KEY `created_by` (`created_by`),
  KEY `fk_gallery` (`gallery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_likes`
--

DROP TABLE IF EXISTS `pf_likes`;
CREATE TABLE IF NOT EXISTS `pf_likes` (
  `pklike` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `likes` int(11) DEFAULT NULL,
  `dislikes` int(11) DEFAULT NULL,
  `module` varchar(20) NOT NULL COMMENT 'resim,yorum',
  `ip` varchar(50) DEFAULT NULL,
  `session_id` varchar(40) NOT NULL,
  PRIMARY KEY (`pklike`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_logs`
--

DROP TABLE IF EXISTS `pf_logs`;
CREATE TABLE IF NOT EXISTS `pf_logs` (
  `pklog` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(20) NOT NULL COMMENT 'error,warning,information,important',
  `module` varchar(255) NOT NULL COMMENT 'system module names',
  `description` varchar(500) DEFAULT NULL COMMENT 'example: user not found',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(40) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pklog`),
  KEY `user_id` (`user_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_logs`
--

INSERT INTO `pf_logs` (`pklog`, `kind`, `module`, `description`, `created_at`, `user_id`, `session_id`, `ip`) VALUES
(62, 'warning', 'auth', 'Login failed cwyusef@gmail.com', '2017-07-24 12:51:15', NULL, 'i6b29tqaujrgodskea8bjo120v44nced', '127.0.0.1'),
(63, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-24 12:51:21', 1, 'i6b29tqaujrgodskea8bjo120v44nced', '127.0.0.1'),
(64, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-24 16:51:07', 1, 'k08d2iuqpuh8vh3mfelgjuu0dfh4040e', '127.0.0.1'),
(65, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-24 19:20:46', 1, '6hlfa6nid0gvddbmt8qo68vt73sela45', '127.0.0.1'),
(66, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-25 06:25:06', 1, '7mj80j6vmdgu6g7mrops3fo4qvd8o2ja', '127.0.0.1'),
(67, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-25 10:10:52', 1, 'ssq4ka3njpj4c7nskoidb3hu2v51lp64', '127.0.0.1'),
(68, 'warning', 'auth', 'Login failed cwyusef@gmail.com', '2017-07-25 10:12:23', NULL, 'jmsaaortmko9rjm07fjt61b55mhr5ojp', '127.0.0.1'),
(69, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-25 10:12:29', 1, 'jmsaaortmko9rjm07fjt61b55mhr5ojp', '127.0.0.1'),
(70, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 06:57:35', 1, 'm8iqiuvmpsva4dpnbklkbi4l3ossrq9n', '127.0.0.1'),
(71, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 07:06:34', 1, 'm261smqpjtkmg0gdkeniigccnotah2mf', '127.0.0.1'),
(72, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 07:09:50', 1, 'm261smqpjtkmg0gdkeniigccnotah2mf', '127.0.0.1'),
(73, 'warning', 'auth', 'Login failed cwyusef@gmail.com', '2017-07-26 09:04:14', NULL, 'u09niggv0q8bjd11hlmomieket1oh212', '127.0.0.1'),
(74, 'warning', 'auth', 'Login failed cwyusef@gmail.com', '2017-07-26 09:04:37', NULL, 'u09niggv0q8bjd11hlmomieket1oh212', '127.0.0.1'),
(75, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 09:13:43', 1, 'sf3s12coqphbj8j852dp5rje5sib1ch8', '127.0.0.1'),
(76, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 09:14:19', 1, 'sf3s12coqphbj8j852dp5rje5sib1ch8', '127.0.0.1'),
(77, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 09:15:42', 1, 'n1nfih5ngejd12rr7fcfobccj4vao4g6', '127.0.0.1'),
(78, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 09:15:58', 1, 'n1nfih5ngejd12rr7fcfobccj4vao4g6', '127.0.0.1'),
(79, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 10:18:21', 1, 'gljv24pi37el8ccuc6qlq7btu9b8bo08', '127.0.0.1'),
(80, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 10:22:08', 1, 'p459tdi9upslop4bbud0d8bcgbpgtu2p', '127.0.0.1'),
(81, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 10:33:40', NULL, '69sepigmupjrpacedoqmg548tljnj6gk', '127.0.0.1'),
(82, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 10:34:11', NULL, '69sepigmupjrpacedoqmg548tljnj6gk', '127.0.0.1'),
(83, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 10:34:15', NULL, '69sepigmupjrpacedoqmg548tljnj6gk', '127.0.0.1'),
(84, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 10:34:20', NULL, '69sepigmupjrpacedoqmg548tljnj6gk', '127.0.0.1'),
(85, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 10:34:59', NULL, '69sepigmupjrpacedoqmg548tljnj6gk', '127.0.0.1'),
(86, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 10:35:06', NULL, '69sepigmupjrpacedoqmg548tljnj6gk', '127.0.0.1'),
(87, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 10:36:08', NULL, '69sepigmupjrpacedoqmg548tljnj6gk', '127.0.0.1'),
(88, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 10:40:56', 1, 'biuoq8hsupphuoi12ans28octeok7pm7', '127.0.0.1'),
(89, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 12:36:08', 1, 'jkv5ilhs2gj7onr8manvka4du2de4ckm', '127.0.0.1'),
(90, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 13:04:04', 1, '5itebdjogkvtatt4933tugm1ud3cfgrg', '127.0.0.1'),
(91, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 13:04:22', 1, '5itebdjogkvtatt4933tugm1ud3cfgrg', '127.0.0.1'),
(92, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 13:07:44', 1, '5itebdjogkvtatt4933tugm1ud3cfgrg', '127.0.0.1'),
(93, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 13:21:19', 1, '2riuef4mj6qr6dhj55s2fei3if78ia75', '127.0.0.1'),
(94, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 13:31:44', 1, '45drcsbnpgoth3ikims1n786gdn997au', '127.0.0.1'),
(95, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 13:32:20', 1, '45drcsbnpgoth3ikims1n786gdn997au', '127.0.0.1'),
(96, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 13:33:55', 1, '45drcsbnpgoth3ikims1n786gdn997au', '127.0.0.1'),
(97, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 13:42:25', 1, 'o13m8gkrk4fikt9iajadeqmb7n36mbqu', '127.0.0.1'),
(98, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 14:43:42', 1, 'tardh7rrpnmudiis7ghut06rmc6ecssl', '127.0.0.1'),
(99, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 14:56:19', 1, 'l37kh60e45q543qc9s47vlfshblii7s4', '127.0.0.1'),
(100, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-26 14:58:24', 1, 'l37kh60e45q543qc9s47vlfshblii7s4', '127.0.0.1'),
(101, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-27 07:21:24', 1, '0n7hhk0qius6d22derotde40tj49m774', '127.0.0.1'),
(102, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-27 07:22:31', 1, '0n7hhk0qius6d22derotde40tj49m774', '127.0.0.1'),
(103, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-27 09:04:49', 1, '0n7hhk0qius6d22derotde40tj49m774', '127.0.0.1'),
(104, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-28 11:25:19', 1, 'ncnk3gfjae52nek9ci70n5iqp7irb7q7', '127.0.0.1'),
(105, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-28 21:51:31', 1, '20ffr02d1vsl1b2r63iic2hpu3mqt7mc', '127.0.0.1'),
(106, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-31 06:29:43', 1, 'fq5iht0readi56ijmekb0hk08m5npqvl', '127.0.0.1'),
(107, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-31 10:24:06', 1, '9e9fouh65fspfeiv66lgku58gsi9gtsn', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `pf_modules`
--

DROP TABLE IF EXISTS `pf_modules`;
CREATE TABLE IF NOT EXISTS `pf_modules` (
  `pkmodule` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(50) NOT NULL,
  `icon` varchar(64) NOT NULL,
  PRIMARY KEY (`pkmodule`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_modules`
--

INSERT INTO `pf_modules` (`pkmodule`, `name`, `title`, `icon`) VALUES
(1, 'pages', 'Pages', 'fa-file-o'),
(2, 'news', 'Text News', 'fa-file-text'),
(3, 'image_news', 'Image News', 'fa-image'),
(4, 'video_news', 'Video News', 'fa-video-camera'),
(5, 'articles', 'Articles', 'fa-sticky-note'),
(7, 'users', 'Users', 'fa-users'),
(8, 'bulletins', 'Bulletins', 'fa-bullhorn'),
(9, 'seo', 'SEO', 'fa-line-chart'),
(10, 'surveys', 'Surveys', ' fa-question'),
(11, 'adverts', 'Adverts', 'fa-money'),
(12, 'messages', 'Messages', 'fa-envelope-o'),
(13, 'comments', 'Comments', 'fa-comments-o'),
(14, 'logs', 'Logs', 'fa-eye'),
(15, 'statistics', 'Statistics', 'fa-bar-chart'),
(16, 'sosyal', 'Sosyal Medya', ''),
(17, 'dashboard', 'Dashboard', 'fa-dashboard'),
(18, 'subscribers', 'Subscribers', 'fa-heart');

-- --------------------------------------------------------

--
-- Table structure for table `pf_news`
--

DROP TABLE IF EXISTS `pf_news`;
CREATE TABLE IF NOT EXISTS `pf_news` (
  `pknews` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `summary` text,
  `content` longtext NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `state` varchar(30) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `confirmed_by` int(11) DEFAULT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  `gallery_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `video` varchar(500) DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `params` text,
  `devmanset` tinyint(1) NOT NULL DEFAULT '0',
  `manset` tinyint(1) NOT NULL DEFAULT '0',
  `manset2` tinyint(1) NOT NULL DEFAULT '0',
  `mansetyani` tinyint(1) NOT NULL DEFAULT '0',
  `mansetalti` tinyint(1) NOT NULL DEFAULT '0',
  `gundem` tinyint(1) NOT NULL DEFAULT '0',
  `sondakika` tinyint(1) NOT NULL DEFAULT '0',
  `flash` tinyint(1) NOT NULL DEFAULT '0',
  `spot` tinyint(1) NOT NULL DEFAULT '0',
  `special` tinyint(1) NOT NULL DEFAULT '0',
  `source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pknews`),
  UNIQUE KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  KEY `confirmed_by` (`confirmed_by`),
  KEY `fkcategory` (`category_id`),
  KEY `fk_gallery` (`gallery_id`),
  KEY `fk_video` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_news_tag_map`
--

DROP TABLE IF EXISTS `pf_news_tag_map`;
CREATE TABLE IF NOT EXISTS `pf_news_tag_map` (
  `pkntm` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`pkntm`),
  KEY `news_id` (`news_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_pages`
--

DROP TABLE IF EXISTS `pf_pages`;
CREATE TABLE IF NOT EXISTS `pf_pages` (
  `pkpage` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `summary` text,
  `content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  `status` varchar(30) NOT NULL DEFAULT 'draft',
  `params` text,
  PRIMARY KEY (`pkpage`),
  UNIQUE KEY `alias` (`alias`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `status_alias_index` (`alias`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_pages`
--

INSERT INTO `pf_pages` (`pkpage`, `title`, `alias`, `summary`, `content`, `created_at`, `updated_at`, `created_by`, `updated_by`, `publish_date`, `allow_comments`, `comments`, `status`, `params`) VALUES
(2, 'Sayfa Başlık Sayfa Başlık Sayfa Başlık Sayfa Başlık Sayfa Başlık', 'iletisim', NULL, 'İletişim bilgilerimize aşağıdaki adresten ulaşabilirsiniz.s sad asd asd&nbsp;', '2017-07-17 09:37:20', '2017-07-31 06:41:08', 1, 1, NULL, 0, 0, 'published', NULL),
(5, 'Son dakika! Meteoroloji\'den İstanbul için yeni uyarı', 'hakkimizda', NULL, '<p>\r\n\r\n</p><p><a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/istanbul">İstanbul</a>\'da gece saatlerinden itibaren etkili olan gök gürültü kuvvetli sağanak, başta trafik olmak üzere yaşamı olumsuz etkiledi.</p><p>İstanbul Valiliği, sosyal medya hesabında, "Bugün ilimiz yoğun yağış aldığından ulaşımda sıkıntı yaşanmaması için zorunlu olmadıkça özel araçlarla trafiğe çıkılmaması rica olunur." uyarısında bulundu.</p><p><strong>YAĞIŞ, 15.00\'DEN SONRA AZALACAK</strong></p><p>Öte yandan gelen <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/son-dakika">son dakika</a>&nbsp;bilgisine göre, <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/meteoroloji-genel-mudurlugu">Meteoroloji Genel Müdürlüğü</a>, İstanbul\'da yağışın saat 15.00\'dan itibaren etkisini azaltacağını açıkladı.</p><p>Meteoroloji Genel Müdürlüğü, Trakya ve İstanbul\'daki sağanağın saat 15.00\'ten sonra etkisinin azalmasının beklendiğini duyurdu.</p><p>Meteoroloji Genel Müdürlüğü, sosyal medya hesabından, "Meteorolojik Değerlendirme 1" başlığıyla duyuru yaptı.</p>\r\n\r\n\r\n\r\n<p>Marmara Bölgesi\'nde devam eden kuvvetli ve gök gürültülü sağanak yağışın saat 15.00\'ten sonra Trakya ve İstanbul\'da etkisini azaltmasının beklendiği vurgulanan açıklamada, şöyle denildi:</p><p>"Ancak yağışlı sistemin Marmara\'nın doğusuna hareket ederek Kocaeli, Sakarya, Düzce, Zonguldak ve Bartın\'ın özellikle kıyı kesimlerinde yarın öğle saatlerine kadar şiddetli (75-100 kg/m2) sağanak ve gök gürültülü sağanak yağışlara sebep olması beklenmektedir. Saat 11.00 itibarıyla son 6 saatte, Silivri\'de 128, Üsküdar\'da 108, Beykoz\'da 85, Sarıyer\'de 78, Çatalca\'da 55, Kırklareli/Vize\'de 45, Eyüp\'te 44, Güngören\'de 44, Çekmeköy\' de 39 ve Kadıköy\'de 35 kg yağış kaydedilmiştir."</p><p><strong>SON 32 YILIN EN BÜYÜĞÜ</strong></p><p>Temmuz ayının tamamında ortalama 32,5 kg yağış alan İstanbul\'da sadece bugün, hem de günün ilk yarısında rekor miktarda yağmur yağdı.</p>\r\n\r\n\r\n\r\n<p><strong>1 GÜNDE, TEMMUZ AYI ORTALAMASININ ÇOK ÜSTÜNDE</strong></p><p>Neredeyse İstanbul\'un tamamına düşen yağış, Temmuz ayı ortalamasını çok geride bıraktı.</p><p><strong>32 YILIN EN YAĞMURLU GÜNÜ</strong></p><p>İstanbul\'da 1985 yılı Ekim ayının 16\'ncı günü, 125.5 kg\'lık yağışla, tüm zamanların "en yağışlı" günüydü. Ancak bugün yağan yağmur, üstelik bir yaz ayında yağan yağmur bu miktarı geride bıraktı. DHA\'nin meteorolojik ölçüm istasyonlarından derlediği bilgilere göre günün ilk yarısında Silivri\'de metrekareye tam 128 kg. yağış düştü.</p><p><strong>TÜM İLÇELERDE REKOR YAĞIŞ</strong></p><p>İstanbul\'un diğer semtlerine de rekor yağışlar düştü, aylık ortalamayı kat be kat geride bıraktı. İşte haberin yayınlandığı sırada bazı ilçelerde metrekareye düşen yağış miktarları. Üsküdar 108 kg, Beykoz 85 kg, Sarıyer 80 kg</p>\r\n\r\n<br><p></p>', '2017-07-18 12:04:05', '2017-07-31 08:54:05', 1, 1, NULL, 1, 0, 'published', NULL),
(6, 'Son dakika! Meteoroloji\'den İstanbul için yeni uyarı', 'yazarlar', NULL, '<p>\r\n\r\n</p><p><a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/istanbul">İstanbul</a>\'da gece saatlerinden itibaren etkili olan gök gürültü kuvvetli sağanak, başta trafik olmak üzere yaşamı olumsuz etkiledi.</p><p>İstanbul Valiliği, sosyal medya hesabında, "Bugün ilimiz yoğun yağış aldığından ulaşımda sıkıntı yaşanmaması için zorunlu olmadıkça özel araçlarla trafiğe çıkılmaması rica olunur." uyarısında bulundu.</p><p><strong>YAĞIŞ, 15.00\'DEN SONRA AZALACAK</strong></p><p>Öte yandan gelen <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/son-dakika">son dakika</a>&nbsp;bilgisine göre, <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/meteoroloji-genel-mudurlugu">Meteoroloji Genel Müdürlüğü</a>, İstanbul\'da yağışın saat 15.00\'dan itibaren etkisini azaltacağını açıkladı.</p><p>Meteoroloji Genel Müdürlüğü, Trakya ve İstanbul\'daki sağanağın saat 15.00\'ten sonra etkisinin azalmasının beklendiğini duyurdu.</p><p>Meteoroloji Genel Müdürlüğü, sosyal medya hesabından, "Meteorolojik Değerlendirme 1" başlığıyla duyuru yaptı.</p>\r\n\r\n\r\n\r\n<p>Marmara Bölgesi\'nde devam eden kuvvetli ve gök gürültülü sağanak yağışın saat 15.00\'ten sonra Trakya ve İstanbul\'da etkisini azaltmasının beklendiği vurgulanan açıklamada, şöyle denildi:</p><p>"Ancak yağışlı sistemin Marmara\'nın doğusuna hareket ederek Kocaeli, Sakarya, Düzce, Zonguldak ve Bartın\'ın özellikle kıyı kesimlerinde yarın öğle saatlerine kadar şiddetli (75-100 kg/m2) sağanak ve gök gürültülü sağanak yağışlara sebep olması beklenmektedir. Saat 11.00 itibarıyla son 6 saatte, Silivri\'de 128, Üsküdar\'da 108, Beykoz\'da 85, Sarıyer\'de 78, Çatalca\'da 55, Kırklareli/Vize\'de 45, Eyüp\'te 44, Güngören\'de 44, Çekmeköy\' de 39 ve Kadıköy\'de 35 kg yağış kaydedilmiştir."</p><p><strong>SON 32 YILIN EN BÜYÜĞÜ</strong></p><p>Temmuz ayının tamamında ortalama 32,5 kg yağış alan İstanbul\'da sadece bugün, hem de günün ilk yarısında rekor miktarda yağmur yağdı.</p>\r\n\r\n\r\n\r\n<p><strong>1 GÜNDE, TEMMUZ AYI ORTALAMASININ ÇOK ÜSTÜNDE</strong></p><p>Neredeyse İstanbul\'un tamamına düşen yağış, Temmuz ayı ortalamasını çok geride bıraktı.</p><p><strong>32 YILIN EN YAĞMURLU GÜNÜ</strong></p><p>İstanbul\'da 1985 yılı Ekim ayının 16\'ncı günü, 125.5 kg\'lık yağışla, tüm zamanların "en yağışlı" günüydü. Ancak bugün yağan yağmur, üstelik bir yaz ayında yağan yağmur bu miktarı geride bıraktı. DHA\'nin meteorolojik ölçüm istasyonlarından derlediği bilgilere göre günün ilk yarısında Silivri\'de metrekareye tam 128 kg. yağış düştü.</p><p><strong>TÜM İLÇELERDE REKOR YAĞIŞ</strong></p><p>İstanbul\'un diğer semtlerine de rekor yağışlar düştü, aylık ortalamayı kat be kat geride bıraktı. İşte haberin yayınlandığı sırada bazı ilçelerde metrekareye düşen yağış miktarları. Üsküdar 108 kg, Beykoz 85 kg, Sarıyer 80 kg</p>\r\n\r\n<br><p></p>', '2017-07-18 12:04:55', '2017-07-28 11:37:37', 1, NULL, NULL, 0, 0, 'draft', NULL),
(8, 'İstanbul Boğazı\'nda şoke eden görüntü!', 'temsilciliklerimiz', NULL, '<p>\r\n\r\nİstanbul dün gece başlayan ve sabah saatlerinde şiddetini arttıran yağmur, İstanbullulara zor anlar yaşattı. Yollarda biriken sular trafiğin sıkışmasına neden olurken, toplu taşımada da aksamalar meydana geldi. Şiddetli yağış nedeniyle İstanbul Boğazı\'nda denize karışan sel suyu şaşırtan görüntülere sahne oldu. Yaşanan olay nedeniyle denizin iki renk haline geldiği görülürken, köprüden geçen vatandaşlar, o anları cep telefonları ile kaydedip sosyal medya hesaplarından paylaştı. \r\n\r\n<br></p>', '2017-07-18 12:12:11', '2017-07-28 11:37:51', 1, NULL, NULL, 0, 0, 'draft', NULL),
(9, 'Whatsapp\'ta yeni dönem başlıyor!', 'baskan', NULL, '<p>\r\n\r\n</p><h2>Whatsapp\'a gelmesi sabırsızlıkla beklenen özellik sonunda kullanıcılara sunuluyor. Bakın bu kez Whatsapp\'ın kullanıcılara son sürprizi ne?</h2>\r\n\r\n<br><p></p>', '2017-07-18 12:13:40', '2017-07-28 11:38:52', 1, NULL, NULL, 0, 0, 'draft', NULL),
(10, 'fgfgfgfd', 'a', NULL, 'asdasda<br><p></p><p></p><p>sd</p><p></p><p></p><p>as</p><p>d</p><p>asdasdasd</p><p>asd</p>', '2017-07-28 12:08:57', '2017-07-28 12:46:17', 1, 1, NULL, 0, 0, 'draft', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pf_subscribers`
--

DROP TABLE IF EXISTS `pf_subscribers`;
CREATE TABLE IF NOT EXISTS `pf_subscribers` (
  `pksubscriber` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `last_visit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(50) DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_message` varchar(255) DEFAULT NULL,
  `banned_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`pksubscriber`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `banned_by` (`banned_by`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_subscribers`
--

INSERT INTO `pf_subscribers` (`pksubscriber`, `name`, `city`, `country`, `email`, `username`, `password`, `last_visit`, `created_at`, `ip`, `banned`, `ban_message`, `banned_by`) VALUES
(3, '', NULL, NULL, 'cwyusef@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2017-07-26 08:00:53', '2017-07-17 07:33:17', NULL, 0, '', NULL),
(4, 'Muhammed Yusuf', NULL, NULL, 'cwyusef1@gmail.com', NULL, '8619d248219882ab72aaa3b44474bd5d', '2017-07-31 08:37:38', '2017-07-31 11:36:41', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pf_surveys`
--

DROP TABLE IF EXISTS `pf_surveys`;
CREATE TABLE IF NOT EXISTS `pf_surveys` (
  `pksurvey` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `options` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`pksurvey`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_survey_votes`
--

DROP TABLE IF EXISTS `pf_survey_votes`;
CREATE TABLE IF NOT EXISTS `pf_survey_votes` (
  `pksurveyvote` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `options` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(50) DEFAULT NULL,
  `session_id` varchar(40) NOT NULL,
  PRIMARY KEY (`pksurveyvote`),
  KEY `survey_id` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_tags`
--

DROP TABLE IF EXISTS `pf_tags`;
CREATE TABLE IF NOT EXISTS `pf_tags` (
  `pktag` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`pktag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_users`
--

DROP TABLE IF EXISTS `pf_users`;
CREATE TABLE IF NOT EXISTS `pf_users` (
  `pkuser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `profile_picture` varchar(255) DEFAULT '/assets/img/user2-160x160.jpg',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `user_type` int(11) DEFAULT NULL,
  `params` text,
  `last_visit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkuser`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `user_type` (`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_users`
--

INSERT INTO `pf_users` (`pkuser`, `username`, `fullname`, `password`, `email`, `profile_picture`, `created_at`, `enabled`, `user_type`, `params`, `last_visit`) VALUES
(1, 'yusuf', 'Muhammed Yusuf ERDEN', 'e10adc3949ba59abbe56e057f20f883e', 'cwyusef@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 15:09:31', 1, 3, NULL, '2017-07-31 09:34:10'),
(2, 'kerim', 'M. Yusuf Erden', 'e10adc3949ba59abbe56e057f20f883e', 'cwyuseff@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 12:09:31', 1, 3, NULL, '2017-07-16 18:00:00'),
(4, 'yusuf1', 'M. Yusuf Erden', 'e10adc3949ba59abbe56e057f20f883e', 'cwyusef1@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 12:09:31', 1, 1, NULL, '2017-07-16 18:00:00'),
(5, 'yusuf2', 'M. Yusuf Erden', 'e10adc3949ba59abbe56e057f20f883e', 'cwyusef2@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 12:09:31', 1, 2, NULL, '2017-07-16 18:00:00'),
(10, 'mybirer123', 'Muhammed Yasin Birer', 'e10adc3949ba59abbe56e057f20f883e', 'mybirer@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-21 13:47:20', 1, 1, NULL, '2017-07-23 09:00:09');

-- --------------------------------------------------------

--
-- Table structure for table `pf_user_types`
--

DROP TABLE IF EXISTS `pf_user_types`;
CREATE TABLE IF NOT EXISTS `pf_user_types` (
  `pkusertype` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL COMMENT 'Public title',
  `modules` text NOT NULL COMMENT 'JSON encoded module privileges',
  PRIMARY KEY (`pkusertype`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_user_types`
--

INSERT INTO `pf_user_types` (`pkusertype`, `title`, `modules`) VALUES
(1, 'Editör', '{"dashboard":["add","edit","remove","list","confirm"],\n"pages":["add","edit","remove","list","confirm"],\n"news":["add","edit","remove","list","confirm"]}'),
(2, 'Muhabir', '{"dashboard":["add","edit","remove","list","confirm"],\n"news":["add","edit","remove","list","confirm"]}'),
(3, 'Yönetici', '{"dashboard":["add","edit","remove","list","confirm"],\n"pages":["add","edit","remove","list","confirm"],\n"news":["add","edit","remove","list","confirm"],\n"image_news":["add","edit","remove","list","confirm"],\n"video_news":["add","edit","remove","list","confirm"],\n"articles":["add","edit","remove","list","confirm"],\n"users":["add","edit","remove","list","confirm"],\n"subscribers":["add","edit","remove","list","confirm"],\n"bulletins":["add","edit","remove","list","confirm"],\n"seo":["add","edit","remove","list","confirm"],\n"surveys":["add","edit","remove","list","confirm"],\n"adverts":["add","edit","remove","list","confirm"],\n"messages":["add","edit","remove","list","confirm"],\n"comments":["add","edit","remove","list","confirm"],\n"logs":["add","edit","remove","list","confirm"],\n"statistics":["add","edit","remove","list","confirm"],\n"sosyal":["add","edit","remove","list","confirm"]}');

-- --------------------------------------------------------

--
-- Table structure for table `pf_videos`
--

DROP TABLE IF EXISTS `pf_videos`;
CREATE TABLE IF NOT EXISTS `pf_videos` (
  `pkvideo` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `embed` text NOT NULL,
  `content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `allow_comments` tinyint(1) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  `state` varchar(30) DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`pkvideo`),
  UNIQUE KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  KEY `fk_category` (`category_id`),
  KEY `fk_news` (`news_id`),
  KEY `fk_gallery` (`gallery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pf_adverts`
--
ALTER TABLE `pf_adverts`
  ADD CONSTRAINT `adverts_created_by` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pf_articles`
--
ALTER TABLE `pf_articles`
  ADD CONSTRAINT `article_category_ibfk` FOREIGN KEY (`category_id`) REFERENCES `pf_categories` (`pkcategory`) ON UPDATE CASCADE,
  ADD CONSTRAINT `article_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `article_updated_by_ibfk` FOREIGN KEY (`updated_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pf_bulletins`
--
ALTER TABLE `pf_bulletins`
  ADD CONSTRAINT `bulletin_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `bulletin_updated_by_ibfk` FOREIGN KEY (`updated_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pf_categories`
--
ALTER TABLE `pf_categories`
  ADD CONSTRAINT `category_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `category_parent_cat_ibfk` FOREIGN KEY (`parent_id`) REFERENCES `pf_categories` (`pkcategory`) ON UPDATE CASCADE;

--
-- Constraints for table `pf_comments`
--
ALTER TABLE `pf_comments`
  ADD CONSTRAINT `comments_fksubscriber_ibfk` FOREIGN KEY (`subscriber_id`) REFERENCES `pf_subscribers` (`pksubscriber`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_fkuser_ibfk` FOREIGN KEY (`user_id`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_parentcomment_ibfk` FOREIGN KEY (`parent_id`) REFERENCES `pf_comments` (`pkcomment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pf_forms`
--
ALTER TABLE `pf_forms`
  ADD CONSTRAINT `forms_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pf_galleries`
--
ALTER TABLE `pf_galleries`
  ADD CONSTRAINT `gallery_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `gallery_fk_category_ibfk` FOREIGN KEY (`category_id`) REFERENCES `pf_categories` (`pkcategory`) ON UPDATE CASCADE,
  ADD CONSTRAINT `gallery_fk_news_ibfk` FOREIGN KEY (`news_id`) REFERENCES `pf_news` (`pknews`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `gallery_fk_video_ibfk` FOREIGN KEY (`video_id`) REFERENCES `pf_videos` (`pkvideo`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pf_gallery_images`
--
ALTER TABLE `pf_gallery_images`
  ADD CONSTRAINT `gimages_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `gimages_fk_gallery_ibfk` FOREIGN KEY (`gallery_id`) REFERENCES `pf_galleries` (`pkgallery`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pf_logs`
--
ALTER TABLE `pf_logs`
  ADD CONSTRAINT `log_user_ibfk` FOREIGN KEY (`user_id`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pf_news`
--
ALTER TABLE `pf_news`
  ADD CONSTRAINT `news_category_ibfk` FOREIGN KEY (`category_id`) REFERENCES `pf_categories` (`pkcategory`) ON UPDATE CASCADE,
  ADD CONSTRAINT `news_confirmed_by_ibfk` FOREIGN KEY (`confirmed_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `news_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `news_fk_gallery_ibfk` FOREIGN KEY (`gallery_id`) REFERENCES `pf_galleries` (`pkgallery`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `news_fk_video_ibfk` FOREIGN KEY (`video_id`) REFERENCES `pf_videos` (`pkvideo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `news_updated_by_ibfk` FOREIGN KEY (`updated_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pf_news_tag_map`
--
ALTER TABLE `pf_news_tag_map`
  ADD CONSTRAINT `news_tag_news_id` FOREIGN KEY (`news_id`) REFERENCES `pf_news` (`pknews`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `news_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `pf_tags` (`pktag`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pf_pages`
--
ALTER TABLE `pf_pages`
  ADD CONSTRAINT `pages_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pages_updated_by_ibfk` FOREIGN KEY (`updated_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pf_subscribers`
--
ALTER TABLE `pf_subscribers`
  ADD CONSTRAINT `subscriber_banned_by_ibfk` FOREIGN KEY (`banned_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pf_surveys`
--
ALTER TABLE `pf_surveys`
  ADD CONSTRAINT `survey_created_by` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `survey_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pf_survey_votes`
--
ALTER TABLE `pf_survey_votes`
  ADD CONSTRAINT `survey_votes_survey_id` FOREIGN KEY (`survey_id`) REFERENCES `pf_surveys` (`pksurvey`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pf_users`
--
ALTER TABLE `pf_users`
  ADD CONSTRAINT `users_user_type_ibfk` FOREIGN KEY (`user_type`) REFERENCES `pf_user_types` (`pkusertype`) ON UPDATE CASCADE;

--
-- Constraints for table `pf_videos`
--
ALTER TABLE `pf_videos`
  ADD CONSTRAINT `videos_created_by` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_fk_category` FOREIGN KEY (`category_id`) REFERENCES `pf_categories` (`pkcategory`) ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_fk_gallery` FOREIGN KEY (`gallery_id`) REFERENCES `pf_galleries` (`pkgallery`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_fk_news` FOREIGN KEY (`news_id`) REFERENCES `pf_news` (`pknews`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
