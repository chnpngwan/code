DROP TABLE IF EXISTS `buyers`;
CREATE TABLE `buyers`(
	   `buyers_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '买家ID',
`buyer_number` varchar(64) NOT NULL UNIQUE comment '买家编号',
`buyer_name` varchar(64) comment '买家姓名',
`home_address` varchar(64) comment '家庭住址',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (buyers_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '买家';

DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller`(
	   `seller_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '卖家ID',
`seller_number` varchar(64) NOT NULL UNIQUE comment '卖家编号',
`seller_name` varchar(64) comment '卖家姓名',
`home_address` varchar(64) comment '家庭地址',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (seller_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '卖家';

DROP TABLE IF EXISTS `automobile_brand`;
CREATE TABLE `automobile_brand`(
	   `automobile_brand_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '汽车品牌ID',
`brand` varchar(64) comment '品牌',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (automobile_brand_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '汽车品牌';
insert into `automobile_brand` values (1,'品牌1','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `automobile_brand` values (2,'品牌2','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `automobile_brand` values (3,'品牌3','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `automobile_brand` values (4,'品牌4','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `automobile_brand` values (5,'品牌5','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `automobile_brand` values (6,'品牌6','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `automobile_brand` values (7,'品牌7','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `automobile_brand` values (8,'品牌8','0','2022-05-15 14:37:30','2022-05-15 14:37:30');

DROP TABLE IF EXISTS `secondhand_car`;
CREATE TABLE `secondhand_car`(
	   `secondhand_car_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '二手汽车ID',
`auction_number` varchar(64) comment '拍卖单号',
`seller_number` int(11) DEFAULT 0 comment '卖家编号',
`seller_name` varchar(64) comment '卖家姓名',
`title` varchar(64) comment '标题',
`brand` varchar(64) comment '品牌',
`photo` varchar(255) comment '照片',
`year_of_purchase` varchar(64) comment '购入年份',
`kilometers_traveled` varchar(64) comment '行驶公里数',
`starting_price` int(11) DEFAULT 0 comment '起拍价',
`current_price` int(11) DEFAULT 0 comment '当前价',
`auction_mode` varchar(64) comment '拍卖方式',
`vehicle_parameters` text comment '汽车参数',
`details` longtext comment '详情',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`timer_title` varchar(64) DEFAULT NULL comment '计时器标题',
`timing_start_time` datetime DEFAULT NULL COMMENT '计时开始时间',
`timing_end_time` datetime DEFAULT NULL COMMENT '计时结束时间',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (secondhand_car_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '二手汽车';
insert into `secondhand_car` values (1,'拍卖单号1',0,'卖家姓名1','标题1','品牌1','/api/upload/image_1645405550738.jpg','购入年份1','行驶公里数1',5,5,'拍卖方式1','汽车参数1','此处可上传文字、图片、视频、超链接、表格等内容区1','849','980','未审核','','0','计时器标题1','2022-5-15','2022-5-15','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `secondhand_car` values (2,'拍卖单号2',0,'卖家姓名2','标题2','品牌2','/api/upload/image_1645405550756.jpg','购入年份2','行驶公里数2',10,10,'拍卖方式2','汽车参数2','此处可上传文字、图片、视频、超链接、表格等内容区2','316','97','未审核','','0','计时器标题2','2022-5-15','2022-5-15','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `secondhand_car` values (3,'拍卖单号3',0,'卖家姓名3','标题3','品牌3','/api/upload/image_1645405550739.jpg','购入年份3','行驶公里数3',15,15,'拍卖方式3','汽车参数3','此处可上传文字、图片、视频、超链接、表格等内容区3','583','403','未审核','','0','计时器标题3','2022-5-15','2022-5-15','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `secondhand_car` values (4,'拍卖单号4',0,'卖家姓名4','标题4','品牌4','/api/upload/image_1645405550782.jpg','购入年份4','行驶公里数4',20,20,'拍卖方式4','汽车参数4','此处可上传文字、图片、视频、超链接、表格等内容区4','719','481','未审核','','0','计时器标题4','2022-5-15','2022-5-15','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `secondhand_car` values (5,'拍卖单号5',0,'卖家姓名5','标题5','品牌5','/api/upload/image_1645405550738.jpg','购入年份5','行驶公里数5',25,25,'拍卖方式5','汽车参数5','此处可上传文字、图片、视频、超链接、表格等内容区5','708','705','未审核','','0','计时器标题5','2022-5-15','2022-5-15','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `secondhand_car` values (6,'拍卖单号6',0,'卖家姓名6','标题6','品牌6','/api/upload/image_1645405550756.jpg','购入年份6','行驶公里数6',30,30,'拍卖方式6','汽车参数6','此处可上传文字、图片、视频、超链接、表格等内容区6','761','65','未审核','','0','计时器标题6','2022-5-15','2022-5-15','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `secondhand_car` values (7,'拍卖单号7',0,'卖家姓名7','标题7','品牌7','/api/upload/image_1645405550786.png','购入年份7','行驶公里数7',35,35,'拍卖方式7','汽车参数7','此处可上传文字、图片、视频、超链接、表格等内容区7','385','452','未审核','','0','计时器标题7','2022-5-15','2022-5-15','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `secondhand_car` values (8,'拍卖单号8',0,'卖家姓名8','标题8','品牌8','/api/upload/image_1645405550794.jpg','购入年份8','行驶公里数8',40,40,'拍卖方式8','汽车参数8','此处可上传文字、图片、视频、超链接、表格等内容区8','153','17','未审核','','0','计时器标题8','2022-5-15','2022-5-15','2022-05-15 14:37:30','2022-05-15 14:37:30');

DROP TABLE IF EXISTS `auction_order`;
CREATE TABLE `auction_order`(
	   `auction_order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '拍卖订单ID',
`auction_number` varchar(64) comment '拍卖单号',
`seller_number` int(11) DEFAULT 0 comment '卖家编号',
`seller_name` varchar(64) comment '卖家姓名',
`title` varchar(64) comment '标题',
`current_price` varchar(64) comment '当前价',
`mark_up_amount` int(11) DEFAULT 0 comment '加价金额',
`buyer_number` int(11) DEFAULT 0 comment '买家编号',
`buyer_name` varchar(64) comment '买家姓名',
`contact_number` varchar(64) comment '联系电话',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (auction_order_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '拍卖订单';
insert into `auction_order` values (1,'拍卖单号1',0,'卖家姓名1','标题1','当前价1',5,0,'买家姓名1','联系电话1','未审核','','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `auction_order` values (2,'拍卖单号2',0,'卖家姓名2','标题2','当前价2',10,0,'买家姓名2','联系电话2','未审核','','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `auction_order` values (3,'拍卖单号3',0,'卖家姓名3','标题3','当前价3',15,0,'买家姓名3','联系电话3','未审核','','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `auction_order` values (4,'拍卖单号4',0,'卖家姓名4','标题4','当前价4',20,0,'买家姓名4','联系电话4','未审核','','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `auction_order` values (5,'拍卖单号5',0,'卖家姓名5','标题5','当前价5',25,0,'买家姓名5','联系电话5','未审核','','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `auction_order` values (6,'拍卖单号6',0,'卖家姓名6','标题6','当前价6',30,0,'买家姓名6','联系电话6','未审核','','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `auction_order` values (7,'拍卖单号7',0,'卖家姓名7','标题7','当前价7',35,0,'买家姓名7','联系电话7','未审核','','0','2022-05-15 14:37:30','2022-05-15 14:37:30');
insert into `auction_order` values (8,'拍卖单号8',0,'卖家姓名8','标题8','当前价8',40,0,'买家姓名8','联系电话8','未审核','','0','2022-05-15 14:37:30','2022-05-15 14:37:30');

DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='临时访问牌';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章频道：用于汇总浏览文章，在不同频道下展示不同文章。';

DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏：';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论：';
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告：';
insert into `notice` values ('1','公告标题1','公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `notice` values ('2','公告标题2','公告，包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `notice` values ('3','公告标题3','公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `notice` values ('4','公告标题4','公告，包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞：';
insert into `praise` values ('2','1',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('25','5',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','9','1');
insert into `praise` values ('26','5',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('27','5',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('44','2',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'forum','forum_id','2','1');
insert into `praise` values ('50','2',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'forum','forum_id','2','1');
insert into `praise` values ('54','2',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','9','1');
insert into `praise` values ('57','0',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','10','1');
insert into `praise` values ('86','0',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','6','1');
insert into `praise` values ('101','7',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('108','2',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','8','1');
insert into `praise` values ('221','0',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','2','1');
DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图：';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员',"2022-04-30 12:03:25.000 ",null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/avatar.jpg',"2022-05-19 07:32:09.000 ");
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

insert into `user_group` values ('1','100','管理员',null,'','','0',null,"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ");
insert into `user_group` values ('2','100','游客',null,'','','0','0',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ");
insert into `user_group` values ('3','100','买家',null,'buyers','buyers_id','0','3',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ");
insert into `user_group` values ('4','100','卖家',null,'seller','seller_id','0','3',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ");
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/image_1645405515574.jpg','547',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ");
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/image_1645405515585.jpg','147',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ");
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/image_1645405515583.jpg','711',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ");
insert into `slides` values ('4','轮播图4','内容4','/article/details?article=4','/api/upload/image_1645405515566.jpg','939',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ");
insert into `slides` values ('5','轮播图5','内容5','/article/details?article=5','/api/upload/image_1645405515583.jpg','316',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ");
insert into `article` values ('1','电动汽车充不进电怎么办?天冷怎么保养汽车?','汽车','570','0',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ",null,null,null,'<p>充不上电的方法：</p><p>1、在冬天电动汽车充不上电，主要还是因为气温太低，我们可以把汽车放在温度较高的地方，或者是在汽车周围放一些热源。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/70/w640h230/20210325/4581-kmvwsvx9680638.jpg"></p><p>2、最简单的办法就是在给汽车充电之前先打开汽车预热一下，预热后汽车的温度就会上升，充电也会更加方便。</p><p>3、还可以做好预防，不用车的时候在上面盖一层专业的车衣，做好给车辆的保暖工作。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/222/w640h382/20210325/d433-kmvwsvx9680639.jpg"></p><p>怎么保养汽车：</p><p>1、合理使用电动汽车</p><p>现在很多电动汽车的车主，因为以前习惯了燃油汽车，所以踩油门很快，加速也很快，还会出现急刹车的情况。这些情况出现在电动汽车上的话，对电动汽车的耗损非常大。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/266/w640h426/20210325/bbd4-kmvwsvx9680640.jpg"></p><p>特别是突然提速，因为如果我们猛地一提速，电动车需要释放大量的电来提升速度，所以建议各位电动汽车的车主们，最好是保持均匀的速度行驶，也不要出现急刹车的情况。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/272/w640h432/20210325/c4bf-kmvwsvx9680643.jpg"></p><p>2、经常给电动汽车充电</p><p>冬天天气比较冷，就算我们开的是燃油汽车，在启动之前也要先进行热车，更何况现在是电动汽车。一般天冷的情况下，电池的电就会不耐用，有可能前一天晚上你的电动汽车还是满电，第二天早上一醒来就少了很多电。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/70/w640h230/20210325/f4c8-kmvwsvx9680642.jpg"></p><p>所以我们在用电动汽车之前，最好是先给电动汽车充一会儿电，充电的时候电池也会升温，有利于汽车的启动。</p><p>3、少开空调</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/272/w640h432/20210325/9bd1-kmvwsvx9680646.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('2','沃尔沃XC40 RECHARGE汽车，随心所欲无所不能','汽车','962','0',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ",null,null,null,'<p>在之前车展的时候，我对<a href="http://db.auto.sina.com.cn/b13.html?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">沃尔沃</a><a href="http://db.auto.sina.com.cn/3403/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">XC40</a>&nbsp;RECHARGE汽车进行了静态分析，当时我非常喜欢这款北欧风格很强的紧凑型纯电动SUV，一个偶然的机会，我得到了在各个方向试驾这辆车的机会，那么除了霸气的外观，这款车还有哪些特点呢？首先，我们来谈谈这款车充电的驾驶体验。总的来说，这款沃尔沃纯电汽车，即有操控紧凑型SUV的乐趣，又有同级燃油车所不具备的速度乐趣。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/180/w1200h580/20210325/610e-kmvwsvx9698286.jpg"></p><p>试驾开始后，我迫不及待地踩上沃尔沃XC40 RECHARGE汽车充电的油门踏板。起初，车辆响应后，加速度十分线性，就像有人从背后推了一下，当我踩下踏板时。这款车突然变得“烦躁”，开始加速，好像是星际过渡。这时，不仅有人在推我向前，而且视觉上也感觉到了很强的速度感。沃尔沃XC40 RECHARGE这种向前推力可以持续很长时间，并为车辆带来持续而丰富的动力。</p><p>沃尔沃XC40 RECHARGE最大功率300KW和峰值扭矩660NM双电机系统仍在“给力”，平稳持久的功率输出可使驾驶员在车辆上行驶速度，控制更自信，这是沃尔沃XC40 RECHARGE汽车带来的速度快感。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/436/w1200h836/20210325/f602-kmvwsvx9698297.jpg"></p><p>当然，作为纯电动汽车，沃尔沃XC40 RECHARGE汽车还具有能量回收的功能，但是，目前还没有针对这一功能的不同强度的档位。因此我们只能适应一种能量回收强度对驾驶体验的影响，在实际驾驶过程中，当我松开油门踏板时，车辆的能量回收不会启动。当我踩下刹车踏板时，车辆明显的刹车就会启动能量回收功能，此时，车辆会给驾驶员和乘客带来非常明显的阻力感，车速也会进一步减慢。</p><p>另外，如果想让能量回收功能更直接地发挥作用，可以通过中控面板开启“单踏板驱动”模式，此时，当我们松开油门踏板时，能量回收系统会直接启动并反向拖动电机。这样不仅能更快地回收能量，提高续航能力，还能有效地降低车速，使驾驶员只需一个踏板就能轻松控制车速。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/135/w1200h535/20210325/f14c-kmvwsvx9698291.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('3','家庭的第二辆汽车怎么选？这几款电动小车很合适，经济又实用','汽车','404','0',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ",null,null,null,'<p>相信很多已经成家立业的朋友会发现，自己要用车，老婆要用车，父母、儿女也可能要用车。因此，很多时候一辆车并不能完全满足一个家庭的用车需求，届时他们都会有再买一辆的想法。而对于大多数普通家庭来说，笔者认为电动小车是很不错的选择，价格便宜，用车成本也不高，还能与传统燃油车进行互补，比如限行的时候也有车开。所以今天，在下就为各位带来几款精品电动小车。</p><p><a href="http://db.auto.sina.com.cn/4030/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>宏光MINI EV</strong></a><a href="http://db.auto.sina.com.cn/4030/peizhi/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>(配置</strong></a><strong style="color: rgb(1, 155, 121);">|询价)</strong></p><p><strong>指导售价：2.88-3.88万</strong></p><p>宏光MINI EV是当前市面上最受欢迎的一款电动车，也是最便宜的车型，两三万的价格不会给普通家庭造成很大的经济压力，但又确保了足够的实用性。宏光MINI EV车身极为小巧，操控灵活好上手，是女司机、新手司机的福音。别看它只有两个门，但车内实打实的有四个座位，因为宏光MINI EV的座椅是轻薄化设计，乘坐空间倒是尚可，只是柔软度和包裹性就很欠缺了。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/155/w1097h658/20210326/f5e3-kmvwsvy2869620.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/158/w1072h686/20210326/3608-kmvwsvy2869644.jpg"></p><p>在动力方面以及续航方面，宏光MINI EV全系搭载一台后置单电机，最大功率以及最大扭矩分别为20kW/85N·m，小马拉小车，提速相当得劲，大概三秒多就能提速到六十多的时速。续航则是提供120km、170km两种续航里程选择（NEDC），冬天、或者开空调，续航还得打个八九折，续航短，还不支持快充，所以它活动范围是很受限制的。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/232/w1136h696/20210326/7aca-kmvwsvy2869643.jpg"></p><p><a href="http://db.auto.sina.com.cn/3346/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>欧拉黑猫</strong></a><a href="http://db.auto.sina.com.cn/3346/peizhi/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>(配置</strong></a><strong style="color: rgb(1, 155, 121);">|询价)</strong></p><p><strong>指导售价：6.98-8.48万</strong></p><p>欧拉黑猫是改款后的欧拉R1，在宏光MINI EV上市之前，它才是最后欢迎的一款电动小车。俗话说，一分钱，一分货，相较于“玩具”一般的宏光MINI EV，黑猫才更有“车”样。黑猫整体造型圆润丰满，配上时尚的双色车身、圆圆的大灯以及精致的轮毂，看上去可爱又有档次。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/185/w1111h674/20210326/b45c-kmvwsvy2869641.jpg"></p><p>其次，黑猫的驾乘舒适性也是很不错的，座椅软硬程度适中，有包裹感，减震以及隔音性能也比宏光MINI好太多了。此外，黑猫还配备了ESP、主动刹车、倒车影像、车联网以及远程启动等全面且实用的功能配置，让用车体验更加愉快、便利。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/210/w1115h695/20210326/bc38-kmvwsvy2869639.jpg"></p><p>此外，黑猫采用了轻量化、低风阻车身设计，并结合高效的三电系统，可实现最高405km的超长NEDC续航里程，快充时间也只需0.5h，远超同级竞品，所以开黑猫出个小远门完全是不成问题的。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/188/w1096h692/20210326/ed67-kmvwsvy2869637.jpg"></p><p><strong>奇瑞</strong><a href="http://db.auto.sina.com.cn/2645/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>小蚂蚁</strong></a><a href="http://db.auto.sina.com.cn/2645/peizhi/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>(配置</strong></a><strong style="color: rgb(1, 155, 121);">|询价)</strong></p><p><strong>指导售价：6.68-7.88万</strong></p><p>如果嫌弃前两款车外观太女性化，那么可以看看这台奇瑞小蚂蚁。小蚂蚁整车肌肉感和棱角高明显，车头高大且锐利，搭配“X”型前脸、柠檬黄车身以及花瓣形轮毂，塑造出了年轻运动、张扬酷炫的“帅小伙”形象，更贴合男性审美。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/174/w1098h676/20210326/cdf8-kmvwsvy2869633.jpg"></p><p>小蚂蚁内饰设计也与外观形成了相对统一，各种各样的小造型与小设计比较多，把视觉感受凸显得很丰富，也让整个座舱的环抱感更强烈，加上激情的橘红色饰板点缀，驾驶氛围很棒；用料以及做工也有中上水准，没什么可挑剔的。同时小蚂蚁配备了真皮方向盘、自动泊车、前排手机无线充电、全车车窗一键升降等越级配置。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/254/w1159h695/20210326/7d3d-kmvwsvy2869635.jpg"></p><p>正如外观以及内饰一样，小蚂蚁强调驾控乐趣，采用后置后驱动力布局以及麦弗逊式独立后悬，并拥有运动驾驶模式，在中低速行驶中能带来很特别的操控体验。但在高速中，高车身以及高底盘都影响了稳定性，行驶品质会降低不少。在续航方面，小蚂蚁全系标配301km NEDC续航里程，中规中矩。值得一提的是，小蚂蚁提供包括三电在内的首任车主终身质保，减轻消费者的购车顾虑。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/200/w1110h690/20210326/0339-kmvwsvy2869629.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('4','日产汽车半个多世纪的创新造就12款经典纯电动车','汽车','404','0',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ",null,null,null,'<p>作为现代人们生活不可或缺的一部分，汽车已经从传统的交通工具，转化成使人愉悦、令生活更自信、更有趣的多元化角色。而电动汽车的出现，将驾驶的乐趣进一步放大。得益于更加智能化的车载技术，电动汽车掀起了一场更为丰富的人类生活方式的变革。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/282/w620h462/20210326/456d-kmvwsvy2805867.jpg"></p><p>作为现代化电动汽车的先驱者，日产汽车（Nissan）根据时代的变迁和驾驶者需求的改变而不断创新，自1947年以来，陆续推出了纯电动车型、冰淇淋货车和机器人辅助副驾驶等电动化产品，满足消费者日益变化的多元化需求。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/106/w620h286/20210326/b981-kmvwsvy2805933.jpg"></p><p><strong>1947年，日产汽车推出第一款纯电动车型Tama</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/6/w620h186/20210326/8e45-kmvwsvy2805929.jpg"></p><p>电动汽车并不是一个新生事物。早年由于日本国内石油短缺，而水电能源相对充足，日本政府便号召企业在水电能源领域进行研究和开发。日产汽车的工程师们以此为目标开展了Tama电动汽车的研发。</p><p>作为日产汽车旗下的第一款纯电动车型，1947年发布的Tama纯电动汽车搭载了可更换的铅酸电池，最高时速可达35.2公里，续航里程为96.3公里，主要供出租车公司使用。这些参数按照如今的标准来看并不突出，但在当时，Tama纯电动汽车是政府试验中表现最好的车型。1950年，由于石油供应趋向稳定，Tama停产，但日产汽车的电动化技术研究就此展开。</p><p><strong>1996年，日产汽车推出全球第一台使用锂离子电池驱动的日产Prairie Joy电动汽车</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/29/w620h209/20210326/41a3-kmvwsvy2805986.jpg"></p><p>作为全球首款搭载圆柱型锂离子电池的电动汽车，日产Prairie Joy电动车在地球上最具挑战性的环境之一——北极路面上证明它的实用性。日本国家极地研究所（National Institute of Polar Research）在极端严酷的环境中，使用日产Prairie Joy电动汽车达6年之久，并且没有出现任何电池故障。同时，由于日产Prairie Joy电动汽车的静谧性和零排放等特点，研究人员还将其用来近距离观察野生动物。在正常行驶条件下，日产Prairie Joy电动汽车的续航里程为200公里，最高时速可达120公里/小时。日产Prairie Joy电动汽车在日本累计销售了30台。</p><p><strong>2000年，推出令人瞩目的日产Hypermini电动汽车</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/219/w620h399/20210326/e086-kmvwsvy2805987.jpg"></p><p>作为一款可搭载两名乘员的城市通勤车，日产Hypermini为电动汽车带来了全新突破。凭借时尚而独特的设计，日产Hypermini电动汽车出现在好莱坞电影《过夜》 （Sleepover）和《公主日记2》（The Princess Diaries 2）中。这款车型在钕磁铁电动机的同步牵引下，最高时速可达100公里，单次充电续航里程达到115公里。</p><p>日产Hypermini电动汽车获得了日本新能源基金会（New Energy Foundation）颁发的新能源大奖（New Energy Grand Prize）和日本设计振兴研究所（Japan Institute for Design Promotion）颁发的优秀设计奖（Good Design Award）。在当时创新性的无钥匙进入系统也使其成为从横滨到加州大学戴维斯分校的汽车共享试点项目的首选车辆。</p><p><strong>2005年，日产Pivo纯电动概念车掀起电动出行新概念</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/62/w620h242/20210326/071f-kmvwsvy2806047.jpg"></p><p>作为在2005年东京车展上亮相的新一代概念车型，日产Pivo纯电动概念车的气泡式驾驶舱吸引了人们的注意，它是第一款由轻型、紧凑的复合锂离子电池驱动的汽车。由村上隆（Takashi Murakami）所设计的可爱的“代言人”——娃娃Pivo-Chan也备受欢迎。</p><p>日产Pivo纯电动概念车专为年轻的都市女性设计，是她们日常生活代步的理想车型。驾驶舱可载乘三人，并可以向任意方向旋转。倒车时可以直接将驾驶舱调转，开往另一个方向。典型的日产设计特色包括位于方向盘上可一键操作的声音控制系统和全球定位系统，使驾驶时具有更高的安全性。前挡风玻璃两侧的监视器可以显示车辆周边区域，以减少视觉盲区带来的危险。日产Pivo纯电动概念车还具有全方位视频监控功能，这是全景智能监控（Intelligent Around View Monitor）的早期版本，现已应用于多款日产车型上。</p><p><strong>2007年，第2代日产Pivo&nbsp;纯电动概念车作为城市通勤电动车型亮相，使驾驶变得更自信</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/102/w620h282/20210326/b38e-kmvwsvy2806046.jpg"></p><p>有研究表明，带着积极的心态和愉快的心情驾驶车辆，可有效降低交通事故的概率。第2代日产Pivo 纯电动概念车是对这项研究的有力证明。该车型搭载了车载机器人系统（Robotic Agent system），能够实时监控驾驶状况，并使用语音和手势帮助驾驶员保持愉悦的心情。</p><p>同时，四轮独立控制系统有助于车辆在加速或转弯过程中最大限度地减少侧倾，从而提高了安全性。车轮甚至可以转动90度，更容易侧向驶入停车位置。</p><p><strong>2010年，日产</strong><a href="http://db.auto.sina.com.cn/831/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>聆风</strong></a><strong>（Nissan LEAF）真正将电动汽车带入人们的生活</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/21/w620h201/20210326/b76a-kmvwsvy2806090.jpg"></p><p>作为日产汽车第一款量产纯电动车型，日产聆风是电动化出行的里程碑，迄今为止，全球销售量已超过50万辆。</p><p>日产聆风成功的关键在于将数十年来的研发与消费者的需求进行了完美的结合。第一代日产聆风续航里程为200公里，对于许多首次购买电动汽车的消费者来说，这是一个实用的选择。日产聆风还开启了将电动汽车作为移动电源的创新理念。</p><p>2016年，在一次纪念活动中，一辆特殊的日产聆风被创造出来。它能探测到驾驶员的脑电波，在驾校的教学中，被监测到的驾驶员脑电波信息也会以卡通音效的形式投射在车身，用于辅助教学。</p><p><strong>2010年，日产New Mobility&nbsp;概念车型诞生，利用电动汽车技术解决社会问题</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/44/w620h224/20210326/ed2a-kmvwsvy2806089.jpg"></p><p>随着发达国家人口老龄化和独子家庭数量的增长，更短的旅行以及更少的乘客将成为广泛的出行需求。为了满足这些需求，日产推出了日产New Mobility概念车型。这是一款具有摩托车的机动性和汽车的稳定性，对用户友好、超紧凑、100%零排放的电动车型。</p><p>彼时，日本横滨市已经将这些想法付诸实践。Choimobi Yokohama是一项以双座电动汽车为特色的往返汽车共享计划，它让游客的出行和生活更方便，并通过此振兴了当地社区。作为回报，该计划让首次驾驶者体验到了超紧凑型电动汽车的乐趣和便利。</p><p><strong>2014年，日产发布首款量产纯电动商务车型--e-NV200</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/38/w620h218/20210326/51eb-kmvwsvy2806194.jpg"></p><p>你有过从电动汽车上购买冰淇淋的体验吗？如果在英国，你可能见过Mackie的全电动冰激凌售货车，它是基于日产的第一款零排放轻型商务车e-NV200设计的。</p><p>在欧洲和日本上市的日产e-NV200纯电动车型可以提供如NV200 Vanette一般的宽敞空间和多功能，并配有安静、强大的电传动系统。液压再生制动系统可使车辆在满电情况下行驶190公里。此外，日产e-NV200纯电动车型还有配有移动电源的功能，配有电源插座，可用于灾后救援、户外路演活动，乃至冰淇淋制作等。</p><p><strong>2017年，全新日产聆风助力日产电动汽车更上一层楼</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/27/w620h207/20210326/e95a-kmvwsvy2806195.jpg"></p><p>2017年，全新日产聆风面世。 全新一代聆风具备更强劲的加速性能、更轻便的操控性，续航里程大幅提升，单次充电续航里程可达400公里。 同时，全新日产聆风还配备了先进的自动驾驶辅助系统——ProPILOT超智驾、ProPILOT Park智控泊车系统，以及帮助驾驶员实现单踏板加速、减速以及制动的e-Pedal一体化智控踏板。</p><p>2019年，日产聆风e+首先搭载了新开发的电动动力系统，在动力和续航里程方面得到大幅提升。同时，配备了62千瓦时电池，使续航里程提高了40%。</p><p>作为日产电动汽车创新思维的展示，全新日产聆风成为了新创意的实践平台。日产聆风Dream Drive技术创新地模仿了内燃机运转时富有节奏感的声音，可帮助车上的孩子入睡。2019年，一辆全新日产聆风被装扮成一棵圣诞树，使用车载电池点亮了挂在车身上的数百个灯泡，显示了能源再生系统的利用价值。</p><p><strong>2018年，日产</strong><a href="http://db.auto.sina.com.cn/428/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>轩逸</strong></a><a href="http://db.auto.sina.com.cn/428/peizhi/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>(配置</strong></a><strong style="color: rgb(1, 155, 121);">|询价)</strong><strong>·纯电登场满足中国消费者需求</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/27/w620h207/20210326/d2bc-kmvwsvy2806282.jpg"></p><p>轩逸是日产在华最受欢迎的乘用车。轩逸·纯电是日产汽车第一款专为中国消费者打造的纯电动车型，并且在中国生产制造。基于日产聆风的核心技术，轩逸·纯电将电池移至座椅下方，使车辆更具稳定性和可靠性，长轴距为车辆提供了宽敞的驾驶室和腿部空间，338公里续航里程有效满足了消费者的需求。</p><p><strong>2019年，日产IMk纯电动概念车开创了下一代驾驶员支持技术</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/230/w620h410/20210326/fd9f-kmvwsvy2806284.jpg"></p><p>在2019年东京车展上亮相的日产IMk纯电动概念车，基于传统微型车（KeiCar）车身尺寸和全新的电动汽车平台打造，拥有强劲、平稳和静谧的驾驶支持系统，满足城市街道和高速公路的出行需求。日产IMk纯电动概念车专为智能网联而设计，将驾驶员与外界无缝连接。</p><p><strong>2020年，日产</strong><a href="http://db.auto.sina.com.cn/3758/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>Ariya</strong></a><strong>让驾驶变得更激情、更自信、更舒适、更互联</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/28/w620h208/20210326/349c-kmvwsvy2806332.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('5','纯电汽车的性能内核 MARVEL R三电技术革新体验','汽车','354','0',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ",null,null,null,'<p>有这么一款智能汽车，集潮流感、时尚感、科技感、未来感于一身，众多黑科技加舒适的操作体验，它就是上汽R新推出的<a href="http://db.auto.sina.com.cn/4196/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">MARVEL R</a><a href="http://db.auto.sina.com.cn/4196/peizhi/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">(配置</a><span style="color: rgb(1, 155, 121);">|询价)</span>！作为汽车工业3.0时代里最为突出的一款"性能怪兽"，它酷炫的外观只是最简单最直观的体验，作为一款纯电动SUV汽车，MARVEL R真正的内核，在于"三电"技术的革新！</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/730/w960h570/20210326/0e37-kmvwsvy2700086.jpg"></p><p><strong>"三电"技术革新 性能升级</strong></p><p>评判一款电动汽车的优劣，最重要的就是"三电"技术这一指标，因为它直接就可以证明车辆的性能表现是否足够优秀。目前首先面世的MARVEL R标准版以及PRO版本采用了双电机后驱架构，车辆还配备了Hair-pin发卡绕组电机，额定功率达到了137kW，峰值扭矩为410N·m，对于用户的日常出行来说，这个配置可谓是有过之无不及了。如果用户对于车辆的性能有着更高的追求，还可以在MARVEL R PRO版车型的基础上，自行选装四驱澎湃性能包，可以获得三电极全轮驱动能力，其中Hair-pin发卡永磁同步电机将分别位于前后桥，百公里加速仅需4.8s，0-50km/h加速仅需1.9s。</p><p>不得不说的是，MARVEL R采用的双档位电驱动系统是和保时捷&nbsp;<a href="http://db.auto.sina.com.cn/2408/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">Taycan</a><a href="http://db.auto.sina.com.cn/2408/peizhi/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">(配置</a><span style="color: rgb(1, 155, 121);">|询价)</span>同策略的电驱动系统，一档低速提升扭矩，二挡高速提升性能，在MARVEL R换挡时，主驱动电机依然可以驱动，不会出现动力中断的问题，使得换挡更加的平顺、高效。MARVEL R的电换挡机构体积小、效率还得到了提升，能够更好的实现性能和效率的完美结合，能够给用户带来媲美豪华跑车的驾驶体验。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/532/w820h512/20210326/674c-kmvwsvy2700089.png"></p><p>在电芯集成技术方面，MARVEL R 搭载了69.9kWh电池，而且通过一体式压铸托盘、双排16电芯大模组和203Ah高比能大容量电芯等先进的高集成设计，可以实现180Wh/kg的超高能量密度，可以确保MARVEL R 能够实现更加持久的续航表现。</p><p>如果说电池、电机已经特别优秀了，然而想要发挥出他们的最大能效，就一定需要高质量的电控系统。为此，MARVEL R采用了高效热泵技术，使得车辆在冬季的续航依旧有保障，就算室外温度-7°C，车内温度20°C的情况下，MARVEL R的iBooster热泵空调也能相比起传统空调提升15km的续航，而且随着环境温度的增高，优势会逐渐扩大。同时，MARVEL R的电池温控管理系统还采用了冷却液、铝合金鳞片以及远程电池预热技术，使得MARVEL R不管是在炎热的夏季还是寒冷的冬季，都能够保持良好的适应性，充电速度更快，续航更加持久。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/406/w763h443/20210326/1ffe-kmvwsvy2700098.png"></p><p><strong>安全为你保驾护航 更加完美的驾驶体验</strong></p><p>你以为仅仅如此吗？事实上，MARVEL R除了在性能和续航上下了功夫之外，安全性能也是MARVEL R所注重的属性之一。在设计之初，MARVEL R的电池就搭载了热失控管理技术，而且通过了360度电池协助碰撞测试，还按照美国UL-2580和ASIL D汽车电子电气最高安全标准设计，具备了行业内最高的IP69K等级防水，加上全车74%高强度结构钢占比，MARVEL R的安全性能等级毋庸置疑了。</p><p>除此之外，在保证了车辆的安全性能之外，MARVEL R也为广大车主朋友提升了智慧出行的驾驶体验，背靠上汽集团的资源优势，<a href="http://db.auto.sina.com.cn/b326.html?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">R汽车</a>拥有着极为深厚的技术储备，使得MARVEL R能够领先于同级汽车，获得更加完美的驾驶体验。</p><p><strong>强度与轻便共存 独特车身设计纵享丝滑</strong></p><p>MARVEL R采用了全球顶级水平的高强度车身设计，同时还保证了车辆的轻便性，MARVEL R的车身大量采用了铝合金材料，进一步降低了车身重量，为用户带来了更加灵活、轻便的驾驶体验，再加上50:50的前后轴荷比，让车身的重量分布更为均匀，在弯道驾驶时，更加的从容。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/322/w714h408/20210326/54bd-kmvwsvy2700091.png"></p><p>MARVEL R的车辆底盘也是全车亮点之一，它的前悬架采用了保时捷擅长调教的麦弗逊式前悬架结构，可以最大限度的平衡弯道中前、后车轮的滑移角度，让车辆实现更快的反应速度，从而大幅度提升了车辆的性能和操控极限，进一步避免了车辆出现转向不足或转向过度的现象，而底盘所采用的的铝合金材质悬架系统可以有效降低簧下重量，提升车辆的操控性和舒适性。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/610/w868h542/20210326/9c41-kmvwsvy2700090.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('6','智能汽车加速：牵手沃尔沃，亿咖通国际化战略又迈一大步','汽车','7','0',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ",null,null,null,'<p>	随着计算能力的提升，以及人工智能等新技术的发展，拥有百年历史的汽车产业迎来重大变革，智能汽车以及自动驾驶成为汽车未来发展共识。尤其是5G在全球开启商用，具有高稳定性、低延时等优势，并结合传感器、机器视觉、人工智能等新技术组合，将大大提升辅助驾驶、自动驾驶性能，进一步推动智能汽车落地。</p><p><img src="https://n.sinaimg.cn/sinakd10116/302/w1622h1080/20210325/6932-kmvwsvx9728492.jpg"></p><p>	从整车来看，<span style="color: rgb(25, 118, 232);">特斯拉</span>目前无疑是智能汽车最大赢家。尽管年销量不足50万台，营收、利润更是远远不及丰田、<span style="color: rgb(25, 118, 232);">大众</span>、通用等传统汽车厂商，但凭借科技技术给消费者带来出众的驾驶体验，特别是辅助驾驶功能得到市场认同，推动在资本市场屡创新高，曾一度突破8000亿美元大关，成全球最大汽车上市公司，当前市值6191亿美元。与此同时，围绕自动驾驶技术创新的初创企业，也得到了迅猛发展。以亿咖通科技来说，尽管是一家刚刚在2016年成立的汽车智能化科技公司，在今年2月获得超2亿美元A+轮融资，使得估值突破20亿美元，预示着资本市场对其进一步认可。当然，这背后展现出来的是其技术创新能力以及全球化的布局。</p><p>	同时，也涌现出理想、小鹏、<span style="color: rgb(25, 118, 232);">蔚来</span>等造车新势力跟随特斯拉脚步，同样受到广泛关注。在电动智能汽车大趋势背景下，<span style="color: rgb(25, 118, 232);">苹果</span>、华为、<span style="color: rgb(25, 118, 232);">百度</span>等科技巨头也涌入这条赛道。百度在今年早些时候组建了一家智能电动汽车公司，受到造车影响，在资本市场市值一度突破千亿美元大关。且赴港上市，人工智能成为百度新故事，自动驾驶是其人工智能落地重要赛道。</p><p><img src="https://n.sinaimg.cn/sinakd10116/637/w862h575/20210306/5008-kkxpcze1063640.png"></p><p>	首先，在汽车芯片、智能座舱、智能驾驶、高精度地图、大数据及车联网云平台等方面的研发投入，通过产品与服务的快速迭代，赋能车企创造更智能、安全的出行体验，还与百度Apollo、华为智慧出行等优秀合作伙伴建立了广泛的合作关系，以此推进智能网联功能与服务的应用。</p><p>	其次，通过国际化布局，将技术赋能全球车厂。早在去年底，亿咖通科技在瑞典哥德堡就成立欧洲总部及产品研发中心，这是迈出了国际化进程的重要一步。并与两家世界顶级科技公司<span style="color: rgb(25, 118, 232);">伟世通</span>、<span style="color: rgb(25, 118, 232);">高通</span>展开合作，共同开发广泛适用于全球市场的智能座舱解决方案。不仅进一步践行了其国际化战略布局，更充分展示了其世界级技术实力。</p><p><img src="https://n.sinaimg.cn/sinakd10116/88/w1080h608/20210325/a982-kmvwsvx9730700.jpg"></p><p>	如今，国际化进程再前进一步，与国际知名豪华汽车制造商沃尔沃汽车成立合资公司，联合开发适用全球市场的新一代车载智能操作系统。这是亿咖通科技在国际化战略进程中的又一里程碑事件。不仅将加速亿咖通科技与沃尔沃汽车集团的技术合作，提升成本效率，创造更多商业价值，也将进一步深化亿咖通科技的全球布局，加速国际化战略进程发展。</p><p>	“ 亿咖通科技致力于成为中国汽车智能科技的领导者，在汽车智能化技术领域拥有深厚的积累。合资公司的成立，是亿咖通科技国际化战略的又一重要举措。”亿咖通科技CEO沈子瑜对此表示。并指出与沃尔沃汽车的合作，整合双方技术优势，为全球用户带来行业领先的高品质智能座舱互联体验，并为双方未来的深度合作打下坚实基础。</p><p>	据了解，该合资公司将坐落在瑞典哥德堡，预计于2021年第三季度正式投入运营，由沃尔沃汽车在中国的研发负责人Jan-Erik Larsson出任CEO。此外，合资公司将开发具备全球市场的应用生态和服务能力的新一代车载智能操作系统，为用户提供更直观、更个性化、更高品质的智能交互体验。沃尔沃汽车集团会将此系统应用在旗下品牌新一代车型上。且这套系统还可以提供定制化的用户交互界面，以适配不同品牌车型。</p><p>	在今年早些时候，IDC所发布的2021年数字化汽车发展10大预测中谈到，汽车智能化、网联化、电动化的发展，使得汽车正在成为一个新兴的智能终端。在万物互联的时代，汽车将与其他智能终端设备实现互联互通，深刻改变交通出行体验。</p><p>	能看出智能汽车作为全球汽车产业发展方向，对各种新技术需求强劲，为围绕智能驾驶这条赛道上玩家释放出新机遇。不仅有亿咖通科技，图森未来目前已向<span style="color: rgb(25, 118, 232);">纳斯达克</span>递交了上市申请，有望成为自动驾驶第一股。还有作为面向智能驾驶AI芯片的<span style="color: rgb(25, 118, 232);">地平线</span>，今年更是频繁获得多轮融资，募集资金主要用于加速新一代L4/L5级汽车智能芯片的研发和商业化进程，以及建设开放共赢的合作伙伴生态。</p><p>	最后，汽车产业迎来了史上最大的技术变革，将会成为人们生活场景中最大智能设备。<span style="color: rgb(25, 118, 232);">谷歌</span>、百度、<span style="color: rgb(25, 118, 232);">优步</span>、滴滴等互联网巨头先后涉足汽车产业，以及在智能电动车方向，前有特斯拉的成功，后有理想、小鹏、蔚来等造车新势力，智能电动汽车受到市场青睐。</p><p>	此外，传统汽车厂商而言，将会更加积极拥抱科技厂商合作，以此提升智能驾驶体验。从行业发展前景来看，5G、人工智能、边缘智能等新技术成为推动行业发展的重要引擎，也推动智能汽车处在风口浪尖下，迎来了最好的发展时期。</p><p>	杨剑勇，福布斯专栏作家，并获得<span style="color: rgb(25, 118, 232);">网易</span>2020年度最具影响力奖，致力于深度解读5G、物联网经济和人工智能等前沿科技，观点和研究策略被众多权威媒体和知名企业引用。</p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('7','日产（中国）召回3179辆进口英菲尼迪FX35和FX45汽车','汽车','204','0',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ",null,null,null,'<p>日前，<a href="http://db.auto.sina.com.cn/b12.html?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(233, 71, 64);">日产</a>（中国）投资有限公司根据《缺陷汽车产品召回管理条例》和《缺陷汽车产品召回管理条例实施办法》的要求，向国家市场监督管理总局备案了召回计划。自2021年4月13日起，召回2007年4月10日至2008年10月17日生产的部分进口<a href="http://db.auto.sina.com.cn/b106.html?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(233, 71, 64);">英菲尼迪</a>FX35和FX45汽车，共计3179辆。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/700/w400h300/20210325/8565-kmvwsvx9682925.jpg"></p><p><br></p><p>本次召回范围内车辆，供应商生产过程中副驾安全气囊的气袋折叠宽度不一致。在气袋较窄的情况下气囊作动时气体发生器产生的气体流动路径受限，造成气袋内部压力异常提升，在极端高温环境（85℃）下气囊弹出作动时压力过大，气囊可能产生破损，无法达到设计预期的乘员保护性能，存在安全隐患。</p><p>日产（中国）投资有限公司将通过东风英菲尼迪汽车有限公司，对召回范围内车辆免费更换改善后的气囊模块，以消除安全隐患。</p><p>本次召回活动属于2016年8月16日发布的《日产（中国）投资有限公司召回部分进口英菲尼迪和日产风雅汽车》召回活动中的英菲尼迪FX35和FX45汽车的再次召回，此前召回活动使用的维修零件可能存在新的缺陷，因此需要再次更换。 日产（中国）投资有限公司将通过东风英菲尼迪汽车有限公司，以挂号信等形式通知相关车主召回事宜。</p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('8','日产（中国）召回3179辆进口英菲尼迪FX35和FX45汽车','汽车','413','0',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ",null,null,null,'<p>日前，<a href="http://db.auto.sina.com.cn/b12.html?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(233, 71, 64);">日产</a>（中国）投资有限公司根据《缺陷汽车产品召回管理条例》和《缺陷汽车产品召回管理条例实施办法》的要求，向国家市场监督管理总局备案了召回计划。自2021年4月13日起，召回2007年4月10日至2008年10月17日生产的部分进口<a href="http://db.auto.sina.com.cn/b106.html?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(233, 71, 64);">英菲尼迪</a>FX35和FX45汽车，共计3179辆。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/700/w400h300/20210325/8565-kmvwsvx9682925.jpg"></p><p><br></p><p>本次召回范围内车辆，供应商生产过程中副驾安全气囊的气袋折叠宽度不一致。在气袋较窄的情况下气囊作动时气体发生器产生的气体流动路径受限，造成气袋内部压力异常提升，在极端高温环境（85℃）下气囊弹出作动时压力过大，气囊可能产生破损，无法达到设计预期的乘员保护性能，存在安全隐患。</p><p>日产（中国）投资有限公司将通过东风英菲尼迪汽车有限公司，对召回范围内车辆免费更换改善后的气囊模块，以消除安全隐患。</p><p>本次召回活动属于2016年8月16日发布的《日产（中国）投资有限公司召回部分进口英菲尼迪和日产风雅汽车》召回活动中的英菲尼迪FX35和FX45汽车的再次召回，此前召回活动使用的维修零件可能存在新的缺陷，因此需要再次更换。 日产（中国）投资有限公司将通过东风英菲尼迪汽车有限公司，以挂号信等形式通知相关车主召回事宜。</p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('9','纯电汽车的性能内核 MARVEL R三电技术革新体验','汽车','312','0',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ",null,null,null,'<p>有这么一款智能汽车，集潮流感、时尚感、科技感、未来感于一身，众多黑科技加舒适的操作体验，它就是上汽R新推出的<a href="http://db.auto.sina.com.cn/4196/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">MARVEL R</a><a href="http://db.auto.sina.com.cn/4196/peizhi/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">(配置</a><span style="color: rgb(1, 155, 121);">|询价)</span>！作为汽车工业3.0时代里最为突出的一款"性能怪兽"，它酷炫的外观只是最简单最直观的体验，作为一款纯电动SUV汽车，MARVEL R真正的内核，在于"三电"技术的革新！</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/730/w960h570/20210326/0e37-kmvwsvy2700086.jpg"></p><p><strong>"三电"技术革新 性能升级</strong></p><p>评判一款电动汽车的优劣，最重要的就是"三电"技术这一指标，因为它直接就可以证明车辆的性能表现是否足够优秀。目前首先面世的MARVEL R标准版以及PRO版本采用了双电机后驱架构，车辆还配备了Hair-pin发卡绕组电机，额定功率达到了137kW，峰值扭矩为410N·m，对于用户的日常出行来说，这个配置可谓是有过之无不及了。如果用户对于车辆的性能有着更高的追求，还可以在MARVEL R PRO版车型的基础上，自行选装四驱澎湃性能包，可以获得三电极全轮驱动能力，其中Hair-pin发卡永磁同步电机将分别位于前后桥，百公里加速仅需4.8s，0-50km/h加速仅需1.9s。</p><p>不得不说的是，MARVEL R采用的双档位电驱动系统是和保时捷&nbsp;<a href="http://db.auto.sina.com.cn/2408/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">Taycan</a><a href="http://db.auto.sina.com.cn/2408/peizhi/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">(配置</a><span style="color: rgb(1, 155, 121);">|询价)</span>同策略的电驱动系统，一档低速提升扭矩，二挡高速提升性能，在MARVEL R换挡时，主驱动电机依然可以驱动，不会出现动力中断的问题，使得换挡更加的平顺、高效。MARVEL R的电换挡机构体积小、效率还得到了提升，能够更好的实现性能和效率的完美结合，能够给用户带来媲美豪华跑车的驾驶体验。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/532/w820h512/20210326/674c-kmvwsvy2700089.png"></p><p>在电芯集成技术方面，MARVEL R 搭载了69.9kWh电池，而且通过一体式压铸托盘、双排16电芯大模组和203Ah高比能大容量电芯等先进的高集成设计，可以实现180Wh/kg的超高能量密度，可以确保MARVEL R 能够实现更加持久的续航表现。</p><p>如果说电池、电机已经特别优秀了，然而想要发挥出他们的最大能效，就一定需要高质量的电控系统。为此，MARVEL R采用了高效热泵技术，使得车辆在冬季的续航依旧有保障，就算室外温度-7°C，车内温度20°C的情况下，MARVEL R的iBooster热泵空调也能相比起传统空调提升15km的续航，而且随着环境温度的增高，优势会逐渐扩大。同时，MARVEL R的电池温控管理系统还采用了冷却液、铝合金鳞片以及远程电池预热技术，使得MARVEL R不管是在炎热的夏季还是寒冷的冬季，都能够保持良好的适应性，充电速度更快，续航更加持久。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/406/w763h443/20210326/1ffe-kmvwsvy2700098.png"></p><p><strong>安全为你保驾护航 更加完美的驾驶体验</strong></p><p>你以为仅仅如此吗？事实上，MARVEL R除了在性能和续航上下了功夫之外，安全性能也是MARVEL R所注重的属性之一。在设计之初，MARVEL R的电池就搭载了热失控管理技术，而且通过了360度电池协助碰撞测试，还按照美国UL-2580和ASIL D汽车电子电气最高安全标准设计，具备了行业内最高的IP69K等级防水，加上全车74%高强度结构钢占比，MARVEL R的安全性能等级毋庸置疑了。</p><p>除此之外，在保证了车辆的安全性能之外，MARVEL R也为广大车主朋友提升了智慧出行的驾驶体验，背靠上汽集团的资源优势，<a href="http://db.auto.sina.com.cn/b326.html?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);">R汽车</a>拥有着极为深厚的技术储备，使得MARVEL R能够领先于同级汽车，获得更加完美的驾驶体验。</p><p><strong>强度与轻便共存 独特车身设计纵享丝滑</strong></p><p>MARVEL R采用了全球顶级水平的高强度车身设计，同时还保证了车辆的轻便性，MARVEL R的车身大量采用了铝合金材料，进一步降低了车身重量，为用户带来了更加灵活、轻便的驾驶体验，再加上50:50的前后轴荷比，让车身的重量分布更为均匀，在弯道驾驶时，更加的从容。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/322/w714h408/20210326/54bd-kmvwsvy2700091.png"></p><p>MARVEL R的车辆底盘也是全车亮点之一，它的前悬架采用了保时捷擅长调教的麦弗逊式前悬架结构，可以最大限度的平衡弯道中前、后车轮的滑移角度，让车辆实现更快的反应速度，从而大幅度提升了车辆的性能和操控极限，进一步避免了车辆出现转向不足或转向过度的现象，而底盘所采用的的铝合金材质悬架系统可以有效降低簧下重量，提升车辆的操控性和舒适性。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210326ac/610/w868h542/20210326/9c41-kmvwsvy2700090.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('10','日产汽车半个多世纪的创新造就12款经典纯电动车','汽车','249','0',"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ",null,null,null,'<p>作为现代人们生活不可或缺的一部分，汽车已经从传统的交通工具，转化成使人愉悦、令生活更自信、更有趣的多元化角色。而电动汽车的出现，将驾驶的乐趣进一步放大。得益于更加智能化的车载技术，电动汽车掀起了一场更为丰富的人类生活方式的变革。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/282/w620h462/20210326/456d-kmvwsvy2805867.jpg"></p><p>作为现代化电动汽车的先驱者，日产汽车（Nissan）根据时代的变迁和驾驶者需求的改变而不断创新，自1947年以来，陆续推出了纯电动车型、冰淇淋货车和机器人辅助副驾驶等电动化产品，满足消费者日益变化的多元化需求。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/106/w620h286/20210326/b981-kmvwsvy2805933.jpg"></p><p><strong>1947年，日产汽车推出第一款纯电动车型Tama</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/6/w620h186/20210326/8e45-kmvwsvy2805929.jpg"></p><p>电动汽车并不是一个新生事物。早年由于日本国内石油短缺，而水电能源相对充足，日本政府便号召企业在水电能源领域进行研究和开发。日产汽车的工程师们以此为目标开展了Tama电动汽车的研发。</p><p>作为日产汽车旗下的第一款纯电动车型，1947年发布的Tama纯电动汽车搭载了可更换的铅酸电池，最高时速可达35.2公里，续航里程为96.3公里，主要供出租车公司使用。这些参数按照如今的标准来看并不突出，但在当时，Tama纯电动汽车是政府试验中表现最好的车型。1950年，由于石油供应趋向稳定，Tama停产，但日产汽车的电动化技术研究就此展开。</p><p><strong>1996年，日产汽车推出全球第一台使用锂离子电池驱动的日产Prairie Joy电动汽车</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/29/w620h209/20210326/41a3-kmvwsvy2805986.jpg"></p><p>作为全球首款搭载圆柱型锂离子电池的电动汽车，日产Prairie Joy电动车在地球上最具挑战性的环境之一——北极路面上证明它的实用性。日本国家极地研究所（National Institute of Polar Research）在极端严酷的环境中，使用日产Prairie Joy电动汽车达6年之久，并且没有出现任何电池故障。同时，由于日产Prairie Joy电动汽车的静谧性和零排放等特点，研究人员还将其用来近距离观察野生动物。在正常行驶条件下，日产Prairie Joy电动汽车的续航里程为200公里，最高时速可达120公里/小时。日产Prairie Joy电动汽车在日本累计销售了30台。</p><p><strong>2000年，推出令人瞩目的日产Hypermini电动汽车</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/219/w620h399/20210326/e086-kmvwsvy2805987.jpg"></p><p>作为一款可搭载两名乘员的城市通勤车，日产Hypermini为电动汽车带来了全新突破。凭借时尚而独特的设计，日产Hypermini电动汽车出现在好莱坞电影《过夜》 （Sleepover）和《公主日记2》（The Princess Diaries 2）中。这款车型在钕磁铁电动机的同步牵引下，最高时速可达100公里，单次充电续航里程达到115公里。</p><p>日产Hypermini电动汽车获得了日本新能源基金会（New Energy Foundation）颁发的新能源大奖（New Energy Grand Prize）和日本设计振兴研究所（Japan Institute for Design Promotion）颁发的优秀设计奖（Good Design Award）。在当时创新性的无钥匙进入系统也使其成为从横滨到加州大学戴维斯分校的汽车共享试点项目的首选车辆。</p><p><strong>2005年，日产Pivo纯电动概念车掀起电动出行新概念</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/62/w620h242/20210326/071f-kmvwsvy2806047.jpg"></p><p>作为在2005年东京车展上亮相的新一代概念车型，日产Pivo纯电动概念车的气泡式驾驶舱吸引了人们的注意，它是第一款由轻型、紧凑的复合锂离子电池驱动的汽车。由村上隆（Takashi Murakami）所设计的可爱的“代言人”——娃娃Pivo-Chan也备受欢迎。</p><p>日产Pivo纯电动概念车专为年轻的都市女性设计，是她们日常生活代步的理想车型。驾驶舱可载乘三人，并可以向任意方向旋转。倒车时可以直接将驾驶舱调转，开往另一个方向。典型的日产设计特色包括位于方向盘上可一键操作的声音控制系统和全球定位系统，使驾驶时具有更高的安全性。前挡风玻璃两侧的监视器可以显示车辆周边区域，以减少视觉盲区带来的危险。日产Pivo纯电动概念车还具有全方位视频监控功能，这是全景智能监控（Intelligent Around View Monitor）的早期版本，现已应用于多款日产车型上。</p><p><strong>2007年，第2代日产Pivo&nbsp;纯电动概念车作为城市通勤电动车型亮相，使驾驶变得更自信</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/102/w620h282/20210326/b38e-kmvwsvy2806046.jpg"></p><p>有研究表明，带着积极的心态和愉快的心情驾驶车辆，可有效降低交通事故的概率。第2代日产Pivo 纯电动概念车是对这项研究的有力证明。该车型搭载了车载机器人系统（Robotic Agent system），能够实时监控驾驶状况，并使用语音和手势帮助驾驶员保持愉悦的心情。</p><p>同时，四轮独立控制系统有助于车辆在加速或转弯过程中最大限度地减少侧倾，从而提高了安全性。车轮甚至可以转动90度，更容易侧向驶入停车位置。</p><p><strong>2010年，日产</strong><a href="http://db.auto.sina.com.cn/831/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>聆风</strong></a><strong>（Nissan LEAF）真正将电动汽车带入人们的生活</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/21/w620h201/20210326/b76a-kmvwsvy2806090.jpg"></p><p>作为日产汽车第一款量产纯电动车型，日产聆风是电动化出行的里程碑，迄今为止，全球销售量已超过50万辆。</p><p>日产聆风成功的关键在于将数十年来的研发与消费者的需求进行了完美的结合。第一代日产聆风续航里程为200公里，对于许多首次购买电动汽车的消费者来说，这是一个实用的选择。日产聆风还开启了将电动汽车作为移动电源的创新理念。</p><p>2016年，在一次纪念活动中，一辆特殊的日产聆风被创造出来。它能探测到驾驶员的脑电波，在驾校的教学中，被监测到的驾驶员脑电波信息也会以卡通音效的形式投射在车身，用于辅助教学。</p><p><strong>2010年，日产New Mobility&nbsp;概念车型诞生，利用电动汽车技术解决社会问题</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/44/w620h224/20210326/ed2a-kmvwsvy2806089.jpg"></p><p>随着发达国家人口老龄化和独子家庭数量的增长，更短的旅行以及更少的乘客将成为广泛的出行需求。为了满足这些需求，日产推出了日产New Mobility概念车型。这是一款具有摩托车的机动性和汽车的稳定性，对用户友好、超紧凑、100%零排放的电动车型。</p><p>彼时，日本横滨市已经将这些想法付诸实践。Choimobi Yokohama是一项以双座电动汽车为特色的往返汽车共享计划，它让游客的出行和生活更方便，并通过此振兴了当地社区。作为回报，该计划让首次驾驶者体验到了超紧凑型电动汽车的乐趣和便利。</p><p><strong>2014年，日产发布首款量产纯电动商务车型--e-NV200</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/38/w620h218/20210326/51eb-kmvwsvy2806194.jpg"></p><p>你有过从电动汽车上购买冰淇淋的体验吗？如果在英国，你可能见过Mackie的全电动冰激凌售货车，它是基于日产的第一款零排放轻型商务车e-NV200设计的。</p><p>在欧洲和日本上市的日产e-NV200纯电动车型可以提供如NV200 Vanette一般的宽敞空间和多功能，并配有安静、强大的电传动系统。液压再生制动系统可使车辆在满电情况下行驶190公里。此外，日产e-NV200纯电动车型还有配有移动电源的功能，配有电源插座，可用于灾后救援、户外路演活动，乃至冰淇淋制作等。</p><p><strong>2017年，全新日产聆风助力日产电动汽车更上一层楼</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/27/w620h207/20210326/e95a-kmvwsvy2806195.jpg"></p><p>2017年，全新日产聆风面世。 全新一代聆风具备更强劲的加速性能、更轻便的操控性，续航里程大幅提升，单次充电续航里程可达400公里。 同时，全新日产聆风还配备了先进的自动驾驶辅助系统——ProPILOT超智驾、ProPILOT Park智控泊车系统，以及帮助驾驶员实现单踏板加速、减速以及制动的e-Pedal一体化智控踏板。</p><p>2019年，日产聆风e+首先搭载了新开发的电动动力系统，在动力和续航里程方面得到大幅提升。同时，配备了62千瓦时电池，使续航里程提高了40%。</p><p>作为日产电动汽车创新思维的展示，全新日产聆风成为了新创意的实践平台。日产聆风Dream Drive技术创新地模仿了内燃机运转时富有节奏感的声音，可帮助车上的孩子入睡。2019年，一辆全新日产聆风被装扮成一棵圣诞树，使用车载电池点亮了挂在车身上的数百个灯泡，显示了能源再生系统的利用价值。</p><p><strong>2018年，日产</strong><a href="http://db.auto.sina.com.cn/428/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>轩逸</strong></a><a href="http://db.auto.sina.com.cn/428/peizhi/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>(配置</strong></a><strong style="color: rgb(1, 155, 121);">|询价)</strong><strong>·纯电登场满足中国消费者需求</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/27/w620h207/20210326/d2bc-kmvwsvy2806282.jpg"></p><p>轩逸是日产在华最受欢迎的乘用车。轩逸·纯电是日产汽车第一款专为中国消费者打造的纯电动车型，并且在中国生产制造。基于日产聆风的核心技术，轩逸·纯电将电池移至座椅下方，使车辆更具稳定性和可靠性，长轴距为车辆提供了宽敞的驾驶室和腿部空间，338公里续航里程有效满足了消费者的需求。</p><p><strong>2019年，日产IMk纯电动概念车开创了下一代驾驶员支持技术</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/230/w620h410/20210326/fd9f-kmvwsvy2806284.jpg"></p><p>在2019年东京车展上亮相的日产IMk纯电动概念车，基于传统微型车（KeiCar）车身尺寸和全新的电动汽车平台打造，拥有强劲、平稳和静谧的驾驶支持系统，满足城市街道和高速公路的出行需求。日产IMk纯电动概念车专为智能网联而设计，将驾驶员与外界无缝连接。</p><p><strong>2020年，日产</strong><a href="http://db.auto.sina.com.cn/3758/?c=spr_auto_trackid_1e17744b130ea936" rel="noopener noreferrer" target="_blank" style="color: rgb(1, 155, 121);"><strong>Ariya</strong></a><strong>让驾驶变得更激情、更自信、更舒适、更互联</strong></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/28/w620h208/20210326/349c-kmvwsvy2806332.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article_type` values ('1','100','汽车','0',null,null,null,"2022-05-15 06:37:30.000 ","2022-05-15 06:37:30.000 ");
