-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 26, 2018 at 09:00 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nhommytrinh`
--

-- --------------------------------------------------------

--
-- Table structure for table `bestsellproduct`
--

CREATE TABLE `bestsellproduct` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requiring_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requiring_entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'spbc', '2'),
(2, 'home-slider-main-speed', '4000'),
(4, 'contact-facebook', 'https://www.facebook.com/Operamart.vn/'),
(3, 'phi-van-chuyen', '0'),
(5, 'contact-youtube', ''),
(18, 'email_subject_editor', 'dnduc456@gmail.com'),
(6, 'contact-zalo', ''),
(7, 'monanngon-slider-main-speed', '1000'),
(8, 'tintuc-slider-main-speed', '10000'),
(9, 'image-library-json', '[{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-07.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-07.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-07.jpg\",\"use_date\":\"June 20th 2018, 5:56:55 pm\"},{\"image\":\"https://192.168.1.126:1234/upload/27752534_394100181037914_3336706053970385206_n.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/27752534_394100181037914_3336706053970385206_n.jpg\",\"folder\":\"Upload\",\"name\":\"27752534_394100181037914_3336706053970385206_n.jpg\",\"use_date\":\"June 20th 2018, 5:56:49 pm\"},{\"image\":\"https://192.168.1.126:1234/upload/29341601_1622151224500723_1303803572_n.png\",\"thumb\":\"https://192.168.1.126:1234/upload/29341601_1622151224500723_1303803572_n.png\",\"folder\":\"Upload\",\"name\":\"29341601_1622151224500723_1303803572_n.png\",\"use_date\":\"June 20th 2018, 5:55:45 pm\"},{\"image\":\"https://192.168.1.126:1234/upload/29570734_410119989459515_6921470854071181598_n.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/29570734_410119989459515_6921470854071181598_n.jpg\",\"folder\":\"Upload\",\"name\":\"29570734_410119989459515_6921470854071181598_n.jpg\",\"use_date\":\"June 19th 2018, 10:35:19 am\"},{\"image\":\"https://192.168.1.126:1234/upload/2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/2.jpg\",\"folder\":\"Upload\",\"name\":\"2.jpg\",\"use_date\":\"June 19th 2018, 10:35:13 am\"},{\"image\":\"https://192.168.1.126:1234/upload/1920x780-3.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/1920x780-3.jpg\",\"folder\":\"Upload\",\"name\":\"1920x780-3.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/1920x780.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/1920x780.jpg\",\"folder\":\"Upload\",\"name\":\"1920x780.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/bo-cuon-mia-nuong.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/bo-cuon-mia-nuong.jpg\",\"folder\":\"Upload\",\"name\":\"bo-cuon-mia-nuong.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/123-1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/123-1.jpg\",\"folder\":\"Upload\",\"name\":\"123-1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/28378567_400943673686898_899738889780910696_n.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/28378567_400943673686898_899738889780910696_n.jpg\",\"folder\":\"Upload\",\"name\":\"28378567_400943673686898_899738889780910696_n.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/!happy-face.png\",\"thumb\":\"https://192.168.1.126:1234/upload/!happy-face.png\",\"folder\":\"Upload\",\"name\":\"!happy-face.png\"},{\"image\":\"https://192.168.1.126:1234/upload/tuong_ot_Sriracha_Sriracha_Chilli_Sauce_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/tuong_ot_Sriracha_Sriracha_Chilli_Sauce_2.jpg\",\"folder\":\"Upload\",\"name\":\"tuong_ot_Sriracha_Sriracha_Chilli_Sauce_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/3.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/3.jpg\",\"folder\":\"Upload\",\"name\":\"3.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/31131021_1650262571689588_2464446809901105152_n.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/31131021_1650262571689588_2464446809901105152_n.jpg\",\"folder\":\"Upload\",\"name\":\"31131021_1650262571689588_2464446809901105152_n.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/31206388_1650262575022921_7182554829363871744_n.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/31206388_1650262575022921_7182554829363871744_n.jpg\",\"folder\":\"Upload\",\"name\":\"31206388_1650262575022921_7182554829363871744_n.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/4.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/4.jpg\",\"folder\":\"Upload\",\"name\":\"4.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/6.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/6.jpg\",\"folder\":\"Upload\",\"name\":\"6.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/898602397e5303d74fbd571cf0dda231.jpg.png\",\"thumb\":\"https://192.168.1.126:1234/upload/898602397e5303d74fbd571cf0dda231.jpg.png\",\"folder\":\"Upload\",\"name\":\"898602397e5303d74fbd571cf0dda231.jpg.png\"},{\"image\":\"https://192.168.1.126:1234/upload/Accenture-TPM-Icon.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Accenture-TPM-Icon.png\",\"folder\":\"Upload\",\"name\":\"Accenture-TPM-Icon.png\"},{\"image\":\"https://192.168.1.126:1234/upload/CD33111652-SP 485 x 550-09.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/CD33111652-SP 485 x 550-09.jpg\",\"folder\":\"Upload\",\"name\":\"CD33111652-SP 485 x 550-09.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/CD33114002-SP 485 x 550-08.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/CD33114002-SP 485 x 550-08.jpg\",\"folder\":\"Upload\",\"name\":\"CD33114002-SP 485 x 550-08.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Canh-ga-2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Canh-ga-2.jpg\",\"folder\":\"Upload\",\"name\":\"Canh-ga-2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/DA33208003-SP 485 x 550-01.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/DA33208003-SP 485 x 550-01.jpg\",\"folder\":\"Upload\",\"name\":\"DA33208003-SP 485 x 550-01.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/DA33208004-SP 485 x 550-02.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/DA33208004-SP 485 x 550-02.jpg\",\"folder\":\"Upload\",\"name\":\"DA33208004-SP 485 x 550-02.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/DA33208005-SP 485 x 550-03.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/DA33208005-SP 485 x 550-03.jpg\",\"folder\":\"Upload\",\"name\":\"DA33208005-SP 485 x 550-03.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Gia-vi-cao-cap-anh-dai-dien.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Gia-vi-cao-cap-anh-dai-dien.jpg\",\"folder\":\"Upload\",\"name\":\"Gia-vi-cao-cap-anh-dai-dien.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Gia-vi-cao-cap.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Gia-vi-cao-cap.jpg\",\"folder\":\"Upload\",\"name\":\"Gia-vi-cao-cap.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/IMG_2159-02-04-18-03-48.PNG\",\"thumb\":\"https://192.168.1.126:1234/upload/IMG_2159-02-04-18-03-48.PNG\",\"folder\":\"Upload\",\"name\":\"IMG_2159-02-04-18-03-48.PNG\"},{\"image\":\"https://192.168.1.126:1234/upload/IMG_2570-09-05-18-11-33.JPG\",\"thumb\":\"https://192.168.1.126:1234/upload/IMG_2570-09-05-18-11-33.JPG\",\"folder\":\"Upload\",\"name\":\"IMG_2570-09-05-18-11-33.JPG\"},{\"image\":\"https://192.168.1.126:1234/upload/IMG_3219.PNG\",\"thumb\":\"https://192.168.1.126:1234/upload/IMG_3219.PNG\",\"folder\":\"Upload\",\"name\":\"IMG_3219.PNG\"},{\"image\":\"https://192.168.1.126:1234/upload/Lazada.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Lazada.jpg\",\"folder\":\"Upload\",\"name\":\"Lazada.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Logo fb.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Logo fb.png\",\"folder\":\"Upload\",\"name\":\"Logo fb.png\"},{\"image\":\"https://192.168.1.126:1234/upload/Mackerel_In_Tomato_Sauce_ca_nuc_sot_ca_155g.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Mackerel_In_Tomato_Sauce_ca_nuc_sot_ca_155g.jpg\",\"folder\":\"Upload\",\"name\":\"Mackerel_In_Tomato_Sauce_ca_nuc_sot_ca_155g.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Mackerel_In_Tomato_Sauce_ca_nuc_sot_ca_155g_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Mackerel_In_Tomato_Sauce_ca_nuc_sot_ca_155g_2.jpg\",\"folder\":\"Upload\",\"name\":\"Mackerel_In_Tomato_Sauce_ca_nuc_sot_ca_155g_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Mon an 1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Mon an 1.jpg\",\"folder\":\"Upload\",\"name\":\"Mon an 1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/NM21306015-SP 485 x 550-04.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/NM21306015-SP 485 x 550-04.jpg\",\"folder\":\"Upload\",\"name\":\"NM21306015-SP 485 x 550-04.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/NM21405024-SP 485 x 550-11.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/NM21405024-SP 485 x 550-11.jpg\",\"folder\":\"Upload\",\"name\":\"NM21405024-SP 485 x 550-11.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/NM21805007-SP 485 x 550-05.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/NM21805007-SP 485 x 550-05.jpg\",\"folder\":\"Upload\",\"name\":\"NM21805007-SP 485 x 550-05.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/NM21806007-SP 485 x 550-13.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/NM21806007-SP 485 x 550-13.jpg\",\"folder\":\"Upload\",\"name\":\"NM21806007-SP 485 x 550-13.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/NM40305002-SP 485 x 550-06.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/NM40305002-SP 485 x 550-06.jpg\",\"folder\":\"Upload\",\"name\":\"NM40305002-SP 485 x 550-06.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/NM40316002-SP 485 x 550-12.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/NM40316002-SP 485 x 550-12.jpg\",\"folder\":\"Upload\",\"name\":\"NM40316002-SP 485 x 550-12.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/NM404010002-SP 485 x 550-10.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/NM404010002-SP 485 x 550-10.jpg\",\"folder\":\"Upload\",\"name\":\"NM404010002-SP 485 x 550-10.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/NM40416002-SP 485 x 550-07.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/NM40416002-SP 485 x 550-07.jpg\",\"folder\":\"Upload\",\"name\":\"NM40416002-SP 485 x 550-07.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Nuoc-mam-Phan-thiet.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Nuoc-mam-Phan-thiet.jpg\",\"folder\":\"Upload\",\"name\":\"Nuoc-mam-Phan-thiet.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Nuoc-mam-Phan-thiet_anh_dai_dien.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Nuoc-mam-Phan-thiet_anh_dai_dien.jpg\",\"folder\":\"Upload\",\"name\":\"Nuoc-mam-Phan-thiet_anh_dai_dien.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Nuoc_mam_hong_phu_anh dai_dien.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Nuoc_mam_hong_phu_anh dai_dien.jpg\",\"folder\":\"Upload\",\"name\":\"Nuoc_mam_hong_phu_anh dai_dien.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Opera_mart_trang_chu_dau_an_opera.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Opera_mart_trang_chu_dau_an_opera.jpg\",\"folder\":\"Upload\",\"name\":\"Opera_mart_trang_chu_dau_an_opera.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Opera_mart_trang_chu_gia_vi_thai.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Opera_mart_trang_chu_gia_vi_thai.jpg\",\"folder\":\"Upload\",\"name\":\"Opera_mart_trang_chu_gia_vi_thai.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Opera_mart_trang_chu_nuoc_cot_dua_thai_coconut.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Opera_mart_trang_chu_nuoc_cot_dua_thai_coconut.jpg\",\"folder\":\"Upload\",\"name\":\"Opera_mart_trang_chu_nuoc_cot_dua_thai_coconut.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Opera_mart_trang_chu_nuoc_mam_phan_thiet_hong_phu.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Opera_mart_trang_chu_nuoc_mam_phan_thiet_hong_phu.jpg\",\"folder\":\"Upload\",\"name\":\"Opera_mart_trang_chu_nuoc_mam_phan_thiet_hong_phu.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Opera_mart_trang_chu_nuoc_mam_phan_thiet_thai_long.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Opera_mart_trang_chu_nuoc_mam_phan_thiet_thai_long.jpg\",\"folder\":\"Upload\",\"name\":\"Opera_mart_trang_chu_nuoc_mam_phan_thiet_thai_long.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Picture1.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Picture1.png\",\"folder\":\"Upload\",\"name\":\"Picture1.png\"},{\"image\":\"https://192.168.1.126:1234/upload/Picture2.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Picture2.png\",\"folder\":\"Upload\",\"name\":\"Picture2.png\"},{\"image\":\"https://192.168.1.126:1234/upload/Picture3.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Picture3.png\",\"folder\":\"Upload\",\"name\":\"Picture3.png\"},{\"image\":\"https://192.168.1.126:1234/upload/Picture4.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Picture4.png\",\"folder\":\"Upload\",\"name\":\"Picture4.png\"},{\"image\":\"https://192.168.1.126:1234/upload/Picture5.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Picture5.png\",\"folder\":\"Upload\",\"name\":\"Picture5.png\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-01.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-01.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-01.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-02.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-02.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-02.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-03.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-03.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-03.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-04.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-04.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-04.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-05.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-05.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-05.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-06.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-06.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-06.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/123.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/123.jpg\",\"folder\":\"Upload\",\"name\":\"123.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-08.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-08.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-08.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-09.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-09.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-09.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-10.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-10.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-10.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-11.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-11.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-11.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-12.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-12.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-12.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/SP 485 x 550-13.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/SP 485 x 550-13.jpg\",\"folder\":\"Upload\",\"name\":\"SP 485 x 550-13.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Screen Shot 2018-04-04 at 11.46.25 AM.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Screen Shot 2018-04-04 at 11.46.25 AM.png\",\"folder\":\"Upload\",\"name\":\"Screen Shot 2018-04-04 at 11.46.25 AM.png\"},{\"image\":\"https://192.168.1.126:1234/upload/Screen Shot 2018-04-07 at 1.04.27 AM.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Screen Shot 2018-04-07 at 1.04.27 AM.png\",\"folder\":\"Upload\",\"name\":\"Screen Shot 2018-04-07 at 1.04.27 AM.png\"},{\"image\":\"https://192.168.1.126:1234/upload/Screen Shot 2018-04-09 at 11.07.03 PM.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Screen Shot 2018-04-09 at 11.07.03 PM.png\",\"folder\":\"Upload\",\"name\":\"Screen Shot 2018-04-09 at 11.07.03 PM.png\"},{\"image\":\"https://192.168.1.126:1234/upload/Screen Shot 2018-04-09 at 5.07.59 PM.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Screen Shot 2018-04-09 at 5.07.59 PM.png\",\"folder\":\"Upload\",\"name\":\"Screen Shot 2018-04-09 at 5.07.59 PM.png\"},{\"image\":\"https://192.168.1.126:1234/upload/Screen Shot 2018-04-10 at 6.53.35 AM.png\",\"thumb\":\"https://192.168.1.126:1234/upload/Screen Shot 2018-04-10 at 6.53.35 AM.png\",\"folder\":\"Upload\",\"name\":\"Screen Shot 2018-04-10 at 6.53.35 AM.png\"},{\"image\":\"https://192.168.1.126:1234/upload/Sendo.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Sendo.jpg\",\"folder\":\"Upload\",\"name\":\"Sendo.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Shoppe.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Shoppe.jpg\",\"folder\":\"Upload\",\"name\":\"Shoppe.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Sot_Teriyaki_Teriyaki_Sauce_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Sot_Teriyaki_Teriyaki_Sauce_1.jpg\",\"folder\":\"Upload\",\"name\":\"Sot_Teriyaki_Teriyaki_Sauce_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Sot_Teriyaki_Teriyaki_Sauce_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Sot_Teriyaki_Teriyaki_Sauce_2.jpg\",\"folder\":\"Upload\",\"name\":\"Sot_Teriyaki_Teriyaki_Sauce_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Sot_Tom_Yum_Tom_Yum_Paste_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Sot_Tom_Yum_Tom_Yum_Paste_1.jpg\",\"folder\":\"Upload\",\"name\":\"Sot_Tom_Yum_Tom_Yum_Paste_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Sot_Tom_Yum_Tom_Yum_Paste_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Sot_Tom_Yum_Tom_Yum_Paste_2.jpg\",\"folder\":\"Upload\",\"name\":\"Sot_Tom_Yum_Tom_Yum_Paste_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Sot_XO_XO_Sauce_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Sot_XO_XO_Sauce_1.jpg\",\"folder\":\"Upload\",\"name\":\"Sot_XO_XO_Sauce_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Sot_cay_Teriyaki_Spicy_Teriyaki_Sauce_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Sot_cay_Teriyaki_Spicy_Teriyaki_Sauce_1.jpg\",\"folder\":\"Upload\",\"name\":\"Sot_cay_Teriyaki_Spicy_Teriyaki_Sauce_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Sot_cay_Teriyaki_Spicy_Teriyaki_Sauce_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Sot_cay_Teriyaki_Spicy_Teriyaki_Sauce_2.jpg\",\"folder\":\"Upload\",\"name\":\"Sot_cay_Teriyaki_Spicy_Teriyaki_Sauce_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Sot_tom_cay_thai_Thai_Shrimp_Paste_With_Chilli_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Sot_tom_cay_thai_Thai_Shrimp_Paste_With_Chilli_1.jpg\",\"folder\":\"Upload\",\"name\":\"Sot_tom_cay_thai_Thai_Shrimp_Paste_With_Chilli_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Sot_tron_Salad_du_du_Papaya_Salad_Dressing_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Sot_tron_Salad_du_du_Papaya_Salad_Dressing_1.jpg\",\"folder\":\"Upload\",\"name\":\"Sot_tron_Salad_du_du_Papaya_Salad_Dressing_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Sot_tron_Salad_du_du_Papaya_Salad_Dressing_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Sot_tron_Salad_du_du_Papaya_Salad_Dressing_2.jpg\",\"folder\":\"Upload\",\"name\":\"Sot_tron_Salad_du_du_Papaya_Salad_Dressing_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_3.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_3.jpg\",\"folder\":\"Upload\",\"name\":\"Thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_3.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/Tiki.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/Tiki.jpg\",\"folder\":\"Upload\",\"name\":\"Tiki.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/anh_dai_dien_thu_pham_cao_cap.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/anh_dai_dien_thu_pham_cao_cap.jpg\",\"folder\":\"Upload\",\"name\":\"anh_dai_dien_thu_pham_cao_cap.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/banner_nganh_hang_nuoc_mam_hong_phu.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/banner_nganh_hang_nuoc_mam_hong_phu.jpg\",\"folder\":\"Upload\",\"name\":\"banner_nganh_hang_nuoc_mam_hong_phu.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/banner_nganh_hang_nuoc_mam_thai_Long.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/banner_nganh_hang_nuoc_mam_thai_Long.jpg\",\"folder\":\"Upload\",\"name\":\"banner_nganh_hang_nuoc_mam_thai_Long.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/banner_thuc_pham_cao_cap.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/banner_thuc_pham_cao_cap.jpg\",\"folder\":\"Upload\",\"name\":\"banner_thuc_pham_cao_cap.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/bbd34c4-Screen_Shot_2017-12-06_at_2.53.46_PM.png\",\"thumb\":\"https://192.168.1.126:1234/upload/bbd34c4-Screen_Shot_2017-12-06_at_2.53.46_PM.png\",\"folder\":\"Upload\",\"name\":\"bbd34c4-Screen_Shot_2017-12-06_at_2.53.46_PM.png\"},{\"image\":\"https://192.168.1.126:1234/upload/bo-cuon-mia-nuong-1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/bo-cuon-mia-nuong-1.jpg\",\"folder\":\"Upload\",\"name\":\"bo-cuon-mia-nuong-1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/bo-cuon-mia-nuong-2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/bo-cuon-mia-nuong-2.jpg\",\"folder\":\"Upload\",\"name\":\"bo-cuon-mia-nuong-2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/1920x780-2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/1920x780-2.jpg\",\"folder\":\"Upload\",\"name\":\"1920x780-2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/ca_bao_nha_ban_Japan_Katsuobushi_2gx8goi.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/ca_bao_nha_ban_Japan_Katsuobushi_2gx8goi.jpg\",\"folder\":\"Upload\",\"name\":\"ca_bao_nha_ban_Japan_Katsuobushi_2gx8goi.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/ca_bao_nha_ban_Japan_Katsuobushi_2gx8goi_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/ca_bao_nha_ban_Japan_Katsuobushi_2gx8goi_1.jpg\",\"folder\":\"Upload\",\"name\":\"ca_bao_nha_ban_Japan_Katsuobushi_2gx8goi_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/ca_bao_nha_ban_Japan_Katsuobushi_3gx5goi.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/ca_bao_nha_ban_Japan_Katsuobushi_3gx5goi.jpg\",\"folder\":\"Upload\",\"name\":\"ca_bao_nha_ban_Japan_Katsuobushi_3gx5goi.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/ca_bao_nha_ban_Japan_Katsuobushi_3gx5goi_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/ca_bao_nha_ban_Japan_Katsuobushi_3gx5goi_2.jpg\",\"folder\":\"Upload\",\"name\":\"ca_bao_nha_ban_Japan_Katsuobushi_3gx5goi_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/call.png\",\"thumb\":\"https://192.168.1.126:1234/upload/call.png\",\"folder\":\"Upload\",\"name\":\"call.png\"},{\"image\":\"https://192.168.1.126:1234/upload/camnang.png\",\"thumb\":\"https://192.168.1.126:1234/upload/camnang.png\",\"folder\":\"Upload\",\"name\":\"camnang.png\"},{\"image\":\"https://192.168.1.126:1234/upload/canh-ga-1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/canh-ga-1.jpg\",\"folder\":\"Upload\",\"name\":\"canh-ga-1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/captcha.png\",\"thumb\":\"https://192.168.1.126:1234/upload/captcha.png\",\"folder\":\"Upload\",\"name\":\"captcha.png\"},{\"image\":\"https://192.168.1.126:1234/upload/cart.png\",\"thumb\":\"https://192.168.1.126:1234/upload/cart.png\",\"folder\":\"Upload\",\"name\":\"cart.png\"},{\"image\":\"https://192.168.1.126:1234/upload/category1.png\",\"thumb\":\"https://192.168.1.126:1234/upload/category1.png\",\"folder\":\"Upload\",\"name\":\"category1.png\"},{\"image\":\"https://192.168.1.126:1234/upload/category2.png\",\"thumb\":\"https://192.168.1.126:1234/upload/category2.png\",\"folder\":\"Upload\",\"name\":\"category2.png\"},{\"image\":\"https://192.168.1.126:1234/upload/chan gio 1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/chan gio 1.jpg\",\"folder\":\"Upload\",\"name\":\"chan gio 1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/chan gio.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/chan gio.jpg\",\"folder\":\"Upload\",\"name\":\"chan gio.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/check.png\",\"thumb\":\"https://192.168.1.126:1234/upload/check.png\",\"folder\":\"Upload\",\"name\":\"check.png\"},{\"image\":\"https://192.168.1.126:1234/upload/code.png\",\"thumb\":\"https://192.168.1.126:1234/upload/code.png\",\"folder\":\"Upload\",\"name\":\"code.png\"},{\"image\":\"https://192.168.1.126:1234/upload/content.png\",\"thumb\":\"https://192.168.1.126:1234/upload/content.png\",\"folder\":\"Upload\",\"name\":\"content.png\"},{\"image\":\"https://192.168.1.126:1234/upload/dau_huong_duong_tinh_luyen_thuong_hang_hieu_opera_900ml.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/dau_huong_duong_tinh_luyen_thuong_hang_hieu_opera_900ml.jpg\",\"folder\":\"Upload\",\"name\":\"dau_huong_duong_tinh_luyen_thuong_hang_hieu_opera_900ml.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/dau_huong_duong_tinh_luyen_thuong_hang_hieu_opera_900ml_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/dau_huong_duong_tinh_luyen_thuong_hang_hieu_opera_900ml_2.jpg\",\"folder\":\"Upload\",\"name\":\"dau_huong_duong_tinh_luyen_thuong_hang_hieu_opera_900ml_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/delete.png\",\"thumb\":\"https://192.168.1.126:1234/upload/delete.png\",\"folder\":\"Upload\",\"name\":\"delete.png\"},{\"image\":\"https://192.168.1.126:1234/upload/email.png\",\"thumb\":\"https://192.168.1.126:1234/upload/email.png\",\"folder\":\"Upload\",\"name\":\"email.png\"},{\"image\":\"https://192.168.1.126:1234/upload/favicon.png\",\"thumb\":\"https://192.168.1.126:1234/upload/favicon.png\",\"folder\":\"Upload\",\"name\":\"favicon.png\"},{\"image\":\"https://192.168.1.126:1234/upload/gia_vi_cao_cap_banner.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/gia_vi_cao_cap_banner.jpg\",\"folder\":\"Upload\",\"name\":\"gia_vi_cao_cap_banner.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/gift.png\",\"thumb\":\"https://192.168.1.126:1234/upload/gift.png\",\"folder\":\"Upload\",\"name\":\"gift.png\"},{\"image\":\"https://192.168.1.126:1234/upload/glyphicons-halflings.png\",\"thumb\":\"https://192.168.1.126:1234/upload/glyphicons-halflings.png\",\"folder\":\"Upload\",\"name\":\"glyphicons-halflings.png\"},{\"image\":\"https://192.168.1.126:1234/upload/hinhtest.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/hinhtest.jpg\",\"folder\":\"Upload\",\"name\":\"hinhtest.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/home.png\",\"thumb\":\"https://192.168.1.126:1234/upload/home.png\",\"folder\":\"Upload\",\"name\":\"home.png\"},{\"image\":\"https://192.168.1.126:1234/upload/hotline.png\",\"thumb\":\"https://192.168.1.126:1234/upload/hotline.png\",\"folder\":\"Upload\",\"name\":\"hotline.png\"},{\"image\":\"https://192.168.1.126:1234/upload/icon.png\",\"thumb\":\"https://192.168.1.126:1234/upload/icon.png\",\"folder\":\"Upload\",\"name\":\"icon.png\"},{\"image\":\"https://192.168.1.126:1234/upload/index.png\",\"thumb\":\"https://192.168.1.126:1234/upload/index.png\",\"folder\":\"Upload\",\"name\":\"index.png\"},{\"image\":\"https://192.168.1.126:1234/upload/lang_en.png\",\"thumb\":\"https://192.168.1.126:1234/upload/lang_en.png\",\"folder\":\"Upload\",\"name\":\"lang_en.png\"},{\"image\":\"https://192.168.1.126:1234/upload/logo-operamart.png\",\"thumb\":\"https://192.168.1.126:1234/upload/logo-operamart.png\",\"folder\":\"Upload\",\"name\":\"logo-operamart.png\"},{\"image\":\"https://192.168.1.126:1234/upload/logo1.png\",\"thumb\":\"https://192.168.1.126:1234/upload/logo1.png\",\"folder\":\"Upload\",\"name\":\"logo1.png\"},{\"image\":\"https://192.168.1.126:1234/upload/map.png\",\"thumb\":\"https://192.168.1.126:1234/upload/map.png\",\"folder\":\"Upload\",\"name\":\"map.png\"},{\"image\":\"https://192.168.1.126:1234/upload/method3.png\",\"thumb\":\"https://192.168.1.126:1234/upload/method3.png\",\"folder\":\"Upload\",\"name\":\"method3.png\"},{\"image\":\"https://192.168.1.126:1234/upload/nem 1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nem 1.jpg\",\"folder\":\"Upload\",\"name\":\"nem 1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nem.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nem.jpg\",\"folder\":\"Upload\",\"name\":\"nem.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_cham_ca_com_Phan_Thiet_Hong_Phu_ngon_ngon_1000ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_cham_ca_com_Phan_Thiet_Hong_Phu_ngon_ngon_1000ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_cham_ca_com_Phan_Thiet_Hong_Phu_ngon_ngon_1000ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_cham_thai_long_rong_vang_dam_da_800ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_cham_thai_long_rong_vang_dam_da_800ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_cham_thai_long_rong_vang_dam_da_800ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_cham_thai_long_rong_vang_dam_da_900ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_cham_thai_long_rong_vang_dam_da_900ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_cham_thai_long_rong_vang_dam_da_900ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_dac_san_phan_thiet_Thai_long.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_dac_san_phan_thiet_Thai_long.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_dac_san_phan_thiet_Thai_long.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_dac_san_phan_thiet_hong_phu.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_dac_san_phan_thiet_hong_phu.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_dac_san_phan_thiet_hong_phu.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_dac_san_phan_thiet_kabin.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_dac_san_phan_thiet_kabin.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_dac_san_phan_thiet_kabin.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_hong_phu.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_hong_phu.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_hong_phu.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_nguyen_chat_phan_thiet_hong_phu_dac_biet_30N_500ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_nguyen_chat_phan_thiet_hong_phu_dac_biet_30N_500ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_nguyen_chat_phan_thiet_hong_phu_dac_biet_30N_500ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_nguyen_chat_phan_thiet_hong_phu_hao_hang_21N_500ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_nguyen_chat_phan_thiet_hong_phu_hao_hang_21N_500ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_nguyen_chat_phan_thiet_hong_phu_hao_hang_21N_500ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_phan_thiet.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_phan_thiet.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_phan_thiet.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_phan_thiet_hong_phu_11N_600ml.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_phan_thiet_hong_phu_11N_600ml.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_phan_thiet_hong_phu_11N_600ml.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_phan_thiet_hong_phu_hai_vi_16N_500ml.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_phan_thiet_hong_phu_hai_vi_16N_500ml.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_phan_thiet_hong_phu_hai_vi_16N_500ml.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_loai_hao_hang_20N_500ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_loai_hao_hang_20N_500ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_thai_long_phan_thiet_loai_hao_hang_20N_500ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_nhan_do_hao_hang_16N_500ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_nhan_do_hao_hang_16N_500ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_thai_long_phan_thiet_nhan_do_hao_hang_16N_500ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_nhan_do_loai_1_500ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_nhan_do_loai_1_500ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_thai_long_phan_thiet_nhan_do_loai_1_500ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_nhan_do_loai_1_750ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_nhan_do_loai_1_750ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_thai_long_phan_thiet_nhan_do_loai_1_750ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_nhan_vang_hao_hang_500ml.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_nhan_vang_hao_hang_500ml.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_thai_long_phan_thiet_nhan_vang_hao_hang_500ml.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_vi_chat_12N_500ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_vi_chat_12N_500ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_thai_long_phan_thiet_vi_chat_12N_500ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_vi_chat_12N_750ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_vi_chat_12N_750ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_thai_long_phan_thiet_vi_chat_12N_750ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_vi_chat_loai_1_500ml.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_vi_chat_loai_1_500ml.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_thai_long_phan_thiet_vi_chat_loai_1_500ml.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_vi_chat_loai_1_750ml.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_phan_thiet_vi_chat_loai_1_750ml.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_thai_long_phan_thiet_vi_chat_loai_1_750ml.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_vi_chat_loai_1_500ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_thai_long_vi_chat_loai_1_500ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_thai_long_vi_chat_loai_1_500ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_thuong_hang_kabin_500ml.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_thuong_hang_kabin_500ml.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_thuong_hang_kabin_500ml.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_truyen_thong_sieu_dau_bep_kabin_500ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_truyen_thong_sieu_dau_bep_kabin_500ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_truyen_thong_sieu_dau_bep_kabin_500ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/nuoc_mam_truyen_thong_sieu_dau_bep_kabin_750ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/nuoc_mam_truyen_thong_sieu_dau_bep_kabin_750ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"nuoc_mam_truyen_thong_sieu_dau_bep_kabin_750ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/product.png\",\"thumb\":\"https://192.168.1.126:1234/upload/product.png\",\"folder\":\"Upload\",\"name\":\"product.png\"},{\"image\":\"https://192.168.1.126:1234/upload/product1.png\",\"thumb\":\"https://192.168.1.126:1234/upload/product1.png\",\"folder\":\"Upload\",\"name\":\"product1.png\"},{\"image\":\"https://192.168.1.126:1234/upload/rate.png\",\"thumb\":\"https://192.168.1.126:1234/upload/rate.png\",\"folder\":\"Upload\",\"name\":\"rate.png\"},{\"image\":\"https://192.168.1.126:1234/upload/saveoff.png\",\"thumb\":\"https://192.168.1.126:1234/upload/saveoff.png\",\"folder\":\"Upload\",\"name\":\"saveoff.png\"},{\"image\":\"https://192.168.1.126:1234/upload/slider.png\",\"thumb\":\"https://192.168.1.126:1234/upload/slider.png\",\"folder\":\"Upload\",\"name\":\"slider.png\"},{\"image\":\"https://192.168.1.126:1234/upload/slider1.png\",\"thumb\":\"https://192.168.1.126:1234/upload/slider1.png\",\"folder\":\"Upload\",\"name\":\"slider1.png\"},{\"image\":\"https://192.168.1.126:1234/upload/slider2.png\",\"thumb\":\"https://192.168.1.126:1234/upload/slider2.png\",\"folder\":\"Upload\",\"name\":\"slider2.png\"},{\"image\":\"https://192.168.1.126:1234/upload/slider3.png\",\"thumb\":\"https://192.168.1.126:1234/upload/slider3.png\",\"folder\":\"Upload\",\"name\":\"slider3.png\"},{\"image\":\"https://192.168.1.126:1234/upload/slider4.png\",\"thumb\":\"https://192.168.1.126:1234/upload/slider4.png\",\"folder\":\"Upload\",\"name\":\"slider4.png\"},{\"image\":\"https://192.168.1.126:1234/upload/slider5.png\",\"thumb\":\"https://192.168.1.126:1234/upload/slider5.png\",\"folder\":\"Upload\",\"name\":\"slider5.png\"},{\"image\":\"https://192.168.1.126:1234/upload/sot_Sukiyaki_Sukiyaki_Sauce_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/sot_Sukiyaki_Sukiyaki_Sauce_1.jpg\",\"folder\":\"Upload\",\"name\":\"sot_Sukiyaki_Sukiyaki_Sauce_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/sot_Sukiyaki_Sukiyaki_Sauce_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/sot_Sukiyaki_Sukiyaki_Sauce_2.jpg\",\"folder\":\"Upload\",\"name\":\"sot_Sukiyaki_Sukiyaki_Sauce_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/sot_Sukiyaki_Sukiyaki_Sauce_3.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/sot_Sukiyaki_Sukiyaki_Sauce_3.jpg\",\"folder\":\"Upload\",\"name\":\"sot_Sukiyaki_Sukiyaki_Sauce_3.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/sot_cay_ngot_Sweet_Chilli_Sauce_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/sot_cay_ngot_Sweet_Chilli_Sauce_1.jpg\",\"folder\":\"Upload\",\"name\":\"sot_cay_ngot_Sweet_Chilli_Sauce_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/sot_cay_ngot_Sweet_Chilli_Sauce_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/sot_cay_ngot_Sweet_Chilli_Sauce_2.jpg\",\"folder\":\"Upload\",\"name\":\"sot_cay_ngot_Sweet_Chilli_Sauce_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/sot_com_chien_Fried_Rice_Sauce_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/sot_com_chien_Fried_Rice_Sauce_1.jpg\",\"folder\":\"Upload\",\"name\":\"sot_com_chien_Fried_Rice_Sauce_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/sot_com_chien_Fried_Rice_Sauce_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/sot_com_chien_Fried_Rice_Sauce_2.jpg\",\"folder\":\"Upload\",\"name\":\"sot_com_chien_Fried_Rice_Sauce_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/sot_la_chanh_ga_nuong_Lemongrass_Sauce_For_Grilled_Chicken_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/sot_la_chanh_ga_nuong_Lemongrass_Sauce_For_Grilled_Chicken_1.jpg\",\"folder\":\"Upload\",\"name\":\"sot_la_chanh_ga_nuong_Lemongrass_Sauce_For_Grilled_Chicken_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/sot_la_chanh_ga_nuong_Lemongrass_Sauce_For_Grilled_Chicken_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/sot_la_chanh_ga_nuong_Lemongrass_Sauce_For_Grilled_Chicken_2.jpg\",\"folder\":\"Upload\",\"name\":\"sot_la_chanh_ga_nuong_Lemongrass_Sauce_For_Grilled_Chicken_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/sot_tieu_den_Black_Pepper_Sauce_1-.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/sot_tieu_den_Black_Pepper_Sauce_1-.jpg\",\"folder\":\"Upload\",\"name\":\"sot_tieu_den_Black_Pepper_Sauce_1-.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_2.jpg\",\"folder\":\"Upload\",\"name\":\"thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_5.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_5.jpg\",\"folder\":\"Upload\",\"name\":\"thung_nuoc_cot_dua_hieu_Thai_coconut_165ml_5.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/thung_nuoc_cot_dua_hieu_Thai_coconut_400ml_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/thung_nuoc_cot_dua_hieu_Thai_coconut_400ml_1.jpg\",\"folder\":\"Upload\",\"name\":\"thung_nuoc_cot_dua_hieu_Thai_coconut_400ml_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/thung_nuoc_cot_dua_hieu_Thai_coconut_400ml_5.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/thung_nuoc_cot_dua_hieu_Thai_coconut_400ml_5.jpg\",\"folder\":\"Upload\",\"name\":\"thung_nuoc_cot_dua_hieu_Thai_coconut_400ml_5.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/tintuc1.png\",\"thumb\":\"https://192.168.1.126:1234/upload/tintuc1.png\",\"folder\":\"Upload\",\"name\":\"tintuc1.png\"},{\"image\":\"https://192.168.1.126:1234/upload/tintuc2.png\",\"thumb\":\"https://192.168.1.126:1234/upload/tintuc2.png\",\"folder\":\"Upload\",\"name\":\"tintuc2.png\"},{\"image\":\"https://192.168.1.126:1234/upload/tintuc3.png\",\"thumb\":\"https://192.168.1.126:1234/upload/tintuc3.png\",\"folder\":\"Upload\",\"name\":\"tintuc3.png\"},{\"image\":\"https://192.168.1.126:1234/upload/top.png\",\"thumb\":\"https://192.168.1.126:1234/upload/top.png\",\"folder\":\"Upload\",\"name\":\"top.png\"},{\"image\":\"https://192.168.1.126:1234/upload/tuna_steak_in_soybean_oilca_ngu_ngam_dau_nanh_185g.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/tuna_steak_in_soybean_oilca_ngu_ngam_dau_nanh_185g.jpg\",\"folder\":\"Upload\",\"name\":\"tuna_steak_in_soybean_oilca_ngu_ngam_dau_nanh_185g.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/tuna_steak_in_soybean_oilca_ngu_ngam_dau_nanh_185g_2.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/tuna_steak_in_soybean_oilca_ngu_ngam_dau_nanh_185g_2.jpg\",\"folder\":\"Upload\",\"name\":\"tuna_steak_in_soybean_oilca_ngu_ngam_dau_nanh_185g_2.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/tuong_ot_Sriracha_Sriracha_Chilli_Sauce_1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/tuong_ot_Sriracha_Sriracha_Chilli_Sauce_1.jpg\",\"folder\":\"Upload\",\"name\":\"tuong_ot_Sriracha_Sriracha_Chilli_Sauce_1.jpg\"},{\"image\":\"https://192.168.1.126:1234/upload/1920x780---1.jpg\",\"thumb\":\"https://192.168.1.126:1234/upload/1920x780---1.jpg\",\"folder\":\"Upload\",\"name\":\"1920x780---1.jpg\"}]'),
(41, 'mail_host_port', '25'),
(10, 'front_end_call_number_footer', '+84906765298'),
(11, 'front_end_sms_number_footer', '+84906765298'),
(12, 'front_end_map_longitude_footer', '106.743931'),
(13, 'front_end_map_latitude_footer', '10.806072'),
(14, 'email_subject_editor', 'dnduc456@gmail.com'),
(15, 'content_subject_editor', '<p><img src=\"cid:Picture1\" style=\"width:100%\" /></p>\r\n\r\n<h2>Tạo t&agrave;i khoản th&agrave;nh c&ocirc;ng</h2>\r\n\r\n<div style=\"background:#dfdfdf; font-size:20px; height:200px; margin-top:110px; padding-left:30px; padding-right:350px; padding-top:45px; width:80%\">&lt;CLIENT_NAME&gt; th&acirc;n mến,<br />\r\nCh&agrave;o mừng bạn đến với <strong>Opera Mart!</strong><br />\r\nL&agrave; th&agrave;nh vi&ecirc;n của <span style=\"color:#e10000\">Opera Mart</span> bạn sẽ l&agrave; người đầu ti&ecirc;n nhận được th&ocirc;ng tin những chương tr&igrave;nh khuyến m&atilde;i độc quyền v&agrave; những sản phẩm mới nhất. Đến với Opera Mart để:\r\n\r\n<ul>\r\n	<li>Mua sắm những sản phẩm gia vị, thực phẩm với gi&aacute; rẻ nhất.</li>\r\n	<li>Mua được những chương tr&igrave;nh khuyến m&atilde;i giảm gi&aacute; đặc biệt chỉ d&agrave;nh ri&ecirc;ng cho th&agrave;nh vi&ecirc;n của Opera Mart.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:center\">M&atilde; giảm gi&aacute; d&agrave;nh cho th&agrave;nh vi&ecirc;n mới</p>\r\n\r\n<p style=\"text-align:center\">&lt;MA_GIAM_GIA&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<div style=\"background:#dfdfdf; font-size:20px; text-align:center; width:100%\">&nbsp;</div>\r\n\r\n<div style=\"background:#dfdfdf; font-size:20px; height:40px; text-align:center; width:100%\">&nbsp;</div>\r\n\r\n<div style=\"background:#dfdfdf; font-size:20px; text-align:center; width:100%\">&nbsp;</div>\r\n\r\n<div style=\"background:#dfdfdf; font-size:20px; height:40px; text-align:center; width:100%\">&nbsp;</div>\r\n'),
(16, 'email_for_host', 'opera@operamart.vn'),
(17, 'password_for_host', ''),
(25, 'promotion_popup_content', '<p><img alt=\"\" src=\"https://www.dreamweb.vn/upload/image/KHUYEN-MAI.jpg\" style=\"width:100%\" /></p>\n'),
(24, 'promotion_popup_delay_show', '1000'),
(26, 'email_accept_subject_editor', 'ghvinh@gmail.com'),
(23, 'mail_host_url', '172.16.41.55'),
(27, 'content_accept_subject_editor', 'test'),
(28, 'email_accept_for_host', 'ghvinh@gmail.com'),
(29, 'password_accept_for_host', 'test'),
(30, 'email_accept_subject_editor', 'ghvinh@gmail.com'),
(31, 'content_accept_subject_editor', 'test'),
(32, 'email_accept_for_host', 'ghvinh@gmail.com'),
(33, 'password_accept_for_host', 'test'),
(34, 'email_accept_subject_editor', 'ghvinh@gmail.com'),
(35, 'content_accept_subject_editor', 'test'),
(36, 'email_accept_for_host', 'ghvinh@gmail.com'),
(37, 'password_accept_for_host', 'test'),
(38, 'mail_accept_host_url', '172.16.41.55'),
(39, 'promotion_for_user_signup_first_time', '1'),
(40, 'promotion_popup_show', '1');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `name` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `email`, `phone`, `note`, `created_date`, `created_by`, `updated_by`, `updated_date`, `address`, `name`, `status`) VALUES
('d5a4d430-51e5-11e8-8cdd-45ee0c532f07', 'vinh.thien0301@gmail.com', '45436346', 'Can dong gop y kien', '2018-05-07 18:00:20', 'vinh.thien0301@gmail.com', NULL, NULL, 'asds', 'AVT', 2);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `tags` text COLLATE utf8_unicode_ci,
  `content_category_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `contentHTML` text COLLATE utf8_unicode_ci,
  `type` int(11) DEFAULT NULL COMMENT '2: is top slider mon ngon,NULL is normal',
  `status` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `image_large` text COLLATE utf8_unicode_ci,
  `image_banner_alternative` text COLLATE utf8_unicode_ci COMMENT 'Use this for CamNangMonAn & TinTucSuKien',
  `countview` int(32) DEFAULT NULL,
  `link` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`code`, `name`, `image`) VALUES
