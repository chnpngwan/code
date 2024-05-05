/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : db_course_selection

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 22/10/2022 16:03:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `schooltime` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上课时间',
  `addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上课地点',
  `credit` decimal(3, 0) NOT NULL COMMENT '课程学分',
  `courseInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程介绍',
  `teacherName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '老师姓名',
  `teacherInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '老师介绍',
  `isFinish` bit(1) NOT NULL COMMENT '是否可选',
  `specialtyId` int(10) UNSIGNED NOT NULL COMMENT '所属专业编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_course
-- ----------------------------
INSERT INTO `tb_course` VALUES (1, 'java', 'sun8to12', 'class1', 5, 'base java', 'mike', 'goodteacher', b'1', 1);
INSERT INTO `tb_course` VALUES (5, 'Java基础', '每周三下午2:00', '第三教学楼1301', 5, 'Java基础语法、面向对象、异常处理、集合、IO流、注解、反射', '张老师', '多年Java教学经验，精通Java语言', b'1', 4);
INSERT INTO `tb_course` VALUES (6, '高等代数', '每周四上午9:00', '第四教学楼1409', 8, '高等代数是吉林大学数学学院开设的在校课、理论课（含实验/实践）、专业基础课、技术基础课、国家级精品资源共享课、国家级一流本科课程。该课程的课程负责人为杜现昆。据2021年10月爱课程官网教学大纲显示，该课程总学时192学时，其中理论课128学时、习题课64学时，学分为8学分。', '李老师', '教授', b'1', 5);
INSERT INTO `tb_course` VALUES (7, '形体', '每周三下午14:00', '第三教学楼1601', 2, '形体课程介绍', '王老师', '这里是王老师的介绍', b'1', 6);
INSERT INTO `tb_course` VALUES (8, '工商管理', '每周四上午9:00', '第三教学楼1301', 5, '工商管理', '张老师', '这里是张老师的介绍', b'1', 7);
INSERT INTO `tb_course` VALUES (9, '砌墙', '每周三下午14:00', '工地', 2, '这里是课程介绍', '王老师', '这里是老师介绍', b'1', 11);
INSERT INTO `tb_course` VALUES (10, '营销实战', '每周三下午2:00', '售楼部', 1, '这里是营销实战课程介绍', '张老师', '这里是老师介绍', b'1', 20);
INSERT INTO `tb_course` VALUES (11, '孟德尔豌豆杂交实验', '每周三下午2:00', '第三教学楼1601', 5, '这里是课程介绍', '李老师', '这里是老师介绍', b'1', 23);

-- ----------------------------
-- Table structure for tb_specialty
-- ----------------------------
DROP TABLE IF EXISTS `tb_specialty`;
CREATE TABLE `tb_specialty`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '专业编号',
  `enterYear` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开设年份',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业名称',
  `langthYear` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业学制',
  `isFinish` bit(1) NOT NULL COMMENT '是否结业 0:未结业 1:结业',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_specialty
-- ----------------------------
INSERT INTO `tb_specialty` VALUES (4, '2021', '计算机科学与技术', '4', b'0');
INSERT INTO `tb_specialty` VALUES (5, '2022', '信息与计算科学', '4', b'0');
INSERT INTO `tb_specialty` VALUES (6, '2022', '空中乘务', '2', b'1');
INSERT INTO `tb_specialty` VALUES (7, '2022', '工商管理', '4', b'0');
INSERT INTO `tb_specialty` VALUES (8, '2022', '临床医学', '5', b'0');
INSERT INTO `tb_specialty` VALUES (9, '2022', '气象学', '2', b'0');
INSERT INTO `tb_specialty` VALUES (10, '2022', '学前教育', '2', b'1');
INSERT INTO `tb_specialty` VALUES (11, '2023', '建筑设计', '3', b'0');
INSERT INTO `tb_specialty` VALUES (12, '2022', '水利水电建筑工程', '2', b'0');
INSERT INTO `tb_specialty` VALUES (13, '2022', '道路桥梁工程技术', '2', b'0');
INSERT INTO `tb_specialty` VALUES (14, '2022', '人力资源管理', '4', b'0');
INSERT INTO `tb_specialty` VALUES (15, '2022', '汽车制造与维修技术', '2', b'0');
INSERT INTO `tb_specialty` VALUES (16, '2022', '行政管理', '3', b'1');
INSERT INTO `tb_specialty` VALUES (17, '2022', '信息工程', '2', b'0');
INSERT INTO `tb_specialty` VALUES (18, '2022', '统计学', '4', b'0');
INSERT INTO `tb_specialty` VALUES (19, '2022', '材料成型及控制工程', '2', b'0');
INSERT INTO `tb_specialty` VALUES (20, '2022', '市场营销', '3', b'1');
INSERT INTO `tb_specialty` VALUES (21, '2022', '财务管理', '4', b'0');
INSERT INTO `tb_specialty` VALUES (22, '2022', '数控技术', '3', b'0');
INSERT INTO `tb_specialty` VALUES (23, '2023', '生物工程', '5', b'0');

