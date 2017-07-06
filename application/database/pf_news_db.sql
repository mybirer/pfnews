-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2017 at 12:27 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET FOREIGN_KEY_CHECKS=0;
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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `pkarticle` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `fkcategory` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `publish_date` timestamp NOT NULL,
  `image` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `showed` int(11) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL,
  `comments` int(11) NOT NULL,
  `state` varchar(30) NOT NULL,
  PRIMARY KEY (`pkarticle`),
  KEY `fk_category` (`fkcategory`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `pkcategory` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `fkparent_category` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `top_menu` tinyint(1) NOT NULL,
  `type` varchar(25) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`pkcategory`),
  KEY `created_by` (`created_by`),
  KEY `parent_category` (`fkparent_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `pkcomment` int(11) NOT NULL AUTO_INCREMENT,
  `name_surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `fkobject` int(11) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fksubscriber` int(11) NOT NULL,
  `fkuser` int(11) NOT NULL,
  `fkparent_comment` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`pkcomment`),
  KEY `fk_subscriber` (`fksubscriber`),
  KEY `fk_user` (`fkuser`),
  KEY `fk_parent_comment` (`fkparent_comment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
CREATE TABLE IF NOT EXISTS `forms` (
  `pkform` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`pkform`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `pkgallery` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `publish_date` timestamp NOT NULL,
  `fkcategory` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL,
  `showed` int(11) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '1',
  `comments` int(11) NOT NULL,
  `state` varchar(30) NOT NULL,
  `fknews` int(11) DEFAULT NULL,
  `fkvideo` int(11) DEFAULT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`pkgallery`),
  KEY `created_by` (`created_by`),
  KEY `fk_category` (`fkcategory`),
  KEY `fk_news` (`fknews`),
  KEY `fk_video` (`fkvideo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_images`
--

DROP TABLE IF EXISTS `gallery_images`;
CREATE TABLE IF NOT EXISTS `gallery_images` (
  `pkgallery_image` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `fkgallery` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL,
  `showed` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL,
  PRIMARY KEY (`pkgallery_image`),
  KEY `created_by` (`created_by`),
  KEY `fk_gallery` (`fkgallery`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `pklog` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int(11) NOT NULL,
  `usertype` int(11) NOT NULL COMMENT 'Bu log bir user tarafından mı oluşturuldu yoksa subscriber tarafından mı oluşturuldu. Yani created_by ı ayırt etmeye yarıyor',
  `ip` varchar(16) NOT NULL,
  PRIMARY KEY (`pklog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `pkmodule` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`pkmodule`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`pkmodule`, `name`) VALUES
(1, 'Sayfa'),
(2, 'Haber'),
(3, 'Galeri'),
(4, 'Video Galeri'),
(5, 'Makale'),
(6, 'Köşe Yazısı'),
(7, 'Kullanıcılar'),
(8, 'Bülten'),
(9, 'SEO'),
(10, 'Anket'),
(11, 'Reklam'),
(12, 'Mesaj'),
(13, 'Yorum'),
(14, 'Sistem Logları');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `pknews` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `title2` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `content` longtext NOT NULL,
  `fkcategory` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `state` varchar(30) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `confirmed_by` int(11) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL,
  `comments` int(11) NOT NULL,
  `showed` int(11) NOT NULL,
  `fkgallery` int(11) DEFAULT NULL,
  `fkvideo` int(11) DEFAULT NULL,
  `video` varchar(500) NOT NULL,
  `editor` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `devmanset` tinyint(1) NOT NULL,
  `manset` tinyint(1) NOT NULL,
  `manset2` tinyint(1) NOT NULL,
  `mansetyani` tinyint(1) NOT NULL,
  `mansetalti` tinyint(1) NOT NULL,
  `gundem` tinyint(1) NOT NULL,
  `sondakika` tinyint(1) NOT NULL,
  `flash` tinyint(1) NOT NULL,
  `spot` tinyint(1) NOT NULL,
  `special` tinyint(1) NOT NULL,
  `source` varchar(255) NOT NULL,
  PRIMARY KEY (`pknews`),
  UNIQUE KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  KEY `confirmed_by` (`confirmed_by`),
  KEY `fkcategory` (`fkcategory`),
  KEY `fk_gallery` (`fkgallery`),
  KEY `fk_video` (`fkvideo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news_tag_map`
--

DROP TABLE IF EXISTS `news_tag_map`;
CREATE TABLE IF NOT EXISTS `news_tag_map` (
  `pkntm` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`pkntm`),
  KEY `news_id` (`news_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `pksubscriber` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_visit` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(16) NOT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_message` varchar(255) NOT NULL,
  PRIMARY KEY (`pksubscriber`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
CREATE TABLE IF NOT EXISTS `surveys` (
  `pksurvey` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `options` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`pksurvey`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `survey_votes`
--

DROP TABLE IF EXISTS `survey_votes`;
CREATE TABLE IF NOT EXISTS `survey_votes` (
  `pksurveyvote` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `options` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(16) NOT NULL,
  `islogged` tinyint(1) NOT NULL,
  PRIMARY KEY (`pksurveyvote`),
  KEY `survey_id` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `pktag` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`pktag`),
  KEY `news_id` (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `pkuser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `name_surname` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `order_number` int(11) NOT NULL,
  `state` varchar(30) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `persistent` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`pkuser`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_viewlevels`
--

DROP TABLE IF EXISTS `user_viewlevels`;
CREATE TABLE IF NOT EXISTS `user_viewlevels` (
  `pkuser_viewlevel` int(11) NOT NULL AUTO_INCREMENT,
  `fkuser` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view_levels` varchar(5000) NOT NULL COMMENT 'The view levels that the Admin has',
  PRIMARY KEY (`pkuser_viewlevel`),
  KEY `fk_user` (`fkuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `pkvideo` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `embed` text NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `publish_date` timestamp NOT NULL,
  `fkcategory` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `watched` int(11) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL,
  `comments` int(11) NOT NULL,
  `state` varchar(30) NOT NULL,
  `fknews` int(11) DEFAULT NULL,
  `fkgallery` int(11) DEFAULT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`pkvideo`),
  KEY `created_by` (`created_by`),
  KEY `fk_category` (`fkcategory`),
  KEY `fk_news` (`fknews`),
  KEY `fk_gallery` (`fkgallery`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `view_levels`
--

DROP TABLE IF EXISTS `view_levels`;
CREATE TABLE IF NOT EXISTS `view_levels` (
  `pkview_levels` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL COMMENT 'Public title',
  `view_level_key` varchar(30) NOT NULL COMMENT 'Unique key',
  `modules` text NOT NULL COMMENT 'JSON encoded module privileges',
  PRIMARY KEY (`pkview_levels`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `view_levels`
--

INSERT INTO `view_levels` (`pkview_levels`, `title`, `view_level_key`, `modules`) VALUES
(1, 'Editör', 'editor', '{\n          2:["add","edit","remove","list","confirm"],\n          3:["add","edit","remove","list","confirm"],\n          4:["add","edit","remove","list","confirm"]\n      }'),
(2, 'Muhabir', 'muhabir', '{\n          2:["add"],\n          3:["add"],\n          4:["add"]\n      }'),
(3, 'Yönetici', 'yonetici', '{\n    1:["add","edit","remove","list","confirm"],\n    2:["add","edit","remove","list","confirm"],\n    3:["add","edit","remove","list","confirm"],\n    4:["add","edit","remove","list","confirm"],\n    5:["add","edit","remove","list","confirm"],\n    6:["add","edit","remove","list","confirm"],\n    7:["add","edit","remove","list","confirm"],\n    8:["add","edit","remove","list","confirm"],\n    9:["add","edit","remove","list","confirm"],\n    10:["add","edit","remove","list","confirm"],\n    11:["add","edit","remove","list","confirm"],\n    12:["add","edit","remove","list","confirm"],\n    13:["add","edit","remove","list","confirm"],\n    14:["add","edit","remove","list","confirm"]\n}');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `article_category_ibfk` FOREIGN KEY (`fkcategory`) REFERENCES `categories` (`pkcategory`) ON UPDATE CASCADE,
  ADD CONSTRAINT `article_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `article_updated_by_ibfk` FOREIGN KEY (`updated_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `category_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `category_parent_cat_ibfk` FOREIGN KEY (`fkparent_category`) REFERENCES `categories` (`pkcategory`) ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_fksubscriber_ibfk` FOREIGN KEY (`fksubscriber`) REFERENCES `subscribers` (`pksubscriber`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_fkuser_ibfk` FOREIGN KEY (`fkuser`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_parentcomment_ibfk` FOREIGN KEY (`fkparent_comment`) REFERENCES `comments` (`pkcomment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forms`
--
ALTER TABLE `forms`
  ADD CONSTRAINT `forms_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `gallery_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `gallery_fk_category_ibfk` FOREIGN KEY (`fkcategory`) REFERENCES `categories` (`pkcategory`) ON UPDATE CASCADE,
  ADD CONSTRAINT `gallery_fk_news_ibfk` FOREIGN KEY (`fknews`) REFERENCES `news` (`pknews`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `gallery_fk_video_ibfk` FOREIGN KEY (`fkvideo`) REFERENCES `videos` (`pkvideo`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD CONSTRAINT `gimages_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `gimages_fk_gallery_ibfk` FOREIGN KEY (`fkgallery`) REFERENCES `galleries` (`pkgallery`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_category_ibfk` FOREIGN KEY (`fkcategory`) REFERENCES `categories` (`pkcategory`) ON UPDATE CASCADE,
  ADD CONSTRAINT `news_confirmed_by_ibfk` FOREIGN KEY (`confirmed_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `news_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `news_fk_gallery_ibfk` FOREIGN KEY (`fkgallery`) REFERENCES `galleries` (`pkgallery`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `news_fk_video_ibfk` FOREIGN KEY (`fkvideo`) REFERENCES `videos` (`pkvideo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `news_updated_by_ibfk` FOREIGN KEY (`updated_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `news_tag_map`
--
ALTER TABLE `news_tag_map`
  ADD CONSTRAINT `news_tag_news_id` FOREIGN KEY (`news_id`) REFERENCES `news` (`pknews`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `surveys`
--
ALTER TABLE `surveys`
  ADD CONSTRAINT `survey_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `survey_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_viewlevels`
--
ALTER TABLE `user_viewlevels`
  ADD CONSTRAINT `user_viewlevel_fkuser` FOREIGN KEY (`fkuser`) REFERENCES `users` (`pkuser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_fk_category` FOREIGN KEY (`fkcategory`) REFERENCES `categories` (`pkcategory`) ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_fk_gallery` FOREIGN KEY (`fkgallery`) REFERENCES `galleries` (`pkgallery`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_fk_news` FOREIGN KEY (`fknews`) REFERENCES `news` (`pknews`) ON DELETE SET NULL ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
