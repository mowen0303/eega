-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2023 at 12:31 AM
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
(1, '通知', '<p><strong><span style=\"color: rgb(255, 0, 0);\">23年首届会长杯于5月29号举办，请大家留出时间！</span></strong></p><p><br/></p>'),
(2, '喜报', '<p><strong><span style=\"color: rgb(255, 0, 0);\">首届会长杯月赛已收到赞助款2000元+！</span></strong></p><p><strong><span style=\"color: rgb(255, 0, 0);\"><br/></span></strong></p><p><strong><span style=\"color: rgb(0, 0, 0);\">照片征集：</span></strong><span style=\"color: rgb(0, 0, 0); font-size: 14px;\">请上传22年年赛照片到eega2022@hotmail.com</span></p>'),
(3, '资讯', '<p><br/></p><p><br/></p><table><tbody><tr class=\"firstRow\"><td width=\"932\" valign=\"top\" style=\"word-break: break-all;\"><p><span style=\"font-size: 18px;\"><strong>会员状态和网站报名：</strong></span></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>会员交纳会费后，会员状态将显示为“年度正式会员”，方可在网站上报名参加比赛和球会活动。</p></li><li><p><span style=\"color: rgb(0, 112, 192);\">23年会费$150 请 e-transfer 到 eega2022@hotmail.com&nbsp;</span><span style=\"color: rgb(0, 112, 192);\">收款已设置为自动存款，请在备注里写会员姓名。</span></p></li><li><p>鹰会财务总监 Jeffery Chi 确认收到会费后，网站上会将已交费会员调整为“年度正式会员”状态。</p></li><li><p>鹰会的活动和比赛，提前14天开放报名，活动前1天锁定报名，不能再做变更。</p></li><li><p>鹰会第一次活动5月2日，请会员不晚于4月20日EMT会费，转为年度正式会员状态，报名参加活动。</p></li></ol></td></tr><tr><td width=\"932\" valign=\"top\" style=\"word-break: break-all;\"><p><strong><span style=\"font-size: 18px;\">有关差点指数说明：</span></strong></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>尽量与国际标准接轨并考虑网站设计简单化，设定为会员要有4次成绩，才开始计算并在网站上看到差点。</p></li><li><p>现有会员已输入3次比赛成绩，所以只要再参加一次球会活动，输入成绩后就会看到差点指数，并能参加比赛的净杆排名。</p></li><li><p>已输入的三场成绩，因有些会员未能参加年赛和月赛，是根据历史水平估算和填写的成绩，不够精确请见谅。随着录入真实成绩的场次不断增加，差点指数将会越趋于真实。</p></li><li><p>新入会的会员，需要累积四场成绩之后，才能有差点指数显示，参与球会的净杆比赛排名。</p></li><li><p>网站上已录入每个球场各个T台的Raiting和 Slope系数，数据来源于Golf Canada 官方网站，会跟球场成绩单或某些网站公布的数据有出入。</p></li><li><p>以后参加活动和比赛，除了上交本场成绩还要注明T台，以免带来差点指数的统计错误。</p></li><li><p>会员参加活动和比赛，无论选择哪个T台开球，网站上均已录入对应的系数，都能够正确计算净杆数。</p></li><li><p>为保证按规定时间完成赛事，建议60岁以上和差点指数高于25的会员从白T开球。（如选蓝T，保证不影响速度）其余会员蓝T；35岁（含）以下，退后一个T台开球。</p><p><br/></p><p style=\"line-height: 16px;\">****&nbsp;<strong>R&amp;A&nbsp; USGA差点系统&nbsp;&nbsp;</strong><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"/admin/resource/tools/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/upload/article_file/20230416/1681596560638853.pdf\" title=\"Rules-of-Handicapping.pdf\">Rules-of-Handicapping.pdf</a></p></li></ol></td></tr><tr><td width=\"932\" valign=\"top\" style=\"word-break: break-all;\"><p><strong><span style=\"font-size: 18px;\">2023年华人队际赛选拔</span></strong></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p><span style=\"color: rgb(0, 112, 192);\">今年华人队际赛将于9月5日在 Station Creek South球场举办。</span></p></li><li><p>每个球会派17人参加比赛，取其中14人最好成绩计算排名。</p></li><li><p>鹰会将由傅罡总领队，于学琛副领队挂帅参赛。</p></li></ul><p><br/></p><p><span style=\"color: rgb(0, 112, 192);\">参赛鹰友的选拔，将按鹰会差点排名的前14位，获得代表</span><span style=\"color: rgb(0, 112, 192);\">鹰会参赛的资格。</span></p><p>另外三名代表，由傅教头根据鹰友今年的状态和表现，确定参赛资格。</p></td></tr><tr><td valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><p><strong><span style=\"font-size: 18px;\">月赛和年赛需要安排哪些事项：</span></strong></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>订球场，确定参赛人数后把分组名单提前传给球场，安排最近洞和最远距离插牌。</p></li><li><p>确定比赛形式和规则，例如“红蓝对抗赛”，红蓝分队和编组等。</p></li><li><p>采购前三名和最近洞最远距离的奖品。如果有赞助，采购抽奖礼品。</p></li><li><p>联系晚餐餐厅，提前预定菜单和价格，商量是否可以自带红酒啤酒。</p></li><li><p>收集并核对成绩单，确定成绩同时标注T台。交给指定人员输入网站，核对无误。</p></li><li><p>安排晚餐时发奖。拍照记录比赛获奖者，照片传到球会的邮箱。</p></li></ol></td></tr><tr><td width=\"932\" valign=\"top\" style=\"word-break: break-all;\"><strong><span style=\"font-size: 18px;\">今年“会长杯” 明年“冠军杯”</span></strong><p><span style=\"color: rgb(0, 112, 192);\">2023年是鹰会成立15周年，为感谢历届会长为球会发展</span></p><p><span style=\"color: rgb(0, 112, 192);\">做出的贡献，&nbsp;2023年月赛和年赛将以历任会长冠名。&nbsp;</span></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>5月赛&nbsp;–&nbsp;庞海福会长杯&nbsp;</p></li><li><p>6月赛&nbsp;–&nbsp;井卫星会长杯&nbsp;</p></li><li><p>7月赛&nbsp;–&nbsp;覃培因会长杯&nbsp;</p></li><li><p>8月赛&nbsp;–&nbsp;吕友军会长杯&nbsp;</p></li><li><p>9月年赛&nbsp;–&nbsp;梁David/柴钢双会长杯&nbsp;</p></li><li><p>诚邀鹰友报名义工，参与支持！&nbsp;</p></li><li><p>高尔夫球规则&nbsp; &nbsp; &nbsp;<img src=\"/admin/resource/tools/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\" style=\"vertical-align: middle; margin-right: 2px;\"/><a href=\"/upload/article_file/20230416/1681596827851106.pdf\" title=\"2023_Rules-of-Golf.pdf\" style=\"font-size: 12px; color: rgb(0, 102, 204);\">2023_Rules-of-Golf.pdf</a></p></li></ul><p>&nbsp;</p><p><span style=\"color: rgb(0, 112, 192);\">2024年的月赛和年赛，将以2023年月赛和年赛的冠军冠名。</span></p><p>每次月赛都有总杆冠军和净杆前三名，获总杆冠军的鹰友不参与以后月赛总杆竞争以及当月的净杆排名，明年月赛以总杆冠军名字冠名。年赛总杆冠军的名字，冠名明年的年赛。如年赛总杆冠军名字与月赛总杆冠军重名，将以年赛总杆成绩的排名顺延，冠名重名的月赛。获得冠名的各位总杆冠军和净杆前三名将共同主办明年的月赛和年赛。</p><p><br/></p><p>预祝鹰友发挥球技和水平，赢得总杆冠军和冠名的荣誉。</p></td></tr><tr><td width=\"932\" valign=\"top\" style=\"word-break: break-all;\"><p><strong><span style=\"font-size: 18px;\">本届团队 （2023-2024年）</span></strong></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>会长：郭涛&nbsp; &nbsp; 副会长：Hanri 刘国强</p></li><li><p>理事：傅罡，吕友军，Jeffery Chi, 王德举，戴悦，于学琛，Tony 王，刘国强，郭涛</p></li></ul></td></tr><tr><td width=\"932\" valign=\"top\" style=\"word-break: break-all;\"><p><strong><span style=\"font-size: 18px;\">2022年鹰会财务报告</span></strong></p><p><strong><span style=\"font-size: 18px;\"></span></strong></p><p style=\"line-height: 16px;\"><br/></p><p style=\"line-height: 16px;\"><img src=\"/admin/resource/tools/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a title=\"EEGA Accounting Dec 31-22 FS.pdf\" style=\"font-size:12px; color:#0066cc;\" href=\"/upload/article_file/20230321/1679371497831895.pdf\">EEGA Accounting Dec 31-22 FS.pdf</a></p><p><strong><span style=\"font-size: 18px;\"></span></strong></p><p style=\"line-height: 16px;\"><img src=\"/admin/resource/tools/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a title=\"EEGA Accounting Dec 31-22 BK.pdf\" style=\"font-size:12px; color:#0066cc;\" href=\"/upload/article_file/20230321/1679371518817011.pdf\">EEGA Accounting Dec 31-22 BK.pdf</a></p><p><strong><span style=\"font-size: 18px;\"></span></strong><br/></p></td></tr></tbody></table><p><br/></p><p><br/></p>');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `article_category_id` int(11) NOT NULL,
  `article_title` char(255) NOT NULL,
  `article_content` text DEFAULT NULL,
  `article_date` date DEFAULT NULL,
  `article_description` varchar(3000) NOT NULL,
  `article_img` char(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `article_category_id`, `article_title`, `article_content`, `article_date`, `article_description`, `article_img`) VALUES
