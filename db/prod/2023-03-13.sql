-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 13, 2023 at 10:25 PM
-- Server version: 10.3.37-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.3.33-8+ubuntu20.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eega`
--
CREATE DATABASE IF NOT EXISTS `eega` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `eega`;

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `agenda_id` int(11) NOT NULL,
  `agenda_user_id` int(11) NOT NULL,
  `agenda_controller_name` char(255) NOT NULL,
  `agenda_action_name` char(255) NOT NULL,
  `agenda_action_param` char(255) NOT NULL,
  `agenda_run_at` int(11) NOT NULL DEFAULT 0,
  `agenda_last_run_at` int(11) NOT NULL DEFAULT 0,
  `agenda_last_run_status` char(20) NOT NULL DEFAULT '',
  `agenda_last_run_note` char(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announce`
--

CREATE TABLE `announce` (
  `announce_id` int(11) NOT NULL,
  `announce_title` char(100) DEFAULT NULL,
  `announce_content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announce`
--

INSERT INTO `announce` (`announce_id`, `announce_title`, `announce_content`) VALUES
(1, '通知', '<p><span style=\"color: rgb(255, 0, 0);\"><strong>2023年鹰会月赛和周活动安排，已在网站公布！</strong></span><span style=\"background-color: rgb(255, 255, 255);\"></span></p><p><span style=\"color: rgb(255, 0, 0);\"><strong><br/></strong></span></p><p><span style=\"color:#c00000\"><span style=\"color: rgb(0, 0, 0);\">请鹰友把22年9月年赛照片发到鹰会邮箱：eega2022@hotmail.com</span></span></p>'),
(2, '喜报', '<p><strong><span style=\"color: rgb(255, 0, 0);\">东方之鹰网站开通上线啦！</span></strong></p>'),
(3, '资讯', '<table><tbody><tr class=\"firstRow\"><td width=\"932\" valign=\"top\" style=\"word-break: break-all;\"><br/></td></tr><tr><td width=\"932\" valign=\"top\" style=\"word-break: break-all;\"><p><span style=\"font-size: 18px;\"><strong>本届团队 （2023-2025年）</strong></span></p><p><span style=\"font-size: 18px;\">会长：郭涛&nbsp; &nbsp; 副会长：Harry 刘国强</span></p><p><span style=\"font-size: 18px;\">理事：傅罡，吕友军，Jeffery Chi, 王德举，戴悦，于学琛，刘国强，郭涛</span></p></td></tr><tr><td width=\"932\" valign=\"top\" style=\"word-break: break-all;\"><br/></td></tr><tr><td width=\"932\" valign=\"top\" style=\"word-break: break-all;\"><br/></td></tr><tr><td width=\"932\" valign=\"top\"><br/></td></tr><tr><td width=\"932\" valign=\"top\"><br/></td></tr><tr><td width=\"932\" valign=\"top\"><br/></td></tr></tbody></table><p><br/></p>');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `event_title` char(255) NOT NULL,
  `event_description` text NOT NULL,
  `event_date` date NOT NULL,
  `event_type` enum('month','week') NOT NULL DEFAULT 'week',
  `event_location_id` int(11) NOT NULL,
  `event_max_participant` int(11) NOT NULL,
  `event_review_content` text DEFAULT NULL,
  `event_review_title` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_title`, `event_description`, `event_date`, `event_type`, `event_location_id`, `event_max_participant`, `event_review_content`, `event_review_title`) VALUES
(8, '2022年8月赛 - 属虎60生日宴', '', '2022-08-30', 'month', 29, 70, '<p><img src=\"/upload/article/202303141678738373890203.jpg\" title=\"202303141678738373890203.jpg\"/></p><p><img src=\"/upload/article/202303141678738373891024.jpg\" title=\"202303141678738373891024.jpg\"/></p><p><img src=\"/upload/article/202303141678738373639773.jpg\" title=\"202303141678738373639773.jpg\"/></p><p><img src=\"/upload/article/202303141678738373835979.jpg\" title=\"202303141678738373835979.jpg\"/></p><p><img src=\"/upload/article/202303141678738373380974.jpg\" title=\"202303141678738373380974.jpg\"/></p><p><img src=\"/upload/article/202303141678738374265631.jpg\" title=\"202303141678738374265631.jpg\"/></p><p><img src=\"/upload/article/202303141678738374396738.jpg\" title=\"202303141678738374396738.jpg\"/></p><p><img src=\"/upload/article/202303141678738374947423.jpg\" title=\"202303141678738374947423.jpg\"/></p><p><br/></p>', NULL),
(10, '2022年9月 周活动', '', '2022-09-05', 'week', 58, 72, NULL, NULL),
(11, '2022年 鹰会年赛', '', '2022-08-30', 'month', 70, 72, '<p><img src=\"/upload/article/202303141678739020188210.jpg\" title=\"202303141678739020188210.jpg\"/></p><p><img src=\"/upload/article/202303141678739020485488.jpg\" title=\"202303141678739020485488.jpg\"/></p><p><br/></p>', NULL),
(12, '5月2日非CL 郭涛友军订场', '周活动，郭涛友军找球场', '2023-05-02', 'week', 58, 20, NULL, NULL),
(13, '5月9日非CL 郭涛友军订场', '郭涛友军订场', '2023-05-09', 'week', 65, 20, NULL, NULL),
(14, '5月16日CL场 请David 戴订场', 'David 戴订场', '2023-05-16', 'week', 60, 24, NULL, NULL),
(15, '5月23日非CL 郭涛友军订场', '郭涛友军订场', '2023-05-23', 'week', 9, 24, NULL, NULL),
(16, '5月赛庞海福会长杯 Joseph订场', '庞海福负责订场并组织月赛', '2023-05-30', 'month', 29, 32, NULL, NULL),
(17, '6月6日非CL 套票Balantrae 郭涛买票', '郭涛买套票', '2023-06-06', 'week', 2, 24, NULL, NULL),
(18, '6月13日CL场 请Jim王订场', '请Jim Wang订场', '2023-06-13', 'week', 14, 28, NULL, NULL),
(19, '6月20日非CL 用Bond Head套票（已买）', '用Bond Head套票（已买）', '2023-06-20', 'week', 64, 24, NULL, NULL),
(20, '6月赛井卫星会长杯 老井订场', '老井负责组织比赛并订场', '2023-06-27', 'month', 28, 36, NULL, NULL),
(21, '7月4日非CL 郭涛友军订场', '郭涛友军订场', '2023-07-04', 'week', 65, 24, NULL, NULL),
(22, '7月11日CL场 请Jim王订场', '请Jim王订场', '2023-07-11', 'week', 16, 28, NULL, NULL),
(23, '7月18日非CL 用Bond Head套票（已买）', '使用Bond Head套票', '2023-07-18', 'week', 64, 28, NULL, NULL),
(24, '7月赛覃培因会长杯 请David戴订场', '培因和郭涛共同组织', '2023-07-25', 'month', 60, 40, NULL, NULL),
(25, '8月1日非CL 套票Balantrae 郭涛买票', '郭涛买套票', '2023-08-01', 'week', 2, 28, NULL, NULL),
(26, '8月8日CL场 请David 戴订场', '请Jim王订场', '2023-08-08', 'week', 14, 28, NULL, NULL),
(27, '8月15日非CL 郭涛友军订场', '联系红鸟球场特价', '2023-08-15', 'week', 45, 24, NULL, NULL),
(28, '8月22日CL场 请Jim王订场', '请David 戴订场', '2023-08-22', 'week', 73, 32, NULL, NULL),
(29, '8月赛吕友军会长杯 友军订场', '友军负责组织比赛并订场', '2023-08-29', 'month', 30, 40, NULL, NULL),
(30, '9月5日华人队际赛 傅教头领队参赛 共17名选手参赛 其他自由活动', '非比赛人员另外找场地活动，如3组Balantrae', '2023-09-05', 'week', 60, 17, NULL, NULL),
(31, '9月12日CL场 请David 戴订场', '请David 戴订场', '2023-09-12', 'week', 8, 28, NULL, NULL),
(32, '9月19日非CL 郭涛友军订场', '郭涛友军订场', '2023-09-19', 'week', 53, 24, NULL, NULL),
(33, '9月鹰会年赛 David梁/柴钢双会长杯 请老梁/柴刚订场', '老梁/柴刚负责组织比赛并订场', '2023-09-26', 'month', 70, 60, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `file_id` int(11) UNSIGNED NOT NULL,
  `file_type` char(10) NOT NULL DEFAULT 'img',
  `file_url` char(155) NOT NULL,
  `file_original_url` char(155) NOT NULL DEFAULT '',
  `file_height` int(5) UNSIGNED NOT NULL DEFAULT 0,
  `file_width` int(5) UNSIGNED NOT NULL DEFAULT 0,
  `file_section_name` char(30) NOT NULL,
  `file_section_id` int(11) UNSIGNED NOT NULL,
  `file_post_time` datetime NOT NULL DEFAULT current_timestamp(),
  `file_status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `participant_id` int(11) NOT NULL,
  `participant_event_id` int(11) NOT NULL,
  `participant_user_id` int(11) NOT NULL,
  `participant_index` smallint(6) NOT NULL,
  `participant_score` mediumint(9) DEFAULT NULL,
  `participant_net_score` mediumint(9) DEFAULT NULL,
  `participant_handicap_differential` decimal(7,1) DEFAULT NULL,
  `participant_handicap_index` decimal(7,1) DEFAULT NULL,
  `participant_t` enum('red','green','white','blue','black','') DEFAULT NULL,
  `participant_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`participant_id`, `participant_event_id`, `participant_user_id`, `participant_index`, `participant_score`, `participant_net_score`, `participant_handicap_differential`, `participant_handicap_index`, `participant_t`, `participant_date`) VALUES
(16, 8, 22, 0, 90, NULL, '16.5', NULL, 'white', '2022-08-30'),
(17, 8, 23, 1, 93, NULL, '16.7', NULL, 'blue', '2022-08-30'),
(18, 8, 21, 2, 80, NULL, '6.2', NULL, 'blue', '2022-08-30'),
(19, 8, 24, 3, 97, NULL, '22.4', NULL, 'white', '2022-08-30'),
(20, 8, 25, 4, 80, NULL, '6.2', NULL, 'blue', '2022-08-30'),
(21, 8, 27, 5, 84, NULL, '9.4', NULL, 'blue', '2022-08-30'),
(22, 8, 26, 6, 81, NULL, '7.0', NULL, 'blue', '2022-08-30'),
(23, 8, 28, 7, 81, NULL, '7.0', NULL, 'blue', '2022-08-30'),
(24, 8, 29, 8, 98, NULL, '23.3', NULL, 'white', '2022-08-30'),
(25, 8, 30, 9, 84, NULL, '9.4', NULL, 'blue', '2022-08-30'),
(26, 8, 32, 10, 102, NULL, '26.7', NULL, 'white', '2022-08-30'),
(27, 8, 31, 11, 97, NULL, '22.4', NULL, 'white', '2022-08-30'),
(28, 8, 34, 12, 91, NULL, '17.3', NULL, 'white', '2022-08-30'),
(29, 8, 33, 13, 100, NULL, '25.0', NULL, 'white', '2022-08-30'),
(30, 8, 36, 14, 95, NULL, '20.7', NULL, 'white', '2022-08-30'),
(31, 8, 35, 15, 99, NULL, '21.6', NULL, 'blue', '2022-08-30'),
(32, 8, 37, 16, 89, NULL, '13.5', NULL, 'blue', '2022-08-30'),
(33, 8, 38, 17, 80, NULL, '6.2', NULL, 'blue', '2022-08-30'),
(34, 8, 39, 18, 82, NULL, '7.8', NULL, 'blue', '2022-08-30'),
(35, 8, 40, 19, 85, NULL, '10.2', NULL, 'blue', '2022-08-30'),
(36, 8, 41, 20, 87, NULL, '11.9', NULL, 'blue', '2022-08-30'),
(37, 8, 42, 21, 87, NULL, '11.9', NULL, 'blue', '2022-08-30'),
(38, 8, 43, 22, 87, NULL, '11.9', NULL, 'blue', '2022-08-30'),
(39, 8, 45, 23, 88, NULL, '12.7', NULL, 'blue', '2022-08-30'),
(40, 8, 46, 24, 91, NULL, '15.1', NULL, 'blue', '2022-08-30'),
(41, 8, 47, 25, 98, NULL, '23.3', NULL, 'white', '2022-08-30'),
(42, 8, 48, 26, 84, NULL, '9.4', NULL, 'blue', '2022-08-30'),
(43, 8, 49, 27, 93, NULL, '16.7', NULL, 'blue', '2022-08-30'),
(44, 8, 50, 28, 89, NULL, '15.6', NULL, 'white', '2022-08-30'),
(45, 8, 51, 29, 79, NULL, '3.9', NULL, 'black', '2022-08-30'),
(46, 8, 52, 30, 92, NULL, '15.9', NULL, 'blue', '2022-08-30'),
(47, 8, 53, 31, 96, NULL, '19.2', NULL, 'blue', '2022-08-30'),
(48, 8, 54, 32, 92, NULL, '15.9', NULL, 'blue', '2022-08-30'),
(49, 8, 55, 33, 100, NULL, '25.0', NULL, 'white', '2022-08-30'),
(50, 8, 56, 34, 101, NULL, '25.8', NULL, 'white', '2022-08-30'),
(51, 8, 57, 35, 98, NULL, '23.3', NULL, 'white', '2022-08-30'),
(52, 8, 58, 36, 96, NULL, '19.2', NULL, 'blue', '2022-08-30'),
(53, 8, 59, 37, 89, NULL, '13.5', NULL, 'blue', '2022-08-30'),
(54, 8, 60, 38, 83, NULL, '8.6', NULL, 'blue', '2022-08-30'),
(55, 8, 61, 39, 98, NULL, '20.8', NULL, 'blue', '2022-08-30'),
(56, 8, 62, 40, 98, NULL, '20.8', NULL, 'blue', '2022-08-30'),
(57, 8, 63, 41, 90, NULL, '14.3', NULL, 'blue', '2022-08-30'),
(58, 8, 64, 42, 86, NULL, '11.1', NULL, 'blue', '2022-08-30'),
(59, 8, 65, 43, 85, NULL, '10.2', NULL, 'blue', '2022-08-30'),
(60, 8, 66, 44, 87, NULL, '11.9', NULL, 'blue', '2022-08-30'),
(61, 8, 67, 45, 82, NULL, '7.8', NULL, 'blue', '2022-08-30'),
(62, 8, 68, 46, 81, NULL, '5.5', NULL, 'black', '2022-08-30'),
(63, 8, 69, 47, 93, NULL, '16.7', NULL, 'blue', '2022-08-30'),
(64, 8, 70, 48, 99, NULL, '24.1', NULL, 'white', '2022-08-30'),
(65, 8, 71, 49, 90, NULL, '14.3', NULL, 'blue', '2022-08-30'),
(66, 8, 72, 50, 80, NULL, '6.2', NULL, 'blue', '2022-08-30'),
(67, 8, 73, 51, 88, NULL, '12.7', NULL, 'blue', '2022-08-30'),
(68, 8, 74, 52, 94, NULL, '17.6', NULL, 'blue', '2022-08-30'),
(69, 8, 75, 53, 76, NULL, '1.6', NULL, 'black', '2022-08-30'),
(70, 8, 76, 54, 96, NULL, '21.6', NULL, 'white', '2022-08-30'),
(71, 8, 77, 55, 88, NULL, '12.7', NULL, 'blue', '2022-08-30'),
(72, 8, 78, 56, 90, NULL, '14.3', NULL, 'blue', '2022-08-30'),
(73, 8, 79, 57, 91, NULL, '15.1', NULL, 'blue', '2022-08-30'),
(74, 8, 80, 58, 104, NULL, '25.7', NULL, 'blue', '2022-08-30'),
(75, 8, 81, 59, 84, NULL, '9.4', NULL, 'blue', '2022-08-30'),
(76, 8, 82, 60, 100, NULL, '25.0', NULL, 'white', '2022-08-30'),
(77, 8, 83, 61, 98, NULL, '23.3', NULL, 'white', '2022-08-30'),
(78, 8, 84, 62, 95, NULL, '18.4', NULL, 'blue', '2022-08-30'),
(79, 8, 85, 63, 96, NULL, '19.2', NULL, 'blue', '2022-08-30'),
(80, 8, 88, 64, 93, NULL, '16.7', NULL, 'blue', '2022-08-30'),
(82, 8, 87, 66, 98, NULL, '20.8', NULL, 'blue', '2022-08-30'),
(83, 11, 63, 0, 86, NULL, '12.2', NULL, 'blue', '2022-09-27'),
(84, 11, 61, 1, 98, NULL, '22.4', NULL, 'blue', '2022-09-27'),
(85, 11, 57, 2, 96, NULL, '22.9', NULL, 'white', '2022-09-27'),
(86, 11, 79, 3, 90, NULL, '15.6', NULL, 'blue', '2022-09-27'),
(87, 11, 77, 4, 86, NULL, '12.2', NULL, 'blue', '2022-09-27'),
(88, 11, 47, 5, 106, NULL, '31.7', NULL, 'white', '2022-09-27'),
(89, 11, 43, 6, 85, NULL, '11.3', NULL, 'blue', '2022-09-27'),
(90, 11, 82, 7, 95, NULL, '22.0', NULL, 'white', '2022-09-27'),
(92, 11, 84, 9, 87, NULL, '13.0', NULL, 'blue', '2022-09-27'),
(93, 11, 80, 10, 96, NULL, '20.7', NULL, 'blue', '2022-09-27'),
(94, 11, 72, 11, 85, NULL, '9.7', NULL, 'black', '2022-09-27'),
(95, 11, 88, 12, 91, NULL, '16.4', NULL, 'blue', '2022-09-27'),
(96, 11, 56, 13, 100, NULL, '26.4', NULL, 'white', '2022-09-27'),
(97, 11, 53, 14, 101, NULL, '25.0', NULL, 'blue', '2022-09-27'),
(98, 11, 55, 15, 102, NULL, '28.2', NULL, 'white', '2022-09-27'),
(99, 11, 74, 16, 93, NULL, '18.1', NULL, 'blue', '2022-09-27'),
(100, 11, 29, 17, 92, NULL, '19.3', NULL, 'white', '2022-09-27'),
(101, 11, 67, 18, 82, NULL, '8.7', NULL, 'blue', '2022-09-27'),
(102, 11, 28, 19, 79, NULL, '6.2', NULL, 'blue', '2022-09-27'),
(103, 11, 37, 20, 86, NULL, '12.2', NULL, 'blue', '2022-09-27'),
(104, 11, 75, 21, 73, NULL, '-0.2', NULL, 'black', '2022-09-27'),
(105, 11, 69, 22, 90, NULL, '15.6', NULL, 'blue', '2022-09-27'),
(106, 11, 60, 23, 81, NULL, '7.9', NULL, 'blue', '2022-09-27'),
(107, 11, 83, 24, 103, NULL, '29.0', NULL, 'white', '2022-09-27'),
(108, 11, 81, 25, 83, NULL, '9.6', NULL, 'blue', '2022-09-27'),
(109, 11, 78, 26, 89, NULL, '14.7', NULL, 'blue', '2022-09-27'),
(110, 11, 76, 27, 105, NULL, '30.8', NULL, 'white', '2022-09-27'),
(111, 11, 71, 28, 90, NULL, '15.6', NULL, 'blue', '2022-09-27'),
(112, 11, 51, 29, 78, NULL, '3.9', NULL, 'black', '2022-09-27'),
(113, 11, 68, 30, 81, NULL, '6.4', NULL, 'black', '2022-09-27'),
(114, 11, 50, 31, 95, NULL, '22.0', NULL, 'white', '2022-09-27'),
(115, 11, 35, 32, 88, NULL, '15.8', NULL, 'white', '2022-09-27'),
(116, 11, 38, 33, 86, NULL, '12.2', NULL, 'blue', '2022-09-27'),
(117, 11, 87, 34, 95, NULL, '22.0', NULL, 'white', '2022-09-27'),
(118, 11, 85, 35, 95, NULL, '19.9', NULL, 'blue', '2022-09-27'),
(119, 11, 36, 36, 91, NULL, '18.5', NULL, 'white', '2022-09-27'),
(120, 11, 21, 37, 81, NULL, '7.9', NULL, 'blue', '2022-09-27'),
(121, 11, 66, 38, 89, NULL, '14.7', NULL, 'blue', '2022-09-27'),
(122, 11, 58, 39, 92, NULL, '17.3', NULL, 'blue', '2022-09-27'),
(123, 11, 40, 40, 86, NULL, '12.2', NULL, 'blue', '2022-09-27'),
(124, 11, 73, 41, 89, NULL, '14.7', NULL, 'blue', '2022-09-27'),
(125, 11, 65, 42, 82, NULL, '8.7', NULL, 'blue', '2022-09-27'),
(126, 11, 64, 43, 86, NULL, '12.2', NULL, 'blue', '2022-09-27'),
(127, 11, 32, 44, 107, NULL, '32.6', NULL, 'white', '2022-09-27'),
(128, 11, 22, 45, 87, NULL, '14.9', NULL, 'white', '2022-09-27'),
(129, 11, 54, 46, 94, NULL, '19.0', NULL, 'blue', '2022-09-27'),
(130, 11, 46, 47, 91, NULL, '16.4', NULL, 'blue', '2022-09-27'),
(131, 11, 45, 48, 84, NULL, '10.4', NULL, 'blue', '2022-09-27'),
(132, 11, 26, 49, 80, NULL, '7.0', NULL, 'blue', '2022-09-27'),
(133, 11, 25, 50, 78, NULL, '5.3', NULL, 'blue', '2022-09-27'),
(134, 11, 30, 51, 79, NULL, '6.2', NULL, 'blue', '2022-09-27'),
(135, 8, 92, 67, 80, NULL, '4.7', NULL, 'black', '2022-08-30'),
(136, 11, 92, 52, 78, NULL, '3.9', NULL, 'black', '2022-09-27'),
(137, 11, 49, 53, 87, NULL, '13.0', NULL, 'blue', '2022-09-27'),
(138, 11, 62, 54, 98, NULL, '22.4', NULL, 'blue', '2022-09-27'),
(139, 11, 33, 55, 97, NULL, '23.7', NULL, 'white', '2022-09-27'),
(140, 11, 24, 56, 106, NULL, '31.7', NULL, 'white', '2022-09-27'),
(141, 11, 27, 57, 84, NULL, '10.4', NULL, 'blue', '2022-09-27'),
(142, 11, 34, 58, 100, NULL, '26.4', NULL, 'white', '2022-09-27'),
(143, 11, 39, 59, 83, NULL, '9.6', NULL, 'blue', '2022-09-27'),
(144, 11, 41, 60, 88, NULL, '13.9', NULL, 'blue', '2022-09-27'),
(145, 11, 42, 61, 87, NULL, '13.0', NULL, 'blue', '2022-09-27'),
(146, 11, 48, 62, 88, NULL, '13.9', NULL, 'blue', '2022-09-27'),
(147, 11, 59, 63, 88, NULL, '13.9', NULL, 'blue', '2022-09-27'),
(148, 11, 70, 64, 105, NULL, '30.8', NULL, 'white', '2022-09-27'),
(149, 11, 23, 65, 87, NULL, '14.9', NULL, 'white', '2022-09-27'),
(150, 11, 31, 66, 90, NULL, '17.6', NULL, 'white', '2022-09-27'),
(151, 11, 52, 67, 90, NULL, '15.6', NULL, 'blue', '2022-09-27'),
(152, 10, 22, 0, 87, NULL, '14.5', NULL, 'white', '2022-09-05'),
(153, 10, 23, 1, 84, NULL, '9.9', NULL, 'blue', '2022-09-05'),
(154, 10, 21, 2, 84, NULL, '9.9', NULL, 'blue', '2022-09-05'),
(155, 10, 24, 3, 98, NULL, '24.2', NULL, 'white', '2022-09-05'),
(156, 10, 25, 4, 80, NULL, '6.5', NULL, 'blue', '2022-09-05'),
(157, 10, 26, 5, 81, NULL, '7.3', NULL, 'blue', '2022-09-05'),
(158, 10, 27, 6, 83, NULL, '9.1', NULL, 'blue', '2022-09-05'),
(159, 10, 28, 7, 82, NULL, '8.2', NULL, 'blue', '2022-09-05'),
(160, 10, 29, 8, 98, NULL, '24.2', NULL, 'white', '2022-09-05'),
(161, 10, 30, 9, 82, NULL, '8.2', NULL, 'blue', '2022-09-05'),
(162, 10, 31, 10, 93, NULL, '19.8', NULL, 'white', '2022-09-05'),
(163, 10, 32, 11, 96, NULL, '22.4', NULL, 'white', '2022-09-05'),
(164, 10, 34, 12, 90, NULL, '17.1', NULL, 'white', '2022-09-05'),
(165, 10, 33, 13, 93, NULL, '19.8', NULL, 'white', '2022-09-05'),
(166, 10, 35, 14, 90, NULL, '17.1', NULL, 'white', '2022-09-05'),
(167, 10, 36, 15, 90, NULL, '17.1', NULL, 'white', '2022-09-05'),
(168, 10, 37, 16, 89, NULL, '14.2', NULL, 'blue', '2022-09-05'),
(169, 10, 38, 17, 84, NULL, '9.9', NULL, 'blue', '2022-09-05'),
(170, 10, 39, 18, 83, NULL, '9.1', NULL, 'blue', '2022-09-05'),
(171, 10, 40, 19, 86, NULL, '11.6', NULL, 'blue', '2022-09-05'),
(172, 10, 41, 20, 90, NULL, '15.1', NULL, 'blue', '2022-09-05'),
(173, 10, 42, 21, 88, NULL, '13.4', NULL, 'blue', '2022-09-05'),
(174, 10, 43, 22, 85, NULL, '10.8', NULL, 'blue', '2022-09-05'),
(175, 10, 45, 23, 88, NULL, '13.4', NULL, 'blue', '2022-09-05'),
(176, 10, 46, 24, 90, NULL, '15.1', NULL, 'blue', '2022-09-05'),
(177, 10, 47, 25, 98, NULL, '24.2', NULL, 'white', '2022-09-05'),
(178, 10, 48, 26, 87, NULL, '12.5', NULL, 'blue', '2022-09-05'),
(179, 10, 49, 27, 92, NULL, '16.8', NULL, 'blue', '2022-09-05'),
(180, 10, 50, 28, 93, NULL, '19.8', NULL, 'white', '2022-09-05'),
(181, 10, 52, 29, 93, NULL, '17.7', NULL, 'blue', '2022-09-05'),
(182, 10, 53, 30, 96, NULL, '20.3', NULL, 'blue', '2022-09-05'),
(183, 10, 54, 31, 95, NULL, '19.4', NULL, 'blue', '2022-09-05'),
(184, 10, 56, 32, 98, NULL, '24.2', NULL, 'white', '2022-09-05'),
(185, 10, 55, 33, 99, NULL, '25.1', NULL, 'white', '2022-09-05'),
(186, 10, 58, 34, 93, NULL, '17.7', NULL, 'blue', '2022-09-05'),
(187, 10, 59, 35, 90, NULL, '15.1', NULL, 'blue', '2022-09-05'),
(188, 10, 51, 36, 78, NULL, '3.2', NULL, 'black', '2022-09-05'),
(189, 10, 60, 37, 82, NULL, '8.2', NULL, 'blue', '2022-09-05'),
(190, 10, 63, 38, 82, NULL, '8.2', NULL, 'blue', '2022-09-05'),
(191, 10, 67, 39, 82, NULL, '8.2', NULL, 'blue', '2022-09-05'),
(192, 10, 61, 40, 95, NULL, '19.4', NULL, 'blue', '2022-09-05'),
(193, 10, 62, 41, 93, NULL, '17.7', NULL, 'blue', '2022-09-05'),
(194, 10, 64, 42, 85, NULL, '10.8', NULL, 'blue', '2022-09-05'),
(195, 10, 65, 43, 85, NULL, '10.8', NULL, 'blue', '2022-09-05'),
(196, 10, 66, 44, 87, NULL, '12.5', NULL, 'blue', '2022-09-05'),
(197, 10, 68, 45, 80, NULL, '4.9', NULL, 'black', '2022-09-05'),
(198, 10, 69, 46, 90, NULL, '15.1', NULL, 'blue', '2022-09-05'),
(200, 10, 72, 47, 80, NULL, '6.5', NULL, 'blue', '2022-09-05'),
(201, 10, 70, 48, 102, NULL, '25.4', NULL, 'blue', '2022-09-05'),
(202, 10, 71, 49, 89, NULL, '14.2', NULL, 'blue', '2022-09-05'),
(203, 10, 73, 50, 88, NULL, '13.4', NULL, 'blue', '2022-09-05'),
(204, 10, 74, 51, 94, NULL, '18.5', NULL, 'blue', '2022-09-05'),
(205, 10, 75, 52, 76, NULL, '1.5', NULL, 'black', '2022-09-05'),
(206, 10, 77, 53, 86, NULL, '11.6', NULL, 'blue', '2022-09-05'),
(207, 10, 78, 54, 89, NULL, '14.2', NULL, 'blue', '2022-09-05'),
(209, 10, 76, 56, 99, NULL, '25.1', NULL, 'white', '2022-09-05'),
(210, 10, 80, 57, 95, NULL, '19.4', NULL, 'blue', '2022-09-05'),
(211, 10, 79, 58, 92, NULL, '16.8', NULL, 'blue', '2022-09-05'),
(212, 10, 92, 55, 78, NULL, '4.7', NULL, 'blue', '2022-09-05'),
(213, 10, 82, 59, 96, NULL, '22.4', NULL, 'white', '2022-09-05'),
(214, 10, 83, 60, 106, NULL, '28.9', NULL, 'blue', '2022-09-05'),
(215, 10, 85, 61, 98, NULL, '22.0', NULL, 'blue', '2022-09-05'),
(217, 10, 87, 63, 99, NULL, '22.9', NULL, 'blue', '2022-09-05'),
(218, 10, 81, 64, 81, NULL, '7.3', NULL, 'blue', '2022-09-05'),
(219, 10, 84, 65, 93, NULL, '17.7', NULL, 'blue', '2022-09-05'),
(220, 10, 88, 66, 90, NULL, '15.1', NULL, 'blue', '2022-09-05'),
(221, 10, 57, 67, 97, NULL, '23.3', NULL, 'white', '2022-09-05'),
(222, 10, 93, 68, 89, NULL, '14.2', NULL, 'blue', '2022-09-05'),
(223, 11, 93, 68, 88, NULL, '13.9', NULL, 'blue', '2022-09-27'),
(224, 8, 93, 68, 89, NULL, '13.5', NULL, 'blue', '2022-08-30'),
(225, 11, 94, 8, 110, NULL, '35.2', NULL, 'white', '2022-09-27'),
(226, 10, 94, 62, 106, NULL, '31.3', NULL, 'white', '2022-09-05'),
(227, 8, 94, 65, 108, NULL, '31.8', NULL, 'white', '2022-08-30'),
(228, 11, 98, 69, 83, NULL, '9.6', NULL, 'blue', '2022-09-27'),
(229, 10, 98, 69, 93, NULL, '17.7', NULL, 'blue', '2022-09-05'),
(230, 8, 98, 69, 98, NULL, '20.8', NULL, 'blue', '2022-08-30');

-- --------------------------------------------------------

--
-- Table structure for table `participant_history`
--

CREATE TABLE `participant_history` (
  `participant_history_id` int(11) NOT NULL,
  `participant_history_calculate_for_participant_id` int(11) NOT NULL,
  `participant_history_user_id` int(11) NOT NULL,
  `participant_history_participant_id` int(11) NOT NULL,
  `participant_history_is_used_for_calculate` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participant_history`
--

INSERT INTO `participant_history` (`participant_history_id`, `participant_history_calculate_for_participant_id`, `participant_history_user_id`, `participant_history_participant_id`, `participant_history_is_used_for_calculate`) VALUES
(1, 9, 19, 5, 1),
(2, 9, 19, 3, 1),
(3, 9, 19, 1, 0),
(4, 9, 19, 8, 0),
(59, 11, 19, 5, 1),
(60, 11, 19, 3, 1),
(61, 11, 19, 1, 0),
(62, 11, 19, 9, 0),
(63, 11, 19, 8, 0),
(81, 10, 1, 4, 1),
(82, 10, 1, 2, 1),
(83, 10, 1, 6, 0),
(84, 10, 1, 7, 0),
(100, 12, 1, 4, 1),
(101, 12, 1, 10, 1),
(102, 12, 1, 2, 0),
(103, 12, 1, 6, 0),
(104, 12, 1, 7, 0),
(105, 13, 19, 5, 1),
(106, 13, 19, 3, 1),
(107, 13, 19, 11, 1),
(108, 13, 19, 1, 0),
(109, 13, 19, 9, 0),
(110, 13, 19, 8, 0),
(111, 14, 1, 4, 1),
(112, 14, 1, 10, 1),
(113, 14, 1, 2, 1),
(114, 14, 1, 6, 0),
(115, 14, 1, 7, 0),
(116, 14, 1, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE `rank` (
  `rank_user_id` int(11) NOT NULL,
  `rank_history_count` smallint(6) NOT NULL,
  `rank_handicap_index` decimal(7,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rank_history`
--

CREATE TABLE `rank_history` (
  `rank_history_id` int(11) NOT NULL,
  `rank_history_user_id` int(11) NOT NULL,
  `rank_history_participant_id` int(11) NOT NULL,
  `rank_history_is_used_for_calculate` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rank_history`
--

INSERT INTO `rank_history` (`rank_history_id`, `rank_history_user_id`, `rank_history_participant_id`, `rank_history_is_used_for_calculate`) VALUES
(185, 19, 5, 1),
(186, 19, 3, 1),
(187, 19, 11, 1),
(188, 19, 1, 0),
(189, 19, 13, 0),
(190, 19, 9, 0),
(191, 19, 8, 0),
(192, 1, 4, 1),
(193, 1, 14, 1),
(194, 1, 10, 1),
(195, 1, 2, 0),
(196, 1, 6, 0),
(197, 1, 7, 0),
(198, 1, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `sponsor_id` int(11) NOT NULL,
  `sponsor_content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`sponsor_id`, `sponsor_content`) VALUES
(1, '<table><tbody><tr class=\"ue-table-interlace-color-single firstRow\"><td width=\"218\" valign=\"bottom\" style=\"word-break: break-all;\" align=\"left\"><strong>赞助活动</strong></td><td width=\"350\" valign=\"bottom\" style=\"word-break: break-all;\" align=\"left\"><strong>赞助内容</strong></td><td valign=\"bottom\" colspan=\"1\" rowspan=\"1\" width=\"282\" style=\"word-break: break-all;\" align=\"left\"><strong>赞助商名称或网址</strong></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"214\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"350\"><br/></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"282\"><br/></td></tr><tr class=\"ue-table-interlace-color-double\"><td width=\"218\" valign=\"top\" style=\"word-break: break-all;\"><br/></td><td width=\"350\" valign=\"top\" style=\"word-break: break-all;\"><p><br/></p><p><br/></p></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"282\" style=\"word-break: break-all;\"><p><br/></p></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"206\"><p><span style=\"font-size: 20px;\">22年9月年赛</span><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"346\"><p>李灏琨 $1000</p><p>柴钢 $1000</p><p>冉光 $1000 和高球伞2把</p><p>Tony王/ Harry刘 年赛纪念品</p><p><br/></p><p><br/></p></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"274\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"206\"><span style=\"font-size: 20px;\">22年8月赛</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"346\"><p>属虎鹰友每人$300</p><p>Jeffery Chi高尔夫球6盒</p><p><br/></p><p><br/></p></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"274\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"206\"><span style=\"font-size: 20px;\">22年7月赛</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"346\"><p>John程 $1000</p><p>Tony王 10盒 Pro V1</p><p><br/></p><p><br/></p></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"274\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"206\"><span style=\"font-size: 20px;\">22年6月赛</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"346\"><p>温群 $1000</p><p>李景涛 红酒3瓶</p><p><br/></p><p><br/></p></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"274\"><br/></td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"206\"><span style=\"font-size: 20px;\">22年5月赛</span></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"346\"><p>张纪贵 $1000</p><p>Bill Cai 10盒 Pro V1</p><p><br/></p><p><br/></p></td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"word-break: break-all;\" width=\"274\"><br/></td></tr></tbody></table><p><br/></p><p><br/></p>');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_user_category_id` int(11) NOT NULL,
  `user_name` char(255) NOT NULL,
  `user_pin` char(32) NOT NULL,
  `user_last_name` char(30) NOT NULL,
  `user_first_name` char(30) NOT NULL,
  `user_email` char(100) NOT NULL,
  `user_avatar` char(255) NOT NULL DEFAULT '/upload/head-default.png',
  `user_pwd` char(64) NOT NULL,
  `user_phone` char(15) NOT NULL,
  `user_month` tinyint(4) DEFAULT NULL,
  `user_day` tinyint(4) DEFAULT NULL,
  `user_address` char(255) NOT NULL DEFAULT '',
  `user_register_time` datetime NOT NULL DEFAULT current_timestamp(),
  `user_last_login_time` datetime NOT NULL DEFAULT current_timestamp(),
  `user_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_user_category_id`, `user_name`, `user_pin`, `user_last_name`, `user_first_name`, `user_email`, `user_avatar`, `user_pwd`, `user_phone`, `user_month`, `user_day`, `user_address`, `user_register_time`, `user_last_login_time`, `user_status`) VALUES
(1, 1, 'admin', '1-DQKR', 'Admin', 'Super', 'superadmin@gmail.com', '/upload/thumbnail/1_16781577366406a7a83b7323.70418258.jpg', '96e79218965eb72c92a549dd5a330112', '111111111', NULL, NULL, '', '2020-02-13 18:02:45', '2023-03-13 22:12:43', 1),
(21, 2, 'Youjun Lu', '21-KDWY', 'Lu', 'Youjun', 'youjunlu@gmail.com', '/upload/thumbnail/21_16783660016409d531ed8663.86944946.png', '670b14728ad9902aecba32e22fa4f6bd', '6479388919', 2, 7, '', '2023-02-03 16:58:02', '2023-03-13 21:10:25', 1),
(22, 3, 'Gang Chai', '22-HSTH', 'Chai', 'Gang', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:08:03', '2023-02-13 16:08:03', 1),
(23, 3, 'David Liang', '23-JFZN', 'Liang', 'David', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:09:23', '2023-03-07 17:31:35', 1),
(24, 3, 'Ken Guo', '24-GXHW', 'Guo', 'Tao', 'guotao65@hotmail.com', '/upload/thumbnail/24_1678396489640a4c49594820.40698813.jpg', 'f379eaf3c831b04de153469d1bec345e', '4163181239', NULL, NULL, '', '2023-02-13 16:10:16', '2023-03-13 19:06:33', 1),
(25, 3, 'Haokun Li', '25-PQUE', 'Li', 'Haokun', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:12:16', '2023-02-13 16:12:16', 1),
(26, 3, 'Jason Fu', '26-JWCF', 'Fu', 'Gang', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:13:19', '2023-02-13 16:13:19', 1),
(27, 14, 'Jeff Zhang', '27-UVEP', 'Zhang', 'Zhihao', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:14:12', '2023-02-13 16:14:12', 1),
(28, 3, 'Joseph Pang', '28-EZET', 'Pang', 'Joseph', '', '/upload/thumbnail/28_16782424596407f29b890229.17832262.jpeg', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:15:38', '2023-03-13 18:48:10', 1),
(29, 3, 'Peiyin Chin', '29-QMKV', 'Chin', 'Pei-ying', '99pychin@gmail.com', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '4165719238', NULL, NULL, '', '2023-02-13 16:16:38', '2023-03-10 22:42:41', 1),
(30, 3, 'Man Zhao', '30-XXSG', 'Zhao', 'Man', 'mandrewzhao@ail.com', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '6475040426', 6, 21, '', '2023-02-13 16:17:09', '2023-03-13 20:16:50', 1),
(31, 3, 'Wayne Jing', '31-JOVW', 'Jing', 'Weixing', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:17:48', '2023-03-07 19:23:41', 1),
(32, 3, 'Guang Ran', '32-SKBP', 'Ran', 'Guang', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:18:31', '2023-03-13 18:59:34', 1),
(33, 3, 'Jeffrey Chi', '33-ZKGX', 'Chi', 'Jeffrey', 'chi.jeffrey@gmail.com', '/upload/head-default.png', '08f233054747719087fb6f9f333f19ff', '4168755168', NULL, NULL, '', '2023-02-13 16:19:48', '2023-03-13 19:11:12', 1),
(34, 3, 'Yue Dai', '34-HNXY', 'Dai', 'Yue', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:20:19', '2023-02-13 16:20:19', 1),
(35, 3, 'Tony Wang', '35-YTWE', 'Wang', 'Huimin(tony)', 'huiminw2003@yahoo.com', '/upload/thumbnail/35_1678447204640b1264d08400.17800868.jpg', '670b14728ad9902aecba32e22fa4f6bd', '4166683198', NULL, NULL, '', '2023-02-13 16:20:57', '2023-03-13 20:14:06', 1),
(36, 3, 'John Cheng', '36-MQIL', 'Cheng', 'Zhaoyong', 'johncheng399@gmail.com', '/upload/head-default.png', 'c9f79d1373a51807504a11dca44137f7', '4163992815', NULL, NULL, '', '2023-02-13 16:21:39', '2023-03-13 20:27:23', 1),
(37, 3, 'Dan Zhao', '37-LANP', 'Zhao', 'Pengju', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:23:12', '2023-02-13 16:23:12', 1),
(38, 3, 'Steven Wang', '38-RNNB', 'Wang', 'Deju', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:24:11', '2023-02-13 16:24:11', 1),
(39, 3, 'Ming Li', '39-EYSD', 'Li', 'Ming', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:24:59', '2023-02-13 16:24:59', 1),
(40, 3, 'Dick Li', '40-XUGO', 'Li', 'Kai dan', 'dicklikd@gmail.com', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '6479826327', NULL, NULL, '', '2023-02-13 16:25:48', '2023-03-08 01:28:50', 1),
(41, 3, 'Xuewei You', '41-QUKK', 'You', 'Xuewei', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:26:41', '2023-02-13 16:26:41', 1),
(42, 3, 'Jinhua Feng', '42-MZNO', 'Feng', 'Jinhua', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:27:34', '2023-03-12 00:52:35', 1),
(43, 3, 'Dingzhen Li', '43-RVAC', 'Li', 'Dingzhen', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:29:14', '2023-02-13 16:29:14', 1),
(45, 3, 'Jack Zhang', '45-VITB', 'Zhang', 'Jack', 'zhke_ca@hotmail.com', '/upload/thumbnail/45_1678575892640d09144ce081.31648615.jpeg', '670b14728ad9902aecba32e22fa4f6bd', '4162307281', NULL, NULL, '', '2023-02-13 16:30:27', '2023-03-13 18:44:26', 1),
(46, 3, 'Jim Wang', '46-RBXR', 'Wang', 'Jinzhi', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:31:11', '2023-02-13 16:31:11', 1),
(47, 3, 'David Dai', '47-DSXD', 'Dai', 'David', 'david.dai89@gmail.com', '/upload/thumbnail/47_1678636575640df61f5d18c9.99734828.jpg', '08ef84145b81dcd98554b70c662c41ed', '', NULL, NULL, '', '2023-02-13 16:32:33', '2023-03-12 15:52:56', 1),
(48, 3, 'Jun Ji', '48-PEID', 'Ji', 'Jun', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:33:16', '2023-02-13 16:33:16', 1),
(49, 3, 'Kevin Yang', '49-DAFQ', 'Yang', 'Kevin', '', '/upload/head-default.png', '7981038187944e9aa77aeecc5ec26c5c', '', NULL, NULL, '', '2023-02-13 16:33:49', '2023-03-12 14:35:47', 1),
(50, 3, 'Tao Song', '50-BHUR', 'Song', 'Tao', '', '/upload/thumbnail/50_1678557577640cc1890fec95.29454010.jpg', '5cdb6cb3040178bb57389319b83fe53e', '+14164026018', NULL, NULL, '', '2023-02-13 16:34:24', '2023-03-11 18:03:03', 1),
(51, 3, 'Sam Fu', '51-PUUO', 'Fu', 'Sam', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:34:54', '2023-02-13 16:34:54', 1),
(52, 14, 'Xianglin Wu', '52-DEYP', 'Wu', 'Xianglin', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:35:56', '2023-02-13 16:35:56', 1),
(53, 3, 'Samson Ren', '53-JYNB', 'Ren', 'Maojing', 'samson.ren@gmail.com', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '6475390688', NULL, NULL, '', '2023-02-13 16:36:41', '2023-03-10 02:13:26', 1),
(54, 3, 'Louie Liu', '54-KWDL', 'Liu', 'Zhongchuan', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:37:27', '2023-02-13 16:37:27', 1),
(55, 3, 'Max Chen', '55-NBDD', 'Chen', 'Lirong', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:37:57', '2023-02-13 16:37:57', 1),
(56, 3, 'Max Liu', '56-YDFB', 'Liu', 'Max', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:38:38', '2023-02-13 16:38:38', 1),
(57, 3, 'Bill Li', '57-QZOV', 'Li', 'Jingtao', '', '/upload/head-default.png', '54398b822bb093982d411ee9cebbdde5', '', NULL, NULL, '', '2023-02-13 16:39:08', '2023-03-13 20:43:12', 1),
(58, 14, 'Zhangxian Yu', '58-MIRY', 'Yu', 'Zhangxian', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:40:08', '2023-02-13 16:40:08', 1),
(59, 14, 'Jie Luan', '59-WBOY', 'Luan', 'Jie', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:40:42', '2023-02-13 16:40:42', 1),
(60, 3, 'Wangqing Qiu', '60-ESER', 'Qiu', 'Wangqing', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:41:35', '2023-03-08 16:20:07', 1),
(61, 3, 'Bob Liu', '61-PONK', 'Liu', 'Bob', 'bonelyldouble@yahoo.com', '/upload/thumbnail/61_167825281964081b13401746.21096701.jpg', '670b14728ad9902aecba32e22fa4f6bd', '14168959317', NULL, NULL, '', '2023-02-13 16:42:08', '2023-03-08 05:22:58', 1),
(62, 3, 'Kevin Wu', '62-OTTW', 'Wu', 'Kuidou', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:42:52', '2023-02-13 16:42:52', 1),
(63, 3, 'Bill Cai', '63-GIQK', 'Cai', 'Tianyu', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:43:28', '2023-02-13 16:43:28', 1),
(64, 3, 'Jun Du', '64-UCIB', 'Du', 'Jun', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:44:01', '2023-02-13 16:44:01', 1),
(65, 3, 'Jigui Zhang', '65-GVWJ', 'Zhang', 'Jigui', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:44:44', '2023-02-13 16:44:44', 1),
(66, 14, 'Dylan Xu', '66-UYUR', 'Xu', 'Jixiao', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:45:45', '2023-02-13 16:45:45', 1),
(67, 3, 'Patrick Wen', '67-DMNY', 'Wen', 'Qun', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:46:21', '2023-02-13 16:46:21', 1),
(68, 3, 'Jason Yu', '68-MXVF', 'Yu', 'Xuechen', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:47:01', '2023-02-13 16:47:01', 1),
(69, 3, 'Hanri Liu', '69-YBYX', 'Liu', 'Guoqiang', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:47:38', '2023-03-10 22:32:55', 1),
(70, 14, 'William Wang', '70-LQDI', 'Wang', 'William', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:48:35', '2023-02-13 16:48:35', 1),
(71, 14, 'James Li', '71-AREZ', 'Li', 'Yifeng', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:49:16', '2023-02-13 16:49:16', 1),
(72, 3, 'Jacky Hu', '72-GTHR', 'Hu', 'Jacky', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:50:06', '2023-02-13 16:50:06', 1),
(73, 3, 'Leo Liu', '73-CCUA', 'Liu', 'Zhi', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:50:37', '2023-02-13 16:50:37', 1),
(74, 3, 'Nixon Chen', '74-JULV', 'Chen', 'Nixon', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:52:57', '2023-02-13 16:52:57', 1),
(75, 3, 'Qiang Chen', '75-IIAL', 'Chen', 'Qiang', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:53:41', '2023-02-13 16:53:41', 1),
(76, 3, 'Shang Hu', '76-MRAR', 'Hu', 'Shang', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:54:24', '2023-02-13 16:54:24', 1),
(77, 3, 'Chuan Luo', '77-UKFR', 'Luo', 'Chuan', '828282luo@gmail.com', '/upload/thumbnail/77_1678740349640f8b7d394847.55617323.jpg', '590168cb4ccd387618fbb1415604b131', '', 2, 15, '', '2023-02-13 16:56:18', '2023-03-13 21:30:11', 1),
(78, 3, 'Riyong Lin', '78-KUSP', 'Lin', 'Riyong', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:56:56', '2023-02-13 16:56:56', 1),
(79, 3, 'Charlie Lin', '79-GYAA', 'Lin', 'Charlie', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:57:59', '2023-02-13 16:57:59', 1),
(80, 3, 'Mark Zhang', '80-RJOY', 'Zhang', 'Jun', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:58:53', '2023-02-13 16:58:53', 1),
(81, 3, 'Ray Sun', '81-OAOK', 'Sun', 'Ray', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 17:00:18', '2023-03-10 00:01:22', 1),
(82, 3, 'Hong Gao', '82-ODTV', 'Gao', 'Hong', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 17:00:56', '2023-02-13 17:00:56', 1),
(83, 3, 'Raymond Xu', '83-RULP', 'Xu', 'Raymond', 'raymondxuwen@gmail.com', '/upload/thumbnail/83_167821371664078254ed7650.42293305.jpeg', '670b14728ad9902aecba32e22fa4f6bd', '4168768999', NULL, NULL, '', '2023-02-13 17:01:57', '2023-03-07 18:26:35', 1),
(84, 3, 'Jun Li', '84-DXFJ', 'Li', 'Jun', 'lj220818@gmail.com', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '7786688587', NULL, NULL, '', '2023-02-13 17:02:33', '2023-03-13 18:39:57', 1),
(85, 3, 'Wen Ye', '85-EGVF', 'Ye', 'Wen', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 17:04:20', '2023-02-13 17:04:20', 1),
(87, 3, 'Yaodong', '87-PJAC', 'Xu', 'Yaodong', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 17:05:27', '2023-02-13 17:05:27', 1),
(88, 3, 'Kaixian Li', '88-FHUH', 'Li', 'Kaixian', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 17:07:13', '2023-02-13 17:07:13', 1),
(92, 3, 'Kevin Liang', '92-QWPR', 'Liang', 'Kevin', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 21:39:38', '2023-02-13 21:39:38', 1),
(93, 3, 'Alex Yao', '93-VCGS', 'Yao', 'Alex', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 23:26:19', '2023-03-11 20:29:36', 1),
(94, 3, 'Jing Qian', '94-VVIK', 'Qian', 'Jing', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 23:47:26', '2023-02-13 23:47:26', 1),
(95, 15, 'Guest 1', '95-RIGH', '1', 'Guest', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-14 01:19:39', '2023-02-14 01:19:39', 1),
(96, 15, 'Guest 2', '96-KUFN', '2', 'Guest', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-14 01:20:19', '2023-02-14 01:20:19', 1),
(97, 15, 'Guest 3', '97-JYTQ', '3', 'Guest', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-14 01:20:48', '2023-02-14 01:20:48', 1),
(98, 3, 'Sheriden Huang', '98-HCFL', 'Huang', 'Sheriden', 'sheridenhuang@gmail.com', '/upload/thumbnail/98_1678506126640bf88e1e50d9.14012409.jpeg', 'a6f6e63edf7cc991055abaedbeb35304', '4168236899', NULL, NULL, '', '2023-02-14 15:49:44', '2023-03-11 03:41:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_category`
--

CREATE TABLE `user_category` (
  `user_category_id` int(11) NOT NULL,
  `user_category_title` char(40) NOT NULL,
  `user_category_authority` mediumtext NOT NULL,
  `user_category_level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_category`
--

INSERT INTO `user_category` (`user_category_id`, `user_category_title`, `user_category_authority`, `user_category_level`) VALUES
(1, '管理员', '{\"SYSTEM_SETTING\":6,\"USER\":30,\"EVENT\":62,\"SPONSOR\":2,\"RANK\":2,\"ANNOUNCE\":2}', 1),
(2, '年度正式会员', '{\"SYSTEM_SETTING\":0,\"USER\":2,\"EVENT\":6,\"SPONSOR\":0,\"RANK\":2,\"ANNOUNCE\":0}', 2),
(3, '年度正式会员 (待缴费)', '{\"SYSTEM_SETTING\":0,\"USER\":2,\"EVENT\":6,\"SPONSOR\":0,\"RANK\":2,\"ANNOUNCE\":0}', 3),
(14, '休会', '{\"SYSTEM_SETTING\":0,\"USER\":0,\"EVENT\":0,\"SPONSOR\":0,\"RANK\":0,\"ANNOUNCE\":0}', 5),
(15, '嘉宾', '{\"SYSTEM_SETTING\":0,\"USER\":2,\"EVENT\":6,\"SPONSOR\":0,\"RANK\":2}', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`agenda_id`);

--
-- Indexes for table `announce`
--
ALTER TABLE `announce`
  ADD PRIMARY KEY (`announce_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `image_section_name_id` (`file_section_name`,`file_section_id`) USING BTREE;

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`participant_id`),
  ADD KEY `participant_event_id` (`participant_event_id`);

--
-- Indexes for table `participant_history`
--
ALTER TABLE `participant_history`
  ADD PRIMARY KEY (`participant_history_id`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`rank_user_id`);

--
-- Indexes for table `rank_history`
--
ALTER TABLE `rank_history`
  ADD PRIMARY KEY (`rank_history_id`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`sponsor_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`user_name`),
  ADD UNIQUE KEY `user_pin` (`user_pin`),
  ADD KEY `user_category_id_idx` (`user_user_category_id`);

--
-- Indexes for table `user_category`
--
ALTER TABLE `user_category`
  ADD PRIMARY KEY (`user_category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `agenda_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announce`
--
ALTER TABLE `announce`
  MODIFY `announce_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `file_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `participant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `participant_history`
--
ALTER TABLE `participant_history`
  MODIFY `participant_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `rank_history`
--
ALTER TABLE `rank_history`
  MODIFY `rank_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `sponsor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `user_category`
--
ALTER TABLE `user_category`
  MODIFY `user_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`participant_event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_category_id` FOREIGN KEY (`user_user_category_id`) REFERENCES `user_category` (`user_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
