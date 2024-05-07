-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: ssm6sch6
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
-- Table structure for table `chengjixinxi`
--

DROP TABLE IF EXISTS `chengjixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chengjixinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mingcheng` varchar(200) NOT NULL COMMENT '名称',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `kemu` varchar(200) NOT NULL COMMENT '科目',
  `chengji` varchar(200) NOT NULL COMMENT '成绩',
  `dianping` longtext COMMENT '点评',
  `riqi` date DEFAULT NULL COMMENT '日期',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614994889798 DEFAULT CHARSET=utf8 COMMENT='成绩信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chengjixinxi`
--

LOCK TABLES `chengjixinxi` WRITE;
/*!40000 ALTER TABLE `chengjixinxi` DISABLE KEYS */;
INSERT INTO `chengjixinxi` VALUES (81,'2021-03-06 00:13:39','名称1','学号1','学生姓名1','科目1','成绩1','点评1','2021-03-06','工号1','教师姓名1'),(82,'2021-03-06 00:13:39','名称2','学号2','学生姓名2','科目2','成绩2','点评2','2021-03-06','工号2','教师姓名2'),(83,'2021-03-06 00:13:39','名称3','学号3','学生姓名3','科目3','成绩3','点评3','2021-03-06','工号3','教师姓名3'),(84,'2021-03-06 00:13:39','名称4','学号4','学生姓名4','科目4','成绩4','点评4','2021-03-06','工号4','教师姓名4'),(85,'2021-03-06 00:13:39','名称5','学号5','学生姓名5','科目5','成绩5','点评5','2021-03-06','工号5','教师姓名5'),(86,'2021-03-06 00:13:39','名称6','学号6','学生姓名6','科目6','成绩6','点评6','2021-03-06','工号6','教师姓名6'),(1614989807977,'2021-03-06 00:16:47','111','1','学生姓名1','111','100','1111','2021-03-01','1','教师姓名1'),(1614994889797,'2021-03-06 01:41:29','会计成绩','1','刘倩','会计','85','222222222','2021-03-01','1','王老师');
/*!40000 ALTER TABLE `chengjixinxi` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','http://localhost:8080/ssm6sch6/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/ssm6sch6/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssm6sch6/upload/picture3.jpg'),(6,'homepage',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
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
  `gonghao` varchar(200) NOT NULL COMMENT '工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `zhicheng` varchar(200) DEFAULT NULL COMMENT '职称',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `dianhua` varchar(200) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gonghao` (`gonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoshi`
--

LOCK TABLES `jiaoshi` WRITE;
/*!40000 ALTER TABLE `jiaoshi` DISABLE KEYS */;
INSERT INTO `jiaoshi` VALUES (21,'2021-03-06 00:13:39','1','1','王老师','女','http://localhost:8080/ssm6sch6/upload/jiaoshi_touxiang1.jpg','教授','商务一班','13823888881'),(22,'2021-03-06 00:13:39','教师2','123456','教师姓名2','男','http://localhost:8080/ssm6sch6/upload/jiaoshi_touxiang2.jpg','职称2','班级2','13823888882'),(23,'2021-03-06 00:13:39','教师3','123456','教师姓名3','男','http://localhost:8080/ssm6sch6/upload/jiaoshi_touxiang3.jpg','职称3','班级3','13823888883'),(24,'2021-03-06 00:13:39','教师4','123456','教师姓名4','男','http://localhost:8080/ssm6sch6/upload/jiaoshi_touxiang4.jpg','职称4','班级4','13823888884'),(25,'2021-03-06 00:13:39','教师5','123456','教师姓名5','男','http://localhost:8080/ssm6sch6/upload/jiaoshi_touxiang5.jpg','职称5','班级5','13823888885'),(26,'2021-03-06 00:13:39','教师6','123456','教师姓名6','男','http://localhost:8080/ssm6sch6/upload/jiaoshi_touxiang6.jpg','职称6','班级6','13823888886');
/*!40000 ALTER TABLE `jiaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechengleixing`
--

DROP TABLE IF EXISTS `kechengleixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechengleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengleixing` varchar(200) NOT NULL COMMENT '课程类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='课程类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengleixing`
--

LOCK TABLES `kechengleixing` WRITE;
/*!40000 ALTER TABLE `kechengleixing` DISABLE KEYS */;
INSERT INTO `kechengleixing` VALUES (51,'2021-03-06 00:13:39','会计'),(52,'2021-03-06 00:13:39','课程类型2'),(53,'2021-03-06 00:13:39','课程类型3'),(54,'2021-03-06 00:13:39','课程类型4'),(55,'2021-03-06 00:13:39','课程类型5'),(56,'2021-03-06 00:13:39','课程类型6');
/*!40000 ALTER TABLE `kechengleixing` ENABLE KEYS */;
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
  `kechengmingcheng` varchar(200) NOT NULL COMMENT '课程名称',
  `kechengleixing` varchar(200) NOT NULL COMMENT '课程类型',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `kechengxueshi` varchar(200) NOT NULL COMMENT '课程学时',
  `kechengxuefen` int(11) NOT NULL COMMENT '课程学分',
  `kechengneirong` longtext COMMENT '课程内容',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='课程信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengxinxi`
