/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : db_book

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 04/10/2022 15:17:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bookDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_book
-- ----------------------------

-- ----------------------------
-- Table structure for tb_book
-- ----------------------------
DROP TABLE IF EXISTS `tb_book`;
CREATE TABLE `tb_book`  (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `borrowDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `returnDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `price` decimal(6, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`bookId`) USING BTREE,
  INDEX `fk_user_id`(`userId`) USING BTREE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_book
-- ----------------------------
INSERT INTO `tb_book` VALUES (1, '白雪公主', '安徒生', '童话故事', 1, '2021-09-01 00:00:00', '2022-05-07 00:00:00', 49.90);
INSERT INTO `tb_book` VALUES (2, '水浒传', '施耐庵', '文学科', 2, '2021-12-01 00:00:00', '2022-01-07 00:00:00', 79.90);
INSERT INTO `tb_book` VALUES (3, '活着', '余华', '文学科', 1, '2022-02-01 00:00:00', '2022-04-07 00:00:00', 60.00);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `className` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `integrity` int(10) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE,
  UNIQUE INDEX `tel`(`tel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '张三', '计网6班', '202100301', '15765396788', 1);
INSERT INTO `tb_user` VALUES (2, '孙悟空', '花果山班', '202100302', '15765396789', 1);

SET FOREIGN_KEY_CHECKS = 1;