('en', 'Tiếng anh', 'en.png'),
('vi', 'Việt nam', 'vi.png');

-- --------------------------------------------------------

--
-- Table structure for table `lookupdata`
--

CREATE TABLE `lookupdata` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `contentHTML` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requiring_entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lookupdata`
--

INSERT INTO `lookupdata` (`id`, `title`, `description`, `contentHTML`, `created_date`, `created_by`, `updated_date`, `updated_by`, `parent_id`, `entity_code`, `requiring_entity_code`, `status`) VALUES
('00158B7D-DA92-4699-90CD-9D7291E47059', 'Huyện Yên Phong', 'Huyện Yên Phong', '258', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '27C7B617-982E-45ED-AC64-6B99814282A9', 'QUH', 'TTP', 1),
('002BFDDB-500C-413C-B3D7-F42E4272F684', 'Thành phố Qui Nhơn', 'Thành phố Qui Nhơn', '540', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'QUH', 'TTP', 1),
('004FDAD9-63B1-4B75-B625-40D1DA289D4F', 'Huyện Ba Chẽ', 'Huyện Ba Chẽ', '202', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('00F54C69-D0B4-4E04-B13F-352FF4A3613C', 'Huyện Đông Hưng', 'Huyện Đông Hưng', '340', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CFEA534D-A741-4E92-AA89-4CF6D6CBCA35', 'QUH', 'TTP', 1),
('0126A8BE-497D-4EEC-A5C6-E096A6A9EBF8', 'Quận Ninh Kiều', 'Quận Ninh Kiều', '916', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D83D5950-2F31-460A-9C05-FEB9D248F3CB', 'QUH', 'TTP', 1),
('0142821C-FD6D-4A02-9AD6-D085E1CC3A25', 'Huyện Đô Lương', 'Huyện Đô Lương', '427', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('01B5AFFB-7E3E-4B3B-A948-84146C78BF6B', 'Huyện Đông Anh', 'Huyện Đông Anh', '017', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('02514B61-4D7D-4D3D-826F-E60B59CC3094', 'Huyện Gò Quao', 'Huyện Gò Quao', '907', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('02AD34A4-6F58-49EA-A0F5-BFF303D668BE', 'Huyện Hạ Hoà', 'Huyện Hạ Hoà', '231', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('02B08DEB-EA5E-4BC6-9D77-7C03B5C7C507', 'Huyện Buôn Đôn', 'Huyện Buôn Đôn', '647', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('02BF6484-ABC5-4C92-A44B-5298D9D7A64F', 'Huyện Mang Yang', 'Huyện Mang Yang', '629', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('02DF4ED6-C29E-4D36-B336-C5D1E784F83C', 'Huyện Kỳ Sơn', 'Huyện Kỳ Sơn', '151', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '4893732C-9C2A-4DF2-967C-0956A1476C5D', 'QUH', 'TTP', 1),
('037925B9-EA53-4D96-BC38-449416BC6A99', 'Quận Sơn Trà', 'Quận Sơn Trà', '493', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C7F7DE77-EFE5-4879-89BD-98F121AF131D', 'QUH', 'TTP', 1),
('0427C371-0CC1-4AA4-82AD-44593F5083F0', 'Huyện Thanh Thuỷ', 'Huyện Thanh Thuỷ', '239', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('0468D5B4-7901-4C46-8C43-A289FB3617DB', 'Huyện Nghi Lộc', 'Huyện Nghi Lộc', '429', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('04AAFF8D-0C9D-4A9A-8309-2E00E44DB608', 'Huyện Minh Long', 'Huyện Minh Long', '531', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('051C1DD4-8E1D-497B-A6F4-26B21507BFFB', 'Thành phố Bắc Ninh', 'Thành phố Bắc Ninh', '256', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '27C7B617-982E-45ED-AC64-6B99814282A9', 'QUH', 'TTP', 1),
('058FA3C0-D269-449A-AE17-7C54F079164D', 'Thị xã Bến Cát', 'Thị xã Bến Cát', '721', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '0ACA0257-5987-45FC-BBA7-CD6235DE3C23', 'QUH', 'TTP', 1),
('05EF6B3B-F550-430C-B33C-6268CE4A24B3', 'Thị xã Hương Trà', 'Thị xã Hương Trà', '480', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C506D9F3-4449-4637-A137-B1DE7CEA7FE3', 'QUH', 'TTP', 1),
('06295D92-CCA9-4476-B4E4-9EA4D3CFBA9C', 'Thị xã Hoàng Mai', 'Thị xã Hoàng Mai', '432', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('065F6A9E-0157-4419-A0D5-63DE2A3912F7', 'Huyện Tánh Linh', 'Huyện Tánh Linh', '599', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FA7763AF-DA21-4423-930B-45EB04281CF3', 'QUH', 'TTP', 1),
('06975319-43D6-4344-83FF-CF1A19408F9A', 'Tỉnh Long An', 'Tỉnh Long An', '80', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('06AB1924-C3D2-4909-A496-7F66296CB794', 'Huyện Yên Thế', 'Huyện Yên Thế', '215', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '69691148-5255-44CB-A176-02D504EA7BD0', 'QUH', 'TTP', 1),
('06C502D3-777B-4C2E-BE2F-D9D39A6E5BB5', 'Huyện Châu Thành', 'Huyện Châu Thành', '933', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD62365E-1F44-4A11-ACCC-FA51D96AC4F6', 'QUH', 'TTP', 1),
('06D7BBF1-C2B7-4F65-97D1-CD6C8BD69DC9', 'Huyện Tam Đường', 'Huyện Tam Đường', '106', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD7E781A-60AD-46FA-94F9-09F39FA13922', 'QUH', 'TTP', 1),
('07AE32FD-0B0B-4470-A579-2FE4B56E5518', 'Huyện Trà Ôn', 'Huyện Trà Ôn', '862', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B5CB01A7-6F5E-4BC0-8826-4352D738D05E', 'QUH', 'TTP', 1),
('07C686B3-5E3E-46A1-997F-60CD35082CE0', 'Huyện Diên Khánh', 'Huyện Diên Khánh', '574', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8AE422A1-1C4E-4068-A0C6-439BD66E0909', 'QUH', 'TTP', 1),
('07E0C70C-3398-475D-B5BC-2F28926A58D2', 'Huyện Kiến Thuỵ', 'Huyện Kiến Thuỵ', '314', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('07F9A657-89AA-4C42-AD1E-33BDFD6C7A1D', 'Quận Nam Từ Liêm', 'Quận Nam Từ Liêm', '019', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('0875CDBE-DE24-4C85-B90C-D5149C026716', 'Huyện Mỹ Xuyên', 'Huyện Mỹ Xuyên', '947', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'QUH', 'TTP', 1),
('08DFD5A2-6FEE-446E-9D46-0AA9A4F584A7', 'Huyện Bố Trạch', 'Huyện Bố Trạch', '455', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '37F81E15-B331-4BF1-8BF0-ABBA14A820CF', 'QUH', 'TTP', 1),
('08FD9974-44E6-44A9-ABAD-611ED30FBF99', 'Huyện Bàu Bàng', 'Huyện Bàu Bàng', '719', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '0ACA0257-5987-45FC-BBA7-CD6235DE3C23', 'QUH', 'TTP', 1),
('0932597D-A546-45E7-89EB-239D9B8E03CC', 'Huyện Ngọc Hiển', 'Huyện Ngọc Hiển', '973', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'ACB8FA1D-5761-4E6D-8A52-6033EFE4CDB8', 'QUH', 'TTP', 1),
('093BAFF3-943C-440A-9429-009097D848C8', 'Huyện Quảng Ninh', 'Huyện Quảng Ninh', '456', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '37F81E15-B331-4BF1-8BF0-ABBA14A820CF', 'QUH', 'TTP', 1),
('09932117-DB4A-47AB-9C9C-8A19AC26DFD2', 'Huyện Trần Đề', 'Huyện Trần Đề', '951', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'QUH', 'TTP', 1),
('09BAE5A6-53C8-4890-903E-2DC515977488', 'Huyện Sốp Cộp', 'Huyện Sốp Cộp', '127', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('0A04D823-3C90-476B-A873-CC064AACAB75', 'Huyện Cần Đước', 'Huyện Cần Đước', '806', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('0A499F81-B164-4EE8-A7FF-C60F4E7372A5', 'Huyện Tuy Phong', 'Huyện Tuy Phong', '595', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FA7763AF-DA21-4423-930B-45EB04281CF3', 'QUH', 'TTP', 1),
('0A5A50AF-E820-4ECF-8780-32609C37C1DF', 'Huyện Cam Lâm', 'Huyện Cam Lâm', '570', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8AE422A1-1C4E-4068-A0C6-439BD66E0909', 'QUH', 'TTP', 1),
('0ACA0257-5987-45FC-BBA7-CD6235DE3C23', 'Tỉnh Bình Dương', 'Tỉnh Bình Dương', '74', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('0AF6009D-3029-48AF-B68B-8B35285EB86E', 'Quận Tân Phú', 'Quận Tân Phú', '767', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('0B283020-05E9-46C7-B14E-A5FBF63278A4', 'Huyện Hòa Vang', 'Huyện Hòa Vang', '497', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C7F7DE77-EFE5-4879-89BD-98F121AF131D', 'QUH', 'TTP', 1),
('0B944A81-D74B-4446-B66C-A9B70BBBF3A6', 'Huyện Lý Nhân', 'Huyện Lý Nhân', '353', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '88B47679-85DE-47C7-8CCB-D4446E847C59', 'QUH', 'TTP', 1),
('0BBB2486-5745-4819-97C7-DEA552F6E961', 'Huyện Ba Vì', 'Huyện Ba Vì', '271', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('0C05DD9E-9E54-4892-A16E-5DA0F6A5DEAC', 'Huyện Đắk Hà', 'Huyện Đắk Hà', '615', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D24B493B-0BE8-4D1E-887F-EFF975279D06', 'QUH', 'TTP', 1),
('0C770A6D-1727-4E9E-8D42-D40BCC1DB985', 'Huyện Hà Trung', 'Huyện Hà Trung', '392', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('0D17537B-3020-4C7F-971A-50929B15DEA3', 'Huyện Xuyên Mộc', 'Huyện Xuyên Mộc', '751', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '3AFAD985-4549-4B26-921A-712A0040B140', 'QUH', 'TTP', 1),
('0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'Tỉnh Quảng Ninh', 'Tỉnh Quảng Ninh', '22', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('0D5BD7D9-6B77-413E-86FD-9F815431A765', 'Huyện Đông Sơn', 'Huyện Đông Sơn', '405', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('0D708015-D20E-4F5C-92FC-D9A2B6F13406', 'Huyện Cái Bè', 'Huyện Cái Bè', '819', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CE101B67-9ED6-4DC3-AC57-4019466AD287', 'QUH', 'TTP', 1),
('0D9C57EA-EBB9-4BB9-B08B-B22617025243', 'Huyện Tân Lạc', 'Huyện Tân Lạc', '155', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '4893732C-9C2A-4DF2-967C-0956A1476C5D', 'QUH', 'TTP', 1),
('0E52500F-9657-4563-955A-C4518E60EC63', 'Huyện Tuần Giáo', 'Huyện Tuần Giáo', '099', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '3D188E07-EA3E-4C6D-BB08-651BCE844778', 'QUH', 'TTP', 1),
('0EDB6E2C-9EBC-4EF2-ABDA-EF502E41AE20', 'Huyện Lâm Bình', 'Huyện Lâm Bình', '071', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '55A43243-D626-4223-BA21-3ECF08DAE6A5', 'QUH', 'TTP', 1),
('0EF390C3-51F0-40C0-8649-B62B76D57043', 'Huyện Vĩnh Bảo', 'Huyện Vĩnh Bảo', '316', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('0EF8F9D2-CC2D-49CF-B661-8C0230501C3A', 'Huyện Thạch Hà', 'Huyện Thạch Hà', '445', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('0F3056E6-D5FD-4287-A736-076B8C92DCC9', 'Huyện Thạnh Trị', 'Huyện Thạnh Trị', '949', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'QUH', 'TTP', 1),
('0F68707B-EA39-4CEF-8ADD-C28987E072C2', 'Huyện Trảng Bàng', 'Huyện Trảng Bàng', '712', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A84202BA-4C3F-4705-B69F-0A6706985E47', 'QUH', 'TTP', 1),
('0faa7a10-630f-11e8-9185-276e155d0fc2', 'KOHYO', NULL, NULL, '2018-05-29 14:08:17', 'operamart', NULL, NULL, NULL, 'BND', NULL, 1),
('10F7A59D-F276-41BD-BA46-AB26EF121A0F', 'Huyện Bù Gia Mập', 'Huyện Bù Gia Mập', '691', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'QUH', 'TTP', 1),
('11641EAE-16A5-422F-8CF9-72BBADBB6E06', 'Huyện Mường Khương', 'Huyện Mường Khương', '083', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DC9794FA-76CC-4E86-963E-7A6B1182F377', 'QUH', 'TTP', 1),
('117B21F1-1D21-4C86-885D-8734C12223E2', 'Huyện Long Thành', 'Huyện Long Thành', '740', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'QUH', 'TTP', 1),
('1185B171-EC80-47A3-9512-20F1C1620CA4', 'Huyện Ba Tơ', 'Huyện Ba Tơ', '535', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('1198584F-B6DC-43E8-B973-26D122F14251', 'Huyện Sông Mã', 'Huyện Sông Mã', '126', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('11FEF5C1-AA29-485D-9761-10063F0CB1FB', 'Huyện Na Rì', 'Huyện Na Rì', '066', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C40DAA9A-5CBD-4265-9B7B-A74329857C0B', 'QUH', 'TTP', 1),
('12261F80-D824-4610-A55B-5CC8605804F5', 'Huyện Như Xuân', 'Huyện Như Xuân', '402', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('1286E4A4-277D-4386-862E-680E20539A2C', 'Huyện Tân Châu', 'Huyện Tân Châu', '706', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A84202BA-4C3F-4705-B69F-0A6706985E47', 'QUH', 'TTP', 1),
('136A2857-E0E7-4688-AFA8-C3B9F70D2EBB', 'Huyện Bảo Lạc', 'Huyện Bảo Lạc', '043', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('13C469BA-E3F3-4CCE-97C1-7868897F886F', 'Huyện Ia H Drai', 'Huyện Ia H Drai', '618', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D24B493B-0BE8-4D1E-887F-EFF975279D06', 'QUH', 'TTP', 1),
('1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'Tỉnh Sóc Trăng', 'Tỉnh Sóc Trăng', '94', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('14FB8550-0190-4B62-A07E-6730506E1E66', 'Huyện Thanh Bình', 'Huyện Thanh Bình', '874', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('1548E597-4A9F-4629-B994-86A39D06BB7E', 'Thị xã Kỳ Anh', 'Thị xã Kỳ Anh', '449', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('154BA546-BE7A-439A-9B3A-FFB67053D3B5', 'Huyện Phù Cừ', 'Huyện Phù Cừ', '333', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AA3ADACC-8811-4531-AB32-E09A5FDC59B5', 'QUH', 'TTP', 1),
('156C3896-9209-4BAD-A1D6-5FC58ED13C50', 'Thành phố Vĩnh Yên', 'Thành phố Vĩnh Yên', '243', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '28ED8435-E4A9-418C-B888-DA9A05822474', 'QUH', 'TTP', 1),
('15897434-DDA1-44CA-B8CF-6675FC7DE435', 'Huyện Mộc Châu', 'Huyện Mộc Châu', '123', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('15DA2C71-D7AA-4419-A090-B93371852378', 'Huyện Sông Lô', 'Huyện Sông Lô', '253', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '28ED8435-E4A9-418C-B888-DA9A05822474', 'QUH', 'TTP', 1),
('162DA7BF-4A91-4828-9A57-4A458F0C784D', 'Thị xã Tân Châu', 'Thị xã Tân Châu', '887', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F06D7E55-3CB9-4ED9-814D-051F26232112', 'QUH', 'TTP', 1),
('168BB9A2-C2A5-466F-B7AC-7539AFABA916', 'Huyện Thới Bình', 'Huyện Thới Bình', '967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'ACB8FA1D-5761-4E6D-8A52-6033EFE4CDB8', 'QUH', 'TTP', 1),
('16929A2B-F181-4744-957A-FDE4E1DF1F04', 'Huyện Phú Lộc', 'Huyện Phú Lộc', '482', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C506D9F3-4449-4637-A137-B1DE7CEA7FE3', 'QUH', 'TTP', 1),
('170807E0-B306-41DE-BB64-DDD7B60968D7', 'Huyện Lập Thạch', 'Huyện Lập Thạch', '246', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '28ED8435-E4A9-418C-B888-DA9A05822474', 'QUH', 'TTP', 1),
('170BF879-9B03-48C4-96AC-6DD5E8E25FFF', 'Huyện Cù Lao Dung', 'Huyện Cù Lao Dung', '945', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'QUH', 'TTP', 1),
('172C9AC3-9E64-44A5-9F4D-E4DBA1386193', 'Huyện Phù Yên', 'Huyện Phù Yên', '122', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('17C85E90-1C49-4EEF-B805-32789A57C547', 'Huyện Tân Kỳ', 'Huyện Tân Kỳ', '423', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('17F5AB53-4C1C-4131-A4F1-646B67FB44C6', 'Huyện Nhơn Trạch', 'Huyện Nhơn Trạch', '742', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'QUH', 'TTP', 1),
('18AD109C-8073-4C87-9C35-B91772B62293', 'Huyện Phú Giáo', 'Huyện Phú Giáo', '722', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '0ACA0257-5987-45FC-BBA7-CD6235DE3C23', 'QUH', 'TTP', 1),
('19389123-F8BD-481A-8B90-B74D8384C32A', 'Thành phố Quảng Ngãi', 'Thành phố Quảng Ngãi', '522', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('193950A5-45B9-4FA3-A806-3FCC73E5BD62', 'Quận Ba Đình', 'Quận Ba Đình', '001', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('194F95A5-13D9-47B3-A9DF-641F7FD5CCEB', 'Huyện Kinh Môn', 'Huyện Kinh Môn', '292', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('1973FE3C-AE2C-477B-83DC-B49D24A739DA', 'Huyện Vụ Bản', 'Huyện Vụ Bản', '359', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BDB21B56-A793-465E-8A4F-7B2E4D5849A0', 'QUH', 'TTP', 1),
('197D5348-3A6F-4A3F-A0B6-8245A615582F', 'Thị xã Duyên Hải', 'Thị xã Duyên Hải', '851', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8842C8E4-BE1D-4331-867E-48BB0F917BAD', 'QUH', 'TTP', 1),
('19F5241C-E9B7-4224-9D68-739A229D172D', 'Huyện Hàm Thuận Bắc', 'Huyện Hàm Thuận Bắc', '597', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FA7763AF-DA21-4423-930B-45EB04281CF3', 'QUH', 'TTP', 1),
('1A01177D-5550-484F-92D1-C6CA11467B33', 'Huyện Vĩnh Lộc', 'Huyện Vĩnh Lộc', '393', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'Tỉnh Đồng Nai', 'Tỉnh Đồng Nai', '75', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('1B685396-4FFF-42A5-8DDD-8D63A7363057', 'Quận Hoàn Kiếm', 'Quận Hoàn Kiếm', '002', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('1C043C81-E76E-42EF-8DA3-F54F00BC708B', 'Huyện Điện Biên Đông', 'Huyện Điện Biên Đông', '101', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '3D188E07-EA3E-4C6D-BB08-651BCE844778', 'QUH', 'TTP', 1),
('1D16B2E6-EB29-4319-B407-EFBAC12E81A8', 'Huyện Cao Lộc', 'Huyện Cao Lộc', '183', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CEB314BF-5661-403C-8000-CC304FA7DC83', 'QUH', 'TTP', 1),
('1E4B6FEB-0A7F-47C5-A1E9-1FF3CCD1F1E9', 'Huyện Văn Bàn', 'Huyện Văn Bàn', '089', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DC9794FA-76CC-4E86-963E-7A6B1182F377', 'QUH', 'TTP', 1),
('1E70FAD9-5318-403F-A691-7F18C50F0336', 'Huyện Tân Yên', 'Huyện Tân Yên', '216', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '69691148-5255-44CB-A176-02D504EA7BD0', 'QUH', 'TTP', 1),
('1ED32A72-D267-4E0D-B0BA-FC9E9B6DF2CD', 'Huyện Gò Công Đông', 'Huyện Gò Công Đông', '824', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CE101B67-9ED6-4DC3-AC57-4019466AD287', 'QUH', 'TTP', 1),
('1F0479E4-4B41-4579-80AC-1F6E7A65D146', 'Quận Long Biên', 'Quận Long Biên', '004', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('1FEFEF30-2119-4A6C-9FB1-4D9FCDE19CA2', 'Huyện Kon Rẫy', 'Huyện Kon Rẫy', '614', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D24B493B-0BE8-4D1E-887F-EFF975279D06', 'QUH', 'TTP', 1),
('204714CD-1C9B-486A-99BA-0450F12F50EB', 'Huyện Châu Thành', 'Huyện Châu Thành', '942', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'QUH', 'TTP', 1),
('206F49C6-6741-4893-A87F-5D15EE289E8C', 'Huyện Nam Sách', 'Huyện Nam Sách', '291', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('2071529D-891A-42FE-8B74-8992E64A9E8F', 'Thành phố Vĩnh Long', 'Thành phố Vĩnh Long', '855', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B5CB01A7-6F5E-4BC0-8826-4352D738D05E', 'QUH', 'TTP', 1),
('22398A17-1737-48EB-80BA-5BF5493D9232', 'Huyện Yên Châu', 'Huyện Yên Châu', '124', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('2281221C-A1CB-43F8-A449-34ADC021FFE6', 'Huyện Trấn Yên', 'Huyện Trấn Yên', '138', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '282D54D8-E4AB-4C8D-AC12-AC799D15CDD8', 'QUH', 'TTP', 1),
('22A28F37-A782-49C9-AA56-C3E65FA999EB', 'Huyện Cư Jút', 'Huyện Cư Jút', '662', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FF133341-40E9-4660-BE50-D9CF0DEF3F40', 'QUH', 'TTP', 1),
('22C520B7-215F-4425-B283-B7DDE4FD1E64', 'Huyện Phú Ninh', 'Huyện Phú Ninh', '518', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('2396DF23-4DCE-403B-9C7A-D1243D6FA811', 'Huyện Châu Thành', 'Huyện Châu Thành', '708', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A84202BA-4C3F-4705-B69F-0A6706985E47', 'QUH', 'TTP', 1),
('23B36BF5-7180-43CD-A154-2DDACB318ADF', 'Huyện Vĩnh Cửu', 'Huyện Vĩnh Cửu', '735', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'QUH', 'TTP', 1),
('25414B8F-CA6D-401F-AA13-BC563A4D84A3', 'Huyện Mộc Hóa', 'Huyện Mộc Hóa', '798', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('2546DB70-D773-437F-9B5C-CB6CC88E9D4D', 'Huyện Đức Huệ', 'Huyện Đức Huệ', '801', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'Tỉnh Hải Dương', 'Tỉnh Hải Dương', '30', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('261C0866-9C88-47EA-9C1F-6AD232AB6ECB', 'Quận Bình Thạnh', 'Quận Bình Thạnh', '765', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('2651D1A1-D463-4DAF-A4A4-AAAFC481E08E', 'Huyện Kim Bảng', 'Huyện Kim Bảng', '350', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '88B47679-85DE-47C7-8CCB-D4446E847C59', 'QUH', 'TTP', 1),
('26DF9104-61E1-480E-AC6B-613ACECB273D', 'Huyện Chơn Thành', 'Huyện Chơn Thành', '697', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'QUH', 'TTP', 1),
('26F2A132-416A-4D55-82AF-0765AE27D10C', 'Huyện Sóc Sơn', 'Huyện Sóc Sơn', '016', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('27671000-DB6D-4562-A639-9D542FAFB84F', 'Huyện Thường Tín', 'Huyện Thường Tín', '279', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('27C7B617-982E-45ED-AC64-6B99814282A9', 'Tỉnh Bắc Ninh', 'Tỉnh Bắc Ninh', '27', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('2809EF94-E120-4223-A865-859F3F3CD0F1', 'Thị xã Sông Cầu', 'Thị xã Sông Cầu', '557', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '754B7AF8-2404-4834-AA22-EDBBD14C7259', 'QUH', 'TTP', 1),
('282D54D8-E4AB-4C8D-AC12-AC799D15CDD8', 'Tỉnh Yên Bái', 'Tỉnh Yên Bái', '15', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('28912846-5DAD-4709-A75C-3A1661CFF8EC', 'Huyện Quế Phong', 'Huyện Quế Phong', '415', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('289E925F-28E5-4323-855C-1D0CBA2160D2', 'Huyện Kon Plông', 'Huyện Kon Plông', '613', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D24B493B-0BE8-4D1E-887F-EFF975279D06', 'QUH', 'TTP', 1),
('28A429EC-A31F-46B9-8DBC-BF56BED6526D', 'Huyện Thái Thụy', 'Huyện Thái Thụy', '341', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CFEA534D-A741-4E92-AA89-4CF6D6CBCA35', 'QUH', 'TTP', 1),
('28E8CED9-94A5-4A0C-982F-A32D04F8C843', 'Huyện Hoành Bồ', 'Huyện Hoành Bồ', '204', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('28ED8435-E4A9-418C-B888-DA9A05822474', 'Tỉnh Vĩnh Phúc', 'Tỉnh Vĩnh Phúc', '26', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('29E840D8-0AB3-4BC2-933A-BAAE49FCE56E', 'Huyện Giang Thành', 'Huyện Giang Thành', '914', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('29EFFCC9-4B2A-45B5-8E4B-E1E73FE731B2', 'Huyện Hoài Nhơn', 'Huyện Hoài Nhơn', '543', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'QUH', 'TTP', 1),
('2A3958C3-30B9-4A46-9694-FCF0AFCC99CE', 'Thành phố Cà Mau', 'Thành phố Cà Mau', '964', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'ACB8FA1D-5761-4E6D-8A52-6033EFE4CDB8', 'QUH', 'TTP', 1),
('2A516951-14D8-48A8-9FBE-A193752F2428', 'Huyện Kim Sơn', 'Huyện Kim Sơn', '376', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AD811A40-F9A5-4676-B9D5-43B844BA25B2', 'QUH', 'TTP', 1),
('2AAF01F0-AF0C-4C3D-B6E5-3A1031A25520', 'Huyện Xuân Trường', 'Huyện Xuân Trường', '364', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BDB21B56-A793-465E-8A4F-7B2E4D5849A0', 'QUH', 'TTP', 1),
('2ACA0018-61EC-4BD2-8BA8-0191A3FA3A43', 'Thị xã Nghĩa Lộ', 'Thị xã Nghĩa Lộ', '133', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '282D54D8-E4AB-4C8D-AC12-AC799D15CDD8', 'QUH', 'TTP', 1),
('2ACDFEED-413F-4592-A9EB-EE61B6A5AC87', 'Huyện Nga Sơn', 'Huyện Nga Sơn', '401', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('2ADC2D5B-D789-41D7-8FED-34C715255AB4', 'Huyện Châu Thành A', 'Huyện Châu Thành A', '932', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD62365E-1F44-4A11-ACCC-FA51D96AC4F6', 'QUH', 'TTP', 1),
('2AF8E546-9E1F-4928-8320-D469EEF4B768', 'Huyện Gia Viễn', 'Huyện Gia Viễn', '373', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AD811A40-F9A5-4676-B9D5-43B844BA25B2', 'QUH', 'TTP', 1),
('2B069E88-4B37-4507-839A-40A54824E2C9', 'Tỉnh Hà Giang', 'Tỉnh Hà Giang', '02', '2018-06-03 13:08:27', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:27', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('2B8B5984-D19F-481C-BE87-B053E1C18F25', 'Huyện Tam Đảo', 'Huyện Tam Đảo', '248', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '28ED8435-E4A9-418C-B888-DA9A05822474', 'QUH', 'TTP', 1),
('2BCAA2A9-1A43-49CD-8D69-21B10811DDCD', 'Huyện Củ Chi', 'Huyện Củ Chi', '783', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('2CE17C43-40DE-41F6-9B6E-5A0DF604C586', 'Huyện Thanh Sơn', 'Huyện Thanh Sơn', '238', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('2CF57BDB-52D5-46BB-A264-A857811AE064', 'Huyện Chợ Gạo', 'Huyện Chợ Gạo', '822', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CE101B67-9ED6-4DC3-AC57-4019466AD287', 'QUH', 'TTP', 1),
('2CFC8422-2889-4088-AB15-D697B08E3000', 'Huyện Cam Lộ', 'Huyện Cam Lộ', '468', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BF26A0FA-1C5F-49A3-B2A7-4BAFE12CE043', 'QUH', 'TTP', 1),
('2D09B09F-87A7-4A58-8116-A6DD1F727397', 'Tỉnh Bến Tre', 'Tỉnh Bến Tre', '83', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('2D97627D-3990-44B0-A8D5-28A4CBA32DC5', 'Huyện Chương Mỹ', 'Huyện Chương Mỹ', '277', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('2DB6E709-1663-4B53-AFAE-E4B2D753CDE2', 'Huyện Bác Ái', 'Huyện Bác Ái', '584', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '72DABCBE-5DF9-4060-ABF6-2795BA27E16A', 'QUH', 'TTP', 1),
('2DC44414-4803-40E5-BBDA-4346A72975F7', 'Huyện Tây Hoà', 'Huyện Tây Hoà', '562', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '754B7AF8-2404-4834-AA22-EDBBD14C7259', 'QUH', 'TTP', 1),
('2E334D5B-5AEA-4A7A-9019-BD7D9A7E39CF', 'Huyện Văn Quan', 'Huyện Văn Quan', '184', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CEB314BF-5661-403C-8000-CC304FA7DC83', 'QUH', 'TTP', 1),
('2E5E6CEB-68AE-41DC-A1FD-F3D9C451D4AB', 'Huyện Ea Súp', 'Huyện Ea Súp', '646', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('2F259EB8-D3EF-4248-A893-4753BC50F013', 'Huyện Sơn Tịnh', 'Huyện Sơn Tịnh', '527', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('2F31BF8D-53E4-47D8-9972-3C1C2F85CA96', 'Huyện Bình Tân', 'Huyện Bình Tân', '863', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B5CB01A7-6F5E-4BC0-8826-4352D738D05E', 'QUH', 'TTP', 1),
('2F367886-141B-4BBA-80DE-B0A13406E8A6', 'Quận Tây Hồ', 'Quận Tây Hồ', '003', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('2F7812B2-D286-44ED-9984-822A85F50B5B', 'Huyện Mù Căng Chải', 'Huyện Mù Căng Chải', '137', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '282D54D8-E4AB-4C8D-AC12-AC799D15CDD8', 'QUH', 'TTP', 1),
('2FA33C25-FAEA-458D-BF2E-919E7FFBC593', 'Huyện Tiên Lữ', 'Huyện Tiên Lữ', '332', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AA3ADACC-8811-4531-AB32-E09A5FDC59B5', 'QUH', 'TTP', 1),
('3068F07A-BBFB-40E2-9683-4A3DC1B44190', 'Huyện Tân Phước', 'Huyện Tân Phước', '818', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CE101B67-9ED6-4DC3-AC57-4019466AD287', 'QUH', 'TTP', 1),
('30F73630-3BD5-4BD3-AC73-0EA16440191A', 'Huyện Đắk RLấp', 'Huyện Đắk RLấp', '666', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FF133341-40E9-4660-BE50-D9CF0DEF3F40', 'QUH', 'TTP', 1),
('3117D435-FE34-4363-94DA-D8892C75199F', 'Thành phố Thái Nguyên', 'Thành phố Thái Nguyên', '164', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '45689A1B-349A-4AB6-BE46-CF3006D27D72', 'QUH', 'TTP', 1),
('32020BB7-82E5-49BE-9C27-5CA9E50CDA47', 'Thị xã Đông Triều', 'Thị xã Đông Triều', '205', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('321D8E1E-21A0-4DD0-B652-F15587DF8635', 'Huyện Cái Nước', 'Huyện Cái Nước', '969', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'ACB8FA1D-5761-4E6D-8A52-6033EFE4CDB8', 'QUH', 'TTP', 1),
('3242BBA4-1EAE-478E-8303-662A7931DB22', 'Huyện Phù Mỹ', 'Huyện Phù Mỹ', '545', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'QUH', 'TTP', 1),
('325263C3-9E78-4189-8395-C45BACB4EE41', 'Quận Hải Châu', 'Quận Hải Châu', '492', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C7F7DE77-EFE5-4879-89BD-98F121AF131D', 'QUH', 'TTP', 1),
('3295D143-2C9D-4BF1-BE8E-8AB322FCCFE5', 'Huyện Nhà Bè', 'Huyện Nhà Bè', '786', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('32CAEA33-24C8-4B50-B3B6-2DD4931657E6', 'Huyện Nam Giang', 'Huyện Nam Giang', '510', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('33071A49-EF8E-4F65-A375-6580EA9A8AA5', 'Thành phố Thanh Hóa', 'Thành phố Thanh Hóa', '380', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('33714309-6352-429A-BA45-6AC34573A2B2', 'Quận 6', 'Quận 6', '775', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('337B6040-BEFE-4201-8ABF-93D312D02B17', 'Huyện Lạc Thủy', 'Huyện Lạc Thủy', '159', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '4893732C-9C2A-4DF2-967C-0956A1476C5D', 'QUH', 'TTP', 1),
('338233C2-A33C-4402-BBC7-BD6BA90994F2', 'Tỉnh Cao Bằng', 'Tỉnh Cao Bằng', '04', '2018-06-03 13:08:27', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:27', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('33AFA5B6-03DF-41FE-AEA4-FD456A1DE2CF', 'Huyện Yên Định', 'Huyện Yên Định', '394', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('33BB18AD-EE05-4577-A42A-F44C1431A172', 'Huyện Sơn Hà', 'Huyện Sơn Hà', '529', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('33BF7FD8-C25D-4913-815A-15785B43B408', 'Tỉnh Gia Lai', 'Tỉnh Gia Lai', '64', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('33C67435-A76B-402C-B141-577C0DBC12DA', 'Huyện Phú Tân', 'Huyện Phú Tân', '972', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'ACB8FA1D-5761-4E6D-8A52-6033EFE4CDB8', 'QUH', 'TTP', 1),
('34058D77-17A5-4CD0-833F-9069507D50C3', 'Huyện Tịnh Biên', 'Huyện Tịnh Biên', '890', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F06D7E55-3CB9-4ED9-814D-051F26232112', 'QUH', 'TTP', 1),
('343CEDB4-C2C3-4EEB-9594-A1B9674B3E85', 'Huyện Lục Ngạn', 'Huyện Lục Ngạn', '219', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '69691148-5255-44CB-A176-02D504EA7BD0', 'QUH', 'TTP', 1),
('3453EF37-1326-4DDA-BF5C-6FC3027F0129', 'Huyện Thoại Sơn', 'Huyện Thoại Sơn', '894', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F06D7E55-3CB9-4ED9-814D-051F26232112', 'QUH', 'TTP', 1),
('34B3C729-4B9B-4F04-B87A-5D2543E6A8BF', 'Thị xã Sơn Tây', 'Thị xã Sơn Tây', '269', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('350F0788-96DC-4B31-BCAC-5EED96F5B1FD', 'Huyện Như Thanh', 'Huyện Như Thanh', '403', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('3514335F-EF96-4848-917D-35A22EE62FFA', 'Quận Ô Môn', 'Quận Ô Môn', '917', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D83D5950-2F31-460A-9C05-FEB9D248F3CB', 'QUH', 'TTP', 1),
('358113B7-EA0D-4C72-94D7-B23E5290DB10', 'Huyện Cần Giuộc', 'Huyện Cần Giuộc', '807', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('35CFDCED-19C4-4374-8307-37954C8EEAA1', 'Huyện Hiệp Đức', 'Huyện Hiệp Đức', '512', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('3615D230-E651-44BD-BB9D-89FFED25C094', 'Thị xã Vĩnh Châu', 'Thị xã Vĩnh Châu', '950', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'QUH', 'TTP', 1),
('3639EA4A-7E1D-4635-8E5D-1747E26737FC', 'Huyện Cẩm Thủy', 'Huyện Cẩm Thủy', '390', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('37AC6E85-E06A-4541-8CB7-FB645B81A5CE', 'Huyện Trà Cú', 'Huyện Trà Cú', '849', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8842C8E4-BE1D-4331-867E-48BB0F917BAD', 'QUH', 'TTP', 1),
('37F81E15-B331-4BF1-8BF0-ABBA14A820CF', 'Tỉnh Quảng Bình', 'Tỉnh Quảng Bình', '44', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('384376E9-64C9-48DF-A70A-FBCD53B8BF21', 'Huyện Khánh Vĩnh', 'Huyện Khánh Vĩnh', '573', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8AE422A1-1C4E-4068-A0C6-439BD66E0909', 'QUH', 'TTP', 1),
('3844EB1F-F6F3-4D6C-8572-A125E1F03700', 'Huyện Tân Thành', 'Huyện Tân Thành', '754', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '3AFAD985-4549-4B26-921A-712A0040B140', 'QUH', 'TTP', 1),
('3889A6AD-7FF6-4CC5-B65B-3EB6C36B2F37', 'Huyện Kỳ Sơn', 'Huyện Kỳ Sơn', '417', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('388DF190-A725-4CB1-94C0-029A15786170', 'Huyện Phong Thổ', 'Huyện Phong Thổ', '109', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD7E781A-60AD-46FA-94F9-09F39FA13922', 'QUH', 'TTP', 1),
('38B99F61-567B-43DB-AE4E-604414F10A14', 'Huyện Lắk', 'Huyện Lắk', '656', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('38C72662-50B0-4124-A8F1-2AA99B42B0F8', 'Thành phố Tây Ninh', 'Thành phố Tây Ninh', '703', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A84202BA-4C3F-4705-B69F-0A6706985E47', 'QUH', 'TTP', 1),
('38CD938D-110D-4403-A0D3-DB5DB3F67B4C', 'Huyện Vị Xuyên', 'Huyện Vị Xuyên', '030', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2B069E88-4B37-4507-839A-40A54824E2C9', 'QUH', 'TTP', 1),
('38D724CD-0F3A-42DD-8228-7A10FECD91C8', 'Huyện Hoằng Hóa', 'Huyện Hoằng Hóa', '399', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('3951FE1A-5E60-434B-8C1B-B2A59460942B', 'Thị xã Điện Bàn', 'Thị xã Điện Bàn', '507', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1);
INSERT INTO `lookupdata` (`id`, `title`, `description`, `contentHTML`, `created_date`, `created_by`, `updated_date`, `updated_by`, `parent_id`, `entity_code`, `requiring_entity_code`, `status`) VALUES
('39967DF5-DAD5-434E-B36D-924AF1FFC85A', 'Huyện Tân Sơn', 'Huyện Tân Sơn', '240', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('39CD62C0-682A-4E74-AC54-4821771E9426', 'Huyện Cát Tiên', 'Huyện Cát Tiên', '683', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('39E03E27-9447-43A1-BA31-549922410C56', 'Huyện Yên Dũng', 'Huyện Yên Dũng', '221', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '69691148-5255-44CB-A176-02D504EA7BD0', 'QUH', 'TTP', 1),
('3A00463E-3C85-46B2-916E-93F06D415FE8', 'Thị xã Phổ Yên', 'Thị xã Phổ Yên', '172', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '45689A1B-349A-4AB6-BE46-CF3006D27D72', 'QUH', 'TTP', 1),
('3A264651-3261-464A-9600-15E9C17FE884', 'Huyện Triệu Sơn', 'Huyện Triệu Sơn', '397', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('3A8A9B2F-D0D2-435D-BB13-BCCB9324D772', 'Huyện Ba Bể', 'Huyện Ba Bể', '061', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C40DAA9A-5CBD-4265-9B7B-A74329857C0B', 'QUH', 'TTP', 1),
('3ACB9E5C-7D17-422A-BAE9-E86A5AD5BF8A', 'Huyện Krông Bông', 'Huyện Krông Bông', '653', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('3ae8cf90-6311-11e8-9185-276e155d0fc2', 'LinLin', NULL, NULL, '2018-05-29 14:23:48', 'operamart', NULL, NULL, NULL, 'BND', NULL, 1),
('3AFAD985-4549-4B26-921A-712A0040B140', 'Tỉnh Bà Rịa - Vũng Tàu', 'Tỉnh Bà Rịa - Vũng Tàu', '77', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('3B01624F-EEB8-47B9-B4B4-88D92FEDE2F1', 'Huyện Ninh Phước', 'Huyện Ninh Phước', '587', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '72DABCBE-5DF9-4060-ABF6-2795BA27E16A', 'QUH', 'TTP', 1),
('3BA4C3AE-4A17-4E0B-9094-3A9014DD00F6', 'Huyện Hòa Thành', 'Huyện Hòa Thành', '709', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A84202BA-4C3F-4705-B69F-0A6706985E47', 'QUH', 'TTP', 1),
('3CD51C7E-40FF-4009-8E90-57EE65807E79', 'Thành phố Thái Bình', 'Thành phố Thái Bình', '336', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CFEA534D-A741-4E92-AA89-4CF6D6CBCA35', 'QUH', 'TTP', 1),
('3D188E07-EA3E-4C6D-BB08-651BCE844778', 'Tỉnh Điện Biên', 'Tỉnh Điện Biên', '11', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('3DBCA11B-BC74-4DC9-8EF9-879D64244109', 'Huyện Phú Quốc', 'Huyện Phú Quốc', '911', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('3E1DBF3E-7DBA-4C6A-81DB-FBEB95D3B471', 'Huyện Ea Kar', 'Huyện Ea Kar', '651', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('3E2F918C-52BD-4A6F-B385-72EAD984EC74', 'Huyện Trạm Tấu', 'Huyện Trạm Tấu', '139', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '282D54D8-E4AB-4C8D-AC12-AC799D15CDD8', 'QUH', 'TTP', 1),
('3EC9082F-86F1-4935-A7B5-B04155BFC0F7', 'Huyện Nam Đàn', 'Huyện Nam Đàn', '430', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('3F0A56EA-7E6D-4C4E-94A2-F3A68E0ABECB', 'Huyện Phước Sơn', 'Huyện Phước Sơn', '511', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('3F48078E-197A-48EC-BC4A-821478E2B1D6', 'Quận Hồng Bàng', 'Quận Hồng Bàng', '303', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('4062DF81-5E95-4D37-A371-45F84E8C5297', 'Huyện Điện Biên', 'Huyện Điện Biên', '100', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '3D188E07-EA3E-4C6D-BB08-651BCE844778', 'QUH', 'TTP', 1),
('40D77EF8-704C-40CA-A61E-EF4468047A6F', 'Thị xã Đồng Xoài', 'Thị xã Đồng Xoài', '689', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'QUH', 'TTP', 1),
('4116AAE2-5060-434A-BDC7-73A0215BCCB5', 'Huyện Long Mỹ', 'Huyện Long Mỹ', '936', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD62365E-1F44-4A11-ACCC-FA51D96AC4F6', 'QUH', 'TTP', 1),
('41A8D15F-AEAF-48A5-9ECB-A0586876D7D8', 'Huyện Bắc Trà My', 'Huyện Bắc Trà My', '515', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('427BEC71-AC34-4794-8B6E-BE17ABD7B8D1', 'Huyện Lệ Thủy', 'Huyện Lệ Thủy', '457', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '37F81E15-B331-4BF1-8BF0-ABBA14A820CF', 'QUH', 'TTP', 1),
('428EB6B3-30AC-48BA-A03D-51F0EE5C1BFA', 'Huyện Hàm Thuận Nam', 'Huyện Hàm Thuận Nam', '598', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FA7763AF-DA21-4423-930B-45EB04281CF3', 'QUH', 'TTP', 1),
('42D61C65-2A29-4E29-A630-6A96DD964DE1', 'Thị xã Thái Hoà', 'Thị xã Thái Hoà', '414', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('42F5D688-AE03-4C22-91F6-9A289B062E01', 'Huyện Cầu Kè', 'Huyện Cầu Kè', '845', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8842C8E4-BE1D-4331-867E-48BB0F917BAD', 'QUH', 'TTP', 1),
('432D414F-EAA5-4D2B-8AFB-24CF489879C2', 'Thành phố Cẩm Phả', 'Thành phố Cẩm Phả', '195', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('44097E07-7F19-46F3-AB11-E1D0019659B8', 'Huyện Dầu Tiếng', 'Huyện Dầu Tiếng', '720', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '0ACA0257-5987-45FC-BBA7-CD6235DE3C23', 'QUH', 'TTP', 1),
('44172B03-124E-4AED-BB71-AB09FA82A456', 'Huyện Xín Mần', 'Huyện Xín Mần', '033', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2B069E88-4B37-4507-839A-40A54824E2C9', 'QUH', 'TTP', 1),
('448F43F8-A4D2-4297-88E6-ED82240892A0', 'Quận 3', 'Quận 3', '770', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('44B79589-2DFE-482D-B65F-EC681C77CBB4', 'Thành phố Lạng Sơn', 'Thành phố Lạng Sơn', '178', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CEB314BF-5661-403C-8000-CC304FA7DC83', 'QUH', 'TTP', 1),
('45689A1B-349A-4AB6-BE46-CF3006D27D72', 'Tỉnh Thái Nguyên', 'Tỉnh Thái Nguyên', '19', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('457A4BCE-F8A9-433E-840C-62C4FAE75C0B', 'Huyện Hưng Hà', 'Huyện Hưng Hà', '339', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CFEA534D-A741-4E92-AA89-4CF6D6CBCA35', 'QUH', 'TTP', 1),
('45AEB412-4C77-4EB7-9714-036A370C0CB4', 'Thị Xã Mường Lay', 'Thị Xã Mường Lay', '095', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '3D188E07-EA3E-4C6D-BB08-651BCE844778', 'QUH', 'TTP', 1),
('45C3DEEB-AE69-4AF4-94F5-3FBB6AA0C095', 'Huyện Hàm Tân', 'Huyện Hàm Tân', '601', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FA7763AF-DA21-4423-930B-45EB04281CF3', 'QUH', 'TTP', 1),
('4643F472-A154-4BA0-94F4-A284BD8DCCBE', 'Thành phố Hà Giang', 'Thành phố Hà Giang', '024', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2B069E88-4B37-4507-839A-40A54824E2C9', 'QUH', 'TTP', 1),
('46C694B4-AA99-442E-A25F-055172ED382B', 'Huyện Quảng Trạch', 'Huyện Quảng Trạch', '454', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '37F81E15-B331-4BF1-8BF0-ABBA14A820CF', 'QUH', 'TTP', 1),
('46E11EBA-6EC3-42FA-B251-A4E7FBC7AE5A', 'Thành phố Pleiku', 'Thành phố Pleiku', '622', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('46F9116F-B5CA-4B8C-88C9-990185D0C0A9', 'Thành phố Nam Định', 'Thành phố Nam Định', '356', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BDB21B56-A793-465E-8A4F-7B2E4D5849A0', 'QUH', 'TTP', 1),
('47933880-2823-4DC2-9B97-11ADEC85D1D8', 'Quận Đống Đa', 'Quận Đống Đa', '006', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('488FF020-F2E4-414F-835C-95A23108E164', 'Huyện Xuân Lộc', 'Huyện Xuân Lộc', '741', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'QUH', 'TTP', 1),
('4893732C-9C2A-4DF2-967C-0956A1476C5D', 'Tỉnh Hoà Bình', 'Tỉnh Hoà Bình', '17', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('48D83F03-E362-4182-BED9-B4B21C6B9B46', 'Huyện Sông Hinh', 'Huyện Sông Hinh', '561', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '754B7AF8-2404-4834-AA22-EDBBD14C7259', 'QUH', 'TTP', 1),
('48E5BDBB-7C42-4621-B57B-F7B4B70D430F', 'Huyện Quỳ Hợp', 'Huyện Quỳ Hợp', '420', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('49B91D36-9233-4809-B76F-E2698C7EAC4C', 'Huyện  Vũng Liêm', 'Huyện  Vũng Liêm', '859', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B5CB01A7-6F5E-4BC0-8826-4352D738D05E', 'QUH', 'TTP', 1),
('4A3AE2F7-F7C8-46AB-9993-ADA7CEA278FA', 'Quận Kiến An', 'Quận Kiến An', '307', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('4A4995C6-A158-4C90-ACAF-AF177A5E3FF5', 'Huyện Vũ Quang', 'Huyện Vũ Quang', '441', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('4a709ffc-42a9-11e8-842f-0ed5f89f718b', 'Phường Tân Định', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70a29a-42a9-11e8-842f-0ed5f89f718b', 'Phường Đa Kao', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70a506-42a9-11e8-842f-0ed5f89f718b', 'Phường Bến Nghé', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70a66e-42a9-11e8-842f-0ed5f89f718b', 'Phường Bến Thành', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70a79a-42a9-11e8-842f-0ed5f89f718b', 'Phường Nguyễn Thái Bình', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70aace-42a9-11e8-842f-0ed5f89f718b', 'Phường Phạm Ngũ Lão', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70ac18-42a9-11e8-842f-0ed5f89f718b', 'Phường Cầu Ông Lãnh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70ad4e-42a9-11e8-842f-0ed5f89f718b', 'Phường Cô Giang', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70ae70-42a9-11e8-842f-0ed5f89f718b', 'Phường Nguyễn Cư Trinh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70af88-42a9-11e8-842f-0ed5f89f718b', 'Phường Cầu Kho', NULL, NULL, '2018-04-17 00:00:00', 'df02a498-4223-11e8-842f-0ed5f89f718b', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70b0b4-42a9-11e8-842f-0ed5f89f718b', 'Phường Thạnh Xuân', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70b3d4-42a9-11e8-842f-0ed5f89f718b', 'Phường Thạnh Lộc', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70b514-42a9-11e8-842f-0ed5f89f718b', 'Phường Hiệp Thành', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70b636-42a9-11e8-842f-0ed5f89f718b', 'Phường Thới An', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70b758-42a9-11e8-842f-0ed5f89f718b', 'Phường Tân Chánh Hiệp', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70b87a-42a9-11e8-842f-0ed5f89f718b', 'Phường An Phú Đông', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70b99c-42a9-11e8-842f-0ed5f89f718b', 'Phường Tân Thới Hiệp', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70bcc6-42a9-11e8-842f-0ed5f89f718b', 'Phường Trung Mỹ Tây', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70be60-42a9-11e8-842f-0ed5f89f718b', 'Phường Tân Hưng Thuận', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70bfbe-42a9-11e8-842f-0ed5f89f718b', 'Phường Đông Hưng Thuận', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4a70c0ea-42a9-11e8-842f-0ed5f89f718b', 'Phường Tân Thới Nhất', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('4A776A00-055C-44A4-99E9-324DF95CA2CE', 'Thị xã La Gi', 'Thị xã La Gi', '594', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FA7763AF-DA21-4423-930B-45EB04281CF3', 'QUH', 'TTP', 1),
('4A779451-2869-4EAB-BBE0-5636062971FD', 'Huyện Tân Hồng', 'Huyện Tân Hồng', '869', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('4A865584-3084-4903-9D98-994A8281EBCC', 'Huyện Đầm Dơi', 'Huyện Đầm Dơi', '970', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'ACB8FA1D-5761-4E6D-8A52-6033EFE4CDB8', 'QUH', 'TTP', 1),
('4B5A5F1F-A989-41F6-8C52-A0F91DE6E13F', 'Huyện Tủa Chùa', 'Huyện Tủa Chùa', '098', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '3D188E07-EA3E-4C6D-BB08-651BCE844778', 'QUH', 'TTP', 1),
('4BFB9C7B-D97F-4144-9F09-656F05DE908C', 'Quận 9', 'Quận 9', '763', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('4C1807BE-AB81-44D1-9A7D-A2A4C0BB1025', 'Huyện Đức Cơ', 'Huyện Đức Cơ', '631', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('4C1891CB-E996-49AC-A69E-A29A021D6546', 'Huyện Lâm Thao', 'Huyện Lâm Thao', '237', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('4C24FB22-BCB1-403B-8011-B5CDBBBDE29F', 'Huyện Đam Rông', 'Huyện Đam Rông', '674', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('4C6A074E-7D12-4A34-A2AD-34537B514116', 'Huyện Hữu Lũng', 'Huyện Hữu Lũng', '186', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CEB314BF-5661-403C-8000-CC304FA7DC83', 'QUH', 'TTP', 1),
('4DD246D8-F69D-4EFF-8B71-1ABA1B70DFC6', 'Huyện Yên Mỹ', 'Huyện Yên Mỹ', '327', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AA3ADACC-8811-4531-AB32-E09A5FDC59B5', 'QUH', 'TTP', 1),
('4E0FE69A-5913-48CB-AFAC-1116D96A5BD9', 'Huyện Ý Yên', 'Huyện Ý Yên', '360', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BDB21B56-A793-465E-8A4F-7B2E4D5849A0', 'QUH', 'TTP', 1),
('4EB878E5-6E1A-44A6-BFD2-5B461F92BF5B', 'Huyện Phụng Hiệp', 'Huyện Phụng Hiệp', '934', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD62365E-1F44-4A11-ACCC-FA51D96AC4F6', 'QUH', 'TTP', 1),
('4F8E36FB-FF19-4D28-AE2A-C05C976AE5FD', 'Huyện Tân Phú Đông', 'Huyện Tân Phú Đông', '825', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CE101B67-9ED6-4DC3-AC57-4019466AD287', 'QUH', 'TTP', 1),
('4FE203B9-D6E0-4584-8EE5-6EA1ED2B30AA', 'Huyện Đông Hòa', 'Huyện Đông Hòa', '564', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '754B7AF8-2404-4834-AA22-EDBBD14C7259', 'QUH', 'TTP', 1),
('501A460E-5685-4032-8E6B-8A88142264A6', 'Huyện Quỳ Châu', 'Huyện Quỳ Châu', '416', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('50667B82-E6BF-4BCC-9DA9-ABA0CFB4BD5A', 'Thị xã Long Mỹ', 'Thị xã Long Mỹ', '937', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD62365E-1F44-4A11-ACCC-FA51D96AC4F6', 'QUH', 'TTP', 1),
('5098EA6E-C364-461D-8EAF-87518DBA4CE4', 'Thành phố Hải Dương', 'Thành phố Hải Dương', '288', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('50B43C84-E173-46A8-888A-C7C6E2807D1F', 'Huyện Tam Dương', 'Huyện Tam Dương', '247', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '28ED8435-E4A9-418C-B888-DA9A05822474', 'QUH', 'TTP', 1),
('5129EAA0-2F29-46BE-8DCE-C994AA74144D', 'Huyện Thăng Bình', 'Huyện Thăng Bình', '513', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('5196AD30-BDB3-426C-B35E-FDE1FF607EBF', 'Huyện Ba Tri', 'Huyện Ba Tri', '836', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2D09B09F-87A7-4A58-8116-A6DD1F727397', 'QUH', 'TTP', 1),
('51FD3220-756E-4B38-8E72-EA382E5A277E', 'Huyện Chợ Mới', 'Huyện Chợ Mới', '893', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F06D7E55-3CB9-4ED9-814D-051F26232112', 'QUH', 'TTP', 1),
('52331A6F-D11D-498E-B3A7-01DC4E6E55A1', 'Thị xã Phúc Yên', 'Thị xã Phúc Yên', '244', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '28ED8435-E4A9-418C-B888-DA9A05822474', 'QUH', 'TTP', 1),
('52DCCECA-0CCA-4A4B-BBB1-D7B2EF14F3DD', 'Thị xã Hà Tiên', 'Thị xã Hà Tiên', '900', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('536338A5-2032-44F0-9E0C-7AF347239946', 'Huyện Hương Sơn', 'Huyện Hương Sơn', '439', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('544E9938-3F9B-4A55-A73D-03FD004127A9', 'Huyện Bình Xuyên', 'Huyện Bình Xuyên', '249', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '28ED8435-E4A9-418C-B888-DA9A05822474', 'QUH', 'TTP', 1),
('54F968F5-EE66-404B-8EFC-AF52C030E690', 'Quận Phú Nhuận', 'Quận Phú Nhuận', '768', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('55938387-6D4F-4A46-8AEE-64BA5D15E9C1', 'Thành phố Sóc Trăng', 'Thành phố Sóc Trăng', '941', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'QUH', 'TTP', 1),
('55A43243-D626-4223-BA21-3ECF08DAE6A5', 'Tỉnh Tuyên Quang', 'Tỉnh Tuyên Quang', '08', '2018-06-03 13:08:27', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:27', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('55D8D9A2-38FF-42C3-8DE7-EAA06B584518', 'Quận 8', 'Quận 8', '776', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('56A5436D-A523-4262-96D3-FBC6292D32A7', 'Huyện Đăk Đoa', 'Huyện Đăk Đoa', '626', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('570604DD-093D-4731-96A2-0993C542B0DF', 'Huyện Nghĩa Hưng', 'Huyện Nghĩa Hưng', '361', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BDB21B56-A793-465E-8A4F-7B2E4D5849A0', 'QUH', 'TTP', 1),
('57304EF0-9AF7-456D-9135-F4F9922FB738', 'Thị xã Hương Thủy', 'Thị xã Hương Thủy', '479', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C506D9F3-4449-4637-A137-B1DE7CEA7FE3', 'QUH', 'TTP', 1),
('574887A1-2893-4C17-A9AB-FEAA86D20E4D', 'Huyện Thanh Hà', 'Huyện Thanh Hà', '294', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('576E9205-BAC4-447A-82B1-496A5E20BF98', 'Huyện Long Hồ', 'Huyện Long Hồ', '857', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B5CB01A7-6F5E-4BC0-8826-4352D738D05E', 'QUH', 'TTP', 1),
('5800D043-9668-436E-A8D8-7A37C22A76BD', 'Quận Hoàng Mai', 'Quận Hoàng Mai', '008', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('588D5DCB-7A7F-4807-B788-F750A751FAC4', 'Huyện Bảo Thắng', 'Huyện Bảo Thắng', '086', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DC9794FA-76CC-4E86-963E-7A6B1182F377', 'QUH', 'TTP', 1),
('5890D32F-89DC-4054-A169-965F9B2B777C', 'Thành phố Bạc Liêu', 'Thành phố Bạc Liêu', '954', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8C844847-580C-49E6-A65F-06531FAFF098', 'QUH', 'TTP', 1),
('589E16E5-BDB7-4B8A-9570-36027CA15850', 'Huyện Châu Thành', 'Huyện Châu Thành', '808', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('5973C039-8A06-4EAF-B759-48C06395D5E8', 'Huyện Thống Nhất', 'Huyện Thống Nhất', '738', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'QUH', 'TTP', 1),
('5A1E0C50-E7A5-4A76-949B-DCAA1689B95E', 'Huyện Ân Thi', 'Huyện Ân Thi', '329', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AA3ADACC-8811-4531-AB32-E09A5FDC59B5', 'QUH', 'TTP', 1),
('5A61343E-B0DE-4C24-A56C-2E5849980449', 'Huyện Krông Năng', 'Huyện Krông Năng', '650', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('5ABC902C-56FE-4241-AFD4-B96E82E65DA5', 'Huyện Lộc Hà', 'Huyện Lộc Hà', '448', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('5BC9F575-078B-4953-A82C-4AE4A9589331', 'Thành phố Cao Bằng', 'Thành phố Cao Bằng', '040', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('5C056DE6-D2A1-4A8A-9D0F-BA312B5946A2', 'Huyện Hải Hậu', 'Huyện Hải Hậu', '366', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BDB21B56-A793-465E-8A4F-7B2E4D5849A0', 'QUH', 'TTP', 1),
('5C279BFA-1FDA-4041-BEE6-123547B7092C', 'Huyện Thuận Thành', 'Huyện Thuận Thành', '262', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '27C7B617-982E-45ED-AC64-6B99814282A9', 'QUH', 'TTP', 1),
('5C976280-C9CC-49EC-A6A8-369941ED47A1', 'Huyện Bắc Sơn', 'Huyện Bắc Sơn', '185', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CEB314BF-5661-403C-8000-CC304FA7DC83', 'QUH', 'TTP', 1),
('5CC4A56A-71D0-4027-A0BE-B005901EE4E7', 'Thành phố Tuyên Quang', 'Thành phố Tuyên Quang', '070', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '55A43243-D626-4223-BA21-3ECF08DAE6A5', 'QUH', 'TTP', 1),
('5D0D1C17-1FE9-4C70-BFE1-3F5651E5C656', 'Thị xã Tân Uyên', 'Thị xã Tân Uyên', '723', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '0ACA0257-5987-45FC-BBA7-CD6235DE3C23', 'QUH', 'TTP', 1),
('5D103F5A-470D-4EB0-9911-1AE3635C8845', 'Huyện Trà Lĩnh', 'Huyện Trà Lĩnh', '046', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('5D66C82C-31C5-4E73-B3ED-9AAA4291BE17', 'Thành phố Phan Thiết', 'Thành phố Phan Thiết', '593', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FA7763AF-DA21-4423-930B-45EB04281CF3', 'QUH', 'TTP', 1),
('5E2DEC1A-DC1D-41B3-A3A6-89910111077A', 'Thành phố Hạ Long', 'Thành phố Hạ Long', '193', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('5E7223F2-8778-41C6-80F4-39E87D1F14E6', 'Huyện Cư Kuin', 'Huyện Cư Kuin', '657', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('5EBD8751-6FB6-4583-A7CC-CFC73DFDD49B', 'Huyện Quỳnh Phụ', 'Huyện Quỳnh Phụ', '338', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CFEA534D-A741-4E92-AA89-4CF6D6CBCA35', 'QUH', 'TTP', 1),
('5F0FD84C-4CF1-4F7A-BAE4-572D51BC2D09', 'Huyện Krông Nô', 'Huyện Krông Nô', '664', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FF133341-40E9-4660-BE50-D9CF0DEF3F40', 'QUH', 'TTP', 1),
('5F7A4420-1461-4E96-8659-963BB1B50858', 'Thành phố Ninh Bình', 'Thành phố Ninh Bình', '369', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AD811A40-F9A5-4676-B9D5-43B844BA25B2', 'QUH', 'TTP', 1),
('5F7F3120-C69F-4C85-9999-5BD020ED74D2', 'Huyện Đoan Hùng', 'Huyện Đoan Hùng', '230', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('5F8C35AE-6BC8-4A25-8A5D-2AD14F9528BA', 'Huyện Lang Chánh', 'Huyện Lang Chánh', '388', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('5FB0F1CA-FD73-4F39-9D40-F69E89AEAEB0', 'Quận Thanh Xuân', 'Quận Thanh Xuân', '009', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('5FFC9D94-9343-4A07-B3C2-C07F982D48C1', 'Thành phố Vị Thanh', 'Thành phố Vị Thanh', '930', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD62365E-1F44-4A11-ACCC-FA51D96AC4F6', 'QUH', 'TTP', 1),
('6051E2B7-372A-494B-8891-F9ED39849C37', 'Quận 12', 'Quận 12', '761', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('60661579-BA84-4F03-9CF1-68319C655465', 'Huyện Phù Cát', 'Huyện Phù Cát', '548', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'QUH', 'TTP', 1),
('60E7E397-CB24-4652-9BE5-B1E878E8EE4A', 'Thành phố Bà Rịa', 'Thành phố Bà Rịa', '748', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '3AFAD985-4549-4B26-921A-712A0040B140', 'QUH', 'TTP', 1),
('614B71BA-6F75-42E7-841B-12AC0FC3AC59', 'Huyện Diễn Châu', 'Huyện Diễn Châu', '425', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('6152DA98-18FC-4B57-AC06-3F2B1FB2DCAF', 'Huyện Đạ Tẻh', 'Huyện Đạ Tẻh', '682', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('617EB848-B23D-404B-BA72-25FF25F782BF', 'Huyện Bình Chánh', 'Huyện Bình Chánh', '785', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('6201348E-CD2C-48B7-943A-F8D0469D51ED', 'Huyện Tứ Kỳ', 'Huyện Tứ Kỳ', '298', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('62CD3DF1-5B4D-4C9B-9219-99A373C22890', 'Huyện Giồng Trôm', 'Huyện Giồng Trôm', '834', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2D09B09F-87A7-4A58-8116-A6DD1F727397', 'QUH', 'TTP', 1),
('62FA7FA1-F83D-47A2-9A71-9BBD932E195C', 'Quận Ngũ Hành Sơn', 'Quận Ngũ Hành Sơn', '494', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C7F7DE77-EFE5-4879-89BD-98F121AF131D', 'QUH', 'TTP', 1),
('634B3EF7-92F2-45F5-99E7-B2009691BCD6', 'Thành phố Phan Rang-Tháp Chàm', 'Thành phố Phan Rang-Tháp Chàm', '582', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '72DABCBE-5DF9-4060-ABF6-2795BA27E16A', 'QUH', 'TTP', 1),
('6401D7E0-F8ED-45F1-AEFD-B597E52071A1', 'Quận Bắc Từ Liêm', 'Quận Bắc Từ Liêm', '021', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('64407525-A0ED-4EB2-A0CB-265E87CCE233', 'Thị xã Chí Linh', 'Thị xã Chí Linh', '290', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('64831686-4F62-4B9F-8FB6-FA296CAA3C41', 'Huyện Trùng Khánh', 'Huyện Trùng Khánh', '047', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('649AC4DA-9879-41E0-8286-43D8CC9EB8C0', 'Thị xã Quảng Yên', 'Thị xã Quảng Yên', '206', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('64E333A4-4176-4C3F-90A6-CE9701EC9D19', 'Thành phố Sông Công', 'Thành phố Sông Công', '165', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '45689A1B-349A-4AB6-BE46-CF3006D27D72', 'QUH', 'TTP', 1),
('65C92D22-5799-4E21-9B98-5E5537E51EFD', 'Huyện Kim Bôi', 'Huyện Kim Bôi', '153', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '4893732C-9C2A-4DF2-967C-0956A1476C5D', 'QUH', 'TTP', 1),
('65E81DE0-1E5A-4010-B004-7532BCD406FD', 'Huyện Thạch Thành', 'Huyện Thạch Thành', '391', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('66665172-D7A1-46D4-876A-018FF37C8FF2', 'Huyện Yên Lạc', 'Huyện Yên Lạc', '251', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '28ED8435-E4A9-418C-B888-DA9A05822474', 'QUH', 'TTP', 1),
('66672811-3537-4A2A-B0BB-7BCA61DAF19A', 'Huyện Lương Sơn', 'Huyện Lương Sơn', '152', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '4893732C-9C2A-4DF2-967C-0956A1476C5D', 'QUH', 'TTP', 1),
('677368A7-063A-430D-995F-2BFD16E5D8A1', 'Huyện Vĩnh Thạnh', 'Huyện Vĩnh Thạnh', '546', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'QUH', 'TTP', 1),
('67C1AD35-34A2-45B0-A063-C1CC52683C09', 'Huyện Châu Thành', 'Huyện Châu Thành', '892', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F06D7E55-3CB9-4ED9-814D-051F26232112', 'QUH', 'TTP', 1),
('67D55D5E-49D1-4F7A-9AAA-05F94AEABFA0', 'Huyện Càng Long', 'Huyện Càng Long', '844', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8842C8E4-BE1D-4331-867E-48BB0F917BAD', 'QUH', 'TTP', 1),
('67FD9FEB-FAEB-4576-AB3D-7090C10C0309', 'Huyện Vân Đồn', 'Huyện Vân Đồn', '203', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('681D8779-B484-4B10-A881-85A748B5581E', 'Huyện Đồng Văn', 'Huyện Đồng Văn', '026', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2B069E88-4B37-4507-839A-40A54824E2C9', 'QUH', 'TTP', 1),
('681F19D1-2573-49C0-894E-D67DB6D0F059', 'Huyện Ninh Hải', 'Huyện Ninh Hải', '586', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '72DABCBE-5DF9-4060-ABF6-2795BA27E16A', 'QUH', 'TTP', 1),
('68A3B885-0CDF-4C05-BD04-C3E12EC81027', 'Huyện Bá Thước', 'Huyện Bá Thước', '386', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('68E70D94-A256-4C71-8F30-64C320AA8DFE', 'Huyện Quảng Điền', 'Huyện Quảng Điền', '477', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C506D9F3-4449-4637-A137-B1DE7CEA7FE3', 'QUH', 'TTP', 1),
('69691148-5255-44CB-A176-02D504EA7BD0', 'Tỉnh Bắc Giang', 'Tỉnh Bắc Giang', '24', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('69A0012B-5A4B-4330-B1B7-D825430CDB9C', 'Huyện Long Điền', 'Huyện Long Điền', '752', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '3AFAD985-4549-4B26-921A-712A0040B140', 'QUH', 'TTP', 1),
('6A33657E-0D8A-4F67-A1A3-E738EBDAE0B2', 'Thành phố Sơn La', 'Thành phố Sơn La', '116', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('6AA466AE-CDF1-4191-A0C2-9F26CC53BA75', 'Huyện Phú Bình', 'Huyện Phú Bình', '173', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '45689A1B-349A-4AB6-BE46-CF3006D27D72', 'QUH', 'TTP', 1),
('6AC8C786-76E9-4DA3-9227-46F0E5CC443D', 'Huyện Châu Thành', 'Huyện Châu Thành', '877', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('6B1B2C54-9571-4CA0-B883-0349BB04F5C3', 'Quận Hải An', 'Quận Hải An', '306', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('6B728B1E-5013-40F9-ACF9-D5A7BE4BBECB', 'Huyện Vĩnh Linh', 'Huyện Vĩnh Linh', '464', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BF26A0FA-1C5F-49A3-B2A7-4BAFE12CE043', 'QUH', 'TTP', 1),
('6BAE575B-9CC4-4AED-8DFB-2FDF040CED3D', 'Thành phố Uông Bí', 'Thành phố Uông Bí', '196', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('6BC3B4D3-415D-49D2-B88F-62171E785313', 'Huyện Di Linh', 'Huyện Di Linh', '679', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('6C02D6B8-127D-4130-B605-A7B9A0F542C1', 'Huyện Đức Phổ', 'Huyện Đức Phổ', '534', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('6C9F69D3-27AC-4BC8-AED7-719FFCE6621B', 'Huyện Quế Sơn', 'Huyện Quế Sơn', '509', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('6CC75E7C-12DC-457C-8764-4A0B5195BE72', 'Huyện Bắc Yên', 'Huyện Bắc Yên', '121', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('6D334724-B0C9-435E-A124-39F96A254822', 'Thành phố Tam Kỳ', 'Thành phố Tam Kỳ', '502', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('6D43C0F5-90E0-4D8E-9D11-4FAD3D2C14BB', 'Thành phố Lào Cai', 'Thành phố Lào Cai', '080', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DC9794FA-76CC-4E86-963E-7A6B1182F377', 'QUH', 'TTP', 1),
('6D866509-8B60-406C-A055-EC576664D856', 'Huyện Ngân Sơn', 'Huyện Ngân Sơn', '062', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C40DAA9A-5CBD-4265-9B7B-A74329857C0B', 'QUH', 'TTP', 1),
('6DAA843A-94E4-4660-9FD8-7F9AE7DD4D52', 'Quận 2', 'Quận 2', '769', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('6DF48657-BC1F-4F89-9CE3-76137CEF4962', 'Huyện Bến Lức', 'Huyện Bến Lức', '803', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('6E18E780-23C3-45D8-93E8-6B819209E830', 'Quận Đồ Sơn', 'Quận Đồ Sơn', '308', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('6E20C512-BF84-438D-AA37-78618EBF9BA6', 'Thành Phố Đồng Hới', 'Thành Phố Đồng Hới', '450', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '37F81E15-B331-4BF1-8BF0-ABBA14A820CF', 'QUH', 'TTP', 1),
('6EC093C3-65EF-4431-A089-C44812987576', 'Huyện Ứng Hòa', 'Huyện Ứng Hòa', '281', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('6F589E53-EACE-4E1B-AD1B-604B032B8E55', 'Huyện Thạnh Hóa', 'Huyện Thạnh Hóa', '800', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('6FA7F553-6FE7-49E6-9DD6-667759BFBA7E', 'Huyện Hạ Lang', 'Huyện Hạ Lang', '048', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('701B7291-5D9E-4076-A7E6-B8A42B1C7C3F', 'Huyện Thạnh Phú', 'Huyện Thạnh Phú', '837', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2D09B09F-87A7-4A58-8116-A6DD1F727397', 'QUH', 'TTP', 1),
('711E821E-9924-45AF-B48D-9AF8807D2FCE', 'Quận Tân Bình', 'Quận Tân Bình', '766', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('713104d0-630e-11e8-9185-276e155d0fc2', 'TAKA', NULL, NULL, '2018-05-29 14:03:51', 'operamart', '2018-05-29 14:04:38', 'operamart', NULL, 'BND', NULL, 1),
('71DC3BD0-1016-4704-A9E8-6137271C55D5', 'Huyện Quốc Oai', 'Huyện Quốc Oai', '275', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('71FAA4CE-A68D-4357-A8A6-BFA7CB655D9E', 'Huyện Thanh Trì', 'Huyện Thanh Trì', '020', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('721C5B34-8544-4BE3-B243-3A8EE406D95B', 'Huyện Văn Yên', 'Huyện Văn Yên', '136', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '282D54D8-E4AB-4C8D-AC12-AC799D15CDD8', 'QUH', 'TTP', 1),
('72239BF4-F7A0-4C74-9498-BCCE3270F363', 'Huyện Thường Xuân', 'Huyện Thường Xuân', '396', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('728EAB23-F804-47A4-8D84-15720E246D37', 'Thị Xã Buôn Hồ', 'Thị Xã Buôn Hồ', '644', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('729ACA3D-3DB3-4F78-8015-3C725475292A', 'Thành phố Hội An', 'Thành phố Hội An', '503', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('72DABCBE-5DF9-4060-ABF6-2795BA27E16A', 'Tỉnh Ninh Thuận', 'Tỉnh Ninh Thuận', '58', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('735D7C7F-04B1-48E3-9CFF-7F60572D8607', 'Quận Liên Chiểu', 'Quận Liên Chiểu', '490', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C7F7DE77-EFE5-4879-89BD-98F121AF131D', 'QUH', 'TTP', 1),
('7360707B-2FCA-44B1-8654-0864DD17B787', 'Thành phố Châu Đốc', 'Thành phố Châu Đốc', '884', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F06D7E55-3CB9-4ED9-814D-051F26232112', 'QUH', 'TTP', 1),
('73A7E836-D673-4AB3-966F-2770FA49C087', 'Huyện Bến Cầu', 'Huyện Bến Cầu', '711', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A84202BA-4C3F-4705-B69F-0A6706985E47', 'QUH', 'TTP', 1),
('742DA946-E232-4AAE-BA10-0F70B1A9A441', 'Huyện Phú Hoà', 'Huyện Phú Hoà', '563', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '754B7AF8-2404-4834-AA22-EDBBD14C7259', 'QUH', 'TTP', 1),
('74693842-A547-4702-8033-A407B30074D9', 'Huyện Bắc Quang', 'Huyện Bắc Quang', '034', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2B069E88-4B37-4507-839A-40A54824E2C9', 'QUH', 'TTP', 1);
INSERT INTO `lookupdata` (`id`, `title`, `description`, `contentHTML`, `created_date`, `created_by`, `updated_date`, `updated_by`, `parent_id`, `entity_code`, `requiring_entity_code`, `status`) VALUES
('74920ADC-E5EE-443D-B7D6-3A55CE0A4639', 'Huyện Bù Đốp', 'Huyện Bù Đốp', '693', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'QUH', 'TTP', 1),
('74BE2B44-77F9-4D84-BB94-8A7673B2E6BE', 'Huyện Cẩm Giàng', 'Huyện Cẩm Giàng', '295', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('74C07CE6-FE23-4D60-B1CC-4D94EF4C6822', 'Huyện Giao Thủy', 'Huyện Giao Thủy', '365', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BDB21B56-A793-465E-8A4F-7B2E4D5849A0', 'QUH', 'TTP', 1),
('754B7AF8-2404-4834-AA22-EDBBD14C7259', 'Tỉnh Phú Yên', 'Tỉnh Phú Yên', '54', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('755A1B1B-0E97-49EA-B39F-BB2ABBBD1A63', 'Huyện Đại Lộc', 'Huyện Đại Lộc', '506', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('758F84D8-5552-4FEE-8103-7558AEF15887', 'Huyện Cát Hải', 'Huyện Cát Hải', '317', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('765E9B63-E10F-4BB2-A369-867789ED09AC', 'Huyện Bình Sơn', 'Huyện Bình Sơn', '524', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('76811F3E-457F-4CB4-8DD3-EED65A59CF5C', 'Thị xã Bình Minh', 'Thị xã Bình Minh', '861', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B5CB01A7-6F5E-4BC0-8826-4352D738D05E', 'QUH', 'TTP', 1),
('76830364-4FA0-4B31-A21E-904638FA318E', 'Tỉnh Sơn La', 'Tỉnh Sơn La', '14', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('7791A549-8086-41CC-8D14-ACA964369704', 'Thị xã Ba Đồn', 'Thị xã Ba Đồn', '458', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '37F81E15-B331-4BF1-8BF0-ABBA14A820CF', 'QUH', 'TTP', 1),
('7835A9E1-ABFC-46AE-9BA0-A53B9C00420B', 'Thị xã Ngã Bảy', 'Thị xã Ngã Bảy', '931', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD62365E-1F44-4A11-ACCC-FA51D96AC4F6', 'QUH', 'TTP', 1),
('7839982E-EAE2-4636-8E77-52E4502625BC', 'Thành phố Cao Lãnh', 'Thành phố Cao Lãnh', '866', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('7881986D-C3CA-48D0-AE24-2D925E9AE7A5', 'Huyện Hồng Ngự', 'Huyện Hồng Ngự', '870', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('78D43697-B9F1-4A87-A089-BA348A609636', 'Tỉnh Thanh Hóa', 'Tỉnh Thanh Hóa', '38', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('7902a084-42ab-11e8-842f-0ed5f89f718b', 'Phường Linh Xuân', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902a322-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Chiểu', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902a4e4-42ab-11e8-842f-0ed5f89f718b', 'Phường Linh Trung', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902a62e-42ab-11e8-842f-0ed5f89f718b', 'Phường Tam Bình', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902a7d2-42ab-11e8-842f-0ed5f89f718b', 'Phường Tam Phú', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902ac1e-42ab-11e8-842f-0ed5f89f718b', 'Phường Hiệp Bình Phước', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902aee4-42ab-11e8-842f-0ed5f89f718b', 'Phường Hiệp Bình Chánh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902b074-42ab-11e8-842f-0ed5f89f718b', 'Phường Linh Chiểu', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902b1a0-42ab-11e8-842f-0ed5f89f718b', 'Phường Linh Tây', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902b43e-42ab-11e8-842f-0ed5f89f718b', 'Phường Linh Đông', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902b57e-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Thọ', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902b6aa-42ab-11e8-842f-0ed5f89f718b', 'Phường Trường Thọ', NULL, NULL, '2018-04-17 00:00:00', 'df0281d4-4223-11e8-842f-0ed5f89f718b', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902b7cc-42ab-11e8-842f-0ed5f89f718b', 'Phường Long Bình', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902b8ee-42ab-11e8-842f-0ed5f89f718b', 'Phường Long Thạnh Mỹ', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902bbd2-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Phú', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902bd08-42ab-11e8-842f-0ed5f89f718b', 'Phường Hiệp Phú', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902be2a-42ab-11e8-842f-0ed5f89f718b', 'Phường Tăng Nhơn Phú A', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902bf4c-42ab-11e8-842f-0ed5f89f718b', 'Phường Tăng Nhơn Phú B', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902c1fe-42ab-11e8-842f-0ed5f89f718b', 'Phường Phước Long B', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902c348-42ab-11e8-842f-0ed5f89f718b', 'Phường Phước Long A', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902c46a-42ab-11e8-842f-0ed5f89f718b', 'Phường Trường Thạnh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902c58c-42ab-11e8-842f-0ed5f89f718b', 'Phường Long Phước', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902c6ae-42ab-11e8-842f-0ed5f89f718b', 'Phường Long Trường', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902c91a-42ab-11e8-842f-0ed5f89f718b', 'Phường Phước Bình', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902cb54-42ab-11e8-842f-0ed5f89f718b', 'Phường Phú Hữu', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902ecce-42ab-11e8-842f-0ed5f89f718b', 'Phường 15', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902edf0-42ab-11e8-842f-0ed5f89f718b', 'Phường 13', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902f2f0-42ab-11e8-842f-0ed5f89f718b', 'Phường 17', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902f4bc-42ab-11e8-842f-0ed5f89f718b', 'Phường 6', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902f624-42ab-11e8-842f-0ed5f89f718b', 'Phường 16', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902f796-42ab-11e8-842f-0ed5f89f718b', 'Phường 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902fa84-42ab-11e8-842f-0ed5f89f718b', 'Phường 14', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902fbba-42ab-11e8-842f-0ed5f89f718b', 'Phường 10', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902fd68-42ab-11e8-842f-0ed5f89f718b', 'Phường 05', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902fea8-42ab-11e8-842f-0ed5f89f718b', 'Phường 07', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7902ffca-42ab-11e8-842f-0ed5f89f718b', 'Phường 04', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790302d6-42ab-11e8-842f-0ed5f89f718b', 'Phường 01', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903042a-42ab-11e8-842f-0ed5f89f718b', 'Phường 9', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903054c-42ab-11e8-842f-0ed5f89f718b', 'Phường 8', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903066e-42ab-11e8-842f-0ed5f89f718b', 'Phường 11', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79030790-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028440-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79030a9c-42ab-11e8-842f-0ed5f89f718b', 'Phường 13', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79030bf0-42ab-11e8-842f-0ed5f89f718b', 'Phường 11', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79030d08-42ab-11e8-842f-0ed5f89f718b', 'Phường 27', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79030e20-42ab-11e8-842f-0ed5f89f718b', 'Phường 26', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79030f42-42ab-11e8-842f-0ed5f89f718b', 'Phường 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79031258-42ab-11e8-842f-0ed5f89f718b', 'Phường 25', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79031384-42ab-11e8-842f-0ed5f89f718b', 'Phường 05', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790314a6-42ab-11e8-842f-0ed5f89f718b', 'Phường 07', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790315fa-42ab-11e8-842f-0ed5f89f718b', 'Phường 24', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79031730-42ab-11e8-842f-0ed5f89f718b', 'Phường 14', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79031a6e-42ab-11e8-842f-0ed5f89f718b', 'Phường 15', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79031bb8-42ab-11e8-842f-0ed5f89f718b', 'Phường 02', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79031d2a-42ab-11e8-842f-0ed5f89f718b', 'Phường 01', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79031e56-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79031f82-42ab-11e8-842f-0ed5f89f718b', 'Phường 17', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903225c-42ab-11e8-842f-0ed5f89f718b', 'Phường 21', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903240a-42ab-11e8-842f-0ed5f89f718b', 'Phường 22', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79032554-42ab-11e8-842f-0ed5f89f718b', 'Phường 19', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79032680-42ab-11e8-842f-0ed5f89f718b', 'Phường 28', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790327a2-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02879c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79032a72-42ab-11e8-842f-0ed5f89f718b', 'Phường 02', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79032bb2-42ab-11e8-842f-0ed5f89f718b', 'Phường 04', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79032cd4-42ab-11e8-842f-0ed5f89f718b', 'Phường 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79032e00-42ab-11e8-842f-0ed5f89f718b', 'Phường 13', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79032f22-42ab-11e8-842f-0ed5f89f718b', 'Phường 01', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790335b2-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79033792-42ab-11e8-842f-0ed5f89f718b', 'Phường 11', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79033936-42ab-11e8-842f-0ed5f89f718b', 'Phường 07', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79033ab2-42ab-11e8-842f-0ed5f89f718b', 'Phường 05', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79033e86-42ab-11e8-842f-0ed5f89f718b', 'Phường 10', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79033fe4-42ab-11e8-842f-0ed5f89f718b', 'Phường 06', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79034156-42ab-11e8-842f-0ed5f89f718b', 'Phường 08', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903428c-42ab-11e8-842f-0ed5f89f718b', 'Phường 09', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790343ae-42ab-11e8-842f-0ed5f89f718b', 'Phường 14', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79034692-42ab-11e8-842f-0ed5f89f718b', 'Phường 15', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0288e6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790347d2-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Sơn Nhì', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790348fe-42ab-11e8-842f-0ed5f89f718b', 'Phường Tây Thạnh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79034ab6-42ab-11e8-842f-0ed5f89f718b', 'Phường Sơn Kỳ', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79034c14-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Quý', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79034f34-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Thành', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79035092-42ab-11e8-842f-0ed5f89f718b', 'Phường Phú Thọ Hòa', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79035268-42ab-11e8-842f-0ed5f89f718b', 'Phường Phú Thạnh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79035394-42ab-11e8-842f-0ed5f89f718b', 'Phường Phú Trung', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790354c0-42ab-11e8-842f-0ed5f89f718b', 'Phường Hòa Thạnh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790357d6-42ab-11e8-842f-0ed5f89f718b', 'Phường Hiệp Tân', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79035916-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Thới Hòa', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79035a60-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Sơn Nhì', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79035b82-42ab-11e8-842f-0ed5f89f718b', 'Phường Tây Thạnh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79035cae-42ab-11e8-842f-0ed5f89f718b', 'Phường Sơn Kỳ', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79035fc4-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Quý', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903610e-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Thành', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903623a-42ab-11e8-842f-0ed5f89f718b', 'Phường Phú Thọ Hòa', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903635c-42ab-11e8-842f-0ed5f89f718b', 'Phường Phú Thạnh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903647e-42ab-11e8-842f-0ed5f89f718b', 'Phường Phú Trung', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903674e-42ab-11e8-842f-0ed5f89f718b', 'Phường Hòa Thạnh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790368a2-42ab-11e8-842f-0ed5f89f718b', 'Phường Hiệp Tân', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790369c4-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Thới Hòa', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028a1c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79036ae6-42ab-11e8-842f-0ed5f89f718b', 'Phường 04', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79036c08-42ab-11e8-842f-0ed5f89f718b', 'Phường 05', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79036ef6-42ab-11e8-842f-0ed5f89f718b', 'Phường 09', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79037036-42ab-11e8-842f-0ed5f89f718b', 'Phường 07', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790371d0-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903731a-42ab-11e8-842f-0ed5f89f718b', 'Phường 01', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79037446-42ab-11e8-842f-0ed5f89f718b', 'Phường 02', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903772a-42ab-11e8-842f-0ed5f89f718b', 'Phường 08', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79037874-42ab-11e8-842f-0ed5f89f718b', 'Phường 15', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79037996-42ab-11e8-842f-0ed5f89f718b', 'Phường 10', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79037ab8-42ab-11e8-842f-0ed5f89f718b', 'Phường 11', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79037d88-42ab-11e8-842f-0ed5f89f718b', 'Phường 17', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790380e4-42ab-11e8-842f-0ed5f89f718b', 'Phường 14', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79038224-42ab-11e8-842f-0ed5f89f718b', 'Phường 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79038346-42ab-11e8-842f-0ed5f89f718b', 'Phường 13', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028b48-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903845e-42ab-11e8-842f-0ed5f89f718b', 'Phường Thảo Điền', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028c60-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79038580-42ab-11e8-842f-0ed5f89f718b', 'Phường An Phú', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028c60-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903885a-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình An', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028c60-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790389d6-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Trưng Đông', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028c60-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79038b02-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Trưng Tây', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028c60-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79038c24-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Khánh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028c60-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79038d46-42ab-11e8-842f-0ed5f89f718b', 'Phường An Khánh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028c60-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903900c-42ab-11e8-842f-0ed5f89f718b', 'Phường Cát Lái', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028c60-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79039156-42ab-11e8-842f-0ed5f89f718b', 'Phường Thạnh Mỹ Lợi', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028c60-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79039278-42ab-11e8-842f-0ed5f89f718b', 'Phường An Lợi Đông', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028c60-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79039390-42ab-11e8-842f-0ed5f89f718b', 'Phường Thủ Thiêm', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028c60-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790394b2-42ab-11e8-842f-0ed5f89f718b', 'Phường 08', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790395d4-42ab-11e8-842f-0ed5f89f718b', 'Phường 07', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79039958-42ab-11e8-842f-0ed5f89f718b', 'Phường 14', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79039aa2-42ab-11e8-842f-0ed5f89f718b', 'Phường 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79039bce-42ab-11e8-842f-0ed5f89f718b', 'Phường 11', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79039cf0-42ab-11e8-842f-0ed5f89f718b', 'Phường 13', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79039e1c-42ab-11e8-842f-0ed5f89f718b', 'Phường 06', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903a182-42ab-11e8-842f-0ed5f89f718b', 'Phường 09', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903a2e0-42ab-11e8-842f-0ed5f89f718b', 'Phường 10', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903a40c-42ab-11e8-842f-0ed5f89f718b', 'Phường 04', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903a52e-42ab-11e8-842f-0ed5f89f718b', 'Phường 05', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903a65a-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903a77c-42ab-11e8-842f-0ed5f89f718b', 'Phường 02', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903aab0-42ab-11e8-842f-0ed5f89f718b', 'Phường 01', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028e18-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903abe6-42ab-11e8-842f-0ed5f89f718b', 'Phường 15', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903ad08-42ab-11e8-842f-0ed5f89f718b', 'Phường 13', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903ae34-42ab-11e8-842f-0ed5f89f718b', 'Phường 14', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903af56-42ab-11e8-842f-0ed5f89f718b', 'Phường 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903b2a8-42ab-11e8-842f-0ed5f89f718b', 'Phường 11', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903b3f2-42ab-11e8-842f-0ed5f89f718b', 'Phường 10', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903b514-42ab-11e8-842f-0ed5f89f718b', 'Phường 09', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903b636-42ab-11e8-842f-0ed5f89f718b', 'Phường 01', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903b762-42ab-11e8-842f-0ed5f89f718b', 'Phường 08', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903b884-42ab-11e8-842f-0ed5f89f718b', 'Phường 02', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903bb7c-42ab-11e8-842f-0ed5f89f718b', 'Phường 04', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903bcb2-42ab-11e8-842f-0ed5f89f718b', 'Phường 07', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903bdd4-42ab-11e8-842f-0ed5f89f718b', 'Phường 05', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903bef6-42ab-11e8-842f-0ed5f89f718b', 'Phường 06', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903c07c-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df028fc6-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903c3d8-42ab-11e8-842f-0ed5f89f718b', 'Phường 15', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903c522-42ab-11e8-842f-0ed5f89f718b', 'Phường 05', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903c64e-42ab-11e8-842f-0ed5f89f718b', 'Phường 14', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903c770-42ab-11e8-842f-0ed5f89f718b', 'Phường 11', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903c892-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903c9b4-42ab-11e8-842f-0ed5f89f718b', 'Phường 10', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903cd2e-42ab-11e8-842f-0ed5f89f718b', 'Phường 13', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903ce64-42ab-11e8-842f-0ed5f89f718b', 'Phường 08', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903cf86-42ab-11e8-842f-0ed5f89f718b', 'Phường 09', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903d0a8-42ab-11e8-842f-0ed5f89f718b', 'Phường 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903d1c0-42ab-11e8-842f-0ed5f89f718b', 'Phường 07', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903d602-42ab-11e8-842f-0ed5f89f718b', 'Phường 06', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903d760-42ab-11e8-842f-0ed5f89f718b', 'Phường 04', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903d88c-42ab-11e8-842f-0ed5f89f718b', 'Phường 01', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903d9a4-42ab-11e8-842f-0ed5f89f718b', 'Phường 02', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903dad0-42ab-11e8-842f-0ed5f89f718b', 'Phường 16', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02917e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903dd64-42ab-11e8-842f-0ed5f89f718b', 'Phường 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903dea4-42ab-11e8-842f-0ed5f89f718b', 'Phường 13', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903dfc6-42ab-11e8-842f-0ed5f89f718b', 'Phường 09', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903e1ec-42ab-11e8-842f-0ed5f89f718b', 'Phường 06', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903e3f4-42ab-11e8-842f-0ed5f89f718b', 'Phường 08', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903e930-42ab-11e8-842f-0ed5f89f718b', 'Phường 10', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903ec78-42ab-11e8-842f-0ed5f89f718b', 'Phường 05', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903ee12-42ab-11e8-842f-0ed5f89f718b', 'Phường 18', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903ef66-42ab-11e8-842f-0ed5f89f718b', 'Phường 14', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903f092-42ab-11e8-842f-0ed5f89f718b', 'Phường 04', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903f204-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903f4f2-42ab-11e8-842f-0ed5f89f718b', 'Phường 16', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903f650-42ab-11e8-842f-0ed5f89f718b', 'Phường 02', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903f7a4-42ab-11e8-842f-0ed5f89f718b', 'Phường 15', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903f8da-42ab-11e8-842f-0ed5f89f718b', 'Phường 01', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029336-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903f9fc-42ab-11e8-842f-0ed5f89f718b', 'Phường 04', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903fb1e-42ab-11e8-842f-0ed5f89f718b', 'Phường 09', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903fe3e-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7903ff88-42ab-11e8-842f-0ed5f89f718b', 'Phường 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790400aa-42ab-11e8-842f-0ed5f89f718b', 'Phường 02', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790401cc-42ab-11e8-842f-0ed5f89f718b', 'Phường 08', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790402ee-42ab-11e8-842f-0ed5f89f718b', 'Phường 15', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904060e-42ab-11e8-842f-0ed5f89f718b', 'Phường 07', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79040758-42ab-11e8-842f-0ed5f89f718b', 'Phường 01', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79040870-42ab-11e8-842f-0ed5f89f718b', 'Phường 11', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79040992-42ab-11e8-842f-0ed5f89f718b', 'Phường 14', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79040ab4-42ab-11e8-842f-0ed5f89f718b', 'Phường 05', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79040bd6-42ab-11e8-842f-0ed5f89f718b', 'Phường 06', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79040faa-42ab-11e8-842f-0ed5f89f718b', 'Phường 10', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790410fe-42ab-11e8-842f-0ed5f89f718b', 'Phường 13', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0294d0-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79041220-42ab-11e8-842f-0ed5f89f718b', 'Phường 14', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79041342-42ab-11e8-842f-0ed5f89f718b', 'Phường 13', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79041464-42ab-11e8-842f-0ed5f89f718b', 'Phường 09', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79041860-42ab-11e8-842f-0ed5f89f718b', 'Phường 06', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79041acc-42ab-11e8-842f-0ed5f89f718b', 'Phường 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79041dd8-42ab-11e8-842f-0ed5f89f718b', 'Phường 05', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79041fa4-42ab-11e8-842f-0ed5f89f718b', 'Phường 11', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790421a2-42ab-11e8-842f-0ed5f89f718b', 'Phường 02', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790424f4-42ab-11e8-842f-0ed5f89f718b', 'Phường 01', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904262a-42ab-11e8-842f-0ed5f89f718b', 'Phường 04', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79042774-42ab-11e8-842f-0ed5f89f718b', 'Phường 08', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904297c-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79042ac6-42ab-11e8-842f-0ed5f89f718b', 'Phường 07', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79042be8-42ab-11e8-842f-0ed5f89f718b', 'Phường 10', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df0295fc-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904302a-42ab-11e8-842f-0ed5f89f718b', 'Phường 08', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79043156-42ab-11e8-842f-0ed5f89f718b', 'Phường 02', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79043278-42ab-11e8-842f-0ed5f89f718b', 'Phường 01', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79043390-42ab-11e8-842f-0ed5f89f718b', 'Phường 03', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79043520-42ab-11e8-842f-0ed5f89f718b', 'Phường 11', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790438e0-42ab-11e8-842f-0ed5f89f718b', 'Phường 09', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79043a3e-42ab-11e8-842f-0ed5f89f718b', 'Phường 10', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79043b6a-42ab-11e8-842f-0ed5f89f718b', 'Phường 04', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79043c82-42ab-11e8-842f-0ed5f89f718b', 'Phường 13', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79043da4-42ab-11e8-842f-0ed5f89f718b', 'Phường 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790440ba-42ab-11e8-842f-0ed5f89f718b', 'Phường 05', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904425e-42ab-11e8-842f-0ed5f89f718b', 'Phường 14', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904438a-42ab-11e8-842f-0ed5f89f718b', 'Phường 06', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790444f2-42ab-11e8-842f-0ed5f89f718b', 'Phường 15', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904474a-42ab-11e8-842f-0ed5f89f718b', 'Phường 16', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790448b2-42ab-11e8-842f-0ed5f89f718b', 'Phường 07', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029854-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79044ccc-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Hưng Hòa', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029980-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79044e2a-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Hưng Hoà A', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029980-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1);
INSERT INTO `lookupdata` (`id`, `title`, `description`, `contentHTML`, `created_date`, `created_by`, `updated_date`, `updated_by`, `parent_id`, `entity_code`, `requiring_entity_code`, `status`) VALUES
('79044f56-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Hưng Hoà B', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029980-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79045078-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Trị Đông', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029980-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79045190-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Trị Đông A', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029980-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790452b2-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Trị Đông B', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029980-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79045622-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Tạo', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029980-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790457da-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Tạo A', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029980-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79045910-42ab-11e8-842f-0ed5f89f718b', 'Phường  An Lạc', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029980-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79045a32-42ab-11e8-842f-0ed5f89f718b', 'Phường An Lạc A', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029980-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79045b54-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Thuận Đông', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029c0a-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79045d02-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Thuận Tây', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029c0a-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79045fd2-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Kiểng', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029c0a-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904611c-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Hưng', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029c0a-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904623e-42ab-11e8-842f-0ed5f89f718b', 'Phường Bình Thuận', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029c0a-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79046360-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Quy', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029c0a-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79046482-42ab-11e8-842f-0ed5f89f718b', 'Phường Phú Thuận', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029c0a-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904659a-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Phú', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029c0a-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904687e-42ab-11e8-842f-0ed5f89f718b', 'Phường Tân Phong', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029c0a-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790469be-42ab-11e8-842f-0ed5f89f718b', 'Phường Phú Mỹ', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029c0a-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79046aea-42ab-11e8-842f-0ed5f89f718b', 'Thị trấn Củ Chi', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79046c0c-42ab-11e8-842f-0ed5f89f718b', 'Xã Phú Mỹ Hưng', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79046d2e-42ab-11e8-842f-0ed5f89f718b', 'Xã An Phú', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79046e46-42ab-11e8-842f-0ed5f89f718b', 'Xã Trung Lập Thượng', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79047166-42ab-11e8-842f-0ed5f89f718b', 'Xã An Nhơn Tây', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790472b0-42ab-11e8-842f-0ed5f89f718b', 'Xã Nhuận Đức', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790473d2-42ab-11e8-842f-0ed5f89f718b', 'Xã Phạm Văn Cội', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790474f4-42ab-11e8-842f-0ed5f89f718b', 'Xã Phú Hòa Đông', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79047616-42ab-11e8-842f-0ed5f89f718b', 'Xã Trung Lập Hạ', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904772e-42ab-11e8-842f-0ed5f89f718b', 'Xã Trung An', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79047a76-42ab-11e8-842f-0ed5f89f718b', 'Xã Phước Thạnh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79047bac-42ab-11e8-842f-0ed5f89f718b', 'Xã Phước Hiệp', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79047cce-42ab-11e8-842f-0ed5f89f718b', 'Xã Tân An Hội', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79047df0-42ab-11e8-842f-0ed5f89f718b', 'Xã Phước Vĩnh An', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79047f08-42ab-11e8-842f-0ed5f89f718b', 'Xã Thái Mỹ', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79048214-42ab-11e8-842f-0ed5f89f718b', 'Xã Tân Thạnh Tây', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790483e0-42ab-11e8-842f-0ed5f89f718b', 'Xã Hòa Phú', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79048516-42ab-11e8-842f-0ed5f89f718b', 'Xã Tân Thạnh Đông', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79048638-42ab-11e8-842f-0ed5f89f718b', 'Xã Bình Mỹ', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('7904875a-42ab-11e8-842f-0ed5f89f718b', 'Xã Tân Phú Trung', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79048872-42ab-11e8-842f-0ed5f89f718b', 'Xã Tân Thông Hội', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029d40-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790490ba-42ab-11e8-842f-0ed5f89f718b', 'Thị trấn Hóc Môn', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790492ae-42ab-11e8-842f-0ed5f89f718b', 'Xã Tân Hiệp', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('790493e4-42ab-11e8-842f-0ed5f89f718b', 'Xã Nhị Bình', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79049506-42ab-11e8-842f-0ed5f89f718b', 'Xã Đông Thạnh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79049628-42ab-11e8-842f-0ed5f89f718b', 'Xã Tân Thới Nhì', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79049740-42ab-11e8-842f-0ed5f89f718b', 'Xã Thới Tam Thôn', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79049862-42ab-11e8-842f-0ed5f89f718b', 'Xã Xuân Thới Sơn', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79049b96-42ab-11e8-842f-0ed5f89f718b', 'Xã Tân Xuân', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79049d80-42ab-11e8-842f-0ed5f89f718b', 'Xã Xuân Thới Đông', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('79371E34-796D-4EF7-9A4E-3439F0B80F09', 'Huyện Nam Trực', 'Huyện Nam Trực', '362', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BDB21B56-A793-465E-8A4F-7B2E4D5849A0', 'QUH', 'TTP', 1),
('7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'Tỉnh Nghệ An', 'Tỉnh Nghệ An', '40', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('79E48821-3602-411E-BDBC-CD6DAB591339', 'Thành phố Lai Châu', 'Thành phố Lai Châu', '105', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD7E781A-60AD-46FA-94F9-09F39FA13922', 'QUH', 'TTP', 1),
('79F7E340-AFE8-4B56-ADE0-03610CD478FF', 'Huyện Mỹ Lộc', 'Huyện Mỹ Lộc', '358', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BDB21B56-A793-465E-8A4F-7B2E4D5849A0', 'QUH', 'TTP', 1),
('7C416B45-D2D7-4199-AD39-BF35DEA8A56C', 'Huyện Thiệu Hóa', 'Huyện Thiệu Hóa', '398', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('7DDDF442-4AA6-4298-AA9B-E75FEEE8D36E', 'Huyện An Minh', 'Huyện An Minh', '909', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('7DFCB973-BAB0-4F61-8EE9-CB8A3E7EAF78', 'Quận Dương Kinh', 'Quận Dương Kinh', '309', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('7F3F77DF-8627-4E0D-A977-B1C404E23EB2', 'Huyện Cần Giờ', 'Huyện Cần Giờ', '787', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('7F7B15A5-9D10-46F2-BFDD-1C33D3F06EAB', 'Huyện Trường Sa', 'Huyện Trường Sa', '576', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8AE422A1-1C4E-4068-A0C6-439BD66E0909', 'QUH', 'TTP', 1),
('7FD9FB08-D6E1-4487-9A1C-2E6A2D271B62', 'Huyện An Phú', 'Huyện An Phú', '886', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F06D7E55-3CB9-4ED9-814D-051F26232112', 'QUH', 'TTP', 1),
('7FF629B7-642F-4469-8F4D-EA76DA0F6842', 'Thị xã Cai Lậy', 'Thị xã Cai Lậy', '817', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CE101B67-9ED6-4DC3-AC57-4019466AD287', 'QUH', 'TTP', 1),
('801D4F3A-8408-425A-9BBA-7F7BD9D61484', 'Huyện Yên Lập', 'Huyện Yên Lập', '234', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('803FD5AC-5FA7-4BA7-9110-6390E031D064', 'Huyện Chư Prông', 'Huyện Chư Prông', '632', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('80FC3EFF-7C11-49D8-AA40-831E4912AAAE', 'Huyện Phong Điền', 'Huyện Phong Điền', '926', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D83D5950-2F31-460A-9C05-FEB9D248F3CB', 'QUH', 'TTP', 1),
('8157B6BA-5873-436F-B1DC-6E7B5E449061', 'Huyện Mỏ Cày Nam', 'Huyện Mỏ Cày Nam', '833', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2D09B09F-87A7-4A58-8116-A6DD1F727397', 'QUH', 'TTP', 1),
('8163A14C-B4C3-4E37-AEAF-5EFD58009AD0', 'Huyện Thanh Liêm', 'Huyện Thanh Liêm', '351', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '88B47679-85DE-47C7-8CCB-D4446E847C59', 'QUH', 'TTP', 1),
('81A9712C-4859-4A0B-B09F-72DD243B466A', 'Thành phố Buôn Ma Thuột', 'Thành phố Buôn Ma Thuột', '643', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('81B22737-7558-49DF-96DC-D25DBE36779D', 'Huyện Bắc Hà', 'Huyện Bắc Hà', '085', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DC9794FA-76CC-4E86-963E-7A6B1182F377', 'QUH', 'TTP', 1),
('82282529-CBAF-4B71-A6A4-F5539E0D7C06', 'Huyện Thọ Xuân', 'Huyện Thọ Xuân', '395', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('824EF994-51CA-4A95-9E82-B97D70145A00', 'Huyện Krông Pa', 'Huyện Krông Pa', '637', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('82AEDA5A-E9FE-4DD9-BECA-662D04F7A161', 'Huyện Tuy Đức', 'Huyện Tuy Đức', '667', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FF133341-40E9-4660-BE50-D9CF0DEF3F40', 'QUH', 'TTP', 1),
('832C1079-2B08-4B20-A970-B8542C9C0F9C', 'Huyện Krông Búk', 'Huyện Krông Búk', '649', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('839E3BB5-3F96-49EE-8535-262ED43321C7', 'Huyện Than Uyên', 'Huyện Than Uyên', '110', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD7E781A-60AD-46FA-94F9-09F39FA13922', 'QUH', 'TTP', 1),
('83D80719-598E-4BD4-8E23-7D048375BFC4', 'Thành phố Vũng Tàu', 'Thành phố Vũng Tàu', '747', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '3AFAD985-4549-4B26-921A-712A0040B140', 'QUH', 'TTP', 1),
('84fcc01e-42be-11e8-842f-0ed5f89f718b', 'Xã Trung Chánh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcc78a-42be-11e8-842f-0ed5f89f718b', 'Xã Xuân Thới Thượng', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcc9ec-42be-11e8-842f-0ed5f89f718b', 'Xã Bà Điểm', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029e6c-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fccc3a-42be-11e8-842f-0ed5f89f718b', 'Thị trấn Tân Túc', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcce92-42be-11e8-842f-0ed5f89f718b', 'Xã Phạm Văn Hai', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcd0e0-42be-11e8-842f-0ed5f89f718b', 'Xã Vĩnh Lộc A', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcd342-42be-11e8-842f-0ed5f89f718b', 'Xã Vĩnh Lộc B', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcd932-42be-11e8-842f-0ed5f89f718b', 'Xã Bình Lợi', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcdbd0-42be-11e8-842f-0ed5f89f718b', 'Xã Lê Minh Xuân', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcde32-42be-11e8-842f-0ed5f89f718b', 'Xã Tân Nhựt', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fce094-42be-11e8-842f-0ed5f89f718b', 'Xã Tân Kiên', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fce2d8-42be-11e8-842f-0ed5f89f718b', 'Xã Bình Hưng', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fce530-42be-11e8-842f-0ed5f89f718b', 'Xã Phong Phú', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fce788-42be-11e8-842f-0ed5f89f718b', 'Xã An Phú Tây', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fced0a-42be-11e8-842f-0ed5f89f718b', 'Xã Hưng Long', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcefbc-42be-11e8-842f-0ed5f89f718b', 'Xã Đa Phước', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcf23c-42be-11e8-842f-0ed5f89f718b', 'Xã Tân Quý Tây', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcf49e-42be-11e8-842f-0ed5f89f718b', 'Xã Bình Chánh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcf6f6-42be-11e8-842f-0ed5f89f718b', 'Xã Quy Đức', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df029f98-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcf976-42be-11e8-842f-0ed5f89f718b', 'Thị trấn Nhà Bè', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02a16e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fcffac-42be-11e8-842f-0ed5f89f718b', 'Xã Phước Kiển', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02a16e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fd038a-42be-11e8-842f-0ed5f89f718b', 'Xã Phước Lộc', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02a16e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fd06dc-42be-11e8-842f-0ed5f89f718b', 'Xã Nhơn Đức', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02a16e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fd093e-42be-11e8-842f-0ed5f89f718b', 'Xã Phú Xuân', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02a16e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fd135c-42be-11e8-842f-0ed5f89f718b', 'Xã Long Thới', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02a16e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('84fd1604-42be-11e8-842f-0ed5f89f718b', 'Xã Hiệp Phước', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df02a16e-4223-11e8-842f-0ed5f89f718b', 'PHU', 'PHU', 1),
('851A5EB4-6B06-4D58-A8CF-A406E2D6846D', 'Huyện Duyên Hải', 'Huyện Duyên Hải', '850', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8842C8E4-BE1D-4331-867E-48BB0F917BAD', 'QUH', 'TTP', 1),
('855A47D5-0858-4DCE-8964-88687865822B', 'Quận Hai Bà Trưng', 'Quận Hai Bà Trưng', '007', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('856D8C92-7831-4F37-9A75-89934C1E7180', 'Thị xã Phước Long', 'Thị xã Phước Long', '688', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'QUH', 'TTP', 1),
('85B502EA-28B9-4F55-812D-618729EDFBF2', 'Huyện Cư Mgar', 'Huyện Cư Mgar', '648', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('85E69143-CE35-471F-BE4C-E64B4A9CCF9C', 'Huyện Cờ Đỏ', 'Huyện Cờ Đỏ', '925', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D83D5950-2F31-460A-9C05-FEB9D248F3CB', 'QUH', 'TTP', 1),
('86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'Thành phố Hà Nội', 'Thành phố Hà Nội', '01', '2018-06-03 13:08:27', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:27', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('86450ABA-5DCB-4CBA-B489-A7D5C675524C', 'Huyện Mỹ Đức', 'Huyện Mỹ Đức', '282', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('86535DD1-0F59-44EB-8AB1-827EA344FBC1', 'Huyện Phú Riềng', 'Huyện Phú Riềng', '698', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'QUH', 'TTP', 1),
('867686B7-A927-42AA-91C4-F0D06B5002EF', 'Huyện Mường Nhé', 'Huyện Mường Nhé', '096', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '3D188E07-EA3E-4C6D-BB08-651BCE844778', 'QUH', 'TTP', 1),
('86889384-0FE8-4633-85AE-610E2AB9ACAA', 'Huyện Thạch Thất', 'Huyện Thạch Thất', '276', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('86B50CF4-7177-4F5A-9CDE-417B3FFE1423', 'Quận Lê Chân', 'Quận Lê Chân', '305', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('87DF7EDB-A477-42D1-82FD-A56ED0D796D4', 'Huyện Bình Lục', 'Huyện Bình Lục', '352', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '88B47679-85DE-47C7-8CCB-D4446E847C59', 'QUH', 'TTP', 1),
('87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'Tỉnh Hà Tĩnh', 'Tỉnh Hà Tĩnh', '42', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('88292AC9-255F-48F3-9360-3E3974A79B73', 'Huyện Hải Hà', 'Huyện Hải Hà', '201', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('88409991-E060-4C96-BEE4-3788A799EA06', 'Quận Hà Đông', 'Quận Hà Đông', '268', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('8842C8E4-BE1D-4331-867E-48BB0F917BAD', 'Tỉnh Trà Vinh', 'Tỉnh Trà Vinh', '84', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('88433225-2D08-42C6-B3F7-F34C397821F7', 'Huyện Hớn Quản', 'Huyện Hớn Quản', '694', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'QUH', 'TTP', 1),
('8886EEF1-2B05-418B-BB3E-BE226D492F50', 'Huyện Yên Khánh', 'Huyện Yên Khánh', '375', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AD811A40-F9A5-4676-B9D5-43B844BA25B2', 'QUH', 'TTP', 1),
('88B47679-85DE-47C7-8CCB-D4446E847C59', 'Tỉnh Hà Nam', 'Tỉnh Hà Nam', '35', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('8938E6EB-BC1A-44F0-A272-418BEEA3DC78', 'Huyện KBang', 'Huyện KBang', '625', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('894D25D8-42CA-44B4-9526-B4960784798A', 'Huyện An Lão', 'Huyện An Lão', '313', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('899EB64D-BDFF-48E5-8C52-DE7304A82F61', 'Thành phố Điện Biên Phủ', 'Thành phố Điện Biên Phủ', '094', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '3D188E07-EA3E-4C6D-BB08-651BCE844778', 'QUH', 'TTP', 1),
('89B54AD3-8674-4C02-B91D-B501701EC16E', 'Huyện Quỳnh Lưu', 'Huyện Quỳnh Lưu', '421', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('8A874BF0-F70D-4839-B0EB-E346B6EC3646', 'Huyện Định Hóa', 'Huyện Định Hóa', '167', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '45689A1B-349A-4AB6-BE46-CF3006D27D72', 'QUH', 'TTP', 1),
('8A8BCBEA-C38E-428B-A7FE-27F12101678C', 'Huyện Triệu Phong', 'Huyện Triệu Phong', '469', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BF26A0FA-1C5F-49A3-B2A7-4BAFE12CE043', 'QUH', 'TTP', 1),
('8ACFDF68-3955-441A-819C-E0ADB2C4D5A9', 'Huyện Bắc Mê', 'Huyện Bắc Mê', '031', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2B069E88-4B37-4507-839A-40A54824E2C9', 'QUH', 'TTP', 1),
('8AE422A1-1C4E-4068-A0C6-439BD66E0909', 'Tỉnh Khánh Hòa', 'Tỉnh Khánh Hòa', '56', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('8C5BE5B5-604C-4490-8C3A-28D82E46725A', 'Huyện Nghĩa Đàn', 'Huyện Nghĩa Đàn', '419', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('8C638EEF-542E-4AF7-B6E2-421B9ADBA6EB', 'Quận Ngô Quyền', 'Quận Ngô Quyền', '304', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('8C6F308A-1386-4B8B-97EB-C92B02EA5C67', 'Huyện Hoàng Su Phì', 'Huyện Hoàng Su Phì', '032', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2B069E88-4B37-4507-839A-40A54824E2C9', 'QUH', 'TTP', 1),
('8C844847-580C-49E6-A65F-06531FAFF098', 'Tỉnh Bạc Liêu', 'Tỉnh Bạc Liêu', '95', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('8C8F1DDB-E869-4CAC-B07C-FBA8DFC01839', 'Huyện Châu Phú', 'Huyện Châu Phú', '889', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F06D7E55-3CB9-4ED9-814D-051F26232112', 'QUH', 'TTP', 1),
('8D2AEE43-7042-4321-9364-9F93D289AD6B', 'Huyện Đăk Pơ', 'Huyện Đăk Pơ', '634', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('8D32DB0B-12C2-4368-AEA5-C443D3CA9AE0', 'Huyện Tĩnh Gia', 'Huyện Tĩnh Gia', '407', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('8D39C73F-1145-4C10-B484-AC5347B3C211', 'Huyện Mèo Vạc', 'Huyện Mèo Vạc', '027', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2B069E88-4B37-4507-839A-40A54824E2C9', 'QUH', 'TTP', 1),
('8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'Tỉnh Bình Định', 'Tỉnh Bình Định', '52', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('8E79E8E4-3202-4962-854E-428F839B45F2', 'Thành phố Biên Hòa', 'Thành phố Biên Hòa', '731', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'QUH', 'TTP', 1),
('8E7A87AC-0380-478F-9F2B-5EFA0BC9086F', 'Quận Thanh Khê', 'Quận Thanh Khê', '491', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C7F7DE77-EFE5-4879-89BD-98F121AF131D', 'QUH', 'TTP', 1),
('8E9B1C71-0678-42BF-AD33-B918D6E66BF8', 'Thị xã Bỉm Sơn', 'Thị xã Bỉm Sơn', '381', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('8EA9378A-7603-4AA8-B6C3-D8C3F694999F', 'Huyện Hoà An', 'Huyện Hoà An', '051', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('8EC48535-C2F4-4FB0-AB58-A7B1D47D270E', 'Huyện Kim Động', 'Huyện Kim Động', '331', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AA3ADACC-8811-4531-AB32-E09A5FDC59B5', 'QUH', 'TTP', 1),
('8F2A39ED-5C41-4635-A210-0A832A494114', 'Huyện Vĩnh Lợi', 'Huyện Vĩnh Lợi', '958', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8C844847-580C-49E6-A65F-06531FAFF098', 'QUH', 'TTP', 1),
('8F51511A-39A8-4B66-AE2A-D12E3F7961E0', 'Quận Bình Thuỷ', 'Quận Bình Thuỷ', '918', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D83D5950-2F31-460A-9C05-FEB9D248F3CB', 'QUH', 'TTP', 1),
('8F8410AC-C998-4B39-8E71-E5809BE219F4', 'Huyện Cao Lãnh', 'Huyện Cao Lãnh', '873', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('8F85C045-2AAA-4B66-8D26-3A65F6E8E58D', 'Huyện Kiên Hải', 'Huyện Kiên Hải', '912', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('8F94CDFE-C182-4D63-BAEC-1C2DD316528F', 'Huyện Lý Sơn', 'Huyện Lý Sơn', '536', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('8FAABED4-16FA-43C8-9ECE-E6C1F11E69D9', 'Huyện Đà Bắc', 'Huyện Đà Bắc', '150', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '4893732C-9C2A-4DF2-967C-0956A1476C5D', 'QUH', 'TTP', 1),
('8FAEBDC4-7622-423B-91F5-2F1368021803', 'Thành phố Sa Đéc', 'Thành phố Sa Đéc', '867', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('8FDE6B57-96A8-4B1C-9C1F-C28D59372190', 'Huyện Tiên Yên', 'Huyện Tiên Yên', '199', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('8FE8BEA4-4C38-4DA7-B805-700DF2F949FF', 'Thành phố Phủ Lý', 'Thành phố Phủ Lý', '347', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '88B47679-85DE-47C7-8CCB-D4446E847C59', 'QUH', 'TTP', 1),
('905C7956-13D7-4925-9D74-F8A207A46C99', 'Huyện Nam Trà My', 'Huyện Nam Trà My', '516', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('907DC912-6C4C-4E49-AA45-46DFCE439FCC', 'Huyện Ngọc Lặc', 'Huyện Ngọc Lặc', '389', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('9141AC40-C2EA-492E-A188-54A82BE546DB', 'Huyện Thanh Chương', 'Huyện Thanh Chương', '428', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('915903A3-2E61-4FF6-80BC-3B1FE74D66DB', 'Huyện Hoài Đức', 'Huyện Hoài Đức', '274', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('91677802-F2F9-4272-A194-1798AA8A0DCA', 'Huyện Hoài Ân', 'Huyện Hoài Ân', '544', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'QUH', 'TTP', 1),
('91709E0C-7347-4C7C-A743-6409F6A151A8', 'Quận 11', 'Quận 11', '772', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('91A12BDC-DD9E-455F-8A46-B889113783C6', 'Huyện Định Quán', 'Huyện Định Quán', '736', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'QUH', 'TTP', 1),
('931BFCB2-034C-441D-9BBB-E32CDE3CD1BD', 'Huyện U Minh Thượng', 'Huyện U Minh Thượng', '913', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('932E0DB5-698A-40A6-B12D-D6037551158B', 'Huyện Gia Lâm', 'Huyện Gia Lâm', '018', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('93E3BCB9-2849-4E87-86E0-21978D6369DF', 'Huyện Anh Sơn', 'Huyện Anh Sơn', '424', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('941D1FD8-06C6-49B5-ABA3-D6FFBECD50E7', 'Quận 1', 'Quận 1', '760', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('942D3D3B-BFCD-46D7-9993-CA6288F4066A', 'Huyện Phong Điền', 'Huyện Phong Điền', '476', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C506D9F3-4449-4637-A137-B1DE7CEA7FE3', 'QUH', 'TTP', 1),
('9464EC99-2AD1-4765-8DC3-BE9FE4595636', 'Huyện Ninh Giang', 'Huyện Ninh Giang', '299', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('9499F6FB-5D27-40EA-8B82-3C973C064338', 'Huyện Đồng Xuân', 'Huyện Đồng Xuân', '558', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '754B7AF8-2404-4834-AA22-EDBBD14C7259', 'QUH', 'TTP', 1),
('9590A26C-77B4-48D3-BDB1-99199D8694D6', 'Thành phố Móng Cái', 'Thành phố Móng Cái', '194', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('9660EE3D-183C-4D17-B9AA-9045AA9B3768', 'Huyện Nghĩa Hành', 'Huyện Nghĩa Hành', '532', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('9722F6D3-3DF1-43A0-A405-FF319893B172', 'Huyện Gia Bình', 'Huyện Gia Bình', '263', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '27C7B617-982E-45ED-AC64-6B99814282A9', 'QUH', 'TTP', 1),
('97298D28-807A-497D-A1AE-9C432F672C5D', 'Huyện Nghi Xuân', 'Huyện Nghi Xuân', '442', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('975A77AE-7D6E-4582-A094-03F4C55BB3CC', 'Quận Cẩm Lệ', 'Quận Cẩm Lệ', '495', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C7F7DE77-EFE5-4879-89BD-98F121AF131D', 'QUH', 'TTP', 1),
('976D0FD7-DE27-4086-BA5F-C2A9627C5D3B', 'Huyện Đức Thọ', 'Huyện Đức Thọ', '440', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('98A194B7-7554-4138-870C-CFECB1129BD0', 'Huyện Đạ Huoai', 'Huyện Đạ Huoai', '681', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('9902711D-ED3E-4D16-B174-6DFF4F6C2440', 'Huyện Mộ Đức', 'Huyện Mộ Đức', '533', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('990296E6-4092-4161-ACC7-9010931A3A71', 'Huyện Ia Grai', 'Huyện Ia Grai', '628', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('99908f40-630e-11e8-9185-276e155d0fc2', 'Thái Long', NULL, NULL, '2018-05-29 14:04:59', 'operamart', NULL, NULL, NULL, 'BND', NULL, 1),
('9A42078E-970D-4B01-BEAF-D7C2E5449577', 'Huyện Tu Mơ Rông', 'Huyện Tu Mơ Rông', '617', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D24B493B-0BE8-4D1E-887F-EFF975279D06', 'QUH', 'TTP', 1),
('9A940029-5557-44C6-B784-155B35EB9893', 'Huyện Cầu Ngang', 'Huyện Cầu Ngang', '848', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8842C8E4-BE1D-4331-867E-48BB0F917BAD', 'QUH', 'TTP', 1),
('9B44B907-C0AD-40B4-A7F8-434F3781AA4C', 'Huyện Núi Thành', 'Huyện Núi Thành', '517', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'Tỉnh Lâm Đồng', 'Tỉnh Lâm Đồng', '68', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('9BE9D704-3F90-4F61-8D07-F59816B5717F', 'Huyện Lạc Dương', 'Huyện Lạc Dương', '675', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('9C33F412-0207-49FA-BA10-FE69560B5FBC', 'Huyện Thuận Bắc', 'Huyện Thuận Bắc', '588', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '72DABCBE-5DF9-4060-ABF6-2795BA27E16A', 'QUH', 'TTP', 1),
('9CA02757-94C3-4385-9EBC-3C8686742D21', 'Huyện Trà Bồng', 'Huyện Trà Bồng', '525', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('9CE9E3EA-3CB7-4418-A3D0-419580D1A8ED', 'Thành phố Tuy Hoà', 'Thành phố Tuy Hoà', '555', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '754B7AF8-2404-4834-AA22-EDBBD14C7259', 'QUH', 'TTP', 1),
('9D106BD6-2FC6-4DD6-8B16-8D241941E76E', 'Huyện Vị Thuỷ', 'Huyện Vị Thuỷ', '935', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD62365E-1F44-4A11-ACCC-FA51D96AC4F6', 'QUH', 'TTP', 1),
('9D8025D2-0E95-4A62-9944-491052A614B9', 'Huyện Phước Long', 'Huyện Phước Long', '957', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8C844847-580C-49E6-A65F-06531FAFF098', 'QUH', 'TTP', 1),
('9D90B21B-B46E-45BF-B313-D2BC1B4C6642', 'Huyện Sơn Dương', 'Huyện Sơn Dương', '076', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '55A43243-D626-4223-BA21-3ECF08DAE6A5', 'QUH', 'TTP', 1),
('9E549DE4-85CD-4496-B46C-DCAFC08D883B', 'Huyện Đắk Glei', 'Huyện Đắk Glei', '610', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D24B493B-0BE8-4D1E-887F-EFF975279D06', 'QUH', 'TTP', 1),
('9E601C0A-03D6-4195-921F-593766DAA8D5', 'Huyện Quan Sơn', 'Huyện Quan Sơn', '387', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('9FB36CC4-6A46-4C9F-BCC1-707883654170', 'Thành phố Yên Bái', 'Thành phố Yên Bái', '132', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '282D54D8-E4AB-4C8D-AC12-AC799D15CDD8', 'QUH', 'TTP', 1),
('9FB89FA8-6950-4DE4-B21E-2899324D4D90', 'Huyện Văn Lãng', 'Huyện Văn Lãng', '182', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CEB314BF-5661-403C-8000-CC304FA7DC83', 'QUH', 'TTP', 1),
('A0C5F556-2DC3-4A82-83B4-FAF929522A6A', 'Thành phố Long Xuyên', 'Thành phố Long Xuyên', '883', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F06D7E55-3CB9-4ED9-814D-051F26232112', 'QUH', 'TTP', 1),
('A17279C7-9E8F-488F-8023-23AEF06E7D82', 'Huyện Tương Dương', 'Huyện Tương Dương', '418', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('A1E61F1A-0FD6-4F2C-9433-56BEBEA9819E', 'Huyện Đại Từ', 'Huyện Đại Từ', '171', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '45689A1B-349A-4AB6-BE46-CF3006D27D72', 'QUH', 'TTP', 1),
('A304EA1D-0915-431F-AD31-AD3568681C0B', 'Huyện Thới Lai', 'Huyện Thới Lai', '927', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D83D5950-2F31-460A-9C05-FEB9D248F3CB', 'QUH', 'TTP', 1),
('A3994BF8-691E-4A52-8089-074F08049CC8', 'Huyện Sìn Hồ', 'Huyện Sìn Hồ', '108', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD7E781A-60AD-46FA-94F9-09F39FA13922', 'QUH', 'TTP', 1),
('A3C5D5FF-2EC1-4FC8-A19E-D1B686B654A9', 'Thị xã Long Khánh', 'Thị xã Long Khánh', '732', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'QUH', 'TTP', 1),
('A3DD5BE8-D946-48A2-ABDB-7584316E1139', 'Huyện A Lưới', 'Huyện A Lưới', '481', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C506D9F3-4449-4637-A137-B1DE7CEA7FE3', 'QUH', 'TTP', 1),
('A4456082-60F8-41A4-8D38-D27112B10BA7', 'Huyện Ninh Sơn', 'Huyện Ninh Sơn', '585', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '72DABCBE-5DF9-4060-ABF6-2795BA27E16A', 'QUH', 'TTP', 1),
('A445FC6C-74D6-4F68-B7EF-11A2AA0E31F5', 'Huyện Đông Hải', 'Huyện Đông Hải', '960', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8C844847-580C-49E6-A65F-06531FAFF098', 'QUH', 'TTP', 1),
('A4B776BB-12FD-403F-B424-B8E9370A28D4', 'Huyện Nậm Nhùn', 'Huyện Nậm Nhùn', '112', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD7E781A-60AD-46FA-94F9-09F39FA13922', 'QUH', 'TTP', 1),
('A4B81913-E017-4C24-A461-965542EC46F8', 'Huyện Duy Xuyên', 'Huyện Duy Xuyên', '508', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('A4C6D9CC-46AF-4181-B2D1-4F0AB641668A', 'Huyện Vĩnh Thạnh', 'Huyện Vĩnh Thạnh', '924', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D83D5950-2F31-460A-9C05-FEB9D248F3CB', 'QUH', 'TTP', 1),
('A4D6639B-FDC0-43E7-980D-36290E77A464', 'Huyện Quế Võ', 'Huyện Quế Võ', '259', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '27C7B617-982E-45ED-AC64-6B99814282A9', 'QUH', 'TTP', 1),
('A4E081DA-538B-46C9-B398-DA70D525083C', 'Huyện Yên Thủy', 'Huyện Yên Thủy', '158', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '4893732C-9C2A-4DF2-967C-0956A1476C5D', 'QUH', 'TTP', 1),
('A4FB32B8-8AD5-4DC8-B82D-34F91E80C0CE', 'Quận 4', 'Quận 4', '773', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('A5A4BA23-81C7-4AD9-9B72-0E3283FB137C', 'Huyện Tam Nông', 'Huyện Tam Nông', '236', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'Tỉnh Phú Thọ', 'Tỉnh Phú Thọ', '25', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('A612D294-C021-42DA-93F5-AD2ABAA8CF11', 'Thị xã Ayun Pa', 'Thị xã Ayun Pa', '624', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('A61B3731-175D-4042-BE7B-E403B2FAEBB1', 'Huyện Ngọc Hồi', 'Huyện Ngọc Hồi', '611', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D24B493B-0BE8-4D1E-887F-EFF975279D06', 'QUH', 'TTP', 1);
INSERT INTO `lookupdata` (`id`, `title`, `description`, `contentHTML`, `created_date`, `created_by`, `updated_date`, `updated_by`, `parent_id`, `entity_code`, `requiring_entity_code`, `status`) VALUES
('A61DB1EF-3CA3-4FA9-94B3-448B2C57F1B5', 'Thị xã Dĩ An', 'Thị xã Dĩ An', '724', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '0ACA0257-5987-45FC-BBA7-CD6235DE3C23', 'QUH', 'TTP', 1),
('A7094CE5-20A8-40F2-8B14-0BBE0925E29C', 'Huyện Tân Hưng', 'Huyện Tân Hưng', '796', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('A7434318-0C6E-4812-B95F-C7B7B79685C1', 'Thành phố Hải Phòng', 'Thành phố Hải Phòng', '31', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('A786AAC5-E3EE-4474-851A-89163891D1F0', 'Huyện Đầm Hà', 'Huyện Đầm Hà', '200', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('A7AEC190-4B3E-442C-8E6D-24ABCBE1D1CA', 'Huyện Thuận Nam', 'Huyện Thuận Nam', '589', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '72DABCBE-5DF9-4060-ABF6-2795BA27E16A', 'QUH', 'TTP', 1),
('A82981F5-8984-46BB-9C49-99D2F65AAB6F', 'Huyện Tri Tôn', 'Huyện Tri Tôn', '891', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F06D7E55-3CB9-4ED9-814D-051F26232112', 'QUH', 'TTP', 1),
('A84202BA-4C3F-4705-B69F-0A6706985E47', 'Tỉnh Tây Ninh', 'Tỉnh Tây Ninh', '72', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('A87EDCE5-3052-4555-BB26-B34236F33000', 'Thị xã Kiến Tường', 'Thị xã Kiến Tường', '795', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('A88FC268-8380-4764-B125-E8BB16838B67', 'Huyện Tháp Mười', 'Huyện Tháp Mười', '872', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('A8A022DE-6FA2-43CD-BF79-D1987E1E6551', 'Huyện Quảng Uyên', 'Huyện Quảng Uyên', '049', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('AA023137-669C-4187-9355-EB5AB9C35CBB', 'Huyện Gò Công Tây', 'Huyện Gò Công Tây', '823', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CE101B67-9ED6-4DC3-AC57-4019466AD287', 'QUH', 'TTP', 1),
('AA0CAF36-0522-4D3B-89F2-8720BD4802AE', 'Huyện Gio Linh', 'Huyện Gio Linh', '466', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BF26A0FA-1C5F-49A3-B2A7-4BAFE12CE043', 'QUH', 'TTP', 1),
('AA3ADACC-8811-4531-AB32-E09A5FDC59B5', 'Tỉnh Hưng Yên', 'Tỉnh Hưng Yên', '33', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('AA9727E3-A05F-4A11-B2A2-05F199FB92E4', 'Huyện Yên Thành', 'Huyện Yên Thành', '426', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('AC34F6EC-AF2D-402F-8A8F-3A4B9EDE67D1', 'Huyện Nho Quan', 'Huyện Nho Quan', '372', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AD811A40-F9A5-4676-B9D5-43B844BA25B2', 'QUH', 'TTP', 1),
('AC408840-368E-47CF-994A-F1C27578A8A7', 'Huyện Phú Xuyên', 'Huyện Phú Xuyên', '280', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('ACB8FA1D-5761-4E6D-8A52-6033EFE4CDB8', 'Tỉnh Cà Mau', 'Tỉnh Cà Mau', '96', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('ACECDDD2-FC5B-428A-B0AA-D5B88B3CBF0D', 'Huyện Châu Thành', 'Huyện Châu Thành', '821', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CE101B67-9ED6-4DC3-AC57-4019466AD287', 'QUH', 'TTP', 1),
('AD811A40-F9A5-4676-B9D5-43B844BA25B2', 'Tỉnh Ninh Bình', 'Tỉnh Ninh Bình', '37', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('ADA7FB9A-DA6C-4810-A5D7-7326833F6192', 'Huyện Lấp Vò', 'Huyện Lấp Vò', '875', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('ADAE1A3D-F170-4748-8A4F-C144250421C8', 'Huyện Kiên Lương', 'Huyện Kiên Lương', '902', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('ae661de0-630e-11e8-9185-276e155d0fc2', 'Hồng Phú', NULL, NULL, '2018-05-29 14:05:34', 'operamart', NULL, NULL, NULL, 'BND', NULL, 1),
('AE9FED10-94E3-4E49-B8B4-5A824AAF8AE1', 'Huyện Tam Nông', 'Huyện Tam Nông', '871', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('AFF62E4B-B97F-4A36-89D3-2C7D7067C6F8', 'Quận 10', 'Quận 10', '771', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('B0F441A9-9B0E-4973-A2EC-FF8DF5BF0847', 'Huyện Đồng Hỷ', 'Huyện Đồng Hỷ', '169', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '45689A1B-349A-4AB6-BE46-CF3006D27D72', 'QUH', 'TTP', 1),
('B0FF1DA9-E94E-4C38-849A-48D0043A757B', 'Huyện Đình Lập', 'Huyện Đình Lập', '189', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CEB314BF-5661-403C-8000-CC304FA7DC83', 'QUH', 'TTP', 1),
('B1540BA7-A197-477C-88D5-2FB3525DBD98', 'Huyện Mỹ Hào', 'Huyện Mỹ Hào', '328', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AA3ADACC-8811-4531-AB32-E09A5FDC59B5', 'QUH', 'TTP', 1),
('B1631762-EB93-4665-8ED9-2F5557BB342D', 'Huyện Tân Uyên', 'Huyện Tân Uyên', '111', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD7E781A-60AD-46FA-94F9-09F39FA13922', 'QUH', 'TTP', 1),
('B2678007-D74F-48F4-9842-CCA2DBAB551C', 'Huyện U Minh', 'Huyện U Minh', '966', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'ACB8FA1D-5761-4E6D-8A52-6033EFE4CDB8', 'QUH', 'TTP', 1),
('B2AEA655-C2A2-426C-803C-6C3FEAF99A6E', 'Thị xã Giá Rai', 'Thị xã Giá Rai', '959', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8C844847-580C-49E6-A65F-06531FAFF098', 'QUH', 'TTP', 1),
('B2DEB353-9F66-4018-82C2-BD3AEE20165D', 'Huyện Duy Tiên', 'Huyện Duy Tiên', '349', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '88B47679-85DE-47C7-8CCB-D4446E847C59', 'QUH', 'TTP', 1),
('B334E495-8BBC-46F9-91CC-B3FAE4FEFFBB', 'Huyện Phú Quí', 'Huyện Phú Quí', '602', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FA7763AF-DA21-4423-930B-45EB04281CF3', 'QUH', 'TTP', 1),
('B44CCD29-98D7-420C-82EA-F3695FAEF40A', 'Huyện Châu Đức', 'Huyện Châu Đức', '750', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '3AFAD985-4549-4B26-921A-712A0040B140', 'QUH', 'TTP', 1),
('B464BEF1-8D06-403D-9D01-68ECF333CAB5', 'Huyện Mường Ảng', 'Huyện Mường Ảng', '102', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '3D188E07-EA3E-4C6D-BB08-651BCE844778', 'QUH', 'TTP', 1),
('B4856179-A7E2-4A4B-994E-92317E0E3175', 'Huyện Chợ Lách', 'Huyện Chợ Lách', '832', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2D09B09F-87A7-4A58-8116-A6DD1F727397', 'QUH', 'TTP', 1),
('B598B838-FCB2-4500-8310-7B9944F6B73F', 'Thị xã Phú Thọ', 'Thị xã Phú Thọ', '228', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('B5CB01A7-6F5E-4BC0-8826-4352D738D05E', 'Tỉnh Vĩnh Long', 'Tỉnh Vĩnh Long', '86', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('B6017AB4-9B13-4541-B0CA-F22BC5056ECA', 'Huyện Tràng Định', 'Huyện Tràng Định', '180', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CEB314BF-5661-403C-8000-CC304FA7DC83', 'QUH', 'TTP', 1),
('B681665A-BD71-4333-B23B-3EE76B0E89FE', 'Huyện Đa Krông', 'Huyện Đa Krông', '467', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BF26A0FA-1C5F-49A3-B2A7-4BAFE12CE043', 'QUH', 'TTP', 1),
('B70B9E2C-3F9B-4C36-9C8A-F6B761EACD47', 'Huyện Pác Nặm', 'Huyện Pác Nặm', '060', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C40DAA9A-5CBD-4265-9B7B-A74329857C0B', 'QUH', 'TTP', 1),
('B744CB0B-EC17-42D4-851D-F4437710F8E2', 'Huyện Phục Hoà', 'Huyện Phục Hoà', '050', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'Tỉnh Quảng Nam', 'Tỉnh Quảng Nam', '49', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('B7D8DD27-5D9A-4B3D-AF6D-4337F5BC7DF7', 'Huyện Chư Sê', 'Huyện Chư Sê', '633', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('b7edff40-630e-11e8-9185-276e155d0fc2', 'Rồng Vàng', NULL, NULL, '2018-05-29 14:05:50', 'operamart', NULL, NULL, NULL, 'BND', NULL, 1),
('B88C4E67-B99B-40C7-A032-1040B7ACD825', 'Thị xã Hồng Lĩnh', 'Thị xã Hồng Lĩnh', '437', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('B890B8CC-F9C4-442C-9972-AD643E47F567', 'Huyện Hướng Hóa', 'Huyện Hướng Hóa', '465', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BF26A0FA-1C5F-49A3-B2A7-4BAFE12CE043', 'QUH', 'TTP', 1),
('B9AC10D4-C849-4828-AF1C-0B46AB1F7817', 'Huyện Lục Yên', 'Huyện Lục Yên', '135', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '282D54D8-E4AB-4C8D-AC12-AC799D15CDD8', 'QUH', 'TTP', 1),
('B9B248F4-E27D-49F8-B4D0-B6119DD69728', 'Huyện Tân Biên', 'Huyện Tân Biên', '705', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A84202BA-4C3F-4705-B69F-0A6706985E47', 'QUH', 'TTP', 1),
('B9D6C6AF-2538-4FE4-B8D3-C87369D2ECDA', 'Huyện Hải Lăng', 'Huyện Hải Lăng', '470', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BF26A0FA-1C5F-49A3-B2A7-4BAFE12CE043', 'QUH', 'TTP', 1),
('BA96F5CE-E19E-4623-94D8-996A26B5CDB8', 'Huyện Cẩm Xuyên', 'Huyện Cẩm Xuyên', '446', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('BB1759B3-29EE-4EEC-9AEB-ED06963940F9', 'Huyện Quan Hóa', 'Huyện Quan Hóa', '385', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('BBE042E3-C03B-4381-B0E7-930AC145BC11', 'Huyện Lục Nam', 'Huyện Lục Nam', '218', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '69691148-5255-44CB-A176-02D504EA7BD0', 'QUH', 'TTP', 1),
('BBFB5EE2-0FEA-4CE2-9E02-4D257850BAC1', 'Huyện Vĩnh Thuận', 'Huyện Vĩnh Thuận', '910', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('BC651200-AA9D-4A23-AE31-5C5CC3011DD4', 'Huyện Đức Linh', 'Huyện Đức Linh', '600', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FA7763AF-DA21-4423-930B-45EB04281CF3', 'QUH', 'TTP', 1),
('BCE3F965-66CA-4712-8883-E4BF41022E61', 'Huyện Trần Văn Thời', 'Huyện Trần Văn Thời', '968', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'ACB8FA1D-5761-4E6D-8A52-6033EFE4CDB8', 'QUH', 'TTP', 1),
('BCFB70DE-7FCB-4A66-9EBB-DDB96ECC0B90', 'Thành phố Vinh', 'Thành phố Vinh', '412', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('BD3CDAC1-E10A-44A2-A788-D6D746E9206C', 'Huyện Mai Châu', 'Huyện Mai Châu', '156', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '4893732C-9C2A-4DF2-967C-0956A1476C5D', 'QUH', 'TTP', 1),
('BD42504F-6433-42FF-8B1E-9E66BD3CFC84', 'Huyện Ea Hleo', 'Huyện Ea Hleo', '645', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('BD64602F-8F28-4FE8-97A7-62B83EC07BB3', 'Huyện Tiền Hải', 'Huyện Tiền Hải', '342', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CFEA534D-A741-4E92-AA89-4CF6D6CBCA35', 'QUH', 'TTP', 1),
('BD90B97B-D7E3-4ABF-A325-27745E8C0032', 'Huyện Nam Đông', 'Huyện Nam Đông', '483', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C506D9F3-4449-4637-A137-B1DE7CEA7FE3', 'QUH', 'TTP', 1),
('BD9C40E8-E45C-4700-AA66-4FC549D0DCCD', 'Huyện Yên Mô', 'Huyện Yên Mô', '377', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AD811A40-F9A5-4676-B9D5-43B844BA25B2', 'QUH', 'TTP', 1),
('BDA1BE67-9C4B-4411-B0DD-B5B45F12E15B', 'Huyện Con Cuông', 'Huyện Con Cuông', '422', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('BDA742EC-954C-4B9B-9866-6F454820E5C1', 'Huyện Đan Phượng', 'Huyện Đan Phượng', '273', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('BDB21B56-A793-465E-8A4F-7B2E4D5849A0', 'Tỉnh Nam Định', 'Tỉnh Nam Định', '36', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('BE07433B-724C-457B-A1B1-86F64FA6C9F4', 'Huyện Minh Hóa', 'Huyện Minh Hóa', '452', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '37F81E15-B331-4BF1-8BF0-ABBA14A820CF', 'QUH', 'TTP', 1),
('BE42195A-4BB8-4726-95C3-FB248A2218F1', 'Huyện Thanh Ba', 'Huyện Thanh Ba', '232', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('bea6e220-630e-11e8-9185-276e155d0fc2', 'Kabin', NULL, NULL, '2018-05-29 14:06:01', 'operamart', NULL, NULL, NULL, 'BND', NULL, 1),
('BECF632D-AB6A-4998-9D5B-CAFDA9FD336A', 'Huyện Tây Trà', 'Huyện Tây Trà', '526', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('BF047587-B622-453C-99E3-B6BA29E44D26', 'Thành phố Bến Tre', 'Thành phố Bến Tre', '829', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2D09B09F-87A7-4A58-8116-A6DD1F727397', 'QUH', 'TTP', 1),
('BF1DB7A8-566F-4113-82B7-DACFF2E5E2B6', 'Quận Gò Vấp', 'Quận Gò Vấp', '764', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('BF26A0FA-1C5F-49A3-B2A7-4BAFE12CE043', 'Tỉnh Quảng Trị', 'Tỉnh Quảng Trị', '45', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('BF543939-0868-4DA8-8275-65DDAE6D3CD4', 'Huyện Trảng Bom', 'Huyện Trảng Bom', '737', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'QUH', 'TTP', 1),
('BF557BC1-1E28-436C-83AE-1059593E4D19', 'Thành phố Tam Điệp', 'Thành phố Tam Điệp', '370', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AD811A40-F9A5-4676-B9D5-43B844BA25B2', 'QUH', 'TTP', 1),
('BFACB766-91ED-4C84-9CCC-F1E6A6E62871', 'Huyện Kiến Xương', 'Huyện Kiến Xương', '343', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CFEA534D-A741-4E92-AA89-4CF6D6CBCA35', 'QUH', 'TTP', 1),
('C1EDA7E6-4381-470E-B035-E2304088DE7C', 'Tỉnh Đồng Tháp', 'Tỉnh Đồng Tháp', '87', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('C2121472-C43A-4E57-8121-AD39CF6B2BDD', 'Huyện An Biên', 'Huyện An Biên', '908', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('C257535D-55D0-47F7-8DB2-8F79E85EDEC9', 'Huyện Tân Phú', 'Huyện Tân Phú', '734', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'QUH', 'TTP', 1),
('C3A23151-8603-4443-934F-530E8B7D4F43', 'Huyện Dương Minh Châu', 'Huyện Dương Minh Châu', '707', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A84202BA-4C3F-4705-B69F-0A6706985E47', 'QUH', 'TTP', 1),
('C3E99A0F-600D-4DE5-BFA3-8F8404E165DF', 'Huyện Chiêm Hóa', 'Huyện Chiêm Hóa', '073', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '55A43243-D626-4223-BA21-3ECF08DAE6A5', 'QUH', 'TTP', 1),
('C3F2026E-AEDA-47B8-B1C8-54A7A568CBC3', 'Huyện Chư Pưh', 'Huyện Chư Pưh', '639', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('C40DAA9A-5CBD-4265-9B7B-A74329857C0B', 'Tỉnh Bắc Kạn', 'Tỉnh Bắc Kạn', '06', '2018-06-03 13:08:27', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:27', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('C41BB7C0-0155-4D94-8894-F4D82DA3FC64', 'Huyện Cẩm Khê', 'Huyện Cẩm Khê', '235', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('C4519ED2-32AE-49BA-95AA-8D00321DAB4D', 'Huyện Phù Ninh', 'Huyện Phù Ninh', '233', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('C46A03FF-B511-4011-AD5A-8099A949FFD9', 'Huyện Yên Minh', 'Huyện Yên Minh', '028', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2B069E88-4B37-4507-839A-40A54824E2C9', 'QUH', 'TTP', 1),
('C46B4580-D77A-40D7-9B85-08ED5445610A', 'Huyện Châu Thành', 'Huyện Châu Thành', '905', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('C4BB0907-205F-4FE7-96C0-7D23473ED1F3', 'Huyện Ia Pa', 'Huyện Ia Pa', '635', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('C4C0B11E-B65C-4015-9424-556A486F95C6', 'Huyện Phú Vang', 'Huyện Phú Vang', '478', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C506D9F3-4449-4637-A137-B1DE7CEA7FE3', 'QUH', 'TTP', 1),
('C4D37E58-264C-4946-AD45-FB91A3227694', 'Huyện Tây Sơn', 'Huyện Tây Sơn', '547', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'QUH', 'TTP', 1),
('C506D9F3-4449-4637-A137-B1DE7CEA7FE3', 'Tỉnh Thừa Thiên Huế', 'Tỉnh Thừa Thiên Huế', '46', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('C57EDAE9-D4D0-4875-87AE-6C8DA61D6CE0', 'Huyện Khoái Châu', 'Huyện Khoái Châu', '330', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AA3ADACC-8811-4531-AB32-E09A5FDC59B5', 'QUH', 'TTP', 1),
('C5A33926-58C1-46D3-8812-4FF4A09D4820', 'Huyện Gò Dầu', 'Huyện Gò Dầu', '710', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A84202BA-4C3F-4705-B69F-0A6706985E47', 'QUH', 'TTP', 1),
('C5EF183F-16AC-4071-90A4-788E1C74F79A', 'Huyện Nà Hang', 'Huyện Nà Hang', '072', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '55A43243-D626-4223-BA21-3ECF08DAE6A5', 'QUH', 'TTP', 1),
('C619CFD1-AFE1-442F-9CCB-D72D0A4E66F1', 'Huyện Hoà Bình', 'Huyện Hoà Bình', '961', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8C844847-580C-49E6-A65F-06531FAFF098', 'QUH', 'TTP', 1),
('C644A446-6C56-425F-AB27-A41633B680B6', 'Huyện MĐrắk', 'Huyện MĐrắk', '652', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('C66D451E-897E-486A-8175-02C59984275C', 'Thành phố Kon Tum', 'Thành phố Kon Tum', '608', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D24B493B-0BE8-4D1E-887F-EFF975279D06', 'QUH', 'TTP', 1),
('C6925A53-48A4-4E1F-9062-E71170D7CF43', 'Huyện Đắk Mil', 'Huyện Đắk Mil', '663', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FF133341-40E9-4660-BE50-D9CF0DEF3F40', 'QUH', 'TTP', 1),
('c72d3200-630e-11e8-9185-276e155d0fc2', 'Thai Boy', NULL, NULL, '2018-05-29 14:06:15', 'operamart', NULL, NULL, NULL, 'BND', NULL, 1),
('C76C4CC3-75C9-4DCC-9C28-744CA41CF812', 'Huyện Văn Giang', 'Huyện Văn Giang', '326', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AA3ADACC-8811-4531-AB32-E09A5FDC59B5', 'QUH', 'TTP', 1),
('C78AC060-E8C7-473A-8D22-E61F91B05FC3', 'Huyện Tư Nghĩa', 'Huyện Tư Nghĩa', '528', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('C7A307D2-D50D-4FB9-ADFA-1CF7A0655AF0', 'Huyện Lộc Bình', 'Huyện Lộc Bình', '188', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CEB314BF-5661-403C-8000-CC304FA7DC83', 'QUH', 'TTP', 1),
('C7F7DE77-EFE5-4879-89BD-98F121AF131D', 'Thành phố Đà Nẵng', 'Thành phố Đà Nẵng', '48', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('C830B42D-64DD-45A4-85FB-073AA84BB769', 'Huyện Mường Tè', 'Huyện Mường Tè', '107', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DD7E781A-60AD-46FA-94F9-09F39FA13922', 'QUH', 'TTP', 1),
('C84F5A56-F3F3-4B14-8082-5E7A1ECF0F39', 'Huyện Phú Tân', 'Huyện Phú Tân', '888', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F06D7E55-3CB9-4ED9-814D-051F26232112', 'QUH', 'TTP', 1),
('C8E4FABC-9E5E-40AA-9EB6-9210B284C79A', 'Thành phố Mỹ Tho', 'Thành phố Mỹ Tho', '815', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CE101B67-9ED6-4DC3-AC57-4019466AD287', 'QUH', 'TTP', 1),
('C8F97FFC-32D4-40F7-8008-72E8EFEAF203', 'Thành phố Bắc Giang', 'Thành phố Bắc Giang', '213', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '69691148-5255-44CB-A176-02D504EA7BD0', 'QUH', 'TTP', 1),
('C9BF13E8-F525-4B49-A165-9578F73BF07B', 'Huyện Cai Lậy', 'Huyện Cai Lậy', '820', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CE101B67-9ED6-4DC3-AC57-4019466AD287', 'QUH', 'TTP', 1),
('C9F7A12F-6DFB-4ACD-BB44-1C97A7172B81', 'Huyện Vĩnh Tường', 'Huyện Vĩnh Tường', '252', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '28ED8435-E4A9-418C-B888-DA9A05822474', 'QUH', 'TTP', 1),
('CA1CCB2A-C2AA-4C8C-B93E-DAFF46CCB424', 'Huyện Hà Quảng', 'Huyện Hà Quảng', '045', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('CA54BF0B-54FF-42E6-AF8C-263707E46DA9', 'Huyện Cao Phong', 'Huyện Cao Phong', '154', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '4893732C-9C2A-4DF2-967C-0956A1476C5D', 'QUH', 'TTP', 1),
('CA663859-11C0-402C-9FAB-A913227C0CAD', 'Huyện Hậu Lộc', 'Huyện Hậu Lộc', '400', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('CAA68907-10BE-42AC-A538-4D0BF61146A3', 'Thị xã Gò Công', 'Thị xã Gò Công', '816', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CE101B67-9ED6-4DC3-AC57-4019466AD287', 'QUH', 'TTP', 1),
('CABB3FD3-B042-4FC1-9865-B912EEE270B0', 'Huyện Chi Lăng', 'Huyện Chi Lăng', '187', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CEB314BF-5661-403C-8000-CC304FA7DC83', 'QUH', 'TTP', 1),
('CAF33E5D-1171-442B-9F6E-16B94E414D91', 'Huyện Nguyên Bình', 'Huyện Nguyên Bình', '052', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('CB24B869-08CA-4530-80F1-2077AC87F2C3', 'Thị xã Ngã Năm', 'Thị xã Ngã Năm', '948', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'QUH', 'TTP', 1),
('CB2CA0B0-3BD4-497C-911A-0FEBC5D881AB', 'Huyện Thanh Oai', 'Huyện Thanh Oai', '278', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('CCB8ACE3-7063-4798-82AD-43AEF91E5142', 'Huyện Sơn Hòa', 'Huyện Sơn Hòa', '560', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '754B7AF8-2404-4834-AA22-EDBBD14C7259', 'QUH', 'TTP', 1),
('CCBA7241-7CC2-4851-B92C-3612D632CA2D', 'Huyện Võ Nhai', 'Huyện Võ Nhai', '170', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '45689A1B-349A-4AB6-BE46-CF3006D27D72', 'QUH', 'TTP', 1),
('CD4DD4AB-5928-47AD-924B-484E1744DFC1', 'Huyện Văn Chấn', 'Huyện Văn Chấn', '140', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '282D54D8-E4AB-4C8D-AC12-AC799D15CDD8', 'QUH', 'TTP', 1),
('CDC6C8B7-5C04-46BE-9CAF-87799AD46754', 'Thành phố Tân An', 'Thành phố Tân An', '794', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('CDD429EA-BBA4-49BE-A789-0B21B3E43674', 'Huyện Hưng Nguyên', 'Huyện Hưng Nguyên', '431', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('cdd6ab90-630e-11e8-9185-276e155d0fc2', 'Thai Coconut', NULL, NULL, '2018-05-29 14:06:26', 'operamart', NULL, NULL, NULL, 'BND', NULL, 1),
('CE101B67-9ED6-4DC3-AC57-4019466AD287', 'Tỉnh Tiền Giang', 'Tỉnh Tiền Giang', '82', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('CE2BF5DA-6339-441C-BA82-6EFE0F423752', 'Huyện Vạn Ninh', 'Huyện Vạn Ninh', '571', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8AE422A1-1C4E-4068-A0C6-439BD66E0909', 'QUH', 'TTP', 1),
('CE49F992-38C1-4A73-9184-EA11963DB461', 'Huyện Vũ Thư', 'Huyện Vũ Thư', '344', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CFEA534D-A741-4E92-AA89-4CF6D6CBCA35', 'QUH', 'TTP', 1),
('CE85A251-2E7C-4104-8F94-874D164427BF', 'Thành phố Đà Lạt', 'Thành phố Đà Lạt', '672', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('CEB314BF-5661-403C-8000-CC304FA7DC83', 'Tỉnh Lạng Sơn', 'Tỉnh Lạng Sơn', '20', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('CF35DD58-2AE1-483C-A672-94FC9D1511C7', 'Huyện Quỳnh Nhai', 'Huyện Quỳnh Nhai', '118', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('CF685AD4-C52B-4C9A-AC11-A262996D5E3F', 'Huyện Chợ Đồn', 'Huyện Chợ Đồn', '064', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C40DAA9A-5CBD-4265-9B7B-A74329857C0B', 'QUH', 'TTP', 1),
('CF735B6D-FC1C-4624-A66C-59699236393B', 'Thành phố Huế', 'Thành phố Huế', '474', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C506D9F3-4449-4637-A137-B1DE7CEA7FE3', 'QUH', 'TTP', 1),
('CFA8B858-B3AF-462A-BAF5-A3226A52EFD3', 'Huyện Tiểu Cần', 'Huyện Tiểu Cần', '846', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8842C8E4-BE1D-4331-867E-48BB0F917BAD', 'QUH', 'TTP', 1),
('CFD66E89-5491-4FA3-92EE-A61C818AF086', 'Thành phố Hưng Yên', 'Thành phố Hưng Yên', '323', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AA3ADACC-8811-4531-AB32-E09A5FDC59B5', 'QUH', 'TTP', 1),
('CFEA534D-A741-4E92-AA89-4CF6D6CBCA35', 'Tỉnh Thái Bình', 'Tỉnh Thái Bình', '34', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('D011B886-3B9D-45AE-BA3E-AE72765C8878', 'Huyện Năm Căn', 'Huyện Năm Căn', '971', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'ACB8FA1D-5761-4E6D-8A52-6033EFE4CDB8', 'QUH', 'TTP', 1),
('D07F61D6-9423-4C3E-9B26-7BB8A1A37E3E', 'Thành phố Việt Trì', 'Thành phố Việt Trì', '227', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A5EA2F02-35B2-451F-AF1F-C9019F8C9C69', 'QUH', 'TTP', 1),
('D08D2D14-6A64-4984-AA15-3B977C000F37', 'Thị xã Từ Sơn', 'Thị xã Từ Sơn', '261', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '27C7B617-982E-45ED-AC64-6B99814282A9', 'QUH', 'TTP', 1),
('D0969162-138D-438F-8A8A-742D2E32025D', 'Quận Bình Tân', 'Quận Bình Tân', '777', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('D170AA6B-8BEF-4D8C-8A8F-4D0F187E9B7C', 'Huyện Bảo Lâm', 'Huyện Bảo Lâm', '680', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('D19A768A-5825-4D57-9C33-323FCF690115', 'Huyện Đồng Phú', 'Huyện Đồng Phú', '695', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'QUH', 'TTP', 1),
('D1A7CF9C-B5BF-45B8-A863-44571476CD18', 'Thị xã Bình Long', 'Thị xã Bình Long', '690', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'QUH', 'TTP', 1),
('D1C8AA53-B257-4542-8AA8-CA7B57F82669', 'Huyện Bình Giang', 'Huyện Bình Giang', '296', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('D24B493B-0BE8-4D1E-887F-EFF975279D06', 'Tỉnh Kon Tum', 'Tỉnh Kon Tum', '62', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('D277F37A-602D-433C-A2CF-EEF4FBBC6462', 'Huyện Nông Sơn', 'Huyện Nông Sơn', '519', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('D35388B0-DD35-4DBD-9B19-7CB7B642315A', 'Huyện Tân Hiệp', 'Huyện Tân Hiệp', '904', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('D36B0D39-A041-4E1F-9DE0-1DF6925E38FF', 'Thị xã An Nhơn', 'Thị xã An Nhơn', '549', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'QUH', 'TTP', 1),
('D3B294EF-7505-4E0A-92E0-2F30653766EC', 'Huyện Giồng Riềng', 'Huyện Giồng Riềng', '906', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('D42ACD87-FD45-4321-885C-D3ADCCF992A6', 'Huyện Kỳ Anh', 'Huyện Kỳ Anh', '447', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('D43B6281-C21A-4830-80DD-5F021436DCB7', 'Huyện Phúc Thọ', 'Huyện Phúc Thọ', '272', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('D451ABB8-9851-45FB-8989-C738934D578C', 'Huyện Đức Trọng', 'Huyện Đức Trọng', '678', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('D456E762-F8E0-4107-B4B2-1D7F665E92E3', 'Huyện Krông A Na', 'Huyện Krông A Na', '655', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('D47D1D0F-7796-4B65-BC0C-83EE63383D41', 'Thành Phố Bắc Kạn', 'Thành Phố Bắc Kạn', '058', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C40DAA9A-5CBD-4265-9B7B-A74329857C0B', 'QUH', 'TTP', 1),
('d4855bd0-45ef-11e8-9888-ab09d2107e59', '58 TRẦN NHÂN TÔN, P.2, Q.10, HCM', '10.759821,106.674536', NULL, '2018-04-22 05:41:39', 'admin', '2018-04-22 06:09:14', 'admin', NULL, 'BRA', NULL, 1),
('D4ADB86C-E73B-4ADD-9B85-6CAE35AEDD8F', 'Huyện Đăk Glong', 'Huyện Đăk Glong', '661', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FF133341-40E9-4660-BE50-D9CF0DEF3F40', 'QUH', 'TTP', 1),
('D5FAB1BD-FFBE-4883-9B6E-474A845468D5', 'Huyện Tân Trụ', 'Huyện Tân Trụ', '805', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('D63065A5-3C9C-4B47-B3A5-0BEE610A524B', 'Huyện Phú Lương', 'Huyện Phú Lương', '168', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '45689A1B-349A-4AB6-BE46-CF3006D27D72', 'QUH', 'TTP', 1),
('D63B2B78-3EEC-46B2-9DA3-02DD19BA64A1', 'Thành phố Hà Tĩnh', 'Thành phố Hà Tĩnh', '436', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('d6516940-45ef-11e8-9888-ab09d2107e59', '203 TÂN HƯƠNG, Q. TÂN PHÚ, HCM', '10.790356,106.620407', NULL, '2018-04-22 05:41:42', 'admin', '2018-04-22 06:05:25', 'admin', NULL, 'BRA', NULL, 1),
('D6BF4237-9BDB-4EA4-ADCF-05F574E5821E', 'Quận Cầu Giấy', 'Quận Cầu Giấy', '005', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('D6CB9269-D48A-43D2-B739-5073B85051A5', 'Huyện Tuyên Hóa', 'Huyện Tuyên Hóa', '453', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '37F81E15-B331-4BF1-8BF0-ABBA14A820CF', 'QUH', 'TTP', 1),
('D6F41F53-2577-41F9-9611-87DB6FF86DAB', 'Quận Cái Răng', 'Quận Cái Răng', '919', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D83D5950-2F31-460A-9C05-FEB9D248F3CB', 'QUH', 'TTP', 1),
('D6FE6426-5D22-4B33-883E-613099D8A6C6', 'Huyện Hàm Yên', 'Huyện Hàm Yên', '074', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '55A43243-D626-4223-BA21-3ECF08DAE6A5', 'QUH', 'TTP', 1),
('D751FF7B-59A3-47A0-8FB1-74267E7A01F8', 'Huyện Cẩm Mỹ', 'Huyện Cẩm Mỹ', '739', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1AE34A2C-86A0-40AC-9D3D-89ABEAA2B3CC', 'QUH', 'TTP', 1),
('D81D0026-B461-4101-BCBE-6E2825479A81', 'Huyện Can Lộc', 'Huyện Can Lộc', '443', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('d82bc800-630e-11e8-9185-276e155d0fc2', 'OPERA', NULL, NULL, '2018-05-29 14:06:44', 'operamart', NULL, NULL, NULL, 'BND', NULL, 1),
('D83D5950-2F31-460A-9C05-FEB9D248F3CB', 'Thành phố Cần Thơ', 'Thành phố Cần Thơ', '92', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('D8603E58-4502-482C-BA73-908971D2D1EE', 'Huyện Kim Thành', 'Huyện Kim Thành', '293', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('D87EA50E-8A0A-4541-A6FF-A71AC888BEE6', 'Thị xã An Khê', 'Thị xã An Khê', '623', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('D9444875-7832-4860-9565-0B8B949D8C89', 'Huyện Thuỷ Nguyên', 'Huyện Thuỷ Nguyên', '311', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'Tỉnh Bình Phước', 'Tỉnh Bình Phước', '70', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('D9BABB7F-7B57-4871-8239-F4CC1802F8EC', 'Thành phố Rạch Giá', 'Thành phố Rạch Giá', '899', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('DA85C287-6BAA-4681-8223-B08DFD87C712', 'Huyện Nông Cống', 'Huyện Nông Cống', '404', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('DAA2E215-3975-431E-BE72-66C8FF8196FE', 'Huyện Việt Yên', 'Huyện Việt Yên', '222', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '69691148-5255-44CB-A176-02D504EA7BD0', 'QUH', 'TTP', 1),
('DADE3E53-064C-484D-B7B6-F45623C34CE9', 'Huyện Bạch Thông', 'Huyện Bạch Thông', '063', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C40DAA9A-5CBD-4265-9B7B-A74329857C0B', 'QUH', 'TTP', 1),
('DAFF7301-DE0C-491F-B907-3712656EE745', 'Huyện An Dương', 'Huyện An Dương', '312', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('DB4800FE-57DB-44A1-8EE3-A6889B61199C', 'Huyện Mường Chà', 'Huyện Mường Chà', '097', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '3D188E07-EA3E-4C6D-BB08-651BCE844778', 'QUH', 'TTP', 1),
('DC9794FA-76CC-4E86-963E-7A6B1182F377', 'Tỉnh Lào Cai', 'Tỉnh Lào Cai', '10', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('DCB1F896-88B4-4104-959B-EA463E9CD497', 'Huyện Mỹ Tú', 'Huyện Mỹ Tú', '944', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'QUH', 'TTP', 1),
('DCDEC569-11B0-4B07-B115-E7535578197F', 'Huyện An Lão', 'Huyện An Lão', '542', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'QUH', 'TTP', 1),
('DD1166DB-AE99-4B0A-8B39-9CD768E53228', 'Huyện Bắc Tân Uyên', 'Huyện Bắc Tân Uyên', '726', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '0ACA0257-5987-45FC-BBA7-CD6235DE3C23', 'QUH', 'TTP', 1),
('DD62365E-1F44-4A11-ACCC-FA51D96AC4F6', 'Tỉnh Hậu Giang', 'Tỉnh Hậu Giang', '93', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('DD7E781A-60AD-46FA-94F9-09F39FA13922', 'Tỉnh Lai Châu', 'Tỉnh Lai Châu', '12', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('DD9AF2BA-2E8F-4912-A93F-CA5DE8E3F568', 'Thành phố Trà Vinh', 'Thành phố Trà Vinh', '842', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8842C8E4-BE1D-4331-867E-48BB0F917BAD', 'QUH', 'TTP', 1),
('DE0B71A6-30C0-4591-A57D-428D810DE70C', 'Quận 5', 'Quận 5', '774', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('de70da70-630e-11e8-9185-276e155d0fc2', 'Super C Chef', NULL, NULL, '2018-05-29 14:06:54', 'operamart', NULL, NULL, NULL, 'BND', NULL, 1),
('DE7CF4BC-58F2-4601-B0C1-B3CC9A6B1166', 'Huyện Lâm Hà', 'Huyện Lâm Hà', '676', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('DE8C64BC-0FAE-4C17-B84B-A6737F388BC1', 'Huyện Đắk Song', 'Huyện Đắk Song', '665', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FF133341-40E9-4660-BE50-D9CF0DEF3F40', 'QUH', 'TTP', 1),
('df027a54-4223-11e8-842f-0ed5f89f718b', 'Hồ Chí Minh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, NULL, 'TTP', 'TTP', 1),
('df028012-4223-11e8-842f-0ed5f89f718b', 'Quận 12', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df0281d4-4223-11e8-842f-0ed5f89f718b', 'Quận Thủ Đức', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df02831e-4223-11e8-842f-0ed5f89f718b', 'Quận 9', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df028440-4223-11e8-842f-0ed5f89f718b', 'Quận Gò Vấp', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df02879c-4223-11e8-842f-0ed5f89f718b', 'Quận Bình Thạnh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df0288e6-4223-11e8-842f-0ed5f89f718b', 'Quận Tân Bình', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df028a1c-4223-11e8-842f-0ed5f89f718b', 'Quận Tân Phú', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df028b48-4223-11e8-842f-0ed5f89f718b', 'Quận Phú Nhuận', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df028c60-4223-11e8-842f-0ed5f89f718b', 'Quận 2', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df028e18-4223-11e8-842f-0ed5f89f718b', 'Quận 3', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1);
INSERT INTO `lookupdata` (`id`, `title`, `description`, `contentHTML`, `created_date`, `created_by`, `updated_date`, `updated_by`, `parent_id`, `entity_code`, `requiring_entity_code`, `status`) VALUES
('df028fc6-4223-11e8-842f-0ed5f89f718b', 'Quận 10', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df02917e-4223-11e8-842f-0ed5f89f718b', 'Quận 11', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df029336-4223-11e8-842f-0ed5f89f718b', 'Quận 4', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df0294d0-4223-11e8-842f-0ed5f89f718b', 'Quận 5', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df0295fc-4223-11e8-842f-0ed5f89f718b', 'Quận 6', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df029854-4223-11e8-842f-0ed5f89f718b', 'Quận 8', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df029980-4223-11e8-842f-0ed5f89f718b', 'Quận Bình Tân', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df029c0a-4223-11e8-842f-0ed5f89f718b', 'Quận 7', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df029d40-4223-11e8-842f-0ed5f89f718b', 'Huyện Củ Chi', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df029e6c-4223-11e8-842f-0ed5f89f718b', 'Huyện Hóc Môn', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df029f98-4223-11e8-842f-0ed5f89f718b', 'Huyện Bình Chánh', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df02a16e-4223-11e8-842f-0ed5f89f718b', 'Huyện Nhà Bè', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df02a29a-4223-11e8-842f-0ed5f89f718b', 'Huyện Cần Giờ', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('df02a498-4223-11e8-842f-0ed5f89f718b', 'Quận 1', NULL, NULL, '2018-04-17 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, NULL, 'df027a54-4223-11e8-842f-0ed5f89f718b', 'QUH', 'QUH', 1),
('DF7E4C84-1FCA-42B1-9DC5-2DEE28F51DFB', 'Huyện Thuận Châu', 'Huyện Thuận Châu', '119', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('E011D0BA-AF10-4CDD-905A-0F17CE66F91A', 'Huyện Thông Nông', 'Huyện Thông Nông', '044', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('e069f1e0-45ef-11e8-9888-ab09d2107e59', '49 BÙI VĂN BA, Q.7, HCM', '10.750485,106.734020', NULL, '2018-04-22 05:41:59', 'admin', '2018-04-22 06:11:04', 'admin', NULL, 'BRA', NULL, 1),
('E13F985F-8B97-4B95-9186-6D59CC0A4064', 'Huyện Thủ Thừa', 'Huyện Thủ Thừa', '804', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('E2429C7C-C3A9-4CDE-A149-4A27AD7F151D', 'Huyện Hương Khê', 'Huyện Hương Khê', '444', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '87EC8B03-8DC4-4CE4-AF26-F2F0B563DED5', 'QUH', 'TTP', 1),
('E24B2EC1-85AA-4E52-99AE-00712B7133B8', 'Huyện Quản Bạ', 'Huyện Quản Bạ', '029', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2B069E88-4B37-4507-839A-40A54824E2C9', 'QUH', 'TTP', 1),
('E2DAB71B-5F1F-42C7-B277-2B93F2C1F55B', 'Huyện Yên Sơn', 'Huyện Yên Sơn', '075', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '55A43243-D626-4223-BA21-3ECF08DAE6A5', 'QUH', 'TTP', 1),
('E31062F7-784A-4844-9705-1DE51D24F7D9', 'Huyện Sơn Động', 'Huyện Sơn Động', '220', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '69691148-5255-44CB-A176-02D504EA7BD0', 'QUH', 'TTP', 1),
('E31C218E-D9C1-4AA5-8832-FDCC868F1D7F', 'Huyện Đức Hòa', 'Huyện Đức Hòa', '802', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('E33CDB34-478A-456B-ADC4-FF601B18D209', 'Thị xã Cửa Lò', 'Thị xã Cửa Lò', '413', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '7963D537-6207-40BB-8F8E-E1FD3A3A98DC', 'QUH', 'TTP', 1),
('E4436259-045B-420A-BE73-75ADFA8C7747', 'Quận Thốt Nốt', 'Quận Thốt Nốt', '923', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D83D5950-2F31-460A-9C05-FEB9D248F3CB', 'QUH', 'TTP', 1),
('E4C77D86-A91A-4F0E-9B4A-4042E657DE16', 'Huyện Krông Pắc', 'Huyện Krông Pắc', '654', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'QUH', 'TTP', 1),
('E5176FF7-ADC1-4BC0-821A-06A0583115BA', 'Huyện Đắk Tô', 'Huyện Đắk Tô', '612', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D24B493B-0BE8-4D1E-887F-EFF975279D06', 'QUH', 'TTP', 1),
('E52776B9-D05C-4FFE-8D01-7A494E0CFB85', 'Thành phố Bảo Lộc', 'Thành phố Bảo Lộc', '673', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('E54E37A0-7102-48F2-8DA0-DA3AA5F8718F', 'Huyện Lai Vung', 'Huyện Lai Vung', '876', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('E61E841E-35F8-4662-A5AC-0DB77F096DD1', 'Huyện Vân Canh', 'Huyện Vân Canh', '551', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'QUH', 'TTP', 1),
('E6413ADD-D8D2-48D8-A81D-2D77C1CA3D72', 'Huyện Mường La', 'Huyện Mường La', '120', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('e64964b0-45ef-11e8-9888-ab09d2107e59', '1Q MAI VĂN VĨNH, Q.7, HCM', '10.739094,106.713541', NULL, '2018-04-22 05:42:09', 'admin', '2018-04-22 06:03:49', 'admin', NULL, 'BRA', NULL, 1),
('E6E20CF8-A62F-4BCF-850F-C3933ED58F7A', 'Thành phố Thủ Dầu Một', 'Thành phố Thủ Dầu Một', '718', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '0ACA0257-5987-45FC-BBA7-CD6235DE3C23', 'QUH', 'TTP', 1),
('E74314ED-0F94-4300-BACA-E0435A69FD6A', 'Huyện Sơn Tây', 'Huyện Sơn Tây', '530', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'QUH', 'TTP', 1),
('E75B0CE0-832A-46A8-92CC-4FBF585B9B01', 'Huyện Tiên Du', 'Huyện Tiên Du', '260', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '27C7B617-982E-45ED-AC64-6B99814282A9', 'QUH', 'TTP', 1),
('E772DD02-310C-4AC9-B7F2-F918713CE95A', 'Thành phố Nha Trang', 'Thành phố Nha Trang', '568', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8AE422A1-1C4E-4068-A0C6-439BD66E0909', 'QUH', 'TTP', 1),
('E77E4075-6421-4540-9B89-EC37674D539C', 'Thị xã Hồng Ngự', 'Thị xã Hồng Ngự', '868', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C1EDA7E6-4381-470E-B035-E2304088DE7C', 'QUH', 'TTP', 1),
('E7FE6655-D1AD-44A1-950C-A100C28686BD', 'Huyện Hòn Đất', 'Huyện Hòn Đất', '903', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'QUH', 'TTP', 1),
('E82165AC-62CF-49F7-9EE7-AF0E03E5DEFB', 'Huyện Lạc Sơn', 'Huyện Lạc Sơn', '157', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '4893732C-9C2A-4DF2-967C-0956A1476C5D', 'QUH', 'TTP', 1),
('E8B3D90A-2A4B-4241-805F-54B22C337D1A', 'Tỉnh Kiên Giang', 'Tỉnh Kiên Giang', '91', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('E910A641-31C3-4918-862D-6BD57A68BB43', 'Huyện Tây Giang', 'Huyện Tây Giang', '504', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('E9412B6C-CD57-4B0A-81D0-A1F477F811CD', 'Huyện Bình Liêu', 'Huyện Bình Liêu', '198', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('E9D35D46-DC09-40F8-B0CA-EF3B90FF17BF', 'Thành phố Hòa Bình', 'Thành phố Hòa Bình', '148', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '4893732C-9C2A-4DF2-967C-0956A1476C5D', 'QUH', 'TTP', 1),
('EA27480B-8576-4802-9CAA-3A3593D43754', 'Huyện Hoa Lư', 'Huyện Hoa Lư', '374', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AD811A40-F9A5-4676-B9D5-43B844BA25B2', 'QUH', 'TTP', 1),
('ea543e90-45ef-11e8-9888-ab09d2107e59', '39 PHAN VĂN HÂN, Q. BÌNH THẠNH, HCM', '10.792684,106.708419', NULL, '2018-04-22 05:42:16', 'admin', '2018-04-22 06:07:22', 'admin', NULL, 'BRA', NULL, 1),
('EACEE716-BBCD-4D70-8341-6CFB0A4C804D', 'Huyện Tuy Phước', 'Huyện Tuy Phước', '550', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8D4DE501-94E8-4E31-AFD8-1F852439EB02', 'QUH', 'TTP', 1),
('EAE3FAEF-5B15-473C-88FC-FF66335E4692', 'Huyện Gia Lộc', 'Huyện Gia Lộc', '297', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('EB8C80F6-EAD1-45B5-AB8B-5102AC8A725C', 'Huyện Châu Thành', 'Huyện Châu Thành', '831', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2D09B09F-87A7-4A58-8116-A6DD1F727397', 'QUH', 'TTP', 1),
('EBC4466C-D73B-4BAB-B251-9AB83882B30B', 'Huyện Đất Đỏ', 'Huyện Đất Đỏ', '753', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '3AFAD985-4549-4B26-921A-712A0040B140', 'QUH', 'TTP', 1),
('EC68A82C-58A0-4ADE-9532-8ED08E37E603', 'Huyện Tân Thạnh', 'Huyện Tân Thạnh', '799', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('EC8006EB-39E1-441C-BCE7-FB71051842B8', 'Huyện Hóc Môn', 'Huyện Hóc Môn', '784', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('EC94FCD7-DC1E-4553-9219-713606492841', 'Huyện Thanh Miện', 'Huyện Thanh Miện', '300', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '25AB046F-7FDF-422D-AF12-D2AF46C1C641', 'QUH', 'TTP', 1),
('ECB8B4FA-7406-4EC5-80C9-7E32482D62F5', 'Huyện Bảo Lâm', 'Huyện Bảo Lâm', '042', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('ECC93846-3EEF-4957-9430-266078F8C774', 'Huyện Nậm Pồ', 'Huyện Nậm Pồ', '103', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '3D188E07-EA3E-4C6D-BB08-651BCE844778', 'QUH', 'TTP', 1),
('ED0B52C7-3D28-432C-8910-CCA4FB7A857C', 'Huyện Hồng Dân', 'Huyện Hồng Dân', '956', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8C844847-580C-49E6-A65F-06531FAFF098', 'QUH', 'TTP', 1),
('EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'Thành phố Hồ Chí Minh', 'Thành phố Hồ Chí Minh', '79', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('EDF9E42E-A031-4C6A-9EA0-76E3E386156E', 'Thành phố Cam Ranh', 'Thành phố Cam Ranh', '569', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8AE422A1-1C4E-4068-A0C6-439BD66E0909', 'QUH', 'TTP', 1),
('EE6D2CDD-78FA-432D-8257-4CF6D8ABB566', 'Huyện Đơn Dương', 'Huyện Đơn Dương', '677', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '9B9FDE0F-9AE3-44DB-8E93-F94738CBCAEB', 'QUH', 'TTP', 1),
('EEC2D52C-622D-4CB9-B8CA-B1FA012FDCB0', 'Huyện Thạch An', 'Huyện Thạch An', '053', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '338233C2-A33C-4402-BBC7-BD6BA90994F2', 'QUH', 'TTP', 1),
('EF24549E-D824-483B-AFA9-D877D7D4BBB4', 'Huyện Kế Sách', 'Huyện Kế Sách', '943', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'QUH', 'TTP', 1),
('EF963C44-244A-4BD6-B58E-466E8CF554B3', 'Huyện Tuy An', 'Huyện Tuy An', '559', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '754B7AF8-2404-4834-AA22-EDBBD14C7259', 'QUH', 'TTP', 1),
('EFB3CF6C-AD59-4113-9DB5-AD89CAB71CB4', 'Huyện Bù Đăng', 'Huyện Bù Đăng', '696', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'QUH', 'TTP', 1),
('EFBEA0FF-35BC-4337-A4F5-D21276EAEE33', 'Huyện Vân Hồ', 'Huyện Vân Hồ', '128', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('F0633830-5A10-49ED-A409-8E315E7F0192', 'Thị xã Gia Nghĩa', 'Thị xã Gia Nghĩa', '660', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FF133341-40E9-4660-BE50-D9CF0DEF3F40', 'QUH', 'TTP', 1),
('F06D7E55-3CB9-4ED9-814D-051F26232112', 'Tỉnh An Giang', 'Tỉnh An Giang', '89', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('f0a2c6e0-45ef-11e8-9888-ab09d2107e59', '206 BÙI MINH TRỰC, Q.8, HCM', '10.735980,106.651200', NULL, '2018-04-22 05:42:27', 'admin', '2018-04-22 06:06:27', 'admin', NULL, 'BRA', NULL, 1),
('F29868A1-FB13-4373-A999-66E0A406DCC4', 'Huyện Sa Thầy', 'Huyện Sa Thầy', '616', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D24B493B-0BE8-4D1E-887F-EFF975279D06', 'QUH', 'TTP', 1),
('F2ABF362-5731-4BEF-ABDD-3485F613D0E0', 'Quận Thủ Đức', 'Quận Thủ Đức', '762', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('F377C9F2-87B2-4625-8C01-BDE61B6AF48A', 'Huyện Tam Bình', 'Huyện Tam Bình', '860', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B5CB01A7-6F5E-4BC0-8826-4352D738D05E', 'QUH', 'TTP', 1),
('F3AB89EB-00DF-476C-B6FD-579EEB5B4932', 'Huyện Mai Sơn', 'Huyện Mai Sơn', '125', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '76830364-4FA0-4B31-A21E-904638FA318E', 'QUH', 'TTP', 1),
('F3C5C536-0AB7-4102-B98A-090B67586318', 'Huyện Long Phú', 'Huyện Long Phú', '946', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'QUH', 'TTP', 1),
('F453813C-5CDF-45FB-B653-C31014B59C2C', 'Huyện Kông Chro', 'Huyện Kông Chro', '630', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('F4660FDA-F8E3-4C7A-AF54-2BDA0A59E37B', 'Huyện Mang Thít', 'Huyện Mang Thít', '858', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B5CB01A7-6F5E-4BC0-8826-4352D738D05E', 'QUH', 'TTP', 1),
('F49A4599-4A37-48E9-9341-4A1864B12D94', 'Huyện Bình Gia', 'Huyện Bình Gia', '181', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'CEB314BF-5661-403C-8000-CC304FA7DC83', 'QUH', 'TTP', 1),
('F49EA5FE-E8D7-424E-8859-A1A990EA1530', 'Huyện Cô Tô', 'Huyện Cô Tô', '207', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '0D3A1579-F441-48E5-8C6C-3CEC43EC4261', 'QUH', 'TTP', 1),
('F4CBCDDA-9187-4FBD-8E10-4D1905382F68', 'Huyện Yên Bình', 'Huyện Yên Bình', '141', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '282D54D8-E4AB-4C8D-AC12-AC799D15CDD8', 'QUH', 'TTP', 1),
('f4e2ba80-45ef-11e8-9888-ab09d2107e59', '9 BÙI HỮU NGHĨA, P.5, Q.5, HCM', '10.751259,106.675295', NULL, '2018-04-22 05:42:34', 'admin', '2018-04-22 06:08:42', 'admin', NULL, 'BRA', NULL, 1),
('F52DCC17-2C81-4D0C-9FB3-EFF7D5093C9B', 'Thành phố Sầm Sơn', 'Thành phố Sầm Sơn', '382', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('F5A199E4-E454-44EE-9165-396423FA3093', 'Huyện Mê Linh', 'Huyện Mê Linh', '250', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '86348F2B-E5BD-4FD4-B787-F4753FA194D2', 'QUH', 'TTP', 1),
('F5AFDD6A-B262-4050-B732-04E371E9EC88', 'Huyện Bảo Yên', 'Huyện Bảo Yên', '087', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DC9794FA-76CC-4E86-963E-7A6B1182F377', 'QUH', 'TTP', 1),
('F5C812A2-FAAF-461E-B6B7-C5F06089AFDC', 'Huyện Quang Bình', 'Huyện Quang Bình', '035', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2B069E88-4B37-4507-839A-40A54824E2C9', 'QUH', 'TTP', 1),
('F60E4205-9583-42A9-85E4-550A8BD12C62', 'Quận 7', 'Quận 7', '778', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'EDA301FC-90EA-4C44-8C87-E1E35003FC83', 'QUH', 'TTP', 1),
('F62B9DD9-36E2-416C-B9E2-749C8A2F5E17', 'Huyện Đông Giang', 'Huyện Đông Giang', '505', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('F633BCF9-82D1-497D-8088-A86A745DDF95', 'Huyện Lộc Ninh', 'Huyện Lộc Ninh', '692', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'D95CD3F8-6F59-47DF-AB8E-A58E42F135FD', 'QUH', 'TTP', 1),
('F63510B3-C545-407D-A3EA-6994E09557D9', 'Huyện Khánh Sơn', 'Huyện Khánh Sơn', '575', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8AE422A1-1C4E-4068-A0C6-439BD66E0909', 'QUH', 'TTP', 1),
('F63D0918-C5AD-4505-A94E-88D5174A53D1', 'Huyện Bát Xát', 'Huyện Bát Xát', '082', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DC9794FA-76CC-4E86-963E-7A6B1182F377', 'QUH', 'TTP', 1),
('F7ED3E0B-C8E2-487A-A11C-F2E803598131', 'Huyện Chư Păh', 'Huyện Chư Păh', '627', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('F8212EC4-69F0-4AE1-B68C-B09CC53025E2', 'Tỉnh Đắk Lắk', 'Tỉnh Đắk Lắk', '66', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('F82E2A0C-6099-434B-85BE-6D333B1A6517', 'Huyện Lạng Giang', 'Huyện Lạng Giang', '217', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '69691148-5255-44CB-A176-02D504EA7BD0', 'QUH', 'TTP', 1),
('F8ED2592-70C9-4D39-98D9-A5883E33811E', 'Thị xã Quảng Trị', 'Thị xã Quảng Trị', '462', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BF26A0FA-1C5F-49A3-B2A7-4BAFE12CE043', 'QUH', 'TTP', 1),
('F9666728-5F8F-4E6C-B502-751710361E13', 'Huyện Châu Thành', 'Huyện Châu Thành', '847', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8842C8E4-BE1D-4331-867E-48BB0F917BAD', 'QUH', 'TTP', 1),
('F9FA927C-D5DC-4263-A8E6-858CB1B3E51F', 'Huyện Vĩnh Hưng', 'Huyện Vĩnh Hưng', '797', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '06975319-43D6-4344-83FF-CF1A19408F9A', 'QUH', 'TTP', 1),
('FA1EE6FB-BAA2-4ECC-B218-C85A82E9172D', 'Huyện Sa Pa', 'Huyện Sa Pa', '088', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DC9794FA-76CC-4E86-963E-7A6B1182F377', 'QUH', 'TTP', 1),
('FA460B0A-3B1B-4404-9739-312A98E44D24', 'Huyện Chợ Mới', 'Huyện Chợ Mới', '065', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'C40DAA9A-5CBD-4265-9B7B-A74329857C0B', 'QUH', 'TTP', 1),
('fa67b140-45ef-11e8-9888-ab09d2107e59', '179 HOÀNG HOA THÁM, Q. BÌNH THẠNH, HCM', '10.8088728,106.6855837', NULL, '2018-04-22 05:42:43', 'admin', '2018-04-22 05:58:20', NULL, NULL, 'BRA', NULL, 1),
('FA6BF1C6-A278-4902-8ACC-9BB750E3C1FB', 'Huyện Tiên Phước', 'Huyện Tiên Phước', '514', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'B7673F46-7DEA-4DD7-8F69-3616BE5F2D81', 'QUH', 'TTP', 1),
('FA7763AF-DA21-4423-930B-45EB04281CF3', 'Tỉnh Bình Thuận', 'Tỉnh Bình Thuận', '60', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('FA8D656B-DE49-4F49-BBB8-EBD85613535A', 'Huyện Mường Lát', 'Huyện Mường Lát', '384', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('FB0E7083-DC4D-48D5-9B99-095CAC6C493B', 'Huyện Quảng Xương', 'Huyện Quảng Xương', '406', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '78D43697-B9F1-4A87-A089-BA348A609636', 'QUH', 'TTP', 1),
('FB428073-D97E-42CD-8BBB-47D906614388', 'Huyện Mỏ Cày Bắc', 'Huyện Mỏ Cày Bắc', '838', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2D09B09F-87A7-4A58-8116-A6DD1F727397', 'QUH', 'TTP', 1),
('FB6477AE-12C3-4E20-A80C-81B9842102A0', 'Huyện Hiệp Hòa', 'Huyện Hiệp Hòa', '223', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '69691148-5255-44CB-A176-02D504EA7BD0', 'QUH', 'TTP', 1),
('FB76ED3A-6F45-4A5A-9E5A-891332FEA26A', 'Huyện Si Ma Cai', 'Huyện Si Ma Cai', '084', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'DC9794FA-76CC-4E86-963E-7A6B1182F377', 'QUH', 'TTP', 1),
('FB921C1F-29D5-4E0E-B71C-C952E4C5D153', 'Huyện Phú Thiện', 'Huyện Phú Thiện', '638', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '33BF7FD8-C25D-4913-815A-15785B43B408', 'QUH', 'TTP', 1),
('FBCCE7FA-5AF7-4945-BD0D-7BEB4A40EDE8', 'Huyện Tiên Lãng', 'Huyện Tiên Lãng', '315', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'A7434318-0C6E-4812-B95F-C7B7B79685C1', 'QUH', 'TTP', 1),
('FC6ECD54-0553-4C85-96D0-AC5B0BF36C2A', 'Huyện Bình Đại', 'Huyện Bình Đại', '835', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2D09B09F-87A7-4A58-8116-A6DD1F727397', 'QUH', 'TTP', 1),
('FD4138FA-9161-4A19-891A-F0DE2F95DC24', 'Thị xã Thuận An', 'Thị xã Thuận An', '725', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '0ACA0257-5987-45FC-BBA7-CD6235DE3C23', 'QUH', 'TTP', 1),
('FD9FFD7D-B4AD-4960-9A45-FD03A34C78D9', 'Huyện Trực Ninh', 'Huyện Trực Ninh', '363', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BDB21B56-A793-465E-8A4F-7B2E4D5849A0', 'QUH', 'TTP', 1),
('FE6973EF-6FD7-496D-B2BB-A7EC9864D051', 'Huyện Lương Tài', 'Huyện Lương Tài', '264', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '27C7B617-982E-45ED-AC64-6B99814282A9', 'QUH', 'TTP', 1),
('fe872490-45ef-11e8-9888-ab09d2107e59', '93 HOÀNG HOA THÁM, Q.TÂN BÌNH, HCM', '10.806943,106.689796', NULL, '2018-04-22 05:42:50', 'admin', '2018-04-22 06:07:53', 'admin', NULL, 'BRA', NULL, 1),
('FE8F04FC-1B21-4443-BB32-12BDF2ED1A02', 'Thành phố Đông Hà', 'Thành phố Đông Hà', '461', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'BF26A0FA-1C5F-49A3-B2A7-4BAFE12CE043', 'QUH', 'TTP', 1),
('FEA95A2F-FCD3-4F7D-8A63-89E3BFA48CB0', 'Huyện Văn Lâm', 'Huyện Văn Lâm', '325', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:01', '719AD10A-04F9-4FD8-9351-1B2602277967', 'AA3ADACC-8811-4531-AB32-E09A5FDC59B5', 'QUH', 'TTP', 1),
('FEE80E77-04E0-455E-9486-EDBD4E17F5C5', 'Thị xã Ninh Hòa', 'Thị xã Ninh Hòa', '572', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '8AE422A1-1C4E-4068-A0C6-439BD66E0909', 'QUH', 'TTP', 1),
('FF133341-40E9-4660-BE50-D9CF0DEF3F40', 'Tỉnh Đắk Nông', 'Tỉnh Đắk Nông', '67', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('FFA14919-EC47-45A9-8EE7-C60ECCA76070', 'Tỉnh Quảng Ngãi', 'Tỉnh Quảng Ngãi', '51', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:08:28', '719AD10A-04F9-4FD8-9351-1B2602277967', NULL, 'TTP', 'TTP', 1),
('FFDE02D1-4CFC-4838-A727-33C3D5ABD012', 'Huyện Bắc Bình', 'Huyện Bắc Bình', '596', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-03 13:21:02', '719AD10A-04F9-4FD8-9351-1B2602277967', 'FA7763AF-DA21-4423-930B-45EB04281CF3', 'QUH', 'TTP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `icon_name` text COLLATE utf8_unicode_ci,
  `is_default` bit(1) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `icon` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8_unicode_ci,
  `is_email` bit(1) DEFAULT b'0',
  `is_notification` bit(1) DEFAULT b'0',
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `requiring_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requiring_entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unread` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `title`, `icon`, `description`, `client_id`, `created_date`, `created_by`, `link`, `is_email`, `is_notification`, `updated_by`, `updated_date`, `requiring_id`, `requiring_entity_code`, `unread`) VALUES
('819fc4f1-7056-11e8-bf09-353ea375fc2a', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [gfbf] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-06-15 11:42:27', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, '7f547560-7056-11e8-bf09-353ea375fc2a', '', 1),
('90025df0-60ed-11e8-a92a-21faf6caa556', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [nhtai1712@gmail.com] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-05-26 21:03:27', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, '8d40f400-60ed-11e8-a92a-21faf6caa556', '', 0),
('90025df1-60ed-11e8-a92a-21faf6caa556', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [nhtai1712@gmail.com] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-05-26 21:03:27', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, '8d40f400-60ed-11e8-a92a-21faf6caa556', '', 0),
('9806a850-61b8-11e8-9c34-8d2e06f49ba0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [nhtai1712@gmail.com] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-05-27 21:16:48', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, '61a06090-61b7-11e8-952a-e513288c3877', '', 0),
('9806cf60-61b8-11e8-9c34-8d2e06f49ba0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [nhtai1712@gmail.com] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-05-27 21:16:48', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, '61a06090-61b7-11e8-952a-e513288c3877', '', 0),
('9e249cc0-6252-11e8-8298-8373a6093a17', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [dracula142000@gmail.com] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-05-28 15:39:21', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, '95ff58a0-6252-11e8-8298-8373a6093a17', '', 0),
('9e249cc1-6252-11e8-8298-8373a6093a17', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [dracula142000@gmail.com] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-05-28 15:39:21', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, '95ff58a0-6252-11e8-8298-8373a6093a17', '', 0),
('adc48b00-7296-11e8-8cd0-811c7e61b2e1', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [dfvdfv] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-18 08:26:52', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'ac1f1860-7296-11e8-8cd0-811c7e61b2e1', '', 1),
('adc48b01-7296-11e8-8cd0-811c7e61b2e1', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [dfvdfv] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-06-18 08:26:52', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'ac1f1860-7296-11e8-8cd0-811c7e61b2e1', '', 1),
('b90a7010-7296-11e8-8cd0-811c7e61b2e1', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [referf] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-18 08:27:10', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'b797f450-7296-11e8-8cd0-811c7e61b2e1', '', 1),
('b90a7011-7296-11e8-8cd0-811c7e61b2e1', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [referf] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-06-18 08:27:10', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'b797f450-7296-11e8-8cd0-811c7e61b2e1', '', 1),
('be1b9190-6e10-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [x df] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-12 14:18:02', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'bb9d4b20-6e10-11e8-ba49-e983650e5ca0', '', 1),
('be1b9191-6e10-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [x df] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-06-12 14:18:02', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'bb9d4b20-6e10-11e8-ba49-e983650e5ca0', '', 1),
('bf36cb60-6174-11e8-b98d-6d5dba33d08e', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [nhtai1712@gmail.com] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-05-27 13:11:08', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, '79bb51a0-6174-11e8-9e5b-11ff03b3a9f4', '', 0),
('bf36cb61-6174-11e8-b98d-6d5dba33d08e', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [nhtai1712@gmail.com] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-05-27 13:11:08', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, '79bb51a0-6174-11e8-9e5b-11ff03b3a9f4', '', 0),
('ca1c6700-7296-11e8-8cd0-811c7e61b2e1', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [redfvfdv] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-18 08:27:39', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'c817bd60-7296-11e8-8cd0-811c7e61b2e1', '', 1),
('ca1c8e10-7296-11e8-8cd0-811c7e61b2e1', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [redfvfdv] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-06-18 08:27:39', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'c817bd60-7296-11e8-8cd0-811c7e61b2e1', '', 1),
('ce86c130-6e10-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [ghngn] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-12 14:18:29', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'cc937cb0-6e10-11e8-ba49-e983650e5ca0', '', 1),
('ce86c131-6e10-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [ghngn] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-06-12 14:18:29', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'cc937cb0-6e10-11e8-ba49-e983650e5ca0', '', 1),
('d5a681e0-51e5-11e8-8cdd-45ee0c532f07', 'Nhận 01 liên hệ', 'glyphicon glyphicon-envelope', 'Người dùng [vinh.thien0301@gmail.com] vừa gửi 1 liên hệ', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-05-07 18:00:20', 'System', 'danh-sach-lien-he', b'0', b'1', NULL, NULL, 'd5a4d430-51e5-11e8-8cdd-45ee0c532f07', '', 0),
('e26545a0-6e10-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [gnghn] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-12 14:19:03', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'e0cf1540-6e10-11e8-ba49-e983650e5ca0', '', 1),
('e26545a1-6e10-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [gnghn] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-06-12 14:19:03', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'e0cf1540-6e10-11e8-ba49-e983650e5ca0', '', 1),
('e9764c40-622b-11e8-af02-9586fbee6a97', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [test 1] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-05-28 11:02:17', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'e7841930-622b-11e8-af02-9586fbee6a97', '', 0),
('e9767350-622b-11e8-af02-9586fbee6a97', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [test 1] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-05-28 11:02:17', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'e7841930-622b-11e8-af02-9586fbee6a97', '', 0),
('f0287890-6250-11e8-8298-8373a6093a17', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [chibaoit@yahoo.com] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-05-28 15:27:20', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'd783b980-6250-11e8-8298-8373a6093a17', '', 0),
('f0287891-6250-11e8-8298-8373a6093a17', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [chibaoit@yahoo.com] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-05-28 15:27:20', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'd783b980-6250-11e8-8298-8373a6093a17', '', 0),
('f10c7e20-6e10-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [tynghn] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-12 14:19:27', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'ef0b7e00-6e10-11e8-ba49-e983650e5ca0', '', 1),
('f10c7e21-6e10-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [tynghn] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-06-12 14:19:27', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'ef0b7e00-6e10-11e8-ba49-e983650e5ca0', '', 1),
('f977e510-7057-11e8-bf09-353ea375fc2a', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [CV ] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-15 11:52:58', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'f7bdd900-7057-11e8-bf09-353ea375fc2a', '', 1),
('f9780c20-7057-11e8-bf09-353ea375fc2a', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [CV ] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-06-15 11:52:58', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'f7bdd900-7057-11e8-bf09-353ea375fc2a', '', 1),
('fb1cfb00-6e11-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [dfvdfv] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-12 14:26:54', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'f98a9b30-6e11-11e8-ba49-e983650e5ca0', '', 1),
('fb1cfb01-6e11-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [dfvdfv] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-06-12 14:26:54', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'f98a9b30-6e11-11e8-ba49-e983650e5ca0', '', 1),
('ff7ffc70-6e10-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [ghngn] vừa tạo đơn hàng mới thành công', '719AD10A-04F9-4FD8-9351-1B2602277967', '2018-06-12 14:19:51', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'fddd21e0-6e10-11e8-ba49-e983650e5ca0', '', 1),
('ff802380-6e10-11e8-ba49-e983650e5ca0', 'Nhận 01 đơn hàng', 'glyphicon glyphicon-file', 'Người dùng [ghngn] vừa tạo đơn hàng mới thành công', 'a23c09e8-5329-11e8-9c2d-fa7ae01bbebc', '2018-06-12 14:19:51', 'System', 'danh-sach-don-hang', b'0', b'1', NULL, NULL, 'fddd21e0-6e10-11e8-ba49-e983650e5ca0', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `omwebsessions`
--

CREATE TABLE `omwebsessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `omwebsessions`
--

