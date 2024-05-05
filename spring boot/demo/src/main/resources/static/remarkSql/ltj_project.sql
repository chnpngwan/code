/*
 Navicat Premium Data Transfer

 Source Server         : jm
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : software

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 08/04/2024 01:57:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attendance_records_score
-- ----------------------------
DROP TABLE IF EXISTS `attendance_records_score`;
CREATE TABLE `attendance_records_score` (
  `stu_number` int DEFAULT NULL COMMENT '学生序号',
  `stu_id` bigint NOT NULL COMMENT '学生学号',
  `stu_name` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学生姓名',
  `stu_class` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学生班级',
  `one_score` double DEFAULT NULL COMMENT '第一次成绩',
  `two_score` double DEFAULT NULL COMMENT '第二次成绩',
  `three_sroce` double DEFAULT NULL COMMENT '第三次成绩',
  `four_score` double DEFAULT NULL COMMENT '第四次成绩',
  `five_score` double DEFAULT NULL COMMENT '第五次成绩',
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='考勤分数表';

-- ----------------------------
-- Records of attendance_records_score
-- ----------------------------
BEGIN;
INSERT INTO `attendance_records_score` VALUES (1, 20181203922, '王子康', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (1, 20191202255, '纪嘉俊', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (2, 20191202610, '段兴江', '2021软件工程2班', 100, 60, 60, 0, 0);
INSERT INTO `attendance_records_score` VALUES (2, 20201202139, '张子龙', '2021软件工程1班', 100, 60, 60, 0, 0);
INSERT INTO `attendance_records_score` VALUES (3, 20211200384, '严芊芊', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (3, 20211200385, '顾培皓', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (4, 20211200551, '曾繁一', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (4, 20211200553, '王宗祥', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (5, 20211200556, '王鑫', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (6, 20211200558, '王贵萱', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (7, 20211200584, '何彦莹', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (5, 20211200596, '于舒睿', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (6, 20211200598, '张杨', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (7, 20211200601, '孙欣欣', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (8, 20211200602, '刘鑫宇', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (9, 20211200605, '郑琳', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (8, 20211200606, '迟稼铭', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (10, 20211200710, '汪康', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (9, 20211200711, '章嘉劭', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (11, 20211200719, '王鹏', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (10, 20211201119, '王福龙', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (12, 20211201141, '闫政', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (13, 20211201148, '郭会发', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (14, 20211201392, '孙可言', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (15, 20211201418, '刘陵', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (11, 20211201454, '何海兴', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (12, 20211201457, '赵旋', '2021软件工程2班', 100, 95, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (16, 20211201458, '焦海霞', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (17, 20211201483, '张含锋', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (13, 20211201659, '彭锦龙', '2021软件工程2班', 100, 100, 95, 0, 0);
INSERT INTO `attendance_records_score` VALUES (14, 20211201766, '李欣欢', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (15, 20211201785, '马乐晨', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (16, 20211201793, '乔佳昕', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (18, 20211201803, '张士博', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (19, 20211201804, '葛怀睿', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (20, 20211201806, '刘帅博', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (21, 20211201849, '魏继瑶', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (17, 20211201867, '付陈瑶', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (22, 20211201874, '郭伟康', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (23, 20211201875, '王林超', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (24, 20211201878, '杨嘉沐', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (18, 20211201890, '常宏伟', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (19, 20211201893, '韩森宇', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (25, 20211201897, '张锐颀', '2021软件工程1班', 100, 100, 95, 0, 0);
INSERT INTO `attendance_records_score` VALUES (26, 20211201899, '刘子轩', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (20, 20211201900, '王腾鑫', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (21, 20211201902, '张睿泽', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (27, 20211201903, '董美娇', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (28, 20211202068, '常松', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (22, 20211202069, '刘庆龙', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (23, 20211202072, '邢子阳', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (29, 20211202073, '陈浩然', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (24, 20211202079, '祁明扬', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (25, 20211202081, '任靓', '2021软件工程2班', 100, 100, 95, 0, 0);
INSERT INTO `attendance_records_score` VALUES (30, 20211202083, '高铎', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (26, 20211202090, '姚祥桐', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (27, 20211202095, '王雅鑫', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (31, 20211202101, '陈广硕', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (32, 20211202103, '张瑛琪', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (28, 20211202104, '耿唯瀚', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (33, 20211202111, '张博', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (29, 20211202112, '李明哲', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (34, 20211202125, '黄照凯', '2021软件工程1班', 100, 100, 90, 0, 0);
INSERT INTO `attendance_records_score` VALUES (30, 20211202312, '徐婷', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (35, 20211202326, '李俊兰', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (31, 20211202355, '支毅博', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (32, 20211202362, '赵佳乐', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (36, 20211202380, '李轩', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (33, 20211202487, '翟翱', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (37, 20211202495, '饶峰', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (38, 20211202543, '罗民富', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (39, 20211202705, '丁金洋', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (34, 20211202720, '张书通', '2021软件工程2班', 100, 100, 90, 0, 0);
INSERT INTO `attendance_records_score` VALUES (40, 20211202723, '田兆卓', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (41, 20211202724, '王洪福', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (35, 20211202726, '李韩', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (36, 20211202730, '郭桐羽', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (37, 20211202732, '张宇', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (38, 20211202744, '王祉桥', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (39, 20211202754, '刘扬', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (42, 20211202759, '唐文勃', '2021软件工程1班', 100, 100, 95, 0, 0);
INSERT INTO `attendance_records_score` VALUES (40, 20211202822, '何通海', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (41, 20211202855, '任子豪', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (43, 20211202868, '孙艺慧', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (44, 20211202878, '涂泉源', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (42, 20211202881, '吴健南', '2021软件工程2班', 100, 100, 95, 0, 0);
INSERT INTO `attendance_records_score` VALUES (45, 20211202900, '陈梦飞', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (43, 20211202947, '许孙凯', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (44, 20211202948, '白明涛', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (46, 20211203012, '王冠涵', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (47, 20211203035, '卢平', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (48, 20211203038, '刘浩宇', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (45, 20211203042, '信帅权', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (46, 20211203047, '邓大卫', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (49, 20211203049, '尹春普', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (47, 20211203059, '刘思豪', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (48, 20211203089, '张义超', '2021软件工程2班', 100, 67, 0, 0, 0);
INSERT INTO `attendance_records_score` VALUES (49, 20211203091, '王格格', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (50, 20211203783, '张楠', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (50, 20211203792, '戴明东', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (51, 20211203974, '李涵', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (52, 20211203978, '栾凯越', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (51, 20211203980, '刘佳欣', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (52, 20211203983, '郑久彤', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (53, 20211203986, '崔惟桓', '2021软件工程2班', 100, 0, 67, 0, 0);
INSERT INTO `attendance_records_score` VALUES (54, 20211203987, '刘晨阳', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (55, 20211203994, '吴航宇', '2021软件工程2班', 0, 0, 33, 0, 0);
INSERT INTO `attendance_records_score` VALUES (56, 20211203996, '夏单祁', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (53, 20211204314, '阮龙', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (54, 20211204412, '唐韧', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (55, 20211204414, '周作友', '2021软件工程1班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (57, 20211204434, '尹才华', '2021软件工程2班', 100, 100, 100, 0, 0);
INSERT INTO `attendance_records_score` VALUES (56, 20211204954, '张溪桐', '2021软件工程1班', 100, 100, 100, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for experiment_reports_score
-- ----------------------------
DROP TABLE IF EXISTS `experiment_reports_score`;
CREATE TABLE `experiment_reports_score` (
  `stu_number` int DEFAULT NULL COMMENT '学生序号',
  `stu_id` bigint NOT NULL COMMENT '学生学号',
  `stu_name` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学生姓名',
  `stu_class` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学生班级',
  `one_score` double DEFAULT NULL COMMENT '第一次成绩',
  `two_score` double DEFAULT NULL COMMENT '第二次成绩',
  `three_sroce` double DEFAULT NULL COMMENT '第三次成绩',
  `four_score` double DEFAULT NULL COMMENT '第四次成绩',
  `five_score` double DEFAULT NULL COMMENT '第五次成绩',
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='实验报告分数表';

-- ----------------------------
-- Records of experiment_reports_score
-- ----------------------------
BEGIN;
INSERT INTO `experiment_reports_score` VALUES (1, 20181203922, '王子康', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (1, 20191202255, '纪嘉俊', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (2, 20191202610, '段兴江', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (2, 20201202139, '张子龙', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (3, 20211200384, '严芊芊', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (3, 20211200385, '顾培皓', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (4, 20211200551, '曾繁一', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (4, 20211200553, '王宗祥', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (5, 20211200556, '王鑫', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (6, 20211200558, '王贵萱', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (7, 20211200584, '何彦莹', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (5, 20211200596, '于舒睿', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (6, 20211200598, '张杨', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (7, 20211200601, '孙欣欣', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (8, 20211200602, '刘鑫宇', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (9, 20211200605, '郑琳', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (8, 20211200606, '迟稼铭', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (10, 20211200710, '汪康', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (9, 20211200711, '章嘉劭', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (11, 20211200719, '王鹏', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (10, 20211201119, '王福龙', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (12, 20211201141, '闫政', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (13, 20211201148, '郭会发', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (14, 20211201392, '孙可言', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (15, 20211201418, '刘陵', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (11, 20211201454, '何海兴', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (12, 20211201457, '赵旋', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (16, 20211201458, '焦海霞', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (17, 20211201483, '张含锋', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (13, 20211201659, '彭锦龙', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (14, 20211201766, '李欣欢', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (15, 20211201785, '马乐晨', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (16, 20211201793, '乔佳昕', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (18, 20211201803, '张士博', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (19, 20211201804, '葛怀睿', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (20, 20211201806, '刘帅博', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (21, 20211201849, '魏继瑶', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (17, 20211201867, '付陈瑶', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (22, 20211201874, '郭伟康', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (23, 20211201875, '王林超', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (24, 20211201878, '杨嘉沐', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (18, 20211201890, '常宏伟', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (19, 20211201893, '韩森宇', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (25, 20211201897, '张锐颀', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (26, 20211201899, '刘子轩', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (20, 20211201900, '王腾鑫', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (21, 20211201902, '张睿泽', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (27, 20211201903, '董美娇', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (28, 20211202068, '常松', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (22, 20211202069, '刘庆龙', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (23, 20211202072, '邢子阳', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (29, 20211202073, '陈浩然', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (24, 20211202079, '祁明扬', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (25, 20211202081, '任靓', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (30, 20211202083, '高铎', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (26, 20211202090, '姚祥桐', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (27, 20211202095, '王雅鑫', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (31, 20211202101, '陈广硕', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (32, 20211202103, '张瑛琪', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (28, 20211202104, '耿唯瀚', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (33, 20211202111, '张博', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (29, 20211202112, '李明哲', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (34, 20211202125, '黄照凯', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (30, 20211202312, '徐婷', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (35, 20211202326, '李俊兰', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (31, 20211202355, '支毅博', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (32, 20211202362, '赵佳乐', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (36, 20211202380, '李轩', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (33, 20211202487, '翟翱', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (37, 20211202495, '饶峰', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (38, 20211202543, '罗民富', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (39, 20211202705, '丁金洋', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (34, 20211202720, '张书通', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (40, 20211202723, '田兆卓', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (41, 20211202724, '王洪福', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (35, 20211202726, '李韩', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (36, 20211202730, '郭桐羽', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (37, 20211202732, '张宇', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (38, 20211202744, '王祉桥', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (39, 20211202754, '刘扬', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (42, 20211202759, '唐文勃', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (40, 20211202822, '何通海', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (41, 20211202855, '任子豪', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (43, 20211202868, '孙艺慧', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (44, 20211202878, '涂泉源', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (42, 20211202881, '吴健南', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (45, 20211202900, '陈梦飞', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (43, 20211202947, '许孙凯', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (44, 20211202948, '白明涛', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (46, 20211203012, '王冠涵', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (47, 20211203035, '卢平', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (48, 20211203038, '刘浩宇', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (45, 20211203042, '信帅权', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (46, 20211203047, '邓大卫', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (49, 20211203049, '尹春普', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (47, 20211203059, '刘思豪', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (48, 20211203089, '张义超', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (49, 20211203091, '王格格', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (50, 20211203783, '张楠', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (50, 20211203792, '戴明东', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (51, 20211203974, '李涵', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (52, 20211203978, '栾凯越', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (51, 20211203980, '刘佳欣', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (52, 20211203983, '郑久彤', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (53, 20211203986, '崔惟桓', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (54, 20211203987, '刘晨阳', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (55, 20211203994, '吴航宇', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (56, 20211203996, '夏单祁', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (53, 20211204314, '阮龙', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (54, 20211204412, '唐韧', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (55, 20211204414, '周作友', '2021软件工程1班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (57, 20211204434, '尹才华', '2021软件工程2班', 0, 0, 0, 0, 0);
INSERT INTO `experiment_reports_score` VALUES (56, 20211204954, '张溪桐', '2021软件工程1班', 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for final_visit_score
-- ----------------------------
DROP TABLE IF EXISTS `final_visit_score`;
CREATE TABLE `final_visit_score` (
  `stu_number` int DEFAULT NULL COMMENT '学生序号',
  `stu_id` bigint NOT NULL COMMENT '学生学号',
  `stu_name` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学生姓名',
  `stu_class` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学生班级',
  `score` double DEFAULT NULL COMMENT '期末成绩',
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='期末考察分数表';

-- ----------------------------
-- Records of final_visit_score
-- ----------------------------
BEGIN;
INSERT INTO `final_visit_score` VALUES (1, 20181203922, '王子康', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (1, 20191202255, '纪嘉俊', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (2, 20191202610, '段兴江', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (2, 20201202139, '张子龙', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (3, 20211200384, '严芊芊', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (3, 20211200385, '顾培皓', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (4, 20211200551, '曾繁一', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (4, 20211200553, '王宗祥', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (5, 20211200556, '王鑫', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (6, 20211200558, '王贵萱', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (7, 20211200584, '何彦莹', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (5, 20211200596, '于舒睿', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (6, 20211200598, '张杨', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (7, 20211200601, '孙欣欣', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (8, 20211200602, '刘鑫宇', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (9, 20211200605, '郑琳', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (8, 20211200606, '迟稼铭', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (10, 20211200710, '汪康', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (9, 20211200711, '章嘉劭', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (11, 20211200719, '王鹏', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (10, 20211201119, '王福龙', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (12, 20211201141, '闫政', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (13, 20211201148, '郭会发', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (14, 20211201392, '孙可言', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (15, 20211201418, '刘陵', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (11, 20211201454, '何海兴', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (12, 20211201457, '赵旋', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (16, 20211201458, '焦海霞', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (17, 20211201483, '张含锋', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (13, 20211201659, '彭锦龙', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (14, 20211201766, '李欣欢', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (15, 20211201785, '马乐晨', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (16, 20211201793, '乔佳昕', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (18, 20211201803, '张士博', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (19, 20211201804, '葛怀睿', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (20, 20211201806, '刘帅博', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (21, 20211201849, '魏继瑶', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (17, 20211201867, '付陈瑶', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (22, 20211201874, '郭伟康', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (23, 20211201875, '王林超', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (24, 20211201878, '杨嘉沐', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (18, 20211201890, '常宏伟', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (19, 20211201893, '韩森宇', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (25, 20211201897, '张锐颀', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (26, 20211201899, '刘子轩', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (20, 20211201900, '王腾鑫', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (21, 20211201902, '张睿泽', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (27, 20211201903, '董美娇', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (28, 20211202068, '常松', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (22, 20211202069, '刘庆龙', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (23, 20211202072, '邢子阳', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (29, 20211202073, '陈浩然', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (24, 20211202079, '祁明扬', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (25, 20211202081, '任靓', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (30, 20211202083, '高铎', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (26, 20211202090, '姚祥桐', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (27, 20211202095, '王雅鑫', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (31, 20211202101, '陈广硕', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (32, 20211202103, '张瑛琪', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (28, 20211202104, '耿唯瀚', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (33, 20211202111, '张博', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (29, 20211202112, '李明哲', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (34, 20211202125, '黄照凯', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (30, 20211202312, '徐婷', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (35, 20211202326, '李俊兰', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (31, 20211202355, '支毅博', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (32, 20211202362, '赵佳乐', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (36, 20211202380, '李轩', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (33, 20211202487, '翟翱', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (37, 20211202495, '饶峰', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (38, 20211202543, '罗民富', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (39, 20211202705, '丁金洋', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (34, 20211202720, '张书通', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (40, 20211202723, '田兆卓', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (41, 20211202724, '王洪福', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (35, 20211202726, '李韩', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (36, 20211202730, '郭桐羽', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (37, 20211202732, '张宇', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (38, 20211202744, '王祉桥', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (39, 20211202754, '刘扬', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (42, 20211202759, '唐文勃', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (40, 20211202822, '何通海', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (41, 20211202855, '任子豪', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (43, 20211202868, '孙艺慧', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (44, 20211202878, '涂泉源', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (42, 20211202881, '吴健南', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (45, 20211202900, '陈梦飞', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (43, 20211202947, '许孙凯', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (44, 20211202948, '白明涛', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (46, 20211203012, '王冠涵', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (47, 20211203035, '卢平', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (48, 20211203038, '刘浩宇', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (45, 20211203042, '信帅权', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (46, 20211203047, '邓大卫', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (49, 20211203049, '尹春普', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (47, 20211203059, '刘思豪', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (48, 20211203089, '张义超', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (49, 20211203091, '王格格', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (50, 20211203783, '张楠', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (50, 20211203792, '戴明东', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (51, 20211203974, '李涵', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (52, 20211203978, '栾凯越', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (51, 20211203980, '刘佳欣', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (52, 20211203983, '郑久彤', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (53, 20211203986, '崔惟桓', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (54, 20211203987, '刘晨阳', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (55, 20211203994, '吴航宇', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (56, 20211203996, '夏单祁', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (53, 20211204314, '阮龙', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (54, 20211204412, '唐韧', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (55, 20211204414, '周作友', '2021软件工程1班', 0);
INSERT INTO `final_visit_score` VALUES (57, 20211204434, '尹才华', '2021软件工程2班', 0);
INSERT INTO `final_visit_score` VALUES (56, 20211204954, '张溪桐', '2021软件工程1班', 0);
COMMIT;

-- ----------------------------
-- Table structure for lishihui_system_user
-- ----------------------------
DROP TABLE IF EXISTS `lishihui_system_user`;
CREATE TABLE `lishihui_system_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `delstatus` int DEFAULT '0',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` int DEFAULT '1' COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='逻辑删去-默认是0，逻辑删去后标为1';

-- ----------------------------
-- Records of lishihui_system_user
-- ----------------------------
BEGIN;
INSERT INTO `lishihui_system_user` VALUES (1, '小李', '124', '女', 10, '1111113', '丽江', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (2, 't', '123', '5', 21, '不要修改t用户', '不要修改t用户', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (4, '小张', '999999', '男', 10, '1851919198', '火星水星', '2020-10-16', '99@qq.com', 0, '2021-10-31 20:35:36', '2021-10-31 20:55:52', 1);
INSERT INTO `lishihui_system_user` VALUES (5, '小雪', '999999', '男', 20, '1851919198', '火星2', '2020-10-17', '99@qq.com', 1, '2021-10-31 20:35:36', '2021-10-31 20:35:36', 1);
INSERT INTO `lishihui_system_user` VALUES (6, '大李', '999999', '女', 21, '1881919879', '武汉', '2021-10-31', '99@qq.com', 0, '2021-10-31 20:40:13', '2021-10-31 20:40:13', 1);
INSERT INTO `lishihui_system_user` VALUES (22, '大李', NULL, '男', 29, '44058871', '丽江', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (24, '花猫', '123', '男', 29, '17687188085', '丽江', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (26, '天蓬', '999999', '1111', 50, '1111', '111', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (29, '1111', NULL, 'nan', 18, '', 'xx', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (30, 'ka', NULL, '1', 15, '2456', '3', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (32, 'admins', NULL, '女', 18, '12', '硅谷', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (33, '宝玉', '123456', '男', 22, '4521', NULL, NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (35, '', NULL, '666', 26, '', '', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (37, '', NULL, '女', 18, '', '沈阳大街', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (38, '日光', NULL, '男', 21, '', '地球核心', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (66, '小歪', NULL, '女', 21, '', '月球', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (67, '小花猫', '333', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (68, '大花猫', NULL, '男', 19, '123', '123', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (70, 'tt1', NULL, '女', 78, '44058871', '丽江', NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO `lishihui_system_user` VALUES (71, '张俊杰', '123', '男', 12, '15812341234', '中国', NULL, NULL, 0, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for project_checks_score
-- ----------------------------
DROP TABLE IF EXISTS `project_checks_score`;
CREATE TABLE `project_checks_score` (
  `stu_number` int DEFAULT NULL COMMENT '学生序号',
  `stu_id` bigint NOT NULL COMMENT '学生学号',
  `stu_name` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学生姓名',
  `stu_class` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学生班级',
  `one_score` double DEFAULT NULL COMMENT '第一次成绩',
  `two_score` double DEFAULT NULL COMMENT '第二次成绩',
  `three_sroce` double DEFAULT NULL COMMENT '第三次成绩',
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='项目检查分数表';

-- ----------------------------
-- Records of project_checks_score
-- ----------------------------
BEGIN;
INSERT INTO `project_checks_score` VALUES (1, 20181203922, '王子康', '2021软件工程2班', -10, 0, 0);
INSERT INTO `project_checks_score` VALUES (1, 20191202255, '纪嘉俊', '2021软件工程1班', 95, 0, 0);
INSERT INTO `project_checks_score` VALUES (2, 20191202610, '段兴江', '2021软件工程2班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (2, 20201202139, '张子龙', '2021软件工程1班', 0, 0, 0);
INSERT INTO `project_checks_score` VALUES (3, 20211200384, '严芊芊', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (3, 20211200385, '顾培皓', '2021软件工程2班', 75, 0, 0);
INSERT INTO `project_checks_score` VALUES (4, 20211200551, '曾繁一', '2021软件工程1班', 98, 0, 0);
INSERT INTO `project_checks_score` VALUES (4, 20211200553, '王宗祥', '2021软件工程2班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (5, 20211200556, '王鑫', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (6, 20211200558, '王贵萱', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (7, 20211200584, '何彦莹', '2021软件工程1班', 98, 0, 0);
INSERT INTO `project_checks_score` VALUES (5, 20211200596, '于舒睿', '2021软件工程2班', 85, 0, 0);
INSERT INTO `project_checks_score` VALUES (6, 20211200598, '张杨', '2021软件工程2班', -7, 0, 0);
INSERT INTO `project_checks_score` VALUES (7, 20211200601, '孙欣欣', '2021软件工程2班', 0, 0, 0);
INSERT INTO `project_checks_score` VALUES (8, 20211200602, '刘鑫宇', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (9, 20211200605, '郑琳', '2021软件工程1班', 98, 0, 0);
INSERT INTO `project_checks_score` VALUES (8, 20211200606, '迟稼铭', '2021软件工程2班', -10, 0, 0);
INSERT INTO `project_checks_score` VALUES (10, 20211200710, '汪康', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (9, 20211200711, '章嘉劭', '2021软件工程2班', 93, 0, 0);
INSERT INTO `project_checks_score` VALUES (11, 20211200719, '王鹏', '2021软件工程1班', 98, 0, 0);
INSERT INTO `project_checks_score` VALUES (10, 20211201119, '王福龙', '2021软件工程2班', 80, 0, 0);
INSERT INTO `project_checks_score` VALUES (12, 20211201141, '闫政', '2021软件工程1班', 98, 0, 0);
INSERT INTO `project_checks_score` VALUES (13, 20211201148, '郭会发', '2021软件工程1班', 98, 0, 0);
INSERT INTO `project_checks_score` VALUES (14, 20211201392, '孙可言', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (15, 20211201418, '刘陵', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (11, 20211201454, '何海兴', '2021软件工程2班', 93, 0, 0);
INSERT INTO `project_checks_score` VALUES (12, 20211201457, '赵旋', '2021软件工程2班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (16, 20211201458, '焦海霞', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (17, 20211201483, '张含锋', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (13, 20211201659, '彭锦龙', '2021软件工程2班', 60, 0, 0);
INSERT INTO `project_checks_score` VALUES (14, 20211201766, '李欣欢', '2021软件工程2班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (15, 20211201785, '马乐晨', '2021软件工程2班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (16, 20211201793, '乔佳昕', '2021软件工程2班', 93, 0, 0);
INSERT INTO `project_checks_score` VALUES (18, 20211201803, '张士博', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (19, 20211201804, '葛怀睿', '2021软件工程1班', 109, 0, 0);
INSERT INTO `project_checks_score` VALUES (20, 20211201806, '刘帅博', '2021软件工程1班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (21, 20211201849, '魏继瑶', '2021软件工程1班', 98, 0, 0);
INSERT INTO `project_checks_score` VALUES (17, 20211201867, '付陈瑶', '2021软件工程2班', 60, 0, 0);
INSERT INTO `project_checks_score` VALUES (22, 20211201874, '郭伟康', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (23, 20211201875, '王林超', '2021软件工程1班', 60, 0, 0);
INSERT INTO `project_checks_score` VALUES (24, 20211201878, '杨嘉沐', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (18, 20211201890, '常宏伟', '2021软件工程2班', 110, 0, 0);
INSERT INTO `project_checks_score` VALUES (19, 20211201893, '韩森宇', '2021软件工程2班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (25, 20211201897, '张锐颀', '2021软件工程1班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (26, 20211201899, '刘子轩', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (20, 20211201900, '王腾鑫', '2021软件工程2班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (21, 20211201902, '张睿泽', '2021软件工程2班', -5, 0, 0);
INSERT INTO `project_checks_score` VALUES (27, 20211201903, '董美娇', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (28, 20211202068, '常松', '2021软件工程1班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (22, 20211202069, '刘庆龙', '2021软件工程2班', 80, 0, 0);
INSERT INTO `project_checks_score` VALUES (23, 20211202072, '邢子阳', '2021软件工程2班', 60, 0, 0);
INSERT INTO `project_checks_score` VALUES (29, 20211202073, '陈浩然', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (24, 20211202079, '祁明扬', '2021软件工程2班', 110, 0, 0);
INSERT INTO `project_checks_score` VALUES (25, 20211202081, '任靓', '2021软件工程2班', 95, 0, 0);
INSERT INTO `project_checks_score` VALUES (30, 20211202083, '高铎', '2021软件工程1班', 98, 0, 0);
INSERT INTO `project_checks_score` VALUES (26, 20211202090, '姚祥桐', '2021软件工程2班', 95, 0, 0);
INSERT INTO `project_checks_score` VALUES (27, 20211202095, '王雅鑫', '2021软件工程2班', 95, 0, 0);
INSERT INTO `project_checks_score` VALUES (31, 20211202101, '陈广硕', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (32, 20211202103, '张瑛琪', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (28, 20211202104, '耿唯瀚', '2021软件工程2班', 80, 0, 0);
INSERT INTO `project_checks_score` VALUES (33, 20211202111, '张博', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (29, 20211202112, '李明哲', '2021软件工程2班', 85, 0, 0);
INSERT INTO `project_checks_score` VALUES (34, 20211202125, '黄照凯', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (30, 20211202312, '徐婷', '2021软件工程2班', 95, 0, 0);
INSERT INTO `project_checks_score` VALUES (35, 20211202326, '李俊兰', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (31, 20211202355, '支毅博', '2021软件工程2班', 75, 0, 0);
INSERT INTO `project_checks_score` VALUES (32, 20211202362, '赵佳乐', '2021软件工程2班', 60, 0, 0);
INSERT INTO `project_checks_score` VALUES (36, 20211202380, '李轩', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (33, 20211202487, '翟翱', '2021软件工程2班', 95, 0, 0);
INSERT INTO `project_checks_score` VALUES (37, 20211202495, '饶峰', '2021软件工程1班', 96, 0, 0);
INSERT INTO `project_checks_score` VALUES (38, 20211202543, '罗民富', '2021软件工程1班', 97, 0, 0);
INSERT INTO `project_checks_score` VALUES (39, 20211202705, '丁金洋', '2021软件工程1班', 98, 0, 0);
INSERT INTO `project_checks_score` VALUES (34, 20211202720, '张书通', '2021软件工程2班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (40, 20211202723, '田兆卓', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (41, 20211202724, '王洪福', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (35, 20211202726, '李韩', '2021软件工程2班', 80, 0, 0);
INSERT INTO `project_checks_score` VALUES (36, 20211202730, '郭桐羽', '2021软件工程2班', -20, 0, 0);
INSERT INTO `project_checks_score` VALUES (37, 20211202732, '张宇', '2021软件工程2班', 85, 0, 0);
INSERT INTO `project_checks_score` VALUES (38, 20211202744, '王祉桥', '2021软件工程2班', 110, 0, 0);
INSERT INTO `project_checks_score` VALUES (39, 20211202754, '刘扬', '2021软件工程2班', -10, 0, 0);
INSERT INTO `project_checks_score` VALUES (42, 20211202759, '唐文勃', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (40, 20211202822, '何通海', '2021软件工程2班', 95, 0, 0);
INSERT INTO `project_checks_score` VALUES (41, 20211202855, '任子豪', '2021软件工程2班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (43, 20211202868, '孙艺慧', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (44, 20211202878, '涂泉源', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (42, 20211202881, '吴健南', '2021软件工程2班', 85, 0, 0);
INSERT INTO `project_checks_score` VALUES (45, 20211202900, '陈梦飞', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (43, 20211202947, '许孙凯', '2021软件工程2班', 95, 0, 0);
INSERT INTO `project_checks_score` VALUES (44, 20211202948, '白明涛', '2021软件工程2班', 95, 0, 0);
INSERT INTO `project_checks_score` VALUES (46, 20211203012, '王冠涵', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (47, 20211203035, '卢平', '2021软件工程1班', 98, 0, 0);
INSERT INTO `project_checks_score` VALUES (48, 20211203038, '刘浩宇', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (45, 20211203042, '信帅权', '2021软件工程2班', 60, 0, 0);
INSERT INTO `project_checks_score` VALUES (46, 20211203047, '邓大卫', '2021软件工程2班', 110, 0, 0);
INSERT INTO `project_checks_score` VALUES (49, 20211203049, '尹春普', '2021软件工程1班', 98, 0, 0);
INSERT INTO `project_checks_score` VALUES (47, 20211203059, '刘思豪', '2021软件工程2班', 93, 0, 0);
INSERT INTO `project_checks_score` VALUES (48, 20211203089, '张义超', '2021软件工程2班', 60, 0, 0);
INSERT INTO `project_checks_score` VALUES (49, 20211203091, '王格格', '2021软件工程2班', 110, 0, 0);
INSERT INTO `project_checks_score` VALUES (50, 20211203783, '张楠', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (50, 20211203792, '戴明东', '2021软件工程2班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (51, 20211203974, '李涵', '2021软件工程2班', 110, 0, 0);
INSERT INTO `project_checks_score` VALUES (52, 20211203978, '栾凯越', '2021软件工程2班', 85, 0, 0);
INSERT INTO `project_checks_score` VALUES (51, 20211203980, '刘佳欣', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (52, 20211203983, '郑久彤', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (53, 20211203986, '崔惟桓', '2021软件工程2班', -10, 0, 0);
INSERT INTO `project_checks_score` VALUES (54, 20211203987, '刘晨阳', '2021软件工程2班', -10, 0, 0);
INSERT INTO `project_checks_score` VALUES (55, 20211203994, '吴航宇', '2021软件工程2班', -10, 0, 0);
INSERT INTO `project_checks_score` VALUES (56, 20211203996, '夏单祁', '2021软件工程2班', 95, 0, 0);
INSERT INTO `project_checks_score` VALUES (53, 20211204314, '阮龙', '2021软件工程1班', 105, 0, 0);
INSERT INTO `project_checks_score` VALUES (54, 20211204412, '唐韧', '2021软件工程1班', 100, 0, 0);
INSERT INTO `project_checks_score` VALUES (55, 20211204414, '周作友', '2021软件工程1班', 90, 0, 0);
INSERT INTO `project_checks_score` VALUES (57, 20211204434, '尹才华', '2021软件工程2班', -10, 0, 0);
INSERT INTO `project_checks_score` VALUES (56, 20211204954, '张溪桐', '2021软件工程1班', 90, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for project_group_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `project_group_basic_info`;
CREATE TABLE `project_group_basic_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_number` int DEFAULT NULL COMMENT '分组号',
  `project_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '项目id',
  `leader_name` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组长',
  `student_id` bigint DEFAULT NULL COMMENT '学生id',
  `class_grade` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '年级',
  `class_name` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='项目组基本信息和分数';

-- ----------------------------
-- Records of project_group_basic_info
-- ----------------------------
BEGIN;
INSERT INTO `project_group_basic_info` VALUES (1, 1, '1', '尹春普', 20191202255, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (2, 3, '3', '丁金洋', 20201202139, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (3, 4, '4', '刘佳欣', 20211200384, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (4, 1, '1', '尹春普', 20211200551, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (5, 8, '3', '王冠涵', 20211200556, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (6, 5, '5', '张瑛琪', 20211200558, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (7, 5, '5', '张瑛琪', 20211200584, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (8, 5, '5', '张瑛琪', 20211200602, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (9, 7, '7', '王鹏', 20211200605, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (10, 7, '7', '王鹏', 20211200710, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (11, 7, '7', '王鹏', 20211200719, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (12, 2, '2', '闫政', 20211201141, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (13, 2, '2', '闫政', 20211201148, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (14, 4, '4', '刘佳欣', 20211201392, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (15, 5, '5', '张瑛琪', 20211201418, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (16, 6, '6', '刘子轩', 20211201458, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (17, 4, '4', '刘佳欣', 20211201483, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (18, 3, '3', '丁金洋', 20211201803, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (19, 51, '7', '王鹏', 20211201804, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (20, 4, '4', '刘佳欣', 20211201806, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (21, 6, '6', '刘子轩', 20211201849, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (22, 3, '3', '丁金洋', 20211201874, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (23, 2, '2', '闫政', 20211201897, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (24, 6, '6', '刘子轩', 20211201899, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (25, 8, '3', '王冠涵', 20211201903, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (26, 2, '2', '闫政', 20211202068, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (27, 2, '2', '闫政', 20211202073, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (28, 6, '6', '刘子轩', 20211202083, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (29, 5, '5', '张瑛琪', 20211202101, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (30, 5, '5', '张瑛琪', 20211202103, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (31, 8, '3', '王冠涵', 20211202111, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (32, 5, '5', '张瑛琪', 20211202125, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (33, 7, '7', '王鹏', 20211202326, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (34, 6, '6', '刘子轩', 20211202380, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (35, 1, '1', '尹春普', 20211202495, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (36, 1, '1', '尹春普', 20211202543, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (37, 7, '7', '王鹏', 20211202723, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (38, 7, '7', '王鹏', 20211202724, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (39, 2, '2', '闫政', 20211202759, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (40, 6, '6', '刘子轩', 20211202868, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (41, 4, '4', '刘佳欣', 20211202878, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (42, 3, '3', '丁金洋', 20211202900, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (43, 8, '3', '王冠涵', 20211203012, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (44, 2, '2', '闫政', 20211203035, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (45, 8, '3', '王冠涵', 20211203038, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (46, 1, '1', '尹春普', 20211203049, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (47, 3, '3', '丁金洋', 20211203783, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (48, 4, '4', '刘佳欣', 20211203980, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (49, 8, '3', '王冠涵', 20211203983, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (50, 8, '3', '王冠涵', 20211204314, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (51, 6, '6', '刘子轩', 20211204412, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (52, 1, '1', '尹春普', 20211204414, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (53, 3, '3', '丁金洋', 20211204954, '2021级', '软件工程1班');
INSERT INTO `project_group_basic_info` VALUES (54, 1, '1', '尹才华', 20211204434, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (55, 1, '1', '王子康', 20181203922, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (56, 1, '1', '刘晨阳', 20211203987, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (57, 1, '1', '吴航宇', 20211203994, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (58, 1, '1', '王宗祥', 20211200553, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (59, 1, '1', '张书通', 20211202720, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (60, 1, '1', '李明哲', 20211202112, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (61, 1, '1', '李欣欢', 20211201766, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (62, 2, '2', '王腾鑫', 20211201900, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (63, 2, '2', '韩森宇', 20211201893, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (64, 2, '2', '赵佳乐', 20211202362, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (65, 2, '2', '张宇', 20211202732, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (66, 2, '2', '戴明东', 20211203792, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (67, 2, '2', '付陈瑶', 20211201867, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (68, 2, '2', '栾凯越', 20211203978, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (69, 3, '3', '王祉桥', 20211202744, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (70, 3, '3', '祁明阳', 20211202079, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (71, 3, '3', '李涵', 20211203974, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (72, 3, '3', '赵旋', 20211201457, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (73, 3, '3', '常宏伟', 20211201890, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (74, 3, '3', '邓大卫', 20211203047, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (75, 3, '3', '王格格', 20211203091, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (76, 4, '4', '章嘉劭', 20211200711, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (77, 4, '4', '顾培皓', 20211200385, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (78, 4, '4', '张杨', 20211200598, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (79, 4, '4', '孙欣欣', 20211200601, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (80, 4, '4', '何海兴', 20211201454, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (81, 4, '4', '乔佳昕', 20211201793, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (82, 4, '4', '刘思豪', 20211203059, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (83, 5, '5', '何通海', 20212201366, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (84, 5, '5', '任子豪', 20212201321, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (85, 5, '5', '翟翱', 20212201227, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (86, 5, '5', '段兴江', 20212201441, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (87, 5, '5', '王雅鑫', 20212201367, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (88, 5, '5', '徐婷', 20212201326, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (89, 5, '5', '张睿泽', 20212201192, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (90, 6, '6', '马乐晨', 20211201785, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (91, 6, '6', '耿唯瀚', 20211202104, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (92, 6, '6', '于舒睿', 20211200596, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (93, 6, '6', '迟稼铭', 20211200606, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (94, 6, '6', '刘庆龙', 20211202069, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (95, 6, '6', '刘扬', 20211202754, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (96, 6, '6', '崔惟桓', 20211203986, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (97, 7, '7', '李韩', 20211202726, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (98, 7, '7', '彭锦龙', 20211201659, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (99, 7, '7', '支毅博', 20211202355, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (100, 7, '7', '王福龙', 20211201119, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (101, 7, '7', '邢子阳', 20211202072, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (102, 7, '7', '信帅权', 20211203042, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (103, 7, '7', '郭桐羽', 20211202730, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (104, 8, '8', '夏单祁', 20211203996, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (105, 8, '8', '任靓', 20211202081, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (106, 8, '8', '白明涛', 20211202948, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (107, 8, '8', '张义超', 20211203089, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (108, 8, '8', '姚祥桐', 20211202090, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (109, 8, '8', '吴健南', 20211202881, '2021级', '软件工程2班\r');
INSERT INTO `project_group_basic_info` VALUES (110, 8, '8', '许孙凯', 20211202947, '2021级', '软件工程2班');
COMMIT;

-- ----------------------------
-- Table structure for project_task
-- ----------------------------
DROP TABLE IF EXISTS `project_task`;
CREATE TABLE `project_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL COMMENT '项目ID',
  `project_task` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '项目任务',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='项目任务';

-- ----------------------------
-- Records of project_task
-- ----------------------------
BEGIN;
INSERT INTO `project_task` VALUES (1, 1, '用户注册');
INSERT INTO `project_task` VALUES (2, 1, '用户登录');
INSERT INTO `project_task` VALUES (3, 1, '新闻显示');
INSERT INTO `project_task` VALUES (4, 1, '产品信息展示');
INSERT INTO `project_task` VALUES (5, 1, '下载中心');
INSERT INTO `project_task` VALUES (6, 1, '用户留言');
INSERT INTO `project_task` VALUES (7, 1, '退出系统');
INSERT INTO `project_task` VALUES (8, 1, '新闻管理');
INSERT INTO `project_task` VALUES (9, 1, '产品信息管理');
INSERT INTO `project_task` VALUES (10, 1, '招聘信息管理');
INSERT INTO `project_task` VALUES (11, 1, '用户管理');
INSERT INTO `project_task` VALUES (12, 2, '基础资料设置');
INSERT INTO `project_task` VALUES (13, 2, '客户信息管理');
INSERT INTO `project_task` VALUES (14, 2, '收货管理');
INSERT INTO `project_task` VALUES (15, 2, '单据查找');
INSERT INTO `project_task` VALUES (16, 2, '派件管理');
INSERT INTO `project_task` VALUES (17, 2, '报表统计');
INSERT INTO `project_task` VALUES (18, 3, '用户注册');
INSERT INTO `project_task` VALUES (19, 3, '用户登录');
INSERT INTO `project_task` VALUES (20, 3, '影片资讯');
INSERT INTO `project_task` VALUES (21, 3, '影城介绍');
INSERT INTO `project_task` VALUES (22, 3, '影片归档查询');
INSERT INTO `project_task` VALUES (23, 3, '在线购票');
INSERT INTO `project_task` VALUES (24, 3, '会员专区');
INSERT INTO `project_task` VALUES (25, 3, '影片管理');
INSERT INTO `project_task` VALUES (26, 3, '会员管理');
INSERT INTO `project_task` VALUES (27, 3, '系统参数管理');
INSERT INTO `project_task` VALUES (28, 4, '用户注册');
INSERT INTO `project_task` VALUES (29, 4, '用户登录');
INSERT INTO `project_task` VALUES (30, 4, '团品显示');
INSERT INTO `project_task` VALUES (31, 4, '购买');
INSERT INTO `project_task` VALUES (32, 4, '用户评价');
INSERT INTO `project_task` VALUES (33, 4, '退出系统');
INSERT INTO `project_task` VALUES (34, 4, '团品管理');
INSERT INTO `project_task` VALUES (35, 4, '用户账户管理');
INSERT INTO `project_task` VALUES (36, 4, '退货管理');
INSERT INTO `project_task` VALUES (37, 5, '用户注册');
INSERT INTO `project_task` VALUES (38, 5, '用户登录');
INSERT INTO `project_task` VALUES (39, 5, '酒店查询');
INSERT INTO `project_task` VALUES (40, 5, '酒店预定');
INSERT INTO `project_task` VALUES (41, 5, '用户留言');
INSERT INTO `project_task` VALUES (42, 5, '退出系统');
INSERT INTO `project_task` VALUES (43, 5, '订单管理');
INSERT INTO `project_task` VALUES (44, 5, '账户管理');
INSERT INTO `project_task` VALUES (45, 5, '个人信息管理');
INSERT INTO `project_task` VALUES (46, 5, '酒店管理');
INSERT INTO `project_task` VALUES (47, 6, '用户管理');
INSERT INTO `project_task` VALUES (48, 6, '信息管理');
INSERT INTO `project_task` VALUES (49, 6, '合同管理');
INSERT INTO `project_task` VALUES (50, 6, '销售管理');
INSERT INTO `project_task` VALUES (51, 7, '用户权限管理');
INSERT INTO `project_task` VALUES (52, 7, '菜单管理');
INSERT INTO `project_task` VALUES (53, 7, '订餐管理');
INSERT INTO `project_task` VALUES (54, 7, '会员管理');
INSERT INTO `project_task` VALUES (55, 7, '购物车管理');
INSERT INTO `project_task` VALUES (57, 2, '登录注册');
INSERT INTO `project_task` VALUES (58, 3, '退出系统');
INSERT INTO `project_task` VALUES (59, 5, '退货管理');
INSERT INTO `project_task` VALUES (60, 5, '团品显示');
INSERT INTO `project_task` VALUES (61, 5, '团品管理');
INSERT INTO `project_task` VALUES (62, 5, '退出系统');
INSERT INTO `project_task` VALUES (63, 5, '用户评价');
INSERT INTO `project_task` VALUES (64, 5, '用户注册');
INSERT INTO `project_task` VALUES (65, 5, '用户登录');
INSERT INTO `project_task` VALUES (66, 8, '管理模块-分类管理\r');
INSERT INTO `project_task` VALUES (67, 8, '专家模块-个人管理\r');
INSERT INTO `project_task` VALUES (68, 8, '管理模块-个人管理\r');
INSERT INTO `project_task` VALUES (69, 8, '用户模块\r');
INSERT INTO `project_task` VALUES (70, 8, '管理模块-专家管理\r');
INSERT INTO `project_task` VALUES (71, 8, '管理模块-管理登录\r');
INSERT INTO `project_task` VALUES (72, 8, '稿件管理\r');
INSERT INTO `project_task` VALUES (73, 8, '专家模块-专家登录\r');
INSERT INTO `project_task` VALUES (74, 8, '待审作品\r');
INSERT INTO `project_task` VALUES (75, 8, '编辑模块\r');
INSERT INTO `project_task` VALUES (76, 6, '网页页面设计\r');
INSERT INTO `project_task` VALUES (77, 6, '项目测试和编写测试报告\r');
INSERT INTO `project_task` VALUES (78, 6, '数据库设计');
COMMIT;

-- ----------------------------
-- Table structure for project_task_student
-- ----------------------------
DROP TABLE IF EXISTS `project_task_student`;
CREATE TABLE `project_task_student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stu_id` bigint DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `project_task_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='项目、项目任务、学生关系表';

-- ----------------------------
-- Records of project_task_student
-- ----------------------------
BEGIN;
INSERT INTO `project_task_student` VALUES (1, 20191202255, 1, 10);
INSERT INTO `project_task_student` VALUES (2, 20211200551, 1, 6);
INSERT INTO `project_task_student` VALUES (3, 20211200551, 1, 9);
INSERT INTO `project_task_student` VALUES (4, 20211202495, 1, 8);
INSERT INTO `project_task_student` VALUES (5, 20211202543, 1, 4);
INSERT INTO `project_task_student` VALUES (6, 20211202543, 1, 5);
INSERT INTO `project_task_student` VALUES (7, 20211204414, 1, 3);
INSERT INTO `project_task_student` VALUES (8, 20211203049, 1, 1);
INSERT INTO `project_task_student` VALUES (9, 20211203049, 1, 2);
INSERT INTO `project_task_student` VALUES (10, 20211203049, 1, 7);
INSERT INTO `project_task_student` VALUES (11, 20211203049, 1, 11);
INSERT INTO `project_task_student` VALUES (12, 20211202759, 2, 57);
INSERT INTO `project_task_student` VALUES (13, 20211201897, 2, 13);
INSERT INTO `project_task_student` VALUES (14, 20211202068, 2, 16);
INSERT INTO `project_task_student` VALUES (15, 20211201141, 2, 15);
INSERT INTO `project_task_student` VALUES (16, 20211202073, 2, 12);
INSERT INTO `project_task_student` VALUES (17, 20211203035, 2, 17);
INSERT INTO `project_task_student` VALUES (18, 20211201148, 2, 14);
INSERT INTO `project_task_student` VALUES (19, 20211200556, 3, 23);
INSERT INTO `project_task_student` VALUES (20, 20211203038, 3, 25);
INSERT INTO `project_task_student` VALUES (21, 20211201903, 3, 22);
INSERT INTO `project_task_student` VALUES (22, 20211204314, 3, 20);
INSERT INTO `project_task_student` VALUES (23, 20211204314, 3, 21);
INSERT INTO `project_task_student` VALUES (24, 20211204314, 3, 26);
INSERT INTO `project_task_student` VALUES (25, 20211204314, 3, 24);
INSERT INTO `project_task_student` VALUES (26, 20211203983, 3, 27);
INSERT INTO `project_task_student` VALUES (27, 20211202111, 3, 18);
INSERT INTO `project_task_student` VALUES (28, 20211202111, 3, 19);
INSERT INTO `project_task_student` VALUES (29, 20211203012, 3, 20);
INSERT INTO `project_task_student` VALUES (30, 20211203012, 3, 21);
INSERT INTO `project_task_student` VALUES (31, 20211203012, 3, 26);
INSERT INTO `project_task_student` VALUES (32, 20211203012, 3, 24);
INSERT INTO `project_task_student` VALUES (33, 20211204954, 3, 22);
INSERT INTO `project_task_student` VALUES (34, 20211201803, 3, 24);
INSERT INTO `project_task_student` VALUES (35, 20211201803, 3, 26);
INSERT INTO `project_task_student` VALUES (36, 20201202139, 3, 27);
INSERT INTO `project_task_student` VALUES (37, 20211201874, 3, 23);
INSERT INTO `project_task_student` VALUES (38, 20211203783, 3, 25);
INSERT INTO `project_task_student` VALUES (39, 20211203783, 3, 20);
INSERT INTO `project_task_student` VALUES (40, 20211202900, 3, 18);
INSERT INTO `project_task_student` VALUES (41, 20211202900, 3, 19);
INSERT INTO `project_task_student` VALUES (42, 20211202900, 3, 58);
INSERT INTO `project_task_student` VALUES (43, 20211201806, 4, 33);
INSERT INTO `project_task_student` VALUES (44, 20211203980, 4, 32);
INSERT INTO `project_task_student` VALUES (45, 20211200384, 4, 28);
INSERT INTO `project_task_student` VALUES (46, 20211200384, 4, 29);
INSERT INTO `project_task_student` VALUES (47, 20211202878, 4, 30);
INSERT INTO `project_task_student` VALUES (48, 20211201392, 4, 36);
INSERT INTO `project_task_student` VALUES (49, 20211201483, 4, 34);
INSERT INTO `project_task_student` VALUES (50, 20211201483, 4, 35);
INSERT INTO `project_task_student` VALUES (51, 20211201899, 6, 50);
INSERT INTO `project_task_student` VALUES (52, 20211204412, 6, 50);
INSERT INTO `project_task_student` VALUES (53, 20211202380, 6, 50);
INSERT INTO `project_task_student` VALUES (54, 20211201899, 6, 49);
INSERT INTO `project_task_student` VALUES (55, 20211204412, 6, 49);
INSERT INTO `project_task_student` VALUES (56, 20211202380, 6, 49);
INSERT INTO `project_task_student` VALUES (57, 20211202868, 6, 48);
INSERT INTO `project_task_student` VALUES (58, 20211201458, 6, 48);
INSERT INTO `project_task_student` VALUES (59, 20211202083, 6, 47);
INSERT INTO `project_task_student` VALUES (60, 20211201849, 6, 47);
INSERT INTO `project_task_student` VALUES (61, 20211202326, 7, 55);
INSERT INTO `project_task_student` VALUES (62, 20211202723, 7, 54);
INSERT INTO `project_task_student` VALUES (63, 20211200605, 7, 53);
INSERT INTO `project_task_student` VALUES (64, 20211202724, 7, 52);
INSERT INTO `project_task_student` VALUES (65, 20211200719, 7, 52);
INSERT INTO `project_task_student` VALUES (66, 20211201804, 7, 51);
INSERT INTO `project_task_student` VALUES (67, 2021120710, 7, 51);
INSERT INTO `project_task_student` VALUES (68, 20211202125, 5, 59);
INSERT INTO `project_task_student` VALUES (69, 20211202103, 5, 40);
INSERT INTO `project_task_student` VALUES (70, 20211202101, 5, 44);
INSERT INTO `project_task_student` VALUES (71, 20211201418, 5, 60);
INSERT INTO `project_task_student` VALUES (72, 20211201418, 5, 61);
INSERT INTO `project_task_student` VALUES (73, 20211200602, 5, 62);
INSERT INTO `project_task_student` VALUES (74, 20211200584, 5, 63);
INSERT INTO `project_task_student` VALUES (75, 20211200558, 5, 64);
INSERT INTO `project_task_student` VALUES (76, 20211200558, 5, 65);
INSERT INTO `project_task_student` VALUES (78, 20211204434, 7, 51);
INSERT INTO `project_task_student` VALUES (79, 20181203922, 7, 53);
INSERT INTO `project_task_student` VALUES (80, 20211203987, 7, 51);
INSERT INTO `project_task_student` VALUES (81, 20211203994, 7, 54);
INSERT INTO `project_task_student` VALUES (82, 20211200553, 7, 52);
INSERT INTO `project_task_student` VALUES (83, 20211202720, 7, 53);
INSERT INTO `project_task_student` VALUES (84, 20211202112, 7, 55);
INSERT INTO `project_task_student` VALUES (85, 20211201766, 7, 52);
INSERT INTO `project_task_student` VALUES (86, 20211201900, 2, 14);
INSERT INTO `project_task_student` VALUES (87, 20211201893, 2, 13);
INSERT INTO `project_task_student` VALUES (88, 20211202362, 2, 15);
INSERT INTO `project_task_student` VALUES (89, 20211202732, 2, 12);
INSERT INTO `project_task_student` VALUES (90, 20211203792, 2, 17);
INSERT INTO `project_task_student` VALUES (91, 20211201867, 2, 14);
INSERT INTO `project_task_student` VALUES (92, 20211203978, 2, 16);
INSERT INTO `project_task_student` VALUES (93, 20211202744, 3, 22);
INSERT INTO `project_task_student` VALUES (94, 20211202079, 3, 27);
INSERT INTO `project_task_student` VALUES (95, 20211203974, 3, 21);
INSERT INTO `project_task_student` VALUES (96, 20211201457, 3, 24);
INSERT INTO `project_task_student` VALUES (97, 20211201457, 3, 26);
INSERT INTO `project_task_student` VALUES (98, 20211201890, 3, 25);
INSERT INTO `project_task_student` VALUES (99, 20211201890, 3, 20);
INSERT INTO `project_task_student` VALUES (100, 20211203047, 3, 18);
INSERT INTO `project_task_student` VALUES (101, 20211203047, 3, 19);
INSERT INTO `project_task_student` VALUES (102, 20211203047, 3, 58);
INSERT INTO `project_task_student` VALUES (103, 20211203091, 3, 23);
INSERT INTO `project_task_student` VALUES (104, 20211200711, 4, 35);
INSERT INTO `project_task_student` VALUES (105, 20211200385, 4, 36);
INSERT INTO `project_task_student` VALUES (106, 20211200598, 4, 34);
INSERT INTO `project_task_student` VALUES (107, 20211200601, 4, 32);
INSERT INTO `project_task_student` VALUES (108, 20211201454, 4, 31);
INSERT INTO `project_task_student` VALUES (109, 20211201793, 4, 28);
INSERT INTO `project_task_student` VALUES (110, 20211201793, 4, 29);
INSERT INTO `project_task_student` VALUES (111, 20211201793, 4, 33);
INSERT INTO `project_task_student` VALUES (112, 20211203059, 4, 28);
INSERT INTO `project_task_student` VALUES (113, 20211203059, 4, 29);
INSERT INTO `project_task_student` VALUES (114, 20211203059, 4, 33);
INSERT INTO `project_task_student` VALUES (115, 20212201366, 5, 37);
INSERT INTO `project_task_student` VALUES (116, 20212201366, 5, 38);
INSERT INTO `project_task_student` VALUES (117, 20212201321, 5, 39);
INSERT INTO `project_task_student` VALUES (118, 20212201321, 5, 40);
INSERT INTO `project_task_student` VALUES (119, 20212201227, 5, 41);
INSERT INTO `project_task_student` VALUES (120, 20212201227, 5, 42);
INSERT INTO `project_task_student` VALUES (121, 20212201441, 5, 43);
INSERT INTO `project_task_student` VALUES (122, 20212201367, 5, 44);
INSERT INTO `project_task_student` VALUES (123, 20212201326, 5, 45);
INSERT INTO `project_task_student` VALUES (124, 20212201192, 5, 46);
INSERT INTO `project_task_student` VALUES (125, 20211201785, 6, 69);
INSERT INTO `project_task_student` VALUES (126, 20211202104, 6, 47);
INSERT INTO `project_task_student` VALUES (127, 20211200596, 6, 49);
INSERT INTO `project_task_student` VALUES (128, 20211200606, 6, 50);
INSERT INTO `project_task_student` VALUES (129, 20211202069, 6, 48);
INSERT INTO `project_task_student` VALUES (130, 20211202754, 6, 70);
INSERT INTO `project_task_student` VALUES (131, 20211203986, 6, 71);
INSERT INTO `project_task_student` VALUES (132, 20211202726, 7, 51);
INSERT INTO `project_task_student` VALUES (133, 20211201659, 7, 53);
INSERT INTO `project_task_student` VALUES (134, 20211202355, 7, 51);
INSERT INTO `project_task_student` VALUES (135, 20211201119, 7, 55);
INSERT INTO `project_task_student` VALUES (136, 20211202072, 7, 54);
INSERT INTO `project_task_student` VALUES (137, 20211203042, 7, 52);
INSERT INTO `project_task_student` VALUES (138, 20211202730, 7, 51);
INSERT INTO `project_task_student` VALUES (139, 20211203996, 8, 59);
INSERT INTO `project_task_student` VALUES (140, 20211202081, 8, 60);
INSERT INTO `project_task_student` VALUES (141, 20211202081, 8, 61);
INSERT INTO `project_task_student` VALUES (142, 20211202948, 8, 62);
INSERT INTO `project_task_student` VALUES (143, 20211203089, 8, 63);
INSERT INTO `project_task_student` VALUES (144, 20211202090, 8, 64);
INSERT INTO `project_task_student` VALUES (145, 20211202090, 8, 65);
INSERT INTO `project_task_student` VALUES (146, 20211202881, 8, 66);
INSERT INTO `project_task_student` VALUES (147, 20211202881, 8, 67);
INSERT INTO `project_task_student` VALUES (148, 20211202947, 8, 68);
COMMIT;

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projects_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '项目名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='所有项目';

-- ----------------------------
-- Records of projects
-- ----------------------------
BEGIN;
INSERT INTO `projects` VALUES (1, '动态企业网站系统');
INSERT INTO `projects` VALUES (2, '物流管理系统');
INSERT INTO `projects` VALUES (3, '电影订票网站');
INSERT INTO `projects` VALUES (4, '团购网站');
INSERT INTO `projects` VALUES (5, '酒店预定管理系统');
INSERT INTO `projects` VALUES (6, '客户关系管理系统');
INSERT INTO `projects` VALUES (7, '网上订餐系统');
COMMIT;

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `stu_number` int DEFAULT NULL COMMENT '学生序号',
  `stu_id` bigint NOT NULL COMMENT '学生学号',
  `stu_name` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学生姓名',
  `stu_class` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '学生班级',
  `project_url` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '项目地址',
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生信息表';

-- ----------------------------
-- Records of student_info
-- ----------------------------
BEGIN;
INSERT INTO `student_info` VALUES (1, 20181203922, '王子康', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (1, 20191202255, '纪嘉俊', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (2, 20191202610, '段兴江', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (2, 20201202139, '张子龙', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (3, 20211200384, '严芊芊', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (3, 20211200385, '顾培皓', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (4, 20211200551, '曾繁一', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (4, 20211200553, '王宗祥', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (5, 20211200556, '王鑫', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (6, 20211200558, '王贵萱', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (7, 20211200584, '何彦莹', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (5, 20211200596, '于舒睿', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (6, 20211200598, '张杨', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (7, 20211200601, '孙欣欣', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (8, 20211200602, '刘鑫宇', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (9, 20211200605, '郑琳', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (8, 20211200606, '迟稼铭', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (10, 20211200710, '汪康', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (9, 20211200711, '章嘉劭', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (11, 20211200719, '王鹏', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (10, 20211201119, '王福龙', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (12, 20211201141, '闫政', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (13, 20211201148, '郭会发', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (14, 20211201392, '孙可言', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (15, 20211201418, '刘陵', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (11, 20211201454, '何海兴', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (12, 20211201457, '赵旋', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (16, 20211201458, '焦海霞', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (17, 20211201483, '张含锋', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (13, 20211201659, '彭锦龙', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (14, 20211201766, '李欣欢', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (15, 20211201785, '马乐晨', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (16, 20211201793, '乔佳昕', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (18, 20211201803, '张士博', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (19, 20211201804, '葛怀睿', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (20, 20211201806, '刘帅博', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (21, 20211201849, '魏继瑶', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (17, 20211201867, '付陈瑶', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (22, 20211201874, '郭伟康', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (23, 20211201875, '王林超', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (24, 20211201878, '杨嘉沐', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (18, 20211201890, '常宏伟', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (19, 20211201893, '韩森宇', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (25, 20211201897, '张锐颀', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (26, 20211201899, '刘子轩', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (20, 20211201900, '王腾鑫', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (21, 20211201902, '张睿泽', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (27, 20211201903, '董美娇', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (28, 20211202068, '常松', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (22, 20211202069, '刘庆龙', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (23, 20211202072, '邢子阳', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (29, 20211202073, '陈浩然', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (24, 20211202079, '祁明扬', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (25, 20211202081, '任靓', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (30, 20211202083, '高铎', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (26, 20211202090, '姚祥桐', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (27, 20211202095, '王雅鑫', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (31, 20211202101, '陈广硕', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (32, 20211202103, '张瑛琪', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (28, 20211202104, '耿唯瀚', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (33, 20211202111, '张博', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (29, 20211202112, '李明哲', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (34, 20211202125, '黄照凯', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (30, 20211202312, '徐婷', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (35, 20211202326, '李俊兰', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (31, 20211202355, '支毅博', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (32, 20211202362, '赵佳乐', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (36, 20211202380, '李轩', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (33, 20211202487, '翟翱', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (37, 20211202495, '饶峰', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (38, 20211202543, '罗民富', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (39, 20211202705, '丁金洋', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (34, 20211202720, '张书通', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (40, 20211202723, '田兆卓', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (41, 20211202724, '王洪福', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (35, 20211202726, '李韩', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (36, 20211202730, '郭桐羽', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (37, 20211202732, '张宇', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (38, 20211202744, '王祉桥', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (39, 20211202754, '刘扬', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (42, 20211202759, '唐文勃', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (40, 20211202822, '何通海', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (41, 20211202855, '任子豪', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (43, 20211202868, '孙艺慧', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (44, 20211202878, '涂泉源', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (42, 20211202881, '吴健南', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (45, 20211202900, '陈梦飞', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (43, 20211202947, '许孙凯', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (44, 20211202948, '白明涛', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (46, 20211203012, '王冠涵', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (47, 20211203035, '卢平', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (48, 20211203038, '刘浩宇', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (45, 20211203042, '信帅权', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (46, 20211203047, '邓大卫', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (49, 20211203049, '尹春普', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (47, 20211203059, '刘思豪', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (48, 20211203089, '张义超', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (49, 20211203091, '王格格', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (50, 20211203783, '张楠', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (50, 20211203792, '戴明东', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (51, 20211203974, '李涵', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (52, 20211203978, '栾凯越', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (51, 20211203980, '刘佳欣', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (52, 20211203983, '郑久彤', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (53, 20211203986, '崔惟桓', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (54, 20211203987, '刘晨阳', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (55, 20211203994, '吴航宇', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (56, 20211203996, '夏单祁', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (53, 20211204314, '阮龙', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (54, 20211204412, '唐韧', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (55, 20211204414, '周作友', '2021软件工程1班', '');
INSERT INTO `student_info` VALUES (57, 20211204434, '尹才华', '2021软件工程2班', '');
INSERT INTO `student_info` VALUES (56, 20211204954, '张溪桐', '2021软件工程1班', '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
