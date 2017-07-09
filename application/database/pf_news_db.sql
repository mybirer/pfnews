-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2017 at 11:19 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

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
-- Table structure for table `pf_articles`
--

DROP TABLE IF EXISTS `pf_articles`;
CREATE TABLE `pf_articles` (
  `pkarticle` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `category_id` int(11) NOT NULL,
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
  `state` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_categories`
--

DROP TABLE IF EXISTS `pf_categories`;
CREATE TABLE `pf_categories` (
  `pkcategory` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `top_menu` tinyint(1) NOT NULL,
  `type` varchar(25) NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_comments`
--

DROP TABLE IF EXISTS `pf_comments`;
CREATE TABLE `pf_comments` (
  `pkcomment` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `object_id` int(11) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subscriber_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_forms`
--

DROP TABLE IF EXISTS `pf_forms`;
CREATE TABLE `pf_forms` (
  `pkform` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_galleries`
--

DROP TABLE IF EXISTS `pf_galleries`;
CREATE TABLE `pf_galleries` (
  `pkgallery` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `publish_date` timestamp NOT NULL,
  `category_id` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL,
  `showed` int(11) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '1',
  `comments` int(11) NOT NULL,
  `state` varchar(30) NOT NULL,
  `news_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_gallery_images`
--

DROP TABLE IF EXISTS `pf_gallery_images`;
CREATE TABLE `pf_gallery_images` (
  `pkgalleryimage` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL,
  `showed` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_logs`
--

DROP TABLE IF EXISTS `pf_logs`;
CREATE TABLE `pf_logs` (
  `pklog` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` int(11) NOT NULL,
  `usertype` int(11) NOT NULL COMMENT 'Bu log bir user tarafından mı oluşturuldu yoksa subscriber tarafından mı oluşturuldu. Yani created_by ı ayırt etmeye yarıyor',
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_modules`
--

DROP TABLE IF EXISTS `pf_modules`;
CREATE TABLE `pf_modules` (
  `pkmodule` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_modules`
--

INSERT INTO `pf_modules` (`pkmodule`, `name`) VALUES
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
-- Table structure for table `pf_news`
--

DROP TABLE IF EXISTS `pf_news`;
CREATE TABLE `pf_news` (
  `pknews` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `content` longtext NOT NULL,
  `category_id` int(11) NOT NULL,
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
  `gallery_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
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
-- Table structure for table `pf_news_tag_map`
--

DROP TABLE IF EXISTS `pf_news_tag_map`;
CREATE TABLE `pf_news_tag_map` (
  `pkntm` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_subscribers`
--

DROP TABLE IF EXISTS `pf_subscribers`;
CREATE TABLE `pf_subscribers` (
  `pksubscriber` int(11) NOT NULL,
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
  `ban_message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_surveys`
--

DROP TABLE IF EXISTS `pf_surveys`;
CREATE TABLE `pf_surveys` (
  `pksurvey` int(11) NOT NULL,
  `question` text NOT NULL,
  `options` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_survey_votes`
--

DROP TABLE IF EXISTS `pf_survey_votes`;
CREATE TABLE `pf_survey_votes` (
  `pksurveyvote` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `options` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(16) NOT NULL,
  `islogged` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_tags`
--

DROP TABLE IF EXISTS `pf_tags`;
CREATE TABLE `pf_tags` (
  `pktag` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_users`
--

DROP TABLE IF EXISTS `pf_users`;
CREATE TABLE `pf_users` (
  `pkuser` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `fullname` varchar(255) NOT NULL,
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
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_user_viewlevels`
--

DROP TABLE IF EXISTS `pf_user_viewlevels`;
CREATE TABLE `pf_user_viewlevels` (
  `pkuserviewlevel` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view_levels` varchar(5000) NOT NULL COMMENT 'The view levels that the Admin has'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_videos`
--

DROP TABLE IF EXISTS `pf_videos`;
CREATE TABLE `pf_videos` (
  `pkvideo` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `embed` text NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `publish_date` timestamp NOT NULL,
  `category_id` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `watched` int(11) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL,
  `comments` int(11) NOT NULL,
  `state` varchar(30) NOT NULL,
  `news_id` int(11) DEFAULT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_view_levels`
--

DROP TABLE IF EXISTS `pf_view_levels`;
CREATE TABLE `pf_view_levels` (
  `pkviewlevels` int(11) NOT NULL,
  `title` varchar(40) NOT NULL COMMENT 'Public title',
  `view_level_key` varchar(30) NOT NULL COMMENT 'Unique key',
  `modules` text NOT NULL COMMENT 'JSON encoded module privileges'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_view_levels`
--

INSERT INTO `pf_view_levels` (`pkviewlevels`, `title`, `view_level_key`, `modules`) VALUES
(1, 'Editör', 'editor', '{\n          2:["add","edit","remove","list","confirm"],\n          3:["add","edit","remove","list","confirm"],\n          4:["add","edit","remove","list","confirm"]\n      }'),
(2, 'Muhabir', 'muhabir', '{\n          2:["add"],\n          3:["add"],\n          4:["add"]\n      }'),
(3, 'Yönetici', 'yonetici', '{\n    1:["add","edit","remove","list","confirm"],\n    2:["add","edit","remove","list","confirm"],\n    3:["add","edit","remove","list","confirm"],\n    4:["add","edit","remove","list","confirm"],\n    5:["add","edit","remove","list","confirm"],\n    6:["add","edit","remove","list","confirm"],\n    7:["add","edit","remove","list","confirm"],\n    8:["add","edit","remove","list","confirm"],\n    9:["add","edit","remove","list","confirm"],\n    10:["add","edit","remove","list","confirm"],\n    11:["add","edit","remove","list","confirm"],\n    12:["add","edit","remove","list","confirm"],\n    13:["add","edit","remove","list","confirm"],\n    14:["add","edit","remove","list","confirm"]\n}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pf_articles`
--
ALTER TABLE `pf_articles`
  ADD PRIMARY KEY (`pkarticle`),
  ADD KEY `fk_category` (`category_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`) USING BTREE;

--
-- Indexes for table `pf_categories`
--
ALTER TABLE `pf_categories`
  ADD PRIMARY KEY (`pkcategory`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `parent_category` (`parent_id`);

--
-- Indexes for table `pf_comments`
--
ALTER TABLE `pf_comments`
  ADD PRIMARY KEY (`pkcomment`),
  ADD KEY `fk_subscriber` (`subscriber_id`),
  ADD KEY `fk_user` (`user_id`),
  ADD KEY `fk_parent_comment` (`parent_id`);

--
-- Indexes for table `pf_forms`
--
ALTER TABLE `pf_forms`
  ADD PRIMARY KEY (`pkform`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `pf_galleries`
--
ALTER TABLE `pf_galleries`
  ADD PRIMARY KEY (`pkgallery`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `fk_category` (`category_id`),
  ADD KEY `fk_news` (`news_id`),
  ADD KEY `fk_video` (`video_id`);

--
-- Indexes for table `pf_gallery_images`
--
ALTER TABLE `pf_gallery_images`
  ADD PRIMARY KEY (`pkgalleryimage`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `fk_gallery` (`gallery_id`);

--
-- Indexes for table `pf_logs`
--
ALTER TABLE `pf_logs`
  ADD PRIMARY KEY (`pklog`);

--
-- Indexes for table `pf_modules`
--
ALTER TABLE `pf_modules`
  ADD PRIMARY KEY (`pkmodule`);

--
-- Indexes for table `pf_news`
--
ALTER TABLE `pf_news`
  ADD PRIMARY KEY (`pknews`),
  ADD UNIQUE KEY `updated_by` (`updated_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `confirmed_by` (`confirmed_by`),
  ADD KEY `fkcategory` (`category_id`),
  ADD KEY `fk_gallery` (`gallery_id`),
  ADD KEY `fk_video` (`video_id`);

--
-- Indexes for table `pf_news_tag_map`
--
ALTER TABLE `pf_news_tag_map`
  ADD PRIMARY KEY (`pkntm`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `pf_subscribers`
--
ALTER TABLE `pf_subscribers`
  ADD PRIMARY KEY (`pksubscriber`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `pf_surveys`
--
ALTER TABLE `pf_surveys`
  ADD PRIMARY KEY (`pksurvey`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `pf_survey_votes`
--
ALTER TABLE `pf_survey_votes`
  ADD PRIMARY KEY (`pksurveyvote`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Indexes for table `pf_tags`
--
ALTER TABLE `pf_tags`
  ADD PRIMARY KEY (`pktag`);

--
-- Indexes for table `pf_users`
--
ALTER TABLE `pf_users`
  ADD PRIMARY KEY (`pkuser`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `pf_user_viewlevels`
--
ALTER TABLE `pf_user_viewlevels`
  ADD PRIMARY KEY (`pkuserviewlevel`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indexes for table `pf_videos`
--
ALTER TABLE `pf_videos`
  ADD PRIMARY KEY (`pkvideo`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `fk_category` (`category_id`),
  ADD KEY `fk_news` (`news_id`),
  ADD KEY `fk_gallery` (`gallery_id`);

--
-- Indexes for table `pf_view_levels`
--
ALTER TABLE `pf_view_levels`
  ADD PRIMARY KEY (`pkviewlevels`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pf_articles`
--
ALTER TABLE `pf_articles`
  MODIFY `pkarticle` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_categories`
--
ALTER TABLE `pf_categories`
  MODIFY `pkcategory` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_comments`
--
ALTER TABLE `pf_comments`
  MODIFY `pkcomment` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_forms`
--
ALTER TABLE `pf_forms`
  MODIFY `pkform` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_galleries`
--
ALTER TABLE `pf_galleries`
  MODIFY `pkgallery` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_gallery_images`
--
ALTER TABLE `pf_gallery_images`
  MODIFY `pkgalleryimage` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_logs`
--
ALTER TABLE `pf_logs`
  MODIFY `pklog` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_modules`
--
ALTER TABLE `pf_modules`
  MODIFY `pkmodule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `pf_news`
--
ALTER TABLE `pf_news`
  MODIFY `pknews` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_news_tag_map`
--
ALTER TABLE `pf_news_tag_map`
  MODIFY `pkntm` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_subscribers`
--
ALTER TABLE `pf_subscribers`
  MODIFY `pksubscriber` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_surveys`
--
ALTER TABLE `pf_surveys`
  MODIFY `pksurvey` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_survey_votes`
--
ALTER TABLE `pf_survey_votes`
  MODIFY `pksurveyvote` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_tags`
--
ALTER TABLE `pf_tags`
  MODIFY `pktag` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_users`
--
ALTER TABLE `pf_users`
  MODIFY `pkuser` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_user_viewlevels`
--
ALTER TABLE `pf_user_viewlevels`
  MODIFY `pkuserviewlevel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_videos`
--
ALTER TABLE `pf_videos`
  MODIFY `pkvideo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_view_levels`
--
ALTER TABLE `pf_view_levels`
  MODIFY `pkviewlevels` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pf_articles`
--
ALTER TABLE `pf_articles`
  ADD CONSTRAINT `article_category_ibfk` FOREIGN KEY (`category_id`) REFERENCES `pf_categories` (`pkcategory`) ON UPDATE CASCADE,
  ADD CONSTRAINT `article_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `article_updated_by_ibfk` FOREIGN KEY (`updated_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

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
  ADD CONSTRAINT `news_tag_news_id` FOREIGN KEY (`news_id`) REFERENCES `pf_news` (`pknews`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pf_surveys`
--
ALTER TABLE `pf_surveys`
  ADD CONSTRAINT `survey_created_by` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `survey_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pf_users`
--
ALTER TABLE `pf_users`
  ADD CONSTRAINT `users_created_by_ibfk` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pf_user_viewlevels`
--
ALTER TABLE `pf_user_viewlevels`
  ADD CONSTRAINT `user_viewlevel_fkuser` FOREIGN KEY (`user_id`) REFERENCES `pf_users` (`pkuser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pf_videos`
--
ALTER TABLE `pf_videos`
  ADD CONSTRAINT `videos_created_by` FOREIGN KEY (`created_by`) REFERENCES `pf_users` (`pkuser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_fk_category` FOREIGN KEY (`category_id`) REFERENCES `pf_categories` (`pkcategory`) ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_fk_gallery` FOREIGN KEY (`gallery_id`) REFERENCES `pf_galleries` (`pkgallery`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `videos_fk_news` FOREIGN KEY (`news_id`) REFERENCES `pf_news` (`pknews`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