INSERT INTO `omwebsessions` (`session_id`, `expires`, `data`) VALUES
('evfW47HELLoSUmCewgY08FeBYz5tz5dl', 1529997974, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"locale\":\"vi\",\"username\":\"admin\",\"user_id\":\"719AD10A-04F9-4FD8-9351-1B2602277967\"}'),
('vZTZsi5md5hCElccUtO92bbCaie-ipTI', 1529997914, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"locale\":\"vi\"}');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desciption` text COLLATE utf8_unicode_ci,
  `child_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `master_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `desciption`, `child_group`, `master_group`, `sort_order`, `created_date`, `created_by`, `updated_by`, `updated_date`) VALUES
('42cd1a24-78ef-11e8-adc0-fa7ae01bbebc', 'Kho hàng', NULL, 'Quản lý kho', 'Business', 1, '2018-06-26 00:00:00', 'vinh', NULL, NULL),
('42cd1c9a-78ef-11e8-adc0-fa7ae01bbebc', 'Thêm đơn hàng', NULL, 'Quản lý đơn hàng', 'Business', 1, '2018-06-26 00:00:00', 'vinh', NULL, NULL),
('42cd1dda-78ef-11e8-adc0-fa7ae01bbebc', 'Danh sách đơn hàng', NULL, 'Quản lý đơn hàng', 'Business', 2, '2018-06-26 00:00:00', 'vinh', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `identification` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `avatar` text COLLATE utf8_unicode_ci,
  `birthday` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `points` float DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `identification`, `name`, `avatar`, `birthday`, `points`, `phone`, `gender`, `email`, `created_date`, `updated_date`, `updated_by`, `created_by`, `entity_code`, `status`) VALUES
('23f9c820-4778-11e8-95cb-b39557e4c099', NULL, 'Đức Đoàn Ngọc', NULL, '2018-04-24T04:29:56.009+00:00', 0, '', 1, 'xemamoimua_mongcondungdua@yahoo.com', '2018-04-24 04:29:56', NULL, '23f9c820-4778-11e8-95cb-b39557e4c099', NULL, 'PER', 1),
('2a1056e0-4780-11e8-972d-83830e1a0abc', NULL, 'Thiện Đại Gia', NULL, '2018-04-24T05:27:22.209+00:00', 0, '', 1, 'vinh_thien0301@yahoo.com', '2018-04-24 05:27:22', NULL, '2a1056e0-4780-11e8-972d-83830e1a0abc', NULL, 'PER', 1),
('a759a330-4777-11e8-8c06-a556c69e9e14', NULL, 'Đức Đoàn Ngọc', NULL, '2018-04-24T04:26:26.921+00:00', 0, '', 1, 'xemamoimua_mongcondungdua@yahoo.com', '2018-04-24 04:26:26', NULL, 'a759a330-4777-11e8-8c06-a556c69e9e14', NULL, 'PER', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personaddress`
--

CREATE TABLE `personaddress` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ward_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `is_default` bit(1) DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `personaddress`
--

INSERT INTO `personaddress` (`id`, `person_id`, `type_name`, `city_id`, `district_id`, `ward_id`, `street`, `email`, `phone`, `address`, `is_default`, `created_by`, `created_date`, `updated_date`, `updated_by`, `status`) VALUES
('cc93cad0-6e10-11e8-ba49-e983650e5ca0', NULL, 'ghnghn', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', '09932117-DB4A-47AB-9C9C-8A19AC26DFD2', '', '', 'ghngn', 'ghnghn', 'ghnghn', b'0', 'ghnghn', '2018-06-12 14:18:26', NULL, NULL, 1),
('d789fb10-6250-11e8-8298-8373a6093a17', NULL, 'Nguyen chi bao', 'df027a54-4223-11e8-842f-0ed5f89f718b', 'df028440-4223-11e8-842f-0ed5f89f718b', '', '', 'chibaoit@yahoo.com', '0989575801', '23 Quang trung', b'0', 'Nguyen chi bao', '2018-05-28 15:26:38', NULL, NULL, 1),
('e0cf6360-6e10-11e8-ba49-e983650e5ca0', NULL, 'ghnghn', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', '0F3056E6-D5FD-4287-A736-076B8C92DCC9', '', '', 'gnghn', 'ghnghn', 'ghnhgn', b'0', 'ghnghn', '2018-06-12 14:19:00', NULL, NULL, 1),
('e78b1e10-622b-11e8-af02-9586fbee6a97', NULL, 'test 1', 'df027a54-4223-11e8-842f-0ed5f89f718b', 'df028fc6-4223-11e8-842f-0ed5f89f718b', '', '', 'test 1', 'test 1', 'test 1', b'0', 'test 1', '2018-05-28 11:02:14', NULL, NULL, 1),
('ef0ba510-6e10-11e8-ba49-e983650e5ca0', NULL, 'ghnghn', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', 'EF24549E-D824-483B-AFA9-D877D7D4BBB4', '', '', 'tynghn', 'ghnghnghnghn', 'gghnghn', b'0', 'ghnghn', '2018-06-12 14:19:24', NULL, NULL, 1),
('f7be4e30-7057-11e8-bf09-353ea375fc2a', NULL, 'CV ', '0ACA0257-5987-45FC-BBA7-CD6235DE3C23', '08FD9974-44E6-44A9-ABAD-611ED30FBF99', '', '', 'CV ', 'CV CV', 'CV CV ', b'0', 'CV ', '2018-06-15 11:52:55', NULL, NULL, 1),
('f7f96490-6173-11e8-9e5b-11ff03b3a9f4', NULL, 'Nguyễn Hữu Tài', 'df027a54-4223-11e8-842f-0ed5f89f718b', 'df028440-4223-11e8-842f-0ed5f89f718b', '', '', 'nhtai1712@gmail.com', '0938613461', '194/3 Nguyễn Trọng Tuyển Phường 8 Quận Phú Nhuận', b'0', 'Nguyễn Hữu Tài', '2018-05-27 13:05:34', NULL, NULL, 1),
('f98ac240-6e11-11e8-ba49-e983650e5ca0', NULL, 'dfvdfv', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', '0F3056E6-D5FD-4287-A736-076B8C92DCC9', '', '', 'dfvdfv', '435345', '23242', b'0', 'dfvdfv', '2018-06-12 14:26:51', NULL, NULL, 1),
('fd7eadc0-6255-11e8-8298-8373a6093a17', NULL, 'assa', 'df027a54-4223-11e8-842f-0ed5f89f718b', 'df028440-4223-11e8-842f-0ed5f89f718b', '', '', 'sfsf', 'sadadsasds', 'adsa', b'0', 'assa', '2018-05-28 16:03:29', NULL, NULL, 1),
('fddd48f0-6e10-11e8-ba49-e983650e5ca0', NULL, 'ghngn', '1408C488-E12C-44C0-8CC1-C6EABFB6DECA', '0F3056E6-D5FD-4287-A736-076B8C92DCC9', '', '', 'ghngn', 'bnngn', 'ghngn', b'0', 'ghngn', '2018-06-12 14:19:49', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personpoints`
--

CREATE TABLE `personpoints` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `points` float DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `requiring_entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requiring_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_category_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci,
  `quantity` float DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `contentHTML` text COLLATE utf8_unicode_ci,
  `price` decimal(18,2) DEFAULT NULL,
  `weight` text COLLATE utf8_unicode_ci,
  `parent_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` text COLLATE utf8_unicode_ci,
  `tags` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL COMMENT '1: Hiện; 2: Ẩn',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1:normal; 2:Thit bo nhap khau; 3: Thit heo nhap khau; 4: thuc pham dong lanh; 5: san pham tieu dung ',
  `sort_order` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `is_important` bit(1) NOT NULL,
  `countview` int(32) DEFAULT NULL,
  `brand` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_category_id`, `code`, `name`, `title`, `quantity`, `image`, `description`, `contentHTML`, `price`, `weight`, `parent_id`, `entity_code`, `created_date`, `created_by`, `updated_date`, `updated_by`, `unit`, `tags`, `status`, `type`, `sort_order`, `rating`, `is_important`, `countview`, `brand`, `color`) VALUES
('791b5b80-75d5-11e8-b76b-6b9bc351a5d4', '815bdaf0-7534-11e8-bd23-45f4487c68fa', 'CD0454589', 'Nhôm 10 tấc', NULL, 10, NULL, NULL, NULL, '100000.00', NULL, NULL, 'PRD', '2018-06-22 11:33:55', 'admin', '2018-06-22 12:01:46', 'admin', 'cây', NULL, 0, 1, 0, 0, b'0', NULL, NULL, 'màu'),
('941090a0-78fe-11e8-9434-917b8ac70155', '560fca80-78fb-11e8-81d8-7319b1b5bb71', 'DC090390', 'Nhôm 10 tấc', NULL, 1, NULL, NULL, NULL, '500000.00', NULL, NULL, 'PRD', '2018-06-26 12:05:43', 'admin', '2018-06-26 12:05:49', 'admin', 'cây', NULL, 1, 1, 2, 0, b'0', NULL, NULL, 'đỏ'),
('f14a24e0-78fc-11e8-979e-ed22ac8b325d', '560fca80-78fb-11e8-81d8-7319b1b5bb71', 'DC039049304', 'Nhôm 20 tấc', NULL, 1, NULL, NULL, NULL, '50000.00', NULL, NULL, 'PRD', '2018-06-26 11:54:01', 'admin', '2018-06-26 12:03:04', 'admin', 'cái', NULL, 1, 1, 1, 0, b'0', NULL, NULL, 'đen'),
('fbfa1c80-75d0-11e8-abd4-9d8b126d9608', '8a0961e0-7534-11e8-bd23-45f4487c68fa', 'cd938493894', 'Đinh ốc', NULL, 1, NULL, NULL, NULL, '50555.00', NULL, NULL, 'PRD', '2018-06-22 11:01:47', 'admin', '2018-06-26 11:59:44', 'admin', 'con', NULL, 1, 1, 2, 0, b'0', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE `productcategory` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `contentHTML` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1: Hiện; 2: Ẩn',
  `sort_order` int(11) DEFAULT NULL,
  `parent_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `footer` int(11) NOT NULL COMMENT '0: not in footer; 1: in footer',
  `banner_image` text COLLATE utf8_unicode_ci,
  `link` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`id`, `name`, `title`, `description`, `contentHTML`, `created_date`, `created_by`, `updated_by`, `updated_date`, `entity_code`, `status`, `sort_order`, `parent_id`, `image`, `footer`, `banner_image`, `link`) VALUES
('560fca80-78fb-11e8-81d8-7319b1b5bb71', 'Sản phẩm chính', 'Sản phẩm chính', NULL, NULL, '2018-06-26 11:42:31', 'admin', 'admin', '2018-06-26 05:02:33', 'CAT', 1, NULL, NULL, NULL, 0, NULL, NULL),
('5b28fbe0-7531-11e8-ab9d-6d25ee693194', 'Sản phẩm phụ kiện', 'Sản phẩm phụ kiện', 'Sản phẩm phụ kiện', NULL, '2018-06-21 15:59:07', 'admin', NULL, NULL, 'CAT', 0, NULL, NULL, NULL, 0, NULL, NULL),
('815bdaf0-7534-11e8-bd23-45f4487c68fa', 'Sản phẩm chính', 'Sản phẩm chính', 'Sản phẩm chính', NULL, '2018-06-21 16:21:40', 'admin', NULL, NULL, 'CAT', 0, NULL, NULL, NULL, 0, NULL, NULL),
('832a60c0-7531-11e8-b936-d5561bf74c97', 'Sản phẩm phụ kiện', 'Sản phẩm phụ kiện', NULL, NULL, '2018-06-21 16:00:14', 'admin', 'admin', '2018-06-21 09:21:17', 'CAT', 0, NULL, NULL, NULL, 0, NULL, NULL),
('8a0961e0-7534-11e8-bd23-45f4487c68fa', 'Sản phẩm phụ kiện', 'Sản phẩm phụ kiện', 'Sản phẩm phụ kiện', NULL, '2018-06-21 16:21:54', 'admin', NULL, NULL, 'CAT', 1, NULL, NULL, NULL, 0, NULL, NULL),
('c0adfa10-5597-11e8-97de-11e29837b71e', 'Gia Vị Món Thái', 'Gia Vị Món Thái', 'Gia Vị Thái Lan', '<p>Gia Vị Th&aacute;i Lan</p>\n', '2018-05-12 03:51:29', 'operamart', 'operamart', '2018-05-31 08:54:14', 'CAT', 0, 3, '4a268060-5597-11e8-97de-11e29837b71e', '1920x780-2.jpg', 1, NULL, NULL),
('caee4860-540a-11e8-af87-3d1522baf4cf', 'Thực phẩm Thái Lan', 'Thực phẩm Thái Lan', 'Thực phẩm & Gia vị Thái Lan', '<p>Thực phẩm &amp; Gia vị Th&aacute;i Lan</p>\n', '2018-05-10 04:29:56', 'operamart', 'operamart', '2018-05-31 08:53:53', 'CAT', 0, 2, '21cc2b90-5422-11e8-987c-3175527800d5', 'logo-operamart.png', 0, NULL, NULL),
('cd22f960-3d66-11e8-bf74-0bb10a1c68dd', 'eewt', 'gasg', 'awgweg', '<p>sagdsag</p>\n', '2018-04-11 09:00:37', 'admin', 'admin', '2018-04-11 09:02:56', 'CAT', 0, 3, 'Không có', 'Screen Shot 2018-04-07 at 1.04.27 AM.png', 0, NULL, NULL),
('d05cf0c0-4650-11e8-a663-759b9c788839', 'Thực phẩm Hàn Quốc', 'Thực phẩm Hàn Quốc', 'Thực phẩm Hàn Quốc', 'Thực phẩm Hàn Quốc', '2018-04-22 17:15:54', 'admin', NULL, NULL, 'CAT', 0, 2, '47aee340-3e36-11e8-ae7c-87df652be401', NULL, 0, NULL, NULL),
('d38791a0-5597-11e8-97de-11e29837b71e', 'Gia Vị Quốc Tế', 'Gia Vị Quốc Tế', 'Gia Vị Châu Âu', '<p>Gia Vị Ch&acirc;u &Acirc;u</p>\n', '2018-05-12 03:52:01', 'operamart', '666', '2018-06-20 10:55:58', 'CAT', 0, 4, '4a268060-5597-11e8-97de-11e29837b71e', '1920x780-2.jpg', 1, '29341601_1622151224500723_1303803572_n.png', 'vyv'),
('e1881f90-4651-11e8-a663-759b9c788839', 'Gia Vị Singapore', 'Gia Vị Singapore', 'Gia Vị Singapore', 'Gia Vị Singapore', '2018-04-22 17:23:32', 'admin', NULL, NULL, 'CAT', 0, 5, '25632200-464d-11e8-9a1a-b3cb4e1477e5', NULL, 0, NULL, NULL),
('f4888db0-7530-11e8-81ec-5bb6bd4ba3ad', 'Sản phẩm phụ kiện', 'Sản phẩm phụ kiện', 'Sản phẩm phụ kiện', NULL, '2018-06-21 15:56:15', 'admin', NULL, NULL, 'CAT', 0, NULL, NULL, NULL, 0, NULL, NULL),
('f5642870-4650-11e8-a663-759b9c788839', 'Thực phẩm Thái Lan', 'Thực phẩm Thái Lan', 'Thực phẩm Thái Lan', 'Thực phẩm Thái Lan', '2018-04-22 17:16:56', 'admin', NULL, NULL, 'CAT', 0, 3, '47aee340-3e36-11e8-ae7c-87df652be401', NULL, 0, NULL, NULL),
('fb15cd50-63c4-11e8-aa11-9126d5ada019', 'Nước mắm Phan Thiết', 'Nước mắm Phan Thiết', 'Nước mắm Phan Thiết', '<p>Nước mắm Phan Thiết</p>\n', '2018-05-30 11:50:31', 'operamart', 'operamart', '2018-05-30 04:58:22', 'CAT', 0, 1, NULL, 'Nuoc-mam-Phan-thiet.jpg', 0, 'nuoc_mam_phan_thiet.jpg', NULL),
('fdb3bb70-4651-11e8-a663-759b9c788839', 'Gia Vị Món Thái', 'Gia Vị Món Thái', 'Gia Vị Món Thái', 'Gia Vị Món Thái', '2018-04-22 17:24:19', 'admin', NULL, NULL, 'CAT', 0, 6, '25632200-464d-11e8-9a1a-b3cb4e1477e5', NULL, 0, NULL, NULL),
('ffb99300-4650-11e8-a663-759b9c788839', 'Thực phẩm Asean', 'Thực phẩm Asean', 'Thực phẩm Asean', 'Thực phẩm Asean', '2018-04-22 17:17:13', 'admin', NULL, NULL, 'CAT', 0, 4, '47aee340-3e36-11e8-ae7c-87df652be401', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productlinkcontent`
--

CREATE TABLE `productlinkcontent` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productwishlist`
--

CREATE TABLE `productwishlist` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requiring_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requiring_entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `type` int(11) DEFAULT NULL COMMENT '1: Fixed price; 2: percentage; 3: gift;',
  `title` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `contentHTML` text COLLATE utf8_unicode_ci,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `minimum_price` decimal(18,2) DEFAULT NULL,
  `maximum_price` decimal(18,2) DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0: deleted,1: created_not_used,2:de_activated',
  `entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `icon` text COLLATE utf8_unicode_ci NOT NULL,
  `fix_price` decimal(18,2) NOT NULL,
  `percent` float NOT NULL,
  `coupon` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_of_uses` int(11) NOT NULL DEFAULT '0',
  `coupon_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotiondetail`
--

CREATE TABLE `promotiondetail` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `promotion_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL COMMENT '0: deleted,1: created_not_used,2:de_activated,3:used',
  `entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon` text COLLATE utf8_unicode_ci,
  `already_used_sign_up` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promotiondetail`
--

INSERT INTO `promotiondetail` (`id`, `promotion_id`, `product_id`, `person_id`, `created_date`, `created_by`, `updated_by`, `updated_date`, `remark`, `status`, `entity_code`, `coupon`, `already_used_sign_up`) VALUES
('62d5b790-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'At2AEz', 0),
('62d62cc0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AxbXim', 0),
('62d653d0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ArxoMj', 0),
('62d67ae0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AdrFAh', 0),
('62d6a1f0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AxBuZy', 0),
('62d76540-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AtEIGK', 0),
('62d78c50-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AVgYLs', 0),
('62d7da70-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AYkGVX', 0),
('62d80180-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ABXNPl', 0),
('62d82890-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ARRGAo', 0),
('62d84fa0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AUnA89', 0),
('62d876b0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A4p2zq', 0),
('62d9af30-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A4NIqp', 0),
('62db35d0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AqH5nz', 0),
('62de6a20-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AFMmq8', 0),
('62e80710-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A3INRT', 0),
('62ea29f0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AIRTQQ', 0),
('62ea5100-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ADZ09P', 0),
('62ea9f20-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AXGG62', 0),
('62eac630-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AtT7c4', 0),
('62eb1450-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AhPMpm', 0),
('62eb6270-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'Ab3jlm', 0),
('62ebb090-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AbnsOC', 0),
('62ebfeb0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AOXhgx', 0),
('63211870-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AOzzrt', 0),
('632a1920-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ALEWoP', 0),
('632a4030-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AUMzUP', 0),
('632a6740-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AVrriv', 0),
('632ab560-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AdjSxY', 0),
('632adc70-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AlcPji', 0),
('632b0380-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AkzIBO', 0),
('632b2a90-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A9u754', 0),
('632b51a0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A7eQAA', 0),
('632b78b0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AZGX0n', 0),
('632bc6d0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A2etDk', 0),
('632bede0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ALmNKH', 0),
('632c14f0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'Au5kyJ', 0),
('632c3c00-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A2Sa1t', 0),
('632c6310-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AvVntz', 0),
('632cb130-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A6SAGt', 0),
('632cd840-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'Ap0M20', 0),
('632cff50-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ARtv6q', 0),
('632d2660-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AwYf15', 0),
('632efb20-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A4xHAS', 0),
('632f2230-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A9qhd0', 0),
('632f4940-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AefSZ0', 0),
('632f7050-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'Artoyg', 0),
('632f9760-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ApnZpQ', 0),
('632fbe70-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AotZSx', 0),
('63300c90-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AcxwUN', 0),
('63319330-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'Ao6IWO', 0),
('6333b610-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AaFs2z', 0),
('6333dd20-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AYoXuF', 0),
('63340430-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AYHMU8', 0),
('63345250-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'Axplmk', 0),
('63347960-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ACUSAU', 0),
('6334a070-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A5H6iR', 0),
('6334c780-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AZyBnW', 0),
('6334ee90-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AA7l0o', 0),
('633515a0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AtjccD', 0),
('633563c0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AhU1xE', 0),
('63358ad0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A3PJu5', 0),
('6335b1e0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'Abgswr', 0),
('6335d8f0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AMnxpI', 0),
('63360000-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AdCtAz', 0),
('63362710-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AD8WAO', 0),
('63367530-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AcCkPC', 0),
('63369c40-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AMbdGY', 0),
('6336c350-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AWMgUr', 0),
('6336ea60-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AJLnXU', 0),
('63371170-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ADKfnb', 0),
('63373880-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A22S5C', 0),
('63375f90-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AAVD1z', 0),
('6337adb0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ATs0lk', 0),
('6337d4c0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AD4GzH', 0),
('6337fbd0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A6jzxM', 0),
('633849f0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ACkIhp', 0),
('63387100-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AUNWvJ', 0),
('63389810-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'A87cFX', 0),
('63393450-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AodC7c', 0),
('63395b60-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ASnvcv', 0),
('63398270-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ANhOj0', 0),
('6339d090-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AilJK7', 0),
('6339f7a0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'AM9Zf1', 0),
('633a1eb0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'ACQMfN', 0),
('633a93e0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'At9rxx', 0),
('633abaf0-624c-11e8-8298-8373a6093a17', '62c00cb0-624c-11e8-8298-8373a6093a17', NULL, NULL, '2018-05-28 14:54:45', 'operamart', NULL, NULL, NULL, 1, 'COU', 'Akwcox', 0),
('689b71c0-6255-11e8-8298-8373a6093a17', '3b78e100-6255-11e8-8298-8373a6093a17', '440074c0-6226-11e8-af02-9586fbee6a97', NULL, '2018-05-28 15:59:20', 'admin', NULL, NULL, NULL, 1, 'PCP', NULL, 0),
('be540da0-6252-11e8-8298-8373a6093a17', '39cfa530-6252-11e8-8298-8373a6093a17', '440074c0-6226-11e8-af02-9586fbee6a97', NULL, '2018-05-28 15:40:15', 'admin', NULL, NULL, NULL, 1, 'PSO', NULL, 0),
('d92999f0-6253-11e8-8298-8373a6093a17', 'a282aa40-6253-11e8-8298-8373a6093a17', '53b2e640-6227-11e8-af02-9586fbee6a97', NULL, '2018-05-28 15:48:09', 'admin', NULL, NULL, NULL, 1, 'PGT', NULL, 0),
('daa898d0-6253-11e8-8298-8373a6093a17', 'a282aa40-6253-11e8-8298-8373a6093a17', '09bee190-59b4-11e8-b0b8-074ede13ac27', NULL, '2018-05-28 15:48:12', 'admin', NULL, NULL, NULL, 1, 'PKL', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorder`
--

CREATE TABLE `purchaseorder` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `fullname` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_different` int(11) DEFAULT NULL,
  `address_delivery` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_delivery_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ward_delivery_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district_delivery_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1: New; 2: Confirmed; 3: Delivered; 4: Done; 5: Not ready;6: Paying',
  `total_amount` decimal(18,2) DEFAULT NULL,
  `total_quantity` float DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `percent_promotion` decimal(18,2) DEFAULT NULL COMMENT 'coupon_percentage_promotion',
  `price_coupon` decimal(18,2) DEFAULT NULL COMMENT 'coupon_fixed_price_promotion',
  `code_coupon` text COLLATE utf8_unicode_ci,
  `coupon_promotion_name` text COLLATE utf8_unicode_ci NOT NULL,
  `coupon_promotion_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` int(11) DEFAULT NULL COMMENT '1:COD,2:The ATM,3:Quoc te'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorderdetail`
--

CREATE TABLE `purchaseorderdetail` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `purchase_order_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `total_amount` decimal(18,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_promotion` bit(1) DEFAULT NULL,
  `percent_promotion` decimal(18,2) DEFAULT NULL,
  `price_promotion` decimal(18,2) DEFAULT NULL,
  `code_promotion` text COLLATE utf8_unicode_ci,
  `promotion_name` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorderdetailgift`
--

CREATE TABLE `purchaseorderdetailgift` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_order_detail_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_gift_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorderhistory`
--

CREATE TABLE `purchaseorderhistory` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_order_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `total_amount` decimal(18,2) DEFAULT NULL,
  `total_quantity` float DEFAULT NULL,
  `remark` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_date` datetime DEFAULT NULL,
  `action_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchaseorderhistory`
--

INSERT INTO `purchaseorderhistory` (`id`, `purchase_order_id`, `status`, `total_amount`, `total_quantity`, `remark`, `action_date`, `action_by`) VALUES
('0f25a6d1-7851-11e8-af38-a98cf1384596', '0f25a6d1-7851-11e8-af38-a98cf1384596', 1, '2505550.00', 1, NULL, '2018-06-25 15:23:37', 'admin'),
('1803d020-7850-11e8-8729-b70beeb94f41', '1803d020-7850-11e8-8729-b70beeb94f41', 1, '2505550.00', 1, NULL, '2018-06-25 15:16:43', 'admin'),
('21ab8070-784e-11e8-941e-73ce8560c9ca', '21ab8070-784e-11e8-941e-73ce8560c9ca', 1, '4505550.00', 1, NULL, '2018-06-25 15:02:40', 'admin'),
('2deae0b0-784e-11e8-9d96-9d98f266a777', '2deae0b0-784e-11e8-9d96-9d98f266a777', 1, '4505550.00', 1, NULL, '2018-06-25 15:03:00', 'admin'),
('3d444ad0-7851-11e8-a74a-75be8678be44', '3d444ad0-7851-11e8-a74a-75be8678be44', 1, '2505550.00', 1, NULL, '2018-06-25 15:24:55', 'admin'),
('549e0490-7857-11e8-9b6d-39442f6f48b2', '549e0490-7857-11e8-9b6d-39442f6f48b2', 1, '3022200.00', 1, NULL, '2018-06-25 16:08:31', 'admin'),
('62ec5cc0-7859-11e8-9a80-51c32a5e0d9b', '62ec5cc0-7859-11e8-9a80-51c32a5e0d9b', 1, '3022200.00', 1, NULL, '2018-06-25 16:23:14', 'admin'),
('8a9278b0-784d-11e8-9184-ef32e1e9ce25', '8a9278b0-784d-11e8-9184-ef32e1e9ce25', 1, '4505550.00', 1, NULL, '2018-06-25 14:58:26', 'admin'),
('8e5e3bd0-784f-11e8-84d6-6960b8b0a500', '8e5e3bd0-784f-11e8-84d6-6960b8b0a500', 1, '2505550.00', 1, NULL, '2018-06-25 15:12:52', 'admin'),
('9e1f0b90-7858-11e8-85c5-3f3c05321de0', '9e1f0b90-7858-11e8-85c5-3f3c05321de0', 1, '3022200.00', 1, NULL, '2018-06-25 16:17:44', 'admin'),
('bbb99a60-7850-11e8-a585-7fd072ab6949', 'bbb99a60-7850-11e8-a585-7fd072ab6949', 1, '2505550.00', 1, NULL, '2018-06-25 15:21:17', 'admin'),
('c1fb9500-784f-11e8-af46-b9d7aee14c37', 'c1fb9500-784f-11e8-af46-b9d7aee14c37', 1, '2505550.00', 1, NULL, '2018-06-25 15:14:18', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `description`, `created_date`, `created_by`, `updated_by`, `updated_date`) VALUES
('783688d0-739f-11e8-adc0-fa7ae01bbebc', 'Administrator', 'Administrator', '2018-06-19 16:04:07', 'admin', NULL, NULL),
('78368c7c-739f-11e8-adc0-fa7ae01bbebc', 'Accounting', 'Accounting', '2018-06-19 16:04:07', 'admin', NULL, NULL),
('78368dc6-739f-11e8-adc0-fa7ae01bbebc', 'Supervisor', 'Supervisor', '2018-06-19 16:04:07', 'admin', NULL, NULL),
('78368ef2-739f-11e8-adc0-fa7ae01bbebc', 'Founder', 'Founder', '2018-06-19 16:04:07', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rolepermission`
--

CREATE TABLE `rolepermission` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci,
  `contentHTML` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `requiring_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requiring_entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemlogs`
--

CREATE TABLE `systemlogs` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `desciption` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `quantity` float DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` bit(1) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `login_fail` int(11) DEFAULT NULL,
  `last_login` text COLLATE utf8_unicode_ci,
  `is_locked` bit(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `socket_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `is_confirm`, `type`, `login_fail`, `last_login`, `is_locked`, `created_date`, `updated_date`, `created_by`, `updated_by`, `entity_code`, `socket_id`) VALUES
('1a46d680-78f9-11e8-8ab1-815620bcab90', 'hoang', '202cb962ac59075b964b07152d234b70', b'1', 1, 0, '2018-06-26T11:26:31.784+07:00', b'0', '2018-06-26 11:26:31', NULL, 'admin', NULL, 'PER', NULL),
('6128f710-78f7-11e8-8ab1-815620bcab90', 'klalin', 'e10adc3949ba59abbe56e057f20f883e', b'1', 1, 0, '2018-06-26T11:14:11.713+07:00', b'0', '2018-06-26 11:14:11', NULL, 'admin', NULL, 'PER', 'ff9lbygRB3PngLd3AAAA'),
('719AD10A-04F9-4FD8-9351-1B2602277967', 'admin', 'e10adc3949ba59abbe56e057f20f883e', b'1', 1, 0, '2018-04-09 00:00:00', b'0', '2018-04-09 00:00:00', '2018-04-09 00:00:00', '719AD10A-04F9-4FD8-9351-1B2602277967', '719AD10A-04F9-4FD8-9351-1B2602277967', 'PER', 'zVrA2hDe2yt_yr5gAAAA'),
('e83bf240-78fa-11e8-81d8-7319b1b5bb71', 'ngoc', '202cb962ac59075b964b07152d234b70', b'1', 1, 0, '2018-06-26T11:39:26.820+07:00', b'0', '2018-06-26 11:39:26', NULL, 'admin', NULL, 'PER', NULL),
('ea2f7450-7459-11e8-a0a6-51ef3d744e3f', 'nhanngu', 'e10adc3949ba59abbe56e057f20f883e', b'1', 1, 0, '2018-06-20T14:16:56.469+07:00', b'0', '2018-06-20 14:16:56', NULL, '666', NULL, 'PER', '1aItbHhlwzHk36ROAAAA');

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`id`, `role_id`, `user_id`, `created_date`, `created_by`, `updated_by`, `updated_date`) VALUES
('1a45b7b0-745c-11e8-b96d-f1db528b4d0a', '783688d0-739f-11e8-adc0-fa7ae01bbebc', '1a4590a0-745c-11e8-b96d-f1db528b4d0a', '2018-06-20 14:32:36', '666', NULL, NULL),
('1a45b7b1-745c-11e8-b96d-f1db528b4d0a', '78368c7c-739f-11e8-adc0-fa7ae01bbebc', '1a4590a0-745c-11e8-b96d-f1db528b4d0a', '2018-06-20 14:32:36', '666', NULL, NULL),
('1a45b7b2-745c-11e8-b96d-f1db528b4d0a', '78368ef2-739f-11e8-adc0-fa7ae01bbebc', '1a4590a0-745c-11e8-b96d-f1db528b4d0a', '2018-06-20 14:32:36', '666', NULL, NULL),
('5a0da0b0-7448-11e8-aad7-c3186d3832ca', '783688d0-739f-11e8-adc0-fa7ae01bbebc', '5a0d79a0-7448-11e8-aad7-c3186d3832ca', '2018-06-20 12:11:13', 'admin', NULL, NULL),
('5a0da0b1-7448-11e8-aad7-c3186d3832ca', '78368c7c-739f-11e8-adc0-fa7ae01bbebc', '5a0d79a0-7448-11e8-aad7-c3186d3832ca', '2018-06-20 12:11:13', 'admin', NULL, NULL),
('5a0dc7c0-7448-11e8-aad7-c3186d3832ca', '78368ef2-739f-11e8-adc0-fa7ae01bbebc', '5a0d79a0-7448-11e8-aad7-c3186d3832ca', '2018-06-20 12:11:13', 'admin', NULL, NULL),
('6894a700-7448-11e8-aad7-c3186d3832ca', '78368dc6-739f-11e8-adc0-fa7ae01bbebc', '5a0d79a0-7448-11e8-aad7-c3186d3832ca', '2018-06-20 12:11:37', 'admin', NULL, NULL),
('77514c30-745c-11e8-bc69-f50a924b1da4', '783688d0-739f-11e8-adc0-fa7ae01bbebc', '7750fe10-745c-11e8-bc69-f50a924b1da4', '2018-06-20 14:35:12', '666', NULL, NULL),
('77514c31-745c-11e8-bc69-f50a924b1da4', '78368c7c-739f-11e8-adc0-fa7ae01bbebc', '7750fe10-745c-11e8-bc69-f50a924b1da4', '2018-06-20 14:35:12', '666', NULL, NULL),
('839a2ee0-7447-11e8-a25d-5f07ad7819ca', '78368ef2-739f-11e8-adc0-fa7ae01bbebc', '419a8ae0-7446-11e8-a26b-6ddf8911e26b', '2018-06-20 12:05:13', 'admin', NULL, NULL),
('89d38c10-7448-11e8-aad7-c3186d3832ca', '78368dc6-739f-11e8-adc0-fa7ae01bbebc', '89d36500-7448-11e8-aad7-c3186d3832ca', '2018-06-20 12:12:33', 'admin', NULL, NULL),
('a5ad7af0-7447-11e8-a25d-5f07ad7819ca', '783688d0-739f-11e8-adc0-fa7ae01bbebc', '419a8ae0-7446-11e8-a26b-6ddf8911e26b', '2018-06-20 12:06:10', 'admin', NULL, NULL),
('a5ada200-7447-11e8-a25d-5f07ad7819ca', '78368c7c-739f-11e8-adc0-fa7ae01bbebc', '419a8ae0-7446-11e8-a26b-6ddf8911e26b', '2018-06-20 12:06:10', 'admin', NULL, NULL),
('a9e6dee0-7447-11e8-a25d-5f07ad7819ca', '783688d0-739f-11e8-adc0-fa7ae01bbebc', '419a8ae0-7446-11e8-a26b-6ddf8911e26b', '2018-06-20 12:06:17', 'admin', NULL, NULL),
('a9e705f0-7447-11e8-a25d-5f07ad7819ca', '78368c7c-739f-11e8-adc0-fa7ae01bbebc', '419a8ae0-7446-11e8-a26b-6ddf8911e26b', '2018-06-20 12:06:17', 'admin', NULL, NULL),
('a9e75410-7447-11e8-a25d-5f07ad7819ca', '78368ef2-739f-11e8-adc0-fa7ae01bbebc', '419a8ae0-7446-11e8-a26b-6ddf8911e26b', '2018-06-20 12:06:17', 'admin', NULL, NULL),
('b0f348e0-745b-11e8-b96d-f1db528b4d0a', '78368c7c-739f-11e8-adc0-fa7ae01bbebc', 'b0f2fac0-745b-11e8-b96d-f1db528b4d0a', '2018-06-20 14:29:39', '666', NULL, NULL),
('b0f348e1-745b-11e8-b96d-f1db528b4d0a', '78368ef2-739f-11e8-adc0-fa7ae01bbebc', 'b0f2fac0-745b-11e8-b96d-f1db528b4d0a', '2018-06-20 14:29:39', '666', NULL, NULL),
('ea2f9b60-7459-11e8-a0a6-51ef3d744e3f', '783688d0-739f-11e8-adc0-fa7ae01bbebc', 'ea2f7450-7459-11e8-a0a6-51ef3d744e3f', '2018-06-20 14:16:56', '666', NULL, NULL),
('ea2f9b61-7459-11e8-a0a6-51ef3d744e3f', '78368c7c-739f-11e8-adc0-fa7ae01bbebc', 'ea2f7450-7459-11e8-a0a6-51ef3d744e3f', '2018-06-20 14:16:56', '666', NULL, NULL),
('ea2fc270-7459-11e8-a0a6-51ef3d744e3f', '78368ef2-739f-11e8-adc0-fa7ae01bbebc', 'ea2f7450-7459-11e8-a0a6-51ef3d744e3f', '2018-06-20 14:16:56', '666', NULL, NULL),
('f38ed430-745b-11e8-b96d-f1db528b4d0a', '78368c7c-739f-11e8-adc0-fa7ae01bbebc', 'f38ead20-745b-11e8-b96d-f1db528b4d0a', '2018-06-20 14:31:31', '666', NULL, NULL),
('f38ed431-745b-11e8-b96d-f1db528b4d0a', '78368ef2-739f-11e8-adc0-fa7ae01bbebc', 'f38ead20-745b-11e8-b96d-f1db528b4d0a', '2018-06-20 14:31:31', '666', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usersocial`
--

CREATE TABLE `usersocial` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `email` bigint(20) DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usersocial`
--

INSERT INTO `usersocial` (`id`, `user_id`, `title`, `code`, `client_id`, `email`, `image`, `created_by`, `updated_by`, `created_date`, `updated_date`, `status`) VALUES
('23fa3d50-4778-11e8-95cb-b39557e4c099', '23f9c820-4778-11e8-95cb-b39557e4c099', 'user_name23f9c820-4778-11e8-95cb-b39557e4c099', NULL, 1904913146247411, 0, 'https://lookaside.facebook.com/platform/profilepic/?asid=1904913146247411&height=50&width=50&ext=1524803395&hash=AeR-_98y5bEI1w8-', '23f9c820-4778-11e8-95cb-b39557e4c099', NULL, '2018-04-24 04:29:56', NULL, 1),
('2a10cc10-4780-11e8-972d-83830e1a0abc', '2a1056e0-4780-11e8-972d-83830e1a0abc', 'user_name2a1056e0-4780-11e8-972d-83830e1a0abc', NULL, 1940327989351835, 0, 'https://lookaside.facebook.com/platform/profilepic/?asid=1940327989351835&height=50&width=50&ext=1524806842&hash=AeS9oi5m9Jw2m58H', '2a1056e0-4780-11e8-972d-83830e1a0abc', NULL, '2018-04-24 05:27:22', NULL, 1),
('9a3e3b00-42ba-11e8-955c-117bd1b1f0c3', '9a3d9ec0-42ba-11e8-955c-117bd1b1f0c3', 'user_name9a3d9ec0-42ba-11e8-955c-117bd1b1f0c3', NULL, 0, 0, NULL, '9a3d9ec0-42ba-11e8-955c-117bd1b1f0c3', NULL, '2018-04-18 03:43:05', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `product_id`, `quantity`, `created_date`, `created_by`, `updated_date`, `updated_by`, `status`) VALUES
('5c28de70-784c-11e8-88db-47ea84a32191', '791b5b80-75d5-11e8-b76b-6b9bc351a5d4', 30, '2018-06-25 14:49:59', 'admin', '2018-06-25 16:23:14', 'admin', 1),
('5d882050-784c-11e8-88db-47ea84a32191', 'fbfa1c80-75d0-11e8-abd4-9d8b126d9608', 100, '2018-06-25 14:50:01', 'admin', '2018-06-25 16:23:14', 'admin', 1),
('94112ce0-78fe-11e8-9434-917b8ac70155', '941090a0-78fe-11e8-9434-917b8ac70155', 100, '2018-06-26 12:05:43', 'admin', '2018-06-26 13:56:13', 'admin', 1),
('f14ac120-78fc-11e8-979e-ed22ac8b325d', 'f14a24e0-78fc-11e8-979e-ed22ac8b325d', 100, '2018-06-26 11:54:01', 'admin', '2018-06-26 13:56:10', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehousehistory`
--

CREATE TABLE `warehousehistory` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `warehouse_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1: Nhập tay backend, 3: hệ thống xử lý đơn hàng tự động',
  `created_by` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `warehousehistory`
--

INSERT INTO `warehousehistory` (`id`, `warehouse_id`, `product_id`, `quantity`, `type`, `created_by`, `created_date`, `updated_by`, `updated_date`, `status`) VALUES
('01ddb450-790e-11e8-aaf5-d959fb4e5c13', 'f14ac120-78fc-11e8-979e-ed22ac8b325d', 'f14a24e0-78fc-11e8-979e-ed22ac8b325d', '100', 1, 'admin', '2018-06-26 13:56:10', NULL, NULL, 1),
('0410e800-790e-11e8-aaf5-d959fb4e5c13', '94112ce0-78fe-11e8-9434-917b8ac70155', '941090a0-78fe-11e8-9434-917b8ac70155', '100', 1, 'admin', '2018-06-26 13:56:13', NULL, NULL, 1),
('62edbc50-7859-11e8-9a80-51c32a5e0d9b', '5c28de70-784c-11e8-88db-47ea84a32191', '791b5b80-75d5-11e8-b76b-6b9bc351a5d4', '-10', 3, 'admin', '2018-06-25 16:23:14', NULL, NULL, 1),
('62ee0a70-7859-11e8-9a80-51c32a5e0d9b', '5d882050-784c-11e8-88db-47ea84a32191', 'fbfa1c80-75d0-11e8-abd4-9d8b126d9608', '-20', 3, 'admin', '2018-06-25 16:23:14', NULL, NULL, 1),
('94117b00-78fe-11e8-9434-917b8ac70155', '94112ce0-78fe-11e8-9434-917b8ac70155', '941090a0-78fe-11e8-9434-917b8ac70155', '0', 3, 'admin', '2018-06-26 12:05:43', NULL, NULL, 1),
('f14b3650-78fc-11e8-979e-ed22ac8b325d', 'f14ac120-78fc-11e8-979e-ed22ac8b325d', 'f14a24e0-78fc-11e8-979e-ed22ac8b325d', '0', 3, 'admin', '2018-06-26 11:54:01', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bestsellproduct`
--
ALTER TABLE `bestsellproduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `lookupdata`
--
ALTER TABLE `lookupdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `omwebsessions`
--
ALTER TABLE `omwebsessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personaddress`
--
ALTER TABLE `personaddress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personpoints`
--
ALTER TABLE `personpoints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productlinkcontent`
--
ALTER TABLE `productlinkcontent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productwishlist`
--
ALTER TABLE `productwishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotiondetail`
--
ALTER TABLE `promotiondetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `purchaseorderdetail`
--
ALTER TABLE `purchaseorderdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchaseorderdetailgift`
--
ALTER TABLE `purchaseorderdetailgift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchaseorderhistory`
--
ALTER TABLE `purchaseorderhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rolepermission`
--
ALTER TABLE `rolepermission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systemlogs`
--
ALTER TABLE `systemlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersocial`
--
ALTER TABLE `usersocial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehousehistory`
--
ALTER TABLE `warehousehistory`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  MODIFY `code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
