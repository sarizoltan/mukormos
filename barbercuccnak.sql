-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: mysql.omega:3306
-- Létrehozás ideje: 2026. Jún 08. 09:22
-- Kiszolgáló verziója: 10.11.14-MariaDB-0+deb12u2
-- PHP verzió: 7.2.34-63+0~20260514.120+debian12~1.gbp709ce5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `barbercuccnak`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `booking_ref` varchar(20) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_phone` varchar(30) DEFAULT NULL,
  `booking_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` enum('pending','confirmed','cancelled','completed') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `bookings`
--

INSERT INTO `bookings` (`id`, `booking_ref`, `staff_id`, `service_id`, `customer_name`, `customer_email`, `customer_phone`, `booking_date`, `start_time`, `end_time`, `status`, `notes`, `created_at`) VALUES
(5, 'BB-20260412-D3EE', 1, 5, 'fegsgds hjgdjgdjg', 'hello@sarizoltan.hu', '0611212112', '2026-04-14', '09:20:00', '09:40:00', 'confirmed', 'Foglalás összegzése\nSzolgáltatás\nGyerek hajvágás\nBorbély\nKovács Péter\nDátum\n2026. április 14., kedd\nIdőpont\n09:20 – 09:40\nIdőtartam\n20 perc', '2026-04-12 08:51:55'),
(6, 'BB-20260412-1291', 2, 6, 'sfaegshgrsgs', 'hello@sarizoltan.hu', '0611212112', '2026-04-20', '17:00:00', '18:00:00', 'pending', 'bsbs', '2026-04-12 09:03:29'),
(7, 'BB-20260412-F503', 3, 6, 'Sári Zoltán', 'hello@sarizoltan.hu', '0611212112', '2026-04-28', '13:00:00', '14:00:00', 'confirmed', 'hdrhdjtfjtfh zjsfjfjtf jrzjrsjthdrs', '2026-04-12 09:05:21'),
(8, 'BB-20260414-36F0', 1, 1, 'Sári Zoltán', 'weboldalajanlatok@gmail.com', '0611212112', '2026-04-16', '11:00:00', '11:30:00', 'pending', 'hdhfd', '2026-04-14 10:09:39'),
(9, 'BB-20260414-D6AA', 1, 1, 'Sári Zoltán', 'sari.zoltan@cukorbetegreceptek.hu', '0611212112', '2026-04-24', '15:00:00', '15:30:00', 'pending', 'hdhdfhfdhdf', '2026-04-14 10:46:33'),
(10, 'BB-20260414-03FB', 2, 2, 'Sári Zoltán', 'sari.zoltan@cukorbetegreceptek.hu', '0611212112', '2026-04-30', '12:00:00', '12:45:00', 'cancelled', '', '2026-04-14 11:06:58');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `message` text NOT NULL,
  `status` enum('new','read','replied') DEFAULT 'new',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `message`, `status`, `created_at`) VALUES
(1, 'Sári Zoltán', 'weboldalajanlatok@gmail.com', '06206267127', 'gsgsdgsdgsd', 'read', '2026-04-08 14:55:55'),
(2, 'vsvsbdb rhrhrh', 'hello@sarizoltan.hu', '06206267127', 'hdhdhd', 'new', '2026-04-12 08:44:53'),
(3, 'Sári Zoltán', 'sari.zoltan@cukorbetegreceptek.hu', '06 20 626 71 27', 'dncgndtnhdthd tddjdthgd', 'replied', '2026-04-14 10:29:43'),
(4, 'Sári Zoltán', 'sari.zoltan@cukorbetegreceptek.hu', 'fafadf', 'adfadgdsgsdgsgsd sgsrgrwgws', 'new', '2026-04-14 10:45:20');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `media`
--

INSERT INTO `media` (`id`, `filename`, `filepath`, `filetype`, `filesize`, `alt_text`, `uploaded_at`) VALUES
(1, 'hero-bg_1775659936_0.jpg', 'assets/uploads/hero-bg_1775659936_0.jpg', 'image/jpeg', 113496, '', '2026-04-08 14:52:16'),
(2, 'barber3_1775666572_0.jpg', 'assets/uploads/barber3_1775666572_0.jpg', 'image/jpeg', 82900, '', '2026-04-08 16:42:52'),
(3, 'blog1_1775666572_1.png', 'assets/uploads/blog1_1775666572_1.png', 'image/png', 1246251, '', '2026-04-08 16:42:52'),
(4, 'blog2_1775666572_2.png', 'assets/uploads/blog2_1775666572_2.png', 'image/png', 1396777, '', '2026-04-08 16:42:52'),
(5, 'blog3_1775666572_3.png', 'assets/uploads/blog3_1775666572_3.png', 'image/png', 1231842, '', '2026-04-08 16:42:52'),
(6, 'barber2_1775666572_4.jpg', 'assets/uploads/barber2_1775666572_4.jpg', 'image/jpeg', 1023995, '', '2026-04-08 16:42:52');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `menus`
--

INSERT INTO `menus` (`id`, `name`, `location`) VALUES
(1, 'Főmenü', 'header'),
(2, 'Lábléc menü', 'footer');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `label` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `target` varchar(20) DEFAULT '_self'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `parent_id`, `label`, `url`, `page_id`, `sort_order`, `target`) VALUES
(1, 1, 0, 'Főoldal', '/', NULL, 1, '_self'),
(8, 2, 0, 'Adatvédelem', '/barber/adatvedelem', NULL, 1, '_self'),
(9, 2, 0, 'ÁSZF', '/barber/aszf', NULL, 2, '_self'),
(16, 1, 0, 'Kapcsolat', 'contact.php', NULL, 17, '_self'),
(21, 1, 0, 'Időpontfoglalás', '/foglalas', NULL, 18, '_self'),
(23, 1, 0, 'Borbélyaink', '/borbelyaink', NULL, 15, '_self'),
(24, 1, 0, 'Szolgáltatások', '/szolgaltatasok', NULL, 14, '_self'),
(25, 1, 0, 'Rólunk', '/rolunk', NULL, 16, '_self');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `schema_type` varchar(50) DEFAULT 'WebPage',
  `status` enum('published','draft') DEFAULT 'draft',
  `sort_order` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `schema_type`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Főoldal', 'fooldal', '<h1>Üdvözlünk a Barber Shopban!</h1><p>Foglalj időpontot online, gyorsan és egyszerűen.</p>', 'Barber Shop – Prémium Hajvágás', 'Prémium barber shop Budapest szívében. Foglalj időpontot online!', 'LocalBusiness', 'published', 0, '2026-04-08 11:31:19', '2026-04-08 11:31:19'),
(2, 'Rólunk', 'rolunk', '<h2>Rólunk</h2><p>Több mint 10 éve szolgálunk prémium minőségű barber szolgáltatásokkal.</p>', 'Rólunk – Barber Shop', 'Ismerj meg minket! Tapasztalt borbélyaink várnak.', 'AboutPage', 'published', 0, '2026-04-08 11:31:19', '2026-04-08 11:31:19'),
(3, 'Kapcsolat', 'kapcsolat', '<h2>Kapcsolat</h2><p>Vedd fel velünk a kapcsolatot!</p>', 'Kapcsolat – Barber Shop', 'Kapcsolatfelvétel a Barber Shoppal.', 'ContactPage', 'published', 0, '2026-04-08 11:31:19', '2026-04-08 11:31:19'),
(4, 'Szolgáltatások', 'szolgaltatasok', '<p>[services]</p>\r\n<h1 style=\"text-align: center;\">Borb&eacute;lyok</h1>\r\n<p>[staff]</p>\r\n<p>&nbsp;</p>', '', '', 'ServicePage', 'published', 0, '2026-04-08 13:50:25', '2026-04-08 16:42:03'),
(5, 'Borbélyaink', 'borbelyaink', '<p>[staff]</p>', '', '', 'WebPage', 'published', 0, '2026-04-08 16:46:29', '2026-04-08 16:46:29');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` enum('published','draft') DEFAULT 'draft',
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `excerpt`, `content`, `featured_image`, `author_id`, `meta_title`, `meta_description`, `status`, `published_at`, `created_at`) VALUES
(1, 'Miért a Pompadour a férfi frizurák örök királya?', 'miert-a-pompadour-a-ferfi-frizurak-orok-kiralya', 'Sokan kérdezitek, mi az a stílus, ami minden korszakban megállja a helyét. A válasz egyszerű: a Pompadour.', '<p data-path-to-node=\"5\">Sokan k&eacute;rdezitek, mi az a st&iacute;lus, ami minden korszakban meg&aacute;llja a hely&eacute;t. A v&aacute;lasz egyszerű: a <strong data-path-to-node=\"5\" data-index-in-node=\"104\">Pompadour</strong>. Legyen sz&oacute; az 50-es &eacute;vek rockabilly korszak&aacute;r&oacute;l vagy a mai modern, \"fade\" &aacute;tmenettel kombin&aacute;lt v&aacute;ltozatokr&oacute;l, ez a v&aacute;g&aacute;s tekint&eacute;lyt &eacute;s st&iacute;lust sug&aacute;roz.</p>\r\n<p data-path-to-node=\"6\"><strong data-path-to-node=\"6\" data-index-in-node=\"0\">Mi a titka?</strong></p>\r\n<ul data-path-to-node=\"7\">\r\n<li>\r\n<p data-path-to-node=\"7,0,0\"><strong data-path-to-node=\"7,0,0\" data-index-in-node=\"0\">Volumen:</strong> Megny&uacute;jtja az arcot, &iacute;gy karakteresebb megjelen&eacute;st ad.</p>\r\n</li>\r\n<li>\r\n<p data-path-to-node=\"7,1,0\"><strong data-path-to-node=\"7,1,0\" data-index-in-node=\"0\">Vari&aacute;lhat&oacute;s&aacute;g:</strong> Hordhatod f&eacute;nyes pom&aacute;d&eacute;val a klasszikus hat&aacute;s&eacute;rt, vagy matt waxszal a laz&aacute;bb, h&eacute;tk&ouml;znapi megjelen&eacute;s&eacute;rt.</p>\r\n</li>\r\n<li>\r\n<p data-path-to-node=\"7,2,0\"><strong data-path-to-node=\"7,2,0\" data-index-in-node=\"0\">Szem&eacute;lyre szabhat&oacute;s&aacute;g:</strong> A borb&eacute;lyod pontosan az arcform&aacute;dhoz tudja igaz&iacute;tani az oldals&oacute; r&eacute;szek hossz&aacute;t.</p>\r\n</li>\r\n</ul>\r\n<p data-path-to-node=\"8\">Ha valami olyat keresel, ami az irod&aacute;ban &eacute;s az esti s&ouml;r&ouml;z&eacute;sn&eacute;l is j&oacute;l mutat, a Pompadourral nem lőhetsz mell&eacute;.</p>', 'post_1775665243_69d6805b6443f.png', 1, 'Miért a Pompadour a férfi frizurák örök királya?', 'Sokan kérdezitek, mi az a stílus, ami minden korszakban megállja a helyét. A válasz egyszerű: a Pompadour. Legyen szó az 50-es évek rockabilly korszak', 'published', '2026-04-08 16:20:43', '2026-04-08 16:20:43'),
(2, '3 hiba, amit a legtöbb férfi elkövet a szakállápolás során', '3-hiba-amit-a-legtobb-ferfi-elkovet-a-szakallapolas-soran', 'Növeszteni egy szakállat könnyű, de karbantartani már művészet. Sokan ott rontják el, hogy hagyják \"csak úgy\" nőni a szőrt', '<p data-path-to-node=\"13\">N&ouml;veszteni egy szak&aacute;llat k&ouml;nnyű, de <strong data-path-to-node=\"13\" data-index-in-node=\"44\">karbantartani</strong> m&aacute;r műv&eacute;szet. Sokan ott rontj&aacute;k el, hogy hagyj&aacute;k \"csak &uacute;gy\" nőni a szőrt, azt&aacute;n csod&aacute;lkoznak, ha viszket vagy rendezetlennek tűnik. &Iacute;me a leggyakoribb hib&aacute;k:</p>\r\n<ol start=\"1\" data-path-to-node=\"14\">\r\n<li>\r\n<p data-path-to-node=\"14,0,0\"><strong data-path-to-node=\"14,0,0\" data-index-in-node=\"0\">A szak&aacute;llolaj hanyagol&aacute;sa:</strong> A szak&aacute;llolaj nem csak a szőrnek, hanem alatta a bőrnek is kell. Megakad&aacute;lyozza a korp&aacute;sod&aacute;st &eacute;s a kellemetlen viszket&eacute;st.</p>\r\n</li>\r\n<li>\r\n<p data-path-to-node=\"14,1,0\"><strong data-path-to-node=\"14,1,0\" data-index-in-node=\"0\">T&uacute;l magas nyakvonal:</strong> Ha t&uacute;l magasra borotv&aacute;lod a nyakvonalat, az arcod kerekebbnek tűnhet. K&eacute;rd meg a borb&eacute;lyodat, hogy jel&ouml;lje ki neked az ide&aacute;lis &iacute;vet!</p>\r\n</li>\r\n<li>\r\n<p data-path-to-node=\"14,2,0\"><strong data-path-to-node=\"14,2,0\" data-index-in-node=\"0\">Forr&oacute; vizes mos&aacute;s:</strong> A t&uacute;l forr&oacute; v&iacute;z kisz&aacute;r&iacute;tja a szőrsz&aacute;lakat, amitől azok t&ouml;redezettek &eacute;s sprődek lesznek. Haszn&aacute;lj langyos vizet &eacute;s speci&aacute;lis szak&aacute;llsampont!</p>\r\n</li>\r\n</ol>\r\n<p data-path-to-node=\"15\">Vigy&aacute;zz az arcszőrzetedre, mert ez az arcod &eacute;kszere!</p>', 'post_1775665424_69d68110d487c.png', 1, '3 hiba, amit a legtöbb férfi elkövet a szakállápolás során', 'Növeszteni egy szakállat könnyű, de karbantartani már művészet. Sokan ott rontják el, hogy hagyják \"csak úgy\" nőni a szőrt', 'published', '2026-04-08 16:23:44', '2026-04-08 16:23:44'),
(3, 'Több, mint egy hajvágás: A borbélyszalon mint közösségi tér', 'tobb-mint-egy-hajvagas-a-borbelyszalon-mint-kozossegi-ter', 'Régen a borbélyszalon volt az a hely, ahol a férfiak megvitatták a világ dolgait, a politikát és a sportot. Ma, a rohanó világban ez a funkció fontosabb, mint valaha.', '<p data-path-to-node=\"20\">R&eacute;gen a borb&eacute;lyszalon volt az a hely, ahol a f&eacute;rfiak megvitatt&aacute;k a vil&aacute;g dolgait, a politik&aacute;t &eacute;s a sportot. Ma, a rohan&oacute; vil&aacute;gban ez a funkci&oacute; fontosabb, mint valaha.</p>\r\n<p data-path-to-node=\"21\">N&aacute;lunk a v&aacute;g&aacute;s nem csak 30 perc g&eacute;pz&uacute;g&aacute;st jelent. Ez az a f&eacute;l&oacute;ra-&oacute;ra a napodban, amikor:</p>\r\n<ul data-path-to-node=\"22\">\r\n<li>\r\n<p data-path-to-node=\"22,0,0\">Kikapcsolhatod a telefonodat.</p>\r\n</li>\r\n<li>\r\n<p data-path-to-node=\"22,1,0\">Ihatsz egy j&oacute; k&aacute;v&eacute;t vagy egy poh&aacute;r whiskyt.</p>\r\n</li>\r\n<li>\r\n<p data-path-to-node=\"22,2,0\">Olyan emberekkel besz&eacute;lgethetsz, akik hasonl&oacute;an gondolkodnak.</p>\r\n</li>\r\n</ul>\r\n<p data-path-to-node=\"23\">A borb&eacute;lyszalon a modern f&eacute;rfi \"mened&eacute;ke\". Itt nem csak a hajad friss&uuml;l fel, hanem a gondolataid is. N&aacute;lunk te nem csak egy sorsz&aacute;m vagy, hanem a k&ouml;z&ouml;ss&eacute;g r&eacute;sze. Te mikor j&aacute;rt&aacute;l n&aacute;lunk utolj&aacute;ra egy j&oacute; besz&eacute;lget&eacute;sre?</p>', 'post_1775665564_69d6819cef21d.png', 1, 'Több, mint egy hajvágás: A borbélyszalon mint közösségi tér', 'Régen a borbélyszalon volt az a hely, ahol a férfiak megvitatták a világ dolgait, a politikát és a sportot. Ma, a rohanó világban ez a funkció fontosabb, mint', 'published', '2026-04-08 16:26:04', '2026-04-08 16:26:04');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `post_categories`
--

