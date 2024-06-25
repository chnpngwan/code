/*
 Navicat Premium Dump SQL

 Source Server         : MySQL84
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : localhost:3306
 Source Schema         : db_delivery

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 19/06/2024 20:53:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for contract_customer
-- ----------------------------
DROP TABLE IF EXISTS `contract_customer`;
CREATE TABLE `contract_customer`  (
  `contract_cid` int NOT NULL,
  `cname` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `account_monthly` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`contract_cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contract_customer
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cid` int NOT NULL,
  `cname` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '胡图图', '男', '15089370389', '翻斗大街翻斗花园二号楼1001室');
INSERT INTO `customer` VALUES (2, '张小丽', '女', '15089356879', '翻斗大街翻斗花园二号楼1002室');
INSERT INTO `customer` VALUES (3, '胡英俊', '男', '15089352344', '翻斗大街翻斗花园二号楼1003室');
INSERT INTO `customer` VALUES (4, '刘爷爷', '男', '15082223344', '翻斗大街翻斗花园二号楼1004室');
INSERT INTO `customer` VALUES (5, '大虎', '男', '15075523344', '翻斗大街翻斗花园二号楼1005室');
INSERT INTO `customer` VALUES (6, '小美', '女', '15075524256', '翻斗大街翻斗花园二号楼1006室');
INSERT INTO `customer` VALUES (7, '帅子', '男', '15075524256', '翻斗大街翻斗花园二号楼1007室');
INSERT INTO `customer` VALUES (8, '大龙', '男', '15075588838', '翻斗大街翻斗花园二号楼1008室');

-- ----------------------------
-- Table structure for drive
-- ----------------------------
DROP TABLE IF EXISTS `drive`;
CREATE TABLE `drive`  (
  `vid` int NOT NULL,
  `sid` int NOT NULL,
  PRIMARY KEY (`vid`, `sid`) USING BTREE,
  INDEX `sid`(`sid` ASC) USING BTREE,
  CONSTRAINT `drive_ibfk_1` FOREIGN KEY (`vid`) REFERENCES `vehicle` (`vid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `drive_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `staff` (`sid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drive
-- ----------------------------

-- ----------------------------
-- Table structure for package
-- ----------------------------
DROP TABLE IF EXISTS `package`;
CREATE TABLE `package`  (
  `pid` int NOT NULL,
  `pname` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TYPE` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `weight` decimal(8, 2) NOT NULL,
  `number` int NULL DEFAULT NULL,
  `delivery_time` date NOT NULL,
  `return_OrNot` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cid` int NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `cid`(`cid` ASC) USING BTREE,
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of package
-- ----------------------------
INSERT INTO `package` VALUES (1, '短袖', '衣服', 4.00, 212, '2021-03-14', '可以', 2);
INSERT INTO `package` VALUES (2, '裤子', '衣服', 6.00, 645, '2021-03-15', '可以', 2);
INSERT INTO `package` VALUES (3, '毛衣', '衣服', 4.00, 523, '2021-03-16', '可以', 1);
INSERT INTO `package` VALUES (4, '内裤', '衣服', 3.00, 632, '2021-03-17', '不可以', 1);
INSERT INTO `package` VALUES (5, '三只松鼠', '零食', 4.00, 82, '2021-03-13', '可以', 5);
INSERT INTO `package` VALUES (6, '牛奶', '食品', 10.00, 55, '2021-03-19', '可以', 3);
INSERT INTO `package` VALUES (7, '苹果', '水果', 10.00, 14, '2021-03-21', '不可以', 1);
INSERT INTO `package` VALUES (8, '蓝牙耳机', '数码', 1.00, 13, '2021-03-12', '可以', 4);
INSERT INTO `package` VALUES (9, '背包', '日用品', 3.00, 50, '2021-03-15', '可以', 6);
INSERT INTO `package` VALUES (10, '鼠标', '外设', 1.30, 233, '2021-03-16', '可以', 6);

-- ----------------------------
-- Table structure for recipient
-- ----------------------------
DROP TABLE IF EXISTS `recipient`;
CREATE TABLE `recipient`  (
  `rid` int NOT NULL,
  `rname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sex` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recipient
-- ----------------------------
INSERT INTO `recipient` VALUES (1, '收件人1', '女', '15028458563', '广州市天河区');
INSERT INTO `recipient` VALUES (2, '收件人2', '男', '15028454563', '深圳市福田区');
INSERT INTO `recipient` VALUES (3, '收件人3', '女', '15028458773', '揭阳市揭东区');

-- ----------------------------
-- Table structure for special_package
-- ----------------------------
DROP TABLE IF EXISTS `special_package`;
CREATE TABLE `special_package`  (
  `special_pid` int NOT NULL,
  `pname` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TYPE` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `weight` decimal(8, 2) NOT NULL,
  `number` int NULL DEFAULT NULL,
  `delivery_time` date NOT NULL,
  `return_OrNot` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cid` int NOT NULL,
  `danger` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `VALUE` decimal(8, 2) NOT NULL,
  PRIMARY KEY (`special_pid`) USING BTREE,
  INDEX `cid`(`cid` ASC) USING BTREE,
  CONSTRAINT `special_package_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of special_package
-- ----------------------------
INSERT INTO `special_package` VALUES (1, '浓硫酸', '化学物品', 33.00, 10, '2021-03-15', '否', 2, '危险', 100.00);
INSERT INTO `special_package` VALUES (2, '黄金', '贵重物品', 330.00, 15, '2021-03-15', '否', 6, '不危险', 400.00);
INSERT INTO `special_package` VALUES (3, '进口化妆品', '贵重物品', 20.00, 50, '2021-03-15', '否', 3, '不危险', 1180.00);
INSERT INTO `special_package` VALUES (4, '进口芯片', '元件', 1.30, 643, '2021-03-15', '否', 3, '不危险', 65830.00);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `sid` int NOT NULL,
  `sname` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `salary` decimal(8, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (1, '员工1', '男', '13763315701', 8000.00);
INSERT INTO `staff` VALUES (2, '员工2', '女', '13762415701', 9000.00);
INSERT INTO `staff` VALUES (3, '员工3', '男', '13763314556', 10000.00);
INSERT INTO `staff` VALUES (4, '员工4', '男', '13761513501', 8500.00);
INSERT INTO `staff` VALUES (5, '员工5', '女', '13762294735', 10200.00);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'username', 'password');
INSERT INTO `user` VALUES (2, 'admin', 'pass');

-- ----------------------------
-- Table structure for vehicle
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle`  (
  `vid` int NOT NULL,
  `vehicle_model` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `money` decimal(8, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`vid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
INSERT INTO `vehicle` VALUES (1, '货车', 2000.00);
INSERT INTO `vehicle` VALUES (2, '火车', 4000.00);
INSERT INTO `vehicle` VALUES (3, '轮船', 6000.00);
INSERT INTO `vehicle` VALUES (4, '飞机', 5000.00);
INSERT INTO `vehicle` VALUES (5, '电动三轮', 123.70);

-- ----------------------------
-- Table structure for waybill
-- ----------------------------
DROP TABLE IF EXISTS `waybill`;
CREATE TABLE `waybill`  (
  `wid` int NOT NULL,
  `send_time` date NULL DEFAULT NULL,
  `receipt_time` date NULL DEFAULT NULL,
  `current_location` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `next_location` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `route` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pid` int NOT NULL,
  `sid` int NOT NULL,
  `rid` int NOT NULL,
  PRIMARY KEY (`wid`) USING BTREE,
  INDEX `pid`(`pid` ASC) USING BTREE,
  INDEX `sid`(`sid` ASC) USING BTREE,
  INDEX `rid`(`rid` ASC) USING BTREE,
  CONSTRAINT `waybill_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `package` (`pid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `waybill_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `staff` (`sid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `waybill_ibfk_3` FOREIGN KEY (`rid`) REFERENCES `recipient` (`rid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of waybill
-- ----------------------------
INSERT INTO `waybill` VALUES (1, '2021-03-14', '2021-03-16', '北京市朝阳区', '广州市天河区', 'A-B-C', 1, 1, 1);
INSERT INTO `waybill` VALUES (2, '2021-03-13', '2021-03-16', '揭阳市揭东区', '广州市天河区', 'D-C-B', 2, 3, 2);
INSERT INTO `waybill` VALUES (3, '2021-02-14', '2021-02-19', '深圳市福田区', '北京市朝阳区', 'C-B-A', 4, 2, 3);
INSERT INTO `waybill` VALUES (4, '2021-03-14', '2021-03-16', '北京市朝阳区', '翻斗大街翻斗花园二号楼1007室', 'A-E', 6, 5, 1);
INSERT INTO `waybill` VALUES (5, '2021-03-14', '2021-03-16', '北京市朝阳区', '翻斗大街翻斗花园二号楼1007室', 'A-E', 6, 5, 1);

SET FOREIGN_KEY_CHECKS = 1;
