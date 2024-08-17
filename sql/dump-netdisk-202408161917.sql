-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: netdisk
-- ------------------------------------------------------
-- Server version	5.7.44-log

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
-- Table structure for table `disk_file`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disk_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `old_name` varchar(255) DEFAULT NULL COMMENT '旧文件名',
  `size` bigint(20) DEFAULT '0' COMMENT '文件大小',
  `url` varchar(500) DEFAULT NULL COMMENT '文件地址',
  `type` int(11) DEFAULT '5' COMMENT '文件类型 5:文件夹',
  `parent_id` bigint(20) DEFAULT '0',
  `is_dir` tinyint(4) DEFAULT '0' COMMENT '是否是目录',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_file`
--

--
-- Table structure for table `disk_recovery_file`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disk_recovery_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件id',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='回收文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_recovery_file`
--

--
-- Table structure for table `disk_sensitive_word`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disk_sensitive_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_name` varchar(64) NOT NULL COMMENT '添加人',
  `sensitive_word` varchar(30) NOT NULL COMMENT '敏感词',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 COMMENT='敏感词';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_sensitive_word`
--

LOCK TABLES `disk_sensitive_word` WRITE;
/*!40000 ALTER TABLE `disk_sensitive_word` DISABLE KEYS */;
INSERT INTO `disk_sensitive_word` VALUES (165,'admin','共产党',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (166,'admin','习近平',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (167,'admin','毛主席',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (168,'admin','新关键字',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (169,'admin','色情',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (170,'admin','赌博',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (171,'admin','吸毒',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (172,'admin','杀死',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (173,'admin','国家级',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (174,'admin','世界级',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (175,'admin','终极',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (176,'admin','最牛逼',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (177,'admin','全国首家',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (178,'admin','世界顶尖',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (179,'admin','毛泽东',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (180,'admin','共产党',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (181,'admin','日他妈',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (182,'admin','非典',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (183,'admin','她妈',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (184,'admin','和谐',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (185,'admin','艾滋病',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (186,'admin','色情',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (187,'admin','暴力',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (188,'admin','赌博',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (189,'admin','黄色',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (190,'admin','打赌',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (191,'admin','毒品',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (192,'admin','反动',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (193,'admin','藏独',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (194,'admin','台独',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (195,'admin','港独',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (196,'admin','推翻',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (197,'admin','邓小平',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (198,'admin','江泽民',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (199,'admin','贿赂',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (200,'admin','淫秽',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (201,'admin','吸毒',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (202,'admin','枪支',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (203,'admin','反共',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (204,'admin','毛泽东复活',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (205,'admin','三唑仑迷魂药',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (206,'admin','出售工字气枪铅弹',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (207,'admin','踩踏',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (208,'admin','爆炸性',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (209,'admin','乱伦',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (210,'admin','反共',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (211,'admin','法轮功传播',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (212,'admin','藏枪',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (213,'admin','暴力',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (214,'admin','台独暴力',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (215,'admin','黄色网站',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (216,'admin','黄色交易',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (217,'admin','抢爆',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (218,'admin',' 散布谣言',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (219,'admin','赌博',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (220,'admin','煽动非法集会',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (221,'admin','骚扰',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (222,'admin','侵害',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (223,'admin','粗俗',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (224,'admin','猥亵',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (225,'admin','结社',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (226,'admin','封建迷信',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (227,'admin','民族歧视',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (228,'admin','破坏民族团结',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (229,'admin','损害国家荣誉和利益',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (230,'admin','凶杀',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (231,'admin','国家宗教政策',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (232,'admin','游行',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (233,'admin','西藏动乱',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (234,'admin','草拟',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (235,'admin','操你妈',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (236,'admin','操你',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (237,'admin','房事',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (238,'admin','丰满',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (239,'admin','人流',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (240,'admin','美胸',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (241,'admin','男人',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (242,'admin','增粗',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (243,'admin','堕胎',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (244,'admin','整容',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (245,'admin','妊娠',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (246,'admin','男性',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (247,'admin','情趣',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (248,'admin','肛裂',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (249,'admin','性趣',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (250,'admin','鼻炎',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (251,'admin','功夫汤',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (252,'admin','爆',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (253,'admin','白带',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (254,'admin','老婆',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (255,'admin','催情',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (256,'admin','紧',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (257,'admin','丰胸',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (258,'admin','女人',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (259,'admin','女性',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (260,'admin','胸',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (261,'admin','阿波罗',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (262,'admin','癌症',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (263,'admin','满足',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (264,'admin','老总',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (265,'admin','狐臭',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (266,'admin','糜烂',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (267,'admin','成人',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (268,'admin','痔疮',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (269,'admin','太平公主',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (270,'admin','勃起',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (271,'admin','医疗',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (272,'admin','红肿',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (273,'admin','尖叫',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (274,'admin','整形',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (275,'admin','早泄',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (276,'admin','生殖器',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (277,'admin','小儿脑瘫',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (278,'admin','激情',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (279,'admin','又粗又大',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (280,'admin','排卵',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (281,'admin','性交',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (282,'admin','痛经',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (283,'admin','性福',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (284,'admin','避孕',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (285,'admin','妇科病',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (286,'admin','计生',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (287,'admin','瘦身',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (288,'admin','无痛',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (289,'admin','个人护理',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (290,'admin','前列腺',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (291,'admin','医院',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (292,'admin','射精',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (293,'admin','包茎',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (294,'admin','乳腺',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (295,'admin','夜',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (296,'admin','偷偷',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (297,'admin','包皮',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (298,'admin','停经',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (299,'admin','阴茎',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (300,'admin','偷看',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (301,'admin','透视',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (302,'admin','减肥',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (303,'admin','领导',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (304,'admin','考试设备',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (305,'admin','缩阴',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (306,'admin','遗精',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (307,'admin','性病',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (308,'admin','阳萎',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (309,'admin','聚光体',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (310,'admin','妇科',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (311,'admin','男科',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (312,'admin','老公',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (313,'admin','泌尿',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (314,'admin','阳痿',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (315,'admin','增高',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (316,'admin','持久',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (317,'admin','白领',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (318,'admin','阴道',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (319,'admin','增大',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (320,'admin','意外怀孕',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (321,'admin','GDKEYTEST',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (322,'admin','首页',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (323,'admin','你妹',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (324,'admin','差评',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (325,'admin','nimei',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (326,'admin','chaping',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (327,'admin','蔡英文',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (328,'admin','m12345678',NULL,NULL);
INSERT INTO `disk_sensitive_word` VALUES (329,'admin','做爱','2024-04-17 02:30:51',NULL);
INSERT INTO `disk_sensitive_word` VALUES (331,'admin','约炮','2024-04-18 00:01:49',NULL);
INSERT INTO `disk_sensitive_word` VALUES (332,'admin','啪啪','2024-04-18 00:11:24','2024-04-18 00:11:42');
INSERT INTO `disk_sensitive_word` VALUES (333,'admin','乱摸','2024-04-18 00:32:30',NULL);
INSERT INTO `disk_sensitive_word` VALUES (334,'admin','肉体','2024-04-18 00:32:41',NULL);
/*!40000 ALTER TABLE `disk_sensitive_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disk_share_file`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disk_share_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_ids` varchar(100) DEFAULT NULL COMMENT '分享的文件ids',
  `all_file_ids` varchar(255) DEFAULT NULL COMMENT '所有的文件id',
  `uuid` varchar(100) DEFAULT NULL,
  `secret_key` varchar(100) DEFAULT NULL,
  `expiration_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_permanent` tinyint(4) DEFAULT '0',
  `type` varchar(10) DEFAULT '0' COMMENT '分享形式0：私密 1：公开',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分享文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_share_file`
--

--
-- Table structure for table `disk_storage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disk_storage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `base_dir` varchar(255) DEFAULT NULL COMMENT '基础目录',
  `total_capacity` bigint(20) DEFAULT '0',
  `used_capacity` bigint(20) DEFAULT '0' COMMENT '已用容量',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='存储信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disk_storage`
--

--
-- Table structure for table `gen_table`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `gen_table_column`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `sys_chunk`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_chunk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `chunk_number` int(11) NOT NULL COMMENT '文件块编号',
  `chunk_size` bigint(20) NOT NULL COMMENT '分块大小',
  `current_chunk_size` bigint(20) NOT NULL COMMENT '当前分块大小',
  `filename` varchar(255) NOT NULL COMMENT '文件名',
  `identifier` varchar(255) NOT NULL COMMENT '文件标识,MD5',
  `relative_path` varchar(255) NOT NULL COMMENT '相对路径',
  `total_chunks` int(11) NOT NULL COMMENT '总块数',
  `total_size` bigint(20) NOT NULL COMMENT '总大小',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件分片记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_chunk`
--

LOCK TABLES `sys_chunk` WRITE;
/*!40000 ALTER TABLE `sys_chunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-01-05 23:56:00','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-01-05 23:56:00','',NULL,'初始化密码 123456');
INSERT INTO `sys_config` VALUES (3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-01-05 23:56:00','',NULL,'深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-01-05 23:56:00','',NULL,'是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5,'账号自助-是否开启用户注册功能','sys.account.registerUser','true','Y','admin','2024-01-05 23:56:01','admin','2024-04-12 00:42:17','是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-01-05 23:56:01','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7,'初始化存储大小','storage.capacity','20000000000','Y','admin','2024-04-14 02:53:01','admin','2024-04-14 02:53:19','单位字节如20g=20000000000字节');
INSERT INTO `sys_config` VALUES (8,'是否开启敏感词检测','sensitiveWord.ifFilter','true','Y','admin','2024-04-17 01:14:49','',NULL,'true：开启 false：不开启');
INSERT INTO `sys_config` VALUES (9,'前端访问地址','font.baseUrl','http://127.0.0.1/netdisk','Y','admin','2024-06-13 13:34:40','',NULL,'用于分享文件');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-01-05 23:55:53','',NULL,'性别男');
INSERT INTO `sys_dict_data` VALUES (2,2,'女','1','sys_user_sex','','','N','0','admin','2024-01-05 23:55:53','',NULL,'性别女');
INSERT INTO `sys_dict_data` VALUES (3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-01-05 23:55:53','',NULL,'性别未知');
INSERT INTO `sys_dict_data` VALUES (4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-01-05 23:55:53','',NULL,'显示菜单');
INSERT INTO `sys_dict_data` VALUES (5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-01-05 23:55:54','',NULL,'隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-01-05 23:55:54','',NULL,'正常状态');
INSERT INTO `sys_dict_data` VALUES (7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-01-05 23:55:54','',NULL,'停用状态');
INSERT INTO `sys_dict_data` VALUES (8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-01-05 23:55:54','',NULL,'正常状态');
INSERT INTO `sys_dict_data` VALUES (9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-01-05 23:55:55','',NULL,'停用状态');
INSERT INTO `sys_dict_data` VALUES (10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-01-05 23:55:55','',NULL,'默认分组');
INSERT INTO `sys_dict_data` VALUES (11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-01-05 23:55:55','',NULL,'系统分组');
INSERT INTO `sys_dict_data` VALUES (12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-01-05 23:55:55','',NULL,'系统默认是');
INSERT INTO `sys_dict_data` VALUES (13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-01-05 23:55:55','',NULL,'系统默认否');
INSERT INTO `sys_dict_data` VALUES (14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-01-05 23:55:56','',NULL,'通知');
INSERT INTO `sys_dict_data` VALUES (15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-01-05 23:55:56','',NULL,'公告');
INSERT INTO `sys_dict_data` VALUES (16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-01-05 23:55:56','',NULL,'正常状态');
INSERT INTO `sys_dict_data` VALUES (17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-01-05 23:55:56','',NULL,'关闭状态');
INSERT INTO `sys_dict_data` VALUES (18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-01-05 23:55:56','',NULL,'其他操作');
INSERT INTO `sys_dict_data` VALUES (19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-01-05 23:55:57','',NULL,'新增操作');
INSERT INTO `sys_dict_data` VALUES (20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-01-05 23:55:57','',NULL,'修改操作');
INSERT INTO `sys_dict_data` VALUES (21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-01-05 23:55:57','',NULL,'删除操作');
INSERT INTO `sys_dict_data` VALUES (22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-01-05 23:55:57','',NULL,'授权操作');
INSERT INTO `sys_dict_data` VALUES (23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-01-05 23:55:58','',NULL,'导出操作');
INSERT INTO `sys_dict_data` VALUES (24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-01-05 23:55:58','',NULL,'导入操作');
INSERT INTO `sys_dict_data` VALUES (25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-01-05 23:55:58','',NULL,'强退操作');
INSERT INTO `sys_dict_data` VALUES (26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-01-05 23:55:58','',NULL,'生成操作');
INSERT INTO `sys_dict_data` VALUES (27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-01-05 23:55:58','',NULL,'清空操作');
INSERT INTO `sys_dict_data` VALUES (28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-01-05 23:55:59','',NULL,'正常状态');
INSERT INTO `sys_dict_data` VALUES (29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-01-05 23:55:59','',NULL,'停用状态');
INSERT INTO `sys_dict_data` VALUES (100,0,'图片','0','file_type',NULL,'default','N','0','admin','2024-04-11 22:41:50','',NULL,NULL);
INSERT INTO `sys_dict_data` VALUES (101,0,'视频','1','file_type',NULL,'default','N','0','admin','2024-04-11 22:42:13','',NULL,NULL);
INSERT INTO `sys_dict_data` VALUES (102,0,'文档','2','file_type',NULL,'default','N','0','admin','2024-04-11 22:42:22','',NULL,NULL);
INSERT INTO `sys_dict_data` VALUES (103,0,'音乐','3','file_type',NULL,'default','N','0','admin','2024-04-11 22:43:29','',NULL,NULL);
INSERT INTO `sys_dict_data` VALUES (104,0,'其他','4','file_type',NULL,'default','N','0','admin','2024-04-11 22:43:44','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-01-05 23:55:50','',NULL,'用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2,'菜单状态','sys_show_hide','0','admin','2024-01-05 23:55:50','',NULL,'菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3,'系统开关','sys_normal_disable','0','admin','2024-01-05 23:55:50','',NULL,'系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4,'任务状态','sys_job_status','0','admin','2024-01-05 23:55:50','',NULL,'任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5,'任务分组','sys_job_group','0','admin','2024-01-05 23:55:51','',NULL,'任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6,'系统是否','sys_yes_no','0','admin','2024-01-05 23:55:51','',NULL,'系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7,'通知类型','sys_notice_type','0','admin','2024-01-05 23:55:51','',NULL,'通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8,'通知状态','sys_notice_status','0','admin','2024-01-05 23:55:51','',NULL,'通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9,'操作类型','sys_oper_type','0','admin','2024-01-05 23:55:52','',NULL,'操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10,'系统状态','sys_common_status','0','admin','2024-01-05 23:55:52','',NULL,'登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100,'文件类型','file_type','0','admin','2024-04-11 22:37:01','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_filelist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_filelist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `filename` varchar(200) NOT NULL COMMENT '文件名',
  `identifier` varchar(50) NOT NULL COMMENT '唯一标识,MD5',
  `url` varchar(200) NOT NULL COMMENT '链接',
  `location` varchar(200) DEFAULT NULL COMMENT '本地地址',
  `total_size` bigint(20) DEFAULT NULL COMMENT '文件总大小',
  PRIMARY KEY (`id`),
  UNIQUE KEY `FILE_UNIQUE_KEY` (`filename`,`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_filelist`
--

LOCK TABLES `sys_filelist` WRITE;
/*!40000 ALTER TABLE `sys_filelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_filelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-01-05 23:56:02','',NULL,'');
INSERT INTO `sys_job` VALUES (2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-01-05 23:56:02','',NULL,'');
INSERT INTO `sys_job` VALUES (3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-01-05 23:56:02','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_menu`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2046 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-01-05 23:55:12','',NULL,'系统管理目录');
INSERT INTO `sys_menu` VALUES (2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-01-05 23:55:12','',NULL,'系统监控目录');
INSERT INTO `sys_menu` VALUES (3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-01-05 23:55:12','',NULL,'系统工具目录');
INSERT INTO `sys_menu` VALUES (100,'管理员信息',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-01-05 23:55:13','admin','2024-01-06 21:44:32','用户管理菜单');
INSERT INTO `sys_menu` VALUES (101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-01-05 23:55:13','',NULL,'角色管理菜单');
INSERT INTO `sys_menu` VALUES (102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-01-05 23:55:13','',NULL,'菜单管理菜单');
INSERT INTO `sys_menu` VALUES (105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-01-05 23:55:14','',NULL,'字典管理菜单');
INSERT INTO `sys_menu` VALUES (106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-01-05 23:55:14','',NULL,'参数设置菜单');
INSERT INTO `sys_menu` VALUES (107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-01-05 23:55:14','',NULL,'通知公告菜单');
INSERT INTO `sys_menu` VALUES (108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-01-05 23:55:14','',NULL,'日志管理菜单');
INSERT INTO `sys_menu` VALUES (109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-01-05 23:55:14','',NULL,'在线用户菜单');
INSERT INTO `sys_menu` VALUES (110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-01-05 23:55:15','',NULL,'定时任务菜单');
INSERT INTO `sys_menu` VALUES (111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-01-05 23:55:15','',NULL,'数据监控菜单');
INSERT INTO `sys_menu` VALUES (112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-01-05 23:55:15','',NULL,'服务监控菜单');
INSERT INTO `sys_menu` VALUES (113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-01-05 23:55:15','',NULL,'缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-01-05 23:55:16','',NULL,'缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-01-05 23:55:16','',NULL,'表单构建菜单');
INSERT INTO `sys_menu` VALUES (116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-01-05 23:55:16','',NULL,'代码生成菜单');
INSERT INTO `sys_menu` VALUES (117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-01-05 23:55:16','',NULL,'系统接口菜单');
INSERT INTO `sys_menu` VALUES (500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-01-05 23:55:16','',NULL,'操作日志菜单');
INSERT INTO `sys_menu` VALUES (501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-01-05 23:55:16','',NULL,'登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-01-05 23:55:17','',NULL,'');
INSERT INTO `sys_menu` VALUES (1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-01-05 23:55:17','',NULL,'');
INSERT INTO `sys_menu` VALUES (1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-01-05 23:55:17','',NULL,'');
INSERT INTO `sys_menu` VALUES (1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-01-05 23:55:17','',NULL,'');
INSERT INTO `sys_menu` VALUES (1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-01-05 23:55:18','',NULL,'');
INSERT INTO `sys_menu` VALUES (1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-01-05 23:55:18','',NULL,'');
INSERT INTO `sys_menu` VALUES (1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-01-05 23:55:18','',NULL,'');
INSERT INTO `sys_menu` VALUES (1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-01-05 23:55:18','',NULL,'');
INSERT INTO `sys_menu` VALUES (1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-01-05 23:55:18','',NULL,'');
INSERT INTO `sys_menu` VALUES (1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-01-05 23:55:19','',NULL,'');
INSERT INTO `sys_menu` VALUES (1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-01-05 23:55:19','',NULL,'');
INSERT INTO `sys_menu` VALUES (1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-01-05 23:55:19','',NULL,'');
INSERT INTO `sys_menu` VALUES (1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-01-05 23:55:19','',NULL,'');
INSERT INTO `sys_menu` VALUES (1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-01-05 23:55:19','',NULL,'');
INSERT INTO `sys_menu` VALUES (1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-01-05 23:55:20','',NULL,'');
INSERT INTO `sys_menu` VALUES (1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-01-05 23:55:20','',NULL,'');
INSERT INTO `sys_menu` VALUES (1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-01-05 23:55:22','',NULL,'');
INSERT INTO `sys_menu` VALUES (1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-01-05 23:55:22','',NULL,'');
INSERT INTO `sys_menu` VALUES (1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-01-05 23:55:22','',NULL,'');
INSERT INTO `sys_menu` VALUES (1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-01-05 23:55:23','',NULL,'');
INSERT INTO `sys_menu` VALUES (1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-01-05 23:55:23','',NULL,'');
INSERT INTO `sys_menu` VALUES (1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-01-05 23:55:23','',NULL,'');
INSERT INTO `sys_menu` VALUES (1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-01-05 23:55:23','',NULL,'');
INSERT INTO `sys_menu` VALUES (1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-01-05 23:55:23','',NULL,'');
INSERT INTO `sys_menu` VALUES (1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-01-05 23:55:24','',NULL,'');
INSERT INTO `sys_menu` VALUES (1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-01-05 23:55:24','',NULL,'');
INSERT INTO `sys_menu` VALUES (1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-01-05 23:55:24','',NULL,'');
INSERT INTO `sys_menu` VALUES (1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-01-05 23:55:24','',NULL,'');
INSERT INTO `sys_menu` VALUES (1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-01-05 23:55:24','',NULL,'');
INSERT INTO `sys_menu` VALUES (1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-01-05 23:55:25','',NULL,'');
INSERT INTO `sys_menu` VALUES (1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-01-05 23:55:25','',NULL,'');
INSERT INTO `sys_menu` VALUES (1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-01-05 23:55:25','',NULL,'');
INSERT INTO `sys_menu` VALUES (1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-01-05 23:55:25','',NULL,'');
INSERT INTO `sys_menu` VALUES (1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-01-05 23:55:25','',NULL,'');
INSERT INTO `sys_menu` VALUES (1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-01-05 23:55:25','',NULL,'');
INSERT INTO `sys_menu` VALUES (1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-01-05 23:55:25','',NULL,'');
INSERT INTO `sys_menu` VALUES (1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-01-05 23:55:25','',NULL,'');
INSERT INTO `sys_menu` VALUES (1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-01-05 23:55:26','',NULL,'');
INSERT INTO `sys_menu` VALUES (1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-01-05 23:55:26','',NULL,'');
INSERT INTO `sys_menu` VALUES (1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-01-05 23:55:26','',NULL,'');
INSERT INTO `sys_menu` VALUES (1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-01-05 23:55:26','',NULL,'');
INSERT INTO `sys_menu` VALUES (1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-01-05 23:55:26','',NULL,'');
INSERT INTO `sys_menu` VALUES (1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-01-05 23:55:26','',NULL,'');
INSERT INTO `sys_menu` VALUES (1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-01-05 23:55:26','',NULL,'');
INSERT INTO `sys_menu` VALUES (1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-01-05 23:55:26','',NULL,'');
INSERT INTO `sys_menu` VALUES (1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-01-05 23:55:26','',NULL,'');
INSERT INTO `sys_menu` VALUES (1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-01-05 23:55:26','',NULL,'');
INSERT INTO `sys_menu` VALUES (1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-01-05 23:55:27','',NULL,'');
INSERT INTO `sys_menu` VALUES (1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-01-05 23:55:27','',NULL,'');
INSERT INTO `sys_menu` VALUES (1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-01-05 23:55:27','',NULL,'');
INSERT INTO `sys_menu` VALUES (1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-01-05 23:55:27','',NULL,'');
INSERT INTO `sys_menu` VALUES (1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-01-05 23:55:27','',NULL,'');
INSERT INTO `sys_menu` VALUES (2000,'C端客户',1,1,'custom','system/custom/index',NULL,1,0,'C','0','0','system:user:list','user','admin','2024-01-06 21:46:56','',NULL,'');
INSERT INTO `sys_menu` VALUES (2001,'网盘',0,4,'disk',NULL,NULL,1,0,'M','0','0','','education','admin','2024-04-11 22:30:11','admin','2024-04-11 22:30:36','');
INSERT INTO `sys_menu` VALUES (2002,'全部文件',2001,1,'file','disk/file/index','',1,0,'C','0','0','disk:file:list','#','admin','2024-04-11 22:58:50','admin','2024-04-12 20:28:21','文件菜单');
INSERT INTO `sys_menu` VALUES (2003,'文件查询',2002,1,'#','',NULL,1,0,'F','0','0','disk:file:query','#','admin','2024-04-11 22:58:51','',NULL,'');
INSERT INTO `sys_menu` VALUES (2004,'文件新增',2002,2,'#','',NULL,1,0,'F','0','0','disk:file:add','#','admin','2024-04-11 22:58:51','',NULL,'');
INSERT INTO `sys_menu` VALUES (2005,'文件修改',2002,3,'#','',NULL,1,0,'F','0','0','disk:file:edit','#','admin','2024-04-11 22:58:51','',NULL,'');
INSERT INTO `sys_menu` VALUES (2006,'文件删除',2002,4,'#','',NULL,1,0,'F','0','0','disk:file:remove','#','admin','2024-04-11 22:58:51','',NULL,'');
INSERT INTO `sys_menu` VALUES (2007,'文件导出',2002,5,'#','',NULL,1,0,'F','0','0','disk:file:export','#','admin','2024-04-11 22:58:51','',NULL,'');
INSERT INTO `sys_menu` VALUES (2008,'回收站',2001,7,'recovery','disk/recovery/index',NULL,1,0,'C','0','0','disk:recovery:list','#','admin','2024-04-11 22:59:12','admin','2024-04-12 20:24:46','回收站菜单');
INSERT INTO `sys_menu` VALUES (2009,'回收站查询',2008,1,'#','',NULL,1,0,'F','0','0','disk:recovery:query','#','admin','2024-04-11 22:59:12','',NULL,'');
INSERT INTO `sys_menu` VALUES (2010,'回收站新增',2008,2,'#','',NULL,1,0,'F','0','0','disk:recovery:add','#','admin','2024-04-11 22:59:12','',NULL,'');
INSERT INTO `sys_menu` VALUES (2011,'回收站修改',2008,3,'#','',NULL,1,0,'F','0','0','disk:recovery:edit','#','admin','2024-04-11 22:59:12','',NULL,'');
INSERT INTO `sys_menu` VALUES (2012,'回收站删除',2008,4,'#','',NULL,1,0,'F','0','0','disk:recovery:remove','#','admin','2024-04-11 22:59:12','',NULL,'');
INSERT INTO `sys_menu` VALUES (2013,'回收站导出',2008,5,'#','',NULL,1,0,'F','0','0','disk:recovery:export','#','admin','2024-04-11 22:59:12','',NULL,'');
INSERT INTO `sys_menu` VALUES (2014,'分享',2001,8,'share','disk/share/index',NULL,1,0,'C','0','0','disk:share:list','#','admin','2024-04-11 22:59:22','admin','2024-04-12 20:24:56','分享菜单');
INSERT INTO `sys_menu` VALUES (2015,'分享查询',2014,1,'#','',NULL,1,0,'F','0','0','disk:share:query','#','admin','2024-04-11 22:59:22','',NULL,'');
INSERT INTO `sys_menu` VALUES (2016,'分享新增',2014,2,'#','',NULL,1,0,'F','0','0','disk:share:add','#','admin','2024-04-11 22:59:22','',NULL,'');
INSERT INTO `sys_menu` VALUES (2017,'分享修改',2014,3,'#','',NULL,1,0,'F','0','0','disk:share:edit','#','admin','2024-04-11 22:59:22','',NULL,'');
INSERT INTO `sys_menu` VALUES (2018,'分享删除',2014,4,'#','',NULL,1,0,'F','0','0','disk:share:remove','#','admin','2024-04-11 22:59:22','',NULL,'');
INSERT INTO `sys_menu` VALUES (2019,'分享导出',2014,5,'#','',NULL,1,0,'F','0','0','disk:share:export','#','admin','2024-04-11 22:59:22','',NULL,'');
INSERT INTO `sys_menu` VALUES (2020,'用户存储',2001,9,'storage','disk/storage/index',NULL,1,0,'C','0','0','disk:storage:list','#','admin','2024-04-11 22:59:37','admin','2024-04-12 20:25:19','用户存储菜单');
INSERT INTO `sys_menu` VALUES (2021,'用户存储查询',2020,1,'#','',NULL,1,0,'F','0','0','disk:storage:query','#','admin','2024-04-11 22:59:37','',NULL,'');
INSERT INTO `sys_menu` VALUES (2022,'用户存储新增',2020,2,'#','',NULL,1,0,'F','0','0','disk:storage:add','#','admin','2024-04-11 22:59:38','',NULL,'');
INSERT INTO `sys_menu` VALUES (2023,'用户存储修改',2020,3,'#','',NULL,1,0,'F','0','0','disk:storage:edit','#','admin','2024-04-11 22:59:38','',NULL,'');
INSERT INTO `sys_menu` VALUES (2024,'用户存储删除',2020,4,'#','',NULL,1,0,'F','0','0','disk:storage:remove','#','admin','2024-04-11 22:59:38','',NULL,'');
INSERT INTO `sys_menu` VALUES (2025,'用户存储导出',2020,5,'#','',NULL,1,0,'F','0','0','disk:storage:export','#','admin','2024-04-11 22:59:38','',NULL,'');
INSERT INTO `sys_menu` VALUES (2026,'图片',2001,2,'image','disk/file/image','',1,0,'C','0','0','disk:file:list','#','admin','2024-04-12 20:13:50','admin','2024-04-12 20:31:35','');
INSERT INTO `sys_menu` VALUES (2027,'视频',2001,3,'video','disk/file/video','',1,0,'C','0','0','disk:file:list','#','admin','2024-04-12 20:15:53','admin','2024-04-12 20:31:44','');
INSERT INTO `sys_menu` VALUES (2028,'文档',2001,4,'doc','disk/file/doc','',1,0,'C','0','0','disk:file:list','#','admin','2024-04-12 20:21:37','admin','2024-04-12 20:31:51','');
INSERT INTO `sys_menu` VALUES (2029,'音乐',2001,5,'music','disk/file/music','',1,0,'C','0','0','disk:file:list','#','admin','2024-04-12 20:23:17','admin','2024-04-12 20:31:57','');
INSERT INTO `sys_menu` VALUES (2030,'其他',2001,6,'other','disk/file/other','',1,0,'C','0','0','disk:file:list','#','admin','2024-04-12 20:24:31','admin','2024-04-12 20:32:03','');
INSERT INTO `sys_menu` VALUES (2031,'分享',2002,6,'',NULL,NULL,1,0,'F','0','0','disk:file:share','#','admin','2024-04-12 21:09:07','',NULL,'');
INSERT INTO `sys_menu` VALUES (2032,'敏感词',2001,1,'sensitiveWord','disk/sensitiveWord/index',NULL,1,0,'C','0','0','disk:sensitiveWord:list','#','admin','2024-04-17 00:26:09','admin','2024-04-17 01:31:05','违规词菜单');
INSERT INTO `sys_menu` VALUES (2033,'敏感词查询',2032,1,'#','',NULL,1,0,'F','0','0','disk:sensitiveWord:query','#','admin','2024-04-17 00:26:10','admin','2024-04-17 01:31:16','');
INSERT INTO `sys_menu` VALUES (2034,'敏感词新增',2032,2,'#','',NULL,1,0,'F','0','0','disk:sensitiveWord:add','#','admin','2024-04-17 00:26:10','admin','2024-04-17 01:31:23','');
INSERT INTO `sys_menu` VALUES (2035,'敏感词修改',2032,3,'#','',NULL,1,0,'F','0','0','disk:sensitiveWord:edit','#','admin','2024-04-17 00:26:10','admin','2024-04-17 01:31:36','');
INSERT INTO `sys_menu` VALUES (2036,'敏感词删除',2032,4,'#','',NULL,1,0,'F','0','0','disk:sensitiveWord:remove','#','admin','2024-04-17 00:26:10','admin','2024-04-17 01:31:42','');
INSERT INTO `sys_menu` VALUES (2037,'敏感词导出',2032,5,'#','',NULL,1,0,'F','0','0','disk:sensitiveWord:export','#','admin','2024-04-17 00:26:10','admin','2024-04-17 01:31:51','');
INSERT INTO `sys_menu` VALUES (2038,'用户文件管理',2001,1,'manageFile','disk/manageFile/index','\'{\"userId\": 0}\'',1,0,'C','1','0','disk:storage:getStorageFileListByUserId','#','admin','2024-06-19 19:48:16','admin','2024-06-19 20:01:30','');
INSERT INTO `sys_menu` VALUES (2039,'格式化磁盘',2020,1,'',NULL,NULL,1,0,'F','0','0','disk:storage:formattedDisk','#','admin','2024-06-19 19:50:36','',NULL,'');
/*文件管理-分片上传*/
INSERT INTO `sys_menu` VALUES (2040,'文件管理',1,10,'file','disk/fileManage/index',NULL,1,0,'C','0','0','disk:fileManagement:list','documentation','admin','2024-08-10 14:44:33','admin','2024-08-16 19:09:54','');
INSERT INTO `sys_menu` VALUES (2041,'上传文件',2040,1,'',NULL,NULL,1,0,'F','0','0','disk:fileManagement:upload','#','admin','2024-08-10 17:58:46','',NULL,'');
INSERT INTO `sys_menu` VALUES (2042,'检查文件分片信息',2040,2,'',NULL,NULL,1,0,'F','0','0','disk:fileManagement:check','#','admin','2023-08-10 17:59:11','',NULL,'');
INSERT INTO `sys_menu` VALUES (2043,'合并文件',2040,6,'',NULL,NULL,1,0,'F','0','0','disk:fileManagement:merge','#','admin','2024-08-10 17:59:34','',NULL,'');
INSERT INTO `sys_menu` VALUES (2044,'已上传文件列表查询',2040,5,'',NULL,NULL,1,0,'F','0','0','disk:backFilelist:query','#','admin','2024-08-10 17:59:53','',NULL,'');
INSERT INTO `sys_menu` VALUES (2045,'已上传文件列表删除',2040,7,'',NULL,NULL,1,0,'F','0','0','disk:fileManagement:remove','#','admin','2024-08-10 18:00:46','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_oper_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(11) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-01-05 23:55:11','',NULL,'超级管理员');
INSERT INTO `sys_role` VALUES (2,'用户角色','customer',2,'2',1,1,'0','0','admin','2024-01-05 23:55:11','admin','2024-06-19 19:51:06','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,2001);
INSERT INTO `sys_role_menu` VALUES (2,2002);
INSERT INTO `sys_role_menu` VALUES (2,2003);
INSERT INTO `sys_role_menu` VALUES (2,2004);
INSERT INTO `sys_role_menu` VALUES (2,2005);
INSERT INTO `sys_role_menu` VALUES (2,2006);
INSERT INTO `sys_role_menu` VALUES (2,2007);
INSERT INTO `sys_role_menu` VALUES (2,2008);
INSERT INTO `sys_role_menu` VALUES (2,2009);
INSERT INTO `sys_role_menu` VALUES (2,2010);
INSERT INTO `sys_role_menu` VALUES (2,2011);
INSERT INTO `sys_role_menu` VALUES (2,2012);
INSERT INTO `sys_role_menu` VALUES (2,2013);
INSERT INTO `sys_role_menu` VALUES (2,2014);
INSERT INTO `sys_role_menu` VALUES (2,2015);
INSERT INTO `sys_role_menu` VALUES (2,2016);
INSERT INTO `sys_role_menu` VALUES (2,2017);
INSERT INTO `sys_role_menu` VALUES (2,2018);
INSERT INTO `sys_role_menu` VALUES (2,2019);
INSERT INTO `sys_role_menu` VALUES (2,2020);
INSERT INTO `sys_role_menu` VALUES (2,2022);
INSERT INTO `sys_role_menu` VALUES (2,2026);
INSERT INTO `sys_role_menu` VALUES (2,2027);
INSERT INTO `sys_role_menu` VALUES (2,2028);
INSERT INTO `sys_role_menu` VALUES (2,2029);
INSERT INTO `sys_role_menu` VALUES (2,2030);
INSERT INTO `sys_role_menu` VALUES (2,2031);
INSERT INTO `sys_role_menu` VALUES (2,2039);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','/profile/avatar/2024/04/14/blob_20240414122012A001.png','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-08-16 19:06:07','admin','2024-01-05 23:55:09','','2024-08-16 19:06:06','管理员');
INSERT INTO `sys_user` VALUES (2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-01-05 23:55:09','admin','2024-01-05 23:55:09','',NULL,'测试员');
INSERT INTO `sys_user` VALUES (3,NULL,'maple','maple','01','2132@qq.com','17608690790','0','','$2a$10$PVFkk4wP8qAXckkdRcOqx.TJz.VRzNGAS1sZ.ECCeGWczaVwGLdCq','0','0','127.0.0.1','2024-04-18 00:36:21','','2024-04-14 03:29:36','admin','2024-04-18 00:36:21',NULL);
INSERT INTO `sys_user` VALUES (4,NULL,'maple168','maple168','01','','','0','','$2a$10$bmw05njVHQOL/fedHEbZEOPhd92DJqQcbJGXQIpI76XZJA1Zt59NC','0','0','127.0.0.1','2024-06-19 20:09:37','','2024-04-14 11:27:16','admin','2024-06-19 20:09:36',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1);
INSERT INTO `sys_user_role` VALUES (2,2);
INSERT INTO `sys_user_role` VALUES (3,2);
INSERT INTO `sys_user_role` VALUES (4,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'netdisk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-16 19:17:35
