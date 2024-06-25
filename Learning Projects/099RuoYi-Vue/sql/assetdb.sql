/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : assetdb

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 15/11/2023 15:15:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for asset_allot
-- ----------------------------
DROP TABLE IF EXISTS `asset_allot`;
CREATE TABLE `asset_allot`  (
  `id` int NOT NULL AUTO_INCREMENT  COMMENT '主键',
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调拨编码',
  `status` int NOT NULL COMMENT '办理状态(0 未确认，1 已确认，2 已完成，3 已取消)',
  `allot_time` datetime NOT NULL COMMENT '调拨时间【申请时间】',
  `allot_user_id` int NOT NULL COMMENT '调出管理员',
  `fold_user_id` int NOT NULL COMMENT '调入管理员【确认人员】',
  `allot_company_id` int NOT NULL COMMENT '调出公司',
  `fold_company_id` int NOT NULL COMMENT '调入公司',
  `fold_time` datetime NOT NULL COMMENT '调入时间【确定时间】',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_allot
-- ----------------------------

-- ----------------------------
-- Table structure for asset_allot_details
-- ----------------------------
DROP TABLE IF EXISTS `asset_allot_details`;
CREATE TABLE `asset_allot_details`  (
  `id` int NOT NULL AUTO_INCREMENT  COMMENT '主键',
  `asset_id` int NOT NULL COMMENT '资产编号',
  `stocktake_id` int NOT NULL COMMENT '盘点编号',
  `stocktake_status` int NULL DEFAULT NULL COMMENT '盘点状态(已盘1，未盘0)',
  `stocktake_Ins` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '盘点说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '盘点详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_allot_details
-- ----------------------------

-- ----------------------------
-- Table structure for asset_borrow_return
-- ----------------------------
DROP TABLE IF EXISTS `asset_borrow_return`;
CREATE TABLE `asset_borrow_return`  (
  `id` int NOT NULL AUTO_INCREMENT  COMMENT '主键',
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '借用编号',
  `status` int NOT NULL COMMENT '状态',
  `borrow_id` int NOT NULL COMMENT '借用人',
  `borrow_time` datetime NOT NULL COMMENT '借用时间',
  `guess_return_time` datetime NOT NULL COMMENT '预计归还时间',
  `return_time` datetime NOT NULL COMMENT '归还时间',
  `handler_id` int NOT NULL COMMENT '处理人',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_borrow_return
-- ----------------------------

-- ----------------------------
-- Table structure for asset_borrow_return_detail
-- ----------------------------
DROP TABLE IF EXISTS `asset_borrow_return_detail`;
CREATE TABLE `asset_borrow_return_detail`  (
  `id` int NOT NULL AUTO_INCREMENT  COMMENT '主键',
  `asset_id` int NULL DEFAULT NULL COMMENT '资产编号',
  `borrow_return_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '借用归还编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_borrow_return_detail
-- ----------------------------

-- ----------------------------
-- Table structure for asset_cacnel_detail
-- ----------------------------
DROP TABLE IF EXISTS `asset_cacnel_detail`;
CREATE TABLE `asset_cacnel_detail`  (
  `id` int NOT NULL AUTO_INCREMENT  COMMENT '主键',
  `asset_id` int NULL DEFAULT NULL COMMENT '资产编号',
  `cancel_id` int NULL DEFAULT NULL COMMENT '退库编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_cacnel_detail
-- ----------------------------

-- ----------------------------
-- Table structure for asset_cancel
-- ----------------------------
DROP TABLE IF EXISTS `asset_cancel`;
CREATE TABLE `asset_cancel`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `num` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '退库编号',
  `cancel_time` datetime NOT NULL COMMENT '退库日期',
  `cancel_company_id` int NULL DEFAULT NULL COMMENT '公司',
  `dept_id` int NULL DEFAULT NULL COMMENT '部门',
  `region_id` int NULL DEFAULT NULL COMMENT '第三级位置',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退库备注',
  `handler_id` int NOT NULL COMMENT '处理人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_cancel
-- ----------------------------

-- ----------------------------
-- Table structure for asset_check
-- ----------------------------
DROP TABLE IF EXISTS `asset_check`;
CREATE TABLE `asset_check`  (
  `check_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '盘点编号',
  `status` int NOT NULL COMMENT '状态',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '盘点单名称',
  `allocation_user_id` int NOT NULL COMMENT '分配用户',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '盘点说明',
  `report` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '盘点报告',
  `purchase_time` datetime NULL DEFAULT NULL COMMENT '购入日期',
  `company_id` int NULL DEFAULT NULL COMMENT '使用公司',
  `dept_id` int NULL DEFAULT NULL COMMENT '使用部门',
  `possess_company_id` int NULL DEFAULT NULL COMMENT '所属公司',
  `classify_id` int NULL DEFAULT NULL COMMENT '资产分类',
  `asset_status` int NULL DEFAULT NULL COMMENT '资产状态',
  `create_user` int NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`check_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资产盘点(asset_check)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_check
-- ----------------------------

-- ----------------------------
-- Table structure for asset_classify
-- ----------------------------
DROP TABLE IF EXISTS `asset_classify`;
CREATE TABLE `asset_classify`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类编码',
  `parent_id` int NULL DEFAULT NULL COMMENT '父级分类编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `number` int NULL DEFAULT NULL COMMENT '资产数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '资产金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_classify
-- ----------------------------
INSERT INTO `asset_classify` VALUES (1, '01', 0, '电脑', NULL, NULL);
INSERT INTO `asset_classify` VALUES (2, '02', 0, '办公桌椅', NULL, NULL);
INSERT INTO `asset_classify` VALUES (3, '011', 1, '台式电脑', NULL, NULL);
INSERT INTO `asset_classify` VALUES (4, '012', 1, '笔记本电脑', NULL, NULL);
INSERT INTO `asset_classify` VALUES (5, '021', 2, '单人办公桌', NULL, NULL);
INSERT INTO `asset_classify` VALUES (6, '022', 2, '单人办公椅', NULL, NULL);
INSERT INTO `asset_classify` VALUES (7, '023', 2, '单人柜子', NULL, NULL);

-- ----------------------------
-- Table structure for asset_company
-- ----------------------------
DROP TABLE IF EXISTS `asset_company`;
CREATE TABLE `asset_company`  (
  `id` int NOT NULL AUTO_INCREMENT  COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组织编码',
  `parent_id` int NOT NULL COMMENT '父级编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组织名称',
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资产数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '资产金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_company
-- ----------------------------

-- ----------------------------
-- Table structure for asset_detail
-- ----------------------------
DROP TABLE IF EXISTS `asset_detail`;
CREATE TABLE `asset_detail`  (
  `id` int NOT NULL AUTO_INCREMENT  COMMENT '主键',
  `asset_id` int NULL DEFAULT NULL COMMENT '资产编号',
  `allot_id` int NULL DEFAULT NULL COMMENT '调拨编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_detail
-- ----------------------------

-- ----------------------------
-- Table structure for asset_history
-- ----------------------------
DROP TABLE IF EXISTS `asset_history`;
CREATE TABLE `asset_history`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `asset_id` int NOT NULL COMMENT '资产编号',
  `handle_time` datetime NOT NULL COMMENT '处理时间',
  `handle_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '处理方式',
  `handle_id` int NOT NULL COMMENT '处理编号',
  `auditor_id` int NOT NULL COMMENT '处理人id',
  `handle_ins` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '处理内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资产履历' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_history
-- ----------------------------

-- ----------------------------
-- Table structure for asset_info
-- ----------------------------
DROP TABLE IF EXISTS `asset_info`;
CREATE TABLE `asset_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资产编号',
  `status` int NOT NULL DEFAULT 1 COMMENT '资产状态',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资产名称',
  `classify_id` int NOT NULL COMMENT '资产类别',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资产照片',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规格型号',
  `amount` decimal(10, 0) NOT NULL COMMENT '金额',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '计量单位',
  `sn_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品序列号',
  `company_id` int NOT NULL COMMENT '所属公司',
  `dept_id` int NOT NULL COMMENT '所属部门',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存放地点',
  `source_id` int NOT NULL COMMENT '来源',
  `purchase_time` datetime NOT NULL COMMENT '购入时间',
  `create_user` int NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '区域',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_info
-- ----------------------------
INSERT INTO `asset_info` VALUES (2, '11', 0, '11', 7, 'http://127.0.0.1:9300/statics/2023/11/10/wu_20231110114031A001.jpg', '11', 11, '11', '11', 102, 108, '11', 0, '2023-11-01 00:00:00', 11, '2023-11-10 11:40:55', '111', '0');
INSERT INTO `asset_info` VALUES (3, '22', 0, '22', 7, 'http://127.0.0.1:9300/statics/2023/11/12/wangze_20231112165327A002.jpg', '222', 22, '22', '22', 102, 108, '22', 0, '2023-11-06 00:00:00', 22, '2023-11-12 16:53:38', '22', '东北区域-吉林');
INSERT INTO `asset_info` VALUES (4, '33', 1, '33', 6, 'http://127.0.0.1:9300/statics/2023/11/12/wangze_20231112203526A003.jpg', '33', 33, '33', '33', 101, 106, '33', 1, '2023-11-07 00:00:00', 33, '2023-11-12 20:35:29', '33', '东北区域-吉林');
INSERT INTO `asset_info` VALUES (5, '444', 0, '444', 7, 'http://127.0.0.1:9300/statics/2023/11/13/wangze_20231113095448A002.jpg', '44', 444, '44', '44', 102, 108, '444', 1, '2023-11-07 00:00:00', 444, '2023-11-13 09:55:15', '444', '0');
INSERT INTO `asset_info` VALUES (6, '66', 2, '66', 5, 'http://127.0.0.1:9300/statics/2023/11/13/wangze_20231113100510A004.jpg', '66', 66, '66', '66', 101, 104, '66', 1, '2023-11-08 00:00:00', 66, '2023-11-13 10:05:29', '666', '东北区域-黑龙江');
INSERT INTO `asset_info` VALUES (7, '777', 0, '77', 6, 'http://127.0.0.1:9300/statics/2023/11/13/wangze_20231113102157A005.jpg', '77', 77, '77', '777', 102, 109, '777', 2, '2023-11-14 00:00:00', 777, '2023-11-13 10:22:28', '777', '华东大区-菏泽');

-- ----------------------------
-- Table structure for asset_receive
-- ----------------------------
DROP TABLE IF EXISTS `asset_receive`;
CREATE TABLE `asset_receive`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '领用编号',
  `user_id` int NOT NULL COMMENT '领用人',
  `receive_time` datetime NOT NULL COMMENT '领用时间',
  `company_id` int NOT NULL COMMENT '领用的公司',
  `dept_id` int NOT NULL COMMENT '领用的部门',
  `region_id` int NOT NULL COMMENT '部门的下的第三级位置',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '领用后存放地点',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '领用备注',
  `handler_id` int NOT NULL COMMENT '处理人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_receive
-- ----------------------------
INSERT INTO `asset_receive` VALUES (1, '11111', 0, '2023-11-07 00:00:00', 0, 0, 0, '111', '1111', 111);
INSERT INTO `asset_receive` VALUES (2, '222', 0, '2023-11-07 00:00:00', 102, 109, 7, '22', '222', 222);
INSERT INTO `asset_receive` VALUES (3, '22', 1, '2023-11-08 00:00:00', 102, 109, 7, '22', '22', 222);

-- ----------------------------
-- Table structure for asset_receive_info
-- ----------------------------
DROP TABLE IF EXISTS `asset_receive_info`;
CREATE TABLE `asset_receive_info`  (
  `id` int NOT NULL AUTO_INCREMENT  COMMENT '主键',
  `asset_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资产编号',
  `receive_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '领用编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_receive_info
-- ----------------------------

-- ----------------------------
-- Table structure for asset_region
-- ----------------------------
DROP TABLE IF EXISTS `asset_region`;
CREATE TABLE `asset_region`  (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '区域编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '区域名称',
  `parent_id` int NULL DEFAULT NULL COMMENT '上级区域',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_region
-- ----------------------------
INSERT INTO `asset_region` VALUES (0000000001, '01', '东北区域', 0);
INSERT INTO `asset_region` VALUES (0000000002, '02', '华东大区', 0);
INSERT INTO `asset_region` VALUES (0000000003, '011', '黑龙江', 1);
INSERT INTO `asset_region` VALUES (0000000004, '012', '吉林', 1);
INSERT INTO `asset_region` VALUES (0000000005, '013', '沈阳', 1);
INSERT INTO `asset_region` VALUES (0000000006, '021', '济南', 2);
INSERT INTO `asset_region` VALUES (0000000007, '022', '菏泽', 2);

-- ----------------------------
-- Table structure for asset_repair
-- ----------------------------
DROP TABLE IF EXISTS `asset_repair`;
CREATE TABLE `asset_repair`  (
  `id` int NOT NULL AUTO_INCREMENT  COMMENT '主键',
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '维修编号',
  `status` int NOT NULL COMMENT '状态',
  `user_id` int NOT NULL COMMENT '报修人',
  `cost` decimal(10, 2) NOT NULL COMMENT '维修花费',
  `repair_time` datetime NOT NULL COMMENT '维修时间',
  `guess_finish_time` datetime NOT NULL COMMENT '保修时间',
  `finish_time` datetime NOT NULL COMMENT '完成时间',
  `repair_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '维修人',
  `asset_id` int NOT NULL COMMENT '资产明细',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '维修内容',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '维修照片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_repair
-- ----------------------------

-- ----------------------------
-- Table structure for asset_scrap
-- ----------------------------
DROP TABLE IF EXISTS `asset_scrap`;
CREATE TABLE `asset_scrap`  (
  `id` int NOT NULL  AUTO_INCREMENT COMMENT '主键',
  `num` int NULL DEFAULT NULL COMMENT '报废编号',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `operate_id` int NULL DEFAULT NULL COMMENT '操作人',
  `scrap_time` datetime NULL DEFAULT NULL COMMENT '报废时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报废说明',
  `asset_id` int NULL DEFAULT NULL COMMENT '资产明细',
  `auditor_id` int NULL DEFAULT NULL COMMENT '审核人',
  `auditor_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资产报废' ROW_FORMAT = DYNAMIC;


SET FOREIGN_KEY_CHECKS = 1;
