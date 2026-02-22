-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: his
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `card_game`
--

DROP TABLE IF EXISTS `card_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_game` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动标题',
  `pic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '宣传图',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动简介',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `type` smallint NOT NULL COMMENT '活动类型 id对应字典表的id',
  `status` smallint NOT NULL COMMENT '状态  0:未开始  1:已结束(已加载)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_game`
--

LOCK TABLES `card_game` WRITE;
/*!40000 ALTER TABLE `card_game` DISABLE KEYS */;
INSERT INTO `card_game` VALUES (1,'年会抽奖','http://120.46.193.111:9090/meiyanshe/QQ图片20221004225621_1665228285500.jpg','公司在28号晚上聚会抽奖奖励大家哈哈','2022-05-25 00:12:00','2022-05-25 00:00:00',2,1,'2022-01-26 22:38:30','2022-10-12 17:38:19'),(2,'开年利是','http://124.70.23.0:9090/meiyanshe/111_1665627858378.jpg','3333','2022-02-09 00:00:00','2022-02-07 03:00:00',1,0,'2022-02-07 21:36:03','2022-10-13 02:24:27'),(3,'2222','22222','2222','2022-02-07 21:40:18','2022-02-07 16:16:20',1,0,'2022-02-07 16:16:31','2022-10-12 23:43:04'),(5,'春季美容大派送','http://192.168.192.188/minio/a.jpg','回馈老客户','2022-03-12 21:53:52','2022-03-12 22:22:59',2,0,'2022-03-12 21:22:24','2022-03-12 21:22:27'),(12,'易宗赵','http://120.46.193.111:9090/meiyanshe/avatar_1664799838138.jpg','易宗赵','2022-10-19 15:26:00','2022-10-19 15:33:00',1,1,'2022-10-03 20:24:06','2022-10-03 20:24:06'),(28,'旅游','http://120.46.193.111:9090/meiyanshe/IMG5_1665063689387.jpg','吃喝玩乐','2022-10-19 15:26:00','2022-10-19 15:33:00',2,1,'2022-10-06 21:41:46','2022-10-12 16:44:45'),(38,'赵聪','http://120.46.193.111:9090/meiyanshe/1661590463216_1665391024871.jpeg','福利哦','2022-10-19 15:26:00','2022-10-19 15:33:00',2,1,'2022-10-10 16:37:20','2022-10-11 15:39:47');
/*!40000 ALTER TABLE `card_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_game_product`
--

DROP TABLE IF EXISTS `card_game_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_game_product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gameid` int NOT NULL COMMENT '活动id',
  `productid` int NOT NULL COMMENT '奖品id',
  `amount` int NOT NULL COMMENT '奖品 数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_game_product`
--

LOCK TABLES `card_game_product` WRITE;
/*!40000 ALTER TABLE `card_game_product` DISABLE KEYS */;
INSERT INTO `card_game_product` VALUES (1,1,1,1),(2,1,2,10),(3,5,3,20),(4,5,5,100),(5,5,4,200),(6,6,1,6),(7,8,1,10),(8,11,1,2),(9,10,2,2),(10,10,1,2),(11,10,3,1),(12,12,2,22),(13,12,3,11),(14,1,3,3),(15,24,1,1),(16,24,2,1),(17,1,5,100),(18,1,29,10),(19,28,2,11),(20,3,5,10),(21,5,17,10),(22,30,2,1),(23,2,1,20),(24,4,3,20),(25,24,20,2),(26,1,20,2),(27,28,20,2),(28,1,4,10),(29,3,2,150),(30,1,33,1),(31,37,2,1),(32,37,4,10),(33,37,5,4),(34,37,8,1),(35,2,3,1),(36,3,4,11),(37,2,2,1),(38,38,4,999),(39,40,3,1),(40,38,33,1),(41,2,8,100),(42,2,33,10),(43,46,55,2),(44,1,17,2),(45,12,5,10),(46,12,33,12),(47,38,55,20),(48,38,5,25),(49,28,8,10);
/*!40000 ALTER TABLE `card_game_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_game_rule`
--

DROP TABLE IF EXISTS `card_game_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_game_rule` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gameid` int NOT NULL COMMENT '活动id',
  `levelid` int NOT NULL COMMENT '会员等级id',
  `enter_count` int NOT NULL DEFAULT '0' COMMENT '可抽奖的次数0:不限制 ',
  `hit_count` int NOT NULL COMMENT '最大中奖次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_game_rule`
--

LOCK TABLES `card_game_rule` WRITE;
/*!40000 ALTER TABLE `card_game_rule` DISABLE KEYS */;
INSERT INTO `card_game_rule` VALUES (50,28,133,0,10),(51,38,133,0,100),(52,12,133,0,10);
/*!40000 ALTER TABLE `card_game_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_game_user`
--

DROP TABLE IF EXISTS `card_game_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_game_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int NOT NULL COMMENT '用户id',
  `gameid` int NOT NULL COMMENT '活动id',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_game_user`
--

LOCK TABLES `card_game_user` WRITE;
/*!40000 ALTER TABLE `card_game_user` DISABLE KEYS */;
INSERT INTO `card_game_user` VALUES (9,115,12,'2022-10-19 14:55:15'),(10,115,12,'2022-10-19 15:03:11'),(11,115,12,'2022-10-19 15:15:18'),(12,115,12,'2022-10-19 15:26:06');
/*!40000 ALTER TABLE `card_game_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_product`
--

DROP TABLE IF EXISTS `card_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品名称',
  `pic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片url路径',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品简介',
  `price` decimal(10,2) NOT NULL COMMENT '奖品市场价',
  `del_state` smallint NOT NULL COMMENT '逻辑删除字段0:正常 1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_product`
--

LOCK TABLES `card_product` WRITE;
/*!40000 ALTER TABLE `card_product` DISABLE KEYS */;
INSERT INTO `card_product` VALUES (4,'面膜1','http://120.46.193.111:9090/meiyanshe/wallhaven-76k3l3_1665584138798.jpg','福利来的',100.00,0),(5,'染发膏1','http://120.46.193.111:9090/meiyanshe/1_1664710536920.jpg','头发的',122.20,0),(8,'易宗赵','http://120.46.193.111:9090/meiyanshe/avatar_1664710761468.jpg','易宗赵',123.00,0),(17,'喵~1','http://120.46.193.111:9090/meiyanshe/QQ图片20221004225621_1665227857847.jpg','大喝酒啊',331.00,0),(33,'鲲鲲签名照','http://120.46.193.111:9090/meiyanshe/1661590463216_1665198609428.jpeg','终极福利',0.01,0),(55,'海报两张','http://120.46.193.111:9090/meiyanshe/372742_1665478168794.jpg','不值钱e',8888.00,0),(56,'赵聪','http://120.46.193.111:9090/meiyanshe/5688E5CB26497B19AC0C276970EAFC8A_1665470703099.jpg','树脂',777.00,0);
/*!40000 ALTER TABLE `card_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_user`
--

DROP TABLE IF EXISTS `card_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员账号',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '头像',
  `realname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '真实姓名',
  `id_card` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证号码',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号码',
  `level` smallint NOT NULL COMMENT '等级',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `del_state` int DEFAULT NULL COMMENT '逻辑删除字段0:正常 1:已删除',
  `open_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '微信openid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_user`
--

LOCK TABLES `card_user` WRITE;
/*!40000 ALTER TABLE `card_user` DISABLE KEYS */;
INSERT INTO `card_user` VALUES (115,'songge','$2a$10$x/qlyKOTlVS3JkEZ8f5cX.w9YpJ4z7EPrpD80fRpfFrds4PbJjSIG','http://120.46.193.111:9090/meiyanshe/3bdfba00a6569c00f295aa501f89dd27_482x264_1665308241791.jpg','王松','518888888888888888','15888888888',3,'2022-10-04 21:56:25','2022-10-13 02:22:36',0,'oRrdQt_GNKQC7YpX658zMjhwqWCc'),(120,'qweq','123','http://120.46.193.111:9090/meiyanshe/linux命令_1665119171150.png','飞','411234121123455432','13623455432',1,'2022-10-05 11:48:32','2022-10-07 13:06:24',0,NULL),(124,'擎天柱','123','http://120.46.193.111:9090/meiyanshe/53aa221f6e1d5_1664965786178.jpg','擎天柱','12312121313','15154646464',3,'2022-10-05 18:27:18','2022-10-05 22:41:25',0,'111'),(126,'可爱','123','http://120.46.193.111:9090/meiyanshe/meinv_1664982154404.jpg','可可爱爱','4546456','1213213123',3,'2022-10-05 23:03:23','2022-10-06 11:40:37',0,'4545'),(143,'zs','$2a$10$K5q8jmTA.edBOJZBU.3XDOqxr8pu06qe/NLbsrnKarmJg/xJ6FJpW','http://120.46.193.111:9090/meiyanshe/QQ图片20221004225621_1665224982627.jpg','yd','222223','13333334444',4,'2022-10-07 21:50:28','2022-10-13 02:21:27',0,NULL);
/*!40000 ALTER TABLE `card_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_user_hit`
--

DROP TABLE IF EXISTS `card_user_hit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_user_hit` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gameid` int NOT NULL COMMENT '活动id',
  `userid` int NOT NULL COMMENT '用户id',
  `productid` int NOT NULL COMMENT '奖品id',
  `hittime` datetime NOT NULL COMMENT '中奖时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_user_hit`
--

LOCK TABLES `card_user_hit` WRITE;
/*!40000 ALTER TABLE `card_user_hit` DISABLE KEYS */;
INSERT INTO `card_user_hit` VALUES (7,12,115,5,'2022-10-19 15:26:13'),(8,12,115,5,'2022-10-19 15:28:46'),(9,12,115,33,'2022-10-19 15:28:47'),(10,12,115,33,'2022-10-19 15:28:49'),(11,12,115,33,'2022-10-19 15:28:50'),(12,12,115,5,'2022-10-19 15:28:51'),(13,12,115,33,'2022-10-19 15:28:52'),(14,12,115,33,'2022-10-19 15:28:52'),(15,12,115,5,'2022-10-19 15:28:53'),(16,12,115,5,'2022-10-19 15:28:54'),(17,12,115,33,'2022-10-19 15:28:55'),(18,12,115,5,'2022-10-19 15:29:01'),(19,12,115,5,'2022-10-19 15:29:04'),(20,12,115,33,'2022-10-19 15:30:48'),(21,12,115,5,'2022-10-19 15:30:55'),(22,12,115,33,'2022-10-19 15:30:59'),(23,12,115,5,'2022-10-19 15:31:38'),(24,12,115,33,'2022-10-19 15:32:23');
/*!40000 ALTER TABLE `card_user_hit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (10,'card_game_rule','',NULL,NULL,'CardGameRule','crud','com.ruoyi.project.system','system','rule',NULL,'ruoyi','0','/',NULL,'admin','2022-05-25 14:12:34','',NULL,NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (84,'10','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-05-25 14:12:34','',NULL),(85,'10','gameid','活动id','int','Long','gameid','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-05-25 14:12:34','',NULL),(86,'10','levelid','会员等级id','int','Long','levelid','0','0','1','1','1','1','1','EQ','input','',3,'admin','2022-05-25 14:12:34','',NULL),(87,'10','enter_count','可抽奖的次数0:不限制 ','int','Long','enterCount','0','0','1','1','1','1','1','EQ','input','',4,'admin','2022-05-25 14:12:34','',NULL),(88,'10','hit_count','最大中奖次数','int','Long','hitCount','0','0','1','1','1','1','1','EQ','input','',5,'admin','2022-05-25 14:12:34','',NULL);
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',NULL,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0\'com.ruoyi.project.monitor.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0)com.ruoyi.framework.web.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0�\�v\�`xpt\0\0pppt\01t\00/10 * * * * ?t\0ryTask.ryNoParamst\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（无参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT',NULL,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0\'com.ruoyi.project.monitor.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0)com.ruoyi.framework.web.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0�\�v\�`xpt\0\0pppt\01t\00/15 * * * * ?t\0ryTask.ryParams(\'ry\')t\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（有参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT',NULL,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0\'com.ruoyi.project.monitor.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0)com.ruoyi.framework.web.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0�\�v\�`xpt\0\0pppt\01t\00/20 * * * * ?t\08ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)t\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（多参）t\03t\01x\0');
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler','STATE_ACCESS'),('RuoyiScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler','Max1771747866879',1771761308230,15000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `int_prop_1` int DEFAULT NULL,
  `int_prop_2` int DEFAULT NULL,
  `long_prop_1` bigint DEFAULT NULL,
  `long_prop_2` bigint DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `next_fire_time` bigint DEFAULT NULL,
  `prev_fire_time` bigint DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `misfire_instr` smallint DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',NULL,1771747870000,-1,5,'PAUSED','CRON',1771747867000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',NULL,1771747875000,-1,5,'PAUSED','CRON',1771747867000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',NULL,1771747880000,-1,5,'PAUSED','CRON',1771747867000,0,NULL,2,'');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤','sys.index.skinName','skin-blue','Y','admin','2024-01-01 10:00:00','',NULL,'默认皮肤：蓝色、天蓝、绿色、紫色、红色、花花公子'),(2,'用户管理-初始密码','sys.user.initPassword','123456','Y','admin','2024-01-01 10:00:00','',NULL,'初始化默认密码'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-01-01 10:00:00','',NULL,'默认侧边栏主题：深色、浅色'),(4,'账号自助-是否开启','sys.account.isRegister','true','Y','admin','2024-01-01 10:00:00','',NULL,'是否开启注册账号功能'),(5,'主框架页-居中设置','sys.index.isTabNav','false','Y','admin','2024-01-01 10:00:00','',NULL,'默认开启标签页');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'admin','15888888888','admin@ruoyi.com','0','0','admin','2018-03-16 11:33:00','',NULL),(101,100,'0,100','深圳总公司',1,'admin','15888888888','admin@ruoyi.com','0','0','admin','2018-03-16 11:33:00','',NULL),(102,100,'0,100','长沙分公司',2,'admin','15888888888','admin@ruoyi.com','0','0','admin','2018-03-16 11:33:00','',NULL),(103,101,'0,100,101','研发部门',1,'admin','15888888888','admin@ruoyi.com','0','0','admin','2018-03-16 11:33:00','',NULL),(104,101,'0,100,101','市场部门',2,'admin','15888888888','admin@ruoyi.com','0','0','admin','2018-03-16 11:33:00','',NULL),(105,101,'0,100,101','测试部门',3,'admin','15888888888','admin@ruoyi.com','0','0','admin','2018-03-16 11:33:00','',NULL),(106,101,'0,100,101','运维部门',4,'admin','15888888888','admin@ruoyi.com','0','0','admin','2018-03-16 11:33:00','',NULL),(107,102,'0,100,102','市场部门',1,'admin','15888888888','admin@ruoyi.com','0','0','admin','2018-03-16 11:33:00','',NULL),(108,102,'0,100,102','财务部门',2,'admin','15888888888','admin@ruoyi.com','0','0','admin','2018-03-16 11:33:00','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` bigint DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格字典样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-01-01 10:00:00','',NULL,'男性'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-01-01 10:00:00','',NULL,'女性'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-01-01 10:00:00','',NULL,'未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-01-01 10:00:00','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-01-01 10:00:00','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-01-01 10:00:00','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-01-01 10:00:00','',NULL,'停用状态'),(8,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-01-01 10:00:00','',NULL,'是'),(9,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-01-01 10:00:00','',NULL,'否');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-01-01 10:00:00','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-01-01 10:00:00','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-01-01 10:00:00','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-01-01 10:00:00','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-01-01 10:00:00','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-01-01 10:00:00','',NULL,'系统是否列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2022-05-21 15:13:32','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2022-05-21 15:13:32','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2022-05-21 15:13:32','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_login_log`
--

DROP TABLE IF EXISTS `sys_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_login_log` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '璁块棶id',
  `user_name` varchar(50) DEFAULT '' COMMENT '鐢ㄦ埛璐﹀彿',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '鐧诲綍IP鍦板潃',
  `login_location` varchar(255) DEFAULT '' COMMENT '鐧诲綍鍦扮偣',
  `browser` varchar(50) DEFAULT '' COMMENT '娴忚?鍣ㄧ被鍨',
  `os` varchar(50) DEFAULT '' COMMENT '鎿嶄綔绯荤粺',
  `status` char(1) DEFAULT '0' COMMENT '鐧诲綍鐘舵?锛?鎴愬姛 1澶辫触锛',
  `msg` varchar(255) DEFAULT '' COMMENT '鎻愮ず娑堟伅',
  `login_time` datetime DEFAULT NULL COMMENT '璁块棶鏃堕棿',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='绯荤粺璁块棶璁板綍';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_log`
--

LOCK TABLES `sys_login_log` WRITE;
/*!40000 ALTER TABLE `sys_login_log` DISABLE KEYS */;
INSERT INTO `sys_login_log` VALUES (100,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-15 08:30:00'),(101,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-15 13:20:00'),(102,'admin','127.0.0.1','Local','Firefox 121','Windows 10','0','Login success','2024-01-15 16:45:00'),(103,'ry','192.168.1.100','Beijing','Safari 17','macOS','0','Login success','2024-01-16 09:00:00'),(104,'test','192.168.1.101','Shanghai','Edge 120','Windows 11','0','Login success','2024-01-16 10:15:00'),(105,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-16 14:30:00'),(106,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-17 08:00:00'),(107,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-17 13:45:00'),(108,'wronguser','192.168.1.105','Guangzhou','Chrome 120','Windows 11','1','User not found','2024-01-17 15:30:00'),(109,'admin','192.168.1.106','Shenzhen','Chrome 120','Windows 11','1','Wrong password','2024-01-17 16:00:00'),(110,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-18 08:30:00'),(111,'ry','192.168.1.110','Hangzhou','Safari 17','macOS','0','Login success','2024-01-18 09:30:00'),(112,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-15 08:30:00'),(113,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-15 13:20:00'),(114,'admin','127.0.0.1','Local','Firefox 121','Windows 10','0','Login success','2024-01-15 16:45:00'),(115,'ry','192.168.1.100','Beijing','Safari 17','macOS','0','Login success','2024-01-16 09:00:00'),(116,'test','192.168.1.101','Shanghai','Edge 120','Windows 11','0','Login success','2024-01-16 10:15:00'),(117,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-16 14:30:00'),(118,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-17 08:00:00'),(119,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-17 13:45:00'),(120,'wronguser','192.168.1.105','Guangzhou','Chrome 120','Windows 11','1','User not found','2024-01-17 15:30:00'),(121,'admin','192.168.1.106','Shenzhen','Chrome 120','Windows 11','1','Wrong password','2024-01-17 16:00:00'),(122,'admin','127.0.0.1','Local','Chrome 120','Windows 11','0','Login success','2024-01-18 08:30:00'),(123,'ry','192.168.1.110','Hangzhou','Safari 17','macOS','0','Login success','2024-01-18 09:30:00');
/*!40000 ALTER TABLE `sys_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','用户不存在/密码错误','2022-05-21 15:52:17'),(101,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','用户不存在/密码错误','2022-05-21 15:52:35'),(102,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-21 15:53:01'),(103,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-21 21:30:05'),(104,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-22 07:37:47'),(105,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-22 11:37:32'),(106,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-22 12:49:20'),(107,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-22 19:10:55'),(108,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-22 19:38:52'),(109,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-22 22:30:52'),(110,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-23 08:39:18'),(111,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-23 09:12:58'),(112,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-05-23 10:22:44'),(113,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-23 10:22:55'),(114,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-23 12:38:02'),(115,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-23 19:23:17'),(116,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-23 22:35:08'),(117,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-24 00:10:00'),(118,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-24 01:01:22'),(119,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-24 14:25:41'),(120,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-24 21:20:16'),(121,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-24 22:57:58'),(122,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-24 23:09:45'),(123,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-25 09:35:02'),(124,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-05-25 10:10:28'),(125,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-25 10:10:36'),(126,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-25 11:34:41'),(127,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-05-25 13:02:08'),(128,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误','2026-02-21 22:12:28'),(129,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误','2026-02-21 22:13:16'),(130,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误','2026-02-21 22:14:12'),(131,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误','2026-02-21 22:14:34'),(132,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码已失效','2026-02-21 22:16:35'),(133,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2026-02-21 22:16:39'),(134,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2026-02-21 22:16:50'),(135,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2026-02-21 22:21:21'),(136,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功','2026-02-21 22:24:14'),(137,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2026-02-21 22:24:20'),(138,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功','2026-02-21 23:37:05'),(139,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2026-02-21 23:46:56'),(140,'test','127.0.0.1','内网IP','Chrome 14','Windows 10','1','对不起，您的账号：test 已停用','2026-02-22 16:12:22'),(141,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2026-02-22 16:12:39'),(142,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功','2026-02-22 16:13:44'),(143,'test','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误','2026-02-22 16:13:55'),(144,'test','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误','2026-02-22 16:14:03'),(145,'test','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误','2026-02-22 16:14:07'),(146,'test','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误','2026-02-22 16:14:13'),(147,'test','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误','2026-02-22 16:14:17'),(148,'test','127.0.0.1','内网IP','Chrome 14','Windows 10','1','用户不存在/密码错误','2026-02-22 16:14:28'),(149,'test','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2026-02-22 16:16:49'),(150,'test','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2026-02-22 19:21:20'),(151,'test','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功','2026-02-22 19:21:32'),(152,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误','2026-02-22 19:21:42'),(153,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2026-02-22 19:21:49');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单id',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,1,0,'M','0','0','','system','admin','2018-03-16 11:33:00','',NULL,'系统管理目录'),(2,'deepseek',0,0,'https://chat.deepseek.com/',NULL,0,0,'M','0','0','','guide','admin','2018-03-16 11:33:00','admin','2026-02-22 00:19:02','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index',1,0,'C','0','0','system:user:list','user','admin','2018-03-16 11:33:00','',NULL,''),(101,'角色管理',1,2,'role','system/role/index',1,0,'C','0','0','system:role:list','peoples','admin','2018-03-16 11:33:00','',NULL,''),(102,'菜单管理',0,2,'menu','system/menu/index',1,0,'C','0','0','system:menu:list','tree-table','admin','2018-03-16 11:33:00','admin','2026-02-22 00:15:21',''),(103,'部门管理',1,4,'dept','system/dept/index',1,0,'C','0','0','system:dept:list','tree','admin','2018-03-16 11:33:00','',NULL,''),(104,'岗位管理',1,5,'post','system/post/index',1,0,'C','0','0','system:post:list','job','admin','2018-03-16 11:33:00','',NULL,''),(105,'字典管理',1,6,'dict','system/dict/index',1,0,'C','0','0','system:dict:list','dict','admin','2018-03-16 11:33:00','',NULL,''),(106,'参数设置',1,7,'config','system/config/index',1,0,'C','0','0','system:config:list','edit','admin','2018-03-16 11:33:00','',NULL,''),(107,'通知公告',1,8,'notice','system/notice/index',1,0,'C','0','0','system:notice:list','message','admin','2018-03-16 11:33:00','',NULL,''),(108,'日志管理',1,9,'log','system/log/index',1,0,'M','0','0','','log','admin','2018-03-16 11:33:00','',NULL,''),(200,'权限管理',1,10,'permission','system/permission/index',1,0,'C','0','0','system:permission:list','lock','admin','2018-03-16 11:33:00','',NULL,''),(1000,'用户新增',100,1,'',NULL,1,0,'F','0','0','system:user:add','#','admin','2018-03-16 11:33:00','',NULL,''),(1001,'用户修改',100,2,'',NULL,1,0,'F','0','0','system:user:edit','#','admin','2018-03-16 11:33:00','',NULL,''),(1002,'用户删除',100,3,'',NULL,1,0,'F','0','0','system:user:remove','#','admin','2018-03-16 11:33:00','',NULL,''),(1003,'重置密码',100,4,'',NULL,1,0,'F','0','0','system:user:resetPwd','#','admin','2018-03-16 11:33:00','',NULL,''),(1004,'角色新增',101,1,'',NULL,1,0,'F','0','0','system:role:add','#','admin','2018-03-16 11:33:00','',NULL,''),(1005,'角色修改',101,2,'',NULL,1,0,'F','0','0','system:role:edit','#','admin','2018-03-16 11:33:00','',NULL,''),(1006,'角色删除',101,3,'',NULL,1,0,'F','0','0','system:role:remove','#','admin','2018-03-16 11:33:00','',NULL,''),(1007,'菜单新增',102,1,'',NULL,1,0,'F','0','0','system:menu:add','#','admin','2018-03-16 11:33:00','',NULL,''),(1008,'菜单修改',102,2,'',NULL,1,0,'F','0','0','system:menu:edit','#','admin','2018-03-16 11:33:00','',NULL,''),(1009,'菜单删除',102,3,'',NULL,1,0,'F','0','0','system:menu:remove','#','admin','2018-03-16 11:33:00','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` text COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'欢迎使用若依管理系统','1','若依管理系统是一套基于SpringBoot+Bootstrap的快速开发平台，欢迎使用！','0','admin','2024-01-01 10:00:00','',NULL,'欢迎公告'),(2,'系统更新通知','1','系统将于今晚22:00进行更新维护，届时系统将暂停服务2小时，请提前做好准备工作。','0','admin','2024-01-01 10:00:00','',NULL,'维护通知'),(3,'元旦放假通知','2','根据国家法定节假日规定，2024年元旦放假安排如下：2024年1月1日放假，共1天。','0','admin','2024-01-01 10:00:00','',NULL,'放假公告'),(4,'安全审计通知','1','为保障系统安全，我们将定期进行安全审计，请各位用户不要在系统中存储敏感信息。','0','admin','2024-01-01 10:00:00','',NULL,'安全提醒');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鏃ュ織涓婚敭',
  `title` varchar(50) DEFAULT '' COMMENT '妯″潡鏍囬?',
  `business_type` int DEFAULT '0' COMMENT '涓氬姟绫诲瀷锛?=鍏朵粬 1=鏂板? 2=淇?敼 3=鍒犻櫎锛',
  `method` varchar(100) DEFAULT '' COMMENT '鏂规硶鍚嶇О',
  `request_method` varchar(10) DEFAULT '' COMMENT '璇锋眰鏂瑰紡',
  `operator_type` int DEFAULT '0' COMMENT '鎿嶄綔绫诲埆锛?=鍏跺畠 1=鍚庡彴鐢ㄦ埛 2=鎵嬫満绔?敤鎴凤級',
  `oper_name` varchar(50) DEFAULT '' COMMENT '鎿嶄綔浜',
  `dept_name` varchar(50) DEFAULT '' COMMENT '閮ㄩ棬鍚嶇О',
  `oper_url` varchar(255) DEFAULT '' COMMENT '璇锋眰URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '涓绘満鍦板潃',
  `oper_location` varchar(255) DEFAULT '' COMMENT '鎿嶄綔鍦扮偣',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '璇锋眰鍙傛暟',
  `json_result` varchar(2000) DEFAULT '' COMMENT '杩斿洖鍙傛暟',
  `status` int DEFAULT '0' COMMENT '鎿嶄綔鐘舵?锛?姝ｅ父 1寮傚父锛',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '閿欒?娑堟伅',
  `oper_time` datetime DEFAULT NULL COMMENT '鎿嶄綔鏃堕棿',
  `cost_time` bigint DEFAULT '0' COMMENT '娑堣?鏃堕棿',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鎿嶄綔鏃ュ織琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'鐢ㄦ埛绠＄悊',1,'addUser','POST',1,'admin','鐮斿彂閮ㄩ棬','/system/user','127.0.0.1','鍐呯綉IP','{\"userName\":\"test\",\"nickName\":\"娴嬭瘯鐢ㄦ埛\"}','{\"userId\":100}',0,'','2024-01-15 09:30:00',125),(115,'User Management',1,'addUser','POST',1,'admin','RD','/system/user','127.0.0.1','Local','{\"userName\":\"test\"}','{\"userId\":100}',0,'','2024-01-15 09:30:00',125),(116,'User Management',2,'updateUser','PUT',1,'admin','RD','/system/user','127.0.0.1','Local','{\"userId\":2}','{\"userId\":2}',0,'','2024-01-15 10:15:00',89),(117,'User Management',3,'deleteUser','DELETE',1,'admin','RD','/system/user/3','127.0.0.1','Local','{\"userIds\":[3]}','{\"code\":200}',0,'','2024-01-15 11:20:00',156),(118,'Role Management',1,'addRole','POST',1,'admin','RD','/system/role','127.0.0.1','Local','{\"roleName\":\"test\"}','{\"roleId\":10}',0,'','2024-01-15 14:00:00',78),(119,'Role Management',2,'updateRole','PUT',1,'admin','RD','/system/role','127.0.0.1','Local','{\"roleId\":2}','{\"code\":200}',0,'','2024-01-15 15:30:00',95),(120,'Dept Management',1,'addDept','POST',1,'admin','RD','/system/dept','127.0.0.1','Local','{\"deptName\":\"dept\"}','{\"deptId\":110}',0,'','2024-01-16 09:00:00',110),(121,'Menu Management',2,'updateMenu','PUT',1,'admin','RD','/system/menu','127.0.0.1','Local','{\"menuId\":100}','{\"code\":200}',0,'','2024-01-16 10:30:00',68),(122,'System Config',2,'updateConfig','PUT',1,'admin','RD','/system/config','127.0.0.1','Local','{\"configKey\":\"key\"}','{\"code\":200}',0,'','2024-01-16 14:20:00',45),(123,'Dict Management',1,'addDict','POST',1,'admin','RD','/system/dict','127.0.0.1','Local','{\"dictName\":\"test\"}','{\"dictId\":20}',0,'','2024-01-17 09:15:00',130),(124,'Notice Management',3,'deleteNotice','DELETE',1,'admin','RD','/system/notice/5','127.0.0.1','Local','{\"noticeId\":5}','{\"code\":200}',0,'','2024-01-17 11:00:00',88),(125,'User Management',4,'listUser','GET',1,'admin','RD','/system/user/list','127.0.0.1','Local','{\"pageNum\":1}','{\"rows\":[]}',0,'','2024-01-17 14:30:00',230),(126,'Role Management',4,'listRole','GET',1,'admin','RD','/system/role/list','127.0.0.1','Local','{\"pageNum\":1}','{\"rows\":[]}',0,'','2024-01-17 15:00:00',180),(127,'User Management',1,'addUser','POST',1,'admin','RD','/system/user','127.0.0.1','Local','{\"userName\":\"test\"}','{\"userId\":100}',0,'','2024-01-15 09:30:00',125),(128,'User Management',2,'updateUser','PUT',1,'admin','RD','/system/user','127.0.0.1','Local','{\"userId\":2}','{\"userId\":2}',0,'','2024-01-15 10:15:00',89),(129,'User Management',3,'deleteUser','DELETE',1,'admin','RD','/system/user/3','127.0.0.1','Local','{\"userIds\":[3]}','{\"code\":200}',0,'','2024-01-15 11:20:00',156),(130,'Role Management',1,'addRole','POST',1,'admin','RD','/system/role','127.0.0.1','Local','{\"roleName\":\"test\"}','{\"roleId\":10}',0,'','2024-01-15 14:00:00',78),(131,'Role Management',2,'updateRole','PUT',1,'admin','RD','/system/role','127.0.0.1','Local','{\"roleId\":2}','{\"code\":200}',0,'','2024-01-15 15:30:00',95),(132,'Dept Management',1,'addDept','POST',1,'admin','RD','/system/dept','127.0.0.1','Local','{\"deptName\":\"dept\"}','{\"deptId\":110}',0,'','2024-01-16 09:00:00',110),(133,'Menu Management',2,'updateMenu','PUT',1,'admin','RD','/system/menu','127.0.0.1','Local','{\"menuId\":100}','{\"code\":200}',0,'','2024-01-16 10:30:00',68),(134,'System Config',2,'updateConfig','PUT',1,'admin','RD','/system/config','127.0.0.1','Local','{\"configKey\":\"key\"}','{\"code\":200}',0,'','2024-01-16 14:20:00',45),(135,'Dict Management',1,'addDict','POST',1,'admin','RD','/system/dict','127.0.0.1','Local','{\"dictName\":\"test\"}','{\"dictId\":20}',0,'','2024-01-17 09:15:00',130),(136,'Notice Management',3,'deleteNotice','DELETE',1,'admin','RD','/system/notice/5','127.0.0.1','Local','{\"noticeId\":5}','{\"code\":200}',0,'','2024-01-17 11:00:00',88),(137,'User Management',4,'listUser','GET',1,'admin','RD','/system/user/list','127.0.0.1','Local','{\"pageNum\":1}','{\"rows\":[]}',0,'','2024-01-17 14:30:00',230),(138,'Role Management',4,'listRole','GET',1,'admin','RD','/system/role/list','127.0.0.1','Local','{\"pageNum\":1}','{\"rows\":[]}',0,'','2024-01-17 15:00:00',180),(139,'权限状态修改',2,'com.ruoyi.project.system.controller.SysPermissionController.changeStatus()','PUT',1,'admin',NULL,'/system/permission/changeStatus','127.0.0.1','内网IP','{\"params\":{},\"updateBy\":\"admin\",\"id\":1,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-02-21 23:29:52',0),(140,'用户头像',2,'com.ruoyi.project.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/02/22/c857bc5e-ec8f-4015-9c4c-158ca19349fb.jpeg\",\"code\":200}',0,NULL,'2026-02-22 00:00:02',0),(141,'个人信息',2,'com.ruoyi.project.system.controller.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1704074400000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"admin@ruoyi.com\",\"nickName\":\"admin\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"admin\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1704074400000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-02-22 00:00:04',0),(142,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2','127.0.0.1','内网IP','{menuId=2}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}',0,NULL,'2026-02-22 00:12:21',0),(143,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2','127.0.0.1','内网IP','{menuId=2}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}',0,NULL,'2026-02-22 00:12:26',0),(144,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"0\",\"menuName\":\"公司主页\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://max-gao.github.io/my-website/root/zh/index.html\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-02-22 00:14:24',0),(145,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"0\",\"menuName\":\"个人主页\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://max-gao.github.io/my-website/root/zh/index.html\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-02-22 00:14:48',0),(146,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"tree-table\",\"orderNum\":\"2\",\"menuName\":\"菜单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"menu\",\"component\":\"system/menu/index\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":102,\"menuType\":\"C\",\"perms\":\"system:menu:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-02-22 00:15:21',0),(147,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2','127.0.0.1','内网IP','{menuId=2}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}',0,NULL,'2026-02-22 00:17:50',0),(148,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"0\",\"menuName\":\"deepseek\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://max-gao.github.io/my-website/root/zh/index.html\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-02-22 00:18:47',0),(149,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"0\",\"menuName\":\"deepseek\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://chat.deepseek.com/\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-02-22 00:19:02',0),(150,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.changeStatus()','PUT',1,'admin',NULL,'/system/role/changeStatus','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":1,\"admin\":true,\"params\":{},\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"status\":\"1\"}','null',1,'不允许操作超级管理员角色','2026-02-22 19:34:41',0);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鏉冮檺ID',
  `permission_name` varchar(50) NOT NULL COMMENT '鏉冮檺鍚嶇О',
  `permission_code` varchar(100) NOT NULL COMMENT '鏉冮檺鏍囪瘑',
  `permission_type` char(1) DEFAULT '1' COMMENT '鏉冮檺绫诲瀷锛?=鑿滃崟 2=鎸夐挳 3=鎺ュ彛锛',
  `module_name` varchar(50) DEFAULT '' COMMENT '鎵?睘妯″潡',
  `parent_id` bigint DEFAULT '0' COMMENT '鐖舵潈闄怚D',
  `order_num` int DEFAULT '0' COMMENT '鏄剧ず椤哄簭',
  `status` char(1) DEFAULT '0' COMMENT '鐘舵?锛?姝ｅ父 1鍋滅敤锛',
  `create_by` varchar(64) DEFAULT '' COMMENT '鍒涘缓鑰',
  `create_time` datetime DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `update_by` varchar(64) DEFAULT '' COMMENT '鏇存柊鑰',
  `update_time` datetime DEFAULT NULL COMMENT '鏇存柊鏃堕棿',
  `remark` varchar(500) DEFAULT NULL COMMENT '澶囨敞',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鏉冮檺琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES (1,'User List','system:user:list','2','System',0,1,'1','admin','2024-01-15 10:00:00','admin','2026-02-21 23:29:52','User List Permission'),(2,'User Add','system:user:add','2','System',0,2,'0','admin','2024-01-15 10:00:00','',NULL,'User Add Permission'),(3,'User Edit','system:user:edit','2','System',0,3,'0','admin','2024-01-15 10:00:00','',NULL,'User Edit Permission'),(4,'User Delete','system:user:remove','2','System',0,4,'0','admin','2024-01-15 10:00:00','',NULL,'User Delete Permission'),(5,'Role List','system:role:list','2','System',0,5,'0','admin','2024-01-15 10:00:00','',NULL,'Role List Permission'),(6,'Role Add','system:role:add','2','System',0,6,'0','admin','2024-01-15 10:00:00','',NULL,'Role Add Permission'),(7,'Role Edit','system:role:edit','2','System',0,7,'0','admin','2024-01-15 10:00:00','',NULL,'Role Edit Permission'),(8,'Menu List','system:menu:list','2','System',0,8,'0','admin','2024-01-15 10:00:00','',NULL,'Menu List Permission'),(9,'Dept List','system:dept:list','2','System',0,9,'0','admin','2024-01-15 10:00:00','',NULL,'Dept List Permission'),(10,'Permission List','system:permission:list','2','System',0,10,'0','admin','2024-01-15 10:00:00','',NULL,'Permission List Permission'),(11,'User List','system:user:list','2','System',0,1,'0','admin','2024-01-15 10:00:00','',NULL,'User List Permission'),(12,'User Add','system:user:add','2','System',0,2,'0','admin','2024-01-15 10:00:00','',NULL,'User Add Permission'),(13,'User Edit','system:user:edit','2','System',0,3,'0','admin','2024-01-15 10:00:00','',NULL,'User Edit Permission'),(14,'User Delete','system:user:remove','2','System',0,4,'0','admin','2024-01-15 10:00:00','',NULL,'User Delete Permission'),(15,'Role List','system:role:list','2','System',0,5,'0','admin','2024-01-15 10:00:00','',NULL,'Role List Permission'),(16,'Role Add','system:role:add','2','System',0,6,'0','admin','2024-01-15 10:00:00','',NULL,'Role Add Permission'),(17,'Role Edit','system:role:edit','2','System',0,7,'0','admin','2024-01-15 10:00:00','',NULL,'Role Edit Permission'),(18,'Menu List','system:menu:list','2','System',0,8,'0','admin','2024-01-15 10:00:00','',NULL,'Menu List Permission'),(19,'Dept List','system:dept:list','2','System',0,9,'0','admin','2024-01-15 10:00:00','',NULL,'Dept List Permission'),(20,'Permission List','system:permission:list','2','System',0,10,'0','admin','2024-01-15 10:00:00','',NULL,'Permission List Permission');
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission_role`
--

DROP TABLE IF EXISTS `sys_permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_permission_role` (
  `permission_id` bigint NOT NULL COMMENT '鏉冮檺ID',
  `role_id` bigint NOT NULL COMMENT '瑙掕壊ID',
  PRIMARY KEY (`permission_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鏉冮檺鍜岃?鑹插叧鑱旇〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission_role`
--

LOCK TABLES `sys_permission_role` WRITE;
/*!40000 ALTER TABLE `sys_permission_role` DISABLE KEYS */;
INSERT INTO `sys_permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(11,1),(12,1),(13,1),(14,1),(15,1);
/*!40000 ALTER TABLE `sys_permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位id',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2018-03-16 11:33:00','',NULL,''),(2,'se','项目经理',2,'0','admin','2018-03-16 11:33:00','',NULL,''),(3,'dev','开发人员',3,'0','admin','2018-03-16 11:33:00','',NULL,''),(4,'test','测试人员',4,'0','admin','2018-03-16 11:33:00','',NULL,''),(5,'hr','人事专员',5,'0','admin','2018-03-16 11:33:00','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` varchar(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：所有数据权限；2：自定义数据权限；3：本部门数据权限；4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin','1','1',1,1,'0','0','admin','2018-03-16 11:33:00','',NULL,'超级管理员'),(2,'普通角色','common','2','2',1,1,'0','0','admin','2018-03-16 11:33:00','',NULL,'普通角色'),(3,'部门经理','dept_manager','3','3',1,1,'0','0','admin','2018-03-16 11:33:00','',NULL,'部门经理'),(4,'项目经理','project_manager','4','3',1,1,'0','0','admin','2018-03-16 11:33:00','',NULL,'项目经理');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色id',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(2,103),(3,103),(3,104),(4,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色id',
  `menu_id` bigint NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,1),(1,2),(1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,200),(2,1),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(3,1),(3,100),(3,101),(3,103),(3,104),(4,1),(4,100),(4,1000),(4,1001),(4,1002),(4,1003);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '用户头像',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `salt` varchar(100) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录ip',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','admin','00','admin@ruoyi.com','15888888888','1','/profile/avatar/2026/02/22/c857bc5e-ec8f-4015-9c4c-158ca19349fb.jpeg','$2a$10$Nu0DwyFVCniJK9/U8JgD.uFPHIGwB4G1FAGDibUrbD8SkhBY66eMO','a2a7a9','0','0','127.0.0.1','2024-01-01 10:00:00','admin','2024-01-01 10:00:00','','2026-02-22 00:00:04','管理员'),(2,104,'ry','若依','00','ry@163.com','15666666666','1','','$2a$10$Nu0DwyFVCniJK9/U8JgD.uFPHIGwB4G1FAGDibUrbD8SkhBY66eMO','a2a7a9','0','0','127.0.0.1','2024-01-01 10:00:00','admin','2024-01-01 10:00:00','admin','2026-02-21 22:37:40','测试用户'),(3,105,'test','测试员','00','test@ruoyi.com','15788888888','0','','$2a$10$Nu0DwyFVCniJK9/U8JgD.uFPHIGwB4G1FAGDibUrbD8SkhBY66eMO','a2a7a9','0','0','127.0.0.1','2024-01-01 10:00:00','admin','2024-01-01 10:00:00','admin','2026-02-21 22:37:43','测试用户'),(4,106,'dev','开发者','00','dev@ruoyi.com','15800000000','0','','$2a$10$Nu0DwyFVCniJK9/U8JgD.uFPHIGwB4G1FAGDibUrbD8SkhBY66eMO','a2a7a9','0','0','127.0.0.1','2024-01-01 10:00:00','admin','2024-01-01 10:00:00','admin','2026-02-21 22:37:45','开发人员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户id',
  `post_id` bigint NOT NULL COMMENT '岗位id',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(1,2),(2,3),(3,4),(4,3);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(3,2),(4,3);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-22 19:55:16