(1, 1, '2022年 鹰会年赛', '<p><br/></p><p>2022年9月鹰会年赛 大合影</p><p><br/></p><p><img title=\"202303141678768892211019.jpg\" src=\"/upload/article/202303141678768892211019.jpg\"/></p><p><br/></p><p>鹰友兴高采烈庆祝年赛举办成功</p><p><br/></p><p><img title=\"202303141678768893399858.jpg\" src=\"/upload/article/202303141678768893399858.jpg\"/><br/></p><p><br/></p><p>最后一洞推杆</p><p><br/></p><p><img title=\"202303171679027258151695.jpg\" alt=\"1-赛.jpg\" src=\"/upload/article/202303171679027258151695.jpg\"/></p><p><br/></p><p>木筷子第一洞</p><p><br/></p><p><img title=\"202303141678768936154089.jpg\" src=\"/upload/article/202303141678768936154089.jpg\"/></p><p><br/></p>', '2022-09-27', '2022年 鹰会年赛', '/upload/thumbnail/1_16790272976413ec6185cbb2.48437052.jpg'),
(2, 1, '2022年8月赛 - 属虎60生日宴', '<p><br/></p><p>2022年8月鹰友60大寿聚会照片</p><p><br/></p><p><img title=\"202303171679027531951495.jpg\" alt=\"1-虎.jpg\" src=\"/upload/article/202303171679027531951495.jpg\"/></p><p><br/></p><p>同打80杆并依后9排出名次的冠亚军得主：吕友军、王德举</p><p><br/></p><p><img title=\"202303141678738373891024.jpg\" src=\"/upload/article/202303141678738373891024.jpg\"/></p><p><br/></p><p>8月赛最近洞获奖选手 - 邱师傅，John 程，赵鹏举<br/></p><p><br/></p><p><img title=\"202303141678738373835979.jpg\" src=\"/upload/article/202303141678738373835979.jpg\"/></p><p><br/></p><p>幸运奖： Bill 蔡，Samson 任，季军</p><p><br/></p><p><img title=\"202303171679027635563433.jpg\" alt=\"4-虎.jpg\" src=\"/upload/article/202303171679027635563433.jpg\"/></p><p><br/></p><p>柴会长主持发奖<br/></p><p><br/></p><p><img title=\"202303141678738374265631.jpg\" src=\"/upload/article/202303141678738374265631.jpg\"/></p><p><br/></p><p>邱师傅颁奖</p><p><br/></p><p><img title=\"202303171679027968689488.jpg\" alt=\"5-虎.jpg\" src=\"/upload/article/202303171679027968689488.jpg\"/></p><p><br/></p><p>吃蛋糕🎂啦😀</p><p><br/></p><p><img title=\"202303141678738374947423.jpg\" src=\"/upload/article/202303141678738374947423.jpg\"/></p><p><br/></p><p>抽奖啦！</p><p><br/></p><p><img title=\"202303171679028006910338.jpg\" alt=\"8-虎.jpg\" src=\"/upload/article/202303171679028006910338.jpg\"/></p>', '2022-08-30', '2022年8月赛 - 属虎60生日宴', '/upload/thumbnail/1_16790280706413ef66e9c7e3.65132374.jpg'),
(3, 1, '鹰会历史照片 -- 征集照片中', '<p><br/></p><p>红蓝对抗赛 - 蓝军获胜</p><p><br/></p><p><img title=\"202303171678984029352391.jpg\" alt=\"H-1.JPG\" src=\"/upload/article/202303171678984029352391.jpg\"/></p><p><br/></p><p>第三次获得华人队际赛冠军</p><p><br/></p><p><img title=\"202303171678984078163166.jpg\" alt=\"H-2.jpg\" src=\"/upload/article/202303171678984078163166.jpg\"/></p><p><br/></p><p>鹰虎对抗赛，鹰队捧杯！</p><p><br/></p><p><img title=\"202303171678984205395244.jpg\" alt=\"H-3.jpg\" src=\"/upload/article/202303171678984205395244.jpg\"/></p>', '2022-07-28', '请鹰友把2022年以前的活动照片，发邮件到 eega2022@hotmail.com\r\n注明活动的日期，每张照片的主题或内容。多谢大家！', '/upload/thumbnail/1_16790271126413eba87285c2.78390666.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

CREATE TABLE `article_category` (
  `article_category_id` int(11) NOT NULL,
  `article_category_title` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`article_category_id`, `article_category_title`) VALUES
(1, '活动照片');

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
(8, '2022年8月赛 - 属虎60生日宴', '', '2022-08-30', 'month', 29, 70, NULL, NULL),
(10, '2022年9月 周活动', '', '2022-09-06', 'week', 58, 72, NULL, NULL),
(11, '2022年 鹰会年赛', '', '2022-09-27', 'month', 70, 72, NULL, NULL),
(12, '周活动', '1250；1310/20--共三组\r\n春价+会待8折优惠；60+还有折扣', '2023-05-02', 'week', 65, 12, NULL, NULL),
(13, '周活动', '4月30号才能确认tt', '2023-05-09', 'week', 37, 16, NULL, NULL),
(14, '周活动', '春价+会待，113元/人包车 税。\r\n14号确认天气OK，请大家EMT:youjunlu@gmail.com', '2023-05-16', 'week', 9, 16, NULL, NULL),
(15, '5月23日CL场 请David 戴订场', '郭涛友军订场', '2023-05-23', 'week', 60, 24, NULL, NULL),
(16, '庞海福会长杯', '感谢Jim Wang帮忙订场！12:06pm起10组\r\n月赛以净杆赛为主，请鹰友们积极参加5月活动，取得球会差点指数', '2023-05-29', 'month', 28, 40, NULL, NULL),
(17, '6月6日非CL 套票Balantrae 郭涛买票', '郭涛买套票', '2023-06-06', 'week', 2, 24, NULL, NULL),
(18, '6月13日CL场 请Jim王订场', '请Jim Wang订场', '2023-06-13', 'week', 14, 28, NULL, NULL),
(19, '6月20日非CL 套票Bond Head（已买）', '用Bond Head套票（已买）', '2023-06-20', 'week', 64, 24, NULL, NULL),
(20, '6月赛井卫星会长杯 老井订场', '老井负责组织比赛并订场', '2023-06-27', 'month', 28, 36, NULL, NULL),
(21, '7月4日非CL 郭涛友军订场', '郭涛友军订场', '2023-07-04', 'week', 65, 24, NULL, NULL),
(22, '7月11日CL场 请Jim王订场', '请Jim王订场', '2023-07-11', 'week', 16, 28, NULL, NULL),
(23, '7月18日非CL 套票Bond Head（已买）', '使用Bond Head套票', '2023-07-18', 'week', 64, 28, NULL, NULL),
(24, '7月赛覃培因会长杯 请David戴订场', '培因和郭涛共同组织', '2023-07-25', 'month', 60, 40, NULL, NULL),
(25, '8月1日非CL 套票Balantrae 郭涛买票', '郭涛买套票', '2023-08-01', 'week', 2, 28, NULL, NULL),
(26, '8月8日CL场 请David 戴订场', '请Jim王订场', '2023-08-08', 'week', 14, 28, NULL, NULL),
(27, '8月15日非CL 郭涛友军订场', '联系红鸟球场特价', '2023-08-15', 'week', 45, 24, NULL, NULL),
(28, '8月22日CL场 请Jim王订场', '请David 戴订场', '2023-08-22', 'week', 73, 32, NULL, NULL),
(29, '8月赛吕友军会长杯 友军订场', '友军负责组织比赛并订场', '2023-08-29', 'month', 30, 40, NULL, NULL),
(30, '9月5日华人队际赛 傅教头领队参赛 共17名选手参赛 其他自由活动', '非比赛人员另外找场地活动，如3组Balantrae', '2023-09-05', 'week', 60, 17, NULL, NULL),
(31, '9月12日CL场 请David 戴订场', '请David 戴订场', '2023-09-12', 'week', 8, 28, NULL, NULL),
(32, '9月19日非CL 郭涛友军订场', '郭涛友军订场', '2023-09-19', 'week', 53, 24, NULL, NULL),
(33, '9月鹰会年赛 David梁/柴钢双会长杯 请老梁/柴刚订场', '老梁/柴刚负责组织比赛并订场', '2023-09-26', 'month', 70, 60, NULL, NULL),
(35, '“会长杯”义工报名 - 感谢鹰友的爱心', '请大家根据自己的时间安排，报名“会长杯”义工，感谢鹰友的爱心支持！', '2023-06-15', 'month', 70, 20, NULL, NULL),
(37, '23年首秀', '1240、1250、1300、1310 共四组\r\n拿到会待价格 8折优惠! 60+还有折扣\r\n如果12人以上参加活动，成绩就在网站录入', '2023-04-20', 'week', 66, 16, NULL, NULL);

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
(19, 8, 24, 3, 105, NULL, '29.2', NULL, 'white', '2022-08-30'),
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
(152, 10, 22, 0, 87, NULL, '14.5', NULL, 'white', '2022-09-06'),
(153, 10, 23, 1, 84, NULL, '9.9', NULL, 'blue', '2022-09-06'),
(154, 10, 21, 2, 84, NULL, '9.9', NULL, 'blue', '2022-09-06'),
(155, 10, 24, 3, 103, NULL, '28.6', NULL, 'white', '2022-09-06'),
(156, 10, 25, 4, 80, NULL, '6.5', NULL, 'blue', '2022-09-06'),
(157, 10, 26, 5, 81, NULL, '7.3', NULL, 'blue', '2022-09-06'),
(158, 10, 27, 6, 83, NULL, '9.1', NULL, 'blue', '2022-09-06'),
(159, 10, 28, 7, 82, NULL, '8.2', NULL, 'blue', '2022-09-06'),
(160, 10, 29, 8, 98, NULL, '24.2', NULL, 'white', '2022-09-06'),
(161, 10, 30, 9, 82, NULL, '8.2', NULL, 'blue', '2022-09-06'),
(162, 10, 31, 10, 93, NULL, '19.8', NULL, 'white', '2022-09-06'),
(163, 10, 32, 11, 96, NULL, '22.4', NULL, 'white', '2022-09-06'),
(164, 10, 34, 12, 90, NULL, '17.1', NULL, 'white', '2022-09-06'),
(165, 10, 33, 13, 93, NULL, '19.8', NULL, 'white', '2022-09-06'),
(166, 10, 35, 14, 90, NULL, '17.1', NULL, 'white', '2022-09-06'),
(167, 10, 36, 15, 90, NULL, '17.1', NULL, 'white', '2022-09-06'),
(168, 10, 37, 16, 89, NULL, '14.2', NULL, 'blue', '2022-09-06'),
(169, 10, 38, 17, 84, NULL, '9.9', NULL, 'blue', '2022-09-06'),
(170, 10, 39, 18, 83, NULL, '9.1', NULL, 'blue', '2022-09-06'),
(171, 10, 40, 19, 86, NULL, '11.6', NULL, 'blue', '2022-09-06'),
(172, 10, 41, 20, 90, NULL, '15.1', NULL, 'blue', '2022-09-06'),
(173, 10, 42, 21, 88, NULL, '13.4', NULL, 'blue', '2022-09-06'),
(174, 10, 43, 22, 85, NULL, '10.8', NULL, 'blue', '2022-09-06'),
(175, 10, 45, 23, 88, NULL, '13.4', NULL, 'blue', '2022-09-06'),
(176, 10, 46, 24, 90, NULL, '15.1', NULL, 'blue', '2022-09-06'),
(177, 10, 47, 25, 98, NULL, '24.2', NULL, 'white', '2022-09-06'),
(178, 10, 48, 26, 87, NULL, '12.5', NULL, 'blue', '2022-09-06'),
(179, 10, 49, 27, 92, NULL, '16.8', NULL, 'blue', '2022-09-06'),
(180, 10, 50, 28, 93, NULL, '19.8', NULL, 'white', '2022-09-06'),
(181, 10, 52, 29, 93, NULL, '17.7', NULL, 'blue', '2022-09-06'),
(182, 10, 53, 30, 96, NULL, '20.3', NULL, 'blue', '2022-09-06'),
(183, 10, 54, 31, 95, NULL, '19.4', NULL, 'blue', '2022-09-06'),
(184, 10, 56, 32, 98, NULL, '24.2', NULL, 'white', '2022-09-06'),
(185, 10, 55, 33, 99, NULL, '25.1', NULL, 'white', '2022-09-06'),
(186, 10, 58, 34, 93, NULL, '17.7', NULL, 'blue', '2022-09-06'),
(187, 10, 59, 35, 90, NULL, '15.1', NULL, 'blue', '2022-09-06'),
(188, 10, 51, 36, 78, NULL, '3.2', NULL, 'black', '2022-09-06'),
(189, 10, 60, 37, 82, NULL, '8.2', NULL, 'blue', '2022-09-06'),
(190, 10, 63, 38, 82, NULL, '8.2', NULL, 'blue', '2022-09-06'),
(191, 10, 67, 39, 82, NULL, '8.2', NULL, 'blue', '2022-09-06'),
(192, 10, 61, 40, 95, NULL, '19.4', NULL, 'blue', '2022-09-06'),
(193, 10, 62, 41, 93, NULL, '17.7', NULL, 'blue', '2022-09-06'),
(194, 10, 64, 42, 85, NULL, '10.8', NULL, 'blue', '2022-09-06'),
(195, 10, 65, 43, 85, NULL, '10.8', NULL, 'blue', '2022-09-06'),
(196, 10, 66, 44, 87, NULL, '12.5', NULL, 'blue', '2022-09-06'),
(197, 10, 68, 45, 80, NULL, '4.9', NULL, 'black', '2022-09-06'),
(198, 10, 69, 46, 90, NULL, '15.1', NULL, 'blue', '2022-09-06'),
(200, 10, 72, 47, 80, NULL, '6.5', NULL, 'blue', '2022-09-06'),
(201, 10, 70, 48, 102, NULL, '25.4', NULL, 'blue', '2022-09-06'),
(202, 10, 71, 49, 89, NULL, '14.2', NULL, 'blue', '2022-09-06'),
(203, 10, 73, 50, 88, NULL, '13.4', NULL, 'blue', '2022-09-06'),
(204, 10, 74, 51, 94, NULL, '18.5', NULL, 'blue', '2022-09-06'),
(205, 10, 75, 52, 76, NULL, '1.5', NULL, 'black', '2022-09-06'),
(206, 10, 77, 53, 86, NULL, '11.6', NULL, 'blue', '2022-09-06'),
(207, 10, 78, 54, 89, NULL, '14.2', NULL, 'blue', '2022-09-06'),
(209, 10, 76, 56, 99, NULL, '25.1', NULL, 'white', '2022-09-06'),
(210, 10, 80, 57, 95, NULL, '19.4', NULL, 'blue', '2022-09-06'),
(211, 10, 79, 58, 92, NULL, '16.8', NULL, 'blue', '2022-09-06'),
(212, 10, 92, 55, 78, NULL, '4.7', NULL, 'blue', '2022-09-06'),
(213, 10, 82, 59, 96, NULL, '22.4', NULL, 'white', '2022-09-06'),
(214, 10, 83, 60, 106, NULL, '28.9', NULL, 'blue', '2022-09-06'),
(215, 10, 85, 61, 98, NULL, '22.0', NULL, 'blue', '2022-09-06'),
(217, 10, 87, 63, 99, NULL, '22.9', NULL, 'blue', '2022-09-06'),
(218, 10, 81, 64, 81, NULL, '7.3', NULL, 'blue', '2022-09-06'),
(219, 10, 84, 65, 93, NULL, '17.7', NULL, 'blue', '2022-09-06'),
(220, 10, 88, 66, 90, NULL, '15.1', NULL, 'blue', '2022-09-06'),
(221, 10, 57, 67, 97, NULL, '23.3', NULL, 'white', '2022-09-06'),
(222, 10, 93, 68, 89, NULL, '14.2', NULL, 'blue', '2022-09-06'),
(223, 11, 93, 68, 88, NULL, '13.9', NULL, 'blue', '2022-09-27'),
(224, 8, 93, 68, 89, NULL, '13.5', NULL, 'blue', '2022-08-30'),
(225, 11, 94, 8, 110, NULL, '35.2', NULL, 'white', '2022-09-27'),
(226, 10, 94, 62, 106, NULL, '31.3', NULL, 'white', '2022-09-06'),
(227, 8, 94, 65, 108, NULL, '31.8', NULL, 'white', '2022-08-30'),
(228, 11, 98, 69, 83, NULL, '9.6', NULL, 'blue', '2022-09-27'),
(229, 10, 98, 69, 93, NULL, '17.7', NULL, 'blue', '2022-09-06'),
(230, 8, 98, 69, 98, NULL, '20.8', NULL, 'blue', '2022-08-30'),
(320, 35, 94, 25, NULL, NULL, '0.0', NULL, NULL, '2023-03-30'),
(321, 35, 76, 26, NULL, NULL, '0.0', NULL, NULL, '2023-03-30'),
(345, 35, 28, 0, NULL, 0, '0.0', '6.3', NULL, '2023-06-15'),
(346, 35, 31, 4, NULL, 0, '0.0', '8.4', NULL, '2023-06-15'),
(347, 35, 29, 8, NULL, NULL, '0.0', NULL, NULL, '2023-03-30'),
(348, 35, 21, 12, NULL, 0, '0.0', '6.8', NULL, '2023-06-15'),
(349, 35, 23, 16, NULL, NULL, '0.0', NULL, NULL, '2023-03-30'),
(350, 35, 22, 17, NULL, NULL, '0.0', NULL, NULL, '2023-03-30'),
(351, 35, 24, 18, NULL, 0, '0.0', '27.7', NULL, '2023-06-15'),
(352, 35, 68, 13, NULL, NULL, '0.0', NULL, NULL, '2023-03-30'),
(353, 35, 40, 14, NULL, 0, '0.0', '10.5', NULL, '2023-06-15'),
(357, 35, 53, 15, NULL, 0, '0.0', '9.2', NULL, '2023-06-15'),
(359, 35, 47, 9, NULL, NULL, '0.0', NULL, NULL, '2023-03-30'),
(361, 35, 77, 3, NULL, NULL, '0.0', NULL, NULL, '2023-03-30'),
(366, 35, 46, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(368, 35, 49, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(369, 35, 36, 5, NULL, 0, '0.0', '17.1', NULL, '2023-06-15'),
(371, 35, 83, 7, NULL, 0, '0.0', '11.2', NULL, '2023-06-15'),
(373, 37, 95, 1, 93, NULL, '18.4', NULL, 'blue', '2023-04-20'),
(374, 37, 96, 2, 103, NULL, '26.8', NULL, 'blue', '2023-04-20'),
(375, 37, 83, 12, 95, NULL, '20.1', NULL, 'blue', '2023-04-20'),
(376, 37, 21, 0, 81, NULL, '8.3', NULL, 'blue', '2023-04-20'),
(377, 37, 40, 4, 91, NULL, '16.7', NULL, 'blue', '2023-04-20'),
(379, 37, 97, 5, 107, NULL, '30.2', NULL, 'blue', '2023-04-20'),
(380, 37, 36, 3, 98, NULL, '26.8', NULL, 'white', '2023-04-20'),
(381, 37, 28, 6, 93, NULL, '18.4', NULL, 'blue', '2023-04-20'),
(382, 37, 24, 7, 106, NULL, '29.3', NULL, 'blue', '2023-04-20'),
(383, 37, 98, 8, 103, NULL, '26.8', NULL, 'blue', '2023-04-20'),
(384, 37, 31, 9, 99, NULL, '27.7', NULL, 'white', '2023-04-20'),
(385, 37, 88, 10, 91, NULL, '16.7', NULL, 'blue', '2023-04-20'),
(388, 37, 53, 11, 92, NULL, '17.5', NULL, 'blue', '2023-04-20'),
(389, 37, 82, 13, 99, NULL, '23.4', NULL, 'blue', '2023-04-20'),
(390, 37, 37, 14, 91, NULL, '16.7', NULL, 'blue', '2023-04-20'),
(394, 37, 100, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(399, 12, 53, 0, NULL, 0, '0.0', '9.2', NULL, '2023-05-02'),
(402, 12, 98, 9, NULL, 0, '0.0', '13.1', NULL, '2023-05-02'),
(403, 12, 36, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(411, 12, 100, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(413, 12, 37, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(414, 12, 29, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(415, 13, 21, 0, NULL, 0, '0.0', '6.8', NULL, '2023-05-09'),
(418, 12, 76, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(421, 12, 88, 10, NULL, NULL, NULL, NULL, NULL, NULL);

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
(116, 14, 1, 12, 0),
(211, 301, 98, 228, 1),
(212, 301, 98, 236, 1),
(213, 301, 98, 229, 0),
(214, 301, 98, 230, 0),
(215, 292, 94, 226, 1),
(216, 292, 94, 237, 1),
(217, 292, 94, 227, 0),
(218, 292, 94, 225, 0),
(223, 275, 81, 218, 1),
(224, 275, 81, 261, 1),
(225, 275, 81, 75, 0),
(226, 275, 81, 108, 0),
(231, 294, 79, 260, 1),
(232, 294, 79, 73, 1),
(233, 294, 79, 86, 0),
(234, 294, 79, 211, 0),
(267, 297, 63, 262, 1),
(268, 297, 63, 190, 1),
(269, 297, 63, 83, 0),
(270, 297, 63, 57, 0),
(275, 290, 46, 176, 1),
(276, 290, 46, 40, 1),
(277, 290, 46, 130, 0),
(278, 290, 46, 256, 0),
(279, 291, 37, 103, 1),
(280, 291, 37, 32, 1),
(281, 291, 37, 168, 0),
(282, 291, 37, 251, 0),
(283, 280, 34, 233, 1),
(284, 280, 34, 164, 1),
(285, 280, 34, 28, 0),
(286, 280, 34, 142, 0),
(287, 289, 29, 100, 1),
(288, 289, 29, 24, 1),
(289, 289, 29, 160, 0),
(290, 289, 29, 253, 0),
(291, 285, 28, 252, 1),
(292, 285, 28, 102, 1),
(293, 285, 28, 23, 0),
(294, 285, 28, 159, 0),
(335, 267, 72, 66, 1),
(336, 267, 72, 200, 1),
(337, 267, 72, 94, 0),
(338, 267, 72, 244, 0),
(339, 270, 92, 242, 1),
(340, 270, 92, 136, 1),
(341, 270, 92, 212, 0),
(342, 270, 92, 135, 0),
(343, 284, 51, 239, 1),
(344, 284, 51, 188, 1),
(345, 284, 51, 112, 0),
(346, 284, 51, 45, 0),
(363, 268, 26, 243, 1),
(364, 268, 26, 132, 1),
(365, 268, 26, 22, 0),
(366, 268, 26, 157, 0),
(371, 281, 68, 197, 1),
(372, 281, 68, 62, 1),
(373, 281, 68, 277, 0),
(374, 281, 68, 113, 0),
(387, 309, 21, 234, 1),
(388, 309, 21, 18, 1),
(389, 309, 21, 120, 0),
(390, 309, 21, 154, 0),
(403, 300, 67, 246, 1),
(404, 300, 67, 61, 1),
(405, 300, 67, 191, 0),
(406, 300, 67, 101, 0),
(407, 269, 68, 197, 1),
(408, 269, 68, 62, 1),
(409, 269, 68, 277, 0),
(410, 269, 68, 113, 0),
(411, 274, 98, 228, 1),
(412, 274, 98, 236, 1),
(413, 274, 98, 229, 0),
(414, 274, 98, 230, 0),
(415, 273, 63, 262, 1),
(416, 273, 63, 190, 1),
(417, 273, 63, 83, 0),
(418, 273, 63, 57, 0),
(419, 271, 67, 246, 1),
(420, 271, 67, 61, 1),
(421, 271, 67, 191, 0),
(422, 271, 67, 101, 0),
(423, 276, 79, 260, 1),
(424, 276, 79, 73, 1),
(425, 276, 79, 86, 0),
(426, 276, 79, 211, 0),
(443, 395, 28, 102, 1),
(444, 395, 28, 23, 1),
(445, 395, 28, 159, 0),
(446, 395, 28, 381, 0),
(455, 387, 40, 35, 1),
(456, 387, 40, 171, 1),
(457, 387, 40, 123, 0),
(458, 387, 40, 377, 0),
(463, 386, 21, 18, 1),
(464, 386, 21, 120, 1),
(465, 386, 21, 376, 0),
(466, 386, 21, 154, 0),
(471, 369, 36, 167, 1),
(472, 369, 36, 119, 1),
(473, 369, 36, 30, 0),
(474, 369, 36, 380, 0),
(475, 397, 82, 90, 1),
(476, 397, 82, 213, 1),
(477, 397, 82, 389, 0),
(478, 397, 82, 76, 0),
(479, 371, 83, 375, 1),
(480, 371, 83, 77, 1),
(481, 371, 83, 214, 0),
(482, 371, 83, 107, 0),
(483, 399, 53, 388, 1),
(484, 399, 53, 47, 1),
(485, 399, 53, 182, 0),
(486, 399, 53, 97, 0),
(487, 357, 53, 388, 1),
(488, 357, 53, 47, 1),
(489, 357, 53, 182, 0),
(490, 357, 53, 97, 0),
(491, 400, 88, 220, 1),
(492, 400, 88, 95, 1),
(493, 400, 88, 385, 0),
(494, 400, 88, 80, 0),
(495, 346, 31, 384, 1),
(496, 346, 31, 150, 1),
(497, 346, 31, 162, 0),
(498, 346, 31, 27, 0),
(515, 351, 24, 155, 1),
(516, 351, 24, 19, 1),
(517, 351, 24, 382, 0),
(518, 351, 24, 140, 0),
(523, 402, 98, 228, 1),
(524, 402, 98, 229, 1),
(525, 402, 98, 230, 0),
(526, 402, 98, 383, 0),
(527, 396, 40, 35, 1),
(528, 396, 40, 171, 1),
(529, 396, 40, 123, 0),
(530, 396, 40, 377, 0),
(535, 416, 82, 90, 1),
(536, 416, 82, 213, 1),
(537, 416, 82, 389, 0),
(538, 416, 82, 76, 0),
(539, 409, 28, 102, 1),
(540, 409, 28, 23, 1),
(541, 409, 28, 159, 0),
(542, 409, 28, 381, 0),
(555, 415, 21, 18, 1),
(556, 415, 21, 120, 1),
(557, 415, 21, 376, 0),
(558, 415, 21, 154, 0),
(559, 348, 21, 18, 1),
(560, 348, 21, 120, 1),
(561, 348, 21, 376, 0),
(562, 348, 21, 154, 0),
(567, 345, 28, 102, 1),
(568, 345, 28, 23, 1),
(569, 345, 28, 159, 0),
(570, 345, 28, 381, 0),
(571, 353, 40, 35, 1),
(572, 353, 40, 171, 1),
(573, 353, 40, 123, 0),
(574, 353, 40, 377, 0);

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
(21, 2, '6.8'),
(24, 2, '27.7'),
(28, 2, '6.3'),
(31, 2, '18.0'),
(36, 2, '17.1'),
(37, 2, '12.3'),
(40, 2, '10.5'),
(53, 2, '17.6'),
(82, 2, '21.3'),
(83, 2, '20.8'),
(88, 2, '15.1'),
(98, 2, '13.1');

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
(841, 36, 167, 1),
(842, 36, 119, 1),
(843, 36, 30, 0),
(844, 36, 380, 0),
(845, 37, 103, 1),
(846, 37, 32, 1),
(847, 37, 168, 0),
(848, 37, 390, 0),
(853, 83, 375, 1),
(854, 83, 77, 1),
(855, 83, 214, 0),
(856, 83, 107, 0),
(857, 53, 388, 1),
(858, 53, 47, 1),
(859, 53, 182, 0),
(860, 53, 97, 0),
(869, 31, 150, 1),
(870, 31, 162, 1),
(871, 31, 27, 0),
(872, 31, 384, 0),
(889, 24, 155, 1),
(890, 24, 19, 1),
(891, 24, 382, 0),
(892, 24, 140, 0),
(897, 98, 228, 1),
(898, 98, 229, 1),
(899, 98, 230, 0),
(900, 98, 383, 0),
(905, 88, 220, 1),
(906, 88, 95, 1),
(907, 88, 385, 0),
(908, 88, 80, 0),
(921, 21, 18, 1),
(922, 21, 120, 1),
(923, 21, 376, 0),
(924, 21, 154, 0),
(933, 28, 102, 1),
(934, 28, 23, 1),
(935, 28, 159, 0),
(936, 28, 381, 0),
(937, 82, 90, 1),
(938, 82, 213, 1),
(939, 82, 389, 0),
(940, 82, 76, 0),
(941, 40, 35, 1),
(942, 40, 171, 1),
(943, 40, 123, 0),
(944, 40, 377, 0);

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
(1, '<table><tbody><tr class=\"ue-table-interlace-color-single firstRow\"><td width=\"218\" align=\"left\" valign=\"bottom\" style=\"word-break: break-all;\"><strong>赞助活动</strong></td><td width=\"350\" align=\"left\" valign=\"bottom\" style=\"word-break: break-all;\"><strong>赞助内容</strong></td><td width=\"282\" align=\"left\" valign=\"bottom\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><strong>赞助商名称或网址</strong></td></tr><tr><td width=\"214\" valign=\"top\" rowspan=\"1\" colspan=\"1\"><br/></td><td width=\"350\" valign=\"top\" rowspan=\"1\" colspan=\"1\"><br/></td><td width=\"282\" valign=\"top\" rowspan=\"1\" colspan=\"1\"><br/></td></tr><tr><td valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><p><strong><span style=\"font-size: 18px;\">23年5月赛</span></strong></p><p><strong><span style=\"font-size: 18px;\">庞海福会长杯</span></strong></p></td><td valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><p><span style=\"font-size: 16px;\">郜鸿 $500</span></p><p><span style=\"font-size: 16px;\">赵满 $500</span></p><p>Jim Wang $300<br/></p><p><span style=\"font-size: 16px;\">Kevin Yang $300</span></p><p><span style=\"font-size: 16px;\">Joseph Pang $300</span></p><p><span style=\"font-size: 16px;\">罗川 捞球器5个</span></p><p><span style=\"color: rgb(0, 112, 192); font-size: 16px;\">义工: 罗川, Jim Wang, Kevin Yang</span><br/></p></td><td valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><p><span style=\"text-decoration:underline;\"><span style=\"color:#000120\"></span></span><br/></p><p><br/></p></td></tr><tr><td width=\"206\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><p><strong><span style=\"font-size: 18px;\">22年9月年赛</span></strong><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p></td><td width=\"346\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><p><span style=\"font-size: 16px;\">李灏琨 $1000</span></p><p><span style=\"font-size: 16px;\">柴钢 $1000</span></p><p><span style=\"font-size: 16px;\">冉光 $1000 和高球伞2把</span></p><p><span style=\"font-size: 16px;\">Tony王/ Hanri刘 年赛纪念品</span></p></td><td width=\"274\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><br/></td></tr><tr><td width=\"206\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><strong><span style=\"font-size: 18px;\">22年8月赛</span></strong></td><td width=\"346\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><p><span style=\"font-size: 16px;\">属虎8位鹰友每人$300</span></p><p><span style=\"font-size: 16px;\">Jeffery Chi 6盒 TP5x<br/></span></p><p><span style=\"font-size: 16px;\">柴钢 $800</span></p></td><td width=\"274\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><br/></td></tr><tr><td width=\"206\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><strong><span style=\"font-size: 18px;\">22年7月赛</span></strong></td><td width=\"346\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><p><span style=\"font-size: 16px;\">John程 $1000</span></p><p><span style=\"font-size: 16px;\">Tony王 10盒 Pro V1<br/></span></p><p><span style=\"font-size: 16px;\">宋涛 6盒 Pro V1</span></p></td><td width=\"274\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><br/></td></tr><tr><td width=\"206\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><strong><span style=\"font-size: 18px;\">22年6月赛</span></strong></td><td width=\"346\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><p><span style=\"font-size: 16px;\">温群 $1000</span></p><p><span style=\"font-size: 16px;\">李明 $500</span></p><p><span style=\"font-size: 16px;\">李景涛 红酒3瓶</span><br/></p></td><td width=\"274\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><br/></td></tr><tr><td width=\"206\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><span style=\"font-size: 18px;\"><strong>22年5月赛</strong></span></td><td width=\"346\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><p>张纪贵 $1000</p><p>Bill Cai 10盒 Pro V1<br/></p></td><td width=\"274\" valign=\"top\" style=\"word-break: break-all;\" rowspan=\"1\" colspan=\"1\"><br/></td></tr></tbody></table><p><br/></p><p><br/></p>');

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
(1, 1, 'admin', '1-DQKR', 'Admin', 'Super', 'superadmin@gmail.com', '/upload/thumbnail/1_16781577366406a7a83b7323.70418258.jpg', '96e79218965eb72c92a549dd5a330112', '111111111', NULL, NULL, '', '2020-02-13 18:02:45', '2023-04-29 20:14:27', 1),
(21, 2, 'Youjun Lu', '21-KDWY', 'Lu', 'Youjun', 'youjunlu@gmail.com', '/upload/thumbnail/21_16783660016409d531ed8663.86944946.png', '670b14728ad9902aecba32e22fa4f6bd', '6479388919', 2, 7, '', '2023-02-03 16:58:02', '2023-04-29 07:21:07', 1),
(22, 3, 'Gang Chai', '22-HSTH', 'Chai', 'Gang', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:08:03', '2023-02-13 16:08:03', 1),
(23, 3, 'David Liang', '23-HAYD', 'Liang', 'David', 'lxmotorcars@hotmail.com', '/upload/head-default.png', '27701bd8dd141b953b94a5c9a44697c0', '4163560083', 10, 30, '', '2023-02-13 16:09:23', '2023-04-14 16:40:20', 1),
(24, 2, 'Ken Guo', '24-MFMM', 'Guo', 'Tao', 'guotao65@hotmail.com', '/upload/thumbnail/24_1678396489640a4c49594820.40698813.jpg', 'f379eaf3c831b04de153469d1bec345e', '4163181239', NULL, NULL, '', '2023-02-13 16:10:16', '2023-04-22 17:57:41', 1),
(25, 3, 'Haokun Li', '25-PQUE', 'Li', 'Haokun', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:12:16', '2023-02-13 16:12:16', 1),
(26, 3, 'Jason Fu', '26-SCHD', 'Fu', 'Gang', '', '/upload/head-default.png', '95037c8ae55ee11e53660e10116a8219', '', NULL, NULL, '', '2023-02-13 16:13:19', '2023-03-14 16:33:19', 1),
(27, 14, 'Jeff Zhang', '27-UVEP', 'Zhang', 'Zhihao', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:14:12', '2023-03-15 01:05:10', 1),
(28, 2, 'Joseph Pang', '28-EZET', 'Pang', 'Joseph', '', '/upload/thumbnail/28_16782424596407f29b890229.17832262.jpeg', 'e7e2dd03ea2a7c4b4af8fab6ab81be6e', '', NULL, NULL, '', '2023-02-13 16:15:38', '2023-04-28 19:41:37', 1),
(29, 2, 'Pei-ying Chin', '29-QMKV', 'Chin', 'Pei-ying', '99pychin@gmail.com', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '4165719238', NULL, NULL, '', '2023-02-13 16:16:38', '2023-04-24 17:22:58', 1),
(30, 2, 'Man Zhao', '30-XXSG', 'Zhao', 'Man', 'mandrewzhao@ail.com', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '6475040426', 6, 21, '', '2023-02-13 16:17:09', '2023-04-25 17:06:52', 1),
(31, 2, 'Wayne Jing', '31-JOVW', 'Jing', 'Weixing', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:17:48', '2023-04-19 16:48:42', 1),
(32, 2, 'Guang Ran', '32-SKBP', 'Ran', 'Guang', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:18:31', '2023-03-19 02:01:59', 1),
(33, 2, 'Jeffrey Chi', '33-ZKGX', 'Chi', 'Jeffrey', 'chi.jeffrey@gmail.com', '/upload/head-default.png', '08f233054747719087fb6f9f333f19ff', '4168755168', NULL, NULL, '', '2023-02-13 16:19:48', '2023-03-19 14:44:41', 1),
(34, 2, 'Yue Dai', '34-HNXY', 'Dai', 'Yue', '', '/upload/head-default.png', '8a6bd1cfe6a94c41bdb19ff8eb1d9de1', '', NULL, NULL, '', '2023-02-13 16:20:19', '2023-03-15 17:50:04', 1),
(35, 2, 'Tony Wang', '35-YTWE', 'Wang', 'Huimin(tony)', 'huiminw2003@yahoo.com', '/upload/thumbnail/35_1678447204640b1264d08400.17800868.jpg', 'e128a1305d2e6f7b84aa05d3f572c449', '4166683198', NULL, NULL, '', '2023-02-13 16:20:57', '2023-04-14 11:31:03', 1),
(36, 2, 'John Cheng', '36-MQIL', 'Cheng', 'John', 'johncheng399@gmail.com', '/upload/thumbnail/36_167917540064162ee8f15d18.52343250.jpeg', 'c9f79d1373a51807504a11dca44137f7', '4163992815', NULL, NULL, '', '2023-02-13 16:21:39', '2023-04-25 20:41:42', 1),
(37, 2, 'Dan Zhao', '37-ZISC', 'Zhao', 'Pengju', 'pengjuzhao@gmail.com', '/upload/thumbnail/37_16788910196411d80b1528c2.31829878.jpeg', '670b14728ad9902aecba32e22fa4f6bd', '4168468166', 3, 20, '', '2023-02-13 16:23:12', '2023-04-24 13:36:45', 1),
(38, 2, 'Steven Wang', '38-RNNB', 'Wang', 'Deju', '', '/upload/head-default.png', '13d24704891625d1be7dc1c00a8361ee', '', NULL, NULL, '', '2023-02-13 16:24:11', '2023-03-19 15:54:25', 1),
(39, 3, 'Ming Li', '39-EYSD', 'Li', 'Ming', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:24:59', '2023-02-13 16:24:59', 1),
(40, 2, 'Dick Li', '40-HAAD', 'Li', 'Kaidan', 'dicklikd@gmail.com', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '6479826327', NULL, NULL, '', '2023-02-13 16:25:48', '2023-04-28 19:43:27', 1),
(41, 2, 'Xuewei You', '41-QUKK', 'You', 'Xuewei', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:26:41', '2023-02-13 16:26:41', 1),
(42, 2, 'Jinhua Feng', '42-MZNO', 'Feng', 'Jinhua', '', '/upload/thumbnail/42_167919849864168922ecd067.25327056.jpeg', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:27:34', '2023-03-19 14:57:07', 1),
(43, 3, 'Dingzhen Li', '43-RVAC', 'Li', 'Dingzhen', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:29:14', '2023-02-13 16:29:14', 1),
(45, 3, 'Jack Zhang', '45-VITB', 'Zhang', 'Jack', 'zhke_ca@hotmail.com', '/upload/thumbnail/45_1678575892640d09144ce081.31648615.jpeg', '670b14728ad9902aecba32e22fa4f6bd', '4162307281', NULL, NULL, '', '2023-02-13 16:30:27', '2023-04-26 15:55:28', 1),
(46, 2, 'Jim Wang', '46-KNFO', 'Wang', 'Jinzhi', '', '/upload/head-default.png', 'e37a88c265386252c22c50fb683167d9', '', NULL, NULL, '', '2023-02-13 16:31:11', '2023-04-17 23:13:12', 1),
(47, 2, 'David Dai', '47-DSXD', 'Dai', 'David', 'david.dai89@gmail.com', '/upload/thumbnail/47_1678636575640df61f5d18c9.99734828.jpg', '08ef84145b81dcd98554b70c662c41ed', '', NULL, NULL, '', '2023-02-13 16:32:33', '2023-04-21 12:21:11', 1),
(48, 3, 'Jun Ji', '48-PEID', 'Ji', 'Jun', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:33:16', '2023-03-20 01:48:27', 1),
(49, 2, 'Kevin Yang', '49-DAFQ', 'Yang', 'Kevin', '', '/upload/head-default.png', '7981038187944e9aa77aeecc5ec26c5c', '', NULL, NULL, '', '2023-02-13 16:33:49', '2023-04-23 15:07:39', 1),
(50, 2, 'Tao Song', '50-BWBH', 'Song', 'Tao', '', '/upload/thumbnail/50_1678557577640cc1890fec95.29454010.jpg', '5cdb6cb3040178bb57389319b83fe53e', '+14164026018', 9, 26, '', '2023-02-13 16:34:24', '2023-04-25 17:06:57', 1),
(51, 3, 'Sam Fu', '51-PUUO', 'Fu', 'Sam', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:34:54', '2023-02-13 16:34:54', 1),
(52, 14, 'Xianglin Wu', '52-DEYP', 'Wu', 'Xianglin', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:35:56', '2023-02-13 16:35:56', 1),
(53, 2, 'Samson Ren', '53-JYNB', 'Ren', 'Maojing', 'samson.ren@gmail.com', '/upload/head-default.png', '32817924bd13522b25411f8b9df6a221', '6475390688', NULL, NULL, '', '2023-02-13 16:36:41', '2023-04-27 15:56:00', 1),
(54, 2, 'Louie Liu', '54-TGSY', 'Liu', 'Louie', '3028569961@qq.com', '/upload/thumbnail/54_168148336564396665ed3a57.17141969.jpeg', '670b14728ad9902aecba32e22fa4f6bd', '6472815707', 2, 25, '', '2023-02-13 16:37:27', '2023-04-14 10:33:47', 1),
(55, 3, 'Max Chen', '55-NBDD', 'Chen', 'Lirong', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:37:57', '2023-02-13 16:37:57', 1),
(56, 2, 'Max Liu', '56-YDFB', 'Liu', 'Max', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:38:38', '2023-02-13 16:38:38', 1),
(57, 2, 'Bill Li', '57-QZOV', 'Li', 'Jingtao', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:39:08', '2023-03-27 01:21:51', 1),
(58, 3, 'Zhangxian Yu', '58-MIRY', 'Yu', 'Zhangxian', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:40:08', '2023-03-15 01:07:37', 1),
(59, 14, 'Jie Luan', '59-WBOY', 'Luan', 'Jie', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:40:42', '2023-02-13 16:40:42', 1),
(60, 3, 'Wangqing Qiu', '60-ESER', 'Qiu', 'Wangqing', '', '/upload/head-default.png', 'c115831dcd882d5e0df59b1c28d15ed6', '', NULL, NULL, '', '2023-02-13 16:41:35', '2023-03-19 14:45:23', 1),
(61, 2, 'Bob Liu', '61-PONK', 'Liu', 'Bob', 'bonelyldouble@yahoo.com', '/upload/thumbnail/61_167825281964081b13401746.21096701.jpg', '670b14728ad9902aecba32e22fa4f6bd', '14168959317', NULL, NULL, '', '2023-02-13 16:42:08', '2023-03-19 06:14:24', 1),
(62, 2, 'Kevin Wu', '62-OTTW', 'Wu', 'Kuidou', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:42:52', '2023-02-13 16:42:52', 1),
(63, 3, 'Bill Cai', '63-GIQK', 'Cai', 'Tianyu', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:43:28', '2023-02-13 16:43:28', 1),
(64, 3, 'Jun Du', '64-UCIB', 'Du', 'Jun', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:44:01', '2023-02-13 16:44:01', 1),
(65, 3, 'Jigui Zhang', '65-GVWJ', 'Zhang', 'Jigui', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:44:44', '2023-02-13 16:44:44', 1),
(66, 14, 'Dylan Xu', '66-UYUR', 'Xu', 'Jixiao', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:45:45', '2023-02-13 16:45:45', 1),
(67, 3, 'Patrick Wen', '67-DMNY', 'Wen', 'Qun', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:46:21', '2023-02-13 16:46:21', 1),
(68, 2, 'Jason Yu', '68-BRSJ', 'Yu', 'Xuechen', 'jason_xuechen@hotmail.com', '/upload/thumbnail/68_16788401906411117e934c22.48880726.jpeg', '32450ea0c062d306939801b9ee7a017d', '6476806136', 5, 10, '', '2023-02-13 16:47:01', '2023-03-19 12:58:19', 1),
(69, 2, 'Hanri Liu', '69-YBYX', 'Liu', 'Guoqiang', 'guoqiangliu2020@gmail.com', '/upload/thumbnail/69_167919126264166cde10bed5.68060389.jpg', '670b14728ad9902aecba32e22fa4f6bd', '4168333516', NULL, NULL, '', '2023-02-13 16:47:38', '2023-03-18 23:40:59', 1),
(70, 14, 'William Wang', '70-LQDI', 'Wang', 'William', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:48:35', '2023-02-13 16:48:35', 1),
(71, 14, 'James Li', '71-AREZ', 'Li', 'Yifeng', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:49:16', '2023-02-13 16:49:16', 1),
(72, 2, 'Jacky Hu', '72-GTHR', 'Hu', 'Jacky', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:50:06', '2023-02-13 16:50:06', 1),
(73, 3, 'Leo Liu', '73-CCUA', 'Liu', 'Zhi', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:50:37', '2023-02-13 16:50:37', 1),
(74, 3, 'Nixon Chen', '74-JULV', 'Chen', 'Nixon', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:52:57', '2023-02-13 16:52:57', 1),
(75, 3, 'Qiang Chen', '75-IIAL', 'Chen', 'Qiang', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:53:41', '2023-02-13 16:53:41', 1),
(76, 2, 'Sean Hu', '76-JMOH', 'Hu', 'Shang', '', '/upload/thumbnail/76_1682698963644bf2d3548ac0.31264721.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 16:54:24', '2023-04-27 19:46:42', 1),
(77, 2, 'Chuan Luo', '77-UKFR', 'Luo', 'Chuan', '828282luo@gmail.com', '/upload/thumbnail/77_1678740349640f8b7d394847.55617323.jpg', '590168cb4ccd387618fbb1415604b131', '', 2, 15, '', '2023-02-13 16:56:18', '2023-04-29 15:29:39', 1),
(78, 3, 'Riyong Lin', '78-KUSP', 'Lin', 'Riyong', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:56:56', '2023-02-13 16:56:56', 1),
(79, 3, 'Charlie Lin', '79-GYAA', 'Lin', 'Charlie', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:57:59', '2023-02-13 16:57:59', 1),
(80, 3, 'Mark Zhang', '80-RJOY', 'Zhang', 'Jun', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 16:58:53', '2023-02-13 16:58:53', 1),
(81, 2, 'Ray Sun', '81-OAOK', 'Sun', 'Ray', 'raysun1203@gmail.com', '/upload/head-default.png', '610dda942b0e0b0e68c41f80615eb3f3', '4168331661', 12, 3, '', '2023-02-13 17:00:18', '2023-04-14 23:18:29', 1),
(82, 2, 'Hong Gao', '82-CITF', 'Gao', 'Hong', 'gao60hong@gmail.com', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '6479040363', NULL, NULL, '', '2023-02-13 17:00:56', '2023-04-29 14:04:49', 1),
(83, 2, 'Raymond Xu', '83-RULP', 'Xu', 'Raymond', 'raymondxuwen@gmail.com', '/upload/thumbnail/83_167821371664078254ed7650.42293305.jpeg', '670b14728ad9902aecba32e22fa4f6bd', '4168768999', NULL, NULL, '', '2023-02-13 17:01:57', '2023-04-19 23:38:40', 1),
(84, 2, 'Jun Li', '84-DXFJ', 'Li', 'Jun', 'lj220818@gmail.com', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '7786688587', NULL, NULL, '', '2023-02-13 17:02:33', '2023-03-13 18:39:57', 1),
(85, 2, 'Wen Ye', '85-EGVF', 'Ye', 'Wen', '', '/upload/head-default.png', '96e79218965eb72c92a549dd5a330112', '', NULL, NULL, '', '2023-02-13 17:04:20', '2023-02-13 17:04:20', 1),
(87, 2, 'Yaodong', '87-PJAC', 'Xu', 'Yaodong', 'xyd741218@126.com', '/upload/thumbnail/87_167924076864172e407dd8f3.91407394.jpeg', 'def00389483226bbd0e70c59cef26adc', '13825207958', 12, 18, '', '2023-02-13 17:05:27', '2023-03-28 23:38:59', 1),
(88, 2, 'Kaixian Li', '88-XVWA', 'Li', 'Kaixian', 'firstlkx@aliyun.com', '/upload/thumbnail/88_1680792308642edaf4573267.46442854.JPG', 'e749cfc8710c27a96b96eb3b273b2423', '3067722555', 5, 23, '', '2023-02-13 17:07:13', '2023-04-28 15:13:16', 1),
(92, 3, 'Kevin Liang', '92-QWPR', 'Liang', 'Kevin', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 21:39:38', '2023-02-13 21:39:38', 1),
(93, 2, 'Alex Yao', '93-VCGS', 'Yao', 'Alex', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-13 23:26:19', '2023-04-05 20:49:27', 1),
(94, 2, 'Jing Qian', '94-MGRP', 'Qian', 'Jing', 'justin.qian@qianjing2017.com', '/upload/thumbnail/94_16788422666411199a7c33f1.02528650.jpg', 'f97ba5c5e13ca33c86a3133fa1b84249', '4372629666', NULL, NULL, '', '2023-02-13 23:47:26', '2023-03-24 01:20:47', 1),
(95, 2, 'JingChen', '95-RIGH', 'Chen', 'Jing', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-02-14 01:19:39', '2023-04-29 13:52:18', 1),
(96, 3, 'EricDing', '96-KUFN', 'Ding', 'Eric', 'dingchen1122@hotmail.com', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '6479728383', 1, 15, '', '2023-02-14 01:20:19', '2023-04-28 20:14:07', 1),
(97, 2, 'Michael Lee', '97-JYTQ', 'Lee', 'Michael', 'mshlee06@gmail.com', '/upload/head-default.png', '66214c8e009aec77965dc81b11c0bff9', '4162303529', 9, 15, '', '2023-02-14 01:20:48', '2023-04-27 00:59:16', 1),
(98, 2, 'Sheriden Huang', '98-ZMIC', 'Huang', 'Sheriden', 'sheridenhuang@gmail.com', '/upload/thumbnail/98_1681799426643e390298b841.46320162.jpg', 'a6f6e63edf7cc991055abaedbeb35304', '4168236899', 4, 20, '', '2023-02-14 15:49:44', '2023-04-24 13:23:02', 1),
(99, 3, 'Peter Pan', '99-LITV', 'Pan', 'Wentang', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-03-18 00:38:01', '2023-03-19 05:53:33', 1),
(100, 15, 'Guest 1', '100-PTOW', 'Wang', 'G1', '', '/upload/head-default.png', '670b14728ad9902aecba32e22fa4f6bd', '', NULL, NULL, '', '2023-04-16 14:54:43', '2023-04-16 14:54:43', 1);

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
(1, '管理员', '{\"SYSTEM_SETTING\":6,\"USER\":30,\"EVENT\":62,\"PHOTO\":30,\"SPONSOR\":2,\"RANK\":2,\"ANNOUNCE\":2}', 1),
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
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`article_category_id`);

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
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `article_category`
--
ALTER TABLE `article_category`
  MODIFY `article_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `file_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `participant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT for table `participant_history`
--
ALTER TABLE `participant_history`
  MODIFY `participant_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=575;

--
-- AUTO_INCREMENT for table `rank_history`
--
ALTER TABLE `rank_history`
  MODIFY `rank_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=945;

--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `sponsor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
