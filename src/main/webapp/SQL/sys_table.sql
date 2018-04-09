/*
Navicat MySQL Data Transfer

Source Server         : localhost3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : noa

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-04-09 20:46:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_department`
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `department_id` int(10) NOT NULL,
  `department_name` varchar(32) NOT NULL,
  `available` int(1) DEFAULT '1',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('0', '全体', '0');
INSERT INTO `sys_department` VALUES ('10', '总经理', '0');
INSERT INTO `sys_department` VALUES ('20', '副总经理', '0');
INSERT INTO `sys_department` VALUES ('30', '业务部', '1');
INSERT INTO `sys_department` VALUES ('31', '业务部 销售', '1');
INSERT INTO `sys_department` VALUES ('32', '业务部 市场开发', '1');
INSERT INTO `sys_department` VALUES ('33', '业务部 售后服务', '1');
INSERT INTO `sys_department` VALUES ('40', '工程部', '1');
INSERT INTO `sys_department` VALUES ('41', '工程部 产品开发', '1');
INSERT INTO `sys_department` VALUES ('42', '工程部 产品设计', '1');
INSERT INTO `sys_department` VALUES ('50', '生产部', '1');
INSERT INTO `sys_department` VALUES ('51', '生产部 生产计划', '1');
INSERT INTO `sys_department` VALUES ('52', '生产部 设备制造', '1');
INSERT INTO `sys_department` VALUES ('53', '生产部 工程安装', '1');
INSERT INTO `sys_department` VALUES ('60', '品质部', '1');
INSERT INTO `sys_department` VALUES ('61', '品质部 品质管理', '1');
INSERT INTO `sys_department` VALUES ('62', '品质部 过程控制', '1');
INSERT INTO `sys_department` VALUES ('70', '管理部', '1');
INSERT INTO `sys_department` VALUES ('71', '管理部 人事', '1');
INSERT INTO `sys_department` VALUES ('72', '管理部 行政', '1');
INSERT INTO `sys_department` VALUES ('73', '管理部 采购', '1');
INSERT INTO `sys_department` VALUES ('74', '管理部 财务', '1');

-- ----------------------------
-- Table structure for `sys_employee_position`
-- ----------------------------
DROP TABLE IF EXISTS `sys_employee_position`;
CREATE TABLE `sys_employee_position` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `employee_id` int(32) NOT NULL,
  `position_id` int(32) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '权限', '', '', null, '0', '0/', '0', '1');
INSERT INTO `sys_permission` VALUES ('11', '公告', 'menu', '', 'announce:query', '1', '0/1/', '1.', '1');
INSERT INTO `sys_permission` VALUES ('12', '发布公告', 'permission', '/announce.action', 'announce:create', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('13', '删除公告', 'permission', '/delete_announce.action', 'announce:delete', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('21', '任务', 'menu', '/mission', 'mission:query', '1', '0/1/', '2.', '1');
INSERT INTO `sys_permission` VALUES ('22', '发布任务', 'permission', '/mission/post_mission.action', 'mission:create', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('23', '删除任务', 'permission', '/mission/delete_mission.action', 'mission:delete', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('24', '删除评论', 'permission', '/mission/delete_comment.action', 'mission:comment_delete', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('121', '发布全体公告', 'permission', '/announce.action', 'announce:create:all', '12', '0/1/11/12', '1.1', '1');
INSERT INTO `sys_permission` VALUES ('122', '发布大部门公告', 'permission', '/announce.action', 'announce:create:main', '12', '0/1/11/12', null, '1');
INSERT INTO `sys_permission` VALUES ('123', '发布子部门公告', 'permission', '/announce.action', 'announce:create:sub', '12', '0/1/11/12', null, '1');
INSERT INTO `sys_permission` VALUES ('221', '发布全体任务', 'permission', '/mission/post_mission.action', 'mission:create:all', '22', '0/1/21/22', '2.1', '1');
INSERT INTO `sys_permission` VALUES ('222', '发布大部门任务', 'permission', '/mission/post_mission.action', 'mission:create:main', '22', '0/1/21/22', null, '1');
INSERT INTO `sys_permission` VALUES ('223', '发布子部门任务', 'permission', '/mission/post_mission.action', 'mission:create:sub', '22', '0/1/21/22', null, '1');

-- ----------------------------
-- Table structure for `sys_position`
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position` (
  `position_id` int(32) NOT NULL,
  `position_name` varchar(32) DEFAULT NULL,
  `available` int(1) DEFAULT '1',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_position
-- ----------------------------
INSERT INTO `sys_position` VALUES ('0', '无', '1');
INSERT INTO `sys_position` VALUES ('1', '组长', '1');
INSERT INTO `sys_position` VALUES ('2', '部门经理', '1');
INSERT INTO `sys_position` VALUES ('3', '总监', '1');
INSERT INTO `sys_position` VALUES ('4', '特殊', '0');

-- ----------------------------
-- Table structure for `sys_position_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_position_permission`;
CREATE TABLE `sys_position_permission` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `posision_id` int(32) NOT NULL,
  `permission_id` int(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_position_permission
-- ----------------------------
INSERT INTO `sys_position_permission` VALUES ('1', '0', '11');
INSERT INTO `sys_position_permission` VALUES ('2', '0', '21');
INSERT INTO `sys_position_permission` VALUES ('3', '1', '11');
INSERT INTO `sys_position_permission` VALUES ('4', '1', '21');
INSERT INTO `sys_position_permission` VALUES ('5', '1', '123');
INSERT INTO `sys_position_permission` VALUES ('6', '1', '223');
INSERT INTO `sys_position_permission` VALUES ('7', '2', '11');
INSERT INTO `sys_position_permission` VALUES ('8', '2', '21');
INSERT INTO `sys_position_permission` VALUES ('9', '2', '222');
INSERT INTO `sys_position_permission` VALUES ('10', '2', '122');
INSERT INTO `sys_position_permission` VALUES ('11', '3', '11');
INSERT INTO `sys_position_permission` VALUES ('12', '3', '21');
INSERT INTO `sys_position_permission` VALUES ('13', '3', '121');
INSERT INTO `sys_position_permission` VALUES ('14', '3', '221');
INSERT INTO `sys_position_permission` VALUES ('15', '3', '13');
INSERT INTO `sys_position_permission` VALUES ('16', '3', '23');
INSERT INTO `sys_position_permission` VALUES ('17', '3', '122');
INSERT INTO `sys_position_permission` VALUES ('18', '3', '222');
INSERT INTO `sys_position_permission` VALUES ('19', '4', '11');
INSERT INTO `sys_position_permission` VALUES ('21', '4', '21');
INSERT INTO `sys_position_permission` VALUES ('22', '4', '121');
INSERT INTO `sys_position_permission` VALUES ('23', '4', '221');
