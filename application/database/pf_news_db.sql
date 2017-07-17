-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2017 at 01:20 PM
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
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
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
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1- beklemede; 2- Onaylandı; 3-çöp',
  PRIMARY KEY (`pkcomment`),
  KEY `fk_subscriber` (`subscriber_id`),
  KEY `fk_user` (`user_id`),
  KEY `fk_parent_comment` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_comments`
--

INSERT INTO `pf_comments` (`pkcomment`, `fullname`, `email`, `content`, `object_id`, `module_name`, `ip`, `created_at`, `updated_at`, `subscriber_id`, `user_id`, `parent_id`, `likes`, `dislikes`, `status`) VALUES
(2, 'Muhammed Yusuf ERDEn', 'cwyusef@gmail.com', 'teşekkürler teşekkürler teşekkürler teşekkürler teşekkürler teşekkürler teşekkürler .', 22, 'news', '127.0.0.1', '2017-07-16 11:14:48', '2017-07-16 11:14:48', NULL, NULL, NULL, 0, 0, 3);

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
  `module_name` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `subscriber_id` int(11) DEFAULT NULL,
  `session_id` varchar(40) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pklog`),
  KEY `user_id` (`user_id`),
  KEY `subscriber_id` (`subscriber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_modules`
--

DROP TABLE IF EXISTS `pf_modules`;
CREATE TABLE IF NOT EXISTS `pf_modules` (
  `pkmodule` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`pkmodule`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_modules`
--

INSERT INTO `pf_modules` (`pkmodule`, `name`, `title`) VALUES
(1, 'sayfa', 'Sayfa'),
(2, 'metinhaber', 'Metin Haber'),
(3, 'fotogaleri', 'Foto Galeri'),
(4, 'videogaleri', 'Video Galeri'),
(5, 'makale', 'Makale'),
(7, 'kullanici', 'Kullanıcı'),
(8, 'bulten', 'Bülten'),
(9, 'seo', 'SEO'),
(10, 'anket', 'Anket'),
(11, 'reklam', 'Reklam'),
(12, 'mesaj', 'Mesaj'),
(13, 'yorum', 'Yorum'),
(14, 'log', 'Log'),
(15, 'istatistik', 'İstatistik Raporlama'),
(16, 'sosyal', 'Sosyal Medya');

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
  `summary` text,
  `content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  `state` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pkpage`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_pages`
--

INSERT INTO `pf_pages` (`pkpage`, `title`, `summary`, `content`, `created_at`, `updated_at`, `created_by`, `updated_by`, `publish_date`, `allow_comments`, `comments`, `state`) VALUES
(2, 'İletişim', NULL, 'İletişim bilgilerimize aşağıdaki adresten ulaşabilirsiniz.', '2017-07-17 09:37:20', '2017-07-17 09:37:20', 1, NULL, NULL, 0, 0, 'published');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_subscribers`
--

INSERT INTO `pf_subscribers` (`pksubscriber`, `name`, `city`, `country`, `email`, `username`, `password`, `last_visit`, `created_at`, `ip`, `banned`, `ban_message`, `banned_by`) VALUES
(2, NULL, NULL, NULL, 'nane', NULL, '$2a$16$m6F3.jE3SvhOSWWdqsfp0uvW0.XuHD6bKjLyfHOAKYXRPQxSLoTZS', '2017-07-16 21:11:25', '2017-07-16 21:11:25', NULL, 0, NULL, NULL),
(3, NULL, NULL, NULL, 'cwyusef@gmail.com', NULL, '$2a$16$rpGoyabsh94opz0iFY05ZOKIXc9daq6Mza7o7TkVh7mNWeQm.Zsp.', '2017-07-17 07:33:17', '2017-07-17 07:33:17', NULL, 0, NULL, NULL);

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
  `image` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `user_type` int(11) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`pkuser`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `created_by` (`created_by`),
  KEY `user_type` (`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_users`
--

INSERT INTO `pf_users` (`pkuser`, `username`, `fullname`, `password`, `email`, `image`, `thumbnail`, `created_at`, `updated_at`, `created_by`, `order_number`, `state`, `hidden`, `user_type`, `params`) VALUES
(1, 'yusuf', NULL, '123', 'cwyusef@gmail.com', NULL, NULL, '2017-07-13 15:09:31', '2017-07-13 15:09:31', NULL, NULL, NULL, 0, 1, NULL);

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
(1, 'Editör', '{\n          metinhaber  :["add","edit","remove","list","confirm"],\n          fotogaleri  :["add","edit","remove","list","confirm"],\n          videogaleri :["add","edit","remove","list","confirm"]\n      }'),
(2, 'Muhabir', '{\n          metinhaber :["add"],\n          fotogaleri :["add"],\n          videogaleri :["add"]\n      }'),
(3, 'Yönetici', '{\n    sayfa       :["add","edit","remove","list","confirm"],\n    metinhaber  :["add","edit","remove","list","confirm"],\n    fotogaleri  :["add","edit","remove","list","confirm"],\n    videogaleri :["add","edit","remove","list","confirm"],\n    makale      :["add","edit","remove","list","confirm"],\n    kullanici   :["add","edit","remove","list","confirm"],\n    bulten      :["add","edit","remove","list","confirm"],\n    seo         :["add","edit","remove","list","confirm"],\n    anket       :["add","edit","remove","list","confirm"],\n    reklam      :["add","edit","remove","list","confirm"],\n    mesaj       :["add","edit","remove","list","confirm"],\n    yorum       :["add","edit","remove","list","confirm"],\n    log         :["add","edit","remove","list","confirm"],\n    istatistik  :["add","edit","remove","list","confirm"]\n}');

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
  ADD CONSTRAINT `log_subscriber_ibfk` FOREIGN KEY (`subscriber_id`) REFERENCES `pf_subscribers` (`pksubscriber`) ON DELETE NO ACTION ON UPDATE CASCADE,
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
  ADD CONSTRAINT `users_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
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
