-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2017 at 11:17 AM
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
  `alias` varchar(255) NOT NULL,
  `summary` text,
  `content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `allow_comments` tinyint(1) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pkarticle`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_articles`
--

INSERT INTO `pf_articles` (`pkarticle`, `title`, `alias`, `summary`, `content`, `created_at`, `updated_at`, `created_by`, `updated_by`, `publish_date`, `image`, `featured_image`, `author`, `view`, `allow_comments`, `comments`, `status`) VALUES
(1, 'Tam bir yıl 15 gün sonra bu bilgi niye sızdırıldı', 'tam-bir-yil-15-gun-sonra-bu-bilgi-niye-sizdirildi', '<p>15&nbsp;Temmuz 2016 darbe girişiminden tam 1 yıl 15 gün sonra çok ilginç bir bilgiyi öğrendik.</p>', '<p>Bu bilgi H&uuml;rriyet yazarı <strong>Abdulkadir Selvi</strong>&rsquo;nin d&uuml;nk&uuml; yazısında vardı.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> Buna g&ouml;re, MİT M&uuml;steşarı <strong>Hakan Fidan </strong>darbenin akşam&uuml;zeri Cumhurbaşkanı&rsquo;nın koruma m&uuml;d&uuml;r&uuml; ile yaptığı telefon konuşmasını, Genelkurmay Başkanı&rsquo;nın yanındaki darbeci yaverin telefonundan yapmış.</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Sizce b&ouml;yle bir ayrıntının, 15 Temmuz darbe gecesinden tam 1 yıl 15 g&uuml;n sonra sızdırılması ne anlama geliyor?</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Ne anlama geldiğini<strong> MİT </strong>değil, <strong>Abdulkadir Selvi </strong>s&ouml;yl&uuml;yor:</p>\r\n\r\n<p><strong>&ldquo;O gece MİT&rsquo;in m&uuml;cadelesi darbenin başarısız olmasında etkili oluyor&rdquo; </strong>diyor...</p>\r\n\r\n<p>Yani <strong>&ldquo;MİT darbeyi &ouml;ne aldırmak i&ccedil;in m&uuml;cadele etmiş...&rdquo;</strong></p>\r\n\r\n<p>***</p>\r\n\r\n<p>İyi de insana sormazlar mı...</p>\r\n\r\n<p>Siz darbeyi &ouml;ne aldırmak i&ccedil;in m&uuml;cadele ederken &uuml;lkenin se&ccedil;ilmiş en &uuml;st d&uuml;zey iki kişisinin niye haberi olmuyor?</p>\r\n\r\n<p>Niye onlara bilgi verilmiyor ve &ccedil;ok ciddi &ouml;l&uuml;m tehlikesi ile karşı karşıya bırakılıyor?</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Benim anladığım şu.</p>\r\n\r\n<p>MİT M&uuml;steşarlığı bu sorulardan bunalmış ve kendine bir &ccedil;ıkış yolu arıyor.</p>\r\n\r\n<p>Ama onlara tavsiyem şu.</p>\r\n\r\n<p>Daha ikna edici bir tez &uuml;zerinde &ccedil;alışın.</p>\r\n\r\n<p>&Ccedil;&uuml;nk&uuml; bu tez sizin o g&uuml;n ve geceki aymazlığınızı kurtarmaz...</p>\r\n\r\n<p>Ama daha beteri, <strong>&ldquo;kontroll&uuml; darbe&rdquo; </strong>sa&ccedil;malığını ortaya atanların ekmeğine yağ s&uuml;rersiniz.</p>\r\n\r\n<p><strong>HELE ŞUNU Hİ&Ccedil; ANLAMADIM</strong></p>\r\n\r\n<p><strong>ABDULKADİR Selvi </strong>yazısını, bana tuhaf gelen bir ayrıntı ile bitiriyor.</p>\r\n<!-- /68858259/hurriyet/yazarlar/body_300x250_1 --><!-- /68858259/hurriyet/yazarlar/body_300x250_2 -->\r\n\r\n<p>Ona g&ouml;re, MİT Basın Danışmanı <strong>Nuh Yılmaz&rsquo;</strong>ın <strong>&ldquo;Darbe p&uuml;sk&uuml;rt&uuml;ld&uuml;&rdquo; </strong>diye a&ccedil;ıklama yapması da darbenin başarısız olmasında &ouml;nemli bir etken olmuş.</p>\r\n\r\n<p>Tecr&uuml;beli her gazeteci yazının sonundaki bu c&uuml;mlenin ne anlama geldiğini kolayca anlayabilir.</p>\r\n\r\n<p>Ben de anladım tabi... Ama benim sorum başka.</p>\r\n\r\n<p>Başbakan&rsquo;ın televizyonlarda <strong>&ldquo;Tehlike hen&uuml;z ge&ccedil;medi. Yerlerinizden ayrılmayın&rdquo; </strong>diye &ccedil;aba harcadığı saatlerde, bir basın m&uuml;şavirinin <strong>&ldquo;Merak etmeyin darbe p&uuml;sk&uuml;rt&uuml;ld&uuml;&rdquo; </strong>a&ccedil;ıklaması ne anlama geliyor?</p>\r\n\r\n<p>Hadi bana makul ve ikna edici bir a&ccedil;ıklama yapın.</p>\r\n\r\n<p><strong>HTS KAYITLARI YETMEZ İ&Ccedil;ERİK DE A&Ccedil;IKLANMALI</strong></p>\r\n\r\n<p><strong>ABDULKADIR Selvi</strong> ger&ccedil;ekten iyi bir iş yaptı. Yazısında &ccedil;ok &ouml;nemli bir ayrıntı daha vardı.</p>\r\n\r\n<p>Milli G&uuml;venlik Kurulu Genel Sekreterliği o geceye ait HTS ve Genelkurmay kayıtları &uuml;zerine titiz bir &ccedil;alışma yaptırmış. Yani kimin kiminle hangi saatte konuştuğu &ccedil;ıkarılmış.</p>\r\n\r\n<p>Bence asıl &ouml;nemli olan bundan &ccedil;ok ne konuştuklarının &ccedil;ıkarılması.</p>\r\n\r\n<p><strong>-</strong> Cumhurbaşkanı, MİT M&uuml;steşarı&rsquo;na ne dedi? O ne cevap verdi?</p>\r\n\r\n<p><strong>-</strong> Başbakan, MİT M&uuml;steşarı&rsquo;na ne dedi? O ne cevap verdi?</p>\r\n\r\n<p><strong>-</strong> MİT M&uuml;steşarı, Cumhurbaşkanı&rsquo;nın koruma m&uuml;d&uuml;r&uuml;ne ne bilgi verdi? O neler s&ouml;yledi?</p>\r\n\r\n<p><strong>BU SERSERİLER BU G&Uuml;C&Uuml; NEREDEN ALIYOR</strong></p>\r\n\r\n<p><strong>&Uuml;MİT Boyner</strong> bir kadın olarak, gen&ccedil; kız annesi olarak umutsuzca haykırıyor <strong>&ldquo;Kimden g&uuml;&ccedil; alıyor bu ceberut zihniyet?&rdquo;</strong></p>\r\n\r\n<p>Ben s&ouml;yleyeyim.</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Hıyarın teki durup dururken otob&uuml;steki kıza saldırınca.</p>\r\n\r\n<p>Kendini mahallenin Bek&ccedil;i Murtaza&rsquo;sı ilan edip parkta oturan kadının yakasına sarılınca... Yukarılardan <strong>&ldquo;Sen ne yapıyorsun lan&rdquo; </strong>diyen biri &ccedil;ıkmayınca...</p>\r\n\r\n<p>O kızışmış Bek&ccedil;i Murtaza, o serseri de sanıyor ki...</p>\r\n\r\n<p>Ben halkım, ben iktidardayım...</p>\r\n\r\n<p>Ben ne yaparsam odur...</p>\r\n\r\n<p>***</p>\r\n\r\n<p>O kızışmış adam, o g&ouml;z&uuml; d&ouml;n&uuml;ş yaratık sanıyor ki...</p>\r\n\r\n<p>Her şey ondan yanadır....</p>\r\n\r\n<p>Sırtı sağlamdır...</p>\r\n\r\n<p>Biliyor ki...</p>\r\n\r\n<p>Milletvekili i&ccedil;eri girer... Ama onun ahlaki dokunulmazlığı vardır...</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Anladın mı şimdi sevgili <strong>&Uuml;mit</strong>...</p>\r\n\r\n<p>O zorbanın g&uuml;vendiği şey zamandır... Zamanın ruhudur...</p>\r\n\r\n<p>***</p>\r\n\r\n<p>M&uuml;nferit derler...</p>\r\n\r\n<p>Ama bil ki m&uuml;nferit değildir...</p>\r\n\r\n<p>Bu toplum bunlara haddini bildirmedik&ccedil;e durmaz...</p>\r\n\r\n<p>Biri parktaki kadının sa&ccedil;ına başına saldırır...</p>\r\n\r\n<p>&Ouml;teki ise elinde orak, keser <strong>Atat&uuml;rk</strong>&rsquo;&uuml;n başının i&ccedil;indekine...</p>\r\n\r\n<p><img alt="Tam bir yıl 15 gün sonra bu bilgi niye sızdırıldı" src="//i.hurimg.com/i/hurriyet/75/770x0/597f901718c7730510626bb4" /></p>\r\n\r\n<p><strong>DİKTAT&Ouml;RLERE ARTIK DİKTAT&Ouml;RL&Uuml;K DE YETMİYOR</strong></p>\r\n\r\n<p><strong>&Ouml;NCEKİ </strong>g&uuml;n Venezuela&rsquo;da yapılan se&ccedil;imlerle ilgili notlarım ş&ouml;yle:</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> Venezuela bir petrol &uuml;lkesi.</p>\r\n\r\n<p>Ama halkı perişan... &Ccedil;ocuk felci aşısı bile bulunmuyor.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> &Uuml;lkenin başında <strong>Maduro </strong>isimli bir diktat&ouml;r var.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> <strong>Maduro</strong>, her t&uuml;rl&uuml; g&uuml;ce sahip, ama bu bile ona yetmiyor. Onun i&ccedil;in yeni bir anayasa hazırlaması i&ccedil;in bir t&uuml;r kurucu meclis se&ccedil;imi yaptırdı.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> Halkın y&uuml;zde 70&rsquo;i yeni bir anayasaya karşı olduğu halde, kurucu meclis se&ccedil;iminden vazge&ccedil;ilmedi. Halkın bir b&ouml;l&uuml;m&uuml; &ccedil;areyi sandığa gitmemekte buldu.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> Başkan, se&ccedil;im sırasında kamunun b&uuml;t&uuml;n imk&acirc;nlarını kullandı. Se&ccedil;ime destek vermeyen kamu y&ouml;neticileri, işlerinden atılmakla tehdit edildi.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> Binlerce insan hapse atıldı. 120 insan hayatını kaybetti.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> Venezuela Y&uuml;ksek Se&ccedil;im Kurulu Başkanı, oy kullanma s&uuml;resini bir saat uzattı ve se&ccedil;im sandıklarından gelen b&uuml;t&uuml;n itirazlara rağmen <strong>&ldquo;her şeyin normal olduğunu&rdquo; </strong>a&ccedil;ıkladı.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> Amerika Birleşik Devletleri Y&ouml;netimi, se&ccedil;imi <strong>&ldquo;sham election&rdquo; </strong>(hileli se&ccedil;im) olarak ilan etti.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> Brezilya, Arjantin, Meksika, İspanya, Şili, Kosta Rika, Panama, Kolombiya ve Peru se&ccedil;im sonu&ccedil;larını tanımadıklarını a&ccedil;ıkladı.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> Venezuela diktat&ouml;r&uuml; <strong>Maduro </strong>ise se&ccedil;im sonu&ccedil;larını <strong>&ldquo;&uuml;lkede istikrar ve huzurun sağlanmasında en &ouml;nemli adım&rdquo; </strong>olarak niteledi.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> Kurucu meclis, yeni bir anayasa yapacak, Venezuela başkanına daha da sınırsız yetkiler ve g&uuml;&ccedil; verecek, muhalefet milletvekillerinin dokunulmazlıklarını kaldıracak bir uygulama sağlayacak.</p>\r\n\r\n<p>***</p>\r\n\r\n<p><strong>-</strong> &Ouml;ld&uuml;ğ&uuml; i&ccedil;in g&ouml;revden ayrılan eski diktat&ouml;r <strong>Chavez</strong>&rsquo;in bazı destek&ccedil;ilerinin bile <strong>&ldquo;Bu kadarı da olmaz&rdquo; </strong>dediği se&ccedil;im g&ouml;sterdi ki...</p>\r\n\r\n<p>21&rsquo;inci y&uuml;zyıl diktat&ouml;rlerine sadece diktat&ouml;rl&uuml;k yetkileri de yetmiyor.</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Artık, ilahi, tanrısal bir g&uuml;&ccedil; istiyorlar.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>SON 24 SAATTE YAŞANANLAR</strong></p>\r\n\r\n<p>Videoyu OynatOynat</p>\r\n\r\n<p>Ses A&ccedil;</p>\r\n\r\n<p>S&uuml;re 0:23</p>\r\n\r\n<p>/</p>\r\n\r\n<p>Toplam S&uuml;re 1:19</p>\r\n\r\n<p>Y&uuml;klendi: 0%</p>\r\n\r\n<p>Y&uuml;kleniyor: 0%</p>\r\n\r\n<p>Yayın TipiCANLI</p>\r\n\r\n<p>Kalan S&uuml;re -0:55</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n</ul>\r\n\r\n<p>Oynatma Hızı</p>\r\n\r\n<p>1</p>\r\n\r\n<ul>\r\n	<li>B&ouml;l&uuml;mler</li>\r\n</ul>\r\n\r\n<p>B&ouml;l&uuml;mler</p>\r\n\r\n<ul>\r\n	<li>descriptions off, se&ccedil;ildi</li>\r\n</ul>\r\n\r\n<p>Descriptions</p>\r\n\r\n<ul>\r\n	<li>Altyazı Kapalı, se&ccedil;ildi</li>\r\n</ul>\r\n\r\n<p>Altyazı</p>\r\n\r\n<ul>\r\n	<li>captions settings, ek a&ccedil;ıklama ayarları men&uuml;s&uuml;n&uuml; a&ccedil;ar</li>\r\n	<li>Ek A&ccedil;ıklamalar Kapalı, se&ccedil;ildi</li>\r\n</ul>\r\n\r\n<p>Ek A&ccedil;ıklamalar</p>\r\n\r\n<ul>\r\n</ul>\r\n\r\n<p>Audio TrackChromecast</p>\r\n\r\n<ul>\r\n	<li>Otomatik</li>\r\n	<li>658kbps</li>\r\n	<li>883kbps</li>\r\n</ul>\r\n\r\n<p>Tam Ekran</p>\r\n\r\n<p>This is a modal window.</p>\r\n\r\n<p>Caption Settings Dialog</p>\r\n\r\n<p>Beginning of dialog window. Escape will cancel and close the window.</p>\r\n\r\n<p>TextColorWhiteBlackRedGreenBlueYellowMagentaCyanTransparencyOpaqueSemi-Transparent</p>\r\n\r\n<p>BackgroundColorBlackWhiteRedGreenBlueYellowMagentaCyanTransparencyOpaqueSemi-TransparentTransparent</p>\r\n\r\n<p>WindowColorBlackWhiteRedGreenBlueYellowMagentaCyanTransparencyTransparentSemi-TransparentOpaque</p>\r\n\r\n<p>Font Size50%75%100%125%150%175%200%300%400%</p>\r\n\r\n<p>Text Edge StyleNoneRaisedDepressedUniformDropshadow</p>\r\n\r\n<p>Font FamilyProportional Sans-SerifMonospace Sans-SerifProportional SerifMonospace SerifCasualScriptSmall Caps</p>\r\n\r\n<p>DefaultsDone</p>\r\n\r\n<p><strong>&nbsp;</strong></p>', '2017-08-01 11:51:51', '2017-08-01 11:51:51', 1, 1, '2017-08-01 11:51:51', NULL, NULL, 'Ertuğrul Özkök', 1, 1, 0, 'published'),
(2, 'Zekat İle Arınma', 'zekat-ile-arinma', '<p><em><strong>Tevbe Suresi 103. Ayet: “(Ey Peygamber) Onların mallarından bir bölümünü sadaka olarak al ve bu yolla onları temizle, günahlardan arındır. Onlara dua et, çünkü senin duan onlara gönül huzuru sağlar. Allah her şeyi işitendir, bilendir.”</strong></em></p>', '<p>Üzerinde duracağımız ayeti kerimenin nüzul sebebi şöyle cereyan etmiştir. Abdullah b. Abbas’tan rivayet edildiğine göre cihaddan geri kalan Ebu Lubabe ve arkadaşları cihaddan geri kaldıkları için pişman olmuşlar ve kendilerini mescidi Nebevi’nin direklerine bağlayarak Allah tarafından mağfiret edilene kadar kendilerini çözmeyeceklerine yemin etmişlerdi. Allah-u Teâlâ tevbelerini kabul etmiş, onlar da kendilerini bağladıkları direklerden çözerek mallarını Rasulullah’a getirmişler ve: “Ey Allah’ın Rasulu! İşte mallarımız, bizden al, sadaka olarak dağıt ve bizim için af dile” demişlerdi. Rasulullah da: “Ben sizin mallarınızdan bir şey almakla emrolunmadım” buyurmuştur. Bunun üzerine bu ayeti kerime nazil olmuş, Allah Rasulü de onların mallarından bir kısmını alıp dağıtmıştır.1</p>\r\n\r\n<p>“(Ey Peygamber) Onların mallarından bir bölümünü sadaka olarak al ve bu yolla onları temizle, günahlardan arındır.”</p>\r\n\r\n<p>Nüzul sebebinden de anlaşılacağı üzere ayet, Tebuk Seferi’nde cihaddan geri kalan, hatalarını anlayıp Allah’tan mağfiret dileyen, kaçırdıkları amelin bedelini de malları ile ödemek ve kendilerini temizlemek isteyen sahabiler hakkında inmiştir. Allah Celle Celaluhu kullarını temizlemek istiyor. Tıpkı manevi bir temizlik hükmünde olan namazlar ile bizi temizlediği gibi hatalarımızı da işlediğimiz hayırlar ve salih ameller ile temizlemek istiyor. Zira bu ayetin tefsiri ile ilgili bir hadiste Rasulullah Sallallahu Aleyhi ve Sellem; “Bir gece rüyamda bana iki melek geldi. Beni alıp altın ve gümüş kerpiçlerden yapılmış şehre götürdüler. Bizi bedenlerinin bir yarısı gözle göreceğin en güzel şekilde olan, diğer yarısı ise gözle göreceğin en çirkin şekilde olan adamlar karşıladı. O iki melek adamlara dediler ki: ‘Gidin kendinizi şu nehre atın.’ Onlar da kendilerini nehre attılar. Dönüp bize geldiklerinde onlarda olan o kötü durum gitmişti. O iki kişi bana dedi ki: ‘İşte bu Adn Cenneti’dir. Şu da senin makamındır.’ Yine dediler ki: “Yarıları güzel, diğer yarıları çirkin olanlara gelince onlar, salih amellerine kötü ameller katan kimselerdir. Allah onların kusurlarını affetti.”2</p>\r\n\r\n<p>Bu ayeti kerime; amellerine salih olmayan amelleri karıştıran ya da Allah’ın emirlerini ve Rasulü’nün yolunu terketmek sureti ile nefislerine zulmeden kimselerin zekât ile temizleneceğinin ifadesidir. “Ey Allah’ın Rasulu! İşte mallarımız, bizden al, sadaka olarak dağıt ve bizim için af dile” diyen sahabiler temizlenmeyi arzu ediyordu. Henüz bu emir inmeden sahabinin ‘al ve bizi temizle’ ifadesi, âdeta onlar sebebiyle ‘cihadda geçirmemiz gereken vaktimizi, mal kazanarak geçirdik. Zira ancak kazandığımızın daha fazlasını vererek temizlenebiliriz’ demekti.</p>\r\n\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 15px !important; margin-left: 0px; padding: 0px; outline: 0px;"><img alt="" src="http://www.furkanhaber.net/images/zekat-1.jpg" style="margin: 0px; padding: 0px; height: 420px; max-width: 100%; vertical-align: middle; border: 0px; outline: 0px; width: 630px;"></p>\r\n\r\n<p>Allah’ın insana vermiş olduğu şefkat duygusu zengini paylaşmaya sevkeder. Böylece toplumda zengin ile fakir arasında merhamete, şefkate dayalı bir bağ kurulur ve böylece toplumda kardeşlik tesis edilmiş olur. İslam toplumunda Müslüman bireyler kendileri kazanıp ihtiyaç sahiplerine dağıtmak, kendileri yorulup başkalarına pay etmek gibi yüce bir ahlâkî değere ulaşmak ile beraber nefislerinin mal biriktirme arzusu, cimrilik, dünya sevgisi gibi süfli duygulardan da kurtulmaya adım atarlar.</p>\r\n\r\n<p>İslam dini birileri ihtiyaç içerisinde iken müslümanların rahat uyumalarını, tasasız gün geçirmelerini hoş karşılamaz. Toplumdaki bireylerin dertleri ile dertlenmelerini ister. Bu, Allah Rasulü Sallallahu Aleyhi ve Sellem’in, “Malda zekâttan başka haklar da vardır” buyururken ifade ettiği hakikattir. İslam, insanlardan kimileri aslî ihtiyaçlarını karşılayamazken, kimilerinin rahatça yaşamak sureti ile toplumsal huzuru bozmasına müsaade etmez.</p>\r\n\r\n<p>Öte yandan İslam malın sadece toplumda zenginler arasında dolaşan bir metâ olmasından da hoşlanmaz. Mal toplumda sadece zenginler arasında dolaşır olunca toplumsal huzur bozulur. Zekâtla birlikte malın yeniden bütün toplum içindeki dağılımında denge yakalanır. Zekât veren kimse bütün bu faydaları sağlamakta, vermeyen ise toplumda dengeye zarar vermektedir. Rasulullah bu sebeple; “Herhangi bir beldede biri aç olarak sabahlıyorsa, Allah’ın onlar üzerindeki himayesi kalkar”3 buyurmuştur. Böylece zekât veren sadece nefsini arındırıp temizlemez aynı zamanda toplumunu da temizler.</p>\r\n\r\n<p>Ayet “Dağıtılabilecek olan malın kapsamı nedir?” sorusunu akla getirmektedir. Mal ile ilgili Ebu Ömer der ki: “Arap dilinde bilinen ve anlaşılan o ki; ticari bir meta olarak ödenilen ve mülkiyete geçirilen her şeye ‘mal’ denir.” Çünkü Rasulullah şöyle buyurmuştur: “Âdemoğlu malım, malım, malım der. Hâlbuki malından ona ait olan şey, yiyip tükettiği ya da giyinip eksilttiği ve yahut sadaka ile ulaşan şeyden başkası değildir.”4</p>\r\n\r\n<p>“Sadaka olarak almak” ifadesi ise âlimlerin ekserisi tarafından zekât olarak anlaşılmıştır. “Mallarından bir bölümünü sadaka (zekât) olarak al ve bu yolla onları temizle” ifadesindeki temizleme fiilinin ancak zekât ile gerçekleşeceğini anlıyoruz.</p>\r\n\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 15px !important; margin-left: 0px; padding: 0px; outline: 0px;"><img alt="" src="http://www.furkanhaber.net/images/zekat-2.Jpeg" style="margin: 0px; padding: 0px; height: 335px; max-width: 100%; vertical-align: middle; border: 0px; outline: 0px; width: 604px;"></p>\r\n\r\n<p>Kulun kalbi, aklı, ameli, malı, itikadı saf ve tertemiz bir vaziyette Allah’a ulaşmalıdır. Malımız da kalbimiz de tertemiz olmalıdır. Bunun da yolu ancak ondan vermektir. Hassas bir şekilde hem malımızı temizlemek ve hem de temizlerden olmak niyeti ile malımızın zekâtını vermeliyiz.</p>\r\n\r\n<p>“Onlara dua et, çünkü senin duan onlara gönül huzuru sağlar.”</p>\r\n\r\n<p>Rasulullah zekâtını verenler için dua etmiştir. Abdullah b. Ebi Evfa şöyle rivayet etmiştir: “Rasulullah Sallallahu Aleyhi ve Sellem’e bir kavim sadaka getirdiğinde; ‘Allah’ım onlara salât (rahmetinle muamele) eyle’ derdi. İbn Ebi Evfa da getirince Rasulullah: ‘Allah’ım Ebu Evfa’nın ailesine salât getir’ dedi.”5</p>\r\n\r\n<p>Allah Celle Celaluhu Rasulüne, malını temizlemek üzere verenler için dua etmesini tavsiye etmiştir. Bu dua Rasulullah’ın duasıdır ve meyvesi ise kalp huzurudur. Bu dualar bizim bilmediğimiz birçok cihetten kalpleri kuşatır, sıkıntıların arttığı ve ‘kimsesiz kaldığım şu anda elimden tutacak kimse yok mu?’ diye serzenildiğinde bir rahmet nağmesi olarak kalbe sekînet indirir. Allah’ın iman edenleri desteklemesi, onları yalnız ve yardımsız bırakmaması işte budur.</p>\r\n\r\n<p>Bu ümmet için birer manevî kale hükmündeki hareket liderlerinin, çile ehli davetçilerin, feda etme şuuruna ermiş fedailerin ve ‘ümmetim’ diye serzenen her bir mü’min ve mü’minenin ümmetin arınması ve kurtuluşu için dua etmesi gerekmektedir. Ayeti kerimedeki ifadeler Rasulullah’a hitap etmek ile beraber bu duaları ümmetin her bir ferdinin yapması gerektiğini bilmekteyiz. Kardeşin kardeşe yaptığı dua, fertlerin ümmete yaptığı dua, yerini dahi bilmediği, uzak coğrafyalardaki mü’minler için yapılan dua inşallah muhataplarına birer sekînet vesilesi olacak ve onların kalplerini itmi’nana ulaştıracaktır. Bizzat amelin üzerinde iken yani Rasulullah’ın yaptığı gibi zekâtını vermekte iken veya bunun için ayrılan özel bir vakitte kalbin müsait olduğu zamanlarda dua etmenin faydaları elbette çok olacaktır.</p>\r\n\r\n<p>Ayet-i kerimede zekâtın temizleyiciliğinden bahsedildi, Rasulullah’ın duasının kalbe sekînet indirdiği ifade edildi ve sonunda ise “Allah her şeyi işiten ve bilendir” buyruldu. Böylece bütün amellere Rabbu’l Alemin’in vâkıf olduğu, verilen zekâttaki ihlâsa, cihaddan geri duranın pişmanlığına ve temizlenme arzusuna, Peygamberimizin duasına ve de nifak ile kalbi dolup taşan ve malından zekât vermeyenin durumuna değinildi.</p>\r\n\r\n<p>Rabbimiz bizi bu temizlenme ayında zekâtını hakkıyla verip temizlenenlerden eylesin. (Âmin)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 15px !important; margin-left: 0px; padding: 0px; outline: 0px;">&nbsp;</p>\r\n\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 15px !important; margin-left: 0px; padding: 0px; outline: 0px;"><span style="margin: 0px; padding: 0px; outline: 0px; border: 0px; font-size: 9px;">1. Taberi Tefsiri; Hisar Yayınevi 356-357</span></p>\r\n\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 15px !important; margin-left: 0px; padding: 0px; outline: 0px;"><span style="margin: 0px; padding: 0px; outline: 0px; border: 0px; font-size: 9px;">2. Buhari; Kitabuttefsir, Berae 1</span></p>\r\n\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 15px !important; margin-left: 0px; padding: 0px; outline: 0px;"><span style="margin: 0px; padding: 0px; outline: 0px; border: 0px; font-size: 9px;">3. Ahmet b. Hambel; Müsned 4880</span></p>\r\n\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 15px !important; margin-left: 0px; padding: 0px; outline: 0px;"><span style="margin: 0px; padding: 0px; outline: 0px; border: 0px; font-size: 9px;">4. Müslim, Zühd 4) (Kurtubi Tefsiri Buruc Yayınları 8. Cilt s 382-383</span></p>\r\n\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 15px !important; margin-left: 0px; padding: 0px; outline: 0px;"><span style="margin: 0px; padding: 0px; outline: 0px; border: 0px; font-size: 9px;">5. Buhari, Zekat 64; Müslim, Zekat 176; Ebu Davut, Zekat 7</span></p>', '2017-08-01 12:14:32', '2017-08-01 12:14:32', 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 'published'),
(4, '28 DEFA AYNI GÖRÜNTÜ', '28-defa-ayni-goruntu', NULL, '<p>NTV Spor&rsquo;da Ercan Taner ile Mert Aydın, Şenol G&uuml;neş&rsquo;in Milli Takım&rsquo;a gidip gitmeme meselesini konuşuyorlar. &Ouml;ncesinde Taner, spor yazarlarından da g&ouml;r&uuml;ş alıyor. B&uuml;t&uuml;n bunlar olurken bir g&ouml;r&uuml;nt&uuml; akıyor. Bir s&uuml;re sonra konuşmaları kenara bırakıp, sadece g&ouml;r&uuml;nt&uuml;y&uuml; izlediğimi fark ediyorum. Şenol G&uuml;neş, Beşiktaş Başkanı Fikret Orman&rsquo;la ve sevgili Candaş Tolga Işık&rsquo;la selamlaşıp bir şeyler konuşup sonrasında antrenmana d&ouml;n&uuml;yor. &Ouml;ncesinde bir futbolcunun omzunu sıvazlıyor. O anı g&ouml;rd&uuml;ğ&uuml;mde; &lsquo;Tekrar başkanla konuştuğu g&ouml;r&uuml;nt&uuml; gelecek&rsquo; diyerek o anı ezberlediğimi fark ediyorum.</p>\r\n\r\n<p><img alt="" src="http://i.milliyet.com.tr/GazeteHaberIciResim/2017/08/01/fft16_mf9598903.Jpeg" style="float:right; margin-right:5px; margin-top:5px" />B&ouml;l&uuml;m yaklaşık 15.34&rsquo;te başladı, 15.55&rsquo;te sona erdi. Sadece araya TFF Başkanı Yıldırım Demir&ouml;ren&rsquo;in g&ouml;r&uuml;nt&uuml;s&uuml; girdi. Onun dışında 20 dakikaya yakın, Şenol G&uuml;neş&rsquo;in aynı antrenman bantı d&ouml;nd&uuml; durdu. Yaklaşık her 40 saniyede bir, &nbsp;28 defa, Şenol Hoca, Fikret Orman ve Tolga&rsquo;nın hal ve hatırını sordu. Fonda konuşmalar ve ekranda bu sahneler. Başka bant yok muydu yayınlayacak? Ya da hi&ccedil; yayınlanmasa daha iyi olmaz mıydı?</p>\r\n\r\n<p><strong>ERHAN &Ccedil;ELİK&rsquo;TEN ŞAŞIRTAN İSİM (!)</strong></p>\r\n\r\n<p>&ldquo;Milli Takım&rsquo;ın başına kim ge&ccedil;ecek?&rdquo; Bu soruyu TRT 1 Ana Haber B&uuml;lteni&rsquo;nde Erhan &Ccedil;elik, Ersin D&uuml;zen&rsquo;e sordu.&nbsp;</p>\r\n\r\n<p>D&uuml;zen, &uuml;&ccedil; isim s&ouml;yledi; &ldquo;Lucescu, Mustafa Denizli ve Abdullah Avcı.&nbsp;<br />\r\nErhan &Ccedil;elik: &ldquo;Peki Ersin, &ccedil;ok s&uuml;rpriz bir ismi sana soracağım, Rıdvan Dilmen?&rdquo; Bir sessizlik oldu. D&uuml;zen: &ldquo;Kesinlikle hayır&rdquo; dedi. &Ccedil;elik ısrarcıydı ve kaynağına g&uuml;veniyordu: &ldquo;Konuşulan isimlerden biri buydu&rdquo; diye ısrar etti ama &ldquo;Senin nokta atışı yorumlarına g&uuml;veniyoruz&rdquo; diyerek orta yolu buldu. Bizim bildiğimiz Dilmen, TFF başkanlığını istiyordu!</p>\r\n\r\n<p><strong>KAVGA PROGRAMIMIZ HAYIRLI OLSUN</strong></p>\r\n\r\n<p>Aile i&ccedil;i sorunları &ccedil;&ouml;zme programı başladı FOX&rsquo;ta, &lsquo;Ne Seninle Ne Sensiz&rsquo;. S&ouml;ylemiştim kavgayla &lsquo;reyting&rsquo; &ouml;ne &ccedil;ıkar diye. İlerleyen zamanlarda st&uuml;dyoda gelin-kaynana birbirine girdi diye g&ouml;r&uuml;nt&uuml;ler s&uuml;rpriz olmaz. Havva, kayınvalidesi Canan Hanım i&ccedil;in: &ldquo;Benim evimin kapısının eşiğinden i&ccedil;eri adım atamaz&rdquo; diye bağırıyordu. Serkan arada kalmıştı. Havva&rsquo;nın eski kayınvalidesi de devreye giriyordu: &ldquo;S&uuml;per gelindi, o benim kızım.&rdquo; Bir de torun vardı. Eski d&uuml;n&uuml;rler de salvo atışındalar. Serkan&rsquo;ın eski kayınvalidesi: &ldquo;Canan, (d&uuml;n&uuml;re) sen &ccedil;ocuğu istediğinde ben sana getirmedim mi?&rdquo; diye st&uuml;dyoyu inletiyordu telefonda. &ldquo;Buzlar eriyecek mi?&rdquo; final sorusu... Her tarafı erise ne olur? &nbsp; &nbsp;<br />\r\n&nbsp;</p>', '2017-08-02 08:45:41', '2017-08-02 08:45:41', 1, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 'draft'),
(5, 'HACKER’LAR BİZİM KANALLARLA UĞRAŞMAZ...', 'HACKERLAR-BİZİM-KANALLARLA-UĞRAŞMAZ', NULL, '<p>Bilinen adıyla HBO tam a&ccedil;ılımını yazacak olursak Home Box Office, ABD&rsquo;nin en bilinen televizyon platformudur.</p>\r\n\r\n<p>HBO, &lsquo;Game of Thrones&rsquo; gibi t&uuml;m d&uuml;nyada fırtınalar estiren ya da &lsquo;The Pacific&rsquo; gibi ABD&rsquo;de &ccedil;ok y&uuml;ksek izlenme ve beğenme oranlarına ulaşan diziler yapar. Bu dev platform hafta sonu bilgisayar korsanlarının saldırısına uğradı ve yaklaşık 1.5 terabayt b&uuml;y&uuml;kl&uuml;ğ&uuml;nde veriyi &ccedil;aldırdı.</p>\r\n\r\n<p><img alt="" src="http://i.milliyet.com.tr/GazeteHaberIciResim/2017/08/01/fft16_mf9598918.Jpeg" /></p>\r\n\r\n<p>&Ccedil;alınan veriler arasında, iyi dizilerin hen&uuml;z ekrana gelmemiş b&ouml;l&uuml;mleri de var. Hangi dizilerden, ka&ccedil; b&ouml;l&uuml;m gittiği bilinmiyor ama korsanlar şu ana kadar, &lsquo;Ballers ve Room 104&rsquo; dizilerinden birer b&ouml;l&uuml;m&uuml; internete verdiler bile.</p>\r\n\r\n<p>Bizim memlekette b&ouml;yle bir şey olmaz, olsa da kanallara b&ouml;yle zararlar verilemez.</p>\r\n\r\n<p>Niye diyeceksiniz, sebebi basit:</p>\r\n\r\n<p>Bizim memlekette sinema filmi uzunluğundaki dizilerin yayınlanmamış b&ouml;l&uuml;mleri daha &ccedil;ekilmemiştir de ondan. Aklınıza gelebilecek b&uuml;t&uuml;n iyi diziler, yeni b&ouml;l&uuml;mlerini genellikle yayın g&uuml;n&uuml; kanala teslim ederler.</p>\r\n\r\n<p>En iyi ihtimalle de yayın g&uuml;n&uuml;nden bir g&uuml;n &ouml;nce gelir yeni b&ouml;l&uuml;m kanala.</p>\r\n\r\n<p>O y&uuml;zden bizim kanallar, bilgisayar korsanlarının saldırısına uğrasa da en fazla arşiv kaybeder.</p>\r\n\r\n<p><strong>Birinci sıra merakı</strong></p>\r\n\r\n<p><img alt="" src="http://i.milliyet.com.tr/GazeteHaberIciResim/2017/08/01/fft16_mf9598920.Jpeg" style="float:right; margin-right:5px; margin-top:5px" /></p>\r\n\r\n<p>Kavala&rsquo;nın tatil beldesi il&ccedil;elerinden birisinde, T&uuml;rk turistler arasında denize en yakın şezlong i&ccedil;in kavga &ccedil;ıkmış. Arkadaşım g&uuml;lerek anlattı, sonu&ccedil;ta kavgacı iki ailenin de tadı ka&ccedil;mış, plajı terk etmek zorunda kalmışlar.</p>\r\n\r\n<p>En &ouml;ne, en yakına oturmak gibi bir dert var maalesef bizim &uuml;lkemizde. Okul g&ouml;sterilerinden tutun da halk konserlerine kadar bir s&uuml;r&uuml; yerde g&ouml;r&uuml;r&uuml;z bu hastalığı.</p>\r\n\r\n<p>Bir de kendisine ayrılan yer birinci sırada olmayınca k&uuml;s&uuml;p, t&ouml;reni ya da konseri terk edenler vardır. Birka&ccedil; yıl &ouml;nce Tekirdağ&rsquo;da d&uuml;zenlenen Kiraz Festivali&rsquo;ni terk etmişti bir oyuncu. Sadece halk ya da oyuncular değil, bu sene Ordu&rsquo;da yaşanan &ouml;rnek gibi b&uuml;rokraside de var bu hastalık.</p>\r\n\r\n<p>D&uuml;ş&uuml;n&uuml;n, İl Emniyet M&uuml;d&uuml;r&uuml;, protokolde birinci sıradaki bir koltukta oturmak i&ccedil;in etkinlikten saatler &ouml;ncesinde korumalarını koltuk başına dikiyor, bir milletvekilinin yerine oturduğu i&ccedil;in kendisini uyaran Ordu B&uuml;y&uuml;kşehir Belediye Başkanı Enver Yılmaz&rsquo;la tartışıyor, ortam geriliyor. Başkan&rsquo;ın etrafı garip bir şekilde g&uuml;venlik g&uuml;&ccedil;lerince sarılıyor. Ne i&ccedil;in, ikinci sıradaki kendi yerine değil, en &ouml;n sırada oturmak i&ccedil;in yaşanıyor t&uuml;m bunlar. En &ouml;n sıraya oturduğu zaman daha değerli olacağını d&uuml;ş&uuml;nmek yerine, ben nereye oturursam orası değerlidir diye d&uuml;ş&uuml;nebilsek hi&ccedil; sorun yaşanmayacak aslında...</p>\r\n\r\n<p><strong>Denize sıfır havuzlu villa</strong></p>\r\n\r\n<p><img alt="" src="http://i.milliyet.com.tr/GazeteHaberIciResim/2017/08/01/fft16_mf9598924.Jpeg" style="float:right; margin-right:5px; margin-top:5px" /></p>\r\n\r\n<p>Denize sıfır, &ouml;zel plajı olan, turistik tesislerde dev havuz ya da havuzlar olması işin doğası gereği. Ancak denize sıfır ya da deniz kenarı yerlerde patlayan m&uuml;stakil havuzlu villa merakını &ccedil;&ouml;zemedim doğrusu. Deniz sağlığa faydalı, havuz sağlık i&ccedil;in riskler taşıyor. Başta &Ccedil;eşme olmak &uuml;zere bir s&uuml;r&uuml; turistik yerde, su sıkıntısı &ccedil;ekiliyor ve suyun b&uuml;y&uuml;k kısmı havuzlara gidiyor. Elbette zevkler tartışılmaz ama havuz daha &ccedil;ok denizin olmadığı ya da denize &ccedil;ok uzak yerlerde bir ihtiyacı gidermek i&ccedil;in kullanılır. Bakıyorum, bir s&uuml;r&uuml; villa sadece &ouml;zel havuzu olduğu i&ccedil;in milyon dolarlara satılıyor. Bir ara İngilizler&rsquo;in ikinci &uuml;lkesi konumuna gelen İspanya dağı taşı yazlıklarla doldurup, yeşilliği yok edince olduk&ccedil;a ağır bir bedel &ouml;demiş, emlak fiyatları dibe vurmuştu.</p>\r\n\r\n<p>Şimdi benzer bir riskle biz karşı karşıyayız.</p>\r\n\r\n<p>Kıyı şeridimizi ne kadar &ccedil;ok havuzlu ya da havuzsuz yazlıkla doldurursak, &ouml;deyeceğimiz bedel o kadar &ccedil;ok artacak.</p>\r\n\r\n<p><strong>&ldquo;O KADIN...&rdquo; &nbsp;</strong></p>\r\n\r\n<p>Bravo sana H&uuml;rriyet&rsquo;in Kelebek eki.</p>\r\n\r\n<p>Karısını aldatan bir adamın haberini yaparken &ldquo;O kadının kimliği belli oldu&rdquo; diye yazmışlar resmin &uuml;zerine.</p>\r\n\r\n<p>Bir s&uuml;r&uuml; insan &ldquo;O kadın&rdquo; diye tanımlayabilir ama bir gazete bir kadını nasıl bu kadar kimliksiz ve basma kalıp bir bakışla değerlendirebilir.</p>\r\n\r\n<p>Evli bir adam karısını aldatıyorsa, o kadın yoktur aldatan bir &nbsp;adam vardır.</p>\r\n\r\n<p><img alt="" src="http://i.milliyet.com.tr/GazeteHaberIciResim/2017/08/01/fft16_mf9598925.Jpeg" style="float:right; margin-right:5px; margin-top:5px" /></p>\r\n\r\n<p><strong>Radyo edebiyatı</strong></p>\r\n\r\n<p>Sanılanın aksine radyocular sadece konuşmuyor, yazıyorlar da... Nihat Sırdar&rsquo;ın yazdığı &lsquo;35&rsquo;i Beklerken&rsquo;, ge&ccedil;tiğimiz senenin sonuna doğru piyasaya &ccedil;ıktı, &uuml;st &uuml;ste yeni baskılar yaptı. Bu haziranda da Zeki Kayhan Coşkun&rsquo;un son kitabı, &lsquo;Kime &Ccedil;ektim Ben Bilmem Ki&rsquo; raflardaki yerini aldı. Zeki&rsquo;nin daha &ouml;nceki kitaplarında &ccedil;ok eğlenmiştim, bu kez Zeki&rsquo;yle birlikte &ccedil;ocukluk yıllarına, eski İstanbul&rsquo;a dair bir yolculuğa &ccedil;ıktım. Hayatın yoran koşuşturmasında, soluklanmak adına g&uuml;zel bir se&ccedil;enek, &lsquo;Kime &Ccedil;ektim Ben Bilmem Ki&rsquo;</p>\r\n\r\n<p><strong>Azap</strong></p>\r\n\r\n<p><img alt="" src="http://i.milliyet.com.tr/GazeteHaberIciResim/2017/08/01/fft16_mf9598933.Jpeg" style="float:right; margin-right:5px; margin-top:5px" /></p>\r\n\r\n<p>Pazartesi g&uuml;n&uuml; motorlu taşıtlar vergisinin ikinci taksiti, bir &ouml;nceki yapılandırmanın &uuml;&ccedil;&uuml;nc&uuml; taksiti ve son yapılandırmanın ilk taksitinin son &ouml;deme g&uuml;n&uuml;yd&uuml;. İnsanlar, İnternet Vergi Dairesi&rsquo;ne girebilmek i&ccedil;in b&uuml;y&uuml;k &ccedil;aba harcadı.</p>\r\n\r\n<p>Siteye girmek yetmedi, zira sistem tahminen yoğunluktan dolayı kredi kartlarını tanımadı, banka hesaplarından tahsilat yapamadı. Tamam &ouml;demeleri son g&uuml;ne bırakmak hata da, yoğunluk oluşturacak &uuml;&ccedil; &ouml;demenin son g&uuml;n&uuml; aynı olunca, o sistemi &ccedil;alışır tutmak da gerekiyor. Para &ouml;demek i&ccedil;in insanlara azap &ccedil;ektirmenin bir anlamı yok ki...</p>', '2017-08-02 08:54:46', '2017-08-02 08:54:46', 1, NULL, '2017-08-02 08:54:46', NULL, NULL, NULL, 0, 0, 0, 'published'),
(7, 'Bir acının, utancın, ihanetin ve bir şahlanışın yıldönümü!', 'bir-acinin-utancin-ihanetin-ve-bir-sahlanisin-yildonumu', NULL, '<p>15 Temmuz geride kaldı. 15 g&uuml;n ge&ccedil;ti. Bug&uuml;n bu konuyu tekrar hatırlatmak istedim.. Unutmayın.. Affetseniz bile unutmayın. Unutursanız tarih affetmez, bir defa daha hatırlatır.</p>\r\n\r\n<p>Ben bug&uuml;n, o olayın &uuml;zerinden bir yıl, yıld&ouml;n&uuml;m&uuml;n&uuml;n &uuml;zerinden 15 g&uuml;n ge&ccedil;se de, sanki o g&uuml;n gibi konuyu bir defa daha hatırlatmak istiyorum.</p>\r\n\r\n<p>Tam bir yıl &ouml;nce bug&uuml;nler ihanete uğramıştık. Hainler zaten bir s&uuml;redir işbaşındaydılar ve o gece son darbeyi indirmeyi d&uuml;ş&uuml;n&uuml;yorlardı. Gece yarısından sonra harekete ge&ccedil;eceklerdi. Herkes uyurken devleti ele ge&ccedil;ireceklerdi.</p>\r\n\r\n<p>Hedefte sadece T&uuml;rkiye yoktu. Siyasi emellerini m&uuml;stevlilerin siyasi emelleri, menfaatlerini uluslararası sistemle tevhid etmiş bir grub, din adına &ccedil;ıktıkları yolun sonunda İslam &uuml;mmetini kapitalizmin, Siyonizm&rsquo;in, emperyalizmin eline teslim edeceklerdi.</p>\r\n\r\n<p>Senaryonun arkasında, şimdi himaye ettikleri hainleri iade etmemek i&ccedil;in delil isteyenler vardı. ABD, İngiltere, İsrail ve Vatikan vardı, Almanya vardı. NATO vardı.</p>\r\n\r\n<p>Darbe erkene alındı, halk sokağa &ccedil;ıktı ve başarısız oldular. Şimdi, lider takımı o gece ka&ccedil;sa da, geride kalan on binlerce kişi sanık sandalyesinde hesab vereceği g&uuml;n&uuml; bekliyor.</p>\r\n\r\n<p>Darbe gecesi K&ouml;yceğiz&rsquo;deyim. &ldquo;FET&Ouml; ve darbeler&rdquo; konusunda bir konuşma yapıyordum. İlk haber 20.30-21.00 gibi konuşma sırasında geldi. Konuşmamı kestim. Kalacağım yere geldiğimde 21.30 gibi idi. &Ouml;nce Beştepe&rsquo;ye ulaşmaya &ccedil;alıştım, Hasan Doğan&rsquo;ı aradım, ama ulaşamadım. Beştepe santral ise &ldquo;size d&ouml;neceğiz&rdquo; diyorlardı ama d&ouml;nen olmuyordu.</p>\r\n\r\n<p>Hamza T&uuml;rkmen aradı, Bizim Teknovia&rsquo;nın sunucusu Muhammed Binici ile g&ouml;r&uuml;şt&uuml;m, o k&ouml;pr&uuml;deydi. Yusuf Kara&rsquo;yı aradım o Ankara&rsquo;da Genelkurmay&rsquo;ın oralardaydı. Yasin Aktay&rsquo;ı aradım Meclisteydi. Darbe vardı, ama ne yapacağımdan emin değildim. Yanlış bir şey yapmaktan endişe ediyordum. Durum ne, ne yapabilirdim. Emniyet Genel M&uuml;d&uuml;r Yardımcısı Mustafa G&uuml;lc&uuml;&rsquo;y&uuml; aradım. Halkı sokağa &ccedil;ağırabilir misin, halk devletine sahip &ccedil;ıksın yoksa durum k&ouml;t&uuml;ye gidiyor dedi. Tekrar Beştepe&rsquo;yi aradım. &ldquo;Geri d&ouml;nm&uuml;yorsunuz. Ben halkı sokağa &ccedil;ağırıyorum, başka bir eylem s&ouml;zkonusu ise siz beni ararsınız artık, yoksa ben bildiğim gibi yapıyorum&rdquo; dedim. &Ouml;ncesinde SMS ve Whatsap&rsquo;dan, telefonla g&ouml;r&uuml;ş&uuml;rken 23.00 gibi Twitter&rsquo;den sokağa &ccedil;ıkma &ccedil;ağrısı yapan mesajlar g&ouml;ndermeye &ccedil;alıştım. Benden &ouml;nce Hamza T&uuml;rkmen &ccedil;ağrı yapmıştı, Fatih Tezcan &ccedil;ağrı yapmıştı. Zaten insanlar bu &ccedil;ağrılardan &ouml;nce de sokağa &ccedil;ıkmaya başlamışlardı. Ve ardından uykusuz geceler başladı.</p>\r\n\r\n<p>Ramazan sonuna kadar hep meydanlarda, salonlarda, sokaklardaydım. &Ouml;nce darbe karşıtı konuşmalar, ardından referandum s&uuml;reci ve Ramazan. Aradan bir yıl ge&ccedil;miş.</p>\r\n\r\n<p>12 Mart&rsquo;ta MNP davasında sanık olmuştum. 12 Eyl&uuml;l&rsquo;de Erbakan&rsquo;ın danışmanı idim ve Konya mitingini arkadaşlarla birlikte d&uuml;zenlemiştik. 28 Şubat&rsquo;ta Sincan&rsquo;daki Kud&uuml;s gecesinde konuşma yapacaktım. 15 Temmuz&rsquo;da ise tam da Marmaris ve Dalaman arasında her ikisine de 20&rsquo;şer KM uzaklıktaki bir noktada FET&Ouml; ve Darbeler konusunda konuşuyordum. İstanbul&rsquo;da da &Ccedil;engelk&ouml;y&rsquo;de oturuyordum ve darbe ile ilgili ilk hareketin başladığı Kuleli Askeri Lisesi evimin yakınındaydı.</p>\r\n\r\n<p>Dilerim 15 Temmuz sıradan bir &ouml;vg&uuml; ve s&ouml;vg&uuml; g&uuml;n&uuml;ne d&ouml;n&uuml;şt&uuml;r&uuml;lmez. 15 Temmuz bir mitolojik hikaye haline getirilmez. Ya da t&ouml;renlere boğularak, &ouml;z&uuml;n&uuml; ve ruhunu kaybetmez.</p>\r\n\r\n<p>Bunun belgeseli, filmi yapılmalı, romanı yazılmalı, tiyatrosu oynanmalı. 15 Temmuz unutulmamalı, ama daha &ouml;nemlisi, bu noktaya nasıl gelindi konusunda herkes biraz da kendini hesaba &ccedil;ekmeli. F. G&uuml;len ve FET&Ouml;&rsquo;y&uuml; &ldquo;g&uuml;nah ke&ccedil;isi&rdquo; haline getirmek ve b&uuml;t&uuml;n su&ccedil;u bunlara yıkıp bu işin i&ccedil;inden sıyrılmak yok. Herkesin bir &ouml;zeleştiri yapması gerek. Paralelin de paraleli var. Kibriti g&ouml;z&uuml;m&uuml;ze &ccedil;ok yaklaştırırsak, arkasında bir ormanı kaybedebiliriz. Dikkatli olmamız gerek.</p>\r\n\r\n<p>FET&Ouml; davalarının takip&ccedil;isi olmamız gerek. M&uuml;şteki olmamız, m&uuml;dahil olmamız gerek. A&ccedil;ılan davalara katılım yeterli değil.</p>\r\n\r\n<p>İbadetin &ccedil;ok olanı değil, s&uuml;rekli olanı makbuld&uuml;r. Tamam, yılda bir 15 Temmuz&rsquo;u analım, sonra unutalım. Bu b&ouml;yle olmaz. Bu işten zarar g&ouml;ren herkes kişisel olarak hukuk davası a&ccedil;abilir. Su&ccedil; duyurusunda bulunabilir, a&ccedil;ılan davalara m&uuml;dahil olarak katılabilir. Basının ve STK&rsquo;ların bu konunun takip&ccedil;isi olması gerekiyor. STK&rsquo;lar ve bu STK&rsquo;ların avukatlarının d&uuml;zenli olarak bir araya gelip, davaların seyrini m&uuml;zakere etmeleri gerek.</p>\r\n\r\n<p>İddianamelerin tek tek incelenip, kendilerini ilgilendiren konularda m&uuml;dahillik talebinde de bulunabilirler, tanıklık da edebilirler, davacı da olabilirler. Ve d&uuml;zenli olarak basın, diğer STK&rsquo;ların ve vatandaşın bilgilendirilmesi gerek.</p>\r\n\r\n<p>Sosyal media &uuml;zerinden ve dışarıdaki tanıdıklarımız &uuml;zerinden davaların seyri ile ilgili olarak dış d&uuml;nyaya d&uuml;zenli bilgi aktarılması konusunda da herkesin &uuml;zerine d&uuml;şeni yapması gerek.</p>\r\n\r\n<p>Toplumdaki hassasiyetin daha bir s&uuml;re, en azından davalar devam ettiği s&uuml;rece ve kamudaki uzantılar ayıklanana kadar devam etmesi gerek.</p>\r\n\r\n<p>Esnaf bu maksatla vitrinlerini d&uuml;zenleyemez mi? Darbeye ve darbecilere karşı &ouml;fkenin canlı tutulması gerek. Bu işin arkasındaki &uuml;lkeler ve hedefindeki &uuml;lkelere konunun d&uuml;nyaya &ccedil;ok iyi anlatılması gerek. Onun i&ccedil;in &ccedil;ok dilli yayınlara ihtiya&ccedil; var..</p>\r\n\r\n<p>15 Temmuz&rsquo;u yaşayan herkes, bu uluslararası komployu efradına cami, ağyarına mani şekilde bilmiyor olabilir.. Bu darbe diğerlerinden daha farklı idi. Hani derler ya &ldquo;ol mahiler ki, derya i&ccedil;redirler de deryayı bilmezler&rdquo; Bazan insan i&ccedil;inde yaşadığı zamanın ger&ccedil;eklerini o g&uuml;n yeteri kadar anlayamayabilir. Bunu herkese anlatmamız gerekiyor..</p>\r\n\r\n<p>15 Temmuz&rsquo;un bu anlamda bir fırsat olduğunu d&uuml;ş&uuml;n&uuml;yorum. Sel&acirc;m ve dua ile..</p>', '2017-08-02 09:34:23', '2017-08-02 09:34:23', 1, NULL, '2017-08-02 09:34:23', NULL, NULL, NULL, 0, 0, 0, 'published'),
(8, 'HACKER’LAR BİZİM KANALLARLA UĞRAŞMAZ...2', 'hackerlar-bizim-kanallarla-ugrasmaz-2', NULL, '<p>Bilinen adıyla HBO tam a&ccedil;ılımını yazacak olursak Home Box Office, ABD&rsquo;nin en bilinen televizyon platformudur.</p>\r\n\r\n<p>HBO, &lsquo;Game of Thrones&rsquo; gibi t&uuml;m d&uuml;nyada fırtınalar estiren ya da &lsquo;The Pacific&rsquo; gibi ABD&rsquo;de &ccedil;ok y&uuml;ksek izlenme ve beğenme oranlarına ulaşan diziler yapar. Bu dev platform hafta sonu bilgisayar korsanlarının saldırısına uğradı ve yaklaşık 1.5 terabayt b&uuml;y&uuml;kl&uuml;ğ&uuml;nde veriyi &ccedil;aldırdı.</p>\r\n\r\n<p><img alt="" src="http://i.milliyet.com.tr/GazeteHaberIciResim/2017/08/01/fft16_mf9598918.Jpeg" /></p>\r\n\r\n<p>&Ccedil;alınan veriler arasında, iyi dizilerin hen&uuml;z ekrana gelmemiş b&ouml;l&uuml;mleri de var. Hangi dizilerden, ka&ccedil; b&ouml;l&uuml;m gittiği bilinmiyor ama korsanlar şu ana kadar, &lsquo;Ballers ve Room 104&rsquo; dizilerinden birer b&ouml;l&uuml;m&uuml; internete verdiler bile.</p>\r\n\r\n<p>Bizim memlekette b&ouml;yle bir şey olmaz, olsa da kanallara b&ouml;yle zararlar verilemez.</p>\r\n\r\n<p>Niye diyeceksiniz, sebebi basit:</p>\r\n\r\n<p>Bizim memlekette sinema filmi uzunluğundaki dizilerin yayınlanmamış b&ouml;l&uuml;mleri daha &ccedil;ekilmemiştir de ondan. Aklınıza gelebilecek b&uuml;t&uuml;n iyi diziler, yeni b&ouml;l&uuml;mlerini genellikle yayın g&uuml;n&uuml; kanala teslim ederler.</p>\r\n\r\n<p>En iyi ihtimalle de yayın g&uuml;n&uuml;nden bir g&uuml;n &ouml;nce gelir yeni b&ouml;l&uuml;m kanala.</p>\r\n\r\n<p>O y&uuml;zden bizim kanallar, bilgisayar korsanlarının saldırısına uğrasa da en fazla arşiv kaybeder.</p>\r\n\r\n<p><strong>Birinci sıra merakı</strong></p>\r\n\r\n<p><img alt="" src="http://i.milliyet.com.tr/GazeteHaberIciResim/2017/08/01/fft16_mf9598920.Jpeg" style="float:right; margin-right:5px; margin-top:5px" /></p>\r\n\r\n<p>Kavala&rsquo;nın tatil beldesi il&ccedil;elerinden birisinde, T&uuml;rk turistler arasında denize en yakın şezlong i&ccedil;in kavga &ccedil;ıkmış. Arkadaşım g&uuml;lerek anlattı, sonu&ccedil;ta kavgacı iki ailenin de tadı ka&ccedil;mış, plajı terk etmek zorunda kalmışlar.</p>\r\n\r\n<p>En &ouml;ne, en yakına oturmak gibi bir dert var maalesef bizim &uuml;lkemizde. Okul g&ouml;sterilerinden tutun da halk konserlerine kadar bir s&uuml;r&uuml; yerde g&ouml;r&uuml;r&uuml;z bu hastalığı.</p>\r\n\r\n<p>Bir de kendisine ayrılan yer birinci sırada olmayınca k&uuml;s&uuml;p, t&ouml;reni ya da konseri terk edenler vardır. Birka&ccedil; yıl &ouml;nce Tekirdağ&rsquo;da d&uuml;zenlenen Kiraz Festivali&rsquo;ni terk etmişti bir oyuncu. Sadece halk ya da oyuncular değil, bu sene Ordu&rsquo;da yaşanan &ouml;rnek gibi b&uuml;rokraside de var bu hastalık.</p>\r\n\r\n<p>D&uuml;ş&uuml;n&uuml;n, İl Emniyet M&uuml;d&uuml;r&uuml;, protokolde birinci sıradaki bir koltukta oturmak i&ccedil;in etkinlikten saatler &ouml;ncesinde korumalarını koltuk başına dikiyor, bir milletvekilinin yerine oturduğu i&ccedil;in kendisini uyaran Ordu B&uuml;y&uuml;kşehir Belediye Başkanı Enver Yılmaz&rsquo;la tartışıyor, ortam geriliyor. Başkan&rsquo;ın etrafı garip bir şekilde g&uuml;venlik g&uuml;&ccedil;lerince sarılıyor. Ne i&ccedil;in, ikinci sıradaki kendi yerine değil, en &ouml;n sırada oturmak i&ccedil;in yaşanıyor t&uuml;m bunlar. En &ouml;n sıraya oturduğu zaman daha değerli olacağını d&uuml;ş&uuml;nmek yerine, ben nereye oturursam orası değerlidir diye d&uuml;ş&uuml;nebilsek hi&ccedil; sorun yaşanmayacak aslında...</p>\r\n\r\n<p><strong>Denize sıfır havuzlu villa</strong></p>\r\n\r\n<p><img alt="" src="http://i.milliyet.com.tr/GazeteHaberIciResim/2017/08/01/fft16_mf9598924.Jpeg" style="float:right; margin-right:5px; margin-top:5px" /></p>\r\n\r\n<p>Denize sıfır, &ouml;zel plajı olan, turistik tesislerde dev havuz ya da havuzlar olması işin doğası gereği. Ancak denize sıfır ya da deniz kenarı yerlerde patlayan m&uuml;stakil havuzlu villa merakını &ccedil;&ouml;zemedim doğrusu. Deniz sağlığa faydalı, havuz sağlık i&ccedil;in riskler taşıyor. Başta &Ccedil;eşme olmak &uuml;zere bir s&uuml;r&uuml; turistik yerde, su sıkıntısı &ccedil;ekiliyor ve suyun b&uuml;y&uuml;k kısmı havuzlara gidiyor. Elbette zevkler tartışılmaz ama havuz daha &ccedil;ok denizin olmadığı ya da denize &ccedil;ok uzak yerlerde bir ihtiyacı gidermek i&ccedil;in kullanılır. Bakıyorum, bir s&uuml;r&uuml; villa sadece &ouml;zel havuzu olduğu i&ccedil;in milyon dolarlara satılıyor. Bir ara İngilizler&rsquo;in ikinci &uuml;lkesi konumuna gelen İspanya dağı taşı yazlıklarla doldurup, yeşilliği yok edince olduk&ccedil;a ağır bir bedel &ouml;demiş, emlak fiyatları dibe vurmuştu.</p>\r\n\r\n<p>Şimdi benzer bir riskle biz karşı karşıyayız.</p>\r\n\r\n<p>Kıyı şeridimizi ne kadar &ccedil;ok havuzlu ya da havuzsuz yazlıkla doldurursak, &ouml;deyeceğimiz bedel o kadar &ccedil;ok artacak.</p>\r\n\r\n<p><strong>&ldquo;O KADIN...&rdquo; &nbsp;</strong></p>\r\n\r\n<p>Bravo sana H&uuml;rriyet&rsquo;in Kelebek eki.</p>\r\n\r\n<p>Karısını aldatan bir adamın haberini yaparken &ldquo;O kadının kimliği belli oldu&rdquo; diye yazmışlar resmin &uuml;zerine.</p>\r\n\r\n<p>Bir s&uuml;r&uuml; insan &ldquo;O kadın&rdquo; diye tanımlayabilir ama bir gazete bir kadını nasıl bu kadar kimliksiz ve basma kalıp bir bakışla değerlendirebilir.</p>\r\n\r\n<p>Evli bir adam karısını aldatıyorsa, o kadın yoktur aldatan bir &nbsp;adam vardır.</p>\r\n\r\n<p><img alt="" src="http://i.milliyet.com.tr/GazeteHaberIciResim/2017/08/01/fft16_mf9598925.Jpeg" style="float:right; margin-right:5px; margin-top:5px" /></p>\r\n\r\n<p><strong>Radyo edebiyatı</strong></p>\r\n\r\n<p>Sanılanın aksine radyocular sadece konuşmuyor, yazıyorlar da... Nihat Sırdar&rsquo;ın yazdığı &lsquo;35&rsquo;i Beklerken&rsquo;, ge&ccedil;tiğimiz senenin sonuna doğru piyasaya &ccedil;ıktı, &uuml;st &uuml;ste yeni baskılar yaptı. Bu haziranda da Zeki Kayhan Coşkun&rsquo;un son kitabı, &lsquo;Kime &Ccedil;ektim Ben Bilmem Ki&rsquo; raflardaki yerini aldı. Zeki&rsquo;nin daha &ouml;nceki kitaplarında &ccedil;ok eğlenmiştim, bu kez Zeki&rsquo;yle birlikte &ccedil;ocukluk yıllarına, eski İstanbul&rsquo;a dair bir yolculuğa &ccedil;ıktım. Hayatın yoran koşuşturmasında, soluklanmak adına g&uuml;zel bir se&ccedil;enek, &lsquo;Kime &Ccedil;ektim Ben Bilmem Ki&rsquo;</p>\r\n\r\n<p><strong>Azap</strong></p>\r\n\r\n<p><img alt="" src="http://i.milliyet.com.tr/GazeteHaberIciResim/2017/08/01/fft16_mf9598933.Jpeg" style="float:right; margin-right:5px; margin-top:5px" /></p>\r\n\r\n<p>Pazartesi g&uuml;n&uuml; motorlu taşıtlar vergisinin ikinci taksiti, bir &ouml;nceki yapılandırmanın &uuml;&ccedil;&uuml;nc&uuml; taksiti ve son yapılandırmanın ilk taksitinin son &ouml;deme g&uuml;n&uuml;yd&uuml;. İnsanlar, İnternet Vergi Dairesi&rsquo;ne girebilmek i&ccedil;in b&uuml;y&uuml;k &ccedil;aba harcadı.</p>\r\n\r\n<p>Siteye girmek yetmedi, zira sistem tahminen yoğunluktan dolayı kredi kartlarını tanımadı, banka hesaplarından tahsilat yapamadı. Tamam &ouml;demeleri son g&uuml;ne bırakmak hata da, yoğunluk oluşturacak &uuml;&ccedil; &ouml;demenin son g&uuml;n&uuml; aynı olunca, o sistemi &ccedil;alışır tutmak da gerekiyor. Para &ouml;demek i&ccedil;in insanlara azap &ccedil;ektirmenin bir anlamı yok ki...</p>', '2017-08-02 09:35:07', '2017-08-02 09:35:07', 1, NULL, '2017-08-02 09:35:07', NULL, NULL, NULL, 0, 0, 0, 'published');
INSERT INTO `pf_articles` (`pkarticle`, `title`, `alias`, `summary`, `content`, `created_at`, `updated_at`, `created_by`, `updated_by`, `publish_date`, `image`, `featured_image`, `author`, `view`, `allow_comments`, `comments`, `status`) VALUES
(11, 'Usandım !', 'usandim-', NULL, '<p>21 Temmuz Cuma g&uuml;n&uuml; CHP Genel Başkanı Kemal Kılı&ccedil;daroğlu ile randevum vardı.</p>\r\n\r\n<p>Şu anda Usandım makalesini d&uuml;zenlemekteyim. Nasıl olacak g&ouml;relim</p>\r\n\r\n<p>15 Temmuz &uuml;zerine konuşurken&nbsp;<strong>Kemal Bey</strong>,&nbsp;<strong>&ldquo;Haftaya savcılığa &ccedil;ok &ouml;nemli bir dosya teslim edeceğiz&rdquo;&nbsp;</strong>dedi. Nezaket ziyareti olduğu i&ccedil;in fazla kurcalamadım.&nbsp;<strong>Kılı&ccedil;daroğlu</strong>, 25 Temmuz Salı g&uuml;n&uuml; grup toplantısında,&nbsp;<strong>Tuncay &Ouml;zkan</strong>&rsquo;ın dosyayı savcılığa teslim etmek &uuml;zere olduğunu s&ouml;yleyince, bende şafak attı. Meğerse benimki nezaket değil mesleki a&ccedil;ıdan rezaletmiş.</p>\r\n\r\n<p><strong>Tuncay &Ouml;zkan</strong>, elindeki flash diski, cumhuriyet savcılığına teslim ettikten sonra,<strong>&ldquo;Neden şimdi&rdquo;&nbsp;</strong>sorusu g&uuml;ndeme geldi. Ergenekon duruşmaları sırasında neden g&uuml;ndeme getirmediğini sorgulayanlar oldu.</p>\r\n\r\n<p><strong>Tuncay &Ouml;zkan</strong>, 2007 yılında bir futbol hakeminin kendisine ilettiğini s&ouml;ylediği flash diski, Kara Kuvvetleri Komutanı&nbsp;<strong>İlker Başbuğ</strong>&rsquo;a teslim ediyor.&nbsp;<strong>Başbuğ</strong>, Hava Kuvvetleri&rsquo;yle ilgili olduğu d&uuml;ş&uuml;ncesiyle Genelkurmay&rsquo;a bildiriyor. Flash disk, yolda başına k&ouml;t&uuml; bir şey gelmeden Hava Kuvvetleri&rsquo;ne kadar ulaşıyor. Orada İstihbarat Başkanı&nbsp;<strong>Akın &Ouml;zt&uuml;rk</strong>&nbsp;başkanlığında&nbsp;<strong>&ldquo;G&uuml;neş &Ccedil;alışma Grubu&rdquo;</strong>&nbsp;kuruluyor.&nbsp;<strong>G&uuml;neş &Ccedil;alışma Grubu</strong>, 2 yıl s&uuml;ren yoğun &ccedil;alışma sonucunda flash diskin i&ccedil;indeki bilgileri yok etmeyi başarıyor. 9 Şubat 2009 tarihinde dosyayı kapatıyor.</p>\r\n\r\n<p>TSK&rsquo;daki FET&Ouml; dosyası kapanıyor ama&nbsp;<strong>Tuncay &Ouml;zkan</strong>&nbsp;dosyası a&ccedil;ılıyor.&nbsp;<strong>Tuncay &Ouml;zkan</strong>, flash diski teslim ettikten 1 yıl sonra 23 Eyl&uuml;l 2008&rsquo;de Ergenekon operasyonu kapsamında tutuklanıyor.</p>\r\n\r\n<p>Flash diskin 10 yıl sonra yeniden pop&uuml;ler olmasının ise&nbsp;<strong>Adriana Lima</strong>&rsquo;nın T&uuml;rkiye&rsquo;de tatilini ge&ccedil;irmesiyle hi&ccedil;bir ilgisi yoktur. İtiraf&ccedil;ı olan FET&Ouml;&rsquo;c&uuml; Albay&nbsp;<strong>Sel&ccedil;uk Başbilen</strong>, ifadesinde yok edilen flash diskten s&ouml;z ediyor. O d&ouml;nemde Hava Kuvvetleri İKK Şubesi&rsquo;nde g&ouml;revli olan&nbsp;<strong>Başbilen</strong>, olayın tanıklarından.&nbsp;<strong>Tuncay &Ouml;zkan</strong>&rsquo;ın incelenmesi i&ccedil;in TSK&rsquo;ya teslim ettiği flash disk, Hava Kuvvetleri Komutanı&nbsp;<strong>Faruk C&ouml;mert</strong>&rsquo;ten &ouml;nce FET&Ouml;&rsquo;n&uuml;n Hava Kuvvetleri İmamı&nbsp;<strong>Adil &Ouml;ks&uuml;z</strong>&rsquo;e ulaştırılıyor.&nbsp;<strong>Adil &Ouml;ks&uuml;z</strong>, flash diskteki bilgileri doğruluyor, t&uuml;m emeklerimiz boşa gitti diye g&ouml;zyaşı d&ouml;k&uuml;yor. Darbe soruşturmasını y&uuml;r&uuml;ten savcı ise&nbsp;<strong>Tuncay &Ouml;zkan</strong>&rsquo;la irtibat kurarak, bu flash diskin akıbetini soruyor.</p>\r\n\r\n<p><strong>Tuncay &Ouml;zkan</strong>&rsquo;la flash disk işini konuştum. Ergenekon yargılamaları sırasında neden g&uuml;ndeme getirmediğini sordum.</p>\r\n\r\n<p><strong>&ldquo;Kediye ciğer teslim edilir mi? Zaten FET&Ouml;&rsquo;c&uuml;ler bu flash diski arıyordu. Şof&ouml;r&uuml;m&uuml;n ve sekreterimin evlerini iki kez aradılar. Baldızımın ve benim evimi 3 kez aradılar. Bilgi işlem servisinde &ccedil;alışan personeli tek tek aldılar, harddiski aldılar. Kitaplarımın sayfalarını par&ccedil;a par&ccedil;a edip bu bilgiye ulaşmaya &ccedil;alıştılar. Aramalara bizzat Zekeriya &Ouml;z ile Ali Fuat Yılmazer başkanlık ediyordu&rdquo;</strong>&nbsp;dedi.</p>\r\n\r\n<p><strong>Tuncay &Ouml;zkan</strong>, flash diskin i&ccedil;indeki bilgilerin,<strong>&ldquo;kriptolu&rdquo;&nbsp;</strong>olduğunu anlattı.&nbsp;<strong>&ldquo;Hepsini &ccedil;&ouml;zmeyi başaramadık, Kriptolu 5 dosya &ccedil;&ouml;z&uuml;lemedi&rdquo;</strong>&nbsp;diye konuştu.</p>\r\n\r\n<p><strong>FLASH DİSKTE NE VAR?</strong></p>\r\n\r\n<p>Flash diskin i&ccedil;inde olanları ise ş&ouml;yle sıraladı:</p>\r\n\r\n<p><strong>&ldquo;TSK i&ccedil;indeki subaylar &lsquo;Alevi&rsquo;, &lsquo;K&uuml;rt&rsquo;, &lsquo;Solcu&rsquo;, &lsquo;Pornocu&rsquo; diye d&ouml;rde ayrılmış.</strong></p>\r\n\r\n<p><strong>1- Alevi Subaylar fişlenmiş.</strong></p>\r\n\r\n<p><strong>2- Hilmi &Ouml;zk&ouml;k dahil Genelkurmay Başkanı olacak 86 generalin aileleri tek tek incelenmiş.</strong></p>\r\n\r\n<p><strong>3- Kızlardan katalog yapılıp evlenecek subaylara g&ouml;nderilmiş.</strong></p>\r\n\r\n<p><strong>4- İşin en can alıcı noktası ise &ldquo;TSK i&ccedil;indeki FET&Ouml;&rsquo;c&uuml; subaylar fişlenmiş.&rdquo;</strong></p>\r\n\r\n<p><strong>MİLLETVEKİLİ OLDUKTAN SONRA</strong></p>\r\n\r\n<p>Peki&nbsp;<strong>Tuncay &Ouml;zkan</strong>&nbsp;milletvekili olduktan sonra bu flaş diski neden g&uuml;ndeme getirmedi?</p>\r\n\r\n<p><strong>&ldquo;Getirdim&rdquo;&nbsp;</strong>dedi. TBMM&rsquo;de &uuml;yesi olduğu G&uuml;venlik ve İstihbarat Komisyonu&rsquo;nda istihbarat birimlerinin elinde FET&Ouml;&rsquo;c&uuml;lerle ilgili hangi bilgilerin bulunduğunu g&uuml;ndeme getirmiş. Başbakanlık aracılığıyla&nbsp;<strong>&ldquo;FET&Ouml;&rsquo;c&uuml;ler kontrol altında, edilgen durumdalar&rdquo;</strong>&nbsp;cevabının geldiğini s&ouml;yl&uuml;yor.&nbsp;<strong>&ldquo;Bu cevaptan 6 ay sonra 15 Temmuz darbe girişimi oldu&rdquo;</strong>&nbsp;diyor. Ayrıca 14 Eyl&uuml;l 2016 tarihinde S&ouml;zc&uuml; gazetesinde<strong>&nbsp;Nil Soysal</strong>&nbsp;ile s&ouml;yleşisinde değinmiş. Ama cezaevinden &ccedil;ıktıktan ve milletvekili olduktan sonra<strong>&nbsp;&lsquo;B&ouml;yle bir flash disk var, ben bunu TSK&rsquo;ya teslim etmiştim&rsquo;</strong>şeklinde a&ccedil;ık bir beyanına rastlamadım.</p>\r\n\r\n<p>Kendisine y&ouml;nelik eleştirilere,&nbsp;<strong>&ldquo;Ben FET&Ouml;&rsquo;ye karşı direndim. 576 g&uuml;n&uuml; h&uuml;crede olmak &uuml;zere 6 yıl hapis yattım. Peki hırsızın su&ccedil;u yok mu?&rdquo;</strong>diye karşılık veriyor.</p>\r\n\r\n<p>Durum bu.</p>', '2017-08-02 09:41:42', '2017-08-02 09:41:42', 1, 1, '2017-08-02 09:41:42', NULL, NULL, NULL, 0, 0, 0, 'published'),
(12, 'Çift boşluklu   bir BaŞLıK    Oluşturuyorum. İçinde Boşluk ve ! ? : , Değişik Harfler Olan   bir Başlık   ?', 'cift-bosluklu-bir-baslik-olusturuyorum-icinde-bosluk-ve-degisik-harfler-olan-bir-baslik-', NULL, '<p>&quot;OHAL kapsamında &ccedil;ıkarılan KHK&rsquo;lar ile g&ouml;revlerinden ihra&ccedil; edilen, işe geri d&ouml;nme talebiyle a&ccedil;lık grevi yaptıkları sırada g&ouml;zaltına alınan ve tutuklanan DHKP-C Kamu Emek&ccedil;ileri Cephesi (KEC) mensubu Nuriye G&uuml;lmen ve Semih &Ouml;zak&ccedil;a&rsquo;ya destek vermek ve tutuklanmalarını protesto etmek amacıyla, 24 saat esasına g&ouml;re ilimiz muhtelif yerlerinde, parklarında a&ccedil;lık grevi, oturma eylemi d&uuml;zenleneceğine dair istihbarat alınmıştır.</p>', '2017-08-02 10:03:49', '2017-08-02 10:03:49', 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 'published'),
(13, 'Toplu sözleşmede gericilik gölgesi', 'toplu-sozlesmede-gericilik-golgesi', NULL, '<p>1 Ağustos g&uuml;n&uuml;, toplu s&ouml;zleşme s&uuml;recine girildi. Yaklaşık 3 milyon 200 bin memur ile 1 milyon 900 bin memur emeklisine, 2018-2019 yıllarında verilecek zam oranları belirlenecek.</p>\r\n\r\n<p>Memur Sen, 11 işkolunda yetkili. Kamuda yaklaşık 1 milyon 694 bin sendika &uuml;yesi var ve 900 bini bu federasyona bağlı sendikaların &uuml;yesi; %60 ediyor. G&ouml;r&uuml;şmelerde yalnızca Memur Sen&rsquo;in s&ouml;z&uuml; ge&ccedil;ecek. İmza yetkisi onda.</p>\r\n\r\n<p>900 bin, &ccedil;ok ciddi bir sayı. Kararlı bir sendika y&ouml;netimi, bu g&uuml;c&uuml;ne dayanarak, kamu &ccedil;alışanlarına enflasyonun &ccedil;ok &uuml;zerinde &uuml;cret artışı sağlayabileceği gibi, g&uuml;vencesiz-esnek-kuralsız &ccedil;alıştırılmayı &ouml;nleyecek d&uuml;zenlemeleri de dayatabilir. B&ouml;yle duruş sergileyebilen bir sendikanın karşısında hi&ccedil;bir iktidar; performans, esnek &ccedil;alıştırma vb. y&ouml;ntemler &ouml;nermeye cesaret edemez.</p>\r\n\r\n<p>&Uuml;stelik bu kazanımların, &ouml;zel sekt&ouml;rde &ccedil;alışan iş&ccedil;ilere de olumlu yansımaları olur.</p>\r\n\r\n<p>Memur Sen&rsquo;in &ouml;n&uuml;nde &uuml;&ccedil; yol var. Ya &uuml;yelerinin &ccedil;ıkarını kollamak i&ccedil;in m&uuml;cadele edecek; ya kolluyormuş gibi biraz itiraz edip, k&uuml;&ccedil;&uuml;k &ouml;d&uuml;nlerle yetinip imzalayacak; ya da g&ouml;r&uuml;şmeler uzlaşmazlıkla sonu&ccedil;lanacak. 15 g&uuml;n i&ccedil;inde uzlaşılamamışsa bir tutanak d&uuml;zenlenip hakeme havale edilecek. Son s&ouml;z hakemin.</p>\r\n\r\n<p>İşin toplu s&ouml;zleşme yanı bundan ibaret. Şimdi gericilik yanına gelelim:</p>\r\n\r\n<p>Memur Sen&rsquo;den kararlı bir m&uuml;cadele sergilemesi beklenemez; &ccedil;&uuml;nk&uuml; d&uuml;zene hizmet amacıyla kurduruldu ve tek başına toplu s&ouml;zleşme yapma g&uuml;c&uuml;ne erişmesi i&ccedil;in &ccedil;ok &ccedil;aba g&ouml;sterildi. Uysal, iktidarın politikalarının destek&ccedil;isi bir federasyon. &Ccedil;alışanların &ccedil;ıkarına denebilecek bir etkinliği hi&ccedil; olmadı ve bunu gizleyebilmek amacıyla &ccedil;ok fazla dinsel referanslara başvuruyor. Başkanının, 23 Temmuz g&uuml;n&uuml; Genişletilmiş Başkanlar Konseyi adını verdikleri bir toplantıdaki şu s&ouml;zler durumu g&uuml;zel &ouml;zetliyor;</p>\r\n\r\n<p>&ldquo; &hellip;salt &uuml;cret sendikacılığı değil, medeniyet kodlarımızın y&ouml;nlendirmesiyle; haksızlığın, zulm&uuml;n, &ccedil;arpıklığın ve yoksulluğun k&uuml;reselleştiği bir d&uuml;nyada sosyal ve insani sendikacılık yapıyoruz. Memur Sen, zalimlere karşı direnişin merkezi; mazlumlar ve mahzunlar i&ccedil;in diriliş nefesidir.&rdquo;</p>\r\n\r\n<p>Eğer bir sendikaya, &ldquo;haksızlıklara, zalimlere direnmek, mahzunlar i&ccedil;in diriliş nefesi olmak&rdquo; i&ccedil;in &uuml;ye olanlar varsa şimdiden s&ouml;yleyelim: yanlış adresteler.</p>\r\n\r\n<p>Federasyonun internet sitesinde, toplu s&ouml;zleşme s&uuml;recine nasıl hazırlandıklarına ilişkin haberlere yer vermişler. Bir &ouml;rnek, Başkan; &ldquo;toplu s&ouml;zleşmeyi hem s&uuml;re&ccedil; hem de sonu&ccedil; bakımından adalet ve hakkaniyet &uuml;zerine temellendirdik&rdquo; diye bir s&ouml;z etmiş. Nedense cilalı s&ouml;zlere pek meraklılar, bari anlamını bilseler. Asıl ama&ccedil;larını bir sonraki paragrafta ş&ouml;yle a&ccedil;ıklıyorlar; &ldquo;helal gıda, hac izni, kılık kıyafet serbestisi isteyeceğiz.&rdquo;</p>\r\n\r\n<p>Bir sendika y&ouml;netiminden, toplu s&ouml;zleşme g&uuml;nleri yaklaşmışsa, g&uuml;ndemi &ccedil;alışma yaşamının sorunlarına &ccedil;ekmek i&ccedil;in &ccedil;aba g&ouml;stermesi beklenir. Oysa dinsel i&ccedil;erikli motifleri kullanarak dikkatleri başka yerlere &ccedil;ekip ilginin dağılmasını sağlıyorlar.</p>\r\n\r\n<p>S&ouml;zgelişi, 30 Temmuz g&uuml;n&uuml; &quot;B&uuml;y&uuml;k Kud&uuml;s Mitingi&quot;ne katılmak i&ccedil;in &uuml;yelerini &ouml;rg&uuml;tlediler; &ldquo;Meclis-i Aksa&rsquo;da M&uuml;sl&uuml;manların &ccedil;ığlığına sessiz kalamayız&rdquo; diyorlar. Bu gibi konularda s&ouml;yleyecek daha &ccedil;ok s&ouml;zleri olduğu anlaşılıyor. Bir &ouml;rnek daha vereyim; &ldquo;Mescid-i Aksa&rsquo;da kan d&ouml;ken, namaz kılınmasını engelleyen, belli bir yaş aralığındaki Filistinlileri Mescide sokmayan, kirli postallarıyla kirleten, Siyonist rejim mescidi tamamen ibadete kapatmak i&ccedil;in kirli planlar y&uuml;r&uuml;t&uuml;yor. (&hellip;) bu gibi faşizan uygulamalara izin vermeyeceğiz.&rdquo;</p>\r\n\r\n<p>Ramazanda Mescid-i Aksa&rsquo;da iftar verdiklerini de anımsatalım. Memur Sen&rsquo;in genel başkan yardımcısı, d&uuml;nyada nerede mağdur ve mazlum varsa onlarla imkanlarını paylaşmaktan &ccedil;ekinmeyeceklerini s&ouml;yl&uuml;yor.</p>\r\n\r\n<p>Diyanet Sen, Memur Sen&rsquo;e &uuml;ye sendikalardan biri. Farklı olmaları beklenemez elbette. İnternet sitelerinde; 2007 yılından beri toplu s&ouml;zleşme masalarına m&uuml;ft&uuml;lere de resmi nikah kıyma yetkisi verilmesi &ouml;nerisini g&ouml;t&uuml;rd&uuml;klerini yazmışlar. Dahası var; toplumsal problemlere &ccedil;&ouml;z&uuml;m &uuml;retmeyi &ouml;ncelediklerini ve bu ama&ccedil;la yıllardır hastanelere din psikoloğu, orduya din subayı verilmesi i&ccedil;in &ccedil;aba g&ouml;sterdiklerini vurgulamışlar: &ldquo;&ccedil;&ouml;z&uuml;m odaklı &ouml;neriler getirmeyi sendikal bir g&ouml;rev&quot;&nbsp;olarak g&ouml;r&uuml;yorlarmış.</p>\r\n\r\n<p>Şu yazdıklarını da g&ouml;zden ka&ccedil;ırmayalım; &ldquo;Hakka ve hakikate doğru yolcu olmuşsanız eğer y&uuml;k&uuml;n&uuml;z ağır, işiniz zor demektir. Evet, Memur-Sen&rsquo;in, Diyanet-Sen&rsquo;in y&uuml;k&uuml; ağır ve işi zor. Ancak biz bu zorlukları bilerek ve g&ouml;ze alarak bu işe baş koyduk.&rdquo;</p>\r\n\r\n<p>Doğmalarla b&uuml;y&uuml;t&uuml;len kuşaklar, d&uuml;zenin &ccedil;ok işine yarıyor. &ldquo;orduda baş&ouml;rt&uuml;l&uuml; bir general g&ouml;rebilmek&rdquo; umuduyla mutlu olabilen yoksulların varlığı d&uuml;zen i&ccedil;in vazge&ccedil;ilmez &ouml;nem taşıyor. O nedenle de gerici eğitime, bağnazlığa ve sarı bile sayılamayacak sendikalara milyarlarca lira harcanmasına karşı &ccedil;ıkmıyorlar.</p>\r\n\r\n<p>&Uuml;stelik bu işlere harcanan para, kazandıklarının zekatı kadar bile tutmuyor.</p>', '2017-08-02 19:22:24', '2017-08-02 19:22:24', 11, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 'published');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_comments`
--

