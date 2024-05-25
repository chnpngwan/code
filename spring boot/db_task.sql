/*
 Navicat Premium Data Transfer

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : db_task

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 02/07/2023 13:07:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_account
-- ----------------------------
DROP TABLE IF EXISTS `tb_account`;
CREATE TABLE `tb_account`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NUMBER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MONEY` decimal(8, 2) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_account
-- ----------------------------
INSERT INTO `tb_account` VALUES (1, '623', '李四', 3000.00);
INSERT INTO `tb_account` VALUES (2, '235', '张三', 2000.00);

-- ----------------------------
-- Table structure for tb_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `credit` int NOT NULL,
  `class_hour` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_course
-- ----------------------------
INSERT INTO `tb_course` VALUES ('C1001', '农业基础', '公共课', 2, 36);
INSERT INTO `tb_course` VALUES ('C1002', 'Linux', '专业课', 3, 25);
INSERT INTO `tb_course` VALUES ('C1003', '思想道德', '公共课', 5, 12);
INSERT INTO `tb_course` VALUES ('C1004', 'Spring', '专业课', 5, 13);

-- ----------------------------
-- Table structure for tb_dept
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept`  (
  `dept_id` int NOT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dept_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_dept
-- ----------------------------

-- ----------------------------
-- Table structure for tb_emp
-- ----------------------------
DROP TABLE IF EXISTS `tb_emp`;
CREATE TABLE `tb_emp`  (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `emp_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `emp_in_date` datetime NOT NULL,
  `emp_salary` float NOT NULL,
  `dept_id` int NOT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_emp
-- ----------------------------

-- ----------------------------
-- Table structure for tb_empe
-- ----------------------------
DROP TABLE IF EXISTS `tb_empe`;
CREATE TABLE `tb_empe`  (
  `empId` int NOT NULL AUTO_INCREMENT,
  `empName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `empAge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `empSex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `empSalary` int NOT NULL,
  PRIMARY KEY (`empId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_empe
-- ----------------------------
INSERT INTO `tb_empe` VALUES (1, '李四', '12', '男', 3200);

-- ----------------------------
-- Table structure for tb_food
-- ----------------------------
DROP TABLE IF EXISTS `tb_food`;
CREATE TABLE `tb_food`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(9, 1) NULL DEFAULT NULL,
  `buyer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `buy_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_food
-- ----------------------------
INSERT INTO `tb_food` VALUES (1, '土豆', '食材', 3.5, '李四', '2023-06-01 09:45:24');
INSERT INTO `tb_food` VALUES (2, '面条', '面食', 5.0, '张三', '2023-06-21 09:45:30');

-- ----------------------------
-- Table structure for tb_house
-- ----------------------------
DROP TABLE IF EXISTS `tb_house`;
CREATE TABLE `tb_house`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `area` decimal(9, 1) NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `register_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_house
-- ----------------------------
INSERT INTO `tb_house` VALUES (1, '洪山区', 88.0, '长征路', '二室一厅', '12345623654', '2023-06-15 15:23:30');
INSERT INTO `tb_house` VALUES (2, '青山区', 123.0, '幸福路', '三室两厅', '13323655632', '2023-06-15 15:24:15');
INSERT INTO `tb_house` VALUES (3, '汉阳区', 97.0, '东彩路', '二室二厅', '15452365412', '2023-06-15 15:25:03');
INSERT INTO `tb_house` VALUES (4, '江夏区', 78.0, '站台路', '一室一厅', '14785236985', '2023-06-15 15:25:40');

-- ----------------------------
-- Table structure for tb_image
-- ----------------------------
DROP TABLE IF EXISTS `tb_image`;
CREATE TABLE `tb_image`  (
  `id` varbinary(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `imgPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_image
-- ----------------------------
INSERT INTO `tb_image` VALUES (0x31, '张万森', 'images/赵晶.jpg');

-- ----------------------------
-- Table structure for tb_movie
-- ----------------------------
DROP TABLE IF EXISTS `tb_movie`;
CREATE TABLE `tb_movie`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `duration` int NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `moviedate` date NOT NULL,
  `price` double(6, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_movie
-- ----------------------------
INSERT INTO `tb_movie` VALUES (1, 'lisi', 12, 'lm', '2023-06-08', 12.00);
INSERT INTO `tb_movie` VALUES (2, 'ss', 36, 'lm', '2023-06-08', 13.00);

-- ----------------------------
-- Table structure for tb_patient
-- ----------------------------
DROP TABLE IF EXISTS `tb_patient`;
CREATE TABLE `tb_patient`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(9, 2) NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `register_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_patient
-- ----------------------------
INSERT INTO `tb_patient` VALUES (1, '陆嘉玲', '女', 22, '13887451277', '内科', '专家医师', 25.00, 0, '2023-06-06 08:41:28');
INSERT INTO `tb_patient` VALUES (2, '张蕾', '女', 12, '1389453412', '儿科', '专家医师', 25.00, 0, '2023-06-07 08:42:43');
INSERT INTO `tb_patient` VALUES (3, '刘德明', '男', 28, '13365897874', '骨科', '普通医师', 8.00, 1, '2023-06-08 08:45:39');
INSERT INTO `tb_patient` VALUES (4, '李将军', '男', 38, '13785624512', '内科', '专家医师', 25.00, 1, '2023-06-09 08:45:45');

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES (4, '李四', 12, '男', '昆明');
INSERT INTO `tb_student` VALUES (5, 'admin', 12, '男', '昆明');
INSERT INTO `tb_student` VALUES (6, '0', 0, '0', '0');

-- ----------------------------
-- Table structure for tb_students
-- ----------------------------
DROP TABLE IF EXISTS `tb_students`;
CREATE TABLE `tb_students`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `studentNo` int NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_students
-- ----------------------------
INSERT INTO `tb_students` VALUES (1, '李四', 123, 12, '12', '12', '213');
INSERT INTO `tb_students` VALUES (2, '张三', 523, 523, '1253', '2', '123');

-- ----------------------------
-- Table structure for tb_tourinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_tourinfo`;
CREATE TABLE `tb_tourinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `age` int NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `visit_date` date NULL DEFAULT NULL,
  `visit_state` int NULL DEFAULT NULL,
  `register_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_tourinfo
-- ----------------------------
INSERT INTO `tb_tourinfo` VALUES (1, '王城', '男', '458923----23', 21, 0, '2023-06-06', 0, '2023-06-07 16:01:50');
INSERT INTO `tb_tourinfo` VALUES (2, '‫李梅', '女', '25536738643', 18, 2, '2023-06-01', 1, '2023-06-01 16:03:20');
INSERT INTO `tb_tourinfo` VALUES (3, '黄蓉', '女', '4662378223', 18, 1, '2023-06-06', 0, '2023-05-29 16:04:00');
INSERT INTO `tb_tourinfo` VALUES (4, '王力', '男', '2367834837', 20, 3, '2023-06-05', 1, '2023-06-09 16:04:46');
INSERT INTO `tb_tourinfo` VALUES (5, '丽丽', '女', '45278923', 30, 4, '2023-06-03', 1, '2023-06-05 16:05:25');
INSERT INTO `tb_tourinfo` VALUES (6, '李山', '男', '4321567831', 20, 2, '2023-06-12', 0, '2023-06-12 18:59:41');

SET FOREIGN_KEY_CHECKS = 1;