CREATE TABLE `post_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`, `slug`, `description`, `sort_order`) VALUES
(1, 'Hajvágás', 'hajvagas', NULL, 1),
(2, 'Szakáll', 'szakall', NULL, 2),
(3, 'Tippek', 'tippek', NULL, 3),
(4, 'Hírek', 'hirek', NULL, 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `post_category_pivot`
--

CREATE TABLE `post_category_pivot` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `post_category_pivot`
--

INSERT INTO `post_category_pivot` (`post_id`, `category_id`) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `post_tags`
--

CREATE TABLE `post_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `post_tags`
--

INSERT INTO `post_tags` (`id`, `name`, `slug`) VALUES
(1, 'Pompadour', 'pompadour'),
(2, 'hajvágás', 'hajvagas'),
(3, 'szakállápolás', 'szakallapolas'),
(4, 'szakállolaj', 'szakallolaj');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `post_tag_pivot`
--

CREATE TABLE `post_tag_pivot` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `post_tag_pivot`
--

INSERT INTO `post_tag_pivot` (`post_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `schedule_exceptions`
--

CREATE TABLE `schedule_exceptions` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `exception_date` date NOT NULL,
  `is_closed` tinyint(1) DEFAULT 1,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 30,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `category` varchar(50) DEFAULT 'Hajvágás',
  `sort_order` int(11) DEFAULT 0,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `duration`, `price`, `category`, `sort_order`, `active`) VALUES
