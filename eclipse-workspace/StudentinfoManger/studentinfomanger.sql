/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50513
 Source Host           : localhost:3306
 Source Schema         : studentinfomanger

 Target Server Type    : MySQL
 Target Server Version : 50513
 File Encoding         : 65001

 Date: 31/08/2022 20:35:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `a_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '管理员列号',
  `a_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员名称',
  `a_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `a_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员邮箱',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'c8837b23ff8aaa8a2dde915473ce0991', NULL);
INSERT INTO `admin` VALUES (3, 'sd', '12333212', NULL);
INSERT INTO `admin` VALUES (4, 'thy', '222e', NULL);
INSERT INTO `admin` VALUES (5, 'yhn', 'sb', NULL);
INSERT INTO `admin` VALUES (6, 'kj', '123321', '123454684@qq.com');
INSERT INTO `admin` VALUES (7, 'kj', '123321', '123454684@qq.com');
INSERT INTO `admin` VALUES (8, 'yc', 'c8837b23ff8aaa8a2dde915473ce0991', '2136546545@qq.com');

-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `store` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------
INSERT INTO `bookinfo` VALUES (1, 'Java基础', 108.00, 100);
INSERT INTO `bookinfo` VALUES (2, 'Oracle基础', 98.00, 100);
INSERT INTO `bookinfo` VALUES (3, '网页设计', 88.00, 100);
INSERT INTO `bookinfo` VALUES (4, 'xml', 68.00, 100);
INSERT INTO `bookinfo` VALUES (5, 'Javascript', 168.00, 100);
INSERT INTO `bookinfo` VALUES (6, 'Jquery', 68.00, 100);
INSERT INTO `bookinfo` VALUES (7, 'JSEE', 148.00, 100);

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `starttime` date NOT NULL COMMENT '开始时间',
  `endtime` date NOT NULL COMMENT '结束时间',
  `t_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `KF_c_name`(`name`) USING BTREE,
  INDEX `KF_c_t_id`(`t_id`) USING BTREE,
  CONSTRAINT `KF_c_t_id` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '统计学（信计19级3~4班）', '../../pics/java.png', '2022-02-21', '2022-06-21', 3);
INSERT INTO `class` VALUES (2, '统计学（信计19级1~2班）', '../../pics/java.png', '2022-02-21', '2022-06-20', 3);
INSERT INTO `class` VALUES (3, '安全教育', '../../pics/anquan.png', '2022-03-14', '2022-06-12', 2);
INSERT INTO `class` VALUES (4, 'java基础20级1-4班', '../../pics/java.png', '2022-02-21', '2022-06-30', 1);
INSERT INTO `class` VALUES (5, 'Web网页设计', '../../pics/web.png', '2022-02-21', '2022-06-28', 1);
INSERT INTO `class` VALUES (6, 'oracle精讲（20级）', '../../pics/oracle.png', '2022-02-21', '2022-06-29', 1);
INSERT INTO `class` VALUES (7, '大学生生涯职业规划（2021）', '../../pics/freshman.png', '2021-09-07', '2022-01-31', 2);
INSERT INTO `class` VALUES (8, '昆池岩', '../../images/1648467301351_OIP-C (2).jpg', '2022-03-18', '2022-03-26', 1);
INSERT INTO `class` VALUES (15, 'd\'f\'s', '../../images/1648469365166_h9.jpg', '2022-03-05', '2022-03-19', 1);
INSERT INTO `class` VALUES (16, 'gsdgdsfg', '../../images/1649679616158_h7.jpg', '2022-04-13', '2022-04-14', 1);
INSERT INTO `class` VALUES (17, '奋斗史', '../../images/1650021113168_h8.jpg', '2022-04-16', '2022-04-17', 1);
INSERT INTO `class` VALUES (21, 'asp.net', '../../images/1650177533164_h0.jpg', '2022-04-18', '2022-04-19', 1);
INSERT INTO `class` VALUES (22, '谭辉映', '../../images/1650603556068_DSC_2237.JPG', '2022-04-23', '2022-04-29', 1);
INSERT INTO `class` VALUES (23, '体育课', '../../images/1650699469950_3.png', '2022-05-01', '2022-05-27', 2);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`c_id`) USING BTREE,
  INDEX `KF_ct_id`(`c_image`) USING BTREE,
  INDEX `c_name`(`c_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (101, 'java程序开发', '');
