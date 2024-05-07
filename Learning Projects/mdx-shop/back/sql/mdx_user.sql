/*
 Navicat Premium Data Transfer

 Source Server         : 本地2
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : mdx_shop

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 09/08/2022 10:07:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mdx_user
-- ----------------------------
DROP TABLE IF EXISTS `mdx_user`;
CREATE TABLE `mdx_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `nick` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态 0 启用 1禁用',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别 0 男 1 女',
  `remarks` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '个人描述',
  `last_login_time` datetime(0) NOT NULL COMMENT '上次登录时间',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `idx_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mdx_user
-- ----------------------------
INSERT INTO `mdx_user` VALUES (1, 'admin', '$2a$10$c./nfmokuQSEn1KKbXbGw.AgTyT5a.Hs3O/qaXQ5BTjb8xRivgytK', '管理员', '13621322279', '895732142@qq.com', 0, 18, NULL, '2022-02-08 17:15:11', '2022-02-08 17:15:03', NULL);

SET FOREIGN_KEY_CHECKS = 1;
