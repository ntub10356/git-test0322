/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : 0317-討論後修改

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2018-03-19 21:27:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `cardNo` int(11) NOT NULL,
  `memNo` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `treeID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `treeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `treePic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weather` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mood` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `impression` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cardNo`),
  KEY `memNo` (`memNo`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`memNo`) REFERENCES `tmember` (`memNo`),
  CONSTRAINT `card_ibfk_2` FOREIGN KEY (`memNo`) REFERENCES `smember` (`memNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of card
-- ----------------------------

-- ----------------------------
-- Table structure for cfstep
-- ----------------------------
DROP TABLE IF EXISTS `cfstep`;
CREATE TABLE `cfstep` (
  `CFstepNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `classFileNo` int(11) DEFAULT NULL,
  `stepNo` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `word` text COLLATE utf8_unicode_ci,
  `pic/vid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CFstepNo`),
  KEY `classFileNo` (`classFileNo`),
  CONSTRAINT `cfstep_ibfk_1` FOREIGN KEY (`classFileNo`) REFERENCES `classfile` (`classFileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cfstep
-- ----------------------------

-- ----------------------------
-- Table structure for cfvid
-- ----------------------------
DROP TABLE IF EXISTS `cfvid`;
CREATE TABLE `cfvid` (
  `CFvidNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `classFileNo` int(11) DEFAULT NULL,
  `word` text COLLATE utf8_unicode_ci,
  `video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CFvidNo`),
  KEY `classFileNo` (`classFileNo`),
  CONSTRAINT `cfvid_ibfk_1` FOREIGN KEY (`classFileNo`) REFERENCES `classfile` (`classFileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cfvid
-- ----------------------------

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classNo` int(255) NOT NULL AUTO_INCREMENT,
  `memNo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagNo` int(11) DEFAULT NULL,
  `className` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`classNo`),
  KEY `發起人編號` (`memNo`) USING BTREE,
  KEY `tagNo` (`tagNo`),
  CONSTRAINT `class_ibfk_3` FOREIGN KEY (`memNo`) REFERENCES `tmember` (`memNo`),
  CONSTRAINT `class_ibfk_4` FOREIGN KEY (`tagNo`) REFERENCES `coursetag` (`tagNo`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('101', 'FB003', null, '五專一數學', null, null);
INSERT INTO `class` VALUES ('102', 'FB003', null, '五專二數學', null, null);
INSERT INTO `class` VALUES ('103', 'FB003', null, '五專三數學', null, null);
INSERT INTO `class` VALUES ('104', 'FB005', null, '五專四數學', null, null);
INSERT INTO `class` VALUES ('105', 'FB005', null, '五專五數學', null, null);
INSERT INTO `class` VALUES ('201', 'FB005', null, '二技一數學', null, null);

-- ----------------------------
-- Table structure for classfile
-- ----------------------------
DROP TABLE IF EXISTS `classfile`;
CREATE TABLE `classfile` (
  `classFileNo` int(255) NOT NULL AUTO_INCREMENT,
  `classNo` int(255) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `word` text COLLATE utf8_unicode_ci,
  `datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`classFileNo`),
  KEY `課程編號` (`classNo`),
  CONSTRAINT `classfile_ibfk_1` FOREIGN KEY (`classNo`) REFERENCES `class` (`classNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of classfile
-- ----------------------------
INSERT INTO `classfile` VALUES ('1', '101', 'P.10~20', null, null, null);
INSERT INTO `classfile` VALUES ('2', '102', 'P.10~20', null, null, null);
INSERT INTO `classfile` VALUES ('3', '103', 'P.10~20', null, null, null);
INSERT INTO `classfile` VALUES ('4', '104', 'P.10~20', null, null, null);
INSERT INTO `classfile` VALUES ('5', '105', 'P.10~20', null, null, null);
INSERT INTO `classfile` VALUES ('6', '201', 'P.10~20', null, null, null);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentNo` int(255) NOT NULL AUTO_INCREMENT,
  `classFileNo` int(11) DEFAULT NULL,
  `memNo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comWord` text COLLATE utf8_unicode_ci,
  `comPic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentNo`),
  KEY `發問者` (`memNo`) USING BTREE,
  KEY `classFileNo` (`classFileNo`),
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`classFileNo`) REFERENCES `classfile` (`classFileNo`),
  CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`memNo`) REFERENCES `smember` (`memNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', null, 'FB001', null, null, null);
INSERT INTO `comment` VALUES ('2', null, 'FB002', null, null, null);
INSERT INTO `comment` VALUES ('3', null, 'FB004', null, null, null);
INSERT INTO `comment` VALUES ('4', null, 'FB004', null, null, null);

-- ----------------------------
-- Table structure for coursetag
-- ----------------------------
DROP TABLE IF EXISTS `coursetag`;
CREATE TABLE `coursetag` (
  `tagNo` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tagNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of coursetag
-- ----------------------------
INSERT INTO `coursetag` VALUES ('1', '數學一');
INSERT INTO `coursetag` VALUES ('2', '數學二');

-- ----------------------------
-- Table structure for diacontent
-- ----------------------------
DROP TABLE IF EXISTS `diacontent`;
CREATE TABLE `diacontent` (
  `pageNo` int(255) NOT NULL AUTO_INCREMENT,
  `diaNo` int(11) DEFAULT NULL,
  `conTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` text COLLATE utf8_unicode_ci,
  `conPic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conPost` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是/否',
  `datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pageNo`),
  KEY `daiNo` (`diaNo`),
  CONSTRAINT `diacontent_ibfk_1` FOREIGN KEY (`diaNo`) REFERENCES `diary` (`diaNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of diacontent
-- ----------------------------

-- ----------------------------
-- Table structure for diary
-- ----------------------------
DROP TABLE IF EXISTS `diary`;
CREATE TABLE `diary` (
  `diaNo` int(11) NOT NULL AUTO_INCREMENT,
  `memNo` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diaDate` date DEFAULT NULL,
  `diaTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diaPic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`diaNo`),
  KEY `memNo` (`memNo`),
  CONSTRAINT `diary_ibfk_1` FOREIGN KEY (`memNo`) REFERENCES `tmember` (`memNo`),
  CONSTRAINT `diary_ibfk_2` FOREIGN KEY (`memNo`) REFERENCES `smember` (`memNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of diary
-- ----------------------------

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `hwNo` int(11) NOT NULL AUTO_INCREMENT,
  `classFileNo` int(11) DEFAULT NULL,
  `pic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `describe` text COLLATE utf8_unicode_ci,
  `datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`hwNo`),
  KEY `classFileNo` (`classFileNo`),
  CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`classFileNo`) REFERENCES `classfile` (`classFileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of homework
-- ----------------------------

-- ----------------------------
-- Table structure for hwans
-- ----------------------------
DROP TABLE IF EXISTS `hwans`;
CREATE TABLE `hwans` (
  `hwAnsNo` int(11) NOT NULL AUTO_INCREMENT,
  `hwNo` int(11) DEFAULT NULL,
  `memNo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `word` text COLLATE utf8_unicode_ci,
  `pic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`hwAnsNo`),
  KEY `hwNo` (`hwNo`),
  KEY `memNo` (`memNo`),
  CONSTRAINT `hwans_ibfk_1` FOREIGN KEY (`hwNo`) REFERENCES `homework` (`hwNo`),
  CONSTRAINT `hwans_ibfk_2` FOREIGN KEY (`memNo`) REFERENCES `joinclass` (`memNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hwans
-- ----------------------------

-- ----------------------------
-- Table structure for joinclass
-- ----------------------------
DROP TABLE IF EXISTS `joinclass`;
CREATE TABLE `joinclass` (
  `joinClassNo` int(255) NOT NULL AUTO_INCREMENT,
  `memNo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classNo` int(255) DEFAULT NULL,
  `joinDate` date DEFAULT NULL,
  `result` float(255,0) DEFAULT NULL,
  `feedback` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`joinClassNo`),
  KEY `課程編號` (`classNo`),
  KEY `joinclass_ibfk_3` (`memNo`),
  CONSTRAINT `joinclass_ibfk_3` FOREIGN KEY (`memNo`) REFERENCES `smember` (`memNo`),
  CONSTRAINT `joinclass_ibfk_4` FOREIGN KEY (`classNo`) REFERENCES `class` (`classNo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of joinclass
-- ----------------------------
INSERT INTO `joinclass` VALUES ('6', null, '201', null, null, null);

-- ----------------------------
-- Table structure for response
-- ----------------------------
DROP TABLE IF EXISTS `response`;
CREATE TABLE `response` (
  `responseNo` int(255) NOT NULL AUTO_INCREMENT,
  `commentNo` int(255) DEFAULT NULL,
  `memNo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resWord` text COLLATE utf8_unicode_ci,
  `resPic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`responseNo`),
  KEY `問題編號` (`commentNo`) USING BTREE,
  KEY `解答者` (`memNo`) USING BTREE,
  CONSTRAINT `response_ibfk_2` FOREIGN KEY (`commentNo`) REFERENCES `comment` (`commentNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of response
-- ----------------------------
INSERT INTO `response` VALUES ('1', '1', 'FB003', null, null, null);
INSERT INTO `response` VALUES ('2', '2', 'FB003', null, null, null);
INSERT INTO `response` VALUES ('3', '3', 'FB004', null, null, null);
INSERT INTO `response` VALUES ('4', '4', 'FB005', null, null, null);

-- ----------------------------
-- Table structure for smember
-- ----------------------------
DROP TABLE IF EXISTS `smember`;
CREATE TABLE `smember` (
  `memNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `memName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memPhone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memPic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memSchool` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sGrade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`memNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of smember
-- ----------------------------
INSERT INTO `smember` VALUES ('FB001', '陳小昱', '10356001@ntub.edu.tw', '0912345678', 'student', null, null, null);
INSERT INTO `smember` VALUES ('FB002', '謝小齊', '10356004@ntub.edu.tw', '0912654346', 'student', null, null, null);
INSERT INTO `smember` VALUES ('FB003', '藍大謙', '10356005@ntub.edu.tw', '0987878787', 'teacher', null, null, null);
INSERT INTO `smember` VALUES ('FB004', '王小宇', '10356006@ntub.edu.tw', '0966694666', 'student', null, null, null);
INSERT INTO `smember` VALUES ('FB005', '侯大庭', '10356007@ntub.edu.tw', '0977778888', 'teacher', null, null, null);

-- ----------------------------
-- Table structure for sresult
-- ----------------------------
DROP TABLE IF EXISTS `sresult`;
CREATE TABLE `sresult` (
  `sResultNo` int(11) NOT NULL AUTO_INCREMENT,
  `hwAnsNo` int(11) DEFAULT NULL,
  `result` float(255,0) DEFAULT NULL,
  `feedback` text COLLATE utf8_unicode_ci,
  `datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sResultNo`),
  KEY `hwAnsNo` (`hwAnsNo`),
  CONSTRAINT `sresult_ibfk_1` FOREIGN KEY (`hwAnsNo`) REFERENCES `hwans` (`hwAnsNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sresult
-- ----------------------------

-- ----------------------------
-- Table structure for tmember
-- ----------------------------
DROP TABLE IF EXISTS `tmember`;
CREATE TABLE `tmember` (
  `memNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `memName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memPhone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memPic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memSchool` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memMajor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`memNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tmember
-- ----------------------------
INSERT INTO `tmember` VALUES ('FB001', '陳小昱', '10356001@ntub.edu.tw', '0912345678', 'student', null, null, null);
INSERT INTO `tmember` VALUES ('FB002', '謝小齊', '10356004@ntub.edu.tw', '0912654346', 'student', null, null, null);
INSERT INTO `tmember` VALUES ('FB003', '藍大謙', '10356005@ntub.edu.tw', '0987878787', 'teacher', null, null, null);
INSERT INTO `tmember` VALUES ('FB004', '王小宇', '10356006@ntub.edu.tw', '0966694666', 'student', null, null, null);
INSERT INTO `tmember` VALUES ('FB005', '侯大庭', '10356007@ntub.edu.tw', '0977778888', 'teacher', null, null, null);

-- ----------------------------
-- Procedure structure for career_search01
-- ----------------------------
DROP PROCEDURE IF EXISTS `career_search01`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `career_search01`()
BEGIN
	select memNo, classNo, level, result
	from career;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for check_search01
-- ----------------------------
DROP PROCEDURE IF EXISTS `check_search01`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_search01`()
BEGIN
	select checkNo, classFileNo, joinMemNo
	from `check`;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for classfile_search01
-- ----------------------------
DROP PROCEDURE IF EXISTS `classfile_search01`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `classfile_search01`()
BEGIN
	select classFileNo, classNo, title, date, word, pic, video, sound 
	from classfile;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for class_search01
-- ----------------------------
DROP PROCEDURE IF EXISTS `class_search01`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `class_search01`()
BEGIN
	select classNo, className, sponsorNo, startDate, endDate
	from class;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for joinClass_search01
-- ----------------------------
DROP PROCEDURE IF EXISTS `joinClass_search01`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `joinClass_search01`()
BEGIN
	select joinClassNo, classNo, joinNo, joinDate
	from joinclass;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_member_search01
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_member_search01`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_member_search01`()
BEGIN
		select memNo, memName, memEmail, memPhone, memTitle, memPic, memAccount
		from member;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_member_search_by_mEmail
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_member_search_by_mEmail`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_member_search_by_mEmail`(IN `m_Email` char)
BEGIN
	select memNo, memName, memEmail, memPhone, memTitle, memPic, memAccount
	from member
	where memEmail=m_Email COLLATE utf8_unicode_ci;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_member_search_by_mName
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_member_search_by_mName`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_member_search_by_mName`(IN `m_Name` char(255))
BEGIN
	select memNo, memName, memEmail, memPhone, memTitle, memPic, memAccount
	from member
	where memName=m_Name COLLATE utf8_unicode_ci;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_member_search_by_mNo
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_member_search_by_mNo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_member_search_by_mNo`(IN `m_No` char(255))
BEGIN
	select memNo, memName, memEmail, memPhone, memTitle, memPic, memAccount
	from member
	where memNo=m_No COLLATE utf8_unicode_ci;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_member_search_by_mPhone
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_member_search_by_mPhone`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_member_search_by_mPhone`(IN `m_Phone` char)
BEGIN
	select memNo, memName, memEmail, memPhone, memTitle, memPic, memAccount
	from member
	where memPhone=m_Phone COLLATE utf8_unicode_ci;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_member_search_by_mTitle
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_member_search_by_mTitle`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_member_search_by_mTitle`(IN `m_Title` char(255))
BEGIN
	select memNo, memName, memEmail, memPhone, memTitle, memPic, memAccount
	from member
	where memTitle=m_Title COLLATE utf8_unicode_ci;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_question_search01
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_question_search01`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_question_search01`()
BEGIN
	select queNo, questioner, queWord, quePic
	from question;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_question_search_by_qNo
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_question_search_by_qNo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_question_search_by_qNo`(IN `q_No` int)
BEGIN
	select queNo, questioner, queWord, quePic
	from question
	where queNo=q_No COLLATE utf8_unicode_ci;
END
;;
DELIMITER ;
