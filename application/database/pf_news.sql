-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2017 at 01:45 PM
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
-- Table structure for table `pf_adverts`
--

DROP TABLE IF EXISTS `pf_adverts`;
CREATE TABLE `pf_adverts` (
  `pkadvert` int(11) NOT NULL,
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
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
CREATE TABLE `pf_articles` (
  `pkarticle` int(11) NOT NULL,
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
  `state` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_bulletins`
--

DROP TABLE IF EXISTS `pf_bulletins`;
CREATE TABLE `pf_bulletins` (
  `pkbulletin` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `news` text NOT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `params` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_categories`
--

DROP TABLE IF EXISTS `pf_categories`;
CREATE TABLE `pf_categories` (
  `pkcategory` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT 'Kategorinin görünen ismi',
  `name` varchar(255) NOT NULL COMMENT 'Kategorinin kısaltma ismi.(unique)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL COMMENT 'Kategorinin görüntülenme sırası',
  `top_menu` tinyint(1) DEFAULT NULL COMMENT 'Bu kategori menüde yer alacak mı',
  `type` varchar(25) NOT NULL COMMENT 'article,news,video,gallery',
  `params` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_comments`
--

DROP TABLE IF EXISTS `pf_comments`;
CREATE TABLE `pf_comments` (
  `pkcomment` int(11) NOT NULL,
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
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1- beklemede; 2- Onaylandı; 3-çöp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
CREATE TABLE `pf_forms` (
  `pkform` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `params` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_galleries`
--

DROP TABLE IF EXISTS `pf_galleries`;
CREATE TABLE `pf_galleries` (
  `pkgallery` int(11) NOT NULL,
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
  `params` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_gallery_images`
--

DROP TABLE IF EXISTS `pf_gallery_images`;
CREATE TABLE `pf_gallery_images` (
  `pkgalleryimage` int(11) NOT NULL,
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
  `dislikes` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_likes`
--

DROP TABLE IF EXISTS `pf_likes`;
CREATE TABLE `pf_likes` (
  `pklike` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `likes` int(11) DEFAULT NULL,
  `dislikes` int(11) DEFAULT NULL,
  `module` varchar(20) NOT NULL COMMENT 'resim,yorum',
  `ip` varchar(50) DEFAULT NULL,
  `session_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_logs`
--

DROP TABLE IF EXISTS `pf_logs`;
CREATE TABLE `pf_logs` (
  `pklog` int(11) NOT NULL,
  `kind` varchar(20) NOT NULL COMMENT 'error,warning,information,important',
  `module` varchar(255) NOT NULL COMMENT 'system module names',
  `description` varchar(500) DEFAULT NULL COMMENT 'example: user not found',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(40) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_logs`
--

INSERT INTO `pf_logs` (`pklog`, `kind`, `module`, `description`, `created_at`, `user_id`, `session_id`, `ip`) VALUES
(1, 'info', 'auth', '', '2017-07-19 09:55:51', 1, 'hiklav0rck6m344om10ukhcj86gn1p93', ''),
(4, 'warning', 'auth', '', '2017-07-19 09:58:54', NULL, 'asokp3mujerqaeodg4tijd8rh1q6385a', ''),
(5, 'info', 'auth', '', '2017-07-19 09:59:19', 1, 'asokp3mujerqaeodg4tijd8rh1q6385a', ''),
(6, 'info', 'auth', 'Logout User: 1', '2017-07-19 10:00:02', 1, 'asokp3mujerqaeodg4tijd8rh1q6385a', ''),
(7, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-19 10:05:23', 1, 'bdleae1dl6hc1eg2e7ep94cfm902rd86', ''),
(8, 'error', 'auth', 'Login failed cwyusef@gmail.com', '2017-07-19 10:28:49', NULL, 'u370rb74sfl7dlq2taibmjs7c5r160ek', ''),
(9, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-19 10:29:00', 1, 'u370rb74sfl7dlq2taibmjs7c5r160ek', ''),
(10, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-19 10:30:55', 1, 'u370rb74sfl7dlq2taibmjs7c5r160ek', '127.0.0.1'),
(11, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-19 11:22:06', 1, 'b8pn99s8kp64hkhq98vi29kf3nekg7kv', '127.0.0.1'),
(12, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-19 11:42:33', 1, 'vd0mga9rf1cc4tpeu2g4v4dtug1ir5qa', '127.0.0.1'),
(13, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-19 13:22:01', 1, 'dkbc5lgjl4vk5m9gug8rtgu7cpj4ad2a', '127.0.0.1'),
(14, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-19 14:33:11', 1, 'b7rmnv9kij4pmkm49rd2j7mmjaoaugtr', '127.0.0.1'),
(15, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-20 08:08:18', 1, 'v5dkcuu1699c9lem76a4iiek17toen5l', '127.0.0.1'),
(16, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-20 09:30:09', 1, 'dkd694927kcss1udok3v3cpqbughv9ub', '127.0.0.1'),
(17, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-20 10:30:37', 1, 'o8gflp99dcp08mifmtc2uvsn4vbfsm80', '127.0.0.1'),
(18, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-20 11:31:03', 1, '7o4jrhipkiokh0k5kv0atcskk98u5r7u', '127.0.0.1'),
(19, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-20 12:44:22', 1, 'g5vki21ah12qbnelllpp8bd87sa3p7va', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `pf_modules`
--

DROP TABLE IF EXISTS `pf_modules`;
CREATE TABLE `pf_modules` (
  `pkmodule` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(50) NOT NULL,
  `icon` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_modules`
--

INSERT INTO `pf_modules` (`pkmodule`, `name`, `title`, `icon`) VALUES
(1, 'pages', 'Pages', 'fa-file-o'),
(2, 'news', 'Text News', ''),
(3, 'image_news', 'Image News', ''),
(4, 'video_news', 'Video News', ''),
(5, 'articles', 'Articles', ''),
(7, 'users', 'Users', 'fa-users'),
(8, 'bulletins', 'Bulletins', ''),
(9, 'seo', 'SEO', ''),
(10, 'surveys', 'Surveys', ''),
(11, 'adverts', 'Adverts', ''),
(12, 'messages', 'Messages', ''),
(13, 'comments', 'Comments', ''),
(14, 'logs', 'Logs', ''),
(15, 'statistics', 'Statistics', ''),
(16, 'sosyal', 'Sosyal Medya', ''),
(17, 'dashboard', 'Dashboard', 'fa-dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `pf_news`
--

DROP TABLE IF EXISTS `pf_news`;
CREATE TABLE `pf_news` (
  `pknews` int(11) NOT NULL,
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
  `source` varchar(255) DEFAULT NULL
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
-- Table structure for table `pf_pages`
--

DROP TABLE IF EXISTS `pf_pages`;
CREATE TABLE `pf_pages` (
  `pkpage` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text,
  `content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  `status` varchar(30) NOT NULL DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_pages`
--

INSERT INTO `pf_pages` (`pkpage`, `title`, `summary`, `content`, `created_at`, `updated_at`, `created_by`, `updated_by`, `publish_date`, `allow_comments`, `comments`, `status`) VALUES
(2, 'Sayfa Başlık Sayfa Başlık Sayfa Başlık Sayfa Başlık Sayfa Başlık', NULL, 'İletişim bilgilerimize aşağıdaki adresten ulaşabilirsiniz.s sad asd asd&nbsp;', '2017-07-17 09:37:20', '2017-07-18 14:20:47', 1, 1, NULL, 0, 0, 'published'),
(5, 'Son dakika! Meteoroloji\'den İstanbul için yeni uyarı', NULL, '<p>\r\n\r\n</p><p><a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/istanbul">İstanbul</a>\'da gece saatlerinden itibaren etkili olan gök gürültü kuvvetli sağanak, başta trafik olmak üzere yaşamı olumsuz etkiledi.</p><p>İstanbul Valiliği, sosyal medya hesabında, "Bugün ilimiz yoğun yağış aldığından ulaşımda sıkıntı yaşanmaması için zorunlu olmadıkça özel araçlarla trafiğe çıkılmaması rica olunur." uyarısında bulundu.</p><p><strong>YAĞIŞ, 15.00\'DEN SONRA AZALACAK</strong></p><p>Öte yandan gelen <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/son-dakika">son dakika</a>&nbsp;bilgisine göre, <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/meteoroloji-genel-mudurlugu">Meteoroloji Genel Müdürlüğü</a>, İstanbul\'da yağışın saat 15.00\'dan itibaren etkisini azaltacağını açıkladı.</p><p>Meteoroloji Genel Müdürlüğü, Trakya ve İstanbul\'daki sağanağın saat 15.00\'ten sonra etkisinin azalmasının beklendiğini duyurdu.</p><p>Meteoroloji Genel Müdürlüğü, sosyal medya hesabından, "Meteorolojik Değerlendirme 1" başlığıyla duyuru yaptı.</p>\r\n\r\n\r\n\r\n<p>Marmara Bölgesi\'nde devam eden kuvvetli ve gök gürültülü sağanak yağışın saat 15.00\'ten sonra Trakya ve İstanbul\'da etkisini azaltmasının beklendiği vurgulanan açıklamada, şöyle denildi:</p><p>"Ancak yağışlı sistemin Marmara\'nın doğusuna hareket ederek Kocaeli, Sakarya, Düzce, Zonguldak ve Bartın\'ın özellikle kıyı kesimlerinde yarın öğle saatlerine kadar şiddetli (75-100 kg/m2) sağanak ve gök gürültülü sağanak yağışlara sebep olması beklenmektedir. Saat 11.00 itibarıyla son 6 saatte, Silivri\'de 128, Üsküdar\'da 108, Beykoz\'da 85, Sarıyer\'de 78, Çatalca\'da 55, Kırklareli/Vize\'de 45, Eyüp\'te 44, Güngören\'de 44, Çekmeköy\' de 39 ve Kadıköy\'de 35 kg yağış kaydedilmiştir."</p><p><strong>SON 32 YILIN EN BÜYÜĞÜ</strong></p><p>Temmuz ayının tamamında ortalama 32,5 kg yağış alan İstanbul\'da sadece bugün, hem de günün ilk yarısında rekor miktarda yağmur yağdı.</p>\r\n\r\n\r\n\r\n<p><strong>1 GÜNDE, TEMMUZ AYI ORTALAMASININ ÇOK ÜSTÜNDE</strong></p><p>Neredeyse İstanbul\'un tamamına düşen yağış, Temmuz ayı ortalamasını çok geride bıraktı.</p><p><strong>32 YILIN EN YAĞMURLU GÜNÜ</strong></p><p>İstanbul\'da 1985 yılı Ekim ayının 16\'ncı günü, 125.5 kg\'lık yağışla, tüm zamanların "en yağışlı" günüydü. Ancak bugün yağan yağmur, üstelik bir yaz ayında yağan yağmur bu miktarı geride bıraktı. DHA\'nin meteorolojik ölçüm istasyonlarından derlediği bilgilere göre günün ilk yarısında Silivri\'de metrekareye tam 128 kg. yağış düştü.</p><p><strong>TÜM İLÇELERDE REKOR YAĞIŞ</strong></p><p>İstanbul\'un diğer semtlerine de rekor yağışlar düştü, aylık ortalamayı kat be kat geride bıraktı. İşte haberin yayınlandığı sırada bazı ilçelerde metrekareye düşen yağış miktarları. Üsküdar 108 kg, Beykoz 85 kg, Sarıyer 80 kg</p>\r\n\r\n<br><p></p>', '2017-07-18 12:04:05', '2017-07-18 12:04:05', 1, NULL, NULL, 0, 0, 'draft'),
(6, 'Son dakika! Meteoroloji\'den İstanbul için yeni uyarı', NULL, '<p>\r\n\r\n</p><p><a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/istanbul">İstanbul</a>\'da gece saatlerinden itibaren etkili olan gök gürültü kuvvetli sağanak, başta trafik olmak üzere yaşamı olumsuz etkiledi.</p><p>İstanbul Valiliği, sosyal medya hesabında, "Bugün ilimiz yoğun yağış aldığından ulaşımda sıkıntı yaşanmaması için zorunlu olmadıkça özel araçlarla trafiğe çıkılmaması rica olunur." uyarısında bulundu.</p><p><strong>YAĞIŞ, 15.00\'DEN SONRA AZALACAK</strong></p><p>Öte yandan gelen <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/son-dakika">son dakika</a>&nbsp;bilgisine göre, <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/meteoroloji-genel-mudurlugu">Meteoroloji Genel Müdürlüğü</a>, İstanbul\'da yağışın saat 15.00\'dan itibaren etkisini azaltacağını açıkladı.</p><p>Meteoroloji Genel Müdürlüğü, Trakya ve İstanbul\'daki sağanağın saat 15.00\'ten sonra etkisinin azalmasının beklendiğini duyurdu.</p><p>Meteoroloji Genel Müdürlüğü, sosyal medya hesabından, "Meteorolojik Değerlendirme 1" başlığıyla duyuru yaptı.</p>\r\n\r\n\r\n\r\n<p>Marmara Bölgesi\'nde devam eden kuvvetli ve gök gürültülü sağanak yağışın saat 15.00\'ten sonra Trakya ve İstanbul\'da etkisini azaltmasının beklendiği vurgulanan açıklamada, şöyle denildi:</p><p>"Ancak yağışlı sistemin Marmara\'nın doğusuna hareket ederek Kocaeli, Sakarya, Düzce, Zonguldak ve Bartın\'ın özellikle kıyı kesimlerinde yarın öğle saatlerine kadar şiddetli (75-100 kg/m2) sağanak ve gök gürültülü sağanak yağışlara sebep olması beklenmektedir. Saat 11.00 itibarıyla son 6 saatte, Silivri\'de 128, Üsküdar\'da 108, Beykoz\'da 85, Sarıyer\'de 78, Çatalca\'da 55, Kırklareli/Vize\'de 45, Eyüp\'te 44, Güngören\'de 44, Çekmeköy\' de 39 ve Kadıköy\'de 35 kg yağış kaydedilmiştir."</p><p><strong>SON 32 YILIN EN BÜYÜĞÜ</strong></p><p>Temmuz ayının tamamında ortalama 32,5 kg yağış alan İstanbul\'da sadece bugün, hem de günün ilk yarısında rekor miktarda yağmur yağdı.</p>\r\n\r\n\r\n\r\n<p><strong>1 GÜNDE, TEMMUZ AYI ORTALAMASININ ÇOK ÜSTÜNDE</strong></p><p>Neredeyse İstanbul\'un tamamına düşen yağış, Temmuz ayı ortalamasını çok geride bıraktı.</p><p><strong>32 YILIN EN YAĞMURLU GÜNÜ</strong></p><p>İstanbul\'da 1985 yılı Ekim ayının 16\'ncı günü, 125.5 kg\'lık yağışla, tüm zamanların "en yağışlı" günüydü. Ancak bugün yağan yağmur, üstelik bir yaz ayında yağan yağmur bu miktarı geride bıraktı. DHA\'nin meteorolojik ölçüm istasyonlarından derlediği bilgilere göre günün ilk yarısında Silivri\'de metrekareye tam 128 kg. yağış düştü.</p><p><strong>TÜM İLÇELERDE REKOR YAĞIŞ</strong></p><p>İstanbul\'un diğer semtlerine de rekor yağışlar düştü, aylık ortalamayı kat be kat geride bıraktı. İşte haberin yayınlandığı sırada bazı ilçelerde metrekareye düşen yağış miktarları. Üsküdar 108 kg, Beykoz 85 kg, Sarıyer 80 kg</p>\r\n\r\n<br><p></p>', '2017-07-18 12:04:55', '2017-07-18 12:04:55', 1, NULL, NULL, 0, 0, 'draft'),
(8, 'İstanbul Boğazı\'nda şoke eden görüntü!', NULL, '<p>\r\n\r\nİstanbul dün gece başlayan ve sabah saatlerinde şiddetini arttıran yağmur, İstanbullulara zor anlar yaşattı. Yollarda biriken sular trafiğin sıkışmasına neden olurken, toplu taşımada da aksamalar meydana geldi. Şiddetli yağış nedeniyle İstanbul Boğazı\'nda denize karışan sel suyu şaşırtan görüntülere sahne oldu. Yaşanan olay nedeniyle denizin iki renk haline geldiği görülürken, köprüden geçen vatandaşlar, o anları cep telefonları ile kaydedip sosyal medya hesaplarından paylaştı. \r\n\r\n<br></p>', '2017-07-18 12:12:11', '2017-07-18 12:12:11', 1, NULL, NULL, 0, 0, 'draft'),
(9, 'Whatsapp\'ta yeni dönem başlıyor!', NULL, '<p>\r\n\r\n</p><h2>Whatsapp\'a gelmesi sabırsızlıkla beklenen özellik sonunda kullanıcılara sunuluyor. Bakın bu kez Whatsapp\'ın kullanıcılara son sürprizi ne?</h2>\r\n\r\n<br><p></p>', '2017-07-18 12:13:40', '2017-07-18 12:13:40', 1, NULL, NULL, 0, 0, 'draft');

-- --------------------------------------------------------

--
-- Table structure for table `pf_subscribers`
--

DROP TABLE IF EXISTS `pf_subscribers`;
CREATE TABLE `pf_subscribers` (
  `pksubscriber` int(11) NOT NULL,
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
  `banned_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_subscribers`
--

INSERT INTO `pf_subscribers` (`pksubscriber`, `name`, `city`, `country`, `email`, `username`, `password`, `last_visit`, `created_at`, `ip`, `banned`, `ban_message`, `banned_by`) VALUES
(2, NULL, NULL, NULL, 'nane', NULL, '$2a$16$m6F3.jE3SvhOSWWdqsfp0uvW0.XuHD6bKjLyfHOAKYXRPQxSLoTZS', '2017-07-16 21:11:25', '2017-07-16 21:11:25', NULL, 0, NULL, NULL),
(3, NULL, NULL, NULL, 'cwyusef@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '0000-00-00 00:00:00', '2017-07-17 07:33:17', NULL, 0, NULL, NULL);

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL
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
  `ip` varchar(50) DEFAULT NULL,
  `session_id` varchar(40) NOT NULL
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
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `user_type` int(11) DEFAULT NULL,
  `params` text,
  `last_visit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_users`
--

INSERT INTO `pf_users` (`pkuser`, `username`, `fullname`, `password`, `email`, `profile_picture`, `created_at`, `enabled`, `user_type`, `params`, `last_visit`) VALUES
(1, 'kerim', 'M. Yusuf Erden', 'e10adc3949ba59abbe56e057f20f883e', 'cwyusef@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 15:09:31', 1, 3, NULL, '0000-00-00 00:00:00'),
(4, 'yusuf1', 'M. Yusuf Erden', 'e10adc3949ba59abbe56e057f20f883e', 'cwyusef1@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 15:09:31', 1, 1, NULL, '2017-07-16 21:00:00'),
(5, 'yusuf2', 'M. Yusuf Erden', 'e10adc3949ba59abbe56e057f20f883e', 'cwyusef2@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 15:09:31', 1, 2, NULL, '2017-07-16 21:00:00'),
(6, 'yusuf3', 'M. Yusuf Erden', 'e10adc3949ba59abbe56e057f20f883e', 'cwyusef3@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 15:09:31', 0, 3, NULL, '2017-07-16 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pf_user_types`
--

DROP TABLE IF EXISTS `pf_user_types`;
CREATE TABLE `pf_user_types` (
  `pkusertype` int(11) NOT NULL,
  `title` varchar(40) NOT NULL COMMENT 'Public title',
  `modules` text NOT NULL COMMENT 'JSON encoded module privileges'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_user_types`
--

INSERT INTO `pf_user_types` (`pkusertype`, `title`, `modules`) VALUES
(1, 'Editör', '{"dashboard":["add","edit","remove","list","confirm"],\n"pages":["add","edit","remove","list","confirm"],\n"news":["add","edit","remove","list","confirm"]}'),
(2, 'Muhabir', '{"metinhaber":["add","edit","remove","list","confirm"],"fotogaleri"  :["add","edit","remove","list","confirm"],"videogaleri" :["add","edit","remove","list","confirm"]}'),
(3, 'Yönetici', '{"dashboard":["add","edit","remove","list","confirm"],\n"pages":["add","edit","remove","list","confirm"],\n"news":["add","edit","remove","list","confirm"],\n"image_news":["add","edit","remove","list","confirm"],\n"video_news":["add","edit","remove","list","confirm"],\n"articles":["add","edit","remove","list","confirm"],\n"users":["add","edit","remove","list","confirm"],\n"bulletins":["add","edit","remove","list","confirm"],\n"seo":["add","edit","remove","list","confirm"],\n"surveys":["add","edit","remove","list","confirm"],\n"adverts":["add","edit","remove","list","confirm"],\n"messages":["add","edit","remove","list","confirm"],\n"comments":["add","edit","remove","list","confirm"],\n"logs":["add","edit","remove","list","confirm"],\n"statistics":["add","edit","remove","list","confirm"],\n"sosyal":["add","edit","remove","list","confirm"]}');

-- --------------------------------------------------------

--
-- Table structure for table `pf_videos`
--

DROP TABLE IF EXISTS `pf_videos`;
CREATE TABLE `pf_videos` (
  `pkvideo` int(11) NOT NULL,
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
  `params` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pf_adverts`
--
ALTER TABLE `pf_adverts`
  ADD PRIMARY KEY (`pkadvert`),
  ADD KEY `location` (`location`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `pf_articles`
--
ALTER TABLE `pf_articles`
  ADD PRIMARY KEY (`pkarticle`),
  ADD KEY `fk_category` (`category_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`) USING BTREE;

--
-- Indexes for table `pf_bulletins`
--
ALTER TABLE `pf_bulletins`
  ADD PRIMARY KEY (`pkbulletin`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

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
-- Indexes for table `pf_likes`
--
ALTER TABLE `pf_likes`
  ADD PRIMARY KEY (`pklike`);

--
-- Indexes for table `pf_logs`
--
ALTER TABLE `pf_logs`
  ADD PRIMARY KEY (`pklog`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ip` (`ip`);

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
-- Indexes for table `pf_pages`
--
ALTER TABLE `pf_pages`
  ADD PRIMARY KEY (`pkpage`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `pf_subscribers`
--
ALTER TABLE `pf_subscribers`
  ADD PRIMARY KEY (`pksubscriber`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `banned_by` (`banned_by`);

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
  ADD KEY `user_type` (`user_type`);

--
-- Indexes for table `pf_user_types`
--
ALTER TABLE `pf_user_types`
  ADD PRIMARY KEY (`pkusertype`);

--
-- Indexes for table `pf_videos`
--
ALTER TABLE `pf_videos`
  ADD PRIMARY KEY (`pkvideo`),
  ADD UNIQUE KEY `updated_by` (`updated_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `fk_category` (`category_id`),
  ADD KEY `fk_news` (`news_id`),
  ADD KEY `fk_gallery` (`gallery_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pf_adverts`
--
ALTER TABLE `pf_adverts`
  MODIFY `pkadvert` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pf_articles`
--
ALTER TABLE `pf_articles`
  MODIFY `pkarticle` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_bulletins`
--
ALTER TABLE `pf_bulletins`
  MODIFY `pkbulletin` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_categories`
--
ALTER TABLE `pf_categories`
  MODIFY `pkcategory` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_comments`
--
ALTER TABLE `pf_comments`
  MODIFY `pkcomment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
-- AUTO_INCREMENT for table `pf_likes`
--
ALTER TABLE `pf_likes`
  MODIFY `pklike` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pf_logs`
--
ALTER TABLE `pf_logs`
  MODIFY `pklog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `pf_modules`
--
ALTER TABLE `pf_modules`
  MODIFY `pkmodule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
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
-- AUTO_INCREMENT for table `pf_pages`
--
ALTER TABLE `pf_pages`
  MODIFY `pkpage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `pf_subscribers`
--
ALTER TABLE `pf_subscribers`
  MODIFY `pksubscriber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `pkuser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pf_user_types`
--
ALTER TABLE `pf_user_types`
  MODIFY `pkusertype` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pf_videos`
--
ALTER TABLE `pf_videos`
  MODIFY `pkvideo` int(11) NOT NULL AUTO_INCREMENT;
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