-- ----------------------------
-- Table structure for tb_stucourse
-- ----------------------------
DROP TABLE IF EXISTS `tb_stucourse`;
CREATE TABLE `tb_stucourse`  (
  `stuID` int(10) UNSIGNED NOT NULL COMMENT '学生编号',
  `courseID` int(10) UNSIGNED NOT NULL COMMENT '课程编号',
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_stucourse
-- ----------------------------
INSERT INTO `tb_stucourse` VALUES (5, 5, 8);
INSERT INTO `tb_stucourse` VALUES (18, 6, 9);
INSERT INTO `tb_stucourse` VALUES (19, 5, 10);
INSERT INTO `tb_stucourse` VALUES (21, 5, 11);
INSERT INTO `tb_stucourse` VALUES (21, 5, 12);
INSERT INTO `tb_stucourse` VALUES (22, 5, 13);
INSERT INTO `tb_stucourse` VALUES (23, 5, 14);
INSERT INTO `tb_stucourse` VALUES (24, 5, 15);

-- ----------------------------
-- Table structure for tb_stuuser
-- ----------------------------
DROP TABLE IF EXISTS `tb_stuuser`;
CREATE TABLE `tb_stuuser`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '学生编号',
  `stuName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `stuNo` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生学号',
  `specialtyId` int(10) UNSIGNED NOT NULL COMMENT '学生所学专业编号',
  `stuSex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生性别',
  `birthday` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生出生年月日',
  `homeAddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生家庭地址',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生电话',
  `addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生当前居住地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_stuuser
-- ----------------------------
INSERT INTO `tb_stuuser` VALUES (5, '学生1', '20221021001', 4, '男', '2020-07-14', '柴达木广场', '17738332348', '工地');
INSERT INTO `tb_stuuser` VALUES (18, '学生2', '20221021002', 5, '女', '2022-09-17', '柴达木广场', '18888888888', '售楼部');
INSERT INTO `tb_stuuser` VALUES (19, '学生3', '20221021003', 4, '女', '2020-07-16', '柴达木广场', '18888888888', '工地');
INSERT INTO `tb_stuuser` VALUES (20, '学生4', '20221021004', 4, '女', '2022-09-01', '柴达木广场', '18888888888', '第三教学楼1601');
INSERT INTO `tb_stuuser` VALUES (21, '学生5', '20221021005', 4, '男', '2022-09-16', '柴达木广场', '18888888888', '第三教学楼1601');
INSERT INTO `tb_stuuser` VALUES (22, '学生6', '20221021006', 4, '女', '2020-07-16', '柴达木广场', '18888888888', '第三教学楼1301');
INSERT INTO `tb_stuuser` VALUES (23, '学生7', '20221021007', 4, '女', '2022-09-30', '柴达木广场', '18888888888', '第三教学楼1301');
INSERT INTO `tb_stuuser` VALUES (24, '学生8', '20221021008', 4, '女', '2022-09-01', '柴达木广场', '18888888888', '第四教学楼1409');

-- ----------------------------
-- Table structure for tb_userlogin
-- ----------------------------
DROP TABLE IF EXISTS `tb_userlogin`;
CREATE TABLE `tb_userlogin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `loginName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户类型 1:管理员 2:学生',
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_userlogin
-- ----------------------------
INSERT INTO `tb_userlogin` VALUES (1, 'admin', 'cya', '1', 'mr@mr.com');
INSERT INTO `tb_userlogin` VALUES (5, 'user1', 'cya', '2', 'user');
INSERT INTO `tb_userlogin` VALUES (17, 'user', 'cya', '2', 'cya@qq.com');
INSERT INTO `tb_userlogin` VALUES (18, 'user2', 'cya', '2', 'cya@qq.com');
INSERT INTO `tb_userlogin` VALUES (19, 'user3', 'cya', '2', 'cya@qq.com');
INSERT INTO `tb_userlogin` VALUES (20, 'user4', 'cya', '2', 'cya@qq.com');
INSERT INTO `tb_userlogin` VALUES (21, 'user5', 'cya', '2', 'cya@qq.com');
INSERT INTO `tb_userlogin` VALUES (22, 'user6', 'cya', '2', 'cya@qq.com');
INSERT INTO `tb_userlogin` VALUES (23, 'user7', 'cya', '2', 'cya@qq.com');
INSERT INTO `tb_userlogin` VALUES (24, 'user8', 'cya', '2', 'cya@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
