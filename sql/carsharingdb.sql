/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : carsharingdb

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-09-28 10:53:58
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `carsharingdb`;

use carsharingdb;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `commentid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(20) unsigned NOT NULL,
  `postid` int(20) unsigned NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `likeid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(20) unsigned NOT NULL,
  `postid` int(20) unsigned NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`likeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of likes
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `postid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(20) unsigned NOT NULL,
  `post` text COLLATE utf8_bin NOT NULL,
  `source` text COLLATE utf8_bin NOT NULL,
  `destination` text COLLATE utf8_bin NOT NULL,
  `posttype` int(1) unsigned NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`postid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '1', 0x667361736166617366, 0x466169726669656C642C204941, 0x4365646172205261706964732C204941, '1', '2017-09-26 00:00:00', '2017-09-26 01:13:45');
INSERT INTO `posts` VALUES ('2', '0', 0x61736466, 0x466169726669656C642C204941, 0x4365646172205261706964732C204941, '1', '2017-09-28 00:00:00', '2017-09-28 10:28:34');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) COLLATE utf8_bin NOT NULL,
  `gender` int(1) unsigned NOT NULL,
  `state` varchar(50) COLLATE utf8_bin NOT NULL,
  `city` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `street` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `zipcode` int(5) unsigned NOT NULL,
  `birthyear` int(4) unsigned DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Bien James Octura', '0', 'Iowa', 'Fairfield', 'N4th Street', '52556', '1984', 'bienjames.octura@gmail.com', 'password', '2017-09-26 00:53:53', '2017-09-26 00:53:53');
INSERT INTO `users` VALUES ('2', 'baoxianjian', '1', 'IA', null, null, '52557', null, 'baoxianjian@gmail.com', '123456', '2017-09-27 00:35:02', '2017-09-27 00:35:02');