(1, 'Hajvágás', 'Klasszikus férfi hajvágás ollóval vagy géppel.', 30, 3500.00, 'Hajvágás', 1, 1),
(2, 'Hajvágás + Szakálligazítás', 'Hajvágás és szakáll formázás egyben.', 45, 5000.00, 'Kombinált', 2, 1),
(3, 'Borotválkozás', 'Klasszikus borotválkozás meleg törülközővel.', 30, 3000.00, 'Borotválkozás', 3, 1),
(4, 'Szakállformázás', 'Szakáll igazítás és formázás.', 20, 2000.00, 'Szakáll', 4, 1),
(5, 'Gyerek hajvágás', 'Gyerek hajvágás 12 éves korig.', 20, 2500.00, 'Hajvágás', 5, 1),
(6, 'VIP csomag', 'Hajvágás + borotválkozás + pakolás.', 60, 7500.00, 'Prémium', 6, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `settings`
--

CREATE TABLE `settings` (
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `settings`
--

INSERT INTO `settings` (`setting_key`, `setting_value`) VALUES
('barbers_label', 'Csapatunk'),
('barbers_limit', '4'),
('barbers_show', '1'),
('barbers_subtitle', 'Tapasztalt, szenvedélyes mesterek, akik a tökéletes stílusért dolgoznak minden nap.'),
('barbers_title', 'Ismerd meg Borbélyainkat'),
('blog_label', 'Hírek & Tippek'),
('blog_limit', '3'),
('blog_show', '1'),
('blog_title', 'Legújabb Bejegyzéseink'),
('booking_advance_days', '30'),
('booking_close_time', '18:00'),
('booking_interval', '30'),
('booking_open_time', '09:00'),
('contact_label', 'Elérhetőség'),
('contact_show', '1'),
('contact_title', 'Nyitvatartás & Kapcsolat'),
('cta_bg_image', ''),
('cta_btn1_text', 'Időpontfoglalás'),
('cta_btn1_url', '/barber/foglalas'),
('cta_btn2_text', 'Hívj minket'),
('cta_label', 'Ne várj tovább'),
('cta_show', '1'),
('cta_text', 'Válaszd ki kedvenc borbélyodat, a számodra megfelelő időpontot, és mi elvégzünk a többit.'),
('cta_title', 'Foglald le a helyed még ma!'),
('facebook_url', ''),
('feature1_icon', 'fas fa-medal'),
('feature1_text', 'Borbélyaink évek óta dolgoznak a szakmában, folyamatosan képzik magukat a legújabb trendekre.'),
('feature1_title', 'Tapasztalt mesterek'),
('feature2_icon', 'fas fa-clock'),
('feature2_text', 'Foglalj időpontot 0-24 óráig, akár hétvégén is. Azonnali visszaigazolás emailben.'),
('feature2_title', 'Online foglalás'),
('feature3_icon', 'fas fa-star'),
('feature3_text', 'Csak a legjobb hajápolási termékeket használjuk, amelyek gondoskodnak hajad egészségéről.'),
('feature3_title', 'Prémium termékek'),
('feature4_icon', 'fas fa-heart'),
('feature4_text', 'Minden ügyfelet egyénileg kezelünk. Meghallgatjuk az elképzeléseidet és valóra váltjuk.'),
('feature4_title', 'Személyre szabott'),
('features_label', 'Miért minket válassz'),
('features_show', '1'),
('features_title', 'A különbség amit érezni fogsz'),
('footer_text', '© 2026 Barber Shop. Minden jog fenntartva.'),
('google_maps_embed', ''),
('hero_bg_image', ''),
('hero_btn1_text', 'Időpontfoglalás'),
('hero_btn1_url', '/foglalas'),
('hero_btn2_text', 'Szolgáltatások'),
('hero_btn2_url', '#services'),
('hero_label', 'Prémium Barber Shop Neked!'),
('hero_stat1_label', 'Év tapasztalat'),
('hero_stat1_num', '10+'),
('hero_stat2_label', 'Mesterborbély'),
('hero_stat3_label', 'Elégedett ügyfél'),
('hero_stat3_num', '500+'),
('hero_subtitle', 'Tapasztalt mesterborbélyaink gondoskodnak arról, hogy mindig a legjobb formádat hozd. Foglalj időpontot online – gyorsan és egyszerűen.'),
('hero_title_line1', 'A tökéletes stílus'),
('hero_title_line2', 'a te kezedben van.'),
('instagram_url', ''),
('map_type', 'openstreet'),
('meta_description', 'Prémium barber shop időpont foglalás online.'),
('osm_height', '400'),
('osm_lat', '47.499461'),
('osm_lng', '19.055271'),
('osm_marker_label', 'Barber Shop'),
('osm_zoom', '16'),
('services_label', 'Amit kínálunk'),
('services_limit', '6'),
('services_show', '1'),
('services_subtitle', 'Minden szolgáltatásunkat a legmagasabb minőségi szintén nyújtjuk, profi eszközökkel és tapasztalt mesterekkel.'),
('services_title', 'Prémium Szolgáltatásaink'),
('site_address', '1061 Budapest, Andrássy út 1.'),
('site_email', 'weboldalajanlatok@gmail.com'),
('site_favicon', ''),
('site_logo', ''),
('site_name', 'Barber Shop'),
('site_phone', '+36 1 234 5678'),
('site_tagline', 'Prémium hajvágás és borotválkozás');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `bio` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `staff`
--

INSERT INTO `staff` (`id`, `name`, `bio`, `photo`, `email`, `phone`, `sort_order`, `active`, `created_at`) VALUES
(1, 'Kovács Péter', 'Tapasztalt borbély, 8 év szakmai tapasztalattal.', 'staff_1775663781_69d67aa505068.jpg', 'peter@barber.hu', '', 1, 1, '2026-04-08 11:31:19'),
(2, 'Nagy Gábor', 'Klasszikus borotválkozás és modern stílusok mestere.', 'staff_1775663789_69d67aad4ef48.jpg', 'gabor@barber.hu', '', 2, 1, '2026-04-08 11:31:19'),
(3, 'Tóth Balázs', 'Divatos hajvágások és szakálligazítás specialistája.', 'staff_1775663876_69d67b0427f28.jpg', 'balazs@barber.hu', '', 3, 1, '2026-04-08 11:31:19');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `staff_services`
--

CREATE TABLE `staff_services` (
  `staff_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `staff_services`
--

INSERT INTO `staff_services` (`staff_id`, `service_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('superadmin','admin','editor') DEFAULT 'admin',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `email`, `role`, `active`, `created_at`) VALUES
(1, 'sarizoltan', '$2y$10$0aQQ1zUALnvFGzobeb56j.jh7.17i3ZTUdVzsG.pizYh.HvHN7mkS', 'weboldalajanlatok@gmail.com', 'superadmin', 1, '2026-04-08 11:31:18');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `working_hours`
--

CREATE TABLE `working_hours` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `day_of_week` tinyint(4) NOT NULL,
  `start_time` time NOT NULL DEFAULT '09:00:00',
  `end_time` time NOT NULL DEFAULT '18:00:00',
  `is_day_off` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `working_hours`
--

INSERT INTO `working_hours` (`id`, `staff_id`, `day_of_week`, `start_time`, `end_time`, `is_day_off`) VALUES
(1, 1, 0, '09:00:00', '18:00:00', 0),
(2, 1, 1, '09:00:00', '18:00:00', 0),
(3, 1, 2, '09:00:00', '18:00:00', 0),
(4, 1, 3, '09:00:00', '18:00:00', 0),
(5, 1, 4, '09:00:00', '18:00:00', 0),
(6, 1, 5, '09:00:00', '16:00:00', 0),
(7, 1, 6, '00:00:00', '00:00:00', 1),
(8, 2, 0, '09:00:00', '18:00:00', 0),
(9, 2, 1, '09:00:00', '18:00:00', 0),
(10, 2, 2, '09:00:00', '18:00:00', 0),
(11, 2, 3, '09:00:00', '18:00:00', 0),
(12, 2, 4, '09:00:00', '18:00:00', 0),
(13, 2, 5, '09:00:00', '16:00:00', 0),
(14, 2, 6, '00:00:00', '00:00:00', 1),
(15, 3, 0, '09:00:00', '18:00:00', 0),
(16, 3, 1, '09:00:00', '18:00:00', 0),
(17, 3, 2, '09:00:00', '18:00:00', 0),
(18, 3, 3, '09:00:00', '18:00:00', 0),
(19, 3, 4, '09:00:00', '18:00:00', 0),
(20, 3, 5, '09:00:00', '16:00:00', 0),
(21, 3, 6, '00:00:00', '00:00:00', 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_ref` (`booking_ref`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `service_id` (`service_id`);

--
-- A tábla indexei `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- A tábla indexei `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- A tábla indexei `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `author_id` (`author_id`);

--
-- A tábla indexei `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- A tábla indexei `post_category_pivot`
--
ALTER TABLE `post_category_pivot`
  ADD PRIMARY KEY (`post_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- A tábla indexei `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- A tábla indexei `post_tag_pivot`
--
ALTER TABLE `post_tag_pivot`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- A tábla indexei `schedule_exceptions`
--
ALTER TABLE `schedule_exceptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- A tábla indexei `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- A tábla indexei `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `staff_services`
--
ALTER TABLE `staff_services`
  ADD PRIMARY KEY (`staff_id`,`service_id`),
  ADD KEY `service_id` (`service_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- A tábla indexei `working_hours`
--
ALTER TABLE `working_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT a táblához `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `schedule_exceptions`
--
ALTER TABLE `schedule_exceptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `working_hours`
--
ALTER TABLE `working_hours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Megkötések a táblához `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `post_category_pivot`
--
ALTER TABLE `post_category_pivot`
  ADD CONSTRAINT `post_category_pivot_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_category_pivot_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `post_tag_pivot`
--
ALTER TABLE `post_tag_pivot`
  ADD CONSTRAINT `post_tag_pivot_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_pivot_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `post_tags` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `schedule_exceptions`
--
ALTER TABLE `schedule_exceptions`
  ADD CONSTRAINT `schedule_exceptions_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `staff_services`
--
ALTER TABLE `staff_services`
  ADD CONSTRAINT `staff_services_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `working_hours`
--
ALTER TABLE `working_hours`
  ADD CONSTRAINT `working_hours_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
