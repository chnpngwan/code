/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80028 (8.0.28)
 Source Host           : localhost:3306
 Source Schema         : flea_market_db

 Target Server Type    : MySQL
 Target Server Version : 80028 (8.0.28)
 File Encoding         : 65001

 Date: 02/04/2023 15:39:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL COMMENT '顺序',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 1：启用，0：禁用',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详情信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '书籍', 1, 1, '专业课二手书本', '2023-02-12 15:21:12', '2023-02-12 15:21:15', 1, 1);
INSERT INTO `category` VALUES (2, '食品', 2, 1, '零食等吃的', '2023-02-12 15:21:37', '2023-02-12 15:21:40', 1, 1);
INSERT INTO `category` VALUES (3, '电子数码', 3, 1, '手机、电脑、平板、键盘等电子产品相关', '2023-02-12 15:22:01', '2023-02-12 15:22:04', 1, 1);
INSERT INTO `category` VALUES (4, '美妆', 4, 1, '口红等', '2023-02-12 15:22:56', '2023-02-12 15:22:59', 1, 1);
INSERT INTO `category` VALUES (5, '日用洗护', 5, 1, '日用品', '2023-02-12 15:23:22', '2023-02-12 15:23:25', 1, 1);
INSERT INTO `category` VALUES (6, '其他', 6, 1, '其他', '2023-02-12 15:23:52', '2023-02-12 15:23:55', 1, 1);
INSERT INTO `category` VALUES (1629426397348691969, '测试分类', 10, 1, NULL, '2023-02-25 18:21:41', '2023-02-25 18:21:41', 1, 1);
INSERT INTO `category` VALUES (1630223036359380994, '8', 8, 1, '8', '2023-02-27 23:07:15', '2023-02-27 23:07:15', 1, 1);
INSERT INTO `category` VALUES (1636007039729455105, '1234', 11, 1, '', '2023-03-15 22:10:48', '2023-03-15 22:10:48', 1, 1);

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `category_id` bigint NOT NULL COMMENT '分类id',
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `price` double(10, 2) NOT NULL COMMENT '价格',
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详情',
  `seller_id` bigint NOT NULL COMMENT '卖家id',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 0：停售，1：起售，2：已售出',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES (1, '数据结构（C语言版）', 1, '书籍', 35.00, '数据结构.png', '人民邮电出版社，严蔚敏版', 2, 2, '2023-02-25 14:39:44', '2023-02-25 14:39:47', 2, 2);