INSERT INTO `pf_comments` (`pkcomment`, `fullname`, `email`, `content`, `object_id`, `module_name`, `ip`, `created_at`, `updated_at`, `subscriber_id`, `user_id`, `parent_id`, `likes`, `dislikes`, `status`) VALUES
(2, 'Muhammed Yusuf ERDEn', 'cwyusef@gmail.com', 'teşekkürler teşekkürler teşekkürler teşekkürler teşekkürler teşekkürler teşekkürler .', 22, 'news', '127.0.0.1', '2017-07-16 11:14:48', '2017-07-16 11:14:48', NULL, NULL, NULL, 0, 0, 'approved'),
(3, 'Muhammed Yusuf ERDEn', 'cwyusef@gmail.com', 'örnek bir yorum yapıyorum haciiiiiiiii.\r\nBu yorum benden Grup Yorum\'a gelsin.\r\nSaygılar, selamlar.\r\n\r\n//edit. Deneme', 22, 'news', '127.0.0.1', '2017-07-16 11:14:48', '2017-07-16 11:14:48', NULL, NULL, NULL, 0, 0, 'spam'),
(4, '', 'cwyusef@gmail.com', 'ilk yorumumu deniyorum arkadaşlar.', 5, 'pages', NULL, '2017-07-31 08:08:42', '2017-07-31 08:08:42', NULL, 1, NULL, 0, 0, 'approved'),
(5, '', 'cwyusef@gmail.com', 'elma armut kiraz meyve sebze yorummm\r\nasdasdasd', 5, 'pages', NULL, '2017-07-31 08:36:29', '2017-07-31 08:36:29', NULL, 1, NULL, 0, 0, 'pending'),
(6, '', 'cwyusef1@gmail.com', 'Yaa meteroloji bazen sallıyor ya inanmayın\r\n//edit: Lütfen yaptığınız yoruma dikkat edin.', 5, 'pages', NULL, '2017-07-31 08:51:19', '2017-07-31 08:51:19', NULL, 1, NULL, 0, 0, 'approved');

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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_logs`
--

INSERT INTO `pf_logs` (`pklog`, `kind`, `module`, `description`, `created_at`, `user_id`, `session_id`, `ip`) VALUES
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
(107, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-31 10:24:06', 1, '9e9fouh65fspfeiv66lgku58gsi9gtsn', '127.0.0.1'),
(108, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-31 13:36:40', 1, 't72eteu0oql7cfne9ovuqsl77nk48s1k', '127.0.0.1'),
(109, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-07-31 17:25:13', 1, 'nlrqv87n72h4l6vdidk6qf0aplhdkgkt', '127.0.0.1'),
(110, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-08-01 06:25:40', 1, 'h0poal6fiahdd7vukd24e8lpo6kq71i2', '127.0.0.1'),
(111, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-08-01 08:13:00', 1, 'd1uqispefdbvhb2fr9cjd174qsqaajbe', '127.0.0.1'),
(112, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-08-01 11:04:11', 1, 'n0kg63t5hulgkak1khn6j13qk0kln64s', '127.0.0.1'),
(113, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-08-02 07:56:52', 1, '3fvvvhgbb23c1rr356n8u54lgl4bpint', '127.0.0.1'),
(114, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-08-02 14:18:49', 1, 'l75p5r48949sl5c2o9shbaff912infqh', '127.0.0.1'),
(115, 'info', 'auth', 'Login success yazbeni@gmail.com', '2017-08-02 18:53:52', 11, '0pm3tk6udsg254gl2192ljg36tgmra2i', '127.0.0.1'),
(116, 'info', 'auth', 'Login success yazbeni@gmail.com', '2017-08-02 20:23:40', 11, 'nt9164q2uf96ijd8aisa1d3damc1m2bt', '127.0.0.1'),
(117, 'info', 'auth', 'Login success yazbeni@gmail.com', '2017-08-03 06:37:32', 11, 'ltmnieu1q71vlu4lo04d5pl5qvh80lf2', '127.0.0.1'),
(118, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-08-03 06:41:11', 1, 'ltmnieu1q71vlu4lo04d5pl5qvh80lf2', '127.0.0.1'),
(119, 'info', 'auth', 'Login success yazbeni@gmail.com', '2017-08-03 06:43:17', 11, 'qp7050c6706qbi117ph7on49uc1mnq4o', '127.0.0.1'),
(120, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-08-03 09:33:02', 1, 'pneporknlrp28h9e4qj68ot8jm9pr7l4', '127.0.0.1'),
(121, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-08-03 12:59:57', 1, 'bl02chg8b1eu1ti4l1r28m7q6h76khf0', '127.0.0.1'),
(122, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-08-03 20:10:54', 1, 's57chsfhot6gbj7co4gf47of2an5qelo', '127.0.0.1'),
(123, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-08-04 06:41:12', 1, 'bd3ns54jesmgm62s98glg8o4kj7cteco', '127.0.0.1'),
(124, 'info', 'users', 'An error occurred while updating user: kazim01', '2017-08-04 09:03:13', 1, '4sbfjedpii28sfspni3uautjbsioq7g9', '127.0.0.1'),
(125, 'info', 'users', 'User edited successfully: kazim01', '2017-08-04 09:06:56', 1, '4sbfjedpii28sfspni3uautjbsioq7g9', '127.0.0.1'),
(126, 'info', 'auth', 'Login success cwyusef@gmail.com', '2017-08-04 10:39:47', 1, '6oativ7oikeb6ikqs82udk3o2uko4o65', '127.0.0.1'),
(127, 'info', 'users', 'An error occurred while updating user: kazim01', '2017-08-04 10:40:11', 1, '6oativ7oikeb6ikqs82udk3o2uko4o65', '127.0.0.1'),
(128, 'info', 'users', 'User edited successfully: kazim01', '2017-08-04 10:40:29', 1, '6oativ7oikeb6ikqs82udk3o2uko4o65', '127.0.0.1'),
(129, 'info', 'users', 'User edited successfully: kazim01', '2017-08-04 10:45:05', 1, 'ptoj5iuagki35db85m6dasl8o6uo8kf7', '127.0.0.1'),
(130, 'info', 'users', 'User edited successfully: kazim015', '2017-08-04 10:53:41', 1, 'j4sjj9df1ggh03fd8ipia54bgdlfasi4', '127.0.0.1'),
(131, 'info', 'users', 'User edited successfully: kazim0155', '2017-08-04 10:55:16', 1, 'j4sjj9df1ggh03fd8ipia54bgdlfasi4', '127.0.0.1'),
(132, 'info', 'users', 'Users has been disabled: 12', '2017-08-04 10:57:30', 1, 'j4sjj9df1ggh03fd8ipia54bgdlfasi4', '127.0.0.1'),
(133, 'info', 'users', 'Users has been enabled: 12', '2017-08-04 10:57:38', 1, 'j4sjj9df1ggh03fd8ipia54bgdlfasi4', '127.0.0.1');

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

INSERT INTO `pf_pages` (`pkpage`, `title`, `alias`, `summary`, `content`, `created_at`, `updated_at`, `created_by`, `updated_by`, `allow_comments`, `comments`, `status`, `params`) VALUES
(2, 'Sayfa Başlık Sayfa Başlık Sayfa Başlık Sayfa Başlık Sayfa Başlık', 'iletisim', '', 'İletişim bilgilerimize aşağıdaki adresten ulaşabilirsiniz.s sad asd asd&nbsp;', '2017-07-17 09:37:20', '2017-07-31 17:27:18', 1, 1, 0, 0, 'published', NULL),
(5, 'Son dakika! Meteoroloji\'den İstanbul için yeni uyarı', 'hakkimizda', '', '<p>\r\n\r\n</p><p><a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/istanbul">İstanbul</a>\'da gece saatlerinden itibaren etkili olan gök gürültü kuvvetli sağanak, başta trafik olmak üzere yaşamı olumsuz etkiledi.</p><p>İstanbul Valiliği, sosyal medya hesabında, "Bugün ilimiz yoğun yağış aldığından ulaşımda sıkıntı yaşanmaması için zorunlu olmadıkça özel araçlarla trafiğe çıkılmaması rica olunur." uyarısında bulundu.</p><p><strong>YAĞIŞ, 15.00\'DEN SONRA AZALACAK</strong></p><p>Öte yandan gelen <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/son-dakika">son dakika</a>&nbsp;bilgisine göre, <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/meteoroloji-genel-mudurlugu">Meteoroloji Genel Müdürlüğü</a>, İstanbul\'da yağışın saat 15.00\'dan itibaren etkisini azaltacağını açıkladı.</p><p>Meteoroloji Genel Müdürlüğü, Trakya ve İstanbul\'daki sağanağın saat 15.00\'ten sonra etkisinin azalmasının beklendiğini duyurdu.</p><p>Meteoroloji Genel Müdürlüğü, sosyal medya hesabından, "Meteorolojik Değerlendirme 1" başlığıyla duyuru yaptı.</p>\r\n\r\n\r\n\r\n<p>Marmara Bölgesi\'nde devam eden kuvvetli ve gök gürültülü sağanak yağışın saat 15.00\'ten sonra Trakya ve İstanbul\'da etkisini azaltmasının beklendiği vurgulanan açıklamada, şöyle denildi:</p><p>"Ancak yağışlı sistemin Marmara\'nın doğusuna hareket ederek Kocaeli, Sakarya, Düzce, Zonguldak ve Bartın\'ın özellikle kıyı kesimlerinde yarın öğle saatlerine kadar şiddetli (75-100 kg/m2) sağanak ve gök gürültülü sağanak yağışlara sebep olması beklenmektedir. Saat 11.00 itibarıyla son 6 saatte, Silivri\'de 128, Üsküdar\'da 108, Beykoz\'da 85, Sarıyer\'de 78, Çatalca\'da 55, Kırklareli/Vize\'de 45, Eyüp\'te 44, Güngören\'de 44, Çekmeköy\' de 39 ve Kadıköy\'de 35 kg yağış kaydedilmiştir."</p><p><strong>SON 32 YILIN EN BÜYÜĞÜ</strong></p><p>Temmuz ayının tamamında ortalama 32,5 kg yağış alan İstanbul\'da sadece bugün, hem de günün ilk yarısında rekor miktarda yağmur yağdı.</p>\r\n\r\n\r\n\r\n<p><strong>1 GÜNDE, TEMMUZ AYI ORTALAMASININ ÇOK ÜSTÜNDE</strong></p><p>Neredeyse İstanbul\'un tamamına düşen yağış, Temmuz ayı ortalamasını çok geride bıraktı.</p><p><strong>32 YILIN EN YAĞMURLU GÜNÜ</strong></p><p>İstanbul\'da 1985 yılı Ekim ayının 16\'ncı günü, 125.5 kg\'lık yağışla, tüm zamanların "en yağışlı" günüydü. Ancak bugün yağan yağmur, üstelik bir yaz ayında yağan yağmur bu miktarı geride bıraktı. DHA\'nin meteorolojik ölçüm istasyonlarından derlediği bilgilere göre günün ilk yarısında Silivri\'de metrekareye tam 128 kg. yağış düştü.</p><p><strong>TÜM İLÇELERDE REKOR YAĞIŞ</strong></p><p>İstanbul\'un diğer semtlerine de rekor yağışlar düştü, aylık ortalamayı kat be kat geride bıraktı. İşte haberin yayınlandığı sırada bazı ilçelerde metrekareye düşen yağış miktarları. Üsküdar 108 kg, Beykoz 85 kg, Sarıyer 80 kg</p>\r\n\r\n<br><p></p>', '2017-07-18 12:04:05', '2017-07-31 17:27:38', 1, 1, 1, 0, 'published', NULL),
(6, 'Son dakika! Meteoroloji\'den İstanbul için yeni uyarı', 'yazarlar', '', '<p>\r\n\r\n</p><p><a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/istanbul">İstanbul</a>\'da gece saatlerinden itibaren etkili olan gök gürültü kuvvetli sağanak, başta trafik olmak üzere yaşamı olumsuz etkiledi.</p><p>İstanbul Valiliği, sosyal medya hesabında, "Bugün ilimiz yoğun yağış aldığından ulaşımda sıkıntı yaşanmaması için zorunlu olmadıkça özel araçlarla trafiğe çıkılmaması rica olunur." uyarısında bulundu.</p><p><strong>YAĞIŞ, 15.00\'DEN SONRA AZALACAK</strong></p><p>Öte yandan gelen <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/son-dakika">son dakika</a>&nbsp;bilgisine göre, <a target="_blank" rel="nofollow" href="http://www.sabah.com.tr/haberleri/meteoroloji-genel-mudurlugu">Meteoroloji Genel Müdürlüğü</a>, İstanbul\'da yağışın saat 15.00\'dan itibaren etkisini azaltacağını açıkladı.</p><p>Meteoroloji Genel Müdürlüğü, Trakya ve İstanbul\'daki sağanağın saat 15.00\'ten sonra etkisinin azalmasının beklendiğini duyurdu.</p><p>Meteoroloji Genel Müdürlüğü, sosyal medya hesabından, "Meteorolojik Değerlendirme 1" başlığıyla duyuru yaptı.</p>\r\n\r\n\r\n\r\n<p>Marmara Bölgesi\'nde devam eden kuvvetli ve gök gürültülü sağanak yağışın saat 15.00\'ten sonra Trakya ve İstanbul\'da etkisini azaltmasının beklendiği vurgulanan açıklamada, şöyle denildi:</p><p>"Ancak yağışlı sistemin Marmara\'nın doğusuna hareket ederek Kocaeli, Sakarya, Düzce, Zonguldak ve Bartın\'ın özellikle kıyı kesimlerinde yarın öğle saatlerine kadar şiddetli (75-100 kg/m2) sağanak ve gök gürültülü sağanak yağışlara sebep olması beklenmektedir. Saat 11.00 itibarıyla son 6 saatte, Silivri\'de 128, Üsküdar\'da 108, Beykoz\'da 85, Sarıyer\'de 78, Çatalca\'da 55, Kırklareli/Vize\'de 45, Eyüp\'te 44, Güngören\'de 44, Çekmeköy\' de 39 ve Kadıköy\'de 35 kg yağış kaydedilmiştir."</p><p><strong>SON 32 YILIN EN BÜYÜĞÜ</strong></p><p>Temmuz ayının tamamında ortalama 32,5 kg yağış alan İstanbul\'da sadece bugün, hem de günün ilk yarısında rekor miktarda yağmur yağdı.</p>\r\n\r\n\r\n\r\n<p><strong>1 GÜNDE, TEMMUZ AYI ORTALAMASININ ÇOK ÜSTÜNDE</strong></p><p>Neredeyse İstanbul\'un tamamına düşen yağış, Temmuz ayı ortalamasını çok geride bıraktı.</p><p><strong>32 YILIN EN YAĞMURLU GÜNÜ</strong></p><p>İstanbul\'da 1985 yılı Ekim ayının 16\'ncı günü, 125.5 kg\'lık yağışla, tüm zamanların "en yağışlı" günüydü. Ancak bugün yağan yağmur, üstelik bir yaz ayında yağan yağmur bu miktarı geride bıraktı. DHA\'nin meteorolojik ölçüm istasyonlarından derlediği bilgilere göre günün ilk yarısında Silivri\'de metrekareye tam 128 kg. yağış düştü.</p><p><strong>TÜM İLÇELERDE REKOR YAĞIŞ</strong></p><p>İstanbul\'un diğer semtlerine de rekor yağışlar düştü, aylık ortalamayı kat be kat geride bıraktı. İşte haberin yayınlandığı sırada bazı ilçelerde metrekareye düşen yağış miktarları. Üsküdar 108 kg, Beykoz 85 kg, Sarıyer 80 kg</p>\r\n\r\n<br><p></p>', '2017-07-18 12:04:55', '2017-07-31 17:27:44', 1, NULL, 0, 0, 'draft', NULL),
(8, 'İstanbul Boğazı\'nda şoke eden görüntü!', 'temsilciliklerimiz', '', '<p>\r\n\r\nİstanbul dün gece başlayan ve sabah saatlerinde şiddetini arttıran yağmur, İstanbullulara zor anlar yaşattı. Yollarda biriken sular trafiğin sıkışmasına neden olurken, toplu taşımada da aksamalar meydana geldi. Şiddetli yağış nedeniyle İstanbul Boğazı\'nda denize karışan sel suyu şaşırtan görüntülere sahne oldu. Yaşanan olay nedeniyle denizin iki renk haline geldiği görülürken, köprüden geçen vatandaşlar, o anları cep telefonları ile kaydedip sosyal medya hesaplarından paylaştı. \r\n\r\n<br></p>', '2017-07-18 12:12:11', '2017-07-31 17:27:46', 1, NULL, 0, 0, 'draft', NULL),
(9, 'Whatsapp\'ta yeni dönem başlıyor!', 'baskan', '', '<p>\r\n\r\n</p><h2>Whatsapp\'a gelmesi sabırsızlıkla beklenen özellik sonunda kullanıcılara sunuluyor. Bakın bu kez Whatsapp\'ın kullanıcılara son sürprizi ne?</h2>\r\n\r\n<br><p></p>', '2017-07-18 12:13:40', '2017-07-31 17:27:48', 1, NULL, 0, 0, 'draft', NULL),
(10, 'fgfgfgfd', 'a', '', '<p>asdasda</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>sd</p>\r\n\r\n<p>//test edited</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>as</p>\r\n\r\n<p>d</p>\r\n\r\n<p>asdasdasd</p>\r\n\r\n<p>asd</p>', '2017-07-28 12:08:57', '2017-08-03 10:38:58', 1, 1, 0, 0, 'draft', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_users`
--

