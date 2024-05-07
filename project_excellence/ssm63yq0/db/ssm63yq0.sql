-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: ssm63yq0
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ssm63yq0`
--

/*!40000 DROP DATABASE IF EXISTS `ssm63yq0`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ssm63yq0` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ssm63yq0`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg'),(2,'picture2','upload/picture2.jpg'),(3,'picture3','upload/picture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiangchengdengji`
--

DROP TABLE IF EXISTS `jiangchengdengji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiangchengdengji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `jiangchengyuanyin` longtext COMMENT '奖惩原因',
  `jiangchengneirong` longtext COMMENT '奖惩内容',
  `jiangchengriqi` date DEFAULT NULL COMMENT '奖惩日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COMMENT='奖惩登记';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiangchengdengji`
--

LOCK TABLES `jiangchengdengji` WRITE;
/*!40000 ALTER TABLE `jiangchengdengji` DISABLE KEYS */;
INSERT INTO `jiangchengdengji` VALUES (161,'2022-04-27 15:22:30','教师账号1','教师姓名1','学号1','姓名1','奖励','奖惩原因1','奖惩内容1','2022-04-27'),(162,'2022-04-27 15:22:30','教师账号2','教师姓名2','学号2','姓名2','奖励','奖惩原因2','奖惩内容2','2022-04-27'),(163,'2022-04-27 15:22:30','教师账号3','教师姓名3','学号3','姓名3','奖励','奖惩原因3','奖惩内容3','2022-04-27'),(164,'2022-04-27 15:22:30','教师账号4','教师姓名4','学号4','姓名4','奖励','奖惩原因4','奖惩内容4','2022-04-27'),(165,'2022-04-27 15:22:30','教师账号5','教师姓名5','学号5','姓名5','奖励','奖惩原因5','奖惩内容5','2022-04-27'),(166,'2022-04-27 15:22:30','教师账号6','教师姓名6','学号6','姓名6','奖励','奖惩原因6','奖惩内容6','2022-04-27');
/*!40000 ALTER TABLE `jiangchengdengji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaoshi`
--

DROP TABLE IF EXISTS `jiaoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshizhanghao` varchar(200) NOT NULL COMMENT '教师账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) NOT NULL COMMENT '教师姓名',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaoshizhanghao` (`jiaoshizhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoshi`
--

LOCK TABLES `jiaoshi` WRITE;
/*!40000 ALTER TABLE `jiaoshi` DISABLE KEYS */;
INSERT INTO `jiaoshi` VALUES (21,'2022-04-27 15:22:29','教师账号1','123456','教师姓名1',1,'男','13823888881','upload/jiaoshi_zhaopian1.jpg'),(22,'2022-04-27 15:22:29','教师账号2','123456','教师姓名2',2,'男','13823888882','upload/jiaoshi_zhaopian2.jpg'),(23,'2022-04-27 15:22:29','教师账号3','123456','教师姓名3',3,'男','13823888883','upload/jiaoshi_zhaopian3.jpg'),(24,'2022-04-27 15:22:29','教师账号4','123456','教师姓名4',4,'男','13823888884','upload/jiaoshi_zhaopian4.jpg'),(25,'2022-04-27 15:22:29','教师账号5','123456','教师姓名5',5,'男','13823888885','upload/jiaoshi_zhaopian5.jpg'),(26,'2022-04-27 15:22:29','教师账号6','123456','教师姓名6',6,'男','13823888886','upload/jiaoshi_zhaopian6.jpg');
/*!40000 ALTER TABLE `jiaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaoshishenqingjiaoshi`
--

DROP TABLE IF EXISTS `jiaoshishenqingjiaoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaoshishenqingjiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shenqingbianhao` varchar(200) DEFAULT NULL COMMENT '申请编号',
  `jiaoshimingcheng` varchar(200) DEFAULT NULL COMMENT '教室名称',
  `shiyongshijian` varchar(200) NOT NULL COMMENT '使用时间',
  `yongtu` longtext NOT NULL COMMENT '用途',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shenqingbianhao` (`shenqingbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='教师申请教室';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoshishenqingjiaoshi`
--

LOCK TABLES `jiaoshishenqingjiaoshi` WRITE;
/*!40000 ALTER TABLE `jiaoshishenqingjiaoshi` DISABLE KEYS */;
INSERT INTO `jiaoshishenqingjiaoshi` VALUES (51,'2022-04-27 15:22:30','1111111111','教室名称1','使用时间1','用途1','教师账号1','教师姓名1','是',''),(52,'2022-04-27 15:22:30','2222222222','教室名称2','使用时间2','用途2','教师账号2','教师姓名2','是',''),(53,'2022-04-27 15:22:30','3333333333','教室名称3','使用时间3','用途3','教师账号3','教师姓名3','是',''),(54,'2022-04-27 15:22:30','4444444444','教室名称4','使用时间4','用途4','教师账号4','教师姓名4','是',''),(55,'2022-04-27 15:22:30','5555555555','教室名称5','使用时间5','用途5','教师账号5','教师姓名5','是',''),(56,'2022-04-27 15:22:30','6666666666','教室名称6','使用时间6','用途6','教师账号6','教师姓名6','是','');
/*!40000 ALTER TABLE `jiaoshishenqingjiaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaoshixinxi`
--

DROP TABLE IF EXISTS `jiaoshixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaoshixinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshibianhao` varchar(200) NOT NULL COMMENT '教室编号',
  `jiaoshimingcheng` varchar(200) DEFAULT NULL COMMENT '教室名称',
  `jiaoshitupian` varchar(200) NOT NULL COMMENT '教室图片',
  `jiaoshiweizhi` varchar(200) DEFAULT NULL COMMENT '教室位置',
  `jiaoshixiangqing` longtext COMMENT '教室详情',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaoshibianhao` (`jiaoshibianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='教室信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoshixinxi`
--

LOCK TABLES `jiaoshixinxi` WRITE;
/*!40000 ALTER TABLE `jiaoshixinxi` DISABLE KEYS */;
INSERT INTO `jiaoshixinxi` VALUES (31,'2022-04-27 15:22:29','教室编号1','教室名称1','upload/jiaoshixinxi_jiaoshitupian1.jpg','教室位置1','教室详情1','2022-04-27 23:22:29',1,1),(32,'2022-04-27 15:22:29','教室编号2','教室名称2','upload/jiaoshixinxi_jiaoshitupian2.jpg','教室位置2','教室详情2','2022-04-27 23:22:29',2,2),(33,'2022-04-27 15:22:29','教室编号3','教室名称3','upload/jiaoshixinxi_jiaoshitupian3.jpg','教室位置3','教室详情3','2022-04-27 23:22:29',3,3),(34,'2022-04-27 15:22:29','教室编号4','教室名称4','upload/jiaoshixinxi_jiaoshitupian4.jpg','教室位置4','教室详情4','2022-04-27 23:22:29',4,4),(35,'2022-04-27 15:22:29','教室编号5','教室名称5','upload/jiaoshixinxi_jiaoshitupian5.jpg','教室位置5','教室详情5','2022-04-27 23:22:29',5,5),(36,'2022-04-27 15:22:29','教室编号6','教室名称6','upload/jiaoshixinxi_jiaoshitupian6.jpg','教室位置6','教室详情6','2022-04-27 23:22:29',6,6);
/*!40000 ALTER TABLE `jiaoshixinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaoxuefankui`
--

DROP TABLE IF EXISTS `jiaoxuefankui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaoxuefankui` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fankuibianhao` varchar(200) DEFAULT NULL COMMENT '反馈编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `pingjiakecheng` varchar(200) DEFAULT NULL COMMENT '评价课程',
  `jiaoxuezhiliang` varchar(200) DEFAULT NULL COMMENT '教学质量',
  `manyichengdu` varchar(200) DEFAULT NULL COMMENT '满意程度',
  `pingjiashijian` datetime DEFAULT NULL COMMENT '评价时间',
  `fankuineirong` longtext COMMENT '反馈内容',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fankuibianhao` (`fankuibianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COMMENT='教学反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoxuefankui`
--

LOCK TABLES `jiaoxuefankui` WRITE;
/*!40000 ALTER TABLE `jiaoxuefankui` DISABLE KEYS */;
INSERT INTO `jiaoxuefankui` VALUES (131,'2022-04-27 15:22:30','1111111111','课程名称1','教师账号1','教师姓名1','★','★','满意','2022-04-27 23:22:30','反馈内容1','学号1','姓名1'),(132,'2022-04-27 15:22:30','2222222222','课程名称2','教师账号2','教师姓名2','★','★','满意','2022-04-27 23:22:30','反馈内容2','学号2','姓名2'),(133,'2022-04-27 15:22:30','3333333333','课程名称3','教师账号3','教师姓名3','★','★','满意','2022-04-27 23:22:30','反馈内容3','学号3','姓名3'),(134,'2022-04-27 15:22:30','4444444444','课程名称4','教师账号4','教师姓名4','★','★','满意','2022-04-27 23:22:30','反馈内容4','学号4','姓名4'),(135,'2022-04-27 15:22:30','5555555555','课程名称5','教师账号5','教师姓名5','★','★','满意','2022-04-27 23:22:30','反馈内容5','学号5','姓名5'),(136,'2022-04-27 15:22:30','6666666666','课程名称6','教师账号6','教师姓名6','★','★','满意','2022-04-27 23:22:30','反馈内容6','学号6','姓名6');
/*!40000 ALTER TABLE `jiaoxuefankui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechengchengji`
--

DROP TABLE IF EXISTS `kechengchengji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechengchengji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `kechengfenshu` float DEFAULT NULL COMMENT '课程分数',
  `pingyu` longtext COMMENT '评语',
  `pingfenriqi` date DEFAULT NULL COMMENT '评分日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='课程成绩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengchengji`
--

LOCK TABLES `kechengchengji` WRITE;
/*!40000 ALTER TABLE `kechengchengji` DISABLE KEYS */;
INSERT INTO `kechengchengji` VALUES (101,'2022-04-27 15:22:30','课程名称1','教师账号1','教师姓名1','学号1','姓名1',1,'评语1','2022-04-27'),(102,'2022-04-27 15:22:30','课程名称2','教师账号2','教师姓名2','学号2','姓名2',2,'评语2','2022-04-27'),(103,'2022-04-27 15:22:30','课程名称3','教师账号3','教师姓名3','学号3','姓名3',3,'评语3','2022-04-27'),(104,'2022-04-27 15:22:30','课程名称4','教师账号4','教师姓名4','学号4','姓名4',4,'评语4','2022-04-27'),(105,'2022-04-27 15:22:30','课程名称5','教师账号5','教师姓名5','学号5','姓名5',5,'评语5','2022-04-27'),(106,'2022-04-27 15:22:30','课程名称6','教师账号6','教师姓名6','学号6','姓名6',6,'评语6','2022-04-27');
/*!40000 ALTER TABLE `kechengchengji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechengfenlei`
--

DROP TABLE IF EXISTS `kechengfenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechengfenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengfenlei` varchar(200) DEFAULT NULL COMMENT '课程分类',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kechengfenlei` (`kechengfenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='课程分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengfenlei`
--

LOCK TABLES `kechengfenlei` WRITE;
/*!40000 ALTER TABLE `kechengfenlei` DISABLE KEYS */;
INSERT INTO `kechengfenlei` VALUES (61,'2022-04-27 15:22:30','课程分类1'),(62,'2022-04-27 15:22:30','课程分类2'),(63,'2022-04-27 15:22:30','课程分类3'),(64,'2022-04-27 15:22:30','课程分类4'),(65,'2022-04-27 15:22:30','课程分类5'),(66,'2022-04-27 15:22:30','课程分类6');
/*!40000 ALTER TABLE `kechengfenlei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechengxinxi`
--

DROP TABLE IF EXISTS `kechengxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechengxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengbianhao` varchar(200) DEFAULT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `kechengfenlei` varchar(200) DEFAULT NULL COMMENT '课程分类',
  `kaikeshijian` datetime DEFAULT NULL COMMENT '开课时间',
  `jieshushijian` datetime DEFAULT NULL COMMENT '结束时间',
  `kechengneirong` longtext COMMENT '课程内容',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kechengbianhao` (`kechengbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='课程信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengxinxi`
--

LOCK TABLES `kechengxinxi` WRITE;
/*!40000 ALTER TABLE `kechengxinxi` DISABLE KEYS */;
INSERT INTO `kechengxinxi` VALUES (81,'2022-04-27 15:22:30','1111111111','课程名称1','班级1','课程分类1','2022-04-27 23:22:30','2022-04-27 23:22:30','课程内容1','upload/kechengxinxi_fengmian1.jpg','教师账号1','教师姓名1'),(82,'2022-04-27 15:22:30','2222222222','课程名称2','班级2','课程分类2','2022-04-27 23:22:30','2022-04-27 23:22:30','课程内容2','upload/kechengxinxi_fengmian2.jpg','教师账号2','教师姓名2'),(83,'2022-04-27 15:22:30','3333333333','课程名称3','班级3','课程分类3','2022-04-27 23:22:30','2022-04-27 23:22:30','课程内容3','upload/kechengxinxi_fengmian3.jpg','教师账号3','教师姓名3'),(84,'2022-04-27 15:22:30','4444444444','课程名称4','班级4','课程分类4','2022-04-27 23:22:30','2022-04-27 23:22:30','课程内容4','upload/kechengxinxi_fengmian4.jpg','教师账号4','教师姓名4'),(85,'2022-04-27 15:22:30','5555555555','课程名称5','班级5','课程分类5','2022-04-27 23:22:30','2022-04-27 23:22:30','课程内容5','upload/kechengxinxi_fengmian5.jpg','教师账号5','教师姓名5'),(86,'2022-04-27 15:22:30','6666666666','课程名称6','班级6','课程分类6','2022-04-27 23:22:30','2022-04-27 23:22:30','课程内容6','upload/kechengxinxi_fengmian6.jpg','教师账号6','教师姓名6');
/*!40000 ALTER TABLE `kechengxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2022-04-27 15:22:30','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"学生\",\"menuJump\":\"列表\",\"tableName\":\"xuesheng\"}],\"menu\":\"学生管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-qrcode\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"教师\",\"menuJump\":\"列表\",\"tableName\":\"jiaoshi\"}],\"menu\":\"教师管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"教室信息\",\"menuJump\":\"列表\",\"tableName\":\"jiaoshixinxi\"}],\"menu\":\"教室信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\",\"删除\",\"审核\"],\"menu\":\"学生申请教室\",\"menuJump\":\"列表\",\"tableName\":\"xueshengshenqingjiaoshi\"}],\"menu\":\"学生申请教室管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-medal\",\"buttons\":[\"查看\",\"删除\",\"审核\"],\"menu\":\"教师申请教室\",\"menuJump\":\"列表\",\"tableName\":\"jiaoshishenqingjiaoshi\"}],\"menu\":\"教师申请教室管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-medal\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"课程分类\",\"menuJump\":\"列表\",\"tableName\":\"kechengfenlei\"}],\"menu\":\"课程分类管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"社团申请\",\"menuJump\":\"列表\",\"tableName\":\"shetuanshenqing\"}],\"menu\":\"社团申请管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-wenzi\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"打印\",\"导出\"],\"menu\":\"课程信息\",\"menuJump\":\"列表\",\"tableName\":\"kechengxinxi\"}],\"menu\":\"课程信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goodsnew\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"课程成绩\"],\"menu\":\"学生选课\",\"menuJump\":\"列表\",\"tableName\":\"xueshengxuanke\"}],\"menu\":\"学生选课管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"删除\",\"查看\",\"打印\",\"导出\"],\"menu\":\"课程成绩\",\"menuJump\":\"列表\",\"tableName\":\"kechengchengji\"}],\"menu\":\"课程成绩管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goodsnew\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"学生成绩\",\"menuJump\":\"列表\",\"tableName\":\"xueshengchengji\"}],\"menu\":\"学生成绩管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"学生请假\",\"menuJump\":\"列表\",\"tableName\":\"xueshengqingjia\"}],\"menu\":\"学生请假管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"删除\",\"查看\"],\"menu\":\"教学反馈\",\"menuJump\":\"列表\",\"tableName\":\"jiaoxuefankui\"}],\"menu\":\"教学反馈管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"删除\",\"查看\",\"打印\",\"导出\"],\"menu\":\"心理报告\",\"menuJump\":\"列表\",\"tableName\":\"xinlibaogao\"}],\"menu\":\"心理报告管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"删除\",\"查看\",\"打印\",\"导出\"],\"menu\":\"体检报告\",\"menuJump\":\"列表\",\"tableName\":\"tijianbaogao\"}],\"menu\":\"体检报告管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"奖惩登记\",\"menuJump\":\"列表\",\"tableName\":\"jiangchengdengji\"}],\"menu\":\"奖惩登记管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"查看\",\"编辑名称\",\"编辑父级\",\"删除\"],\"menu\":\"菜单列表\",\"tableName\":\"menu\"}],\"menu\":\"系统管理\"}],\"frontMenu\":[],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"学生申请\"],\"menu\":\"教室信息\",\"menuJump\":\"列表\",\"tableName\":\"jiaoshixinxi\"}],\"menu\":\"教室信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"学生申请教室\",\"menuJump\":\"列表\",\"tableName\":\"xueshengshenqingjiaoshi\"}],\"menu\":\"学生申请教室管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"社团申请\",\"menuJump\":\"列表\",\"tableName\":\"shetuanshenqing\"}],\"menu\":\"社团申请管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-wenzi\",\"buttons\":[\"查看\",\"学生选课\",\"打印\",\"导出\"],\"menu\":\"课程信息\",\"menuJump\":\"列表\",\"tableName\":\"kechengxinxi\"}],\"menu\":\"课程信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goodsnew\",\"buttons\":[\"查看\"],\"menu\":\"学生选课\",\"menuJump\":\"列表\",\"tableName\":\"xueshengxuanke\"}],\"menu\":\"学生选课管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"查看\",\"教学反馈\",\"打印\",\"导出\"],\"menu\":\"课程成绩\",\"menuJump\":\"列表\",\"tableName\":\"kechengchengji\"}],\"menu\":\"课程成绩管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goodsnew\",\"buttons\":[\"查看\"],\"menu\":\"学生成绩\",\"menuJump\":\"列表\",\"tableName\":\"xueshengchengji\"}],\"menu\":\"学生成绩管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"学生请假\",\"menuJump\":\"列表\",\"tableName\":\"xueshengqingjia\"}],\"menu\":\"学生请假管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"教学反馈\",\"menuJump\":\"列表\",\"tableName\":\"jiaoxuefankui\"}],\"menu\":\"教学反馈管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\",\"打印\",\"导出\"],\"menu\":\"心理报告\",\"menuJump\":\"列表\",\"tableName\":\"xinlibaogao\"}],\"menu\":\"心理报告管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"查看\",\"打印\",\"导出\"],\"menu\":\"体检报告\",\"menuJump\":\"列表\",\"tableName\":\"tijianbaogao\"}],\"menu\":\"体检报告管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"查看\"],\"menu\":\"奖惩登记\",\"menuJump\":\"列表\",\"tableName\":\"jiangchengdengji\"}],\"menu\":\"奖惩登记管理\"}],\"frontMenu\":[],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"学生\",\"tableName\":\"xuesheng\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"学生\",\"menuJump\":\"列表\",\"tableName\":\"xuesheng\"}],\"menu\":\"学生管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"教师申请\"],\"menu\":\"教室信息\",\"menuJump\":\"列表\",\"tableName\":\"jiaoshixinxi\"}],\"menu\":\"教室信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-medal\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"教师申请教室\",\"menuJump\":\"列表\",\"tableName\":\"jiaoshishenqingjiaoshi\"}],\"menu\":\"教师申请教室管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\",\"删除\",\"审核\"],\"menu\":\"社团申请\",\"menuJump\":\"列表\",\"tableName\":\"shetuanshenqing\"}],\"menu\":\"社团申请管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-wenzi\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"打印\",\"导出\"],\"menu\":\"课程信息\",\"menuJump\":\"列表\",\"tableName\":\"kechengxinxi\"}],\"menu\":\"课程信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goodsnew\",\"buttons\":[\"查看\",\"删除\",\"审核\",\"课程成绩\"],\"menu\":\"学生选课\",\"menuJump\":\"列表\",\"tableName\":\"xueshengxuanke\"}],\"menu\":\"学生选课管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"打印\",\"导出\"],\"menu\":\"课程成绩\",\"menuJump\":\"列表\",\"tableName\":\"kechengchengji\"}],\"menu\":\"课程成绩管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goodsnew\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"学生成绩\",\"menuJump\":\"列表\",\"tableName\":\"xueshengchengji\"}],\"menu\":\"学生成绩管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"查看\",\"删除\",\"审核\"],\"menu\":\"学生请假\",\"menuJump\":\"列表\",\"tableName\":\"xueshengqingjia\"}],\"menu\":\"学生请假管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\"],\"menu\":\"教学反馈\",\"menuJump\":\"列表\",\"tableName\":\"jiaoxuefankui\"}],\"menu\":\"教学反馈管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"打印\",\"导出\"],\"menu\":\"心理报告\",\"menuJump\":\"列表\",\"tableName\":\"xinlibaogao\"}],\"menu\":\"心理报告管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"打印\",\"导出\"],\"menu\":\"体检报告\",\"menuJump\":\"列表\",\"tableName\":\"tijianbaogao\"}],\"menu\":\"体检报告管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"奖惩登记\",\"menuJump\":\"列表\",\"tableName\":\"jiangchengdengji\"}],\"menu\":\"奖惩登记管理\"}],\"frontMenu\":[],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"教师\",\"tableName\":\"jiaoshi\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shetuanshenqing`
--

DROP TABLE IF EXISTS `shetuanshenqing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shetuanshenqing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shenqingbianhao` varchar(200) DEFAULT NULL COMMENT '申请编号',
  `shetuanmingcheng` varchar(200) DEFAULT NULL COMMENT '社团名称',
  `shenqingziliao` varchar(200) DEFAULT NULL COMMENT '申请资料',
  `shenqingshijian` datetime DEFAULT NULL COMMENT '申请时间',
  `shenqingliyou` longtext COMMENT '申请理由',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shenqingbianhao` (`shenqingbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='社团申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shetuanshenqing`
--

LOCK TABLES `shetuanshenqing` WRITE;
/*!40000 ALTER TABLE `shetuanshenqing` DISABLE KEYS */;
INSERT INTO `shetuanshenqing` VALUES (71,'2022-04-27 15:22:30','1111111111','社团名称1','','2022-04-27 23:22:30','申请理由1','学号1','姓名1','手机1','教师账号1','教师姓名1','是',''),(72,'2022-04-27 15:22:30','2222222222','社团名称2','','2022-04-27 23:22:30','申请理由2','学号2','姓名2','手机2','教师账号2','教师姓名2','是',''),(73,'2022-04-27 15:22:30','3333333333','社团名称3','','2022-04-27 23:22:30','申请理由3','学号3','姓名3','手机3','教师账号3','教师姓名3','是',''),(74,'2022-04-27 15:22:30','4444444444','社团名称4','','2022-04-27 23:22:30','申请理由4','学号4','姓名4','手机4','教师账号4','教师姓名4','是',''),(75,'2022-04-27 15:22:30','5555555555','社团名称5','','2022-04-27 23:22:30','申请理由5','学号5','姓名5','手机5','教师账号5','教师姓名5','是',''),(76,'2022-04-27 15:22:30','6666666666','社团名称6','','2022-04-27 23:22:30','申请理由6','学号6','姓名6','手机6','教师账号6','教师姓名6','是','');
/*!40000 ALTER TABLE `shetuanshenqing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  `type` varchar(200) DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tijianbaogao`
--

DROP TABLE IF EXISTS `tijianbaogao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tijianbaogao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `baogaodanhao` varchar(200) DEFAULT NULL COMMENT '报告单号',
  `tijianxiangmu` varchar(200) DEFAULT NULL COMMENT '体检项目',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `shengao` varchar(200) DEFAULT NULL COMMENT '身高',
  `tizhong` varchar(200) DEFAULT NULL COMMENT '体重',
  `xuetang` varchar(200) DEFAULT NULL COMMENT '血糖',
  `tijianbaogao` varchar(200) DEFAULT NULL COMMENT '体检报告',
  `jianyi` longtext COMMENT '建议',
  `dengjishijian` datetime DEFAULT NULL COMMENT '登记时间',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `baogaodanhao` (`baogaodanhao`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='体检报告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tijianbaogao`
--

LOCK TABLES `tijianbaogao` WRITE;
/*!40000 ALTER TABLE `tijianbaogao` DISABLE KEYS */;
INSERT INTO `tijianbaogao` VALUES (151,'2022-04-27 15:22:30','1111111111','体检项目1','学号1','姓名1','身高1','体重1','血糖1','','建议1','2022-04-27 23:22:30','教师账号1','教师姓名1'),(152,'2022-04-27 15:22:30','2222222222','体检项目2','学号2','姓名2','身高2','体重2','血糖2','','建议2','2022-04-27 23:22:30','教师账号2','教师姓名2'),(153,'2022-04-27 15:22:30','3333333333','体检项目3','学号3','姓名3','身高3','体重3','血糖3','','建议3','2022-04-27 23:22:30','教师账号3','教师姓名3'),(154,'2022-04-27 15:22:30','4444444444','体检项目4','学号4','姓名4','身高4','体重4','血糖4','','建议4','2022-04-27 23:22:30','教师账号4','教师姓名4'),(155,'2022-04-27 15:22:30','5555555555','体检项目5','学号5','姓名5','身高5','体重5','血糖5','','建议5','2022-04-27 23:22:30','教师账号5','教师姓名5'),(156,'2022-04-27 15:22:30','6666666666','体检项目6','学号6','姓名6','身高6','体重6','血糖6','','建议6','2022-04-27 23:22:30','教师账号6','教师姓名6');
/*!40000 ALTER TABLE `tijianbaogao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'abo','users','管理员','61g6vaot3ek2tdwd2msujpp2h3jy26ib','2022-04-27 15:35:03','2022-04-27 16:35:04'),(2,21,'教师账号1','jiaoshi','教师','q3lxumwtz76ac0qsnoi2l33ibb8bcema','2022-04-27 15:38:33','2022-04-27 16:40:20'),(3,11,'学号1','xuesheng','学生','olhjubi5my1kbl3yh769x9t2xlglevfr','2022-04-27 15:39:19','2022-04-27 16:39:19');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abo','abo','管理员','2022-04-27 15:22:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xinlibaogao`
--

DROP TABLE IF EXISTS `xinlibaogao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xinlibaogao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xinlibaogao` varchar(200) DEFAULT NULL COMMENT '心理报告',
  `jiankangdengji` varchar(200) DEFAULT NULL COMMENT '健康等级',
  `pingyu` longtext COMMENT '评语',
  `dengjiriqi` date DEFAULT NULL COMMENT '登记日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='心理报告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xinlibaogao`
--

LOCK TABLES `xinlibaogao` WRITE;
/*!40000 ALTER TABLE `xinlibaogao` DISABLE KEYS */;
INSERT INTO `xinlibaogao` VALUES (141,'2022-04-27 15:22:30','学号1','姓名1','教师账号1','教师姓名1','','★','评语1','2022-04-27'),(142,'2022-04-27 15:22:30','学号2','姓名2','教师账号2','教师姓名2','','★','评语2','2022-04-27'),(143,'2022-04-27 15:22:30','学号3','姓名3','教师账号3','教师姓名3','','★','评语3','2022-04-27'),(144,'2022-04-27 15:22:30','学号4','姓名4','教师账号4','教师姓名4','','★','评语4','2022-04-27'),(145,'2022-04-27 15:22:30','学号5','姓名5','教师账号5','教师姓名5','','★','评语5','2022-04-27'),(146,'2022-04-27 15:22:30','学号6','姓名6','教师账号6','教师姓名6','','★','评语6','2022-04-27');
/*!40000 ALTER TABLE `xinlibaogao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuesheng`
--

DROP TABLE IF EXISTS `xuesheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuesheng`
--

LOCK TABLES `xuesheng` WRITE;
/*!40000 ALTER TABLE `xuesheng` DISABLE KEYS */;
INSERT INTO `xuesheng` VALUES (11,'2022-04-27 15:22:29','学号1','123456','姓名1',1,'男','13823888881','班级1','upload/xuesheng_zhaopian1.jpg'),(12,'2022-04-27 15:22:29','学号2','123456','姓名2',2,'男','13823888882','班级2','upload/xuesheng_zhaopian2.jpg'),(13,'2022-04-27 15:22:29','学号3','123456','姓名3',3,'男','13823888883','班级3','upload/xuesheng_zhaopian3.jpg'),(14,'2022-04-27 15:22:29','学号4','123456','姓名4',4,'男','13823888884','班级4','upload/xuesheng_zhaopian4.jpg'),(15,'2022-04-27 15:22:29','学号5','123456','姓名5',5,'男','13823888885','班级5','upload/xuesheng_zhaopian5.jpg'),(16,'2022-04-27 15:22:29','学号6','123456','姓名6',6,'男','13823888886','班级6','upload/xuesheng_zhaopian6.jpg');
/*!40000 ALTER TABLE `xuesheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xueshengchengji`
--

DROP TABLE IF EXISTS `xueshengchengji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xueshengchengji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `chengji` int(11) DEFAULT NULL COMMENT '成绩',
  `shifouhege` varchar(200) DEFAULT NULL COMMENT '是否合格',
  `pingyu` longtext COMMENT '评语',
  `dengjiriqi` date DEFAULT NULL COMMENT '登记日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='学生成绩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xueshengchengji`
--

LOCK TABLES `xueshengchengji` WRITE;
/*!40000 ALTER TABLE `xueshengchengji` DISABLE KEYS */;
INSERT INTO `xueshengchengji` VALUES (111,'2022-04-27 15:22:30','学号1','姓名1','教师账号1','教师姓名1',1,'合格','评语1','2022-04-27'),(112,'2022-04-27 15:22:30','学号2','姓名2','教师账号2','教师姓名2',2,'合格','评语2','2022-04-27'),(113,'2022-04-27 15:22:30','学号3','姓名3','教师账号3','教师姓名3',3,'合格','评语3','2022-04-27'),(114,'2022-04-27 15:22:30','学号4','姓名4','教师账号4','教师姓名4',4,'合格','评语4','2022-04-27'),(115,'2022-04-27 15:22:30','学号5','姓名5','教师账号5','教师姓名5',5,'合格','评语5','2022-04-27'),(116,'2022-04-27 15:22:30','学号6','姓名6','教师账号6','教师姓名6',6,'合格','评语6','2022-04-27');
/*!40000 ALTER TABLE `xueshengchengji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xueshengqingjia`
--

DROP TABLE IF EXISTS `xueshengqingjia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xueshengqingjia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `kaishishijian` datetime DEFAULT NULL COMMENT '开始时间',
  `jieshushijian` datetime DEFAULT NULL COMMENT '结束时间',
  `qingjiatianshu` varchar(200) DEFAULT NULL COMMENT '请假天数',
  `qingjiayuanyin` longtext COMMENT '请假原因',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='学生请假';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xueshengqingjia`
--

LOCK TABLES `xueshengqingjia` WRITE;
/*!40000 ALTER TABLE `xueshengqingjia` DISABLE KEYS */;
INSERT INTO `xueshengqingjia` VALUES (121,'2022-04-27 15:22:30','学号1','姓名1','事假','2022-04-27 23:22:30','2022-04-27 23:22:30','请假天数1','请假原因1','教师账号1','教师姓名1','是',''),(122,'2022-04-27 15:22:30','学号2','姓名2','事假','2022-04-27 23:22:30','2022-04-27 23:22:30','请假天数2','请假原因2','教师账号2','教师姓名2','是',''),(123,'2022-04-27 15:22:30','学号3','姓名3','事假','2022-04-27 23:22:30','2022-04-27 23:22:30','请假天数3','请假原因3','教师账号3','教师姓名3','是',''),(124,'2022-04-27 15:22:30','学号4','姓名4','事假','2022-04-27 23:22:30','2022-04-27 23:22:30','请假天数4','请假原因4','教师账号4','教师姓名4','是',''),(125,'2022-04-27 15:22:30','学号5','姓名5','事假','2022-04-27 23:22:30','2022-04-27 23:22:30','请假天数5','请假原因5','教师账号5','教师姓名5','是',''),(126,'2022-04-27 15:22:30','学号6','姓名6','事假','2022-04-27 23:22:30','2022-04-27 23:22:30','请假天数6','请假原因6','教师账号6','教师姓名6','是','');
/*!40000 ALTER TABLE `xueshengqingjia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xueshengshenqingjiaoshi`
--

DROP TABLE IF EXISTS `xueshengshenqingjiaoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xueshengshenqingjiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shenqingbianhao` varchar(200) DEFAULT NULL COMMENT '申请编号',
  `jiaoshimingcheng` varchar(200) DEFAULT NULL COMMENT '教室名称',
  `shiyongshijian` varchar(200) NOT NULL COMMENT '使用时间',
  `yongtu` longtext NOT NULL COMMENT '用途',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shenqingbianhao` (`shenqingbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='学生申请教室';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xueshengshenqingjiaoshi`
--

LOCK TABLES `xueshengshenqingjiaoshi` WRITE;
/*!40000 ALTER TABLE `xueshengshenqingjiaoshi` DISABLE KEYS */;
INSERT INTO `xueshengshenqingjiaoshi` VALUES (41,'2022-04-27 15:22:30','1111111111','教室名称1','使用时间1','用途1','学号1','姓名1','班级1','是',''),(42,'2022-04-27 15:22:30','2222222222','教室名称2','使用时间2','用途2','学号2','姓名2','班级2','是',''),(43,'2022-04-27 15:22:30','3333333333','教室名称3','使用时间3','用途3','学号3','姓名3','班级3','是',''),(44,'2022-04-27 15:22:30','4444444444','教室名称4','使用时间4','用途4','学号4','姓名4','班级4','是',''),(45,'2022-04-27 15:22:30','5555555555','教室名称5','使用时间5','用途5','学号5','姓名5','班级5','是',''),(46,'2022-04-27 15:22:30','6666666666','教室名称6','使用时间6','用途6','学号6','姓名6','班级6','是','');
/*!40000 ALTER TABLE `xueshengshenqingjiaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xueshengxuanke`
--

DROP TABLE IF EXISTS `xueshengxuanke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xueshengxuanke` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kechengfenlei` varchar(200) DEFAULT NULL COMMENT '课程分类',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `xuankeshijian` datetime DEFAULT NULL COMMENT '选课时间',
  `xuanzeyuanyin` longtext NOT NULL COMMENT '选择原因',
  `jiaoshizhanghao` varchar(200) DEFAULT NULL COMMENT '教师账号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='学生选课';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xueshengxuanke`
--

LOCK TABLES `xueshengxuanke` WRITE;
/*!40000 ALTER TABLE `xueshengxuanke` DISABLE KEYS */;
INSERT INTO `xueshengxuanke` VALUES (91,'2022-04-27 15:22:30','课程名称1','课程分类1','班级1','2022-04-27 23:22:30','选择原因1','教师账号1','教师姓名1','学号1','姓名1','是',''),(92,'2022-04-27 15:22:30','课程名称2','课程分类2','班级2','2022-04-27 23:22:30','选择原因2','教师账号2','教师姓名2','学号2','姓名2','是',''),(93,'2022-04-27 15:22:30','课程名称3','课程分类3','班级3','2022-04-27 23:22:30','选择原因3','教师账号3','教师姓名3','学号3','姓名3','是',''),(94,'2022-04-27 15:22:30','课程名称4','课程分类4','班级4','2022-04-27 23:22:30','选择原因4','教师账号4','教师姓名4','学号4','姓名4','是',''),(95,'2022-04-27 15:22:30','课程名称5','课程分类5','班级5','2022-04-27 23:22:30','选择原因5','教师账号5','教师姓名5','学号5','姓名5','是',''),(96,'2022-04-27 15:22:30','课程名称6','课程分类6','班级6','2022-04-27 23:22:30','选择原因6','教师账号6','教师姓名6','学号6','姓名6','是','');
/*!40000 ALTER TABLE `xueshengxuanke` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-09 15:29:43
