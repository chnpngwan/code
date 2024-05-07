/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2023-08-16 13:54:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `alipay_config`
-- ----------------------------
DROP TABLE IF EXISTS `alipay_config`;
CREATE TABLE `alipay_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '编码',
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '异步回调',
  `private_key` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '私钥',
  `public_key` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '公钥',
  `return_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='支付宝配置类';

-- ----------------------------
-- Records of alipay_config
-- ----------------------------

-- ----------------------------
-- Table structure for `column_config`
-- ----------------------------
DROP TABLE IF EXISTS `column_config`;
CREATE TABLE `column_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `column_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `column_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dict_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `form_show` bit(1) DEFAULT NULL,
  `form_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `key_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `list_show` bit(1) DEFAULT NULL,
  `not_null` bit(1) DEFAULT NULL,
  `query_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_annotation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成字段信息存储';

-- ----------------------------
-- Records of column_config
-- ----------------------------

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `pid` bigint(20) NOT NULL COMMENT '上级部门',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='部门';

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', 'EL-ADMIN', '0', '', '2019-03-01 12:07:37');
INSERT INTO `dept` VALUES ('2', '研发部', '7', '', '2019-03-25 09:15:32');
INSERT INTO `dept` VALUES ('5', '运维部', '7', '', '2019-03-25 09:20:44');
INSERT INTO `dept` VALUES ('6', '测试部', '8', '', '2019-03-25 09:52:18');
INSERT INTO `dept` VALUES ('7', '华南分部', '1', '', '2019-03-25 11:04:50');
INSERT INTO `dept` VALUES ('8', '华北分部', '1', '', '2019-03-25 11:04:53');
INSERT INTO `dept` VALUES ('11', '人事部', '8', '', '2019-03-25 11:07:58');
INSERT INTO `dept` VALUES ('12', '商城管理员', '1', '', '2020-03-26 13:38:53');

-- ----------------------------
-- Table structure for `dict`
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典';

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', 'user_status', '用户状态', '2019-10-27 20:31:36');
INSERT INTO `dict` VALUES ('4', 'dept_status', '部门状态', '2019-10-27 20:31:36');
INSERT INTO `dict` VALUES ('5', 'job_status', '岗位状态', '2019-10-27 20:31:36');

-- ----------------------------
-- Table structure for `dict_detail`
-- ----------------------------
DROP TABLE IF EXISTS `dict_detail`;
CREATE TABLE `dict_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排序',
  `dict_id` bigint(20) DEFAULT NULL COMMENT '字典id',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK5tpkputc6d9nboxojdbgnpmyb` (`dict_id`) USING BTREE,
  CONSTRAINT `FK5tpkputc6d9nboxojdbgnpmyb` FOREIGN KEY (`dict_id`) REFERENCES `dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典详情';

-- ----------------------------
-- Records of dict_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `email_config`
-- ----------------------------
DROP TABLE IF EXISTS `email_config`;
CREATE TABLE `email_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `from_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `port` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '端口',
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱配置';

-- ----------------------------
-- Records of email_config
-- ----------------------------

-- ----------------------------
-- Table structure for `gen_config`
-- ----------------------------
DROP TABLE IF EXISTS `gen_config`;
CREATE TABLE `gen_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表名',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '作者',
  `cover` bit(1) DEFAULT NULL COMMENT '是否覆盖',
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模块名称',
  `pack` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '至于哪个包下',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前端代码生成的路径',
  `api_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前端Api文件路径',
  `prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表前缀',
  `api_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成器配置';

-- ----------------------------
-- Records of gen_config
-- ----------------------------

-- ----------------------------
-- Table structure for `gen_test`
-- ----------------------------
DROP TABLE IF EXISTS `gen_test`;
CREATE TABLE `gen_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成测试';

-- ----------------------------
-- Records of gen_test
-- ----------------------------

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `sort` bigint(20) NOT NULL COMMENT '岗位排序',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKmvhj0rogastlctflsxf1d6k3i` (`dept_id`) USING BTREE,
  CONSTRAINT `FKmvhj0rogastlctflsxf1d6k3i` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='岗位';

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('8', '人事专员', '', '3', '11', '2019-03-29 14:52:28');
INSERT INTO `job` VALUES ('10', '产品经理', '', '4', '2', '2019-03-29 14:55:51');
INSERT INTO `job` VALUES ('11', '全栈开发', '', '2', '2', '2019-03-31 13:39:30');
INSERT INTO `job` VALUES ('12', '软件测试', '', '5', '2', '2019-03-31 13:39:43');
INSERT INTO `job` VALUES ('13', '管理员', '', '999', '1', '2020-03-26 13:39:52');

-- ----------------------------
-- Table structure for `local_storage`
-- ----------------------------
DROP TABLE IF EXISTS `local_storage`;
CREATE TABLE `local_storage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路径',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `size` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '大小',
  `operate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='本地存储';

-- ----------------------------
-- Records of local_storage
-- ----------------------------

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `exception_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `log_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `request_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75367 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统日志';

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组件',
  `pid` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `sort` bigint(20) NOT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接地址',
  `cache` bit(1) DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) DEFAULT b'0' COMMENT '是否隐藏',
  `component_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '-' COMMENT '组件名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKqcf9gem97gqa5qjm4d3elcqt5` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '', '系统管理', null, '0', '99', 'system', 'system', '', '', null, '2018-12-18 15:11:29', null, '1');