INSERT INTO `pf_users` (`pkuser`, `username`, `fullname`, `password`, `email`, `profile_picture`, `created_at`, `enabled`, `user_type`, `params`, `last_visit`) VALUES
(1, 'yusuf', 'Muhammed Yusuf ERDEN', 'e10adc3949ba59abbe56e057f20f883e', 'cwyusef@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 15:09:31', 1, 3, NULL, '2017-08-04 07:57:38'),
(2, 'kerim', 'M. Yusuf Erden', 'e10adc3949ba59abbe56e057f20f883e', 'cwyuseff@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 12:09:31', 1, 3, NULL, '2017-07-16 18:00:00'),
(4, 'yusuf1', 'M. Yusuf Erden', 'e10adc3949ba59abbe56e057f20f883e', 'cwyusef1@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 12:09:31', 1, 1, NULL, '2017-07-16 18:00:00'),
(5, 'yusuf2', 'M. Yusuf Erden', 'e10adc3949ba59abbe56e057f20f883e', 'cwyusef2@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-13 12:09:31', 1, 2, NULL, '2017-07-16 18:00:00'),
(10, 'mybirer123', 'Muhammed Yasin Birer', 'e10adc3949ba59abbe56e057f20f883e', 'mybirer@gmail.com', '/assets/img/user2-160x160.jpg', '2017-07-21 13:47:20', 1, 1, NULL, '2017-07-23 09:00:09'),
(11, 'yazbeni', 'Kara Yazım', 'e10adc3949ba59abbe56e057f20f883e', 'yazbeni@gmail.com', '/assets/img/user2-160x160.jpg', '2017-08-02 18:52:48', 1, 4, NULL, '2017-08-03 03:43:25'),
(12, 'kazim0155', 'Kazım Karabekir1', 'e10adc3949ba59abbe56e057f20f883e', 'elmakiraz12@gmail.com', '/assets/img/user2-160x160.jpg', '2017-08-03 11:18:07', 1, 4, NULL, '2017-08-03 11:18:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pf_user_types`
--

INSERT INTO `pf_user_types` (`pkusertype`, `title`, `modules`) VALUES
(1, 'Editör', '{"dashboard":["add","edit","remove","list","confirm"],\n"pages":["add","edit","remove","list","confirm"],\n"news":["add","edit","remove","list","confirm"]}'),
(2, 'Muhabir', '{"dashboard":["add","edit","remove","list","confirm"],\n"news":["add","edit","remove","list","confirm"]}'),
(3, 'Yönetici', '{"dashboard":["add","edit","remove","list","confirm"],\n"pages":["add","edit","remove","list","confirm"],\n"news":["add","edit","remove","list","confirm"],\n"image_news":["add","edit","remove","list","confirm"],\n"video_news":["add","edit","remove","list","confirm"],\n"articles":["add","edit","remove","list","confirm"],\n"users":["add","edit","remove","list","confirm"],\n"subscribers":["add","edit","remove","list","confirm"],\n"bulletins":["add","edit","remove","list","confirm"],\n"seo":["add","edit","remove","list","confirm"],\n"surveys":["add","edit","remove","list","confirm"],\n"adverts":["add","edit","remove","list","confirm"],\n"messages":["add","edit","remove","list","confirm"],\n"comments":["add","edit","remove","list","confirm"],\n"logs":["add","edit","remove","list","confirm"],\n"statistics":["add","edit","remove","list","confirm"],\n"sosyal":["add","edit","remove","list","confirm"]}'),
(4, 'Yazar', '{"dashboard":["add","edit","remove","list","confirm"],\r\n"articles":["add","edit","remove","list","confirm"]}');

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
