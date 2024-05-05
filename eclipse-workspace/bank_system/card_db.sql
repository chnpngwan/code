/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : card_db

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 04/10/2022 15:13:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_card
-- ----------------------------
DROP TABLE IF EXISTS `tb_card`;
CREATE TABLE `tb_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cardNo` bigint(18) NOT NULL,
  `balance` decimal(10, 2) NOT NULL,
  `level` int(11) NULL DEFAULT NULL COMMENT '1普卡 2 白金卡  3 黑卡',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_card
-- ----------------------------
INSERT INTO `tb_card` VALUES (1, '六月', '女', 622820220512, 3000.00, 3);
INSERT INTO `tb_card` VALUES (2, '张三', '男', 622811012345, 1200.00, 1);
INSERT INTO `tb_card` VALUES (3, '里斯', '女', 622811012346, 4000.00, 2);
INSERT INTO `tb_card` VALUES (4, '王五', '男', 622811012349, 10000.00, 3);
INSERT INTO `tb_card` VALUES (5, 'admin', '男', 62282345678, 12000.00, 1);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', '123');
INSERT INTO `tb_user` VALUES (2, 'tom', '123');

SET FOREIGN_KEY_CHECKS = 1;
