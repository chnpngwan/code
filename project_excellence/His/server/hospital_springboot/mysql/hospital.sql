/*
 Navicat Premium Data Transfer

 Source Server         : phpStudyMySql
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : hospital

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 04/12/2023 14:42:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collector
-- ----------------------------
DROP TABLE IF EXISTS `collector`;
CREATE TABLE `collector`  (
  `collector_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '收费单编号',
  `trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付凭证',
  `collector_no` int(8) NULL DEFAULT NULL COMMENT '缴费id',
  `prescription_type` int(8) NULL DEFAULT NULL COMMENT '收费类型（0：药品收费）',
  `patient_id` int(8) NULL DEFAULT NULL COMMENT '缴费患者',
  `charge_money` float NULL DEFAULT NULL COMMENT '收费金额',
  `charge_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收费时间',
  PRIMARY KEY (`collector_id`) USING BTREE,
  INDEX `prescription_id`(`prescription_type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collector
-- ----------------------------
INSERT INTO `collector` VALUES (10, '2023080322001401000500455663', 24, 0, 22, 15.5, '2023-08-03 16:31:11');
INSERT INTO `collector` VALUES (7, '2023080222001401000500464574', 23, 0, 22, 20.5, '2023-08-02 16:15:05');
INSERT INTO `collector` VALUES (8, '2023080322001401000500464654', 21, 0, 22, 15.5, '2023-08-03 16:14:05');
INSERT INTO `collector` VALUES (11, '2023080322001401000500463012', 25, 0, 22, 15, '2023-08-03 16:40:31');
INSERT INTO `collector` VALUES (12, '2023080322001401000500464656', 19, 0, 1, 15.5, '2023-08-03 17:08:15');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `department_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '科室编号',
  `department_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '肾内科');
INSERT INTO `department` VALUES (2, '风湿免疫科');
INSERT INTO `department` VALUES (3, '呼吸与重症医学科');
INSERT INTO `department` VALUES (5, '呼吸内科');
INSERT INTO `department` VALUES (6, '神经内科');
INSERT INTO `department` VALUES (7, '心血管内科');
INSERT INTO `department` VALUES (8, '内分泌科');
INSERT INTO `department` VALUES (9, '消化内科');
INSERT INTO `department` VALUES (10, '血液内科');
INSERT INTO `department` VALUES (11, '胃肠外科');
INSERT INTO `department` VALUES (12, '肝胆外科');
INSERT INTO `department` VALUES (13, '泌尿外科');
INSERT INTO `department` VALUES (14, '心脏大血管外科');
INSERT INTO `department` VALUES (15, '胸外科');
INSERT INTO `department` VALUES (16, '骨科');
INSERT INTO `department` VALUES (17, '神经外科');
INSERT INTO `department` VALUES (18, '烧伤整形科');
INSERT INTO `department` VALUES (19, '甲状腺外科');
INSERT INTO `department` VALUES (20, '乳腺外科');
INSERT INTO `department` VALUES (21, '妇产科');
INSERT INTO `department` VALUES (22, '小儿内科');
INSERT INTO `department` VALUES (23, '小儿外科');
INSERT INTO `department` VALUES (24, '耳鼻喉科');
INSERT INTO `department` VALUES (25, '眼科');
INSERT INTO `department` VALUES (26, '口腔科');
INSERT INTO `department` VALUES (27, '急诊科');
INSERT INTO `department` VALUES (28, '皮肤性病科');
INSERT INTO `department` VALUES (29, '麻醉科');
INSERT INTO `department` VALUES (30, '重症医学科');
INSERT INTO `department` VALUES (31, '康复医学科');
INSERT INTO `department` VALUES (32, '中医科');
INSERT INTO `department` VALUES (33, '检验科');
INSERT INTO `department` VALUES (34, '医学影像科');
INSERT INTO `department` VALUES (35, '病理科');
INSERT INTO `department` VALUES (36, '药学部');
INSERT INTO `department` VALUES (37, '输血科');
INSERT INTO `department` VALUES (38, '核医学科');
INSERT INTO `department` VALUES (39, '临床营养科');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doctor_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '医生编号',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像相对路径',
  `department_id` int(8) NULL DEFAULT NULL COMMENT '科室编号',
  `doctor_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `doctor_sex` int(5) NULL DEFAULT NULL COMMENT '医生性别（1男，2女）',
  `doctor_age` int(5) NULL DEFAULT NULL COMMENT '医生年龄',
  `doctor_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生电话',
  `doctor_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生密码',
  `user_identity` int(8) NULL DEFAULT NULL COMMENT '用户身份（管理员1，医生2，患者3）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`doctor_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, NULL, 1, '张三', 1, 25, '13844444444', '123456', 2, '2023-07-11 16:55:57', '2023-07-27 15:24:22');
INSERT INTO `doctor` VALUES (2, NULL, 2, '李四', 2, 55, '18755555555', '123456', 2, '2023-07-08 16:56:00', '2023-07-27 15:24:23');
INSERT INTO `doctor` VALUES (3, NULL, 3, '王五', 1, 32, '15122222222', '123456', 2, '2023-07-23 16:56:03', '2023-07-27 15:24:24');
INSERT INTO `doctor` VALUES (4, NULL, 1, '马六', 1, 38, '13755555555', '123456', 2, '2023-07-01 16:56:07', '2023-07-27 15:24:22');
INSERT INTO `doctor` VALUES (16, '', 5, '王麻子', 1, 22, '222', '123456', 2, '2023-06-27 16:56:11', '2023-11-22 11:15:30');

-- ----------------------------
-- Table structure for drugs
-- ----------------------------
DROP TABLE IF EXISTS `drugs`;
CREATE TABLE `drugs`  (
  `drugs_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '药品编号',
  `drugs_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品类型',
  `drugs_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `production_location` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产地点',
  `production_date` date NULL DEFAULT NULL COMMENT '生产日期',
  `term_validity` date NULL DEFAULT NULL COMMENT '有效期',
  `therapeutic_efficacy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '治疗功效',
  `inventory_num` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '库存数量',
  `receipt_price` float NULL DEFAULT NULL COMMENT '入库单价',
  `delivery_price` float NULL DEFAULT NULL COMMENT '出库单价',
  `dures_position` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品库存位置',
  PRIMARY KEY (`drugs_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drugs
-- ----------------------------
INSERT INTO `drugs` VALUES (1, '西药', '感康', '吉林省吴太感康药业有限公司', '2022-10-01', '2023-10-01', '缓解普通感冒及流行性感冒引起的发热、头痛、四肢触痛、打喷嚏、流鼻涕、鼻塞、咽喉痛等症状', 59, 5, 10, '药品一库');
INSERT INTO `drugs` VALUES (2, '西药', '三金桂林西瓜霜喷剂', '桂林三金药业股份有限公司', '2022-06-19', '2023-08-05', '口腔溃疡', 93, 3, 5, '药品一库');
INSERT INTO `drugs` VALUES (3, '西药', '感康', '吉林省吴太感康药业有限公司', '2022-10-01', '2023-10-01', '缓解普通感冒及流行性感冒引起的发热、头痛、四肢触痛、打喷嚏、流鼻涕、鼻塞、咽喉痛等症状', 19, 10, 15, '药品一库');
INSERT INTO `drugs` VALUES (4, '西药', '西拉普利片', '上海罗氏制药有限公司', '2022-05-22', '2023-10-20', '原发性高血压', 81, 10, 12, '药品二库');
INSERT INTO `drugs` VALUES (5, '西药', '云南白药', '云南白药集团股份有限公司', '2022-08-15', '2025-09-01', '化瘀止血', 50, 8, 10, '药品二库');
INSERT INTO `drugs` VALUES (6, '西药', '云南白药痔疮膏', '云南白药集团股份有限公司', '2022-10-17', '2023-08-01', '用于内痔', 192, 12.5, 15.5, '药品二库');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `patient_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '病人编号',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像相对路径',
  `patient_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病人姓名',
  `patient_sex` int(5) NULL DEFAULT NULL COMMENT '病人性别（1男，0女）',
  `patient_age` int(5) NULL DEFAULT NULL COMMENT '病人年龄',
  `patient_number` bigint(20) NULL DEFAULT NULL COMMENT '病人身份证号',
  `patient_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病人手机号',
  `patient_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病人密码',
  `user_identity` int(8) NULL DEFAULT NULL COMMENT '用户身份（管理员1，医生2，患者3）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES (1, NULL, '王一', 1, 22, 152801111111111111, '15555555555', '123456', 3, '2023-07-18 10:57:42', '2023-07-20 10:57:47');
INSERT INTO `patient` VALUES (2, NULL, '王二', 1, 25, 152802111111111111, '18888888888', '123456', 3, '2023-07-01 10:57:47', '2023-07-20 10:57:50');
INSERT INTO `patient` VALUES (3, NULL, '王三', 1, 20, 152803111111111111, '13333333333', '123456', 3, '2023-06-22 10:57:53', '2023-07-20 10:57:56');
INSERT INTO `patient` VALUES (4, NULL, '王四', 0, 18, 152804111111111111, '16666666666', '123456', 3, '2023-06-14 10:57:57', '2023-07-20 10:58:00');
INSERT INTO `patient` VALUES (5, NULL, '王五', 0, 30, 152805111111111100, '17777777777', '123456', 3, '2023-07-18 10:58:01', '2023-07-20 10:58:04');
INSERT INTO `patient` VALUES (22, '', '马六', 1, 25, 152805111111111100, '333', '123456', 3, '2023-07-20 10:44:56', '2023-12-04 14:33:54');

-- ----------------------------
-- Table structure for prescription
-- ----------------------------
DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription`  (
  `prescription_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '处方编号',
  `register_id` int(8) NULL DEFAULT NULL COMMENT '挂号单id',
  `doctor_id` int(8) NULL DEFAULT NULL COMMENT '医生编号',
  `patient_id` int(8) NULL DEFAULT NULL COMMENT '病人编号',
  `prescription_diagnosis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '诊断结果',
  `payment_status` int(5) NULL DEFAULT NULL COMMENT '缴费状态（0：未缴费，1：已缴费）',
  `prescription_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '处方时间',
  PRIMARY KEY (`prescription_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prescription
-- ----------------------------
INSERT INTO `prescription` VALUES (19, 19, 1, 1, '没事，有点痔疮', 1, '2023-07-27 15:26:13');
INSERT INTO `prescription` VALUES (14, 18, 16, 2, '慢性喘息型支气管炎急性发作期,慢性阻塞性肺炎', 0, '2023-07-27 11:37:39');
INSERT INTO `prescription` VALUES (21, 22, 16, 22, 'qwe', 1, '2023-08-01 09:54:13');
INSERT INTO `prescription` VALUES (23, 23, 1, 22, '没治了', 1, '2023-08-01 09:58:24');
INSERT INTO `prescription` VALUES (24, 25, 4, 22, '痔疮', 1, '2023-08-03 16:22:53');
INSERT INTO `prescription` VALUES (25, 24, 2, 22, '感冒', 1, '2023-08-03 16:39:24');
INSERT INTO `prescription` VALUES (26, 26, 3, 22, '精神病\n', 0, '2023-08-03 16:42:28');
INSERT INTO `prescription` VALUES (27, 27, 16, 22, '324', NULL, '2023-08-09 16:15:41');

-- ----------------------------
-- Table structure for prescription_drug
-- ----------------------------
DROP TABLE IF EXISTS `prescription_drug`;
CREATE TABLE `prescription_drug`  (
  `medicine_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '处方药品id',
  `register_id` int(8) NULL DEFAULT NULL COMMENT '挂号单id',
  `drugs_id` int(8) NULL DEFAULT NULL COMMENT '药物id',
  `medicine_num` int(11) NULL DEFAULT NULL COMMENT '药物数量',
  `medicine_notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药物备注',
  PRIMARY KEY (`medicine_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prescription_drug
-- ----------------------------
INSERT INTO `prescription_drug` VALUES (34, 24, 3, 1, '一日两次');
INSERT INTO `prescription_drug` VALUES (33, 25, 6, 1, '外敷，一日两次');
INSERT INTO `prescription_drug` VALUES (25, 19, 6, 1, '一日两次');
INSERT INTO `prescription_drug` VALUES (30, 22, 6, 1, '一日两次');
INSERT INTO `prescription_drug` VALUES (32, 23, 6, 1, '一日三次');
INSERT INTO `prescription_drug` VALUES (31, 23, 2, 1, '一日两次');
INSERT INTO `prescription_drug` VALUES (18, 18, 1, 1, '一日两次');
INSERT INTO `prescription_drug` VALUES (19, 18, 2, 1, '一日三次');
INSERT INTO `prescription_drug` VALUES (35, 26, 4, 1, '外敷，一日两次');
INSERT INTO `prescription_drug` VALUES (36, 27, 1, 34, '234');

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register`  (
  `register_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '挂号编号',
  `patient_id` int(8) NULL DEFAULT NULL COMMENT '病人编号',
  `doctor_id` int(8) NULL DEFAULT NULL COMMENT '医生编号',
  `register_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '挂号费用',
  `completion_status` int(3) NULL DEFAULT NULL COMMENT '完成状态（0：未完成，1：完成）',
  `prescription_status` int(3) NULL DEFAULT NULL COMMENT '处方状态（0：未开具，1：已开具）',
  `register_date` timestamp NULL DEFAULT NULL COMMENT '挂号时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`register_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES (25, 22, 4, 5.50, 1, 1, '2023-01-07 12:00:00', '2023-08-03 16:21:42');
INSERT INTO `register` VALUES (24, 22, 2, 5.50, 1, 1, '2023-01-04 10:10:06', '2023-08-01 09:57:42');
INSERT INTO `register` VALUES (20, 4, 16, 5.50, 0, 0, '2023-07-31 14:33:58', '2023-07-27 15:29:13');
INSERT INTO `register` VALUES (19, 1, 1, 5.50, 1, 1, '2023-01-01 17:05:00', '2023-07-27 15:25:34');
INSERT INTO `register` VALUES (18, 2, 16, 5.00, 1, 1, '2023-01-04 12:00:00', '2023-07-26 20:57:31');
INSERT INTO `register` VALUES (17, 1, 16, 6.00, 1, 0, '2023-01-03 12:00:00', '2023-07-26 20:57:02');
INSERT INTO `register` VALUES (22, 22, 16, 5.50, 1, 1, '2023-01-02 12:00:00', '2023-08-01 09:53:28');
INSERT INTO `register` VALUES (23, 22, 1, 5.50, 1, 1, '2023-01-03 15:05:06', '2023-08-01 09:57:24');
INSERT INTO `register` VALUES (26, 22, 3, 5.50, 1, 1, '2023-01-26 12:00:00', '2023-08-03 16:36:20');
INSERT INTO `register` VALUES (27, 22, 16, 5.50, 1, 1, '2023-01-26 12:00:00', '2023-08-03 16:37:06');
INSERT INTO `register` VALUES (28, 22, 3, 5.50, 1, 0, '2023-01-01 12:00:00', '2023-08-03 16:47:09');
INSERT INTO `register` VALUES (29, 22, 3, 5.50, 0, 0, '2023-02-16 12:00:00', '2023-08-03 16:47:22');
INSERT INTO `register` VALUES (30, 22, 16, 5.50, 1, 0, '2023-01-01 12:00:00', '2023-08-09 16:15:13');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `menu_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of system_menu
-- ----------------------------

-- ----------------------------
-- Table structure for user_admin
-- ----------------------------
DROP TABLE IF EXISTS `user_admin`;
CREATE TABLE `user_admin`  (
  `admin_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像相对路径',
  `admin_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员电话',
  `admin_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员姓名',
  `user_identity` int(8) NULL DEFAULT NULL COMMENT '用户身份（管理员1，医生2，患者3）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_admin
-- ----------------------------
INSERT INTO `user_admin` VALUES (1, '', '111', '123456', '张三', 1, '2023-06-14 17:44:19', '2023-11-22 11:11:41');

-- ----------------------------
-- View structure for totaldruginventory
-- ----------------------------
DROP VIEW IF EXISTS `totaldruginventory`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `totaldruginventory` AS select `drugs`.`drugs_name` AS `drugs_name`,`drugs`.`inventory_num` AS `Inventory_num` from `drugs`;

-- ----------------------------
-- Procedure structure for VisitStatistics
-- ----------------------------
DROP PROCEDURE IF EXISTS `VisitStatistics`;
delimiter ;;
CREATE PROCEDURE `VisitStatistics`(IN StarDate date,IN EndDate date)
BEGIN
	SELECT DISTINCT department_name,COUNT(*) FROM register WHERE register_date BETWEEN StarDate AND EndDate GROUP BY department_name;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table doctor
-- ----------------------------
DROP TRIGGER IF EXISTS `update_update_time`;
delimiter ;;
CREATE TRIGGER `update_update_time` BEFORE UPDATE ON `doctor` FOR EACH ROW BEGIN
    SET NEW.update_time = CURRENT_TIMESTAMP();
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table patient
-- ----------------------------
DROP TRIGGER IF EXISTS `patient_update_time`;
delimiter ;;
CREATE TRIGGER `patient_update_time` BEFORE UPDATE ON `patient` FOR EACH ROW BEGIN
    SET NEW.update_time = CURRENT_TIMESTAMP();
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user_admin
-- ----------------------------
DROP TRIGGER IF EXISTS `update_updated_time`;
delimiter ;;
CREATE TRIGGER `update_updated_time` BEFORE UPDATE ON `user_admin` FOR EACH ROW BEGIN
    SET NEW.update_time = CURRENT_TIMESTAMP();
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