INSERT INTO `commodity` VALUES (2, '海洋小百科', 1, '书籍', 25.00, '海洋小百科.png', '少儿科普读物', 3, 2, '2023-02-25 16:11:43', '2023-03-28 20:06:51', 3, 8);
INSERT INTO `commodity` VALUES (3, '中国鸟类图志', 1, '书籍', 108.30, '中国鸟类图志.png', '中国鸟类图志，超级珍藏版！！！', 4, 1, '2023-02-25 16:12:42', '2023-02-25 16:12:44', 4, 4);
INSERT INTO `commodity` VALUES (4, '遮瑕', 4, '美妆', 35.80, '遮瑕膏.png', '超级好用的遮瑕，遮黑眼圈效果自然不厚重', 4, 1, '2023-02-25 16:14:16', '2023-02-25 16:14:18', 4, 4);
INSERT INTO `commodity` VALUES (5, '水乳套装', 4, '美妆', 285.88, '水乳套装.png', '水乳套装，所有肤质适用', 4, 2, '2023-02-25 16:15:39', '2023-04-02 14:52:28', 4, 5);
INSERT INTO `commodity` VALUES (6, '无线耳机', 3, '电子数码', 88.00, '无线耳机.png', '无线蓝牙耳机，八成新便宜出', 2, 2, '2023-02-25 16:17:05', '2023-02-25 16:17:08', 2, 2);
INSERT INTO `commodity` VALUES (7, '薯片礼包', 2, '食品', 48.35, '薯片礼包.png', '薯片大礼包，里面有各种口味的薯片，都很好吃', 10, 2, '2023-02-25 16:18:36', '2023-04-02 15:25:26', 10, 6);
INSERT INTO `commodity` VALUES (8, '移动硬盘', 3, '电子数码', 200.00, '移动硬盘.png', '超大容量的移动硬盘', 6, 2, '2023-02-25 16:19:38', '2023-04-02 14:50:08', 6, 2);
INSERT INTO `commodity` VALUES (9, '护发素', 5, '日用洗护', 23.00, '护发素.png', '护发素，余量50%', 7, 2, '2023-02-25 16:21:07', '2023-02-25 16:21:09', 7, 7);
INSERT INTO `commodity` VALUES (10, '玩具小熊', 6, '其他', 18.00, '玩具小熊.png', '超可爱玩具小熊', 5, 1, '2023-02-25 16:23:00', '2023-02-25 16:23:02', 5, 5);
INSERT INTO `commodity` VALUES (1631560722882080769, 'test', 1, '书籍', 88.00, NULL, NULL, 2, 0, '2023-03-03 15:42:44', '2023-03-31 14:50:45', 2, 2);
INSERT INTO `commodity` VALUES (1634092716845236226, 'test', 1, '书籍', 100.00, NULL, 'ceshiceshi!!!', 2, 2, '2023-03-10 15:23:58', '2023-03-28 20:30:44', 2, 8);
INSERT INTO `commodity` VALUES (1641691331170422785, '柔顺剂', 5, '日用洗护', 48.00, 'ca969ee0-30b7-487e-90a9-85213c82cee0.png', '衣物柔顺必备！', 3, 1, '2023-03-31 14:38:09', '2023-03-31 14:38:09', 3, 3);
INSERT INTO `commodity` VALUES (1641691457477693442, 'test', 6, '其他', 13.00, '', '测试测试', 3, 2, '2023-03-31 14:38:39', '2023-04-02 14:50:49', 3, 3);
INSERT INTO `commodity` VALUES (1642419618259697666, '女孩玩偶', 6, '其他', 14.00, 'cc06137a-1ad0-4470-b09f-a969b07d5249.png', '两个打包便宜出~', 5, 1, '2023-04-02 14:52:06', '2023-04-02 14:52:06', 5, 5);
INSERT INTO `commodity` VALUES (1642420054458925058, '多芬洗护套装', 5, '日用洗护', 89.00, '4bf72e3b-b08d-41d4-b3ce-0fb7ea85438e.png', '仅试用，余量95%，原价八折出', 6, 1, '2023-04-02 14:53:50', '2023-04-02 14:53:50', 6, 6);
INSERT INTO `commodity` VALUES (1642421514953326593, '施华蔻洗发水', 5, '日用洗护', 90.00, '9200fbed-ae09-45ba-8d8c-2e1d003b0d1e.png', '全新原价出，买多了', 7, 1, '2023-04-02 14:59:39', '2023-04-02 14:59:39', 7, 7);
INSERT INTO `commodity` VALUES (1642424645359570946, '海报', 6, '其他', 0.00, 'bbf36cef-179b-4286-9c8f-9bc8d1521056.jpg', '免费送', 8, 1, '2023-04-02 15:12:05', '2023-04-02 15:12:05', 8, 8);
INSERT INTO `commodity` VALUES (1642425399373795330, '小音箱', 3, '电子数码', 42.00, '1429349a-d388-4fd7-ba36-6df31c0c2243.png', '', 9, 1, '2023-04-02 15:15:05', '2023-04-02 15:15:05', 9, 9);
INSERT INTO `commodity` VALUES (1642425969794945025, '毛衣', 5, '日用洗护', 8.00, 'ad3b1677-2e9b-490f-8ddd-f0713aa3edeb.jpg', '', 9, 1, '2023-04-02 15:17:21', '2023-04-02 15:17:21', 9, 9);
INSERT INTO `commodity` VALUES (1642426155355148289, '玩具车', 6, '其他', 0.00, 'f3570f46-afab-4766-a82c-7b283592dc83.png', '免费送，自取', 9, 1, '2023-04-02 15:18:05', '2023-04-02 15:18:05', 9, 9);
INSERT INTO `commodity` VALUES (1642426415636877314, '肉松小贝', 2, '食品', 2.00, '0dfb0c1e-7cfa-407f-9e01-e0b7bc198b43.png', '买多了，出一半，一共有24个，2r一个，多买可便宜', 9, 1, '2023-04-02 15:19:07', '2023-04-02 15:19:07', 9, 9);
INSERT INTO `commodity` VALUES (1642426694058971137, '玩具模型', 6, '其他', 10.00, '42c65330-a8d4-4352-a631-67d677491dd5.png', '', 10, 1, '2023-04-02 15:20:13', '2023-04-02 15:20:13', 10, 10);
INSERT INTO `commodity` VALUES (1642426833376972802, '益生菌修护套装', 4, '美妆', 50.00, '94a3416f-00a0-4616-95b5-07260f63f7fb.png', '余量60%', 10, 1, '2023-04-02 15:20:47', '2023-04-02 15:20:47', 10, 10);
INSERT INTO `commodity` VALUES (1642427390510567425, '红色小熊卫衣', 5, '日用洗护', 6.00, '978c014f-1b92-4ce7-b99c-b9515307ca70.jpg', '', 6, 1, '2023-04-02 15:22:59', '2023-04-02 15:22:59', 6, 6);
INSERT INTO `commodity` VALUES (1642427914878259202, '蒸蛋糕', 2, '食品', 13.00, 'da2b518f-a817-47c9-9f64-8ecabf1dcfe3.png', '出一箱，一共12个', 6, 1, '2023-04-02 15:25:04', '2023-04-02 15:25:04', 6, 6);
INSERT INTO `commodity` VALUES (1642428272581087233, '面包', 2, '食品', 2.00, '904ce925-2f67-4414-8cdc-e1e723dca674.png', '一个2r，买五送一', 2, 2, '2023-04-02 15:26:30', '2023-04-02 15:34:32', 2, 3);
INSERT INTO `commodity` VALUES (1642428980470550530, '牛皮笔记本', 1, '书籍', 37.00, '80b72bd8-5c35-41fd-8bc2-d45a4854481a.png', '全新牛皮笔记本，纸张质量超级好！', 2, 1, '2023-04-02 15:29:18', '2023-04-02 15:29:18', 2, 2);
INSERT INTO `commodity` VALUES (1642429438996058113, 'WIS面膜', 4, '美妆', 10.00, 'be447552-570f-457d-8bf6-1ebb329cdf18.png', '10r一片，买一盒45r', 3, 1, '2023-04-02 15:31:08', '2023-04-02 15:31:08', 3, 3);
INSERT INTO `commodity` VALUES (1642429776075493378, '联名款保温杯', 5, '日用洗护', 100.00, '5203230c-c8e5-4fae-9448-23b9f9c511a9.png', '原价399买的', 3, 1, '2023-04-02 15:32:28', '2023-04-02 15:32:28', 3, 3);
INSERT INTO `commodity` VALUES (1642430143513300994, '宽松黑色运动裤', 5, '日用洗护', 20.00, 'a46242d3-19d7-4ff4-9547-7c60f899a827.png', '男女同款，七成新', 3, 1, '2023-04-02 15:33:56', '2023-04-02 15:33:56', 3, 3);
INSERT INTO `commodity` VALUES (1642430820503326721, '安踏板鞋', 5, '日用洗护', 125.00, 'c2049f02-da6a-497e-b5eb-23b2b95f3fca.png', '43码', 8, 1, '2023-04-02 15:36:37', '2023-04-02 15:36:37', 8, 8);
INSERT INTO `commodity` VALUES (1642431211014000641, '云南白药牙膏', 5, '日用洗护', 12.00, '77129b6d-db1e-4a60-9001-3265a3e98d45.png', '全新', 8, 1, '2023-04-02 15:38:10', '2023-04-02 15:38:10', 8, 8);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL COMMENT '订单号',
  `commodity_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `commodity_id` bigint NOT NULL COMMENT '商品id',
  `seller_id` bigint NOT NULL COMMENT '卖家id',
  `buyer_id` bigint NOT NULL COMMENT '买家id',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态：0待发货，1待收货，2已收货',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '护发素', 9, 7, 4, 0, '2023-02-25 16:24:09', '2023-02-25 16:24:11', 4, 4);
INSERT INTO `orders` VALUES (2, '数据结构（C语言版）', 1, 2, 8, 1, '2023-02-25 16:25:20', '2023-02-25 16:25:22', 8, 8);
INSERT INTO `orders` VALUES (3, '无线耳机', 6, 2, 3, 2, '2023-02-25 16:25:58', '2023-02-25 16:26:01', 3, 3);
INSERT INTO `orders` VALUES (1640692898674520065, 'test', 1634092716845236226, 2, 8, 2, '2023-03-28 20:30:44', '2023-04-02 15:00:20', 8, 8);
INSERT INTO `orders` VALUES (1642419122232918017, '移动硬盘', 8, 6, 2, 0, '2023-04-02 14:50:08', '2023-04-02 14:50:08', 2, 2);
INSERT INTO `orders` VALUES (1642419292316139522, 'test', 1641691457477693442, 3, 3, 0, '2023-04-02 14:50:49', '2023-04-02 14:50:49', 3, 3);
INSERT INTO `orders` VALUES (1642419707686453250, '水乳套装', 5, 4, 5, 0, '2023-04-02 14:52:28', '2023-04-02 14:52:28', 5, 5);
INSERT INTO `orders` VALUES (1642428005722689537, '薯片礼包', 7, 10, 6, 0, '2023-04-02 15:25:26', '2023-04-02 15:25:26', 6, 6);
INSERT INTO `orders` VALUES (1642430294399193090, '面包', 1642428272581087233, 2, 3, 1, '2023-04-02 15:34:32', '2023-04-02 15:35:04', 3, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别',
  `birthday` datetime NULL DEFAULT NULL COMMENT '生日',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话号码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `point` int NOT NULL DEFAULT 100 COMMENT '信誉积分',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:正常',
  `role` int NOT NULL DEFAULT 1 COMMENT '权限 0：系统管理员，1：普通用户',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '系统管理员', '不知名.png', '女', '2023-02-07 18:34:08', '18912345678', '1328999520@qq.com', 100, 1, 0, '2023-02-07 18:34:04', '2023-02-07 18:34:11', 1, 1);
INSERT INTO `user` VALUES (2, 'user001', 'e10adc3949ba59abbe56e057f20f883e', '网络男神', '不知名2.png', '男', '2023-02-12 14:36:49', '13412345678', '12345', 100, 1, 1, '2023-02-12 14:37:02', '2023-03-19 14:53:06', 1, 2);
INSERT INTO `user` VALUES (3, 'user002', 'e10adc3949ba59abbe56e057f20f883e', '摆', '摆.png', '女', '2023-02-25 15:12:12', '15829387461', '12245436@qq.com', 100, 1, 1, '2023-02-25 15:12:23', '2023-03-24 13:37:41', 1, 3);
INSERT INTO `user` VALUES (4, 'user003', 'e10adc3949ba59abbe56e057f20f883e', '鳄了就睡了吧', '鳄了就睡了吧.png', '女', '2023-02-25 15:13:04', '13463567425', '32847954@163.com', 100, 1, 1, '2023-02-25 15:13:18', '2023-02-25 15:13:21', 1, 1);
INSERT INTO `user` VALUES (5, 'user004', 'e10adc3949ba59abbe56e057f20f883e', '一口咬掉浪漫', '一口咬掉浪漫.png', '男', '2023-02-25 15:59:42', '18723938682', NULL, 100, 1, 1, '2023-02-25 15:59:55', '2023-02-25 15:59:59', 1, 1);
INSERT INTO `user` VALUES (6, 'user005', 'e10adc3949ba59abbe56e057f20f883e', '上火', '上火.png', '男', '2023-02-25 16:02:29', '13342468456', NULL, 100, 1, 1, '2023-02-25 16:02:42', '2023-02-25 16:02:45', 1, 1);
INSERT INTO `user` VALUES (7, 'user006', 'f379eaf3c831b04de153469d1bec345e', '源', '王源.jpg', '女', '2023-02-25 16:05:06', '18733928793', 'wy20001108@163.com', 100, 1, 1, '2023-02-25 16:05:29', '2023-03-28 19:22:04', 1, 7);
INSERT INTO `user` VALUES (8, 'user007', 'e10adc3949ba59abbe56e057f20f883e', '贺', '贺.jpg', '女', '2023-02-25 16:06:08', '15489378294', NULL, 100, 1, 1, '2023-02-25 16:06:22', '2023-02-25 16:06:24', 1, 1);
INSERT INTO `user` VALUES (9, 'user008', 'e10adc3949ba59abbe56e057f20f883e', '修狗', '修狗.png', '男', '2023-02-25 16:07:05', '13348390274', 'xiugou@163.com', 100, 1, 1, '2023-02-25 16:07:16', '2023-02-25 16:07:19', 1, 1);
INSERT INTO `user` VALUES (10, 'user009', 'e10adc3949ba59abbe56e057f20f883e', '呆滞', '呆滞.png', '女', '2023-02-25 16:07:57', '15345672453', NULL, 100, 1, 1, '2023-02-25 16:08:09', '2023-02-25 16:08:13', 1, 1);
INSERT INTO `user` VALUES (1630145391512887298, 'chenmi', '806b2af4633e64af88d33fbe4165a06a', '沉迷工作~', '76fc8e80-ea0d-4337-ba8c-5ee247427e13.jpg', '女', '2023-03-30 21:48:15', '13734524679', NULL, 100, 1, 1, '2023-02-27 17:58:43', '2023-03-30 21:44:10', 1, 1);
INSERT INTO `user` VALUES (1631213621698383873, 'biemalaaa', '2f3bc18c0d3e6b1b8a445075535d26e9', '别骂了别骂了555', 'd48a653a-df13-4013-8aa6-2a1c4f138fd0.jpg', '男', '2023-03-16 21:48:18', '13445678900', '123@qq.com', 100, 1, 1, '2023-03-02 16:43:29', '2023-03-30 21:44:50', 2, 1);
INSERT INTO `user` VALUES (1636007174039457794, 'wangwang', 'e10adc3949ba59abbe56e057f20f883e', '汪汪队，出动！', 'bc111bc9-4258-4a3a-9d16-ada2019c2e1b.jpg', '女', '2023-03-13 00:00:00', '13567535635', NULL, 100, 1, 1, '2023-03-15 22:11:20', '2023-03-30 21:45:52', 1, 1);
INSERT INTO `user` VALUES (1640693748973187074, 'dhudhu', 'e10adc3949ba59abbe56e057f20f883e', 'dhu高材生', '350de69d-61b6-4927-9c3c-1da74139fb4a.jpg', '男', '2023-03-30 00:00:00', '13834463756', NULL, 100, 1, 1, '2023-03-28 20:34:07', '2023-03-28 21:07:09', 1, 1);
INSERT INTO `user` VALUES (1640693953487450113, 'jingyuehu', 'e10adc3949ba59abbe56e057f20f883e', '镜月湖', '0b19f18c-aeac-45d6-91cf-48901ac29cd0.jpg', '女', '2023-03-04 21:48:22', '13355256746', NULL, 100, 1, 1, '2023-03-28 20:34:56', '2023-03-30 21:46:34', 1, 1);
INSERT INTO `user` VALUES (1640704401712701442, 'fighting', 'e10adc3949ba59abbe56e057f20f883e', '全力营业中', '3bc923a1-6e2e-45be-b3e4-3dd0f6bbc7d7.jpg', '男', '2023-02-27 21:48:25', '18938278372', NULL, 100, 1, 1, '2023-03-28 21:16:27', '2023-03-30 21:47:22', 1, 1);
INSERT INTO `user` VALUES (1640704522424770561, 'heyheyhey', 'e10adc3949ba59abbe56e057f20f883e', '嘿嘿嘿！', 'b69a8a6d-7004-42ea-a511-8dc3c7dd701b.jpg', '男', '1970-01-01 08:00:00', '13782973832', NULL, 100, 1, 1, '2023-03-28 21:16:56', '2023-03-28 21:22:33', 1, 1);
INSERT INTO `user` VALUES (1640704775676846082, 'qq77', 'e10adc3949ba59abbe56e057f20f883e', 'QQ小奇', 'c45bb9f8-0707-40f7-9332-d97408ea8e3c.jpg', '男', '2020-06-19 21:48:29', '13545672342', NULL, 100, 1, 1, '2023-03-28 21:17:56', '2023-03-30 21:47:37', 1, 1);
INSERT INTO `user` VALUES (1640704900801323009, 'king', 'e10adc3949ba59abbe56e057f20f883e', '我好帅~', '8af9b335-1f61-4d2f-aa2c-656772efce93.jpg', '男', '1970-01-01 08:00:00', '13928362872', NULL, 100, 1, 1, '2023-03-28 21:18:26', '2023-03-28 21:21:19', 1, 1);
INSERT INTO `user` VALUES (1640705141994774529, 'flea', 'e10adc3949ba59abbe56e057f20f883e', '旅行的小跳蚤', '816223a6-1ab0-4ec3-8aeb-7dff9f8d4fac.png', '女', '1970-01-21 00:00:00', '15563452363', NULL, 100, 1, 1, '2023-03-28 21:19:23', '2023-03-28 21:20:37', 1, 1);
INSERT INTO `user` VALUES (1641437485181960194, 'test', 'e10adc3949ba59abbe56e057f20f883e', 'test', '0fec698b-ebfb-4b85-b1b1-4a70e8322438.jpg', '男', NULL, '18938278372', NULL, 100, 0, 1, '2023-03-30 21:49:28', '2023-03-30 21:50:46', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