--

LOCK TABLES `kechengxinxi` WRITE;
/*!40000 ALTER TABLE `kechengxinxi` DISABLE KEYS */;
INSERT INTO `kechengxinxi` VALUES (61,'2021-03-06 00:13:39','会计','会计','http://localhost:8080/ssm6sch6/upload/kechengxinxi_tupian1.jpg','50小时',5,'<p><img src=\"http://localhost:8080/ssm6sch6/upload/1614994787662.jpg\"></p><p>1211212</p>','1','王老师','商务一班'),(62,'2021-03-06 00:13:39','课程名称2','课程类型2','http://localhost:8080/ssm6sch6/upload/kechengxinxi_tupian2.jpg','课程学时2',2,'课程内容2','工号2','教师姓名2','班级2'),(63,'2021-03-06 00:13:39','课程名称3','课程类型3','http://localhost:8080/ssm6sch6/upload/kechengxinxi_tupian3.jpg','课程学时3',3,'课程内容3','工号3','教师姓名3','班级3'),(64,'2021-03-06 00:13:39','课程名称4','课程类型4','http://localhost:8080/ssm6sch6/upload/kechengxinxi_tupian4.jpg','课程学时4',4,'课程内容4','工号4','教师姓名4','班级4'),(65,'2021-03-06 00:13:39','课程名称5','课程类型5','http://localhost:8080/ssm6sch6/upload/kechengxinxi_tupian5.jpg','课程学时5',5,'课程内容5','工号5','教师姓名5','班级5'),(66,'2021-03-06 00:13:39','课程名称6','课程类型6','http://localhost:8080/ssm6sch6/upload/kechengxinxi_tupian6.jpg','课程学时6',6,'课程内容6','工号6','教师姓名6','班级6');
/*!40000 ALTER TABLE `kechengxinxi` ENABLE KEYS */;
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
INSERT INTO `token` VALUES (1,1,'abo','users','管理员','7bj5t7hf8fju8zvt94xaxwdk77n0vlhg','2021-03-06 00:15:32','2021-03-06 02:41:52'),(2,11,'1','xuesheng','学生','ov6z7u15db17n8c6yihn5zb54ceohctx','2021-03-06 00:15:38','2021-03-06 02:41:37'),(3,21,'1','jiaoshi','教师','vho2ijpdv1we3vb2wdon12pkk8s9wukf','2021-03-06 00:16:10','2021-03-06 02:40:52');
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
INSERT INTO `users` VALUES (1,'abo','abo','管理员','2021-03-06 00:13:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuankexinxi`
--

DROP TABLE IF EXISTS `xuankexinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuankexinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `kechengleixing` varchar(200) DEFAULT NULL COMMENT '课程类型',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `kechengxuefen` int(11) DEFAULT NULL COMMENT '课程学分',
  `neirong` varchar(200) DEFAULT NULL COMMENT '内容',
  `riqi` date DEFAULT NULL COMMENT '日期',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `yuanxi` varchar(200) DEFAULT NULL COMMENT '院系',
  `zhuanye` varchar(200) DEFAULT NULL COMMENT '专业',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614994839510 DEFAULT CHARSET=utf8 COMMENT='选课信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuankexinxi`
--

LOCK TABLES `xuankexinxi` WRITE;
/*!40000 ALTER TABLE `xuankexinxi` DISABLE KEYS */;
INSERT INTO `xuankexinxi` VALUES (71,'2021-03-06 00:13:39','课程名称1','课程类型1','工号1','教师姓名1','班级1',1,'内容1','2021-03-06','学号1','学生姓名1','院系1','专业1','是',''),(72,'2021-03-06 00:13:39','课程名称2','课程类型2','工号2','教师姓名2','班级2',2,'内容2','2021-03-06','学号2','学生姓名2','院系2','专业2','是',''),(73,'2021-03-06 00:13:39','课程名称3','课程类型3','工号3','教师姓名3','班级3',3,'内容3','2021-03-06','学号3','学生姓名3','院系3','专业3','是',''),(74,'2021-03-06 00:13:39','课程名称4','课程类型4','工号4','教师姓名4','班级4',4,'内容4','2021-03-06','学号4','学生姓名4','院系4','专业4','是',''),(75,'2021-03-06 00:13:39','课程名称5','课程类型5','工号5','教师姓名5','班级5',5,'内容5','2021-03-06','学号5','学生姓名5','院系5','专业5','是',''),(76,'2021-03-06 00:13:39','课程名称6','课程类型6','工号6','教师姓名6','班级6',6,'内容6','2021-03-06','学号6','学生姓名6','院系6','专业6','是',''),(1614989788918,'2021-03-06 00:16:28','课程名称1','课程类型1','1','教师姓名1','班级1',1,'12121','2021-03-01','1','学生姓名1','院系1','专业1','否',''),(1614994839509,'2021-03-06 01:40:38','会计','会计','1','王老师','商务一班',5,'我要上老师课','2021-03-01','1','刘倩','商务系','电子商务','是','记得按时上课');
/*!40000 ALTER TABLE `xuankexinxi` ENABLE KEYS */;
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
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `yuanxi` varchar(200) DEFAULT NULL COMMENT '院系',
  `zhuanye` varchar(200) DEFAULT NULL COMMENT '专业',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuesheng`
--

LOCK TABLES `xuesheng` WRITE;
/*!40000 ALTER TABLE `xuesheng` DISABLE KEYS */;
INSERT INTO `xuesheng` VALUES (11,'2021-03-06 00:13:39','1','1','刘倩','女','http://localhost:8080/ssm6sch6/upload/xuesheng_touxiang1.jpg','商务系','电子商务','商务一班','13823888881'),(12,'2021-03-06 00:13:39','学生2','123456','学生姓名2','男','http://localhost:8080/ssm6sch6/upload/xuesheng_touxiang2.jpg','院系2','专业2','班级2','13823888882'),(13,'2021-03-06 00:13:39','学生3','123456','学生姓名3','男','http://localhost:8080/ssm6sch6/upload/xuesheng_touxiang3.jpg','院系3','专业3','班级3','13823888883'),(14,'2021-03-06 00:13:39','学生4','123456','学生姓名4','男','http://localhost:8080/ssm6sch6/upload/xuesheng_touxiang4.jpg','院系4','专业4','班级4','13823888884'),(15,'2021-03-06 00:13:39','学生5','123456','学生姓名5','男','http://localhost:8080/ssm6sch6/upload/xuesheng_touxiang5.jpg','院系5','专业5','班级5','13823888885'),(16,'2021-03-06 00:13:39','学生6','123456','学生姓名6','男','http://localhost:8080/ssm6sch6/upload/xuesheng_touxiang6.jpg','院系6','专业6','班级6','13823888886');
/*!40000 ALTER TABLE `xuesheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yuanxixinxi`
--

DROP TABLE IF EXISTS `yuanxixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yuanxixinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yuanxi` varchar(200) NOT NULL COMMENT '院系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='院系信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yuanxixinxi`
--

LOCK TABLES `yuanxixinxi` WRITE;
/*!40000 ALTER TABLE `yuanxixinxi` DISABLE KEYS */;
INSERT INTO `yuanxixinxi` VALUES (31,'2021-03-06 00:13:39','商务系'),(32,'2021-03-06 00:13:39','院系2'),(33,'2021-03-06 00:13:39','院系3'),(34,'2021-03-06 00:13:39','院系4'),(35,'2021-03-06 00:13:39','院系5'),(36,'2021-03-06 00:13:39','院系6');
/*!40000 ALTER TABLE `yuanxixinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhuanyexinxi`
--

DROP TABLE IF EXISTS `zhuanyexinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhuanyexinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhuanye` varchar(200) NOT NULL COMMENT '专业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='专业信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhuanyexinxi`
--

LOCK TABLES `zhuanyexinxi` WRITE;
/*!40000 ALTER TABLE `zhuanyexinxi` DISABLE KEYS */;
INSERT INTO `zhuanyexinxi` VALUES (41,'2021-03-06 00:13:39','电子商务'),(42,'2021-03-06 00:13:39','专业2'),(43,'2021-03-06 00:13:39','专业3'),(44,'2021-03-06 00:13:39','专业4'),(45,'2021-03-06 00:13:39','专业5'),(46,'2021-03-06 00:13:39','专业6');
/*!40000 ALTER TABLE `zhuanyexinxi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-08 11:31:08