INSERT INTO `menu` VALUES ('2', '', '用户管理', 'system/user/index', '1', '2', 'peoples', 'user', '', '', 'User', '2018-12-18 15:14:44', null, '1');
INSERT INTO `menu` VALUES ('3', '', '角色管理', 'system/role/index', '1', '3', 'role', 'role', '', '', 'Role', '2018-12-18 15:16:07', null, '1');
INSERT INTO `menu` VALUES ('5', '', '菜单管理', 'system/menu/index', '1', '5', 'menu', 'menu', '', '', 'Menu', '2018-12-18 15:17:28', 'admin,menu:list,roles:list', '1');
INSERT INTO `menu` VALUES ('6', '', '系统监控', null, '0', '100', 'monitor', 'monitor', '', '', null, '2018-12-18 15:17:48', null, '1');
INSERT INTO `menu` VALUES ('7', '', '操作日志', 'monitor/log/index', '6', '11', 'log', 'logs', '', '', 'Log', '2018-12-18 15:18:26', null, '1');
INSERT INTO `menu` VALUES ('9', '', 'SQL监控', 'monitor/sql/index', '6', '14', 'sqlMonitor', 'druid', '', '', 'Sql', '2018-12-18 15:19:34', null, '1');
INSERT INTO `menu` VALUES ('14', '', '邮件工具', 'tools/email/index', '36', '24', 'email', 'email', '', '', 'Email', '2018-12-27 10:13:09', null, '1');
INSERT INTO `menu` VALUES ('16', '', '图片管理', 'tools/picture/index', '36', '25', 'image', 'pictures', '', '', 'Pictures', '2018-12-28 09:36:53', null, '1');
INSERT INTO `menu` VALUES ('18', '', '存储管理', 'tools/storage/index', '36', '23', 'qiniu', 'storage', '', '', 'Storage', '2018-12-31 11:12:15', null, '1');
INSERT INTO `menu` VALUES ('19', '', '支付宝工具', 'tools/aliPay/index', '36', '27', 'alipay', 'aliPay', '', '', 'AliPay', '2018-12-31 14:52:38', null, '1');
INSERT INTO `menu` VALUES ('28', '', '定时任务', 'system/timing/index', '36', '21', 'timing', 'timing', '', '', 'Timing', '2019-01-07 20:34:40', null, '1');
INSERT INTO `menu` VALUES ('30', '', '代码生成', 'generator/index', '36', '22', 'dev', 'generator', '', '', 'GeneratorIndex', '2019-01-11 15:45:55', null, '1');
INSERT INTO `menu` VALUES ('32', '', '异常日志', 'monitor/log/errorLog', '6', '12', 'error', 'errorLog', '', '', 'ErrorLog', '2019-01-13 13:49:03', null, '1');
INSERT INTO `menu` VALUES ('35', '', '部门管理', 'system/dept/index', '1', '6', 'dept', 'dept', '', '', 'Dept', '2019-03-25 09:46:00', null, '1');
INSERT INTO `menu` VALUES ('36', '', '系统工具', '', '0', '101', 'sys-tools', 'sys-tools', '', '', null, '2019-03-29 10:57:35', null, '1');
INSERT INTO `menu` VALUES ('37', '', '岗位管理', 'system/job/index', '1', '7', 'Steve-Jobs', 'job', '', '', 'Job', '2019-03-29 13:51:18', null, '1');
INSERT INTO `menu` VALUES ('39', '', '字典管理', 'system/dict/index', '1', '8', 'dictionary', 'dict', '', '', 'Dict', '2019-04-10 11:49:04', null, '1');
INSERT INTO `menu` VALUES ('40', '', '商品管理', '', '0', '1', 'shop', 'shop', '', '', '', '2019-10-03 17:40:19', null, '1');
INSERT INTO `menu` VALUES ('41', '', '商品分类', 'shop/cate/index', '40', '11', 'icon', 'cate', '', '', 'Cate', '2019-10-03 17:42:35', 'YXSTORECATEGORY_SELECT', '1');
INSERT INTO `menu` VALUES ('45', '', '管理商品', 'shop/goods/tab', '40', '12', 'develop', 'goods', '', '', 'Goods', '2019-10-04 15:34:35', 'YXSTOREPRODUCT_SELECT', '1');
INSERT INTO `menu` VALUES ('46', '', '会员管理', '', '0', '2', 'peoples', 'member', '', '', '', '2019-10-06 16:18:05', null, '1');
INSERT INTO `menu` VALUES ('47', '', '会员', 'shop/user/index', '46', '21', 'peoples', 'member', '', '', 'Member', '2019-10-06 16:20:17', null, '1');
INSERT INTO `menu` VALUES ('48', '', '微信管理', '', '0', '3', 'weixin', 'wechat', '', '', '', '2019-10-06 18:28:54', null, '1');
INSERT INTO `menu` VALUES ('49', '', '微信菜单', 'wechat/menu/index', '48', '31', 'menu', 'wemenu', '', '', 'WeMenu', '2019-10-06 18:31:06', null, '1');
INSERT INTO `menu` VALUES ('53', '', '订单管理', '', '0', '4', 'lock', 'order', '', '', '', '2019-10-14 14:35:18', null, '1');
INSERT INTO `menu` VALUES ('54', '', '订单', 'shop/order/index', '53', '41', 'order', 'order', '', '', 'Order', '2019-10-14 14:36:28', null, '1');
INSERT INTO `menu` VALUES ('55', '', '商城配置', '', '0', '5', 'configure', 'set', '', '', '', '2019-10-18 15:21:26', null, '1');
INSERT INTO `menu` VALUES ('56', '', '首页幻灯片', 'shop/set/index', '55', '51', 'banner', 'homeBanner', '', '', 'HomeBanner', '2019-10-18 15:24:30', null, '1');
INSERT INTO `menu` VALUES ('57', '', '首页导航按钮', 'shop/set/menu', '55', '52', 'button', 'homeMenus', '', '', 'HomeMenus', '2019-10-18 17:23:35', null, '1');
INSERT INTO `menu` VALUES ('59', '', '首页滚动新闻', 'shop/set/roll', '55', '54', 'news', 'roll', '', '', 'Roll', '2019-10-21 16:41:30', null, '1');
INSERT INTO `menu` VALUES ('60', '', '热门搜索', 'shop/set/hot', '55', '55', 'search', 'hot', '', '', 'Hot', '2019-10-26 18:21:54', null, '1');
INSERT INTO `menu` VALUES ('61', '', '个人中心菜单', 'shop/set/usermenu', '55', '56', 'menu', 'userMenu', '', '', 'UserMenu', '2019-10-26 18:42:18', null, '1');
INSERT INTO `menu` VALUES ('62', '', '评论管理', 'shop/reply/index', '53', '42', 'comment', 'reply', '', '', 'Reply', '2019-11-03 14:39:09', null, '1');
INSERT INTO `menu` VALUES ('63', '', '营销管理', '', '0', '6', 'yingxiao', 'activity', '', '', '', '2019-11-09 14:17:42', null, '1');
INSERT INTO `menu` VALUES ('64', '', '优惠券制作', 'activity/coupon/index', '63', '61', 'coupon', 'coupon', '', '', 'Coupon', '2019-11-09 14:18:58', null, '1');
INSERT INTO `menu` VALUES ('65', '', '已发布优惠券', 'activity/couponissue/index', '63', '62', 'coupon2', 'couponissue', '', '', 'Couponissue', '2019-11-09 14:20:35', null, '1');
INSERT INTO `menu` VALUES ('66', '', '优惠券领取记录', 'activity/storecouponuser/index', '63', '63', 'log', 'couponuser', '', '', 'Couponuser', '2019-11-09 14:21:35', null, '1');
INSERT INTO `menu` VALUES ('67', '', '优惠券配置', 'activity/coupon/set', '63', '64', 'log', 'couponset', '', '', 'Couponset', '2019-11-09 14:22:17', null, '1');
INSERT INTO `menu` VALUES ('75', '', '微信支付配置', 'wechat/config/pay', '48', '35', 'wxpay', 'wxpayconfig', '', '', 'Wxpayconfig', '2019-11-28 17:06:22', null, '1');
INSERT INTO `menu` VALUES ('76', '', '小程序配置', 'wechat/config/wxapp', '48', '36', 'configure', 'wxapp', '', '', 'Wxapp', '2019-11-29 15:13:46', null, '1');
INSERT INTO `menu` VALUES ('77', '', '会员等级', 'shop/userlevel/index', '46', '22', 'dengji', 'userlevel', '', '', 'Userlevel', '2019-12-04 16:35:41', null, '1');
INSERT INTO `menu` VALUES ('78', '', '等级任务', 'shop/usertask/index', '46', '23', 'task manege', 'usertask', '', '', 'Usertask', '2019-12-04 17:26:19', null, '1');
INSERT INTO `menu` VALUES ('80', '', '用户账单', 'shop/user/bill', '46', '24', 'list', 'bill', '', '', 'Bill', '2019-12-11 17:28:38', null, '1');
INSERT INTO `menu` VALUES ('81', '', '物流快递', 'shop/express/index', '53', '43', 'express', 'express', '', '', 'Express', '2019-12-12 16:36:00', null, '1');
INSERT INTO `menu` VALUES ('82', '', '微信模板消息', 'wechat/template/index', '48', '35', 'anq', 'template', '', '', 'Template', '2019-12-13 14:42:50', null, '1');
INSERT INTO `menu` VALUES ('87', '', '生成配置', 'generator/config', '36', '33', 'dev', 'generator/config/:tableName', '', '', 'GeneratorConfig', '2019-11-17 20:08:56', '', '1');
INSERT INTO `menu` VALUES ('88', '', '生成预览', 'generator/preview', '36', '999', 'java', 'generator/preview/:tableName', '', '', 'Preview', '2019-11-26 14:54:36', null, '1');
INSERT INTO `menu` VALUES ('115', '', '服务监控', 'monitor/server/index', '6', '14', 'codeConsole', 'server', '', '', 'ServerMonitor', '2019-11-07 13:06:39', 'server:list', '1');
INSERT INTO `menu` VALUES ('116', '', '生成配置', 'generator/config', '36', '33', 'dev', 'generator/config/:tableName', '', '', 'GeneratorConfig', '2019-11-17 20:08:56', '', '1');
INSERT INTO `menu` VALUES ('117', '', '图表库', 'components/Echarts', '10', '50', 'chart', 'echarts', '', '', 'Echarts', '2019-11-21 09:04:32', '', '1');
INSERT INTO `menu` VALUES ('118', '', '新增', null, '45', '1', null, null, '', '', null, '2019-12-24 13:00:47', 'YXSTOREPRODUCT_EDIT', '2');
INSERT INTO `menu` VALUES ('119', '', '修改', null, '45', '999', null, null, '', '', null, '2019-12-24 13:02:23', 'YXSTOREPRODUCT_CREATE', '2');
INSERT INTO `menu` VALUES ('120', '', '删除出差', null, '45', '994', null, null, '', '', null, '2019-12-24 13:03:51', 'YXSTOREPRODUCT_DELETE', '2');
INSERT INTO `menu` VALUES ('121', '', '在线用户', 'monitor/online/index', '6', '10', 'Steve-Jobs', 'online', '', '', 'OnlineUser', '2020-01-06 22:46:43', null, '1');
INSERT INTO `menu` VALUES ('122', '', '浏览记录', 'monitor/log/mlog', '40', '13', 'log', 'viewlog', '', '', 'Viewlog', '2020-01-07 13:17:21', null, '1');
INSERT INTO `menu` VALUES ('123', '', '后台接口文档', 'tools/swagger/index', '36', '31', 'swagger', 'swagger2', '', '', 'Swagger', '2020-01-07 18:05:52', null, '1');
INSERT INTO `menu` VALUES ('178', '', '门店管理', null, '0', '9', 'store', 'store', '', '', null, '2020-03-03 17:27:53', null, '1');
INSERT INTO `menu` VALUES ('179', '', '门店列表', 'shop/store/index', '178', '92', 'edit', 'storeinfo', '', '', 'Storeinfo', '2020-03-03 17:29:09', null, '1');
INSERT INTO `menu` VALUES ('180', '', '门店配置', 'shop/store/set', '178', '91', 'configure', 'storeset', '', '', 'Storeset', '2020-03-04 13:09:54', null, '1');
INSERT INTO `menu` VALUES ('181', '', '核销订单', 'shop/order/indext', '178', '93', 'order', 'ordert', '', '', 'Ordert', '2020-03-05 17:04:12', null, '1');
INSERT INTO `menu` VALUES ('182', '', '店长管理', 'shop/storestaff/index', '178', '94', 'peoples', 'staff', '', '', 'Staff', '2020-04-01 18:27:19', null, '1');
INSERT INTO `menu` VALUES ('183', '', '包邮/配送', 'wechat/config/postage', '55', '58', 'express', 'postageConfig', '', '', '-PostageConfig', '2020-04-05 11:02:01', null, '1');
INSERT INTO `menu` VALUES ('184', '', '图片素材', 'shop/psd/index', '40', '14', 'article', 'material', '', '', 'MaterialList', '2020-04-23 18:30:38', null, '1');
INSERT INTO `menu` VALUES ('185', '', '在线会员', 'monitor/online/indext', '46', '25', 'Steve-Jobs', 'onlinet', '', '', 'OnlineMember', '2020-04-29 13:41:02', null, '1');
INSERT INTO `menu` VALUES ('188', '', '小程序路由', 'shop/set/copyroter', '55', '61', 'article', 'copyroter', '', '', 'Copyroter', '2021-03-30 15:17:32', null, '1');
INSERT INTO `menu` VALUES ('189', '', '购物提示', 'wechat/config/buyinfo', '55', '58', 'message', 'buyInfoConfig', '', '', '-buyInfoConfig', '2020-04-05 11:02:01', null, '1');
INSERT INTO `menu` VALUES ('190', '', '首页主题商品', 'shop/template/index', '55', '999', 'configure', 'template', '', '', 'template', '2023-05-11 15:29:49', null, '1');
INSERT INTO `menu` VALUES ('191', '', '广告配置', 'shop/advertising/index', '55', '1000', 'monthlyview', 'advertising', '', '', 'advertising', '2023-05-12 18:51:58', null, '1');
INSERT INTO `menu` VALUES ('192', '', '群二维码配置', 'wechat/config/joinGroup', '55', '64', 'peoples', 'joinGroup', '', '', 'joinGroup', '2020-04-05 11:02:01', null, '1');
INSERT INTO `menu` VALUES ('193', '', '美食厨房分类', 'shop/videotype/index', '40', '15', 'configure', 'videotype', '', '', 'videotype', '2019-10-03 17:42:35', 'videotype_SELECT', '1');
INSERT INTO `menu` VALUES ('194', '', '美食厨房', 'shop/video/index', '40', '16', 'news', 'video', '', '', 'video', '2019-10-03 17:42:35', 'video_SELECT', '1');

-- ----------------------------
-- Table structure for `mnt_app`
-- ----------------------------
DROP TABLE IF EXISTS `mnt_app`;
CREATE TABLE `mnt_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '应用名称',
  `upload_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上传目录',
  `deploy_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部署路径',
  `backup_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备份路径',
  `port` int(11) DEFAULT NULL COMMENT '应用端口',
  `start_script` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '启动脚本',
  `deploy_script` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部署脚本',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='应用管理';

-- ----------------------------
-- Records of mnt_app
-- ----------------------------

-- ----------------------------
-- Table structure for `mnt_database`
-- ----------------------------
DROP TABLE IF EXISTS `mnt_database`;
CREATE TABLE `mnt_database` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `jdbc_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'jdbc连接',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据库管理';

-- ----------------------------
-- Records of mnt_database
-- ----------------------------

-- ----------------------------
-- Table structure for `mnt_deploy`
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy`;
CREATE TABLE `mnt_deploy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用编号',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK6sy157pseoxx4fmcqr1vnvvhy` (`app_id`) USING BTREE,
  CONSTRAINT `FK6sy157pseoxx4fmcqr1vnvvhy` FOREIGN KEY (`app_id`) REFERENCES `mnt_app` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部署管理';

-- ----------------------------
-- Records of mnt_deploy
-- ----------------------------