INSERT INTO `course` VALUES (102, 'oracle', '');
INSERT INTO `course` VALUES (103, 'web网页设计', '');
INSERT INTO `course` VALUES (104, 'java程序开发', '');
INSERT INTO `course` VALUES (105, '安全教育', '');
INSERT INTO `course` VALUES (106, '统计学', '');

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss`  (
  `d_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `d_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '讨论标题',
  `d_titl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讨论内容',
  `d_time` datetime NOT NULL COMMENT '讨论发布时间',
  `s_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讨论创建者（老师）',
  `s_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '讨论班级',
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES (1, '收获', '学习《古代名剧鉴赏》后我们有什么收获？', '2022-04-20 19:27:45', '肖正元', '终极一班');
INSERT INTO `discuss` VALUES (2, '', '', '2022-04-20 21:51:54', '肖正元 ', '终极一班');
INSERT INTO `discuss` VALUES (3, '预习', '预习个屁', '2022-04-20 21:53:06', '肖正元 ', '终极一班');
INSERT INTO `discuss` VALUES (4, '预习', '个屁', '2022-04-20 21:53:53', '肖正元 ', '终极一班');
INSERT INTO `discuss` VALUES (5, '', '', '2022-04-21 12:59:09', '肖正元 ', '终极一班');
INSERT INTO `discuss` VALUES (6, '如何加强安全教育', '大家分享一下', '2022-04-21 14:05:57', 'kym', '3');
INSERT INTO `discuss` VALUES (7, '预习', '预习了吗', '2022-04-22 13:01:34', 'lz', '22');
INSERT INTO `discuss` VALUES (8, '好累呀', '我受不了了', '2022-04-23 14:37:04', '李卓', '3');
INSERT INTO `discuss` VALUES (9, '预习', '请同学们预习下一章的内容', '2022-04-23 15:42:57', 'kym', '3');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `e_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '考试名称',
  `id` int(255) NOT NULL COMMENT '班级id',
  `starttime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `time` int(25) NULL DEFAULT NULL COMMENT '考试时长',
  `degree` int(25) NULL DEFAULT NULL COMMENT '总分数',
  PRIMARY KEY (`e_name`, `id`) USING BTREE,
  INDEX `e_name`(`e_name`) USING BTREE,
  INDEX `KF_id`(`id`) USING BTREE,
  CONSTRAINT `KF_id` FOREIGN KEY (`id`) REFERENCES `class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('期中考试', 3, '2022-03-24 20:13:10', '2022-04-24 22:13:33', 10, 100);
INSERT INTO `exam` VALUES ('期中考试', 4, '2022-04-15 19:36:00', '2022-04-22 22:36:00', 10, 20);
INSERT INTO `exam` VALUES ('期末考试', 3, '2022-06-10 19:00:00', '2022-06-10 21:00:00', 10, 5);
INSERT INTO `exam` VALUES ('第一次月考', 3, '2022-04-21 20:09:40', '2022-04-24 22:09:44', 10, 100);
INSERT INTO `exam` VALUES ('第一次月考', 5, '2022-04-15 20:00:00', '2022-04-15 21:30:00', 10, 10);
INSERT INTO `exam` VALUES ('第三次月考', 3, '2022-04-23 15:40:00', '2022-04-23 19:44:00', 6, 20);
INSERT INTO `exam` VALUES ('第二次月考', 6, '2022-04-15 19:30:00', '2022-04-15 22:39:00', 10, 15);

-- ----------------------------
-- Table structure for examgrade
-- ----------------------------
DROP TABLE IF EXISTS `examgrade`;
CREATE TABLE `examgrade`  (
  `s_id` int(11) NOT NULL,
  `e_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `w_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `degree` int(255) NULL DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`s_id`, `e_name`, `w_name`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of examgrade
-- ----------------------------
INSERT INTO `examgrade` VALUES (10001, 'null', '测试一', 10, 6);
INSERT INTO `examgrade` VALUES (10001, '期中考试', 'null', 75, 3);
INSERT INTO `examgrade` VALUES (10001, '测试一', 'null', 0, 6);
INSERT INTO `examgrade` VALUES (10001, '测试二', 'null', 0, 6);
INSERT INTO `examgrade` VALUES (10001, '第一次月考', 'null', 100, 3);
INSERT INTO `examgrade` VALUES (10001, '第一次月考', 'null', 10, 5);
INSERT INTO `examgrade` VALUES (10001, '第三次月考', 'null', 20, 3);
INSERT INTO `examgrade` VALUES (10001, '第二次月考', 'null', 15, 6);
INSERT INTO `examgrade` VALUES (10002, '期中考试', 'null', 100, 3);
INSERT INTO `examgrade` VALUES (10003, '期中考试', 'null', 90, 3);
INSERT INTO `examgrade` VALUES (10003, '第一次月考', 'null', 50, 3);
INSERT INTO `examgrade` VALUES (10004, '期中考试', 'null', 60, 3);
INSERT INTO `examgrade` VALUES (10004, '第一次月考', 'null', 100, 3);
INSERT INTO `examgrade` VALUES (10005, '期中考试', 'null', 85, 3);
INSERT INTO `examgrade` VALUES (10006, '期中考试', 'null', 55, 3);
INSERT INTO `examgrade` VALUES (10006, '第一次月考', 'null', 100, 3);
INSERT INTO `examgrade` VALUES (10007, '期中考试', 'null', 90, 3);
INSERT INTO `examgrade` VALUES (10007, '第一次月考', 'null', 100, 3);
INSERT INTO `examgrade` VALUES (10008, '期中考试', 'null', 60, 3);
INSERT INTO `examgrade` VALUES (10008, '第一次月考', 'null', 50, 3);
INSERT INTO `examgrade` VALUES (10009, '期中考试', 'null', 75, 3);
INSERT INTO `examgrade` VALUES (10009, '第一次月考', 'null', 100, 3);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(11) NOT NULL COMMENT '班级号',
  `s_id` int(11) NOT NULL COMMENT '学号',
  `degree` int(255) NULL DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`id`, `s_id`) USING BTREE,
  INDEX `FK_s_id`(`s_id`) USING BTREE,
  CONSTRAINT `FK_id` FOREIGN KEY (`id`) REFERENCES `class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_s_id` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, 10001, NULL);
INSERT INTO `grade` VALUES (1, 10002, NULL);
INSERT INTO `grade` VALUES (1, 10003, NULL);
INSERT INTO `grade` VALUES (1, 10004, NULL);
INSERT INTO `grade` VALUES (2, 10001, NULL);
INSERT INTO `grade` VALUES (2, 10002, NULL);
INSERT INTO `grade` VALUES (3, 10001, 90);
INSERT INTO `grade` VALUES (3, 10002, NULL);
INSERT INTO `grade` VALUES (3, 10003, NULL);
INSERT INTO `grade` VALUES (3, 10004, NULL);
INSERT INTO `grade` VALUES (3, 10005, NULL);
INSERT INTO `grade` VALUES (3, 10006, NULL);
INSERT INTO `grade` VALUES (3, 10007, NULL);
INSERT INTO `grade` VALUES (3, 10008, NULL);
INSERT INTO `grade` VALUES (3, 10009, NULL);
INSERT INTO `grade` VALUES (4, 10001, NULL);
INSERT INTO `grade` VALUES (4, 10002, NULL);
INSERT INTO `grade` VALUES (5, 10001, NULL);
INSERT INTO `grade` VALUES (5, 10002, NULL);
INSERT INTO `grade` VALUES (6, 10001, NULL);
INSERT INTO `grade` VALUES (6, 10002, NULL);
INSERT INTO `grade` VALUES (7, 10001, 90);
INSERT INTO `grade` VALUES (7, 10002, 85);

-- ----------------------------
-- Table structure for problems
-- ----------------------------
DROP TABLE IF EXISTS `problems`;
CREATE TABLE `problems`  (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目id自增',
  `title` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目',
  `options1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '选项一',
  `options2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '选项二',
  `options3` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '选项三',
  `options4` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '选项四',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '答案',
  `degree` int(255) NULL DEFAULT NULL COMMENT '分数',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '类型',
  `e_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '考试名称',
  `w_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '作业名称',
  PRIMARY KEY (`p_id`) USING BTREE,
  INDEX `KF_e_name`(`e_name`) USING BTREE,
  INDEX `KF_w_name`(`w_name`) USING BTREE,
  CONSTRAINT `KF_e_name` FOREIGN KEY (`e_name`) REFERENCES `exam` (`e_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `KF_w_name` FOREIGN KEY (`w_name`) REFERENCES `word` (`w_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of problems
-- ----------------------------
INSERT INTO `problems` VALUES (4, '1-1=', '0', '1', '2', '3', 'A', 25, '单选题', '期中考试', NULL);
INSERT INTO `problems` VALUES (5, '1*1=', '1', '2', '3', '4', 'A', 25, '单选题', '期中考试', NULL);
INSERT INTO `problems` VALUES (6, '1+1=', '0', '1', '2', '3', 'C', 25, '单选题', '期中考试', NULL);
INSERT INTO `problems` VALUES (7, '1*1=', '1', '2', '3', '4', 'A', 10, '单选题', '期中考试', NULL);
INSERT INTO `problems` VALUES (8, '1+2=', '1', '2', '3', '4', 'C', 5, '单选题', '期末考试', NULL);
INSERT INTO `problems` VALUES (9, '1+5=？', '3', '5', '6', '8', 'C', 5, '单选题', '期中考试', NULL);
INSERT INTO `problems` VALUES (10, '5-1=?', '3', '4', '5', '6', 'B', 5, '单选题', '期中考试', NULL);
INSERT INTO `problems` VALUES (16, '4/2=？', '0', '1', '2', '3', 'C', 5, '单选题', NULL, '测试一');
INSERT INTO `problems` VALUES (17, '2+1=？', '1', '2', '3', '4', 'C', 5, '单选题', NULL, '测试一');
INSERT INTO `problems` VALUES (18, '8/2=？', '2', '4', '6', '8', 'B', 5, '单选题', '第二次月考', NULL);
INSERT INTO `problems` VALUES (19, '5 4=？', '4', '5', '6', '9', 'D', 5, '单选题', '第二次月考', NULL);
INSERT INTO `problems` VALUES (20, '5-3=？', '5', '4', '3', '2', 'D', 5, '单选题', '第二次月考', NULL);
INSERT INTO `problems` VALUES (25, '15*10', '75', '150', '1510', '1015', 'B', 50, '单选题', '第一次月考', NULL);
INSERT INTO `problems` VALUES (26, '42+35', '4235', '152', '77', '80', 'C', 50, '单选题', '第一次月考', NULL);
INSERT INTO `problems` VALUES (27, '2-1=？', '0', '1', '2', '4', 'B', 5, '单选题', NULL, '测试二');
INSERT INTO `problems` VALUES (28, '2+1=？', '0', '1', '2', '3', 'D', 5, '单选题', NULL, '测试二');
INSERT INTO `problems` VALUES (29, '5-3=？', '0', '1', '2', '3', 'C', 5, '单选题', NULL, '测试二');
INSERT INTO `problems` VALUES (32, '1=1?', 't', 'f', 't', 'f', 'A', 5, '单选题', NULL, 'thy');
INSERT INTO `problems` VALUES (33, '1+1=？', '0', '1', '2', '3', 'C', 5, '单选题', '第三次月考', NULL);
INSERT INTO `problems` VALUES (34, '2+1=？', '2', '3', '4', '5', 'B', 5, '单选题', '第三次月考', NULL);
INSERT INTO `problems` VALUES (35, '5-3=？', '1', '2', '3', '4', 'B', 5, '单选题', '第三次月考', NULL);
INSERT INTO `problems` VALUES (36, '3*3=?', '7', '8', '9', '0', 'C', 5, '单选题', '第三次月考', NULL);

-- ----------------------------
-- Table structure for s_discuss
-- ----------------------------
DROP TABLE IF EXISTS `s_discuss`;
CREATE TABLE `s_discuss`  (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讨论序列',
  `s_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复学生姓名',
  `s_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `s_titl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of s_discuss
-- ----------------------------
INSERT INTO `s_discuss` VALUES (1, '1', '杨星', '2022-04-22 19:28:33', '学到一些我们平时无法触及的领域，开拓了我们的视野');
INSERT INTO `s_discuss` VALUES (2, '6', 'hy', '2022-04-21 15:09:20', '从提高自我保护意识着手 要从安全教育工作经常提到的“四不伤害”入手,这其中的内涵就是首先要保护好自己。人都有求生的本能,安全,归根到底,就是每个职工不要受到伤害。要告诉全体职工,安全工作的目的就是要保护每个职工身心健康');
INSERT INTO `s_discuss` VALUES (5, '6', 'hy', '2022-04-21 15:44:20', '“《实施意见》强调,要深刻认识加强大中小学国家安全教育的重要性,准确把握加强大中小学国家安全教育的总体要求,全面贯彻落实党的十九大精神,以习近平新时代中国特色社会主义思想为指导,坚持和加强党对国家安全教育的领导,牢固树立和认真贯彻总体国家安全观,以国家安全战略需求为导向,全面落实加强大中小学国家安全教育的目标任务,系统设计、整体谋划,尊重规律、注重实效,部门联动、协同推进。”');
INSERT INTO `s_discuss` VALUES (6, '6', 'hy', '2022-04-21 15:44:53', '“《实施意见》强调,要深刻认识加强大中小学国家安全教育的重要性,准确把握加强大中小学国家安全教育的总体要求,全面贯彻落实党的十九大精神,以习近平新时代中国特色社会主义思想为指导,坚持和加强党对国家安全教育的领导,牢固树立和认真贯彻总体国家安全观,以国家安全战略需求为导向,全面落实加强大中小学国家安全教育的目标任务,系统设计、整体谋划,尊重规律、注重实效,部门联动、协同推进。”');
INSERT INTO `s_discuss` VALUES (7, '7', 'lz', '2022-04-22 13:02:18', '预习个屁');
INSERT INTO `s_discuss` VALUES (8, '7', 'hy', '2022-04-22 13:15:46', '预习了');
INSERT INTO `s_discuss` VALUES (9, '8', '李卓', '2022-04-23 14:37:53', '两个做项目真的太累了');
INSERT INTO `s_discuss` VALUES (10, '9', NULL, '2022-04-23 15:47:57', '预习好了');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NULL DEFAULT NULL,
  `sdate` date NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `FK_bookInfo_sales`(`bid`) USING BTREE,
  CONSTRAINT `FK_bookInfo_sales` FOREIGN KEY (`bid`) REFERENCES `bookinfo` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sales
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `s_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `s_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `s_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `s_tel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `s_sex` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `s_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `s_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`s_id`) USING BTREE,
  UNIQUE INDEX `s_email`(`s_email`) USING BTREE,
  UNIQUE INDEX `s_tel`(`s_tel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10012 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (10001, 'hy', '2445222672@qq.com', '17873475828', '男', '430422200111111111', 'c8837b23ff8aaa8a2dde915473ce0991');
INSERT INTO `student` VALUES (10002, 'yhn', '1664309541@qq.com', '12345678912', '男', '888888888888888888', 'c8837b23ff8aaa8a2dde915473ce0991');
INSERT INTO `student` VALUES (10003, 'hwb', '3428300244@qq.com', '13545622452', '男', '432425200001141526', 'c8837b23ff8aaa8a2dde915473ce0991');
INSERT INTO `student` VALUES (10004, 'lbz', '3164993804@qq.com', '18811111111', '男', '425521201204152578', 'c8837b23ff8aaa8a2dde915473ce0991');
INSERT INTO `student` VALUES (10005, 'thy2', '1635652163@qq.com', '15266312122', '男', '461121255201232122', 'c8837b23ff8aaa8a2dde915473ce0991');
INSERT INTO `student` VALUES (10006, 'thy1', '1578652163@qq.com', '18261232122', '男', '450221255201232122', 'c8837b23ff8aaa8a2dde915473ce0991');
INSERT INTO `student` VALUES (10007, '谭辉映', '1638652163@qq.com', '13561232122', '男', '430221255201232122', 'c8837b23ff8aaa8a2dde915473ce0991');
INSERT INTO `student` VALUES (10008, '李卓', '1838652163@qq.com', '18851232122', '男', '48521255201232122', 'c8837b23ff8aaa8a2dde915473ce0991');
INSERT INTO `student` VALUES (10009, '康益铭', '87652652163@qq.com', '15354232122', '男', '75212255201232122', 'c8837b23ff8aaa8a2dde915473ce0991');
INSERT INTO `student` VALUES (10010, '俞浩南', '98752652163@qq.com', '15354567612', '男', '13013255201232122', 'c8837b23ff8aaa8a2dde915473ce0991');
INSERT INTO `student` VALUES (10011, '李秉璋', '15642652163@qq.com', '15852567612', '男', '58635155201232122', 'c8837b23ff8aaa8a2dde915473ce0991');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `t_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '教师号',
  `t_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `t_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `t_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `t_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `t_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `t_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师密码',
  `depart` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在院系',
  `prof` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职称',
  PRIMARY KEY (`t_id`) USING BTREE,
  UNIQUE INDEX `t_tel`(`t_tel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'mzz', '女', '18888888888', 'null', '', '7fa8282ad93047a4d6fe6111c93b308a', '计算机学院', '教授');
INSERT INTO `teacher` VALUES (2, 'kym', '男', '11111111111', NULL, NULL, 'e9b54407ca88c0a107792a7158aa72f5', '南华大学', '教授');
INSERT INTO `teacher` VALUES (3, 'andy', '女', '13333333333', '1333333333@qq.com', NULL, '123321', '数理学院', '研究生导师');

-- ----------------------------
-- Table structure for word
-- ----------------------------
DROP TABLE IF EXISTS `word`;
CREATE TABLE `word`  (
  `id` int(11) NOT NULL,
  `w_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `starttime` datetime NULL DEFAULT NULL,
  `endtime` datetime NULL DEFAULT NULL,
  `degree` int(11) NULL DEFAULT NULL,
  INDEX `KF_word_id`(`id`) USING BTREE,
  INDEX `w_name`(`w_name`) USING BTREE,
  CONSTRAINT `KF_word_id` FOREIGN KEY (`id`) REFERENCES `class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of word
-- ----------------------------
INSERT INTO `word` VALUES (3, '第一次作业', '2022-03-25 15:24:53', '2022-03-26 15:25:08', 20);
INSERT INTO `word` VALUES (6, '测试一', '2022-04-13 20:50:00', '2022-04-14 20:50:00', 10);
INSERT INTO `word` VALUES (6, '测试二', '2022-04-18 17:43:00', '2022-04-19 17:43:00', 15);
INSERT INTO `word` VALUES (22, 'thy', '2022-04-23 13:00:00', '2022-04-22 14:00:00', 5);

SET FOREIGN_KEY_CHECKS = 1;
