/*
Navicat MySQL Data Transfer

Source Server         : localhost3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : noa

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-04-09 20:45:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `announcement`
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `auther_id` int(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `text` text,
  `pic` varchar(32) DEFAULT NULL,
  `target_id` int(32) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `attendance`
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(32) NOT NULL,
  `date` date NOT NULL,
  `on_time` timestamp NULL DEFAULT NULL,
  `off_time` timestamp NULL DEFAULT NULL,
  `state` int(2) DEFAULT NULL COMMENT '0正常 1加班 2迟到早退',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `sex` int(1) NOT NULL,
  `pic` varchar(64) DEFAULT NULL,
  `department_id` int(10) NOT NULL,
  `position_id` int(10) DEFAULT '0',
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `working_state` int(1) DEFAULT '0' COMMENT '状态:在线/离线',
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `mail`
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sendtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `server_id` int(32) NOT NULL,
  `reciever_id` int(32) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `text` text,
  `pic` varchar(64) DEFAULT NULL,
  `read` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `mission`
-- ----------------------------
DROP TABLE IF EXISTS `mission`;
CREATE TABLE `mission` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `auther_id` int(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `text` text,
  `pic` varchar(64) DEFAULT NULL,
  `target_id` int(32) NOT NULL,
  `progress` int(10) DEFAULT '0' COMMENT '进度 满是10',
  `comment` text COMMENT '员工id:#评论文本:&员工id:#评论文本:&',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