-- ----------------------------
-- Table structure for `mnt_deploy_history`
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy_history`;
CREATE TABLE `mnt_deploy_history` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `app_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用名称',
  `deploy_date` datetime NOT NULL COMMENT '部署日期',
  `deploy_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部署用户',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务器IP',
  `deploy_id` bigint(20) DEFAULT NULL COMMENT '部署编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部署历史管理';

-- ----------------------------
-- Records of mnt_deploy_history
-- ----------------------------

-- ----------------------------
-- Table structure for `mnt_deploy_server`
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy_server`;
CREATE TABLE `mnt_deploy_server` (
  `deploy_id` bigint(20) NOT NULL,
  `server_id` bigint(20) NOT NULL,
  PRIMARY KEY (`deploy_id`,`server_id`) USING BTREE,
  KEY `FKeaaha7jew9a02b3bk9ghols53` (`server_id`) USING BTREE,
  CONSTRAINT `FK3cehr56tedph6nk3gxsmeq0pb` FOREIGN KEY (`deploy_id`) REFERENCES `mnt_deploy` (`id`),
  CONSTRAINT `FKeaaha7jew9a02b3bk9ghols53` FOREIGN KEY (`server_id`) REFERENCES `mnt_server` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='应用与服务器关联';

-- ----------------------------
-- Records of mnt_deploy_server
-- ----------------------------

-- ----------------------------
-- Table structure for `mnt_server`
-- ----------------------------
DROP TABLE IF EXISTS `mnt_server`;
CREATE TABLE `mnt_server` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'IP地址',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IP地址',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='服务器管理';

-- ----------------------------
-- Records of mnt_server
-- ----------------------------

-- ----------------------------
-- Table structure for `monitor_server`
-- ----------------------------
DROP TABLE IF EXISTS `monitor_server`;
CREATE TABLE `monitor_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu_core` int(11) DEFAULT NULL COMMENT 'CPU内核数',
  `cpu_rate` double DEFAULT NULL COMMENT 'CPU使用率',
  `disk_total` double DEFAULT NULL COMMENT '磁盘总量',
  `disk_used` double DEFAULT NULL COMMENT '磁盘使用量',
  `mem_total` double DEFAULT NULL COMMENT '内存总数',
  `mem_used` double DEFAULT NULL COMMENT '内存使用量',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `port` int(11) DEFAULT NULL COMMENT '访问端口',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  `swap_total` double DEFAULT NULL COMMENT '交换区总量',
  `swap_used` double DEFAULT NULL COMMENT '交换区使用量',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='服务监控';

-- ----------------------------
-- Records of monitor_server
-- ----------------------------

-- ----------------------------
-- Table structure for `pdman_up_yx_store_category`
-- ----------------------------
DROP TABLE IF EXISTS `pdman_up_yx_store_category`;
CREATE TABLE `pdman_up_yx_store_category` (
  `id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '商品分类表ID',
  `pid` mediumint(9) NOT NULL COMMENT '父id',
  `cate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `sort` mediumint(9) DEFAULT NULL COMMENT '排序',
  `pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否推荐',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pdman_up_yx_store_category
-- ----------------------------

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '别名',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `pid` int(11) NOT NULL COMMENT '上级权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '超级管理员', '2018-12-03 12:27:48', 'ADMIN', '0');
INSERT INTO `permission` VALUES ('2', '用户管理', '2018-12-03 12:28:19', 'USER_ALL', '0');
INSERT INTO `permission` VALUES ('3', '用户查询', '2018-12-03 12:31:35', 'USER_SELECT', '2');
INSERT INTO `permission` VALUES ('4', '用户创建', '2018-12-03 12:31:35', 'USER_CREATE', '2');
INSERT INTO `permission` VALUES ('5', '用户编辑', '2018-12-03 12:31:35', 'USER_EDIT', '2');
INSERT INTO `permission` VALUES ('6', '用户删除', '2018-12-03 12:31:35', 'USER_DELETE', '2');
INSERT INTO `permission` VALUES ('7', '角色管理', '2018-12-03 12:28:19', 'ROLES_ALL', '0');
INSERT INTO `permission` VALUES ('8', '角色查询', '2018-12-03 12:31:35', 'ROLES_SELECT', '7');
INSERT INTO `permission` VALUES ('10', '角色创建', '2018-12-09 20:10:16', 'ROLES_CREATE', '7');
INSERT INTO `permission` VALUES ('11', '角色编辑', '2018-12-09 20:10:42', 'ROLES_EDIT', '7');
INSERT INTO `permission` VALUES ('12', '角色删除', '2018-12-09 20:11:07', 'ROLES_DELETE', '7');
INSERT INTO `permission` VALUES ('13', '权限管理', '2018-12-09 20:11:37', 'PERMISSION_ALL', '0');
INSERT INTO `permission` VALUES ('14', '权限查询', '2018-12-09 20:11:55', 'PERMISSION_SELECT', '13');
INSERT INTO `permission` VALUES ('15', '权限创建', '2018-12-09 20:14:10', 'PERMISSION_CREATE', '13');
INSERT INTO `permission` VALUES ('16', '权限编辑', '2018-12-09 20:15:44', 'PERMISSION_EDIT', '13');
INSERT INTO `permission` VALUES ('17', '权限删除', '2018-12-09 20:15:59', 'PERMISSION_DELETE', '13');
INSERT INTO `permission` VALUES ('18', '缓存管理', '2018-12-17 13:53:25', 'REDIS_ALL', '0');
INSERT INTO `permission` VALUES ('20', '缓存查询', '2018-12-17 13:54:07', 'REDIS_SELECT', '18');
INSERT INTO `permission` VALUES ('22', '缓存删除', '2018-12-17 13:55:04', 'REDIS_DELETE', '18');
INSERT INTO `permission` VALUES ('23', '图床管理', '2018-12-27 20:31:49', 'PICTURE_ALL', '0');
INSERT INTO `permission` VALUES ('24', '查询图片', '2018-12-27 20:32:04', 'PICTURE_SELECT', '23');
INSERT INTO `permission` VALUES ('25', '上传图片', '2018-12-27 20:32:24', 'PICTURE_UPLOAD', '23');
INSERT INTO `permission` VALUES ('26', '删除图片', '2018-12-27 20:32:45', 'PICTURE_DELETE', '23');
INSERT INTO `permission` VALUES ('29', '菜单管理', '2018-12-28 17:34:31', 'MENU_ALL', '0');
INSERT INTO `permission` VALUES ('30', '菜单查询', '2018-12-28 17:34:41', 'MENU_SELECT', '29');
INSERT INTO `permission` VALUES ('31', '菜单创建', '2018-12-28 17:34:52', 'MENU_CREATE', '29');
INSERT INTO `permission` VALUES ('32', '菜单编辑', '2018-12-28 17:35:20', 'MENU_EDIT', '29');
INSERT INTO `permission` VALUES ('33', '菜单删除', '2018-12-28 17:35:29', 'MENU_DELETE', '29');
INSERT INTO `permission` VALUES ('35', '定时任务管理', '2019-01-08 14:59:57', 'JOB_ALL', '0');
INSERT INTO `permission` VALUES ('36', '任务查询', '2019-01-08 15:00:09', 'JOB_SELECT', '35');
INSERT INTO `permission` VALUES ('37', '任务创建', '2019-01-08 15:00:20', 'JOB_CREATE', '35');
INSERT INTO `permission` VALUES ('38', '任务编辑', '2019-01-08 15:00:33', 'JOB_EDIT', '35');
INSERT INTO `permission` VALUES ('39', '任务删除', '2019-01-08 15:01:13', 'JOB_DELETE', '35');
INSERT INTO `permission` VALUES ('40', '部门管理', '2019-03-29 17:06:55', 'DEPT_ALL', '0');
INSERT INTO `permission` VALUES ('41', '部门查询', '2019-03-29 17:07:09', 'DEPT_SELECT', '40');
INSERT INTO `permission` VALUES ('42', '部门创建', '2019-03-29 17:07:29', 'DEPT_CREATE', '40');
INSERT INTO `permission` VALUES ('43', '部门编辑', '2019-03-29 17:07:52', 'DEPT_EDIT', '40');
INSERT INTO `permission` VALUES ('44', '部门删除', '2019-03-29 17:08:14', 'DEPT_DELETE', '40');
INSERT INTO `permission` VALUES ('45', '岗位管理', '2019-03-29 17:08:52', 'USERJOB_ALL', '0');
INSERT INTO `permission` VALUES ('46', '岗位查询', '2019-03-29 17:10:27', 'USERJOB_SELECT', '45');
INSERT INTO `permission` VALUES ('47', '岗位创建', '2019-03-29 17:10:55', 'USERJOB_CREATE', '45');
INSERT INTO `permission` VALUES ('48', '岗位编辑', '2019-03-29 17:11:08', 'USERJOB_EDIT', '45');
INSERT INTO `permission` VALUES ('49', '岗位删除', '2019-03-29 17:11:19', 'USERJOB_DELETE', '45');
INSERT INTO `permission` VALUES ('50', '字典管理', '2019-04-10 16:24:51', 'DICT_ALL', '0');
INSERT INTO `permission` VALUES ('51', '字典查询', '2019-04-10 16:25:16', 'DICT_SELECT', '50');
INSERT INTO `permission` VALUES ('52', '字典创建', '2019-04-10 16:25:29', 'DICT_CREATE', '50');
INSERT INTO `permission` VALUES ('53', '字典编辑', '2019-04-10 16:27:19', 'DICT_EDIT', '50');
INSERT INTO `permission` VALUES ('54', '字典删除', '2019-04-10 16:27:30', 'DICT_DELETE', '50');
INSERT INTO `permission` VALUES ('55', '文件管理', '2019-09-08 12:31:54', 'LOCALSTORAGE_ALL', '0');
INSERT INTO `permission` VALUES ('56', '文件搜索', '2019-09-08 12:40:53', 'LOCALSTORAGE_SELECT', '55');
INSERT INTO `permission` VALUES ('57', '文件上传', '2019-09-08 12:41:05', 'LOCALSTORAGE_CREATE', '55');
INSERT INTO `permission` VALUES ('58', '文件编辑', '2019-09-08 12:41:19', 'LOCALSTORAGE_EDIT', '55');
INSERT INTO `permission` VALUES ('59', '文件删除', '2019-09-08 12:41:29', 'LOCALSTORAGE_DELETE', '55');
INSERT INTO `permission` VALUES ('60', '商品分类管理', '2019-10-03 18:09:55', 'YXSTORECATEGORY_ALL', '0');
INSERT INTO `permission` VALUES ('61', '查询', '2019-10-03 18:10:49', 'YXSTORECATEGORY_SELECT', '60');

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '上传日期',
  `delete_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '删除的URL',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片名称',
  `height` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片高度',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片大小',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片地址',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名称',
  `width` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片宽度',
  `md5code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件的MD5值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Sm.Ms图床';

-- ----------------------------
-- Records of picture
-- ----------------------------

-- ----------------------------
-- Table structure for `qiniu_config`
-- ----------------------------
DROP TABLE IF EXISTS `qiniu_config`;
CREATE TABLE `qiniu_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `access_key` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'accessKey',
  `bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Bucket 识别符',
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外链域名',
  `secret_key` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'secretKey',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '空间类型',
  `zone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '机房',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='七牛云配置';

-- ----------------------------
-- Records of qiniu_config
-- ----------------------------

-- ----------------------------
-- Table structure for `qiniu_content`
-- ----------------------------
DROP TABLE IF EXISTS `qiniu_content`;
CREATE TABLE `qiniu_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Bucket 识别符',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名称',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件类型：私有或公开',
  `update_time` datetime DEFAULT NULL COMMENT '上传或同步的时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件url',
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2216 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='七牛云文件存储';

-- ----------------------------
-- Records of qiniu_content
-- ----------------------------

-- ----------------------------
-- Table structure for `quartz_job`
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job`;
CREATE TABLE `quartz_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务';

-- ----------------------------
-- Records of quartz_job
-- ----------------------------

-- ----------------------------
-- Table structure for `quartz_log`
-- ----------------------------
DROP TABLE IF EXISTS `quartz_log`;
CREATE TABLE `quartz_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baen_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `exception_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `is_success` bit(1) DEFAULT NULL,
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=167283 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务日志';

-- ----------------------------
-- Records of quartz_log
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `data_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据权限',
  `level` int(11) DEFAULT NULL COMMENT '角色级别',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '超级管理员', '全部', '1', '2018-11-23 11:04:37', 'admin');
INSERT INTO `role` VALUES ('2', '普通用户', '零售会员', '本级', '3', '2018-11-23 13:09:06', 'common');
INSERT INTO `role` VALUES ('4', '管理员', '管理员', '本级', '1', '2020-03-25 01:14:51', '管理员');
INSERT INTO `role` VALUES ('6', '商超店长', '商超店长', '全部', '2', '2020-10-10 20:23:20', '批发商');

-- ----------------------------
-- Table structure for `roles_depts`
-- ----------------------------
DROP TABLE IF EXISTS `roles_depts`;
CREATE TABLE `roles_depts` (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE,
  KEY `FK7qg6itn5ajdoa9h9o78v9ksur` (`dept_id`) USING BTREE,
  CONSTRAINT `FK7qg6itn5ajdoa9h9o78v9ksur` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`),
  CONSTRAINT `FKrg1ci4cxxfbja0sb0pddju7k` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色部门关联';

-- ----------------------------
-- Records of roles_depts
-- ----------------------------

-- ----------------------------
-- Table structure for `roles_menus`
-- ----------------------------
DROP TABLE IF EXISTS `roles_menus`;
CREATE TABLE `roles_menus` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`) USING BTREE,
  KEY `FKcngg2qadojhi3a651a5adkvbq` (`role_id`) USING BTREE,
  CONSTRAINT `FKo7wsmlrrxb2osfaoavp46rv2r` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `FKtag324maketmxffly3pdyh193` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色菜单关联';

-- ----------------------------
-- Records of roles_menus
-- ----------------------------

-- ----------------------------
-- Table structure for `roles_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`permission_id`) USING BTREE,
  KEY `FKboeuhl31go7wer3bpy6so7exi` (`permission_id`) USING BTREE,
  CONSTRAINT `roles_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `roles_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of roles_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `avatar_id` bigint(20) DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `enabled` bigint(20) DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门名称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `job_id` bigint(20) DEFAULT NULL COMMENT '岗位名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `last_password_reset_time` datetime DEFAULT NULL COMMENT '最后修改密码的日期',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_kpubos9gc2cvtkb0thktkbkes` (`email`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `FK5rwmryny6jthaaxkogownknqp` (`dept_id`) USING BTREE,
  KEY `FKfftoc2abhot8f2wu6cl9a5iky` (`job_id`) USING BTREE,
  KEY `FKpq2dhypk2qgt68nauh2by22jb` (`avatar_id`) USING BTREE,
  CONSTRAINT `FK5rwmryny6jthaaxkogownknqp` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`),
  CONSTRAINT `FKfftoc2abhot8f2wu6cl9a5iky` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FKpq2dhypk2qgt68nauh2by22jb` FOREIGN KEY (`avatar_id`) REFERENCES `user_avatar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '446412648@qq.com', '1', '$2a$10$CKrO3PS8.u4WrTTOxgGtQ.XIkcoFSx3195IplvMDatLBgiO.jitfK', 'admin', '2', '13565988178', '11', '2018-08-23 09:11:56', '2020-05-12 22:24:05', '管理员', '男');

-- ----------------------------
-- Table structure for `users_roles`
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `FKq4eq273l04bpu4efj0jd0jb98` (`role_id`) USING BTREE,
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户角色关联';

-- ----------------------------
-- Records of users_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `user_avatar`
-- ----------------------------
DROP TABLE IF EXISTS `user_avatar`;
CREATE TABLE `user_avatar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实文件名',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路径',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '大小',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户头像';

-- ----------------------------
-- Records of user_avatar
-- ----------------------------
INSERT INTO `user_avatar` VALUES ('1', 'D:\\yshop\\avatar\\banner-20230210061231464.jpg', '/www/wwwroot/jar-mall/D:\\yshop\\avatar\\banner-20230210061231464.jpg', '102.24KB   ', null);

-- ----------------------------
-- Table structure for `verification_code`
-- ----------------------------
DROP TABLE IF EXISTS `verification_code`;
CREATE TABLE `verification_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '验证码',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `status` bit(1) DEFAULT NULL COMMENT '状态：1有效、0过期',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '验证码类型：email或者短信',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '接收邮箱或者手机号码',
  `scenes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '业务名称：如重置邮箱、重置密码等',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='验证码';

-- ----------------------------
-- Records of verification_code
-- ----------------------------

-- ----------------------------
-- Table structure for `visits`
-- ----------------------------
DROP TABLE IF EXISTS `visits`;
CREATE TABLE `visits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip_counts` bigint(20) DEFAULT NULL,
  `pv_counts` bigint(20) DEFAULT NULL,
  `week_day` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_11aksgq87euk9bcyeesfs4vtp` (`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=871 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='访客记录';

-- ----------------------------
-- Records of visits
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_article`
-- ----------------------------
DROP TABLE IF EXISTS `yx_article`;
CREATE TABLE `yx_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章管理ID',
  `cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '分类id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章作者',
  `image_input` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章图片',
  `synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章简介',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章分享标题',
  `share_synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章分享简介',
  `visit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '浏览次数',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原文链接',
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT '状态',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '添加时间',
  `hide` tinyint(3) unsigned DEFAULT '0' COMMENT '是否隐藏',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员id',
  `mer_id` int(10) unsigned DEFAULT '0' COMMENT '商户id',
  `product_id` int(11) DEFAULT '0' COMMENT '产品关联id',
  `is_hot` tinyint(3) unsigned DEFAULT '0' COMMENT '是否热门(小程序)',
  `is_banner` tinyint(3) unsigned DEFAULT '0' COMMENT '是否轮播图(小程序)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章管理表';

-- ----------------------------
-- Records of yx_article
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_article_category`
-- ----------------------------
DROP TABLE IF EXISTS `yx_article_category`;
CREATE TABLE `yx_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章分类标题',
  `intr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章分类简介',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章分类图片',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1删除0未删除',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '添加时间',
  `hidden` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章分类表';

-- ----------------------------
-- Records of yx_article_category
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_article_content`
-- ----------------------------
DROP TABLE IF EXISTS `yx_article_content`;
CREATE TABLE `yx_article_content` (
  `nid` int(10) unsigned NOT NULL COMMENT '文章id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  UNIQUE KEY `nid` (`nid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章内容表';

-- ----------------------------
-- Records of yx_article_content
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_express`
-- ----------------------------
DROP TABLE IF EXISTS `yx_express`;
CREATE TABLE `yx_express` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '快递公司id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递公司简称',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递公司全称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='快递公司表';

-- ----------------------------
-- Records of yx_express
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_material`
-- ----------------------------
DROP TABLE IF EXISTS `yx_material`;
CREATE TABLE `yx_material` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'PK',
  `del_flag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '逻辑删除标记(0：显示；1：隐藏)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者ID',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '类型1、图片；2、视频',
  `group_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分组ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '素材名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '素材链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='素材库';

-- ----------------------------
-- Records of yx_material
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_material_copy1`
-- ----------------------------
DROP TABLE IF EXISTS `yx_material_copy1`;
CREATE TABLE `yx_material_copy1` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'PK',
  `del_flag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '逻辑删除标记(0：显示；1：隐藏)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者ID',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '类型1、图片；2、视频',
  `group_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分组ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '素材名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '素材链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='素材库';

-- ----------------------------
-- Records of yx_material_copy1
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_material_group`
-- ----------------------------
DROP TABLE IF EXISTS `yx_material_group`;
CREATE TABLE `yx_material_group` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'PK',
  `del_flag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '逻辑删除标记(0：显示；1：隐藏)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '素材名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='素材库';

-- ----------------------------
-- Records of yx_material_group
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_product_template`
-- ----------------------------
DROP TABLE IF EXISTS `yx_product_template`;
CREATE TABLE `yx_product_template` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `type` tinyint(1) DEFAULT NULL COMMENT '模板分类',
  `image_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `product_id` mediumint(9) DEFAULT NULL COMMENT '商品ID',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '状态（0：未上架，1：上架）',
  `sort_no` int(11) DEFAULT NULL COMMENT '排序编号',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  `is_del` tinyint(3) unsigned DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='促销模板管理';

-- ----------------------------
-- Records of yx_product_template
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_product_template_item`
-- ----------------------------
DROP TABLE IF EXISTS `yx_product_template_item`;
CREATE TABLE `yx_product_template_item` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `template_id` mediumint(9) DEFAULT NULL COMMENT '模板ID',
  `product_id` mediumint(9) DEFAULT NULL COMMENT '商品ID',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序编号',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  `rank_flag` int(11) DEFAULT '0' COMMENT '是否参与排名  0否  1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='促销模板管理';

-- ----------------------------
-- Records of yx_product_template_item
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_routine_access_token`
-- ----------------------------
DROP TABLE IF EXISTS `yx_routine_access_token`;
CREATE TABLE `yx_routine_access_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '小程序access_token表ID',
  `access_token` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'openid',
  `stop_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='小程序access_token表';

-- ----------------------------
-- Records of yx_routine_access_token
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_routine_form_id`
-- ----------------------------
DROP TABLE IF EXISTS `yx_routine_form_id`;
CREATE TABLE `yx_routine_form_id` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表单ID表ID',
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `form_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单ID',
  `stop_time` int(10) unsigned DEFAULT NULL COMMENT '表单ID失效时间',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '状态1 未使用 2不能使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='表单id表记录表';

-- ----------------------------
-- Records of yx_routine_form_id
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_routine_qrcode`
-- ----------------------------
DROP TABLE IF EXISTS `yx_routine_qrcode`;
CREATE TABLE `yx_routine_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信二维码ID',
  `third_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码类型 spread(用户推广) product_spread(产品推广)',
  `third_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态 0不可用 1可用',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '添加时间',
  `page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小程序页面路径带参数',
  `qrcode_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小程序二维码路径',
  `url_time` int(10) unsigned DEFAULT NULL COMMENT '二维码添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='小程序二维码管理表';

-- ----------------------------
-- Records of yx_routine_qrcode
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_routine_template`
-- ----------------------------
DROP TABLE IF EXISTS `yx_routine_template`;
CREATE TABLE `yx_routine_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板编号',
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `tempid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tempkey` (`tempkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信模板';

-- ----------------------------
-- Records of yx_routine_template
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_shipping_templates`
-- ----------------------------
DROP TABLE IF EXISTS `yx_shipping_templates`;
CREATE TABLE `yx_shipping_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板名称',
  `type` tinyint(1) DEFAULT NULL COMMENT '计费方式',
  `region_info` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '地域以及费用',
  `appoint` tinyint(1) DEFAULT NULL COMMENT '指定包邮开关',
  `appoint_info` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '指定包邮内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `is_del` tinyint(1) DEFAULT '0',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='运费模板表';

-- ----------------------------
-- Records of yx_shipping_templates
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_shipping_templates_free`
-- ----------------------------
DROP TABLE IF EXISTS `yx_shipping_templates_free`;
CREATE TABLE `yx_shipping_templates_free` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `temp_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板ID',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市ID',
  `number` decimal(10,2) NOT NULL COMMENT '包邮件数',
  `price` decimal(10,2) NOT NULL COMMENT '包邮金额',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '计费方式',
  `uniqid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组唯一值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yx_shipping_templates_free
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_shipping_templates_region`
-- ----------------------------
DROP TABLE IF EXISTS `yx_shipping_templates_region`;
CREATE TABLE `yx_shipping_templates_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `temp_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板ID',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市ID',
  `first` decimal(10,2) NOT NULL COMMENT '首件',
  `first_price` decimal(10,2) NOT NULL COMMENT '首件运费',
  `continues` decimal(10,2) NOT NULL COMMENT '续件',
  `continue_price` decimal(10,2) NOT NULL COMMENT '续件运费',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '计费方式',
  `uniqid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组唯一值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yx_shipping_templates_region
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_bargain`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_bargain`;
CREATE TABLE `yx_store_bargain` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '砍价产品ID',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '关联产品ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价活动名称',
  `image` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价活动图片',
  `unit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位名称',
  `stock` int(10) unsigned DEFAULT NULL COMMENT '库存',
  `sales` int(10) unsigned DEFAULT NULL COMMENT '销量',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价产品轮播图',
  `start_time` int(11) DEFAULT NULL COMMENT '砍价开启时间',
  `stop_time` int(11) DEFAULT NULL COMMENT '砍价结束时间',
  `store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '砍价产品名称',
  `price` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍价金额',
  `min_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍价商品最低价',
  `num` int(10) unsigned DEFAULT NULL COMMENT '每次购买的砍价产品数量',
  `bargain_max_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '用户每次砍价的最大金额',
  `bargain_min_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '用户每次砍价的最小金额',
  `bargain_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '用户每次砍价的次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '砍价状态 0(到砍价时间不自动开启)  1(到砍价时间自动开启时间)',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '砍价详情',
  `give_integral` decimal(10,2) unsigned NOT NULL COMMENT '反多少积分',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '砍价活动简介',
  `cost` decimal(8,2) unsigned DEFAULT NULL COMMENT '成本价',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐0不推荐1推荐',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 0未删除 1删除',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `is_postage` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否包邮 0不包邮 1包邮',
  `postage` decimal(10,2) unsigned DEFAULT NULL COMMENT '邮费',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '砍价规则',
  `look` int(10) unsigned DEFAULT '0' COMMENT '砍价产品浏览量',
  `share` int(10) unsigned DEFAULT '0' COMMENT '砍价产品分享量',
  `start_time_date` datetime DEFAULT NULL COMMENT '领取时间不能为空',
  `end_time_date` datetime DEFAULT NULL COMMENT '结束时间不能为空',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='砍价表';

-- ----------------------------
-- Records of yx_store_bargain
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_bargain_user`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_bargain_user`;
CREATE TABLE `yx_store_bargain_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户参与砍价表ID',
  `uid` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `bargain_id` bigint(20) unsigned DEFAULT NULL COMMENT '砍价产品id',
  `bargain_price_min` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍价的最低价',
  `bargain_price` decimal(8,2) DEFAULT NULL COMMENT '砍价金额',
  `price` decimal(8,2) unsigned DEFAULT NULL COMMENT '砍掉的价格',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1参与中 2 活动结束参与失败 3活动结束参与成功',
  `add_time` int(11) DEFAULT NULL COMMENT '参与时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否取消',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户参与砍价表';

-- ----------------------------
-- Records of yx_store_bargain_user
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_bargain_user_help`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_bargain_user_help`;
CREATE TABLE `yx_store_bargain_user_help` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '砍价用户帮助表ID',
  `uid` bigint(20) unsigned DEFAULT NULL COMMENT '帮助的用户id',
  `bargain_id` bigint(20) unsigned DEFAULT NULL COMMENT '砍价产品ID',
  `bargain_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户参与砍价表id',
  `price` decimal(8,2) unsigned DEFAULT NULL COMMENT '帮助砍价多少金额',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='砍价用户帮助表';

-- ----------------------------
-- Records of yx_store_bargain_user_help
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_cart`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_cart`;
CREATE TABLE `yx_store_cart` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表ID',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `product_attr_unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品属性',
  `cart_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = 未购买 1 = 已购买',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为立即购买',
  `combination_id` int(10) unsigned DEFAULT '0' COMMENT '拼团id',
  `seckill_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀产品ID',
  `bargain_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '砍价id',
  `packaging` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品包装规格',
  `pack_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品包装规格数量',
  `alter_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`uid`) USING BTREE,
  KEY `goods_id` (`product_id`) USING BTREE,
  KEY `uid` (`uid`,`is_pay`) USING BTREE,
  KEY `uid_2` (`uid`,`is_del`) USING BTREE,
  KEY `uid_3` (`uid`,`is_new`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=626 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表';

-- ----------------------------
-- Records of yx_store_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_category`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_category`;
CREATE TABLE `yx_store_category` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID',
  `pid` mediumint(9) NOT NULL COMMENT '父id',
  `cate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `sort` mediumint(9) DEFAULT NULL COMMENT '排序',
  `pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否推荐',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `is_del` tinyint(3) unsigned DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_base` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品分类表';

-- ----------------------------
-- Records of yx_store_category
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_combination`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_combination`;
CREATE TABLE `yx_store_combination` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品id',
  `mer_id` int(10) unsigned DEFAULT '0' COMMENT '商户id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐图',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `attr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动属性',
  `people` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '参团人数',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '价格',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `stock` int(10) unsigned NOT NULL COMMENT '库存',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `is_host` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '推荐',
  `is_show` tinyint(3) unsigned NOT NULL COMMENT '产品状态',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `combination` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `mer_use` tinyint(3) unsigned DEFAULT NULL COMMENT '商户是否可用1可用0不可用',
  `is_postage` tinyint(3) unsigned NOT NULL COMMENT '是否包邮1是0否',
  `postage` decimal(10,2) unsigned NOT NULL COMMENT '邮费',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼团内容',
  `start_time` int(11) DEFAULT NULL COMMENT '拼团开始时间',
  `stop_time` int(11) DEFAULT NULL COMMENT '团结束时间',
  `effective_time` int(11) NOT NULL DEFAULT '0' COMMENT '拼团订单有效时间',
  `cost` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拼图产品成本',
  `browse` int(11) DEFAULT '0' COMMENT '浏览量',
  `start_time_date` datetime DEFAULT NULL COMMENT '领取时间不能为空',
  `end_time_date` datetime DEFAULT NULL COMMENT '结束时间不能为空',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单位名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='拼团产品表';

-- ----------------------------
-- Records of yx_store_combination
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_combination_attr`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_combination_attr`;
CREATE TABLE `yx_store_combination_attr` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  KEY `store_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品属性表';

-- ----------------------------
-- Records of yx_store_combination_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_combination_attr_result`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_combination_attr_result`;
CREATE TABLE `yx_store_combination_attr_result` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) unsigned NOT NULL COMMENT '上次修改时间',
  UNIQUE KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品属性详情表';

-- ----------------------------
-- Records of yx_store_combination_attr_result
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_combination_attr_value`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_combination_attr_value`;
CREATE TABLE `yx_store_combination_attr_value` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) unsigned NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `unique` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  UNIQUE KEY `unique` (`unique`,`suk`) USING BTREE,
  KEY `store_id` (`product_id`,`suk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品属性值表';

-- ----------------------------
-- Records of yx_store_combination_attr_value
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_coupon`;
CREATE TABLE `yx_store_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券表ID',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '兑换消耗积分值',
  `coupon_price` decimal(8,2) unsigned NOT NULL COMMENT '兑换的优惠券面值',
  `use_min_price` decimal(8,2) unsigned NOT NULL COMMENT '最低消费多少金额可用优惠券',
  `coupon_time` int(10) unsigned DEFAULT '0' COMMENT '优惠券有效期限（单位：天）',
  `sort` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0：关闭，1：开启）',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券类型 0-通用 1-商品券',
  `add_time` int(11) NOT NULL COMMENT '兑换项目添加时间',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `start_time` int(11) DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '优惠券描述',
  `time_type` tinyint(1) DEFAULT '0' COMMENT '时间类型  0固定有效期  1静态有效期',
  `time_num` int(11) DEFAULT '0' COMMENT '领取之后多少天有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `state` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `coupon_time` (`coupon_time`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券表';

-- ----------------------------
-- Records of yx_store_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_coupon_issue`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_coupon_issue`;
CREATE TABLE `yx_store_coupon_issue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `cid` int(11) DEFAULT NULL COMMENT '优惠券ID',
  `start_time` int(11) DEFAULT NULL COMMENT '优惠券领取开启时间',
  `end_time` int(11) DEFAULT NULL COMMENT '优惠券领取结束时间',
  `total_count` int(10) unsigned zerofill DEFAULT '0000000000' COMMENT '优惠券领取数量',
  `remain_count` int(11) DEFAULT NULL COMMENT '优惠券剩余领取数量',
  `is_permanent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否无限张数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 正常 0 未开启 -1 已无效',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT NULL COMMENT '优惠券添加时间',
  `start_time_date` datetime DEFAULT NULL COMMENT '领取时间不能为空',
  `end_time_date` datetime DEFAULT NULL COMMENT '结束时间不能为空',
  `type` tinyint(4) DEFAULT '0' COMMENT '0自己领1系统分配',
  `category_id` int(11) DEFAULT NULL COMMENT '商品分类ID',
  `category_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品分类描述',
  `time_type` tinyint(1) DEFAULT '0' COMMENT '时间类型  0固定有效期  1静态有效期',
  `time_num` int(11) DEFAULT '0' COMMENT '领取之后多少天有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `start_time` (`start_time`,`end_time`) USING BTREE,
  KEY `remain_count` (`remain_count`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券前台领取表';

-- ----------------------------
-- Records of yx_store_coupon_issue
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_coupon_issue_user`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_coupon_issue_user`;
CREATE TABLE `yx_store_coupon_issue_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '领取优惠券用户ID',
  `issue_coupon_id` int(11) DEFAULT NULL COMMENT '优惠券前台领取ID',
  `add_time` int(11) DEFAULT NULL COMMENT '领取时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`issue_coupon_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券前台用户领取记录表';

-- ----------------------------
-- Records of yx_store_coupon_issue_user
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_coupon_user`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_coupon_user`;
CREATE TABLE `yx_store_coupon_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '优惠券发放记录id',
  `cid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '兑换的项目id',
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券所属用户',
  `coupon_title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `coupon_price` decimal(8,2) unsigned NOT NULL COMMENT '优惠券的面值',
  `use_min_price` decimal(8,2) unsigned NOT NULL COMMENT '最低消费多少金额可用优惠券',
  `add_time` int(11) NOT NULL COMMENT '优惠券创建时间',
  `end_time` int(11) DEFAULT NULL COMMENT '优惠券结束时间',
  `use_time` int(11) DEFAULT NULL COMMENT '使用时间',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'send' COMMENT '获取方式',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：未使用，1：已使用, 2:已过期）',
  `is_fail` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有效',
  `category_id` int(11) DEFAULT NULL COMMENT '商品分类ID',
  `category_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品分类描述',
  `time_type` tinyint(1) DEFAULT '0' COMMENT '时间类型  0固定有效期  1静态有效期',
  `time_num` int(11) DEFAULT '0' COMMENT '领取之后多少天有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `end_time` (`end_time`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_fail` (`is_fail`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券发放记录表';

-- ----------------------------
-- Records of yx_store_coupon_user
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_discount`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_discount`;
CREATE TABLE `yx_store_discount` (
  `id` int(10) unsigned NOT NULL COMMENT '商品折扣率id',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `stop_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `discount` decimal(8,2) NOT NULL COMMENT '享受折扣',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动标题',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简介',
  `sort` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `add_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '产品状态',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除 0未删除1已删除',
  `json_str` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '添加会员级别',
  `end_time_date` datetime NOT NULL,
  `start_time_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `start_time` (`start_time`,`stop_time`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品秒杀产品表';

-- ----------------------------
-- Records of yx_store_discount
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_order`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_order`;
CREATE TABLE `yx_store_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `extend_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '额外订单号',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `user_phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `cart_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]' COMMENT '购物车id',
  `freight_price` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '运费金额',
  `total_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单商品总数',
  `total_price` decimal(8,2) unsigned NOT NULL COMMENT '订单总价',
  `total_postage` decimal(8,2) unsigned NOT NULL COMMENT '邮费',
  `pay_price` decimal(8,2) unsigned NOT NULL COMMENT '实际支付金额',
  `pay_postage` decimal(8,2) unsigned NOT NULL COMMENT '支付邮费',
  `deduction_price` decimal(8,2) unsigned NOT NULL COMMENT '抵扣金额',
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `coupon_price` decimal(8,2) unsigned NOT NULL COMMENT '优惠券金额',
  `paid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_time` int(10) unsigned DEFAULT NULL COMMENT '支付时间',
  `pay_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式',
  `add_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态（-1 : 申请退款 -2 : 退货成功 0：待发货；1：待收货；2：已收货；3：待评价；-1：已退款）',
  `refund_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 未退款 1 申请中 2 已退款',
  `refund_reason_wap_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退款图片',
  `refund_reason_wap_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退款用户说明',
  `refund_reason_time` int(10) unsigned DEFAULT NULL COMMENT '退款时间',
  `refund_reason_wap` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前台退款原因',
  `refund_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '不退款的理由',
  `refund_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `delivery_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '快递公司编号',
  `delivery_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '快递名称/送货人姓名',
  `delivery_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发货类型',
  `delivery_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '快递单号/手机号',
  `gain_integral` decimal(8,2) unsigned NOT NULL COMMENT '消费赚取积分',
  `use_integral` decimal(8,2) unsigned NOT NULL COMMENT '使用积分',
  `back_integral` decimal(8,2) unsigned DEFAULT NULL COMMENT '给用户退了多少积分',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id(md5加密)类似id',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员备注',
  `mer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商户ID',
  `is_mer_check` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `combination_id` int(10) unsigned DEFAULT '0' COMMENT '拼团产品id0一般产品',
  `pink_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拼团id 0没有拼团',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  `seckill_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀产品ID',
  `bargain_id` int(10) unsigned DEFAULT '0' COMMENT '砍价id',
  `verify_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '核销码',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `shipping_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配送方式 1=快递 ，2=门店自提',
  `is_channel` tinyint(3) unsigned DEFAULT '0' COMMENT '支付渠道(0微信公众号1微信小程序)',
  `is_remind` tinyint(3) unsigned DEFAULT '0',
  `is_system_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id_2` (`order_id`,`uid`) USING BTREE,
  UNIQUE KEY `unique` (`unique`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `pay_price` (`pay_price`) USING BTREE,
  KEY `paid` (`paid`) USING BTREE,
  KEY `pay_time` (`pay_time`) USING BTREE,
  KEY `pay_type` (`pay_type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `coupon_id` (`coupon_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of yx_store_order
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_order_0418`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_order_0418`;
CREATE TABLE `yx_store_order_0418` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `extend_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '额外订单号',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `user_phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `cart_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]' COMMENT '购物车id',
  `freight_price` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '运费金额',
  `total_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单商品总数',
  `total_price` decimal(8,2) unsigned NOT NULL COMMENT '订单总价',
  `total_postage` decimal(8,2) unsigned NOT NULL COMMENT '邮费',
  `pay_price` decimal(8,2) unsigned NOT NULL COMMENT '实际支付金额',
  `pay_postage` decimal(8,2) unsigned NOT NULL COMMENT '支付邮费',
  `deduction_price` decimal(8,2) unsigned NOT NULL COMMENT '抵扣金额',
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `coupon_price` decimal(8,2) unsigned NOT NULL COMMENT '优惠券金额',
  `paid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_time` int(10) unsigned DEFAULT NULL COMMENT '支付时间',
  `pay_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式',
  `add_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态（-1 : 申请退款 -2 : 退货成功 0：待发货；1：待收货；2：已收货；3：待评价；-1：已退款）',
  `refund_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 未退款 1 申请中 2 已退款',
  `refund_reason_wap_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退款图片',
  `refund_reason_wap_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退款用户说明',
  `refund_reason_time` int(10) unsigned DEFAULT NULL COMMENT '退款时间',
  `refund_reason_wap` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前台退款原因',
  `refund_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '不退款的理由',
  `refund_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `delivery_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '快递公司编号',
  `delivery_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '快递名称/送货人姓名',
  `delivery_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发货类型',
  `delivery_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '快递单号/手机号',
  `gain_integral` decimal(8,2) unsigned NOT NULL COMMENT '消费赚取积分',
  `use_integral` decimal(8,2) unsigned NOT NULL COMMENT '使用积分',
  `back_integral` decimal(8,2) unsigned DEFAULT NULL COMMENT '给用户退了多少积分',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id(md5加密)类似id',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员备注',
  `mer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商户ID',
  `is_mer_check` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `combination_id` int(10) unsigned DEFAULT '0' COMMENT '拼团产品id0一般产品',
  `pink_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拼团id 0没有拼团',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  `seckill_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀产品ID',
  `bargain_id` int(10) unsigned DEFAULT '0' COMMENT '砍价id',
  `verify_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '核销码',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `shipping_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配送方式 1=快递 ，2=门店自提',
  `is_channel` tinyint(3) unsigned DEFAULT '0' COMMENT '支付渠道(0微信公众号1微信小程序)',
  `is_remind` tinyint(3) unsigned DEFAULT '0',
  `is_system_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id_2` (`order_id`,`uid`) USING BTREE,
  UNIQUE KEY `unique` (`unique`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `pay_price` (`pay_price`) USING BTREE,
  KEY `paid` (`paid`) USING BTREE,
  KEY `pay_time` (`pay_time`) USING BTREE,
  KEY `pay_type` (`pay_type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `coupon_id` (`coupon_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of yx_store_order_0418
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_order_cart_info`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_order_cart_info`;
CREATE TABLE `yx_store_order_cart_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` int(10) unsigned NOT NULL COMMENT '订单id',
  `cart_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购物车id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `cart_info` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买东西的详细信息',
  `unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `oid` (`oid`,`unique`) USING BTREE,
  KEY `cart_id` (`cart_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单购物详情表';

-- ----------------------------
-- Records of yx_store_order_cart_info
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_order_status`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_order_status`;
CREATE TABLE `yx_store_order_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `oid` bigint(20) unsigned NOT NULL COMMENT '订单id',
  `change_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `change_message` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作备注',
  `change_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `oid` (`oid`) USING BTREE,
  KEY `change_type` (`change_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单操作记录表';

-- ----------------------------
-- Records of yx_store_order_status
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_pink`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_pink`;
CREATE TABLE `yx_store_pink` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id 生成',
  `order_id_key` int(10) unsigned NOT NULL COMMENT '订单id  数据库',
  `total_num` int(10) unsigned NOT NULL COMMENT '购买商品个数',
  `total_price` decimal(10,2) unsigned NOT NULL COMMENT '购买总金额',
  `cid` bigint(20) unsigned NOT NULL COMMENT '拼团产品id',
  `pid` bigint(20) unsigned NOT NULL COMMENT '产品id',
  `people` int(10) unsigned NOT NULL COMMENT '拼图总人数',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '拼团产品单价',
  `add_time` int(11) NOT NULL COMMENT '开始时间',
  `stop_time` int(11) DEFAULT NULL,
  `k_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '团长id 0为团长',
  `is_tpl` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否发送模板消息0未发送1已发送',
  `is_refund` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否退款 0未退款 1已退款',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态1进行中2已完成3未完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='拼团表';

-- ----------------------------
-- Records of yx_store_pink
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_product`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product`;
CREATE TABLE `yx_store_product` (
  `id` mediumint(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `mer_id` int(10) unsigned DEFAULT '0' COMMENT '商户Id(0为总后台管理员创建,不为0的时候是商户后台创建)',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `video` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频',
  `haibao_image` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '海报图片',
  `slider_image` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `store_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `store_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `keyword` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `bar_code` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '产品条码（一维码）',
  `cate_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '商品价格',
  `vip_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '会员价格',
  `ot_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '市场价',
  `postage` decimal(8,2) unsigned DEFAULT NULL COMMENT '邮费',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位名',
  `packaging` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '包装（盒/件）',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `sales` mediumint(8) unsigned DEFAULT '0' COMMENT '销量',
  `stock` mediumint(8) unsigned DEFAULT '0' COMMENT '库存',
  `is_show` tinyint(1) DEFAULT '0' COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热卖',
  `is_benefit` tinyint(1) DEFAULT '0' COMMENT '是否优惠',
  `is_best` tinyint(1) DEFAULT '0' COMMENT '是否精品',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新品',
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '产品描述',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  `is_postage` tinyint(3) unsigned DEFAULT '0' COMMENT '是否包邮',
  `is_del` tinyint(3) unsigned DEFAULT '0' COMMENT '是否删除',
  `mer_use` tinyint(3) unsigned DEFAULT '0' COMMENT '商户是否代理 0不可代理1可代理',
  `give_integral` decimal(8,2) unsigned DEFAULT NULL COMMENT '获得积分',
  `cost` decimal(8,2) unsigned DEFAULT NULL COMMENT '成本价',
  `is_seckill` tinyint(3) unsigned DEFAULT '0' COMMENT '秒杀状态 0 未开启 1已开启',
  `is_bargain` tinyint(3) unsigned DEFAULT NULL COMMENT '砍价状态 0未开启 1开启',
  `is_good` tinyint(1) DEFAULT '0' COMMENT '是否优品推荐',
  `ficti` mediumint(9) DEFAULT '100' COMMENT '虚拟销量',
  `browse` int(11) DEFAULT '0' COMMENT '浏览量',
  `code_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品二维码地址(用户小程序海报)',
  `soure_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '淘宝京东1688类型',
  `qrcode_image` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品二维码图片',
  `is_rank` tinyint(1) DEFAULT '0' COMMENT '是否展示排名',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_hot` (`is_hot`) USING BTREE,
  KEY `is_benefit` (`is_benefit`) USING BTREE,
  KEY `is_best` (`is_best`) USING BTREE,
  KEY `is_new` (`is_new`) USING BTREE,
  KEY `toggle_on_sale, is_del` (`is_del`) USING BTREE,
  KEY `price` (`price`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `sales` (`sales`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `is_postage` (`is_postage`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=349421 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of yx_store_product
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_product_attr`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_attr`;
CREATE TABLE `yx_store_product_attr` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=837 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品属性表';

-- ----------------------------
-- Records of yx_store_product_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_product_attr_result`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_attr_result`;
CREATE TABLE `yx_store_product_attr_result` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品属性详情表';

-- ----------------------------
-- Records of yx_store_product_attr_result
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_product_attr_value`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_attr_value`;
CREATE TABLE `yx_store_product_attr_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) unsigned NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) unsigned DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `unique` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  `bar_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编码',
  `packaging` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '包装规格',
  `wholesale` decimal(8,2) unsigned NOT NULL COMMENT '批发价格',
  `ot_price` decimal(8,2) DEFAULT NULL COMMENT '原价',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`unique`,`suk`) USING BTREE,
  KEY `store_id` (`product_id`,`suk`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4728 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品属性值表';

-- ----------------------------
-- Records of yx_store_product_attr_value
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_product_cate`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_cate`;
CREATE TABLE `yx_store_product_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品id',
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品分类辅助表';

-- ----------------------------
-- Records of yx_store_product_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_product_relation`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_relation`;
CREATE TABLE `yx_store_product_relation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型(收藏(collect）、点赞(like))',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '某种类型的商品(普通商品、秒杀商品)',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`product_id`,`type`,`category`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `category` (`category`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品点赞和收藏表';

-- ----------------------------
-- Records of yx_store_product_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_product_reply`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_reply`;
CREATE TABLE `yx_store_product_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `oid` int(11) NOT NULL COMMENT '订单ID',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `reply_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品）',
  `product_score` tinyint(1) NOT NULL COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL COMMENT '服务分数',
  `comment` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `pics` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论图片',
  `add_time` int(11) NOT NULL COMMENT '评论时间',
  `merchant_reply_content` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员回复内容',
  `merchant_reply_time` int(11) DEFAULT NULL COMMENT '管理员回复时间',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未回复1已回复',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id_2` (`oid`,`unique`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `parent_id` (`reply_type`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `product_score` (`product_score`) USING BTREE,
  KEY `service_score` (`service_score`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论表';

-- ----------------------------
-- Records of yx_store_product_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_product_rule`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_rule`;
CREATE TABLE `yx_store_product_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格名称',
  `rule_value` json NOT NULL COMMENT '规格值',
  `create_time` datetime DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品规则值(规格)表';

-- ----------------------------
-- Records of yx_store_product_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_seckill`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_seckill`;
CREATE TABLE `yx_store_seckill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐图',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '价格',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本',
  `ot_price` decimal(10,2) unsigned NOT NULL COMMENT '原价',
  `give_integral` decimal(10,2) unsigned NOT NULL COMMENT '返多少积分',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `stock` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `unit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名',
  `postage` decimal(8,2) unsigned NOT NULL COMMENT '邮费',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `stop_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '产品状态',
  `is_postage` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '热门推荐',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除 0未删除1已删除',
  `num` int(10) unsigned NOT NULL COMMENT '最多秒杀几个',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '显示',
  `time_id` int(10) unsigned DEFAULT '0' COMMENT '时间段id',
  `start_time_date` datetime DEFAULT NULL COMMENT '领取时间不能为空',
  `end_time_date` datetime DEFAULT NULL COMMENT '结束时间不能为空',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `start_time` (`start_time`,`stop_time`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `is_hot` (`is_hot`) USING BTREE,
  KEY `is_show` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `is_postage` (`is_postage`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品秒杀产品表';

-- ----------------------------
-- Records of yx_store_seckill
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_seckill_attr`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_seckill_attr`;
CREATE TABLE `yx_store_seckill_attr` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  KEY `store_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='秒杀商品属性表';

-- ----------------------------
-- Records of yx_store_seckill_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_seckill_attr_result`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_seckill_attr_result`;
CREATE TABLE `yx_store_seckill_attr_result` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) unsigned NOT NULL COMMENT '上次修改时间',
  UNIQUE KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='秒杀商品属性详情表';

-- ----------------------------
-- Records of yx_store_seckill_attr_result
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_seckill_attr_value`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_seckill_attr_value`;
CREATE TABLE `yx_store_seckill_attr_value` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) unsigned NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `unique` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  UNIQUE KEY `unique` (`unique`,`suk`) USING BTREE,
  KEY `store_id` (`product_id`,`suk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='秒杀商品属性值表';

-- ----------------------------
-- Records of yx_store_seckill_attr_value
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_service`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_service`;
CREATE TABLE `yx_store_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服id',
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `uid` int(11) NOT NULL COMMENT '客服uid',
  `avatar` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客服头像',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理名称',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0隐藏1显示',
  `notify` int(11) DEFAULT '0' COMMENT '订单通知1开启0关闭',
  `customer` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否展示统计管理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客服表';

-- ----------------------------
-- Records of yx_store_service
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_service_log`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_service_log`;
CREATE TABLE `yx_store_service_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服用户对话记录表ID',
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `msn` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `uid` int(11) NOT NULL COMMENT '发送人uid',
  `to_uid` int(11) NOT NULL COMMENT '接收人uid',
  `add_time` int(11) NOT NULL COMMENT '发送时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读（0：否；1：是；）',
  `remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提醒过',
  `msn_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '消息类型 1=文字 2=表情 3=图片 4=语音',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客服用户对话记录表';

-- ----------------------------
-- Records of yx_store_service_log
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_store_visit`
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_visit`;
CREATE TABLE `yx_store_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `product_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品类型',
  `cate_id` int(11) DEFAULT NULL COMMENT '产品分类ID',
  `type` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品类型',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `count` int(11) DEFAULT NULL COMMENT '访问次数',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注描述',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品浏览分析表';

-- ----------------------------
-- Records of yx_store_visit
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_system_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_attachment`;
CREATE TABLE `yx_system_attachment` (
  `att_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件名称',
  `att_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件路径',
  `satt_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '压缩图片路径',
  `att_size` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件大小',
  `att_type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件类型',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID0编辑器,1产品图片,2拼团图片,3砍价图片,4秒杀图片,5文章图片,6组合数据图',
  `image_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '图片上传类型 1本地 2七牛云 3OSS 4COS ',
  `module_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '图片上传模块类型 1 后台上传 2 用户生成',
  `uid` bigint(20) unsigned DEFAULT '0' COMMENT '用户id',
  `invite_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '邀请码',
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`att_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1585 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件管理表';

-- ----------------------------
-- Records of yx_system_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_system_attachment_category`
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_attachment_category`;
CREATE TABLE `yx_system_attachment_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父级ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `enname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类目录',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件分类表';

-- ----------------------------
-- Records of yx_system_attachment_category
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_system_city`
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_city`;
CREATE TABLE `yx_system_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '省市级别',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `area_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `merger_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '合并名称',
  `lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '纬度',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否展示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='城市表';

-- ----------------------------
-- Records of yx_system_city
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_config`;
CREATE TABLE `yx_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `value` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '默认值',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置表';

-- ----------------------------
-- Records of yx_system_config
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_system_group`
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_group`;
CREATE TABLE `yx_system_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据组名称',
  `info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据提示',
  `config_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据字段',
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '数据组字段以及类型（json数据）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `config_name` (`config_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组合数据表';

-- ----------------------------
-- Records of yx_system_group
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_system_group_data`
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_group_data`;
CREATE TABLE `yx_system_group_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据详情ID',
  `group_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '对应的数据名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据组对应的数据值（json数据）',
  `add_time` int(11) DEFAULT NULL COMMENT '添加数据时间',
  `sort` int(11) DEFAULT '0' COMMENT '数据排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1：开启；2：关闭；）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组合数据详情表';

-- ----------------------------
-- Records of yx_system_group_data
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_system_store`
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_store`;
CREATE TABLE `yx_system_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店名称',
  `introduction` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `phone` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省市区',
  `detailed_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店logo',
  `latitude` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '纬度',
  `longitude` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经度',
  `valid_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '核销有效日期',
  `day_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '每日营业开关时间',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `day_time_end` datetime DEFAULT NULL,
  `day_time_start` datetime DEFAULT NULL,
  `valid_time_end` datetime DEFAULT NULL,
  `valid_time_start` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店自提';

-- ----------------------------
-- Records of yx_system_store
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_system_store_staff`
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_store_staff`;
CREATE TABLE `yx_system_store_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL COMMENT '微信用户id',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店员头像',
  `store_id` int(11) NOT NULL COMMENT '门店id',
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `staff_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '店员名称',
  `phone` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `verify_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '核销开关',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `spread_uid` bigint(20) unsigned NOT NULL COMMENT '微信用户id',
  `spread_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spread_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店员头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店店员表';

-- ----------------------------
-- Records of yx_system_store_staff
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_system_user_level`
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_user_level`;
CREATE TABLE `yx_system_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员名称',
  `money` decimal(8,2) NOT NULL COMMENT '购买金额',
  `valid_date` int(11) NOT NULL DEFAULT '0' COMMENT '有效时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为永久会员',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否购买,1=购买,0=不购买',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 1=显示,0=隐藏',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `discount` decimal(8,2) NOT NULL COMMENT '享受折扣',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员卡背景',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员图标',
  `explain` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '说明',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除.1=删除,0=未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='设置用户等级表';

-- ----------------------------
-- Records of yx_system_user_level
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_system_user_task`
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_user_task`;
CREATE TABLE `yx_system_user_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置原名',
  `task_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务类型',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '限定数',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '等级id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `is_must` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否务必达成任务,1务必达成,0=满足其一',
  `illustrate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务说明',
  `add_time` int(11) NOT NULL COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='等级任务设置';

-- ----------------------------
-- Records of yx_system_user_task
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user`;
CREATE TABLE `yx_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户账户(跟accout一样)',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户密码（跟pwd）',
  `pwd` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `real_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '真实姓名',
  `birthday` int(11) DEFAULT '0' COMMENT '生日',
  `card_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '身份证号码',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户备注',
  `partner_id` int(11) DEFAULT '0' COMMENT '合伙人id',
  `group_id` int(11) DEFAULT '0' COMMENT '用户分组id',
  `nickname` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户头像',
  `phone` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `add_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '添加ip',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '最后一次登录ip',
  `now_money` decimal(8,2) unsigned NOT NULL COMMENT '用户余额',
  `brokerage_price` decimal(8,2) NOT NULL COMMENT '佣金金额',
  `integral` decimal(8,2) unsigned NOT NULL COMMENT '用户剩余积分',
  `sign_num` int(11) NOT NULL DEFAULT '0' COMMENT '连续签到天数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为正常，0为禁止',
  `level` tinyint(2) unsigned zerofill DEFAULT '00' COMMENT '等级',
  `spread_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推广元id',
  `spread_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推广员关联时间',
  `user_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户类型',
  `is_promoter` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为推广员',
  `pay_count` int(10) unsigned DEFAULT '0' COMMENT '用户购买次数',
  `spread_count` int(11) DEFAULT '0' COMMENT '下级人数',
  `clean_time` int(11) DEFAULT '0' COMMENT '清理会员时间',
  `addres` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `adminid` int(10) unsigned DEFAULT '0' COMMENT '管理员编号 ',
  `login_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登陆类型，h5,wechat,routine',
  `apply_level` tinyint(3) unsigned DEFAULT NULL COMMENT '用户申请会员等级',
  `cert_info` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '用户申请会员等级申请材料',
  `is_check` tinyint(3) unsigned DEFAULT NULL COMMENT '会员等级是否审核',
  `is_pass` tinyint(3) unsigned DEFAULT NULL COMMENT '会员等级是否审核通过',
  `weixin` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信',
  `qq` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'qq',
  `mail` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系电话',
  `dingding` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '钉钉号码',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `spreaduid` (`spread_uid`) USING BTREE,
  KEY `level` (`level`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_promoter` (`is_promoter`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=770 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of yx_user
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user_address`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_address`;
CREATE TABLE `yx_user_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户地址id',
  `uid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在省',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在市',
  `district` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在区',
  `detail` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `post_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮编',
  `longitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '纬度',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `is_default` (`is_default`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户地址表';

-- ----------------------------
-- Records of yx_user_address
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user_bill`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_bill`;
CREATE TABLE `yx_user_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户账单id',
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户uid',
  `link_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '关联id',
  `pm` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 = 支出 1 = 获得',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '账单标题',
  `category` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '明细种类',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '明细类型',
  `number` decimal(8,2) unsigned NOT NULL COMMENT '明细数字',
  `balance` decimal(8,2) unsigned NOT NULL COMMENT '剩余',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = 带确定 1 = 有效 -1 = 无效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `openid` (`uid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `pm` (`pm`) USING BTREE,
  KEY `type` (`category`,`type`,`link_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账单表';

-- ----------------------------
-- Records of yx_user_bill
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user_enter`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_enter`;
CREATE TABLE `yx_user_enter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商户申请ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户所在省',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户所在市',
  `district` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户所在区',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户详细地址',
  `merchant_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户名称',
  `link_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `link_tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户电话',
  `charter` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户证书',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `apply_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `success_time` int(11) NOT NULL COMMENT '通过时间',
  `fail_message` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '未通过原因',
  `fail_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '未通过时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 审核未通过 0未审核 1审核通过',
  `is_lock` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 = 开启 1= 关闭',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE,
  KEY `province` (`province`,`city`,`district`) USING BTREE,
  KEY `is_lock` (`is_lock`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商户申请表';

-- ----------------------------
-- Records of yx_user_enter
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user_extract`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_extract`;
CREATE TABLE `yx_user_extract` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned DEFAULT NULL,
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `extract_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'bank' COMMENT 'bank = 银行卡 alipay = 支付宝wx=微信',
  `bank_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '银行卡',
  `bank_address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '开户地址',
  `alipay_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '支付宝账号',
  `extract_price` decimal(8,2) unsigned DEFAULT NULL COMMENT '提现金额',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `balance` decimal(8,2) unsigned DEFAULT NULL,
  `fail_msg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '无效原因',
  `fail_time` datetime DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '-1 未通过 0 审核中 1 已提现',
  `wechat` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `extract_type` (`extract_type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `openid` (`uid`) USING BTREE,
  KEY `fail_time` (`fail_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户提现表';

-- ----------------------------
-- Records of yx_user_extract
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_group`;
CREATE TABLE `yx_user_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户分组名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户分组表';

-- ----------------------------
-- Records of yx_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user_level`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_level`;
CREATE TABLE `yx_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '等级vip',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `valid_time` int(11) NOT NULL DEFAULT '0' COMMENT '过期时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否永久',
  `mer_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:禁止,1:正常',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已通知',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除,0=未删除,1=删除',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `discount` int(11) NOT NULL DEFAULT '0' COMMENT '享受折扣',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=574 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户等级记录表';

-- ----------------------------
-- Records of yx_user_level
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user_notice`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_notice`;
CREATE TABLE `yx_user_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接收消息的用户id（类型：json数据）',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '消息通知类型（1：系统消息；2：用户通知）',
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发送人',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知消息的标题信息',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '通知消息的内容',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '通知消息发送的时间',
  `is_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发送（0：未发送；1：已发送）',
  `send_time` int(11) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户通知表';

-- ----------------------------
-- Records of yx_user_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user_notice_see`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_notice_see`;
CREATE TABLE `yx_user_notice_see` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT '查看的通知id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '查看通知的用户id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '查看通知的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户通知发送记录表';

-- ----------------------------
-- Records of yx_user_notice_see
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_recharge`;
CREATE TABLE `yx_user_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '充值用户UID',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `price` decimal(8,2) DEFAULT NULL COMMENT '充值金额',
  `give_price` decimal(8,2) DEFAULT NULL COMMENT '赠送金额',
  `recharge_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '充值类型',
  `paid` tinyint(1) DEFAULT NULL COMMENT '是否充值',
  `pay_time` int(11) DEFAULT NULL COMMENT '充值支付时间',
  `add_time` int(11) DEFAULT NULL COMMENT '充值时间',
  `refund_price` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `system_user_level_id` int(11) DEFAULT NULL COMMENT '等级ID',
  `type` int(11) DEFAULT NULL COMMENT '类型 1充值 2购买会员',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `recharge_type` (`recharge_type`) USING BTREE,
  KEY `paid` (`paid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户充值表';

-- ----------------------------
-- Records of yx_user_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user_sign`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_sign`;
CREATE TABLE `yx_user_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '签到说明',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '获得积分',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '剩余积分',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='签到记录表';

-- ----------------------------
-- Records of yx_user_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_user_task_finish`
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_task_finish`;
CREATE TABLE `yx_user_task_finish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户任务完成记录表';

-- ----------------------------
-- Records of yx_user_task_finish
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_video`
-- ----------------------------
DROP TABLE IF EXISTS `yx_video`;
CREATE TABLE `yx_video` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_id` mediumint(9) DEFAULT NULL COMMENT '类型ID',
  `type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型名称',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `cover_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频封面',
  `video_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频地址',
  `score_num` int(11) DEFAULT NULL COMMENT '奖励积分数量',
  `watch_num` int(11) DEFAULT NULL COMMENT '真实浏览量',
  `virtual_watch_num` int(11) DEFAULT NULL COMMENT '虚拟浏览量',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `show_flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Y' COMMENT '是否展示',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='美食厨房视频';

-- ----------------------------
-- Records of yx_video
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_video_product`
-- ----------------------------
DROP TABLE IF EXISTS `yx_video_product`;
CREATE TABLE `yx_video_product` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `video_id` mediumint(9) DEFAULT NULL COMMENT '视频ID',
  `product_id` mediumint(9) DEFAULT NULL COMMENT '商品ID',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序编号',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='视频与商品的关系';

-- ----------------------------
-- Records of yx_video_product
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_video_type`
-- ----------------------------
DROP TABLE IF EXISTS `yx_video_type`;
CREATE TABLE `yx_video_type` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `show_flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Y' COMMENT '是否展示',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='视频类型';

-- ----------------------------
-- Records of yx_video_type
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_wechat_media`
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_media`;
CREATE TABLE `yx_wechat_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信视频音频id',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复类型',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `media_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信服务器返回的id',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `temporary` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否永久或者临时 0永久1临时',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type` (`type`,`media_id`) USING BTREE,
  KEY `type_2` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信回复表';

-- ----------------------------
-- Records of yx_wechat_media
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_wechat_menu`
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_menu`;
CREATE TABLE `yx_wechat_menu` (
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '缓存数据',
  `add_time` int(11) DEFAULT NULL COMMENT '缓存时间',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信缓存表';

-- ----------------------------
-- Records of yx_wechat_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_wechat_message`
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_message`;
CREATE TABLE `yx_wechat_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户行为记录id',
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户openid',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作类型',
  `result` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作详细记录',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户行为记录表';

-- ----------------------------
-- Records of yx_wechat_message
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_wechat_news_category`
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_news_category`;
CREATE TABLE `yx_wechat_news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图文消息管理ID',
  `cate_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图文名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `new_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章id',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图文消息管理表';

-- ----------------------------
-- Records of yx_wechat_news_category
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_wechat_qrcode`
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_qrcode`;
CREATE TABLE `yx_wechat_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信二维码ID',
  `third_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '二维码类型',
  `third_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ticket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '二维码参数',
  `expire_seconds` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二维码有效时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信访问url',
  `qrcode_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信二维码url',
  `scan` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被扫的次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `third_type` (`third_type`,`third_id`) USING BTREE,
  KEY `ticket` (`ticket`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信二维码管理表';

-- ----------------------------
-- Records of yx_wechat_qrcode
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_wechat_reply`
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_reply`;
CREATE TABLE `yx_wechat_reply` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信关键字回复id',
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复类型',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复数据',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0=不可用  1 =可用',
  `hide` tinyint(3) unsigned DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `key` (`key`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `hide` (`hide`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信关键字回复表';

-- ----------------------------
-- Records of yx_wechat_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_wechat_template`
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_template`;
CREATE TABLE `yx_wechat_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板编号',
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板名',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复内容',
  `tempid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tempkey` (`tempkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信模板';

-- ----------------------------
-- Records of yx_wechat_template
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_wechat_user`
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_user`;
CREATE TABLE `yx_wechat_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信用户id',
  `unionid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `openid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `routine_openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小程序唯一身份ID',
  `nickname` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的昵称',
  `headimgurl` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在城市',
  `language` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在省份',
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在国家',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` smallint(5) unsigned DEFAULT '0' COMMENT '用户所在的分组ID（兼容旧的用户分组接口）',
  `tagid_list` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户被打上的标签ID列表',
  `subscribe` tinyint(3) unsigned DEFAULT '1' COMMENT '用户是否订阅该公众号标识',
  `subscribe_time` int(10) unsigned DEFAULT NULL COMMENT '关注公众号时间',
  `add_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `stair` int(10) unsigned DEFAULT NULL COMMENT '一级推荐人',
  `second` int(10) unsigned DEFAULT NULL COMMENT '二级推荐人',
  `order_stair` int(11) DEFAULT NULL COMMENT '一级推荐人订单',
  `order_second` int(10) unsigned DEFAULT NULL COMMENT '二级推荐人订单',
  `now_money` decimal(8,2) unsigned DEFAULT NULL COMMENT '佣金',
  `session_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小程序用户会话密匙',
  `user_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'wechat' COMMENT '用户类型',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `groupid` (`groupid`) USING BTREE,
  KEY `subscribe_time` (`subscribe_time`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `subscribe` (`subscribe`) USING BTREE,
  KEY `unionid` (`unionid`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=770 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信用户表';

-- ----------------------------
-- Records of yx_wechat_user
-- ----------------------------
