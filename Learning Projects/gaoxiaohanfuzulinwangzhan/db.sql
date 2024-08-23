/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - gaoxiaohanfuzulinwangzhan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gaoxiaohanfuzulinwangzhan` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gaoxiaohanfuzulinwangzhan`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','upload/config1.jpg'),(2,'轮播图2','upload/config2.jpg'),(3,'轮播图3','upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='字典';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'sex_types','性别类型',1,'男',NULL,NULL,'2023-04-25 10:58:54'),(2,'sex_types','性别类型',2,'女',NULL,NULL,'2023-04-25 10:58:54'),(3,'gonggao_types','公告类型',1,'公告类型1',NULL,NULL,'2023-04-25 10:58:54'),(4,'gonggao_types','公告类型',2,'公告类型2',NULL,NULL,'2023-04-25 10:58:54'),(5,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2023-04-25 10:58:54'),(6,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2023-04-25 10:58:54'),(7,'hanfu_types','汉服类型',1,'汉服类型1',NULL,NULL,'2023-04-25 10:58:54'),(8,'hanfu_types','汉服类型',2,'汉服类型2',NULL,NULL,'2023-04-25 10:58:54'),(9,'hanfu_types','汉服类型',3,'汉服类型3',NULL,NULL,'2023-04-25 10:58:54'),(10,'hanfu_types','汉服类型',4,'汉服类型4',NULL,NULL,'2023-04-25 10:58:54'),(11,'hanfu_collection_types','收藏表类型',1,'收藏',NULL,NULL,'2023-04-25 10:58:54'),(12,'hanfu_collection_types','收藏表类型',2,'赞',NULL,NULL,'2023-04-25 10:58:54'),(13,'hanfu_collection_types','收藏表类型',3,'踩',NULL,NULL,'2023-04-25 10:58:54'),(14,'hanfu_order_types','订单类型',101,'已支付',NULL,NULL,'2023-04-25 10:58:54'),(15,'hanfu_order_types','订单类型',102,'已拒绝',NULL,NULL,'2023-04-25 10:58:54'),(16,'hanfu_order_types','订单类型',103,'已同意',NULL,NULL,'2023-04-25 10:58:54'),(17,'hanfu_order_types','订单类型',104,'已归还',NULL,NULL,'2023-04-25 10:58:54'),(18,'hanfu_order_types','订单类型',105,'已评价',NULL,NULL,'2023-04-25 10:58:54'),(19,'hanfu_order_types','订单类型',106,'已退押金',NULL,NULL,'2023-04-25 10:58:54');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` longtext COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='交流论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`users_id`,`forum_content`,`super_ids`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',1,NULL,'发布内容1',393,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(2,'帖子标题2',1,NULL,'发布内容2',321,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(3,'帖子标题3',1,NULL,'发布内容3',247,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(4,'帖子标题4',2,NULL,'发布内容4',184,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(5,'帖子标题5',1,NULL,'发布内容5',271,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(6,'帖子标题6',3,NULL,'发布内容6',261,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(7,'帖子标题7',2,NULL,'发布内容7',463,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(8,'帖子标题8',3,NULL,'发布内容8',198,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(9,'帖子标题9',2,NULL,'发布内容9',340,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(10,'帖子标题10',1,NULL,'发布内容10',336,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(11,'帖子标题11',1,NULL,'发布内容11',344,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(12,'帖子标题12',3,NULL,'发布内容12',67,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(13,'帖子标题13',2,NULL,'发布内容13',444,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(14,'帖子标题14',3,NULL,'发布内容14',278,1,'2023-04-25 10:59:50','2023-04-25 10:59:50','2023-04-25 10:59:50'),(18,'测试',1,NULL,'<p>测试</p>',NULL,1,'2023-04-25 11:44:32',NULL,'2023-04-25 11:44:32'),(19,NULL,NULL,1,'测试',18,2,'2023-04-25 11:47:57',NULL,'2023-04-25 11:47:57');

/*Table structure for table `gonggao` */

DROP TABLE IF EXISTS `gonggao`;

CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111  ',
  `gonggao_photo` varchar(200) DEFAULT NULL COMMENT '公告图片 ',
  `gonggao_types` int(11) NOT NULL COMMENT '公告类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `gonggao_content` longtext COMMENT '公告详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='公告资讯';

/*Data for the table `gonggao` */

insert  into `gonggao`(`id`,`gonggao_name`,`gonggao_photo`,`gonggao_types`,`insert_time`,`gonggao_content`,`create_time`) values (1,'公告名称1','upload/gonggao1.jpg',1,'2023-04-25 10:59:50','公告详情1','2023-04-25 10:59:50'),(2,'公告名称2','upload/gonggao2.jpg',1,'2023-04-25 10:59:50','公告详情2','2023-04-25 10:59:50'),(3,'公告名称3','upload/gonggao3.jpg',2,'2023-04-25 10:59:50','公告详情3','2023-04-25 10:59:50'),(4,'公告名称4','upload/gonggao4.jpg',1,'2023-04-25 10:59:50','公告详情4','2023-04-25 10:59:50'),(5,'公告名称5','upload/gonggao5.jpg',1,'2023-04-25 10:59:50','公告详情5','2023-04-25 10:59:50'),(6,'公告名称6','upload/gonggao6.jpg',2,'2023-04-25 10:59:50','公告详情6','2023-04-25 10:59:50'),(7,'公告名称7','upload/gonggao7.jpg',1,'2023-04-25 10:59:50','公告详情7','2023-04-25 10:59:50'),(8,'公告名称8','upload/gonggao8.jpg',1,'2023-04-25 10:59:50','公告详情8','2023-04-25 10:59:50'),(9,'公告名称9','upload/gonggao9.jpg',1,'2023-04-25 10:59:50','公告详情9','2023-04-25 10:59:50'),(10,'公告名称10','upload/gonggao10.jpg',2,'2023-04-25 10:59:50','公告详情10','2023-04-25 10:59:50'),(11,'公告名称11','upload/gonggao11.jpg',2,'2023-04-25 10:59:50','公告详情11','2023-04-25 10:59:50'),(12,'公告名称12','upload/gonggao12.jpg',1,'2023-04-25 10:59:50','公告详情12','2023-04-25 10:59:50'),(13,'公告名称13','upload/gonggao13.jpg',1,'2023-04-25 10:59:50','公告详情13','2023-04-25 10:59:50'),(14,'公告名称14','upload/gonggao14.jpg',2,'2023-04-25 10:59:50','公告详情14','2023-04-25 10:59:50');

/*Table structure for table `hanfu` */

DROP TABLE IF EXISTS `hanfu`;

CREATE TABLE `hanfu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `hanfu_name` varchar(200) DEFAULT NULL COMMENT '汉服名称  Search111 ',
  `hanfu_uuid_number` varchar(200) DEFAULT NULL COMMENT '汉服编号',
  `hanfu_photo` varchar(200) DEFAULT NULL COMMENT '汉服照片',
  `zan_number` int(11) DEFAULT NULL COMMENT '赞',
  `cai_number` int(11) DEFAULT NULL COMMENT '踩',
  `hanfu_types` int(11) DEFAULT NULL COMMENT '汉服类型 Search111',
  `hanfu_old_money` decimal(10,2) DEFAULT NULL COMMENT '汉服押金 ',
  `hanfu_new_money` decimal(10,2) DEFAULT NULL COMMENT '费用 ',
  `hanfu_video` varchar(200) DEFAULT NULL COMMENT '汉服视频',
  `hanfu_clicknum` int(11) DEFAULT NULL COMMENT '汉服热度',
  `hanfu_content` longtext COMMENT '汉服介绍 ',
  `hanfu_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='汉服信息';

/*Data for the table `hanfu` */

insert  into `hanfu`(`id`,`hanfu_name`,`hanfu_uuid_number`,`hanfu_photo`,`zan_number`,`cai_number`,`hanfu_types`,`hanfu_old_money`,`hanfu_new_money`,`hanfu_video`,`hanfu_clicknum`,`hanfu_content`,`hanfu_delete`,`insert_time`,`create_time`) values (1,'汉服名称1','1682391590424','upload/hanfu1.jpg',252,420,3,'517.25','279.48','upload/video.mp4',425,'汉服介绍1',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(2,'汉服名称2','1682391590413','upload/hanfu2.jpg',474,287,1,'956.71','279.57','upload/video.mp4',173,'汉服介绍2',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(3,'汉服名称3','1682391590404','upload/hanfu3.jpg',129,353,1,'537.61','84.48','upload/video.mp4',245,'汉服介绍3',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(4,'汉服名称4','1682391590432','upload/hanfu4.jpg',13,272,1,'732.21','205.91','upload/video.mp4',270,'汉服介绍4',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(5,'汉服名称5','1682391590369','upload/hanfu5.jpg',252,226,2,'687.27','402.65','upload/video.mp4',365,'汉服介绍5',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(6,'汉服名称6','1682391590459','upload/hanfu6.jpg',232,65,2,'675.35','405.73','upload/video.mp4',387,'汉服介绍6',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(7,'汉服名称7','1682391590411','upload/hanfu7.jpg',442,248,2,'871.03','148.67','upload/video.mp4',449,'汉服介绍7',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(8,'汉服名称8','1682391590389','upload/hanfu8.jpg',279,195,4,'741.46','275.68','upload/video.mp4',118,'汉服介绍8',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(9,'汉服名称9','1682391590382','upload/hanfu9.jpg',260,430,2,'699.93','73.47','upload/video.mp4',224,'汉服介绍9',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(10,'汉服名称10','1682391590441','upload/hanfu10.jpg',455,243,2,'975.25','133.92','upload/video.mp4',235,'汉服介绍10',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(11,'汉服名称11','1682391590387','upload/hanfu11.jpg',408,490,2,'558.99','59.04','upload/video.mp4',410,'汉服介绍11',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(12,'汉服名称12','1682391590442','upload/hanfu12.jpg',324,166,3,'679.41','256.60','upload/video.mp4',3,'汉服介绍12',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(13,'汉服名称13','1682391590460','upload/hanfu13.jpg',103,298,3,'740.42','69.92','upload/video.mp4',481,'汉服介绍13',1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(14,'汉服名称14','1682391590435','upload/hanfu14.jpg',484,39,1,'765.41','398.29','upload/video.mp4',185,'汉服介绍14',1,'2023-04-25 10:59:50','2023-04-25 10:59:50');

/*Table structure for table `hanfu_collection` */

DROP TABLE IF EXISTS `hanfu_collection`;

CREATE TABLE `hanfu_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `hanfu_id` int(11) DEFAULT NULL COMMENT '汉服',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `hanfu_collection_types` int(11) DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='汉服收藏';

