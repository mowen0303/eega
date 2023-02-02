-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 02, 2023 at 02:18 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.2.21

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
  `agenda_controller_name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agenda_action_name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agenda_action_param` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agenda_run_at` int(11) NOT NULL DEFAULT 0,
  `agenda_last_run_at` int(11) NOT NULL DEFAULT 0,
  `agenda_last_run_status` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `agenda_last_run_note` char(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `event_title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` date NOT NULL,
  `event_type` enum('month','week') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'week',
  `event_location_id` int(11) NOT NULL,
  `event_max_participant` int(11) NOT NULL,
  `event_review_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_review_title` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_title`, `event_description`, `event_date`, `event_type`, `event_location_id`, `event_max_participant`, `event_review_content`, `event_review_title`) VALUES
(4, '第五届网球杯', '123\r\n456\r\n789', '2023-01-26', 'month', 8, 30, '<p>sdfds</p><p>sdfadsfds</p>', NULL),
(5, '111', '', '2023-01-05', 'week', 0, 10, NULL, NULL),
(6, '333333', '123123', '2023-02-27', 'week', 10, 10, NULL, NULL),
(7, '44444', '', '2023-03-07', 'week', 19, 10, NULL, NULL),
(8, '555', '', '2023-03-11', 'week', 4, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `file_id` int(11) UNSIGNED NOT NULL,
  `file_type` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img',
  `file_url` char(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_original_url` char(155) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `file_height` int(5) UNSIGNED NOT NULL DEFAULT 0,
  `file_width` int(5) UNSIGNED NOT NULL DEFAULT 0,
  `file_section_name` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `participant_t` enum('red','green','white','blue','black','') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `participant_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`participant_id`, `participant_event_id`, `participant_user_id`, `participant_index`, `participant_score`, `participant_net_score`, `participant_handicap_differential`, `participant_handicap_index`, `participant_t`, `participant_date`) VALUES
(36, 4, 19, 0, 333, NULL, '216.6', NULL, 'blue', '2023-01-26'),
(38, 4, 1, 1, 198, NULL, '114.1', NULL, 'white', '2023-01-26'),
(39, 5, 19, 0, 17911, NULL, '14712.1', NULL, 'black', '2023-01-05'),
(40, 5, 1, 1, 22, NULL, '-42.2', NULL, 'white', '2023-01-05'),
(41, 6, 19, 0, 111, NULL, '33.0', NULL, 'blue', '2023-02-27'),
(42, 6, 1, 1, 222, NULL, '134.9', NULL, 'white', '2023-02-27'),
(43, 7, 1, 0, 111, NULL, '34.5', NULL, 'blue', '2023-03-07'),
(44, 7, 19, 1, 222, NULL, '133.3', NULL, 'blue', '2023-03-07'),
(45, 8, 19, 0, 111, 20, '34.8', '79.8', 'blue', '2023-03-11'),
(46, 8, 1, 1, 22, 29, '-42.2', '-3.7', 'white', '2023-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE `rank` (
  `rank_user_id` int(11) NOT NULL,
  `rank_history_count` smallint(6) NOT NULL,
  `rank_handicap_index` decimal(7,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rank`
--

INSERT INTO `rank` (`rank_user_id`, `rank_history_count`, `rank_handicap_index`) VALUES
(1, 2, '-40.5'),
(19, 2, '32.5');

-- --------------------------------------------------------

--
-- Table structure for table `rank_history`
--

CREATE TABLE `rank_history` (
  `rank_history_id` int(11) NOT NULL,
  `rank_history_user_id` int(11) NOT NULL,
  `rank_history_participant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `sponsor_id` int(11) NOT NULL,
  `sponsor_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`sponsor_id`, `sponsor_content`) VALUES
(1, '<h1>拜登将于5月11日宣布美国结束新冠疫情紧急状态</h1><p><br/></p><p>美联社1月30日消息，美国总统拜登对国会发布声明称，将于5月11日宣布结束与新冠疫情有关的国家紧急状态和公共卫生紧急状态。他反对众议院共和党人本周提交的关于立即结束紧急状态的决议。<br/></p><p>美国行政管理和预算局在一份行政政策声明中指出：“突然结束紧急声明将给整个医疗保健系统带来普遍的混乱和不确定性，会影响各州、医院和医生办公室，以及最重要的是，影响到数千万美国人。”<br/></p><p><br/></p><p><img src=\"/upload/article/202301311675150851927748.jpg\" title=\"202301311675150851927748.jpg\" alt=\"ca50773b93e7037d29c69055253ac167.jpg\"/></p>');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_user_category_id` int(11) NOT NULL,
  `user_name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_pin` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_last_name` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_first_name` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_avatar` char(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/upload/head-default.png',
  `user_pwd` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_phone` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_address` char(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_register_time` datetime NOT NULL DEFAULT current_timestamp(),
  `user_last_login_time` datetime NOT NULL DEFAULT current_timestamp(),
  `user_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_user_category_id`, `user_name`, `user_pin`, `user_last_name`, `user_first_name`, `user_email`, `user_avatar`, `user_pwd`, `user_phone`, `user_address`, `user_register_time`, `user_last_login_time`, `user_status`) VALUES
(1, 1, 'admin', '1-DQKR', 'Admin', 'Super', 'superadmin@gmail.com', '/upload/thumbnail/1_15820820845e4ca8242e0d82.15518426.jpg', '96e79218965eb72c92a549dd5a330112', '6477777777', '', '2020-02-13 18:02:45', '2023-02-01 20:12:31', 1),
(19, 2, 'test', '19-IOJL', 'Test', 'Test', 'sdfdsf@sdfds.com', '/upload/thumbnail/1_167514073763d89e81a9e5b8.00543448.jpg', 'e3ceb5881a0a1fdaad01296d7554868d', '', '', '2022-12-10 21:28:20', '2022-12-17 00:44:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_category`
--

CREATE TABLE `user_category` (
  `user_category_id` int(11) NOT NULL,
  `user_category_title` char(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_category_authority` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_category_level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_category`
--

INSERT INTO `user_category` (`user_category_id`, `user_category_title`, `user_category_authority`, `user_category_level`) VALUES
(1, '管理员', '{\"SYSTEM_SETTING\":6,\"USER\":30,\"EVENT\":62,\"SPONSOR\":2,\"RANK\":2}', 1),
(2, '年度正式会员', '{\"SYSTEM_SETTING\":0,\"USER\":2,\"EVENT\":6,\"SPONSOR\":0,\"RANK\":2}', 2),
(3, '年度正式会员 (待缴费)', '{\"SYSTEM_SETTING\":0,\"USER\":2,\"EVENT\":2,\"SPONSOR\":0,\"RANK\":2}', 3),
(14, '休会', '{\"SYSTEM_SETTING\":0,\"USER\":0}', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`agenda_id`);

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
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `file_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `participant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `rank_history`
--
ALTER TABLE `rank_history`
  MODIFY `rank_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `sponsor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_category`
--
ALTER TABLE `user_category`
  MODIFY `user_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
