-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2017 at 06:04 AM
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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `pkadmin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `name_surname` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `state` varchar(30) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `persistent` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`pkadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_viewlevels`
--

DROP TABLE IF EXISTS `admin_viewlevels`;
CREATE TABLE IF NOT EXISTS `admin_viewlevels` (
  `pkadmin_viewlevel` int(11) NOT NULL,
  `fkadmin` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view_levels` varchar(5000) NOT NULL COMMENT 'The view levels that the Admin has'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`pkarticle`)
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
  PRIMARY KEY (`pkcategory`)
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
  `ip` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fkuser` int(11) NOT NULL,
  `fkadmin` int(11) NOT NULL,
  `fkparent_comment` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`pkcomment`)
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
  `fksubcategory` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL,
  `showed` int(11) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '1',
  `comments` int(11) NOT NULL,
  `state` varchar(30) NOT NULL,
  `fknews` int(11) NOT NULL,
  `fkvideo` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`pkgallery`)
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
  PRIMARY KEY (`pkgallery_image`)
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
  `pknews` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title2` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `content` longtext NOT NULL,
  `fkcategory` int(11) NOT NULL,
  `fksubcategory` int(11) NOT NULL,
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
  `fkgallery` int(11) NOT NULL,
  `fkvideo` int(11) NOT NULL,
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
  `source` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `pkuser` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_visit` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(30) NOT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_message` varchar(255) NOT NULL,
  PRIMARY KEY (`pkuser`)
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
  `fksubcategory` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `watched` int(11) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL,
  `comments` int(11) NOT NULL,
  `state` varchar(30) NOT NULL,
  `fknews` int(11) NOT NULL,
  `fkgallery` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`pkvideo`)
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
(1, 'Editör', 'editor', '{\r\n          2:["add","edit","remove","list","confirm"],\r\n          3:["add","edit","remove","list","confirm"],\r\n          4:["add","edit","remove","list","confirm"]\r\n      }'),
(2, 'Muhabir', 'muhabir', '{\r\n          2:["add"],\r\n          3:["add"],\r\n          4:["add"]\r\n      }'),
(3, 'Yönetici', 'yonetici', '{\r\n    1:["add","edit","remove","list","confirm"],\r\n    2:["add","edit","remove","list","confirm"],\r\n    3:["add","edit","remove","list","confirm"],\r\n    4:["add","edit","remove","list","confirm"],\r\n    5:["add","edit","remove","list","confirm"],\r\n    6:["add","edit","remove","list","confirm"],\r\n    7:["add","edit","remove","list","confirm"],\r\n    8:["add","edit","remove","list","confirm"],\r\n    9:["add","edit","remove","list","confirm"],\r\n    10:["add","edit","remove","list","confirm"],\r\n    11:["add","edit","remove","list","confirm"],\r\n    12:["add","edit","remove","list","confirm"],\r\n    13:["add","edit","remove","list","confirm"],\r\n    14:["add","edit","remove","list","confirm"]\r\n}');
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