/*Data for the table `hanfu_collection` */

insert  into `hanfu_collection`(`id`,`hanfu_id`,`yonghu_id`,`hanfu_collection_types`,`insert_time`,`create_time`) values (1,1,3,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(2,2,3,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(3,3,3,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(4,4,3,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(5,5,3,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(6,6,1,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(7,7,3,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(8,8,3,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(9,9,3,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(10,10,2,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(11,11,1,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(12,12,2,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(13,13,2,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(14,14,3,1,'2023-04-25 10:59:50','2023-04-25 10:59:50'),(19,13,1,1,'2023-04-25 11:45:11','2023-04-25 11:45:11');

/*Table structure for table `hanfu_commentback` */

DROP TABLE IF EXISTS `hanfu_commentback`;

CREATE TABLE `hanfu_commentback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `hanfu_id` int(11) DEFAULT NULL COMMENT '汉服',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `hanfu_commentback_text` longtext COMMENT '评价内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `reply_text` longtext COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='汉服评价';

/*Data for the table `hanfu_commentback` */

insert  into `hanfu_commentback`(`id`,`hanfu_id`,`yonghu_id`,`hanfu_commentback_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,1,2,'评价内容1','2023-04-25 10:59:50','回复信息1','2023-04-25 10:59:50','2023-04-25 10:59:50'),(2,2,2,'评价内容2','2023-04-25 10:59:50','回复信息2','2023-04-25 10:59:50','2023-04-25 10:59:50'),(3,3,3,'评价内容3','2023-04-25 10:59:50','回复信息3','2023-04-25 10:59:50','2023-04-25 10:59:50'),(4,4,2,'评价内容4','2023-04-25 10:59:50','回复信息4','2023-04-25 10:59:50','2023-04-25 10:59:50'),(5,5,3,'评价内容5','2023-04-25 10:59:50','回复信息5','2023-04-25 10:59:50','2023-04-25 10:59:50'),(6,6,2,'评价内容6','2023-04-25 10:59:50','回复信息6','2023-04-25 10:59:50','2023-04-25 10:59:50'),(7,7,1,'评价内容7','2023-04-25 10:59:50','回复信息7','2023-04-25 10:59:50','2023-04-25 10:59:50'),(8,8,1,'评价内容8','2023-04-25 10:59:50','回复信息8','2023-04-25 10:59:50','2023-04-25 10:59:50'),(9,9,3,'评价内容9','2023-04-25 10:59:50','回复信息9','2023-04-25 10:59:50','2023-04-25 10:59:50'),(10,10,3,'评价内容10','2023-04-25 10:59:50','回复信息10','2023-04-25 10:59:50','2023-04-25 10:59:50'),(11,11,1,'评价内容11','2023-04-25 10:59:50','回复信息11','2023-04-25 10:59:50','2023-04-25 10:59:50'),(12,12,3,'评价内容12','2023-04-25 10:59:50','回复信息12','2023-04-25 10:59:50','2023-04-25 10:59:50'),(13,13,1,'评价内容13','2023-04-25 10:59:50','回复信息13','2023-04-25 10:59:50','2023-04-25 10:59:50'),(14,14,2,'评价内容14','2023-04-25 10:59:50','回复信息14','2023-04-25 10:59:50','2023-04-25 10:59:50'),(15,11,1,'汉服不错','2023-04-25 11:30:55',NULL,NULL,'2023-04-25 11:30:55'),(16,1,1,'测试','2023-04-25 11:47:28','手打sad','2023-04-25 11:47:43','2023-04-25 11:47:28');

/*Table structure for table `hanfu_order` */

DROP TABLE IF EXISTS `hanfu_order`;

CREATE TABLE `hanfu_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `hanfu_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单编号 Search111 ',
  `hanfu_id` int(11) DEFAULT NULL COMMENT '汉服',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `hanfu_order_true_price` decimal(10,2) DEFAULT NULL COMMENT '实付价格',
  `hanfu_order_types` int(11) DEFAULT NULL COMMENT '订单类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='汉服租赁';

/*Data for the table `hanfu_order` */

insert  into `hanfu_order`(`id`,`hanfu_order_uuid_number`,`hanfu_id`,`yonghu_id`,`hanfu_order_true_price`,`hanfu_order_types`,`insert_time`,`create_time`) values (1,'1682392645721',13,1,'810.34',101,'2023-04-25 11:17:26','2023-04-25 11:17:26'),(2,'1682392864374',11,1,'618.03',105,'2023-04-25 11:21:04','2023-04-25 11:21:04'),(6,'1682394124725',7,1,'1019.70',102,'2023-04-25 11:42:05','2023-04-25 11:42:05'),(7,'1682394332876',13,1,'810.34',102,'2023-04-25 11:45:33','2023-04-25 11:45:33'),(8,'1682394378946',1,1,'796.73',105,'2023-04-25 11:46:19','2023-04-25 11:46:19');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '儿童id',
  `username` varchar(100) NOT NULL COMMENT '儿童名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'a1','yonghu','用户','jplbgc3yb5mjuhcntzlh6pym3i0magg9','2023-04-25 11:16:19','2023-04-25 12:44:04'),(2,1,'admin','users','管理员','6ye0scrjwa2t7kld7nr3yof9cnb0s8yt','2023-04-25 11:22:09','2023-04-25 12:46:27');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '儿童名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2023-04-25 10:58:54');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_uuid_number` varchar(200) DEFAULT NULL COMMENT '用户编号 Search111 ',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '用户邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_uuid_number`,`yonghu_name`,`yonghu_phone`,`yonghu_id_number`,`yonghu_photo`,`sex_types`,`new_money`,`yonghu_email`,`create_time`) values (1,'a1','123456','1682391590400','用户姓名1','17703786901','410224199010102001','upload/yonghu1.jpg',2,'1720.52','1@qq.com','2023-04-25 10:59:50'),(2,'a2','123456','1682391590443','用户姓名2','17703786902','410224199010102002','upload/yonghu2.jpg',1,'979.13','2@qq.com','2023-04-25 10:59:50'),(3,'a3','123456','1682391590390','用户姓名3','17703786903','410224199010102003','upload/yonghu3.jpg',2,'755.40','3@qq.com','2023-04-25 10:59:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
