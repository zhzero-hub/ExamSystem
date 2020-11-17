/*
 Navicat Premium Data Transfer

 Source Server         : mamp
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : examsystem

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 14/04/2019 10:33:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `cid` INT(11) NOT NULL AUTO_INCREMENT,
  `cname` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `maid` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `fk_maid`(`maid`) USING BTREE,
  CONSTRAINT `fk_maid` FOREIGN KEY (`maid`) REFERENCES `major` (`maid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = INNODB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for depart
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `depart` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for exam_information
-- ----------------------------
DROP TABLE IF EXISTS `exam_information`;
CREATE TABLE `exam_information`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `examname` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chaptertwo` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `begindate` DATE NULL DEFAULT NULL,
  `enddate` DATE NULL DEFAULT NULL,
  `examtime` FLOAT NULL DEFAULT NULL,
  `choicenum` INT(11) NULL DEFAULT NULL,
  `choicescore` FLOAT NULL DEFAULT NULL,
  `judgenum` INT(11) NULL DEFAULT NULL,
  `judgescore` FLOAT NULL DEFAULT NULL,
  `difficulty` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for exam_result
-- ----------------------------
DROP TABLE IF EXISTS `exam_result`;
CREATE TABLE `exam_result`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `studentid` INT(11) NULL DEFAULT NULL,
  `examid` INT(11) NULL DEFAULT NULL,
  `stuanswer` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for examhistory
-- ----------------------------
DROP TABLE IF EXISTS `examhistory`;
CREATE TABLE `examhistory`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `examid` INT(11) NOT NULL,
  `studentid` INT(11) NOT NULL,
  `score` INT(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `examid`(`examid`) USING BTREE,
  INDEX `studentid`(`studentid`) USING BTREE,
  CONSTRAINT `examhistory_ibfk_2` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = INNODB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `maid` INT(11) NOT NULL AUTO_INCREMENT,
  `maname` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seid` INT(11) NOT NULL,
  PRIMARY KEY (`maid`) USING BTREE,
  INDEX `fk_seid`(`seid`) USING BTREE,
  INDEX `maid`(`maid`) USING BTREE,
  CONSTRAINT `fk_seid` FOREIGN KEY (`seid`) REFERENCES `semester` (`seid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = INNODB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for paper_choice
-- ----------------------------
DROP TABLE IF EXISTS `paper_choice`;
CREATE TABLE `paper_choice`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `content` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `answer` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `aoption` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `boption` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `coption` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `doption` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `examid` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `examid`(`examid`) USING BTREE,
  CONSTRAINT `paper_choice_ibfk_1` FOREIGN KEY (`examid`) REFERENCES `exam_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = INNODB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for paper_judge
-- ----------------------------
DROP TABLE IF EXISTS `paper_judge`;
CREATE TABLE `paper_judge`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `content` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `answer` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `examid` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `examid`(`examid`) USING BTREE,
  CONSTRAINT `paper_judge_ibfk_1` FOREIGN KEY (`examid`) REFERENCES `exam_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = INNODB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for point1
-- ----------------------------
DROP TABLE IF EXISTS `point1`;
CREATE TABLE `point1`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `pointname` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for point2
-- ----------------------------
DROP TABLE IF EXISTS `point2`;
CREATE TABLE `point2`  (
  `bid` INT(11) NOT NULL AUTO_INCREMENT,
  `pname` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aid` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE,
  INDEX `fk_point_id`(`aid`) USING BTREE,
  CONSTRAINT `point2_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `point1` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = INNODB AUTO_INCREMENT = 55 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for semester
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester`  (
  `seid` INT(11) NOT NULL AUTO_INCREMENT,
  `sename` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`seid`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sit
-- ----------------------------
DROP TABLE IF EXISTS `sit`;
CREATE TABLE `sit`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `sit` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` VARCHAR(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `classname` VARCHAR(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `num` VARCHAR(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 104 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (2, 'root', 'root', '161820217', '013811');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', 'admin');
INSERT INTO `tb_user` VALUES (3, 'root', 'root');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `major` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail` VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` VARCHAR(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'root', '计算机', '教师', '545033805@qq.com', 'root');

-- ----------------------------
-- Table structure for tk_choice
-- ----------------------------
DROP TABLE IF EXISTS `tk_choice`;
CREATE TABLE `tk_choice`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `content` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试题内容',
  `aoption` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项A',
  `boption` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项B',
  `coption` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项C',
  `doption` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项D',
  `answer` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试题答案',
  `analysis` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试题解析',
  `chapter` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL NULL COMMENT '章节编号',
  `chaptertwo` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `difficulty` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试题难度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for tk_judge
-- ----------------------------
DROP TABLE IF EXISTS `tk_judge`;
CREATE TABLE `tk_judge`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `content` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试题内容',
  `answer` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试题答案',
  `chapter` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL NULL COMMENT '章节编号',
  `chaptertwo` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `analysis` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试题解析',
  `difficulty` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试题难度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

SET FOREIGN_KEY_CHECKS = 1;
