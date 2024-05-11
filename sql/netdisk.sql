/*
Navicat MySQL Data Transfer

Source Server         : maple5.7
Source Server Version : 50744
Source Host           : localhost:3307
Source Database       : netdisk

Target Server Type    : MYSQL
Target Server Version : 50744
File Encoding         : 65001

Date: 2024-04-27 16:53:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for disk_file
-- ----------------------------
DROP TABLE IF EXISTS `disk_file`;
CREATE TABLE `disk_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `old_name` varchar(255) DEFAULT NULL COMMENT '旧文件名',
  `size` bigint(20) DEFAULT '0' COMMENT '文件大小',
  `url` varchar(500) DEFAULT NULL COMMENT '文件地址',
  `type` int(2) DEFAULT '5' COMMENT '文件类型 5:文件夹',
  `parent_id` bigint(20) DEFAULT '0',
  `is_dir` tinyint(2) DEFAULT '0' COMMENT '是否是目录',
  `order_num` int(4) DEFAULT '0' COMMENT '排序',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='文件';

-- ----------------------------
-- Records of disk_file
-- ----------------------------
INSERT INTO `disk_file` VALUES ('27', 'java', null, '0', '/profile/upload/b840c63567724e518174bec6abea8f65/java', '5', '0', '1', '0', '1', '2024-04-13 12:25:58', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('29', 'spring', null, '0', '/profile/upload/b840c63567724e518174bec6abea8f65/spring', '5', '0', '1', '1', '1', '2024-04-13 12:36:09', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('34', '数据结构试题库答案_20240413123928A003.doc', '数据结构试题库答案.doc', '481792', '/profile/upload/b840c63567724e518174bec6abea8f65/spring/2024/04/13/数据结构试题库答案_20240413123928A003.doc', '2', '29', '0', '0', '1', '2024-04-13 12:39:29', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('35', '微信公众号_20240413123936A004.jpg', '微信公众号.jpg', '39015', '/profile/upload/b840c63567724e518174bec6abea8f65/spring/2024/04/13/微信公众号_20240413123936A004.jpg', '0', '29', '0', '0', '1', '2024-04-13 12:39:36', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('36', '应聘Java笔试时可能出现问题及其答案 (1)_20240413190411A001.doc', '应聘Java笔试时可能出现问题及其答案 (1).doc', '65536', '/profile/upload/b840c63567724e518174bec6abea8f65//spring/2024/04/13/应聘Java笔试时可能出现问题及其答案 (1)_20240413190411A001.doc', '2', '29', '0', '0', '1', '2024-04-13 19:04:12', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('49', '华为java笔试面试题2014_20240414115443A004.doc', '华为java笔试面试题2014.doc', '97398', '/profile/upload/a90d31529f984501add2e4d2aa170d74/2024/04/14/华为java笔试面试题2014_20240414115443A004.doc', '2', '0', '0', '0', '3', '2024-04-14 11:54:43', null, null, null, '2');
INSERT INTO `disk_file` VALUES ('50', 'java', null, '0', '/profile/upload/a90d31529f984501add2e4d2aa170d74/java', '5', '0', '1', '0', '3', '2024-04-14 12:02:04', null, null, null, '2');
INSERT INTO `disk_file` VALUES ('51', 'weop_20240414135120A001.rar', 'weop.rar', '14541272', '/profile/upload/b840c63567724e518174bec6abea8f65/weop_20240414135120A001.rar', '4', '0', '0', '0', '1', '2024-04-14 13:51:21', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('52', '20240414_112639_20240414135147A002.mp4', '20240414_112639.mp4', '87440939', '/profile/upload/b840c63567724e518174bec6abea8f65/20240414_112639_20240414135147A002.mp4', '1', '0', '0', '0', '1', '2024-04-14 13:51:49', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('53', 'DiskFileController_20240414141832A001.java', 'DiskFileController.java', '13720', '/profile/upload/b840c63567724e518174bec6abea8f65/DiskFileController_20240414141832A001.java', '4', '0', '0', '0', '1', '2024-04-14 14:18:32', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('54', '施雨凡 - 起风了 (抒情女声版)_20240416045504A001.mp3', '施雨凡 - 起风了 (抒情女声版).mp3', '5207174', '/profile/upload/b840c63567724e518174bec6abea8f65/施雨凡 - 起风了 (抒情女声版)_20240416045504A001.mp3', '3', '0', '0', '0', '1', '2024-04-16 04:55:05', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('55', 'a', null, '0', '/profile/upload/b840c63567724e518174bec6abea8f65/a', '5', '0', '1', '0', '1', '2024-04-16 05:17:06', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('56', 'b', null, '0', '/profile/upload/b840c63567724e518174bec6abea8f65/b', '5', '0', '1', '0', '1', '2024-04-16 05:17:12', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('58', '测试', null, '0', '/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国', '5', '0', '1', '0', '1', '2024-04-17 01:34:19', null, '2024-04-18 00:03:18', null, '2');
INSERT INTO `disk_file` VALUES ('59', '好想', null, '0', '/profile/upload/b840c63567724e518174bec6abea8f65/好想', '5', '0', '1', '0', '1', '2024-04-18 00:12:20', null, null, null, '0');
INSERT INTO `disk_file` VALUES ('60', '四驱兄弟最新作品G杯豪臀绝色妖姬妲己呻吟刺激1080P高清完整原版', null, '0', '/profile/upload/a90d31529f984501add2e4d2aa170d74/四驱兄弟最新作品G杯豪臀绝色妖姬妲己呻吟刺激1080P高清完整原版', '5', '0', '1', '0', '3', '2024-04-18 00:46:16', null, null, null, '2');
INSERT INTO `disk_file` VALUES ('61', 'dfa7fc7f79dd4c0f943b530aaa38d806_20240424125231A001.jpg', 'dfa7fc7f79dd4c0f943b530aaa38d806.jpg', '888996', '/profile/upload/b840c63567724e518174bec6abea8f65/dfa7fc7f79dd4c0f943b530aaa38d806_20240424125231A001.jpg', '0', '0', '0', '0', '1', '2024-04-24 12:52:31', null, null, null, '0');

-- ----------------------------
-- Table structure for disk_recovery_file
-- ----------------------------
DROP TABLE IF EXISTS `disk_recovery_file`;
CREATE TABLE `disk_recovery_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件id',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='回收文件';

-- ----------------------------
-- Records of disk_recovery_file
-- ----------------------------
INSERT INTO `disk_recovery_file` VALUES ('22', '49', '3', '2024-04-14 12:13:52', null, null, null);
INSERT INTO `disk_recovery_file` VALUES ('23', '50', '3', '2024-04-14 12:13:52', null, null, null);
INSERT INTO `disk_recovery_file` VALUES ('32', '60', '3', '2024-04-18 00:46:21', null, null, null);
INSERT INTO `disk_recovery_file` VALUES ('34', '35', '1', '2024-04-24 12:56:55', null, null, null);
INSERT INTO `disk_recovery_file` VALUES ('36', '58', '1', '2024-04-24 12:57:06', null, null, null);

-- ----------------------------
-- Table structure for disk_sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `disk_sensitive_word`;
CREATE TABLE `disk_sensitive_word` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_name` varchar(64) NOT NULL COMMENT '添加人',
  `sensitive_word` varchar(30) NOT NULL COMMENT '敏感词',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disk_sensitive_word
-- ----------------------------
INSERT INTO `disk_sensitive_word` VALUES ('165', 'admin', '共产党', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('166', 'admin', '习近平', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('167', 'admin', '毛主席', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('168', 'admin', '新关键字', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('169', 'admin', '色情', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('170', 'admin', '赌博', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('171', 'admin', '吸毒', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('172', 'admin', '杀死', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('173', 'admin', '国家级', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('174', 'admin', '世界级', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('175', 'admin', '终极', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('176', 'admin', '最牛逼', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('177', 'admin', '全国首家', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('178', 'admin', '世界顶尖', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('179', 'admin', '毛泽东', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('180', 'admin', '共产党', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('181', 'admin', '日他妈', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('182', 'admin', '非典', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('183', 'admin', '她妈', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('184', 'admin', '和谐', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('185', 'admin', '艾滋病', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('186', 'admin', '色情', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('187', 'admin', '暴力', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('188', 'admin', '赌博', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('189', 'admin', '黄色', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('190', 'admin', '打赌', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('191', 'admin', '毒品', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('192', 'admin', '反动', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('193', 'admin', '藏独', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('194', 'admin', '台独', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('195', 'admin', '港独', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('196', 'admin', '推翻', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('197', 'admin', '邓小平', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('198', 'admin', '江泽民', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('199', 'admin', '贿赂', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('200', 'admin', '淫秽', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('201', 'admin', '吸毒', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('202', 'admin', '枪支', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('203', 'admin', '反共', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('204', 'admin', '毛泽东复活', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('205', 'admin', '三唑仑迷魂药', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('206', 'admin', '出售工字气枪铅弹', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('207', 'admin', '踩踏', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('208', 'admin', '爆炸性', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('209', 'admin', '乱伦', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('210', 'admin', '反共', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('211', 'admin', '法轮功传播', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('212', 'admin', '藏枪', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('213', 'admin', '暴力', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('214', 'admin', '台独暴力', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('215', 'admin', '黄色网站', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('216', 'admin', '黄色交易', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('217', 'admin', '抢爆', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('218', 'admin', ' 散布谣言', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('219', 'admin', '赌博', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('220', 'admin', '煽动非法集会', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('221', 'admin', '骚扰', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('222', 'admin', '侵害', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('223', 'admin', '粗俗', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('224', 'admin', '猥亵', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('225', 'admin', '结社', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('226', 'admin', '封建迷信', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('227', 'admin', '民族歧视', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('228', 'admin', '破坏民族团结', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('229', 'admin', '损害国家荣誉和利益', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('230', 'admin', '凶杀', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('231', 'admin', '国家宗教政策', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('232', 'admin', '游行', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('233', 'admin', '西藏动乱', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('234', 'admin', '草拟', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('235', 'admin', '操你妈', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('236', 'admin', '操你', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('237', 'admin', '房事', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('238', 'admin', '丰满', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('239', 'admin', '人流', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('240', 'admin', '美胸', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('241', 'admin', '男人', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('242', 'admin', '增粗', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('243', 'admin', '堕胎', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('244', 'admin', '整容', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('245', 'admin', '妊娠', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('246', 'admin', '男性', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('247', 'admin', '情趣', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('248', 'admin', '肛裂', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('249', 'admin', '性趣', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('250', 'admin', '鼻炎', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('251', 'admin', '功夫汤', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('252', 'admin', '爆', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('253', 'admin', '白带', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('254', 'admin', '老婆', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('255', 'admin', '催情', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('256', 'admin', '紧', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('257', 'admin', '丰胸', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('258', 'admin', '女人', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('259', 'admin', '女性', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('260', 'admin', '胸', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('261', 'admin', '阿波罗', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('262', 'admin', '癌症', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('263', 'admin', '满足', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('264', 'admin', '老总', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('265', 'admin', '狐臭', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('266', 'admin', '糜烂', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('267', 'admin', '成人', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('268', 'admin', '痔疮', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('269', 'admin', '太平公主', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('270', 'admin', '勃起', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('271', 'admin', '医疗', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('272', 'admin', '红肿', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('273', 'admin', '尖叫', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('274', 'admin', '整形', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('275', 'admin', '早泄', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('276', 'admin', '生殖器', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('277', 'admin', '小儿脑瘫', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('278', 'admin', '激情', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('279', 'admin', '又粗又大', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('280', 'admin', '排卵', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('281', 'admin', '性交', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('282', 'admin', '痛经', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('283', 'admin', '性福', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('284', 'admin', '避孕', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('285', 'admin', '妇科病', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('286', 'admin', '计生', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('287', 'admin', '瘦身', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('288', 'admin', '无痛', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('289', 'admin', '个人护理', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('290', 'admin', '前列腺', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('291', 'admin', '医院', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('292', 'admin', '射精', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('293', 'admin', '包茎', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('294', 'admin', '乳腺', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('295', 'admin', '夜', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('296', 'admin', '偷偷', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('297', 'admin', '包皮', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('298', 'admin', '停经', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('299', 'admin', '阴茎', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('300', 'admin', '偷看', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('301', 'admin', '透视', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('302', 'admin', '减肥', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('303', 'admin', '领导', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('304', 'admin', '考试设备', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('305', 'admin', '缩阴', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('306', 'admin', '遗精', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('307', 'admin', '性病', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('308', 'admin', '阳萎', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('309', 'admin', '聚光体', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('310', 'admin', '妇科', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('311', 'admin', '男科', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('312', 'admin', '老公', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('313', 'admin', '泌尿', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('314', 'admin', '阳痿', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('315', 'admin', '增高', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('316', 'admin', '持久', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('317', 'admin', '白领', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('318', 'admin', '阴道', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('319', 'admin', '增大', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('320', 'admin', '意外怀孕', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('321', 'admin', 'GDKEYTEST', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('322', 'admin', '首页', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('323', 'admin', '你妹', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('324', 'admin', '差评', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('325', 'admin', 'nimei', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('326', 'admin', 'chaping', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('327', 'admin', '蔡英文', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('328', 'admin', 'm12345678', null, null);
INSERT INTO `disk_sensitive_word` VALUES ('329', 'admin', '做爱', '2024-04-17 02:30:51', null);
INSERT INTO `disk_sensitive_word` VALUES ('331', 'admin', '约炮', '2024-04-18 00:01:49', null);
INSERT INTO `disk_sensitive_word` VALUES ('332', 'admin', '啪啪', '2024-04-18 00:11:24', '2024-04-18 00:11:42');
INSERT INTO `disk_sensitive_word` VALUES ('333', 'admin', '乱摸', '2024-04-18 00:32:30', null);
INSERT INTO `disk_sensitive_word` VALUES ('334', 'admin', '肉体', '2024-04-18 00:32:41', null);

-- ----------------------------
-- Table structure for disk_share_file
-- ----------------------------
DROP TABLE IF EXISTS `disk_share_file`;
CREATE TABLE `disk_share_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_ids` varchar(100) DEFAULT NULL COMMENT '分享的文件ids',
  `all_file_ids` varchar(255) DEFAULT NULL COMMENT '所有的文件id',
  `uuid` varchar(100) DEFAULT NULL,
  `secret_key` varchar(100) DEFAULT NULL,
  `expiration_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_permanent` tinyint(2) DEFAULT '0',
  `type` varchar(10) DEFAULT '0' COMMENT '分享形式0：私密 1：公开',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='分享文件';

-- ----------------------------
-- Records of disk_share_file
-- ----------------------------
INSERT INTO `disk_share_file` VALUES ('13', '44,45', '44,45,46,47', '7uq9lcre7qdv', '12345', '2024-04-13 00:00:00', '0', '0', '3', '2024-04-14 11:35:54', null, '2024-04-14 11:37:05', '测试测试', '0');
INSERT INTO `disk_share_file` VALUES ('14', '44,45', '44,45,46,47', 'jsiaohl71foz', 'd3h0mi', null, '1', '0', '3', '2024-04-14 11:37:38', null, null, null, '0');
INSERT INTO `disk_share_file` VALUES ('15', '49,50', '49,50', 'a0cqv568klzp', '123456', '2024-04-16 00:00:00', '0', '0', '3', '2024-04-14 12:06:04', null, null, null, '0');
INSERT INTO `disk_share_file` VALUES ('19', '27,29', '27,29,34,35,36', 'ccxad8rdtbp7', 'wblh9b', '2024-04-19 00:00:00', '0', '0', '1', '2024-04-15 23:44:24', null, '2024-04-16 00:22:12', null, '0');
INSERT INTO `disk_share_file` VALUES ('20', '29,51,53', '29,51,53,34,35,36', 'svprqorqoog4', '57j8vj', '2024-04-30 00:00:00', '0', '1', '1', '2024-04-16 01:52:14', null, '2024-04-16 02:11:45', '城市撒旦', '0');
INSERT INTO `disk_share_file` VALUES ('21', '29,51,53,52', '29,51,52,53,34,35,36', '3ybdwc6gn6ik', 'zpq3i9', '2024-04-16 02:11:57', '0', '0', '1', '2024-04-16 01:56:06', null, '2024-04-16 02:11:58', null, '0');
INSERT INTO `disk_share_file` VALUES ('22', '52,53', '52,53', '83p9jh1cl8r8', null, '2024-04-19 00:00:00', '0', '1', '1', '2024-04-16 02:25:27', null, null, null, '0');
INSERT INTO `disk_share_file` VALUES ('23', '27,29,51,52,53,54', '27,29,51,52,53,54,34,35,36', 'ob39h3fkd4zk', null, null, '1', '1', '1', '2024-04-16 05:07:05', null, null, null, '0');
INSERT INTO `disk_share_file` VALUES ('24', '58,51,54', '51,54,58', 'rulmr56bhwyd', '3wmj0t', null, '1', '0', '1', '2024-04-18 00:06:18', null, null, null, '0');
INSERT INTO `disk_share_file` VALUES ('25', '58,51,54', '51,54,58', '5w0nrmverqeu', null, '2024-04-21 00:00:00', '0', '1', '1', '2024-04-18 00:09:58', null, null, '测试', '0');

-- ----------------------------
-- Table structure for disk_storage
-- ----------------------------
DROP TABLE IF EXISTS `disk_storage`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='存储信息';

-- ----------------------------
-- Records of disk_storage
-- ----------------------------
INSERT INTO `disk_storage` VALUES ('1', 'b840c63567724e518174bec6abea8f65', '20000000000', '108913964', '1', '2024-04-12 00:47:52', null, '2024-04-14 02:58:24', null, '0');
INSERT INTO `disk_storage` VALUES ('2', 'a90d31529f984501add2e4d2aa170d74', '200000000000', '683741', '3', '2024-04-14 03:33:10', null, '2024-04-14 11:34:09', null, '0');
INSERT INTO `disk_storage` VALUES ('3', 'b1ca5575e0ed4dc2a79bb21044004346', '20000000000', '0', '4', '2024-04-14 11:27:39', null, null, null, '0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'disk_file', '文件', null, null, 'DiskFile', 'crud', 'com.ruoyi.disk', 'disk', 'file', '文件', 'maple', '0', '/', '{\"parentMenuId\":\"2001\"}', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45', null);
INSERT INTO `gen_table` VALUES ('2', 'disk_recovery_file', '回收站', null, null, 'DiskRecoveryFile', 'crud', 'com.ruoyi.disk', 'disk', 'recovery', '回收站', 'maple', '0', '/', '{\"parentMenuId\":\"2001\"}', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:33', null);
INSERT INTO `gen_table` VALUES ('3', 'disk_share_file', '分享', null, null, 'DiskShareFile', 'crud', 'com.ruoyi.disk', 'disk', 'share', '分享', 'maple', '0', '/', '{\"parentMenuId\":\"2001\"}', 'admin', '2024-04-11 22:31:21', '', '2024-04-12 21:42:01', null);
INSERT INTO `gen_table` VALUES ('4', 'disk_storage', '用户存储', null, null, 'DiskStorage', 'crud', 'com.ruoyi.disk', 'disk', 'storage', '用户存储', 'maple', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:55:21', null);
INSERT INTO `gen_table` VALUES ('5', 'disk_sensitive_word', '违规词', null, null, 'DiskSensitiveWord', 'crud', 'com.ruoyi.disk', 'disk', 'sensitiveWord', '违规词', 'maple', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2024-04-17 00:22:07', '', '2024-04-17 00:24:30', null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'id', '', 'bigint(20) unsigned', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('2', '1', 'name', '文件名', 'varchar(255)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('3', '1', 'old_name', '旧文件名', 'varchar(255)', 'String', 'oldName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('4', '1', 'size', '文件大小', 'bigint(20)', 'Long', 'size', '0', '0', null, '1', '1', '1', '1', 'GTE', 'input', '', '4', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('5', '1', 'url', '文件地址', 'varchar(500)', 'String', 'url', '0', '0', null, '1', '1', '1', '0', 'EQ', 'fileUpload', '', '5', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('6', '1', 'type', '文件类型', 'int(2)', 'Integer', 'type', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'file_type', '6', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('7', '1', 'parent_id', '父级id', 'bigint(20)', 'Long', 'parentId', '0', '0', null, '1', '1', '1', '0', 'EQ', 'input', '', '7', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('8', '1', 'order_num', '排序', 'int(4)', 'Integer', 'orderNum', '0', '0', null, '1', '1', '1', '0', 'EQ', 'input', '', '9', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('9', '1', 'create_id', '创建者', 'bigint(20)', 'Long', 'createId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('10', '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, '1', '1', 'BETWEEN', 'datetime', '', '11', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('11', '1', 'update_id', '更新者', 'bigint(20)', 'Long', 'updateId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('12', '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '13', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('13', '1', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '14', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('14', '1', 'del_flag', '删除标志（0代表存在', 'char(1)', 'String', 'delFlag', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '15', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('15', '2', 'id', '', 'bigint(20)', 'Long', 'id', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:33');
INSERT INTO `gen_table_column` VALUES ('16', '2', 'file_id', '文件id', 'bigint(20)', 'Long', 'fileId', '0', '0', null, '1', '1', '1', '0', 'EQ', 'input', '', '2', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:33');
INSERT INTO `gen_table_column` VALUES ('17', '2', 'create_id', '创建者', 'bigint(20)', 'Long', 'createId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:33');
INSERT INTO `gen_table_column` VALUES ('18', '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', '0', '1', '1', 'BETWEEN', 'datetime', '', '4', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:33');
INSERT INTO `gen_table_column` VALUES ('19', '2', 'update_id', '更新者', 'bigint(20)', 'Long', 'updateId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:33');
INSERT INTO `gen_table_column` VALUES ('20', '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '6', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:33');
INSERT INTO `gen_table_column` VALUES ('21', '2', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '7', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:53:33');
INSERT INTO `gen_table_column` VALUES ('22', '3', 'id', '', 'bigint(20)', 'Long', 'id', '1', '0', null, '1', null, '1', null, 'EQ', 'input', '', '1', 'admin', '2024-04-11 22:31:21', '', '2024-04-12 21:42:01');
INSERT INTO `gen_table_column` VALUES ('25', '3', 'secret_key', '', 'int(4)', 'String', 'secretKey', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2024-04-11 22:31:21', '', '2024-04-12 21:42:01');
INSERT INTO `gen_table_column` VALUES ('26', '3', 'expiration_time', '', 'datetime', 'Date', 'expirationTime', '0', '0', null, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', '5', 'admin', '2024-04-11 22:31:21', '', '2024-04-12 21:42:01');
INSERT INTO `gen_table_column` VALUES ('27', '3', 'create_id', '创建者', 'bigint(20)', 'Long', 'createId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2024-04-11 22:31:21', '', '2024-04-12 21:42:01');
INSERT INTO `gen_table_column` VALUES ('28', '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, '1', '1', 'BETWEEN', 'datetime', '', '7', 'admin', '2024-04-11 22:31:21', '', '2024-04-12 21:42:01');
INSERT INTO `gen_table_column` VALUES ('29', '3', 'update_id', '更新者', 'bigint(20)', 'Long', 'updateId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2024-04-11 22:31:21', '', '2024-04-12 21:42:01');
INSERT INTO `gen_table_column` VALUES ('30', '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '9', 'admin', '2024-04-11 22:31:21', '', '2024-04-12 21:42:01');
INSERT INTO `gen_table_column` VALUES ('31', '3', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '10', 'admin', '2024-04-11 22:31:21', '', '2024-04-12 21:42:01');
INSERT INTO `gen_table_column` VALUES ('32', '3', 'del_flag', '删除标志（0代表存在', 'char(1)', 'String', 'delFlag', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '11', 'admin', '2024-04-11 22:31:21', '', '2024-04-12 21:42:01');
INSERT INTO `gen_table_column` VALUES ('33', '4', 'id', '', 'bigint(20) unsigned', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:55:21');
INSERT INTO `gen_table_column` VALUES ('34', '4', 'base_dir', '基础目录', 'varchar(255)', 'String', 'baseDir', '0', '0', null, '1', '1', '1', '0', 'EQ', 'input', '', '2', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:55:21');
INSERT INTO `gen_table_column` VALUES ('35', '4', 'total_capacity', '总容量', 'bigint(20)', 'Long', 'totalCapacity', '0', '0', null, '1', '1', '1', '1', 'GTE', 'input', '', '3', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:55:21');
INSERT INTO `gen_table_column` VALUES ('36', '4', 'used_capacity', '已用容量', 'bigint(20)', 'Long', 'usedCapacity', '0', '0', null, '1', '1', '1', '1', 'GTE', 'input', '', '4', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:55:21');
INSERT INTO `gen_table_column` VALUES ('37', '4', 'create_id', '创建者', 'bigint(20)', 'Long', 'createId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:55:21');
INSERT INTO `gen_table_column` VALUES ('38', '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, '1', null, 'EQ', 'datetime', '', '6', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:55:21');
INSERT INTO `gen_table_column` VALUES ('39', '4', 'update_id', '更新者', 'bigint(20)', 'Long', 'updateId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:55:21');
INSERT INTO `gen_table_column` VALUES ('40', '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '8', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:55:21');
INSERT INTO `gen_table_column` VALUES ('41', '4', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '9', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:55:21');
INSERT INTO `gen_table_column` VALUES ('42', '4', 'del_flag', '删除标志（0代表存在', 'char(1)', 'String', 'delFlag', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '10', 'admin', '2024-04-11 22:31:21', '', '2024-04-11 22:55:21');
INSERT INTO `gen_table_column` VALUES ('43', '1', 'is_dir', '是否是目录', 'tinyint(2)', 'Integer', 'isDir', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', '', '2024-04-11 22:44:04', '', '2024-04-11 22:53:45');
INSERT INTO `gen_table_column` VALUES ('44', '3', 'file_ids', '分享的文件ids', 'varchar(100)', 'String', 'fileIds', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', '', '2024-04-12 21:38:32', '', '2024-04-12 21:42:01');
INSERT INTO `gen_table_column` VALUES ('45', '3', 'uuid', '', 'varchar(100)', 'String', 'uuid', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', '', '2024-04-12 21:38:32', '', '2024-04-12 21:42:01');
INSERT INTO `gen_table_column` VALUES ('46', '5', 'id', '自增id', 'int(11) unsigned', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2024-04-17 00:22:07', '', '2024-04-17 00:24:30');
INSERT INTO `gen_table_column` VALUES ('47', '5', 'user_name', '添加人', 'varchar(64)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2024-04-17 00:22:07', '', '2024-04-17 00:24:30');
INSERT INTO `gen_table_column` VALUES ('48', '5', 'sensitive_word', '敏感词', 'varchar(30)', 'String', 'sensitiveWord', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', '3', 'admin', '2024-04-17 00:22:07', '', '2024-04-17 00:24:30');
INSERT INTO `gen_table_column` VALUES ('49', '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, '1', null, 'EQ', 'datetime', '', '4', 'admin', '2024-04-17 00:22:07', '', '2024-04-17 00:24:30');
INSERT INTO `gen_table_column` VALUES ('50', '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '5', 'admin', '2024-04-17 00:22:07', '', '2024-04-17 00:24:30');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-01-05 23:56:00', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-01-05 23:56:00', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-01-05 23:56:00', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-01-05 23:56:00', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-01-05 23:56:01', 'admin', '2024-04-12 00:42:17', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('6', '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-01-05 23:56:01', '', null, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES ('7', '初始化存储大小', 'storage.capacity', '20000000000', 'Y', 'admin', '2024-04-14 02:53:01', 'admin', '2024-04-14 02:53:19', '单位字节如20g=20000000000字节');
INSERT INTO `sys_config` VALUES ('8', '是否开启敏感词检测', 'sensitiveWord.ifFilter', 'true', 'Y', 'admin', '2024-04-17 01:14:49', '', null, 'true：开启 false：不开启');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
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

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-01-05 23:55:53', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-01-05 23:55:53', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-01-05 23:55:53', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-01-05 23:55:53', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-01-05 23:55:54', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-01-05 23:55:54', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-01-05 23:55:54', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-01-05 23:55:54', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-01-05 23:55:55', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-01-05 23:55:55', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-01-05 23:55:55', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-01-05 23:55:55', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-01-05 23:55:55', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-01-05 23:55:56', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-01-05 23:55:56', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-01-05 23:55:56', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-01-05 23:55:56', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-05 23:55:56', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-05 23:55:57', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-05 23:55:57', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-05 23:55:57', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-01-05 23:55:57', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-05 23:55:58', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-05 23:55:58', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-05 23:55:58', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-05 23:55:58', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-05 23:55:58', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-01-05 23:55:59', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-01-05 23:55:59', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '图片', '0', 'file_type', null, 'default', 'N', '0', 'admin', '2024-04-11 22:41:50', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('101', '0', '视频', '1', 'file_type', null, 'default', 'N', '0', 'admin', '2024-04-11 22:42:13', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('102', '0', '文档', '2', 'file_type', null, 'default', 'N', '0', 'admin', '2024-04-11 22:42:22', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('103', '0', '音乐', '3', 'file_type', null, 'default', 'N', '0', 'admin', '2024-04-11 22:43:29', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('104', '0', '其他', '4', 'file_type', null, 'default', 'N', '0', 'admin', '2024-04-11 22:43:44', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
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

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2024-01-05 23:55:50', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2024-01-05 23:55:50', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2024-01-05 23:55:50', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2024-01-05 23:55:50', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2024-01-05 23:55:51', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2024-01-05 23:55:51', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2024-01-05 23:55:51', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2024-01-05 23:55:51', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2024-01-05 23:55:52', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2024-01-05 23:55:52', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '文件类型', 'file_type', '0', 'admin', '2024-04-11 22:37:01', '', null, null);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
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

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-01-05 23:56:02', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-01-05 23:56:02', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-01-05 23:56:02', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
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

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
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
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-01-06 21:20:49');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-11 22:24:36');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-11 23:17:56');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-04-12 00:26:03');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 00:41:18');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 13:01:05');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-12 13:11:34');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-04-12 13:14:29');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 13:14:34');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-12 14:22:22');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-04-12 14:24:39');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 14:24:44');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-12 16:23:05');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 16:57:56');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-12 17:08:06');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 17:08:16');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-12 17:09:29');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 17:09:36');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-12 17:19:54');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 17:20:12');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 17:32:08');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 17:38:40');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-12 18:06:12');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 18:06:32');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-12 19:20:37');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 19:20:41');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-12 19:31:07');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-12 19:31:14');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 19:31:20');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 19:48:49');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 20:05:40');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-12 20:27:35');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-12 20:27:42');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 00:19:44');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 00:19:52');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 00:31:35');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 00:41:23');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 00:48:37');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 00:52:32');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 07:46:31');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 07:52:12');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 10:20:06');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 10:20:43');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 11:10:32');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 11:33:09');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 11:33:15');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 12:59:51');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-04-13 13:01:58');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-13 13:02:05');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 13:02:10');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 18:45:28');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 19:13:36');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 19:22:39');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 19:35:14');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 19:37:00');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 20:11:51');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 20:13:49');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 20:24:20');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 20:25:02');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 20:36:35');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 20:37:05');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 22:09:49');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 22:15:54');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 22:54:06');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 22:54:20');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 00:52:44');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 00:52:52');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 02:38:21');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 02:51:00');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 02:51:06');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 03:17:27');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-14 03:17:42');
INSERT INTO `sys_logininfor` VALUES ('172', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2024-04-14 03:29:36');
INSERT INTO `sys_logininfor` VALUES ('173', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 03:29:52');
INSERT INTO `sys_logininfor` VALUES ('174', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 03:53:31');
INSERT INTO `sys_logininfor` VALUES ('175', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 03:54:09');
INSERT INTO `sys_logininfor` VALUES ('176', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 04:27:56');
INSERT INTO `sys_logininfor` VALUES ('177', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 04:28:02');
INSERT INTO `sys_logininfor` VALUES ('178', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 05:54:45');
INSERT INTO `sys_logininfor` VALUES ('179', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-04-14 09:47:10');
INSERT INTO `sys_logininfor` VALUES ('180', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 09:47:19');
INSERT INTO `sys_logininfor` VALUES ('181', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 09:47:34');
INSERT INTO `sys_logininfor` VALUES ('182', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 09:47:42');
INSERT INTO `sys_logininfor` VALUES ('183', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 10:12:37');
INSERT INTO `sys_logininfor` VALUES ('184', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 10:12:50');
INSERT INTO `sys_logininfor` VALUES ('185', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 10:14:36');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 10:14:53');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 11:26:45');
INSERT INTO `sys_logininfor` VALUES ('188', 'maple168', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2024-04-14 11:27:16');
INSERT INTO `sys_logininfor` VALUES ('189', 'maple168', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-14 11:27:32');
INSERT INTO `sys_logininfor` VALUES ('190', 'maple168', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 11:27:37');
INSERT INTO `sys_logininfor` VALUES ('191', 'maple168', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 11:27:56');
INSERT INTO `sys_logininfor` VALUES ('192', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 11:28:06');
INSERT INTO `sys_logininfor` VALUES ('193', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 11:30:20');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 11:30:37');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 11:34:28');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-14 11:34:41');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 11:34:45');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 11:34:58');
INSERT INTO `sys_logininfor` VALUES ('199', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-14 11:35:12');
INSERT INTO `sys_logininfor` VALUES ('200', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 11:35:19');
INSERT INTO `sys_logininfor` VALUES ('201', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 12:15:11');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-04-14 12:17:14');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-14 12:17:14');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 12:17:28');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 13:25:43');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 13:25:59');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 14:48:51');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 14:49:01');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 15:08:38');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 15:13:23');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-04-15 08:08:33');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 08:08:38');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 22:19:40');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 23:39:43');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-15 23:58:14');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-16 00:04:51');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-16 00:35:46');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-16 01:50:58');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-16 02:34:02');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-16 04:07:06');
INSERT INTO `sys_logininfor` VALUES ('221', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-16 04:19:59');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-16 04:21:02');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-16 04:46:05');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-04-16 04:52:09');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-16 04:52:16');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-16 05:14:01');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-16 05:14:38');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-16 05:27:23');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-16 05:27:23');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-16 23:40:17');
INSERT INTO `sys_logininfor` VALUES ('231', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-17 00:17:54');
INSERT INTO `sys_logininfor` VALUES ('232', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-17 00:21:40');
INSERT INTO `sys_logininfor` VALUES ('233', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-17 01:14:11');
INSERT INTO `sys_logininfor` VALUES ('234', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-17 23:59:30');
INSERT INTO `sys_logininfor` VALUES ('235', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 00:07:31');
INSERT INTO `sys_logininfor` VALUES ('236', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 00:08:57');
INSERT INTO `sys_logininfor` VALUES ('237', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 00:13:02');
INSERT INTO `sys_logininfor` VALUES ('238', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-04-18 00:16:48');
INSERT INTO `sys_logininfor` VALUES ('239', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-04-18 00:30:41');
INSERT INTO `sys_logininfor` VALUES ('240', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 00:30:54');
INSERT INTO `sys_logininfor` VALUES ('241', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 00:31:06');
INSERT INTO `sys_logininfor` VALUES ('242', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 00:31:13');
INSERT INTO `sys_logininfor` VALUES ('243', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 00:31:30');
INSERT INTO `sys_logininfor` VALUES ('244', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-04-18 00:31:50');
INSERT INTO `sys_logininfor` VALUES ('245', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-18 00:31:50');
INSERT INTO `sys_logininfor` VALUES ('246', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 00:32:07');
INSERT INTO `sys_logininfor` VALUES ('247', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 00:35:36');
INSERT INTO `sys_logininfor` VALUES ('248', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 00:35:43');
INSERT INTO `sys_logininfor` VALUES ('249', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 00:35:58');
INSERT INTO `sys_logininfor` VALUES ('250', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-18 00:36:16');
INSERT INTO `sys_logininfor` VALUES ('251', 'maple', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 00:36:21');
INSERT INTO `sys_logininfor` VALUES ('252', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-24 12:30:47');
INSERT INTO `sys_logininfor` VALUES ('253', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-24 13:01:21');
INSERT INTO `sys_logininfor` VALUES ('254', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-24 13:01:30');
INSERT INTO `sys_logininfor` VALUES ('255', 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-24 13:01:42');
INSERT INTO `sys_logininfor` VALUES ('256', 'maple168', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-24 13:01:57');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
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
) ENGINE=InnoDB AUTO_INCREMENT=2038 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2024-01-05 23:55:12', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2024-01-05 23:55:12', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2024-01-05 23:55:12', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '管理员信息', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-01-05 23:55:13', 'admin', '2024-01-06 21:44:32', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-01-05 23:55:13', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-01-05 23:55:13', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-01-05 23:55:14', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-01-05 23:55:14', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-01-05 23:55:14', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2024-01-05 23:55:14', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-01-05 23:55:14', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-01-05 23:55:15', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-01-05 23:55:15', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-01-05 23:55:15', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-01-05 23:55:15', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '缓存列表', '2', '6', 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-01-05 23:55:16', '', null, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES ('115', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-01-05 23:55:16', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('116', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-01-05 23:55:16', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('117', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-01-05 23:55:16', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-01-05 23:55:16', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-01-05 23:55:16', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-01-05 23:55:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-01-05 23:55:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-01-05 23:55:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-01-05 23:55:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-01-05 23:55:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-01-05 23:55:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-01-05 23:55:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-01-05 23:55:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-01-05 23:55:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-01-05 23:55:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-01-05 23:55:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-01-05 23:55:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-01-05 23:55:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-01-05 23:55:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-01-05 23:55:20', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-01-05 23:55:20', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-01-05 23:55:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-01-05 23:55:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-01-05 23:55:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-01-05 23:55:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-01-05 23:55:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-01-05 23:55:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-01-05 23:55:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-01-05 23:55:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-01-05 23:55:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-01-05 23:55:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-01-05 23:55:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-01-05 23:55:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-01-05 23:55:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-01-05 23:55:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-01-05 23:55:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-01-05 23:55:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-01-05 23:55:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-01-05 23:55:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-01-05 23:55:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-01-05 23:55:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '账户解锁', '501', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-01-05 23:55:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-01-05 23:55:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-01-05 23:55:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-01-05 23:55:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-01-05 23:55:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-01-05 23:55:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-01-05 23:55:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-01-05 23:55:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-01-05 23:55:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '6', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-01-05 23:55:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '116', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-01-05 23:55:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '116', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-01-05 23:55:27', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '116', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-01-05 23:55:27', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '116', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-01-05 23:55:27', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '116', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-01-05 23:55:27', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '116', '6', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-01-05 23:55:27', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', 'C端客户', '1', '1', 'custom', 'system/custom/index', null, '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-01-06 21:46:56', '', null, '');
INSERT INTO `sys_menu` VALUES ('2001', '网盘', '0', '4', 'disk', null, null, '1', '0', 'M', '0', '0', '', 'education', 'admin', '2024-04-11 22:30:11', 'admin', '2024-04-11 22:30:36', '');
INSERT INTO `sys_menu` VALUES ('2002', '全部文件', '2001', '1', 'file', 'disk/file/index', '', '1', '0', 'C', '0', '0', 'disk:file:list', '#', 'admin', '2024-04-11 22:58:50', 'admin', '2024-04-12 20:28:21', '文件菜单');
INSERT INTO `sys_menu` VALUES ('2003', '文件查询', '2002', '1', '#', '', null, '1', '0', 'F', '0', '0', 'disk:file:query', '#', 'admin', '2024-04-11 22:58:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '文件新增', '2002', '2', '#', '', null, '1', '0', 'F', '0', '0', 'disk:file:add', '#', 'admin', '2024-04-11 22:58:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '文件修改', '2002', '3', '#', '', null, '1', '0', 'F', '0', '0', 'disk:file:edit', '#', 'admin', '2024-04-11 22:58:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '文件删除', '2002', '4', '#', '', null, '1', '0', 'F', '0', '0', 'disk:file:remove', '#', 'admin', '2024-04-11 22:58:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '文件导出', '2002', '5', '#', '', null, '1', '0', 'F', '0', '0', 'disk:file:export', '#', 'admin', '2024-04-11 22:58:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2008', '回收站', '2001', '7', 'recovery', 'disk/recovery/index', null, '1', '0', 'C', '0', '0', 'disk:recovery:list', '#', 'admin', '2024-04-11 22:59:12', 'admin', '2024-04-12 20:24:46', '回收站菜单');
INSERT INTO `sys_menu` VALUES ('2009', '回收站查询', '2008', '1', '#', '', null, '1', '0', 'F', '0', '0', 'disk:recovery:query', '#', 'admin', '2024-04-11 22:59:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '回收站新增', '2008', '2', '#', '', null, '1', '0', 'F', '0', '0', 'disk:recovery:add', '#', 'admin', '2024-04-11 22:59:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '回收站修改', '2008', '3', '#', '', null, '1', '0', 'F', '0', '0', 'disk:recovery:edit', '#', 'admin', '2024-04-11 22:59:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '回收站删除', '2008', '4', '#', '', null, '1', '0', 'F', '0', '0', 'disk:recovery:remove', '#', 'admin', '2024-04-11 22:59:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '回收站导出', '2008', '5', '#', '', null, '1', '0', 'F', '0', '0', 'disk:recovery:export', '#', 'admin', '2024-04-11 22:59:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2014', '分享', '2001', '8', 'share', 'disk/share/index', null, '1', '0', 'C', '0', '0', 'disk:share:list', '#', 'admin', '2024-04-11 22:59:22', 'admin', '2024-04-12 20:24:56', '分享菜单');
INSERT INTO `sys_menu` VALUES ('2015', '分享查询', '2014', '1', '#', '', null, '1', '0', 'F', '0', '0', 'disk:share:query', '#', 'admin', '2024-04-11 22:59:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '分享新增', '2014', '2', '#', '', null, '1', '0', 'F', '0', '0', 'disk:share:add', '#', 'admin', '2024-04-11 22:59:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '分享修改', '2014', '3', '#', '', null, '1', '0', 'F', '0', '0', 'disk:share:edit', '#', 'admin', '2024-04-11 22:59:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '分享删除', '2014', '4', '#', '', null, '1', '0', 'F', '0', '0', 'disk:share:remove', '#', 'admin', '2024-04-11 22:59:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '分享导出', '2014', '5', '#', '', null, '1', '0', 'F', '0', '0', 'disk:share:export', '#', 'admin', '2024-04-11 22:59:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '用户存储', '2001', '9', 'storage', 'disk/storage/index', null, '1', '0', 'C', '0', '0', 'disk:storage:list', '#', 'admin', '2024-04-11 22:59:37', 'admin', '2024-04-12 20:25:19', '用户存储菜单');
INSERT INTO `sys_menu` VALUES ('2021', '用户存储查询', '2020', '1', '#', '', null, '1', '0', 'F', '0', '0', 'disk:storage:query', '#', 'admin', '2024-04-11 22:59:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '用户存储新增', '2020', '2', '#', '', null, '1', '0', 'F', '0', '0', 'disk:storage:add', '#', 'admin', '2024-04-11 22:59:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '用户存储修改', '2020', '3', '#', '', null, '1', '0', 'F', '0', '0', 'disk:storage:edit', '#', 'admin', '2024-04-11 22:59:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2024', '用户存储删除', '2020', '4', '#', '', null, '1', '0', 'F', '0', '0', 'disk:storage:remove', '#', 'admin', '2024-04-11 22:59:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2025', '用户存储导出', '2020', '5', '#', '', null, '1', '0', 'F', '0', '0', 'disk:storage:export', '#', 'admin', '2024-04-11 22:59:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2026', '图片', '2001', '2', 'image', 'disk/file/image', '', '1', '0', 'C', '0', '0', 'disk:file:list', '#', 'admin', '2024-04-12 20:13:50', 'admin', '2024-04-12 20:31:35', '');
INSERT INTO `sys_menu` VALUES ('2027', '视频', '2001', '3', 'video', 'disk/file/video', '', '1', '0', 'C', '0', '0', 'disk:file:list', '#', 'admin', '2024-04-12 20:15:53', 'admin', '2024-04-12 20:31:44', '');
INSERT INTO `sys_menu` VALUES ('2028', '文档', '2001', '4', 'doc', 'disk/file/doc', '', '1', '0', 'C', '0', '0', 'disk:file:list', '#', 'admin', '2024-04-12 20:21:37', 'admin', '2024-04-12 20:31:51', '');
INSERT INTO `sys_menu` VALUES ('2029', '音乐', '2001', '5', 'music', 'disk/file/music', '', '1', '0', 'C', '0', '0', 'disk:file:list', '#', 'admin', '2024-04-12 20:23:17', 'admin', '2024-04-12 20:31:57', '');
INSERT INTO `sys_menu` VALUES ('2030', '其他', '2001', '6', 'other', 'disk/file/other', '', '1', '0', 'C', '0', '0', 'disk:file:list', '#', 'admin', '2024-04-12 20:24:31', 'admin', '2024-04-12 20:32:03', '');
INSERT INTO `sys_menu` VALUES ('2031', '分享', '2002', '6', '', null, null, '1', '0', 'F', '0', '0', 'disk:file:share', '#', 'admin', '2024-04-12 21:09:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('2032', '敏感词', '2001', '1', 'sensitiveWord', 'disk/sensitiveWord/index', null, '1', '0', 'C', '0', '0', 'disk:sensitiveWord:list', '#', 'admin', '2024-04-17 00:26:09', 'admin', '2024-04-17 01:31:05', '违规词菜单');
INSERT INTO `sys_menu` VALUES ('2033', '敏感词查询', '2032', '1', '#', '', null, '1', '0', 'F', '0', '0', 'disk:sensitiveWord:query', '#', 'admin', '2024-04-17 00:26:10', 'admin', '2024-04-17 01:31:16', '');
INSERT INTO `sys_menu` VALUES ('2034', '敏感词新增', '2032', '2', '#', '', null, '1', '0', 'F', '0', '0', 'disk:sensitiveWord:add', '#', 'admin', '2024-04-17 00:26:10', 'admin', '2024-04-17 01:31:23', '');
INSERT INTO `sys_menu` VALUES ('2035', '敏感词修改', '2032', '3', '#', '', null, '1', '0', 'F', '0', '0', 'disk:sensitiveWord:edit', '#', 'admin', '2024-04-17 00:26:10', 'admin', '2024-04-17 01:31:36', '');
INSERT INTO `sys_menu` VALUES ('2036', '敏感词删除', '2032', '4', '#', '', null, '1', '0', 'F', '0', '0', 'disk:sensitiveWord:remove', '#', 'admin', '2024-04-17 00:26:10', 'admin', '2024-04-17 01:31:42', '');
INSERT INTO `sys_menu` VALUES ('2037', '敏感词导出', '2032', '5', '#', '', null, '1', '0', 'F', '0', '0', 'disk:sensitiveWord:export', '#', 'admin', '2024-04-17 00:26:10', 'admin', '2024-04-17 01:31:51', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-01-05 23:56:03', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-01-05 23:56:04', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-01-05 23:55:13\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"管理员信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-01-06 21:44:32', '91');
INSERT INTO `sys_oper_log` VALUES ('101', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/custom/index\",\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"C端客户\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"custom\",\"perms\":\"system:user:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-01-06 21:46:56', '34');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', '0', null, '2024-04-11 22:26:13', '47');
INSERT INTO `sys_oper_log` VALUES ('103', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-05 23:55:11\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:26:42', '94');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:26:50', '24');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"网盘\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"/disk\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:30:11', '1135');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-11 22:30:11\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"网盘\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"disk\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:30:36', '17');
INSERT INTO `sys_oper_log` VALUES ('107', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"disk_recovery_file,disk_storage,disk_share_file,disk_file\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:31:21', '531');
INSERT INTO `sys_oper_log` VALUES ('108', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/disk_file', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:32:57', '122');
INSERT INTO `sys_oper_log` VALUES ('109', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/disk_recovery_file', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:32:59', '60');
INSERT INTO `sys_oper_log` VALUES ('110', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/disk_share_file', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:33:02', '423');
INSERT INTO `sys_oper_log` VALUES ('111', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/disk_storage', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:33:05', '673');
INSERT INTO `sys_oper_log` VALUES ('112', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"file\",\"className\":\"DiskFile\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:32:57\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"文件名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:32:57\",\"usableColumn\":false},{\"capJavaField\":\"OldName\",\"columnComment\":\"旧文件名\",\"columnId\":3,\"columnName\":\"old_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"oldName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:32:57\",\"usableColumn\":false},{\"capJavaField\":\"Size\",\"columnComment\":\"文件大小\",\"columnId\":4,\"columnName\":\"size\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:35:12', '108');
INSERT INTO `sys_oper_log` VALUES ('113', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"文件类型\",\"dictType\":\"file_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:37:01', '151');
INSERT INTO `sys_oper_log` VALUES ('114', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"图片\",\"dictSort\":0,\"dictType\":\"file_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:41:50', '255');
INSERT INTO `sys_oper_log` VALUES ('115', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"视频\",\"dictSort\":0,\"dictType\":\"file_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:42:13', '37');
INSERT INTO `sys_oper_log` VALUES ('116', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"文档\",\"dictSort\":0,\"dictType\":\"file_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:42:22', '29');
INSERT INTO `sys_oper_log` VALUES ('117', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"音乐\",\"dictSort\":0,\"dictType\":\"file_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:43:29', '41');
INSERT INTO `sys_oper_log` VALUES ('118', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"其他\",\"dictSort\":0,\"dictType\":\"file_type\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:43:44', '28');
INSERT INTO `sys_oper_log` VALUES ('119', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/disk_file', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:44:04', '91');
INSERT INTO `sys_oper_log` VALUES ('120', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"file\",\"className\":\"DiskFile\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:44:04\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"文件名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:44:04\",\"usableColumn\":false},{\"capJavaField\":\"OldName\",\"columnComment\":\"旧文件名\",\"columnId\":3,\"columnName\":\"old_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"oldName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:44:04\",\"usableColumn\":false},{\"capJavaField\":\"Size\",\"columnComment\":\"文件大小\",\"columnId\":4,\"columnName\":\"size\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:46:37', '75');
INSERT INTO `sys_oper_log` VALUES ('121', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"recovery\",\"className\":\"DiskRecoveryFile\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:32:59\",\"usableColumn\":false},{\"capJavaField\":\"FileId\",\"columnComment\":\"文件id\",\"columnId\":16,\"columnName\":\"file_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"fileId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:32:59\",\"usableColumn\":false},{\"capJavaField\":\"CreateId\",\"columnComment\":\"创建者\",\"columnId\":17,\"columnName\":\"create_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"createId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:32:59\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":18,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuer', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:48:34', '33');
INSERT INTO `sys_oper_log` VALUES ('122', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/disk_share_file', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:50:53', '71');
INSERT INTO `sys_oper_log` VALUES ('123', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"share\",\"className\":\"DiskShareFile\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:50:53\",\"usableColumn\":false},{\"capJavaField\":\"FileId\",\"columnComment\":\"分享的文件ids\",\"columnId\":24,\"columnName\":\"file_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"fileId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:50:53\",\"usableColumn\":false},{\"capJavaField\":\"SecretKey\",\"columnComment\":\"\",\"columnId\":25,\"columnName\":\"secret_key\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"secretKey\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:50:53\",\"usableColumn\":false},{\"capJavaField\":\"ExpirationTime\",\"columnComment\":\"\",\"columnId\":26,\"columnName\":\"expiration_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:53:10', '49');
INSERT INTO `sys_oper_log` VALUES ('124', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"recovery\",\"className\":\"DiskRecoveryFile\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:48:34\",\"usableColumn\":false},{\"capJavaField\":\"FileId\",\"columnComment\":\"文件id\",\"columnId\":16,\"columnName\":\"file_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"fileId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:48:34\",\"usableColumn\":false},{\"capJavaField\":\"CreateId\",\"columnComment\":\"创建者\",\"columnId\":17,\"columnName\":\"create_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"createId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:48:34\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":18,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isLi', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:53:33', '37');
INSERT INTO `sys_oper_log` VALUES ('125', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"file\",\"className\":\"DiskFile\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:46:37\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"文件名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:46:37\",\"usableColumn\":false},{\"capJavaField\":\"OldName\",\"columnComment\":\"旧文件名\",\"columnId\":3,\"columnName\":\"old_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"oldName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:46:37\",\"usableColumn\":false},{\"capJavaField\":\"Size\",\"columnComment\":\"文件大小\",\"columnId\":4,\"columnName\":\"size\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:53:45', '69');
INSERT INTO `sys_oper_log` VALUES ('126', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"storage\",\"className\":\"DiskStorage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":33,\"columnName\":\"id\",\"columnType\":\"bigint(20) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:33:05\",\"usableColumn\":false},{\"capJavaField\":\"BaseDir\",\"columnComment\":\"基础目录\",\"columnId\":34,\"columnName\":\"base_dir\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"baseDir\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:33:05\",\"usableColumn\":false},{\"capJavaField\":\"TotalCapacity\",\"columnComment\":\"总容量\",\"columnId\":35,\"columnName\":\"total_capacity\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"totalCapacity\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"GTE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 22:33:05\",\"usableColumn\":false},{\"capJavaField\":\"UsedCapacity\",\"columnComment\":\"已用容量\",\"columnId\":36,\"columnName\":\"used_capacity\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncremen', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-11 22:55:21', '47');
INSERT INTO `sys_oper_log` VALUES ('127', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"disk_file,disk_recovery_file,disk_share_file,disk_storage\"}', null, '0', null, '2024-04-11 22:55:36', '1375');
INSERT INTO `sys_oper_log` VALUES ('128', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-01-05 23:56:01\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 00:42:18', '490');
INSERT INTO `sys_oper_log` VALUES ('129', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-01-05 23:56:01\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 00:42:18', '533');
INSERT INTO `sys_oper_log` VALUES ('130', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-01-05 23:56:01\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 00:42:18', '543');
INSERT INTO `sys_oper_log` VALUES ('131', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 13:01:38\",\"id\":1,\"name\":\"java\",\"orderNum\":0,\"params\":{},\"remark\":\"学习资料\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 13:01:38', '22');
INSERT INTO `sys_oper_log` VALUES ('132', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 13:21:09', '52');
INSERT INTO `sys_oper_log` VALUES ('133', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 13:21:40\",\"id\":2,\"isDir\":1,\"name\":\"java\",\"orderNum\":0,\"params\":{},\"remark\":\"学习资料\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 13:21:40', '15');
INSERT INTO `sys_oper_log` VALUES ('134', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 13:21:41\",\"delFlag\":\"0\",\"id\":2,\"isDir\":1,\"name\":\"java\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"remark\":\"学习资料1\",\"size\":0,\"type\":0,\"updateTime\":\"2024-04-12 13:22:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 13:22:06', '7');
INSERT INTO `sys_oper_log` VALUES ('135', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 13:28:17\",\"id\":3,\"name\":\"数据结构试题库答案.doc\",\"oldName\":\"数据结构试题库答案.doc\",\"orderNum\":1,\"params\":{},\"url\":\"/profile/upload/null/2024/04/12/数据结构试题库答案_20240412132726A001.doc\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 13:28:17', '6');
INSERT INTO `sys_oper_log` VALUES ('136', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 13:30:27', '17');
INSERT INTO `sys_oper_log` VALUES ('137', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 13:35:13\",\"id\":4,\"name\":\"数据结构试题库答案.doc\",\"oldName\":\"数据结构试题库答案.doc\",\"orderNum\":1,\"params\":{},\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/2024/04/12/数据结构试题库答案_20240412133458A001.doc\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 13:35:13', '57');
INSERT INTO `sys_oper_log` VALUES ('138', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 14:43:10\",\"id\":5,\"isDir\":1,\"name\":\"css\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 14:43:11', '65');
INSERT INTO `sys_oper_log` VALUES ('139', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 14:43:19\",\"id\":6,\"isDir\":1,\"name\":\"js\",\"orderNum\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 14:43:19', '16');
INSERT INTO `sys_oper_log` VALUES ('140', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 17:23:30\",\"delFlag\":\"0\",\"id\":7,\"isDir\":0,\"name\":\"微信公众号_20240412172330A001.jpg\",\"oldName\":\"微信公众号.jpg\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":39015,\"type\":0,\"updateTime\":\"2024-04-12 17:28:28\",\"url\":\"http://localhost:8081/profile/upload/b840c63567724e518174bec6abea8f65/2024/04/12/微信公众号_20240412172330A001.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 17:28:29', '68');
INSERT INTO `sys_oper_log` VALUES ('141', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 17:39:46\",\"id\":8,\"isDir\":1,\"name\":\"初级\",\"orderNum\":0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 17:39:46', '20');
INSERT INTO `sys_oper_log` VALUES ('142', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 17:41:44\",\"id\":9,\"isDir\":1,\"name\":\"初级\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 17:41:44', '10');
INSERT INTO `sys_oper_log` VALUES ('143', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/8', '127.0.0.1', '内网IP', '{}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'= 2\n        where id in\n         (  \n            8\n         )\' at line 1\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update disk_file delFlag = 2         where id in          (               ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'= 2\n        where id in\n         (  \n            8\n         )\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'= 2\n        where id in\n         (  \n            8\n         )\' at line 1', '2024-04-12 17:42:05', '386');
INSERT INTO `sys_oper_log` VALUES ('144', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/8,9', '127.0.0.1', '内网IP', '{}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'= 2\n        where id in\n         (  \n            8\n         , \n            9\n   \' at line 1\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update disk_file delFlag = 2         where id in          (               ?          ,              ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'= 2\n        where id in\n         (  \n            8\n         , \n            9\n   \' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'= 2\n        where id in\n         (  \n            8\n         , \n            9\n   \' at line 1', '2024-04-12 17:42:11', '6');
INSERT INTO `sys_oper_log` VALUES ('145', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/8,9', '127.0.0.1', '内网IP', '{}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'delFlag\' in \'field list\'\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update disk_file set delFlag = 2         where id in          (               ?          ,              ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'delFlag\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'delFlag\' in \'field list\'', '2024-04-12 17:45:14', '115');
INSERT INTO `sys_oper_log` VALUES ('146', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/8,9,7', '127.0.0.1', '内网IP', '{}', null, '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'parentId\' in \'where clause\'\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id from disk_file  where parentId in          (               ?          ,              ?          ,              ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'parentId\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'parentId\' in \'where clause\'', '2024-04-12 17:47:35', '129');
INSERT INTO `sys_oper_log` VALUES ('147', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/8,9,7', '127.0.0.1', '内网IP', '{}', null, '1', 'nested exception is org.apache.ibatis.executor.ExecutorException: A query was run and no Result Maps were found for the Mapped Statement \'com.ruoyi.disk.mapper.DiskFileMapper.selectDiskFileByParentIds\'.  It\'s likely that neither a Result Type nor a Result Map was specified.', '2024-04-12 17:49:27', '53');
INSERT INTO `sys_oper_log` VALUES ('148', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/8,9,7', '127.0.0.1', '内网IP', '{}', null, '1', '[Ljava.lang.Object; cannot be cast to [Ljava.lang.Long;', '2024-04-12 17:52:51', '69');
INSERT INTO `sys_oper_log` VALUES ('149', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 17:57:40\",\"id\":10,\"isDir\":1,\"name\":\"1\",\"orderNum\":1,\"params\":{},\"parentId\":8}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 17:57:40', '48');
INSERT INTO `sys_oper_log` VALUES ('150', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 18:07:04\",\"id\":12,\"isDir\":1,\"name\":\"2\",\"params\":{},\"parentId\":10}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 18:07:04', '7');
INSERT INTO `sys_oper_log` VALUES ('151', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/7,8,9', '127.0.0.1', '内网IP', '{}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskRecoveryFileMapper.xml]\r\n### The error may involve com.ruoyi.disk.mapper.DiskRecoveryFileMapper.insertDiskRecoveryFile-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into disk_recovery_file          ( file_id,             create_id,             create_time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2024-04-12 18:07:51', '17556');
INSERT INTO `sys_oper_log` VALUES ('152', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/7,8,9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 18:09:01', '53');
INSERT INTO `sys_oper_log` VALUES ('153', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', '0', null, '2024-04-12 19:32:23', '5');
INSERT INTO `sys_oper_log` VALUES ('154', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1019', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 19:32:30', '150');
INSERT INTO `sys_oper_log` VALUES ('155', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1018', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 19:32:33', '14');
INSERT INTO `sys_oper_log` VALUES ('156', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1017', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 19:32:36', '12');
INSERT INTO `sys_oper_log` VALUES ('157', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1016', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 19:32:39', '13');
INSERT INTO `sys_oper_log` VALUES ('158', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 19:32:42', '14');
INSERT INTO `sys_oper_log` VALUES ('159', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1024', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 19:32:49', '20');
INSERT INTO `sys_oper_log` VALUES ('160', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1023', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 19:32:52', '9');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1022', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 19:32:55', '14');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1021', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 19:32:58', '12');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1020', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 19:33:01', '14');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 19:33:05', '20');
INSERT INTO `sys_oper_log` VALUES ('165', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 17:41:44\",\"delFlag\":\"0\",\"id\":9,\"isDir\":1,\"name\":\"初级2\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"size\":0,\"type\":0,\"updateTime\":\"2024-04-12 20:04:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:04:43', '79');
INSERT INTO `sys_oper_log` VALUES ('166', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 20:04:55\",\"isDir\":1,\"name\":\"java\",\"orderNum\":2,\"params\":{},\"parentId\":0}', null, '1', '名称重复', '2024-04-12 20:04:55', '5');
INSERT INTO `sys_oper_log` VALUES ('167', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createTime\":\"2024-04-11 22:58:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:06:04', '30');
INSERT INTO `sys_oper_log` VALUES ('168', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/image\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"图片\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"path\":\"image\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:13:50', '24');
INSERT INTO `sys_oper_log` VALUES ('169', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/image\",\"createTime\":\"2024-04-12 20:13:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"图片\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"path\":\"image\",\"perms\":\"disk:file:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:14:09', '20');
INSERT INTO `sys_oper_log` VALUES ('170', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/video\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"视频\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2001,\"path\":\"video\",\"perms\":\"disk:file:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:15:53', '19');
INSERT INTO `sys_oper_log` VALUES ('171', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createTime\":\"2024-04-12 20:13:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"图片\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=0\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:16:55', '12');
INSERT INTO `sys_oper_log` VALUES ('172', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createTime\":\"2024-04-12 20:15:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"视频\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=1\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:20:00', '17');
INSERT INTO `sys_oper_log` VALUES ('173', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createTime\":\"2024-04-11 22:58:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=null\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:20:43', '18');
INSERT INTO `sys_oper_log` VALUES ('174', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"文档\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=2\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:21:37', '18');
INSERT INTO `sys_oper_log` VALUES ('175', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createTime\":\"2024-04-12 20:13:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"图片\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=0\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:21:55', '10');
INSERT INTO `sys_oper_log` VALUES ('176', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createTime\":\"2024-04-12 20:15:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"视频\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=1\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:22:04', '18');
INSERT INTO `sys_oper_log` VALUES ('177', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createTime\":\"2024-04-12 20:21:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"文档\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=2\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:22:13', '17');
INSERT INTO `sys_oper_log` VALUES ('178', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"音乐\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=3\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:23:17', '25');
INSERT INTO `sys_oper_log` VALUES ('179', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createTime\":\"2024-04-12 20:23:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"音乐\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=3\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:23:28', '18');
INSERT INTO `sys_oper_log` VALUES ('180', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"其他\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=4\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:24:31', '12');
INSERT INTO `sys_oper_log` VALUES ('181', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/recovery/index\",\"createTime\":\"2024-04-11 22:59:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"回收站\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2001,\"path\":\"recovery\",\"perms\":\"disk:recovery:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:24:46', '11');
INSERT INTO `sys_oper_log` VALUES ('182', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/share/index\",\"createTime\":\"2024-04-11 22:59:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"分享\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":2001,\"path\":\"share\",\"perms\":\"disk:share:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:24:56', '20');
INSERT INTO `sys_oper_log` VALUES ('183', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/storage/index\",\"createTime\":\"2024-04-11 22:59:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"用户存储\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":2001,\"path\":\"storage\",\"perms\":\"disk:storage:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:25:19', '17');
INSERT INTO `sys_oper_log` VALUES ('184', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-05 23:55:11\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2020,2002,2003,2004,2005,2006,2007,2026,2027,2028,2029,2030,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2022,2023],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:27:13', '87');
INSERT INTO `sys_oper_log` VALUES ('185', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/index\",\"createTime\":\"2024-04-11 22:58:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"全部文件\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:28:21', '10');
INSERT INTO `sys_oper_log` VALUES ('186', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/image\",\"createTime\":\"2024-04-12 20:13:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"图片\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=0\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:28:35', '9');
INSERT INTO `sys_oper_log` VALUES ('187', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/video\",\"createTime\":\"2024-04-12 20:15:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"视频\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=1\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:28:50', '16');
INSERT INTO `sys_oper_log` VALUES ('188', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/doc\",\"createTime\":\"2024-04-12 20:21:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"文档\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=2\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:28:57', '53');
INSERT INTO `sys_oper_log` VALUES ('189', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/music\",\"createTime\":\"2024-04-12 20:23:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"音乐\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"type=3\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:29:31', '17');
INSERT INTO `sys_oper_log` VALUES ('190', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/other\",\"createTime\":\"2024-04-12 20:24:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"其他\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:30:12', '17');
INSERT INTO `sys_oper_log` VALUES ('191', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/music\",\"createTime\":\"2024-04-12 20:23:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"音乐\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:30:19', '8');
INSERT INTO `sys_oper_log` VALUES ('192', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/doc\",\"createTime\":\"2024-04-12 20:21:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"文档\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:30:25', '9');
INSERT INTO `sys_oper_log` VALUES ('193', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/video\",\"createTime\":\"2024-04-12 20:15:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"视频\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:30:30', '16');
INSERT INTO `sys_oper_log` VALUES ('194', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/image\",\"createTime\":\"2024-04-12 20:13:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"图片\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"file\",\"perms\":\"disk:file:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:30:39', '9');
INSERT INTO `sys_oper_log` VALUES ('195', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/image\",\"createTime\":\"2024-04-12 20:13:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"图片\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"image\",\"perms\":\"disk:file:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:31:35', '10');
INSERT INTO `sys_oper_log` VALUES ('196', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/video\",\"createTime\":\"2024-04-12 20:15:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"视频\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"video\",\"perms\":\"disk:file:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:31:44', '18');
INSERT INTO `sys_oper_log` VALUES ('197', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/doc\",\"createTime\":\"2024-04-12 20:21:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"文档\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"doc\",\"perms\":\"disk:file:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:31:51', '16');
INSERT INTO `sys_oper_log` VALUES ('198', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/music\",\"createTime\":\"2024-04-12 20:23:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"音乐\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"music\",\"perms\":\"disk:file:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:31:57', '15');
INSERT INTO `sys_oper_log` VALUES ('199', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/file/other\",\"createTime\":\"2024-04-12 20:24:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"其他\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"path\":\"other\",\"perms\":\"disk:file:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 20:32:03', '15');
INSERT INTO `sys_oper_log` VALUES ('200', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"分享\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2002,\"perms\":\"disk:file:share\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 21:09:07', '20');
INSERT INTO `sys_oper_log` VALUES ('201', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/disk_share_file', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 21:38:32', '268');
INSERT INTO `sys_oper_log` VALUES ('202', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/disk_share_file', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 21:41:08', '64');
INSERT INTO `sys_oper_log` VALUES ('203', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"share\",\"className\":\"DiskShareFile\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-12 21:41:08\",\"usableColumn\":false},{\"capJavaField\":\"FileIds\",\"columnComment\":\"分享的文件ids\",\"columnId\":44,\"columnName\":\"file_ids\",\"columnType\":\"varchar(100)\",\"createBy\":\"\",\"createTime\":\"2024-04-12 21:38:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"fileIds\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-12 21:41:08\",\"usableColumn\":false},{\"capJavaField\":\"Uuid\",\"columnComment\":\"\",\"columnId\":45,\"columnName\":\"uuid\",\"columnType\":\"varchar(100)\",\"createBy\":\"\",\"createTime\":\"2024-04-12 21:38:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"uuid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-12 21:41:08\",\"usableColumn\":false},{\"capJavaField\":\"SecretKey\",\"columnComment\":\"\",\"columnId\":25,\"columnName\":\"secret_key\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 22:31:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 21:42:01', '60');
INSERT INTO `sys_oper_log` VALUES ('204', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 22:54:13', '74');
INSERT INTO `sys_oper_log` VALUES ('205', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 23:04:11\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"2,4,7\",\"params\":{},\"secretKey\":\"dbccb0fa2f4c4e7cae0caf958acb1be0\",\"secretKeyRadio\":\"1\",\"uuid\":\"4aa941161eed4a5fb7099f246b6d0d8e\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createId\":1,\"createTime\":\"2024-04-12 23:04:11\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"2,4,7\",\"params\":{},\"secretKey\":\"dbccb0fa2f4c4e7cae0caf958acb1be0\",\"secretKeyRadio\":\"1\",\"uuid\":\"4aa941161eed4a5fb7099f246b6d0d8e\"}}', '0', null, '2024-04-12 23:04:11', '68');
INSERT INTO `sys_oper_log` VALUES ('206', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-12 23:06:17\",\"expirationTime\":\"2024-04-18\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"2,4\",\"params\":{},\"remark\":\"asdffds\",\"secretKey\":\"12345\",\"secretKeyRadio\":\"2\",\"uuid\":\"ebe3739f3b5243eea900ef7558a097c4\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createId\":1,\"createTime\":\"2024-04-12 23:06:17\",\"expirationTime\":\"2024-04-18\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"2,4\",\"params\":{},\"remark\":\"asdffds\",\"secretKey\":\"12345\",\"secretKeyRadio\":\"2\",\"uuid\":\"ebe3739f3b5243eea900ef7558a097c4\"}}', '0', null, '2024-04-12 23:06:17', '37');
INSERT INTO `sys_oper_log` VALUES ('207', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-05 23:55:11\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2002,2020,2003,2004,2005,2006,2007,2026,2027,2028,2029,2030,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2022],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-12 23:38:26', '192');
INSERT INTO `sys_oper_log` VALUES ('208', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"isDir\":1,\"name\":\"java\",\"orderNum\":0,\"params\":{},\"parentId\":0}', null, '1', '父文件夹不存在', '2024-04-13 11:25:41', '27');
INSERT INTO `sys_oper_log` VALUES ('209', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 11:26:56\",\"id\":15,\"isDir\":1,\"name\":\"java\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"url\":\"/profile/b840c63567724e518174bec6abea8f65/java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 11:26:56', '74');
INSERT INTO `sys_oper_log` VALUES ('210', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 11:27:11\",\"id\":16,\"isDir\":1,\"name\":\"spring\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"url\":\"/profile/b840c63567724e518174bec6abea8f65/spring\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 11:27:11', '27');
INSERT INTO `sys_oper_log` VALUES ('211', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 11:49:17\",\"id\":20,\"isDir\":1,\"name\":\"初级\",\"orderNum\":1,\"params\":{},\"parentId\":15,\"url\":\"/profile/b840c63567724e518174bec6abea8f65//profile/b840c63567724e518174bec6abea8f65/java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 11:49:17', '63');
INSERT INTO `sys_oper_log` VALUES ('212', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 11:50:16\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"15,16\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"cb93cfc05eff4d2189641745be7a9979\",\"secretKeyRadio\":\"1\",\"uuid\":\"368a4d356621482c8b7065153271a8b9\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createId\":1,\"createTime\":\"2024-04-13 11:50:16\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"15,16\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"cb93cfc05eff4d2189641745be7a9979\",\"secretKeyRadio\":\"1\",\"uuid\":\"368a4d356621482c8b7065153271a8b9\"}}', '0', null, '2024-04-13 11:50:16', '23');
INSERT INTO `sys_oper_log` VALUES ('213', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 11:52:27\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"15,16\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"7a61d0e5b6ad4f939b04363502c47c44\",\"secretKeyRadio\":\"1\",\"uuid\":\"48049d8f9361410698d7b0d0530260dd\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createId\":1,\"createTime\":\"2024-04-13 11:52:27\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"15,16\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"7a61d0e5b6ad4f939b04363502c47c44\",\"secretKeyRadio\":\"1\",\"uuid\":\"48049d8f9361410698d7b0d0530260dd\"}}', '0', null, '2024-04-13 11:52:27', '58');
INSERT INTO `sys_oper_log` VALUES ('214', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 11:52:59\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"15,16\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"2adb0db42f384eba92e1b632b1a4f6ef\",\"secretKeyRadio\":\"1\",\"uuid\":\"7e8fe70f9f8f4d74a43d0c97a943699c\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createId\":1,\"createTime\":\"2024-04-13 11:52:59\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"15,16\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"2adb0db42f384eba92e1b632b1a4f6ef\",\"secretKeyRadio\":\"1\",\"uuid\":\"7e8fe70f9f8f4d74a43d0c97a943699c\"}}', '0', null, '2024-04-13 11:52:59', '7');
INSERT INTO `sys_oper_log` VALUES ('215', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 12:20:29\",\"id\":23,\"isDir\":1,\"name\":\"java\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"url\":\"/profile/uploadb840c63567724e518174bec6abea8f65/java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 12:20:29', '113');
INSERT INTO `sys_oper_log` VALUES ('216', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 12:20:42\",\"id\":24,\"isDir\":1,\"name\":\"spring\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"url\":\"/profile/uploadb840c63567724e518174bec6abea8f65/spring\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 12:20:42', '21');
INSERT INTO `sys_oper_log` VALUES ('217', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 12:20:56\",\"id\":25,\"isDir\":1,\"name\":\"初级\",\"orderNum\":0,\"params\":{},\"parentId\":23,\"url\":\"/profile/b840c63567724e518174bec6abea8f65//profile/uploadb840c63567724e518174bec6abea8f65/java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 12:20:56', '24');
INSERT INTO `sys_oper_log` VALUES ('218', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 12:22:45\",\"id\":26,\"isDir\":1,\"name\":\"初级\",\"orderNum\":0,\"params\":{},\"parentId\":23,\"url\":\"/profile/uploadb840c63567724e518174bec6abea8f65//profile/uploadb840c63567724e518174bec6abea8f65/java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 12:22:45', '77');
INSERT INTO `sys_oper_log` VALUES ('219', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 12:25:58\",\"id\":27,\"isDir\":1,\"name\":\"java\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 12:25:58', '53');
INSERT INTO `sys_oper_log` VALUES ('220', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 12:26:10\",\"id\":28,\"isDir\":1,\"name\":\"初级\",\"orderNum\":0,\"params\":{},\"parentId\":27,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65//profile/upload/b840c63567724e518174bec6abea8f65/java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 12:26:10', '28');
INSERT INTO `sys_oper_log` VALUES ('221', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 12:36:08\",\"id\":29,\"isDir\":1,\"name\":\"spring\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/spring\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 12:36:08', '83');
INSERT INTO `sys_oper_log` VALUES ('222', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 12:36:19\",\"id\":30,\"isDir\":1,\"name\":\"初级\",\"orderNum\":0,\"params\":{},\"parentId\":27,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/java初级\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 12:36:19', '29');
INSERT INTO `sys_oper_log` VALUES ('223', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 12:38:39\",\"id\":31,\"isDir\":1,\"name\":\"初级\",\"orderNum\":0,\"params\":{},\"parentId\":27,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/java/初级\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 12:38:39', '69');
INSERT INTO `sys_oper_log` VALUES ('224', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 12:40:12\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"fb9b73a99d93497795a6e9f03ddaddce\",\"secretKeyRadio\":\"1\",\"uuid\":\"9b8e78357a3f4e15bccb5eb8e19ad5af\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createId\":1,\"createTime\":\"2024-04-13 12:40:12\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"fb9b73a99d93497795a6e9f03ddaddce\",\"secretKeyRadio\":\"1\",\"uuid\":\"9b8e78357a3f4e15bccb5eb8e19ad5af\"}}', '0', null, '2024-04-13 12:40:12', '35');
INSERT INTO `sys_oper_log` VALUES ('225', '分享', '3', 'com.ruoyi.disk.controller.DiskShareFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/share/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-13 13:16:17', '27');
INSERT INTO `sys_oper_log` VALUES ('226', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-13 13:17:07\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"474d5dfedb8841a9894615b6f09b720b\",\"secretKeyRadio\":\"1\",\"uuid\":\"cd220e3b8e5641738bab73f2b8cef2a9\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createId\":1,\"createTime\":\"2024-04-13 13:17:07\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"474d5dfedb8841a9894615b6f09b720b\",\"secretKeyRadio\":\"1\",\"uuid\":\"cd220e3b8e5641738bab73f2b8cef2a9\"}}', '0', null, '2024-04-13 13:17:07', '6');
INSERT INTO `sys_oper_log` VALUES ('227', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"createId\":1,\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"params\":{},\"secretKeyRadio\":\"1\"}', null, '1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is java.sql.SQLException: interrupt\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskFileMapper.xml]\r\n### The error may involve com.ruoyi.disk.mapper.DiskFileMapper.selectDiskFileByParentIds\r\n### The error occurred while executing a query\r\n### Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is java.sql.SQLException: interrupt', '2024-04-13 14:22:40', '97653');
INSERT INTO `sys_oper_log` VALUES ('228', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"java.util.stream.ReferencePipeline$3@70d918c7,\",\"createId\":1,\"createTime\":\"2024-04-13 14:58:20\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"9a382b3d526a473b9ac42d39eefc86a9\",\"secretKeyRadio\":\"1\",\"uuid\":\"5048b7b9f6b24beaa6f83b6b18a32512\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'allFileIds\' in \'field list\'\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskShareFileMapper.xml]\r\n### The error may involve com.ruoyi.disk.mapper.DiskShareFileMapper.insertDiskShareFile-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into disk_share_file          ( file_ids,             uuid,             secret_key,                          is_permanent,             create_id,             create_time,                                       remark,                          all_file_ids )           values ( ?,             ?,             ?,                          ?,             ?,             ?,                                       ?,                          allFileIds )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'allFileIds\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'allFileIds\' in \'field list\'', '2024-04-13 14:58:21', '248927');
INSERT INTO `sys_oper_log` VALUES ('229', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"java.util.stream.ReferencePipeline$3@6c730262,\",\"createId\":1,\"createTime\":\"2024-04-13 18:47:16\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"16ef7c358990416db87b1bf8ced5311a\",\"secretKeyRadio\":\"1\",\"uuid\":\"357ddcf0b9bc4531b9b5708ecacd3837\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"java.util.stream.ReferencePipeline$3@6c730262,\",\"createId\":1,\"createTime\":\"2024-04-13 18:47:16\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"16ef7c358990416db87b1bf8ced5311a\",\"secretKeyRadio\":\"1\",\"uuid\":\"357ddcf0b9bc4531b9b5708ecacd3837\"}}', '0', null, '2024-04-13 18:47:16', '93333');
INSERT INTO `sys_oper_log` VALUES ('230', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"java.util.stream.ReferencePipeline$3@14fd2888,\",\"createId\":1,\"createTime\":\"2024-04-13 18:49:57\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"f0c889a72f6645bb95e7b913ad74e8ff\",\"secretKeyRadio\":\"1\",\"uuid\":\"c8bea4a809474a9d8d53c25d67bab178\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"java.util.stream.ReferencePipeline$3@14fd2888,\",\"createId\":1,\"createTime\":\"2024-04-13 18:49:57\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"f0c889a72f6645bb95e7b913ad74e8ff\",\"secretKeyRadio\":\"1\",\"uuid\":\"c8bea4a809474a9d8d53c25d67bab178\"}}', '0', null, '2024-04-13 18:49:57', '151733');
INSERT INTO `sys_oper_log` VALUES ('231', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"java.util.stream.ReferencePipeline$3@1bcf15b0,\",\"createId\":1,\"createTime\":\"2024-04-13 18:58:27\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"yyko7p\",\"secretKeyRadio\":\"1\",\"uuid\":\"893bd75f346a43988f004bf79172f85c\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"java.util.stream.ReferencePipeline$3@1bcf15b0,\",\"createId\":1,\"createTime\":\"2024-04-13 18:58:27\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"yyko7p\",\"secretKeyRadio\":\"1\",\"uuid\":\"893bd75f346a43988f004bf79172f85c\"}}', '0', null, '2024-04-13 18:58:27', '112');
INSERT INTO `sys_oper_log` VALUES ('232', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"java.util.stream.ReferencePipeline$3@2f108503,\",\"createId\":1,\"createTime\":\"2024-04-13 19:00:25\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"qtvb6w\",\"secretKeyRadio\":\"1\",\"uuid\":\"d7q1m0j2i0ku\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"java.util.stream.ReferencePipeline$3@2f108503,\",\"createId\":1,\"createTime\":\"2024-04-13 19:00:25\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"qtvb6w\",\"secretKeyRadio\":\"1\",\"uuid\":\"d7q1m0j2i0ku\"}}', '0', null, '2024-04-13 19:00:25', '75');
INSERT INTO `sys_oper_log` VALUES ('233', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"27,29,32,31,33,34,35\",\"createId\":1,\"createTime\":\"2024-04-13 19:03:00\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"fo9o6q\",\"secretKeyRadio\":\"1\",\"uuid\":\"euikwvlhnetd\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"27,29,32,31,33,34,35\",\"createId\":1,\"createTime\":\"2024-04-13 19:03:00\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"fo9o6q\",\"secretKeyRadio\":\"1\",\"uuid\":\"euikwvlhnetd\"}}', '0', null, '2024-04-13 19:03:00', '94');
INSERT INTO `sys_oper_log` VALUES ('234', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/33,31', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 01:35:56', '103');
INSERT INTO `sys_oper_log` VALUES ('235', '参数管理', '1', 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"storageCapacity\",\"configName\":\"初始化存储大小\",\"configType\":\"Y\",\"configValue\":\"20000000000\",\"createBy\":\"admin\",\"params\":{},\"remark\":\"单位字节如20g=20000000000字节\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 02:53:01', '39');
INSERT INTO `sys_oper_log` VALUES ('236', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":7,\"configKey\":\"storage.capacity\",\"configName\":\"初始化存储大小\",\"configType\":\"Y\",\"configValue\":\"20000000000\",\"createBy\":\"admin\",\"createTime\":\"2024-04-14 02:53:01\",\"params\":{},\"remark\":\"单位字节如20g=20000000000字节\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 02:53:19', '73');
INSERT INTO `sys_oper_log` VALUES ('237', '用户存储', '2', 'com.ruoyi.disk.controller.DiskStorageController.edit()', 'PUT', '1', 'admin', null, '/disk/storage', '127.0.0.1', '内网IP', '{\"baseDir\":\"b840c63567724e518174bec6abea8f65\",\"createId\":1,\"createTime\":\"2024-04-12 00:47:52\",\"delFlag\":\"0\",\"id\":1,\"params\":{},\"totalCapacity\":20000000000,\"updateTime\":\"2024-04-14 02:58:23\",\"usedCapacity\":970725}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 02:58:23', '45');
INSERT INTO `sys_oper_log` VALUES ('238', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'maple', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":3,\"createTime\":\"2024-04-14 04:09:24\",\"id\":38,\"isDir\":1,\"name\":\"测试\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"url\":\"/profile/upload/a90d31529f984501add2e4d2aa170d74/测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 04:09:24', '299');
INSERT INTO `sys_oper_log` VALUES ('239', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/38,39', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 04:10:34', '51');
INSERT INTO `sys_oper_log` VALUES ('240', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/3,4', '127.0.0.1', '内网IP', '[3,4]', null, '1', 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'array\' not found. Available parameters are [ids, userId, param1, param2]', '2024-04-14 04:21:58', '34');
INSERT INTO `sys_oper_log` VALUES ('241', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/3,4', '127.0.0.1', '内网IP', '[3,4]', null, '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: FUNCTION netdisk.count does not exist. Check the \'Function Name Parsing and Resolution\' section in the Reference Manual\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskRecoveryFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count (1) from disk_recovery_file where create_id = ? and  id in          (               ?          ,              ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: FUNCTION netdisk.count does not exist. Check the \'Function Name Parsing and Resolution\' section in the Reference Manual\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: FUNCTION netdisk.count does not exist. Check the \'Function Name Parsing and Resolution\' section in the Reference Manual', '2024-04-14 04:28:17', '264');
INSERT INTO `sys_oper_log` VALUES ('242', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/3,4', '127.0.0.1', '内网IP', '[3,4]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 04:31:13', '69');
INSERT INTO `sys_oper_log` VALUES ('243', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/38,39', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 04:52:45', '68');
INSERT INTO `sys_oper_log` VALUES ('244', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/5,6', '127.0.0.1', '内网IP', '[5,6]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 04:52:59', '64');
INSERT INTO `sys_oper_log` VALUES ('245', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/38,39', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 04:53:39', '36');
INSERT INTO `sys_oper_log` VALUES ('246', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/5,6,7,8', '127.0.0.1', '内网IP', '[5,6,7,8]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 05:01:55', '447421');
INSERT INTO `sys_oper_log` VALUES ('247', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/38,39', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 05:06:30', '71');
INSERT INTO `sys_oper_log` VALUES ('248', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/5,6,7,8,9,10', '127.0.0.1', '内网IP', '[5,6,7,8,9,10]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 05:07:40', '16534');
INSERT INTO `sys_oper_log` VALUES ('249', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/38,39', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 05:11:54', '71');
INSERT INTO `sys_oper_log` VALUES ('250', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/5,6,7,8,9,10,11,12', '127.0.0.1', '内网IP', '[5,6,7,8,9,10,11,12]', null, '1', '', '2024-04-14 05:12:03', '62');
INSERT INTO `sys_oper_log` VALUES ('251', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/11,12', '127.0.0.1', '内网IP', '[11,12]', null, '1', '', '2024-04-14 05:28:01', '19');
INSERT INTO `sys_oper_log` VALUES ('252', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/11,12', '127.0.0.1', '内网IP', '[11,12]', null, '1', '', '2024-04-14 05:28:16', '19');
INSERT INTO `sys_oper_log` VALUES ('253', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/11,12', '127.0.0.1', '内网IP', '[11,12]', null, '1', '', '2024-04-14 05:31:34', '149953');
INSERT INTO `sys_oper_log` VALUES ('254', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/11,12', '127.0.0.1', '内网IP', '[11,12]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 05:55:08', '6691');
INSERT INTO `sys_oper_log` VALUES ('255', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/38,39', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 05:55:47', '38');
INSERT INTO `sys_oper_log` VALUES ('256', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/recovery/13,14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 05:56:01', '296');
INSERT INTO `sys_oper_log` VALUES ('257', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'maple', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":3,\"createTime\":\"2024-04-14 05:57:09\",\"id\":41,\"isDir\":1,\"name\":\"测试\",\"params\":{},\"parentId\":0,\"url\":\"/profile/upload/a90d31529f984501add2e4d2aa170d74/测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 05:57:09', '35');
INSERT INTO `sys_oper_log` VALUES ('258', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'maple', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":3,\"createTime\":\"2024-04-14 05:57:21\",\"id\":42,\"isDir\":1,\"name\":\"从撒旦\",\"params\":{},\"parentId\":41,\"url\":\"/profile/upload/a90d31529f984501add2e4d2aa170d74/测试/从撒旦\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 05:57:21', '29');
INSERT INTO `sys_oper_log` VALUES ('259', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/41', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 06:02:29', '50');
INSERT INTO `sys_oper_log` VALUES ('260', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/recovery/15', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 06:02:48', '41');
INSERT INTO `sys_oper_log` VALUES ('261', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'maple', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":3,\"createTime\":\"2024-04-14 11:28:35\",\"id\":45,\"isDir\":1,\"name\":\"测试\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/a90d31529f984501add2e4d2aa170d74/测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:28:35', '195');
INSERT INTO `sys_oper_log` VALUES ('262', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'maple', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":3,\"createTime\":\"2024-04-14 11:28:43\",\"id\":46,\"isDir\":1,\"name\":\"1\",\"params\":{},\"parentId\":45,\"type\":5,\"url\":\"/profile/upload/a90d31529f984501add2e4d2aa170d74/测试/1\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:28:43', '59');
INSERT INTO `sys_oper_log` VALUES ('263', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-05 23:55:11\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2020,2002,2003,2004,2005,2006,2007,2031,2026,2027,2028,2029,2030,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2022],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"customer\",\"roleName\":\"用户角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:31:12', '92');
INSERT INTO `sys_oper_log` VALUES ('264', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', '1', 'admin', null, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:32:13', '132');
INSERT INTO `sys_oper_log` VALUES ('265', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2024-04-14 03:29:36\",\"delFlag\":\"0\",\"email\":\"2132@qq.com\",\"loginDate\":\"2024-04-14 11:28:06\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"maple\",\"params\":{},\"phonenumber\":\"17608690790\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"customer\",\"roleName\":\"用户角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"maple\",\"userType\":\"01\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:32:39', '37');
INSERT INTO `sys_oper_log` VALUES ('266', '用户存储', '2', 'com.ruoyi.disk.controller.DiskStorageController.edit()', 'PUT', '1', 'admin', null, '/disk/storage', '127.0.0.1', '内网IP', '{\"baseDir\":\"a90d31529f984501add2e4d2aa170d74\",\"createId\":3,\"createTime\":\"2024-04-14 03:33:10\",\"delFlag\":\"0\",\"id\":2,\"params\":{},\"totalCapacity\":200000000000,\"updateTime\":\"2024-04-14 11:34:08\",\"usedCapacity\":625358}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:34:08', '13');
INSERT INTO `sys_oper_log` VALUES ('267', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'maple', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"44,45,46,47\",\"createId\":3,\"createTime\":\"2024-04-14 11:35:54\",\"expirationTime\":\"2024-04-19\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"44,45\",\"isPermanent\":0,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"12345\",\"secretKeyRadio\":\"2\",\"uuid\":\"7uq9lcre7qdv\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"44,45,46,47\",\"createId\":3,\"createTime\":\"2024-04-14 11:35:54\",\"expirationTime\":\"2024-04-19\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"44,45\",\"isPermanent\":0,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"12345\",\"secretKeyRadio\":\"2\",\"uuid\":\"7uq9lcre7qdv\"}}', '0', null, '2024-04-14 11:35:54', '156');
INSERT INTO `sys_oper_log` VALUES ('268', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'maple', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"44,45,46,47\",\"createId\":3,\"createTime\":\"2024-04-14 11:35:54\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-13\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"44,45\",\"id\":13,\"isPermanent\":0,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"12345\",\"secretKeyRadio\":\"2\",\"updateTime\":\"2024-04-14 11:37:05\",\"uuid\":\"7uq9lcre7qdv\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:37:05', '13');
INSERT INTO `sys_oper_log` VALUES ('269', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'maple', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"44,45,46,47\",\"createId\":3,\"createTime\":\"2024-04-14 11:37:38\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"44,45\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"d3h0mi\",\"secretKeyRadio\":\"1\",\"uuid\":\"jsiaohl71foz\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"44,45,46,47\",\"createId\":3,\"createTime\":\"2024-04-14 11:37:38\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"44,45\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"d3h0mi\",\"secretKeyRadio\":\"1\",\"uuid\":\"jsiaohl71foz\"}}', '0', null, '2024-04-14 11:37:38', '27');
INSERT INTO `sys_oper_log` VALUES ('270', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/48', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:38:38', '21');
INSERT INTO `sys_oper_log` VALUES ('271', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/44', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:38:44', '26');
INSERT INTO `sys_oper_log` VALUES ('272', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/45', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:38:57', '35');
INSERT INTO `sys_oper_log` VALUES ('273', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'maple', null, '/disk/recovery/refresh/16,17,18', '127.0.0.1', '内网IP', '[16,17,18]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:39:13', '33');
INSERT INTO `sys_oper_log` VALUES ('274', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/44,45,48', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:39:43', '36');
INSERT INTO `sys_oper_log` VALUES ('275', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/recovery/19,20,21', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 11:40:03', '76');
INSERT INTO `sys_oper_log` VALUES ('276', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'maple', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":3,\"createTime\":\"2024-04-14 11:54:53\",\"isDir\":1,\"name\":\"java\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/a90d31529f984501add2e4d2aa170d74/java\"}', null, '1', '名称重复', '2024-04-14 11:54:53', '39');
INSERT INTO `sys_oper_log` VALUES ('277', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'maple', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":3,\"createTime\":\"2024-04-14 11:55:08\",\"isDir\":1,\"name\":\"java\",\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/a90d31529f984501add2e4d2aa170d74/java\"}', null, '1', '名称重复', '2024-04-14 11:55:08', '7');
INSERT INTO `sys_oper_log` VALUES ('278', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'maple', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":3,\"createTime\":\"2024-04-14 11:56:32\",\"isDir\":1,\"name\":\"java\",\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/a90d31529f984501add2e4d2aa170d74/java\"}', null, '1', '名称重复', '2024-04-14 11:58:54', '142179');
INSERT INTO `sys_oper_log` VALUES ('279', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'maple', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":3,\"createTime\":\"2024-04-14 12:00:37\",\"isDir\":1,\"name\":\"java\",\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/a90d31529f984501add2e4d2aa170d74/java\"}', null, '1', 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'userId\' not found. Available parameters are [arg3, name, id, param3, param4, param1, parentId, param2]', '2024-04-14 12:00:43', '6092');
INSERT INTO `sys_oper_log` VALUES ('280', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'maple', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":3,\"createTime\":\"2024-04-14 12:02:04\",\"id\":50,\"isDir\":1,\"name\":\"java\",\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/a90d31529f984501add2e4d2aa170d74/java\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 12:02:04', '159');
INSERT INTO `sys_oper_log` VALUES ('281', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'maple', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"49,50\",\"createId\":3,\"createTime\":\"2024-04-14 12:06:04\",\"expirationTime\":\"2024-04-16\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"49,50\",\"isPermanent\":0,\"params\":{},\"secretKey\":\"123456\",\"secretKeyRadio\":\"2\",\"uuid\":\"a0cqv568klzp\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"49,50\",\"createId\":3,\"createTime\":\"2024-04-14 12:06:04\",\"expirationTime\":\"2024-04-16\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"49,50\",\"isPermanent\":0,\"params\":{},\"secretKey\":\"123456\",\"secretKeyRadio\":\"2\",\"uuid\":\"a0cqv568klzp\"}}', '0', null, '2024-04-14 12:06:04', '86');
INSERT INTO `sys_oper_log` VALUES ('282', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/49,50', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 12:13:52', '27');
INSERT INTO `sys_oper_log` VALUES ('283', '用户头像', '2', 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/04/14/blob_20240414122012A001.png\",\"code\":200}', '0', null, '2024-04-14 12:20:12', '308');
INSERT INTO `sys_oper_log` VALUES ('284', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2024-04-14 11:27:16\",\"delFlag\":\"0\",\"email\":\"\",\"loginDate\":\"2024-04-14 11:27:37\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"maple168\",\"params\":{},\"phonenumber\":\"maple168\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"customer\",\"roleName\":\"用户角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":4,\"userName\":\"maple168\",\"userType\":\"01\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 12:43:34', '122');
INSERT INTO `sys_oper_log` VALUES ('285', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2024-04-14 11:27:16\",\"delFlag\":\"0\",\"email\":\"\",\"loginDate\":\"2024-04-14 11:27:37\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"maple168\",\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"customer\",\"roleName\":\"用户角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":4,\"userName\":\"maple168\",\"userType\":\"01\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 12:44:06', '27');
INSERT INTO `sys_oper_log` VALUES ('286', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 12:47:33', '42');
INSERT INTO `sys_oper_log` VALUES ('287', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/recovery/33,24,2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 12:47:50', '206');
INSERT INTO `sys_oper_log` VALUES ('288', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/recovery/33', '127.0.0.1', '内网IP', '{}', null, '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id, name, old_name, size, url, type, parent_id, is_dir, order_num, create_id, create_time, update_id, update_time, remark, del_flag from disk_file               where id in\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2024-04-14 12:48:02', '206');
INSERT INTO `sys_oper_log` VALUES ('289', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/recovery/33', '127.0.0.1', '内网IP', '{}', null, '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id, name, old_name, size, url, type, parent_id, is_dir, order_num, create_id, create_time, update_id, update_time, remark, del_flag from disk_file               where id in\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2024-04-14 12:48:48', '11564');
INSERT INTO `sys_oper_log` VALUES ('290', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/recovery/33', '127.0.0.1', '内网IP', '{}', null, '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id, name, old_name, size, url, type, parent_id, is_dir, order_num, create_id, create_time, update_id, update_time, remark, del_flag from disk_file               where id in\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2024-04-14 12:52:10', '77371');
INSERT INTO `sys_oper_log` VALUES ('291', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/recovery/33', '127.0.0.1', '内网IP', '{}', null, '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id, name, old_name, size, url, type, parent_id, is_dir, order_num, create_id, create_time, update_id, update_time, remark, del_flag from disk_file               where id in\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2024-04-14 12:53:34', '77812');
INSERT INTO `sys_oper_log` VALUES ('292', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/recovery/33', '127.0.0.1', '内网IP', '{}', null, '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id, name, old_name, size, url, type, parent_id, is_dir, order_num, create_id, create_time, update_id, update_time, remark, del_flag from disk_file               where id in\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2024-04-14 12:55:33', '7312');
INSERT INTO `sys_oper_log` VALUES ('293', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/recovery/33', '127.0.0.1', '内网IP', '{}', null, '1', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id, name, old_name, size, url, type, parent_id, is_dir, order_num, create_id, create_time, update_id, update_time, remark, del_flag from disk_file               where id in\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 3', '2024-04-14 12:56:49', '24');
INSERT INTO `sys_oper_log` VALUES ('294', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/recovery/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 12:57:12', '83');
INSERT INTO `sys_oper_log` VALUES ('295', '分享', '3', 'com.ruoyi.disk.controller.DiskShareFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/share/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 12:57:44', '6');
INSERT INTO `sys_oper_log` VALUES ('296', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-14 12:58:13\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"29\",\"isPermanent\":1,\"params\":{},\"remark\":\"cessafasf\",\"secretKey\":\"8rd5uz\",\"secretKeyRadio\":\"1\",\"uuid\":\"zf06s5tz6d8u\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"29,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-14 12:58:13\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"29\",\"isPermanent\":1,\"params\":{},\"remark\":\"cessafasf\",\"secretKey\":\"8rd5uz\",\"secretKeyRadio\":\"1\",\"uuid\":\"zf06s5tz6d8u\"}}', '0', null, '2024-04-14 12:58:13', '40');
INSERT INTO `sys_oper_log` VALUES ('297', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-14 12:58:13\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-13\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29\",\"id\":16,\"isPermanent\":0,\"params\":{},\"remark\":\"cessafasf\",\"secretKey\":\"8rd5uz\",\"secretKeyRadio\":\"2\",\"updateTime\":\"2024-04-14 12:58:48\",\"uuid\":\"zf06s5tz6d8u\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 12:58:48', '85');
INSERT INTO `sys_oper_log` VALUES ('298', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-14 12:58:13\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-14\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29\",\"id\":16,\"isPermanent\":0,\"params\":{},\"remark\":\"cessafasf\",\"secretKey\":\"8rd5uz\",\"secretKeyRadio\":\"2\",\"updateTime\":\"2024-04-14 13:17:37\",\"uuid\":\"zf06s5tz6d8u\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 13:17:37', '117');
INSERT INTO `sys_oper_log` VALUES ('299', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-14 12:58:13\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-17\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29\",\"id\":16,\"isPermanent\":0,\"params\":{},\"remark\":\"cessafasf\",\"secretKey\":\"8rd5uz\",\"secretKeyRadio\":\"2\",\"updateTime\":\"2024-04-14 13:31:53\",\"uuid\":\"zf06s5tz6d8u\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 13:31:53', '17');
INSERT INTO `sys_oper_log` VALUES ('300', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-14 12:58:13\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-17\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29\",\"id\":16,\"isPermanent\":0,\"params\":{},\"remark\":\"cessafasf\",\"secretKey\":\"8rd5uz\",\"secretKeyRadio\":\"2\",\"updateTime\":\"2024-04-14 13:38:23\",\"uuid\":\"zf06s5tz6d8u\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 13:38:23', '6');
INSERT INTO `sys_oper_log` VALUES ('301', '分享', '3', 'com.ruoyi.disk.controller.DiskShareFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/share/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 13:41:20', '64');
INSERT INTO `sys_oper_log` VALUES ('302', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"52\",\"createId\":1,\"createTime\":\"2024-04-14 15:37:25\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"52\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"uhr76a\",\"secretKeyRadio\":\"1\",\"uuid\":\"e9k01l8jbexu\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"52\",\"createId\":1,\"createTime\":\"2024-04-14 15:37:25\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"52\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"uhr76a\",\"secretKeyRadio\":\"1\",\"uuid\":\"e9k01l8jbexu\"}}', '0', null, '2024-04-14 15:37:26', '175');
INSERT INTO `sys_oper_log` VALUES ('303', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/52', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 15:39:02', '35');
INSERT INTO `sys_oper_log` VALUES ('304', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'admin', null, '/disk/recovery/refresh/25', '127.0.0.1', '内网IP', '[25]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-14 15:44:07', '9319');
INSERT INTO `sys_oper_log` VALUES ('305', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,51,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-15 08:09:29\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"29,51\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"hh1z4u\",\"secretKeyRadio\":\"1\",\"type\":1,\"uuid\":\"xbhjd5xxzybv\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"29,51,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-15 08:09:29\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"29,51\",\"isPermanent\":1,\"params\":{},\"remark\":\"测试测试\",\"secretKey\":\"hh1z4u\",\"secretKeyRadio\":\"1\",\"type\":1,\"uuid\":\"xbhjd5xxzybv\"}}', '0', null, '2024-04-15 08:09:29', '175');
INSERT INTO `sys_oper_log` VALUES ('306', '分享', '3', 'com.ruoyi.disk.controller.DiskShareFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/share/18', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-15 22:21:32', '187');
INSERT INTO `sys_oper_log` VALUES ('307', '分享', '3', 'com.ruoyi.disk.controller.DiskShareFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/share/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-15 22:22:12', '1032');
INSERT INTO `sys_oper_log` VALUES ('308', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"27,29,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-15 23:44:23\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"wblh9b\",\"secretKeyRadio\":\"1\",\"type\":0,\"uuid\":\"ccxad8rdtbp7\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"27,29,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-15 23:44:23\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"wblh9b\",\"secretKeyRadio\":\"1\",\"type\":0,\"uuid\":\"ccxad8rdtbp7\"}}', '0', null, '2024-04-15 23:44:24', '92');
INSERT INTO `sys_oper_log` VALUES ('309', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"27,29,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-15 23:44:24\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-19\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"27,29\",\"id\":19,\"isPermanent\":0,\"params\":{},\"secretKey\":\"wblh9b\",\"secretKeyRadio\":\"2\",\"type\":\"0\",\"updateTime\":\"2024-04-16 00:22:12\",\"uuid\":\"ccxad8rdtbp7\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"27,29,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-15 23:44:24\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-19\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"27,29\",\"id\":19,\"isPermanent\":0,\"params\":{},\"secretKey\":\"wblh9b\",\"secretKeyRadio\":\"2\",\"type\":\"0\",\"updateTime\":\"2024-04-16 00:22:12\",\"uuid\":\"ccxad8rdtbp7\"}}', '0', null, '2024-04-16 00:22:12', '399');
INSERT INTO `sys_oper_log` VALUES ('310', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,51,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:52:14\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"29,51,53\",\"isPermanent\":1,\"params\":{},\"remark\":\"城市撒旦\",\"secretKey\":\"57j8vj\",\"secretKeyRadio\":\"1\",\"type\":\"1\",\"uuid\":\"svprqorqoog4\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"29,51,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:52:14\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"29,51,53\",\"isPermanent\":1,\"params\":{},\"remark\":\"城市撒旦\",\"secretKey\":\"57j8vj\",\"secretKeyRadio\":\"1\",\"type\":\"1\",\"uuid\":\"svprqorqoog4\"}}', '0', null, '2024-04-16 01:52:14', '87');
INSERT INTO `sys_oper_log` VALUES ('311', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,51,52,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:56:06\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"29,51,53,52\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"zpq3i9\",\"secretKeyRadio\":\"1\",\"type\":\"1\",\"uuid\":\"3ybdwc6gn6ik\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"29,51,52,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:56:06\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"29,51,53,52\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"zpq3i9\",\"secretKeyRadio\":\"1\",\"type\":\"1\",\"uuid\":\"3ybdwc6gn6ik\"}}', '0', null, '2024-04-16 01:56:06', '27');
INSERT INTO `sys_oper_log` VALUES ('312', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,51,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:52:14\",\"delFlag\":\"0\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29,51,53\",\"id\":20,\"isPermanent\":0,\"params\":{},\"remark\":\"城市撒旦\",\"secretKey\":\"57j8vj\",\"secretKeyRadio\":\"2\",\"type\":\"1\",\"updateTime\":\"2024-04-16 02:07:09\",\"uuid\":\"svprqorqoog4\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'is_permanent = \'1\' \n        where id = 20\' at line 14\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskShareFileMapper.xml]\r\n### The error may involve com.ruoyi.disk.mapper.DiskShareFileMapper.updateDiskShareFile-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update disk_share_file          SET file_ids = ?,             uuid = ?,             secret_key = ?,                          create_id = ?,             create_time = ?,                          update_time = ?,             remark = ?,             del_flag = ?,             is_permanent = ?,             all_file_ids = ?             is_permanent = ?          where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'is_permanent = \'1\' \n        where id = 20\' at line 14\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'is_permanent = \'1\' \n        where id = 20\' at line 14', '2024-04-16 02:07:09', '357');
INSERT INTO `sys_oper_log` VALUES ('313', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,51,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:52:14\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-30\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29,51,53\",\"id\":20,\"isPermanent\":0,\"params\":{},\"remark\":\"城市撒旦\",\"secretKey\":\"57j8vj\",\"secretKeyRadio\":\"2\",\"type\":\"1\",\"updateTime\":\"2024-04-16 02:07:17\",\"uuid\":\"svprqorqoog4\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'is_permanent = \'1\' \n        where id = 20\' at line 14\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskShareFileMapper.xml]\r\n### The error may involve com.ruoyi.disk.mapper.DiskShareFileMapper.updateDiskShareFile-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update disk_share_file          SET file_ids = ?,             uuid = ?,             secret_key = ?,             expiration_time = ?,             create_id = ?,             create_time = ?,                          update_time = ?,             remark = ?,             del_flag = ?,             is_permanent = ?,             all_file_ids = ?             is_permanent = ?          where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'is_permanent = \'1\' \n        where id = 20\' at line 14\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'is_permanent = \'1\' \n        where id = 20\' at line 14', '2024-04-16 02:07:17', '21');
INSERT INTO `sys_oper_log` VALUES ('314', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,51,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:52:14\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-30\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29,51,53\",\"id\":20,\"isPermanent\":0,\"params\":{},\"remark\":\"城市撒旦\",\"secretKey\":\"57j8vj\",\"secretKeyRadio\":\"2\",\"type\":\"1\",\"updateTime\":\"2024-04-16 02:07:21\",\"uuid\":\"svprqorqoog4\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'is_permanent = \'1\' \n        where id = 20\' at line 14\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskShareFileMapper.xml]\r\n### The error may involve com.ruoyi.disk.mapper.DiskShareFileMapper.updateDiskShareFile-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update disk_share_file          SET file_ids = ?,             uuid = ?,             secret_key = ?,             expiration_time = ?,             create_id = ?,             create_time = ?,                          update_time = ?,             remark = ?,             del_flag = ?,             is_permanent = ?,             all_file_ids = ?             is_permanent = ?          where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'is_permanent = \'1\' \n        where id = 20\' at line 14\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'is_permanent = \'1\' \n        where id = 20\' at line 14', '2024-04-16 02:07:21', '14');
INSERT INTO `sys_oper_log` VALUES ('315', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,51,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:52:14\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-30\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29,51,53\",\"id\":20,\"isPermanent\":0,\"params\":{},\"remark\":\"城市撒旦\",\"secretKey\":\"57j8vj\",\"secretKeyRadio\":\"2\",\"type\":\"1\",\"updateTime\":\"2024-04-16 02:09:07\",\"uuid\":\"svprqorqoog4\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'type = \'1\' \n        where id = 20\' at line 14\r\n### The error may exist in file [D:\\shihuo\\javaProject\\网盘\\netdisk\\netdisk-api\\target\\classes\\mapper\\disk\\DiskShareFileMapper.xml]\r\n### The error may involve com.ruoyi.disk.mapper.DiskShareFileMapper.updateDiskShareFile-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update disk_share_file          SET file_ids = ?,             uuid = ?,             secret_key = ?,             expiration_time = ?,             create_id = ?,             create_time = ?,                          update_time = ?,             remark = ?,             del_flag = ?,             is_permanent = ?,             all_file_ids = ?             type = ?          where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'type = \'1\' \n        where id = 20\' at line 14\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'type = \'1\' \n        where id = 20\' at line 14', '2024-04-16 02:09:08', '243');
INSERT INTO `sys_oper_log` VALUES ('316', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,51,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:52:14\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-30\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29,51,53\",\"id\":20,\"isPermanent\":0,\"params\":{},\"remark\":\"城市撒旦\",\"secretKey\":\"57j8vj\",\"secretKeyRadio\":\"2\",\"type\":\"1\",\"updateTime\":\"2024-04-16 02:11:44\",\"uuid\":\"svprqorqoog4\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"29,51,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:52:14\",\"delFlag\":\"0\",\"expirationTime\":\"2024-04-30\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29,51,53\",\"id\":20,\"isPermanent\":0,\"params\":{},\"remark\":\"城市撒旦\",\"secretKey\":\"57j8vj\",\"secretKeyRadio\":\"2\",\"type\":\"1\",\"updateTime\":\"2024-04-16 02:11:44\",\"uuid\":\"svprqorqoog4\"}}', '0', null, '2024-04-16 02:11:44', '79');
INSERT INTO `sys_oper_log` VALUES ('317', '分享', '2', 'com.ruoyi.disk.controller.DiskShareFileController.edit()', 'PUT', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"29,51,52,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:56:06\",\"delFlag\":\"0\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29,51,53,52\",\"id\":21,\"isPermanent\":0,\"params\":{},\"secretKey\":\"zpq3i9\",\"secretKeyRadio\":\"2\",\"type\":\"0\",\"updateTime\":\"2024-04-16 02:11:57\",\"uuid\":\"3ybdwc6gn6ik\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"29,51,52,53,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 01:56:06\",\"delFlag\":\"0\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"29,51,53,52\",\"id\":21,\"isPermanent\":0,\"params\":{},\"secretKey\":\"zpq3i9\",\"secretKeyRadio\":\"2\",\"type\":\"0\",\"updateTime\":\"2024-04-16 02:11:57\",\"uuid\":\"3ybdwc6gn6ik\"}}', '0', null, '2024-04-16 02:11:57', '9');
INSERT INTO `sys_oper_log` VALUES ('318', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"52,53\",\"createId\":1,\"createTime\":\"2024-04-16 02:25:27\",\"expirationTime\":\"2024-04-19\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"52,53\",\"isPermanent\":0,\"params\":{},\"secretKeyRadio\":\"1\",\"type\":\"1\",\"uuid\":\"83p9jh1cl8r8\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"52,53\",\"createId\":1,\"createTime\":\"2024-04-16 02:25:27\",\"expirationTime\":\"2024-04-19\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"52,53\",\"isPermanent\":0,\"params\":{},\"secretKeyRadio\":\"1\",\"type\":\"1\",\"uuid\":\"83p9jh1cl8r8\"}}', '0', null, '2024-04-16 02:25:27', '72');
INSERT INTO `sys_oper_log` VALUES ('319', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/27', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-16 04:07:23', '53');
INSERT INTO `sys_oper_log` VALUES ('320', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/54', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-16 04:56:06', '32');
INSERT INTO `sys_oper_log` VALUES ('321', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/34', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-16 04:56:14', '23');
INSERT INTO `sys_oper_log` VALUES ('322', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/35', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-16 04:56:26', '28');
INSERT INTO `sys_oper_log` VALUES ('323', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/52', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-16 04:56:34', '39');
INSERT INTO `sys_oper_log` VALUES ('324', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/29', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-16 04:56:38', '41');
INSERT INTO `sys_oper_log` VALUES ('325', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'admin', null, '/disk/recovery/refresh/26,27,28,29,30,31', '127.0.0.1', '内网IP', '[26,27,28,29,30,31]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-16 05:06:36', '141');
INSERT INTO `sys_oper_log` VALUES ('326', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"27,29,51,52,53,54,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 05:07:05\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29,51,52,53,54\",\"isPermanent\":1,\"params\":{},\"secretKeyRadio\":\"1\",\"type\":\"1\",\"uuid\":\"ob39h3fkd4zk\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"27,29,51,52,53,54,34,35,36\",\"createId\":1,\"createTime\":\"2024-04-16 05:07:05\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"27,29,51,52,53,54\",\"isPermanent\":1,\"params\":{},\"secretKeyRadio\":\"1\",\"type\":\"1\",\"uuid\":\"ob39h3fkd4zk\"}}', '0', null, '2024-04-16 05:07:05', '29');
INSERT INTO `sys_oper_log` VALUES ('327', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-16 05:17:05\",\"id\":55,\"isDir\":1,\"name\":\"a\",\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/a\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-16 05:17:05', '642');
INSERT INTO `sys_oper_log` VALUES ('328', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-16 05:17:12\",\"id\":56,\"isDir\":1,\"name\":\"b\",\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/b\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-16 05:17:12', '25');
INSERT INTO `sys_oper_log` VALUES ('329', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-16 05:17:17\",\"id\":57,\"isDir\":1,\"name\":\"c\",\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/c\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-16 05:17:17', '53');
INSERT INTO `sys_oper_log` VALUES ('330', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"disk_sensitive_word\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 00:22:07', '269');
INSERT INTO `sys_oper_log` VALUES ('331', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"sensitiveWord\",\"className\":\"DiskSensitiveWord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"自增id\",\"columnId\":46,\"columnName\":\"id\",\"columnType\":\"int(11) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2024-04-17 00:22:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"添加人\",\"columnId\":47,\"columnName\":\"user_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-17 00:22:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SensitiveWord\",\"columnComment\":\"敏感词\",\"columnId\":48,\"columnName\":\"sensitive_word\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-17 00:22:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sensitiveWord\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":49,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-17 00:22:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTim', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 00:24:30', '131');
INSERT INTO `sys_oper_log` VALUES ('332', '参数管理', '1', 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"sensitiveWord.ifFilter\",\"configName\":\"是否开启敏感词检测\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"params\":{},\"remark\":\"true：开启 false：不开启\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 01:14:49', '76');
INSERT INTO `sys_oper_log` VALUES ('333', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"disk/sensitiveWord/index\",\"createTime\":\"2024-04-17 00:26:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"敏感词\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"sensitiveWord\",\"perms\":\"disk:sensitiveWord:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 01:31:05', '84');
INSERT INTO `sys_oper_log` VALUES ('334', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-17 00:26:10\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"敏感词查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2032,\"path\":\"#\",\"perms\":\"disk:sensitiveWord:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 01:31:16', '22');
INSERT INTO `sys_oper_log` VALUES ('335', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-17 00:26:10\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2034,\"menuName\":\"敏感词新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2032,\"path\":\"#\",\"perms\":\"disk:sensitiveWord:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 01:31:23', '27');
INSERT INTO `sys_oper_log` VALUES ('336', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-17 00:26:10\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2035,\"menuName\":\"敏感词修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2032,\"path\":\"#\",\"perms\":\"disk:sensitiveWord:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 01:31:36', '22');
INSERT INTO `sys_oper_log` VALUES ('337', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-17 00:26:10\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"敏感词删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2032,\"path\":\"#\",\"perms\":\"disk:sensitiveWord:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 01:31:42', '14');
INSERT INTO `sys_oper_log` VALUES ('338', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-17 00:26:10\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2037,\"menuName\":\"敏感词导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2032,\"path\":\"#\",\"perms\":\"disk:sensitiveWord:export\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 01:31:51', '20');
INSERT INTO `sys_oper_log` VALUES ('339', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:18\",\"id\":58,\"isDir\":1,\"name\":\"没有共产党就没有新中国\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 01:34:18', '368');
INSERT INTO `sys_oper_log` VALUES ('340', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"没有共产党就没有新中国\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 01:36:29\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 01:38:50', '140679');
INSERT INTO `sys_oper_log` VALUES ('341', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"没有共产党就没有新中国\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 01:39:10\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 01:41:35', '145360');
INSERT INTO `sys_oper_log` VALUES ('342', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"没有共产党就没有新中国\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 01:41:43\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 01:44:03', '139740');
INSERT INTO `sys_oper_log` VALUES ('343', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"没有共产党就没有新中国\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 01:43:33\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', null, '1', 'Redis command timed out; nested exception is io.lettuce.core.RedisCommandTimeoutException: Command timed out after 10 second(s)', '2024-04-17 02:14:17', '1862100');
INSERT INTO `sys_oper_log` VALUES ('344', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"共产党\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 02:14:32\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 02:14:39', '12862');
INSERT INTO `sys_oper_log` VALUES ('345', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"共产党\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 02:15:00\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 02:15:04', '8109');
INSERT INTO `sys_oper_log` VALUES ('346', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"共产党\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 02:24:21\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', null, '1', '检测到敏感词，请重试', '2024-04-17 02:24:21', '355');
INSERT INTO `sys_oper_log` VALUES ('347', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"没有共产党就没有新中国\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 02:24:38\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 02:24:39', '95');
INSERT INTO `sys_oper_log` VALUES ('348', '敏感词', '1', 'com.ruoyi.disk.controller.DiskSensitiveWordController.add()', 'POST', '1', 'admin', null, '/disk/sensitiveWord', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-17 02:30:51\",\"id\":330,\"params\":{},\"sensitiveWord\":\"做爱\",\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 02:30:51', '240');
INSERT INTO `sys_oper_log` VALUES ('349', '敏感词', '1', 'com.ruoyi.disk.controller.DiskSensitiveWordController.add()', 'POST', '1', 'admin', null, '/disk/sensitiveWord', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-17 02:30:51\",\"id\":329,\"params\":{},\"sensitiveWord\":\"做爱\",\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 02:30:51', '240');
INSERT INTO `sys_oper_log` VALUES ('350', '敏感词', '3', 'com.ruoyi.disk.controller.DiskSensitiveWordController.remove()', 'DELETE', '1', 'admin', null, '/disk/sensitiveWord/330', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 02:32:31', '30');
INSERT INTO `sys_oper_log` VALUES ('351', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-16 05:17:18\",\"delFlag\":\"0\",\"id\":57,\"isDir\":1,\"name\":\"做爱\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 02:33:59\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/c\"}', null, '1', '检测到敏感词，请重试', '2024-04-17 02:34:09', '20063');
INSERT INTO `sys_oper_log` VALUES ('352', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-16 05:17:18\",\"delFlag\":\"0\",\"id\":57,\"isDir\":1,\"name\":\"做爱\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 02:34:17\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/c\"}', null, '1', '检测到敏感词，请重试', '2024-04-17 02:34:18', '62');
INSERT INTO `sys_oper_log` VALUES ('353', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-16 05:17:18\",\"delFlag\":\"0\",\"id\":57,\"isDir\":1,\"name\":\"做爱把，哈哈哈，我要操美女\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 02:34:39\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/c\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 02:34:39', '571');
INSERT INTO `sys_oper_log` VALUES ('354', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-16 05:17:18\",\"delFlag\":\"0\",\"id\":57,\"isDir\":1,\"name\":\"做爱把\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 02:34:57\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/c\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 02:34:57', '55');
INSERT INTO `sys_oper_log` VALUES ('355', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-16 05:17:18\",\"delFlag\":\"0\",\"id\":57,\"isDir\":1,\"name\":\"做爱把\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 02:40:18\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/c\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 02:40:18', '150');
INSERT INTO `sys_oper_log` VALUES ('356', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-16 05:17:18\",\"delFlag\":\"0\",\"id\":57,\"isDir\":1,\"name\":\"做爱\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-17 02:40:27\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/c\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-17 02:40:27', '70');
INSERT INTO `sys_oper_log` VALUES ('357', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"没有共产党就没有新中国\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-18 00:00:24\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', null, '1', '有敏感词 [共产党]', '2024-04-18 00:00:24', '99');
INSERT INTO `sys_oper_log` VALUES ('358', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"没有共产党就没有新中国\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-18 00:00:29\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', null, '1', '有敏感词 [共产党]', '2024-04-18 00:00:29', '33');
INSERT INTO `sys_oper_log` VALUES ('359', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"我们一起取做爱吧\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-18 00:00:47\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', null, '1', '有敏感词 [做爱]', '2024-04-18 00:00:47', '45');
INSERT INTO `sys_oper_log` VALUES ('360', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"我想操你逼\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-18 00:01:02\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', null, '1', '有敏感词 [操你]', '2024-04-18 00:01:02', '25');
INSERT INTO `sys_oper_log` VALUES ('361', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"约炮吗，出来玩呗\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-18 00:01:30\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-18 00:01:30', '82');
INSERT INTO `sys_oper_log` VALUES ('362', '敏感词', '1', 'com.ruoyi.disk.controller.DiskSensitiveWordController.add()', 'POST', '1', 'admin', null, '/disk/sensitiveWord', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-18 00:01:49\",\"id\":331,\"params\":{},\"sensitiveWord\":\"约炮\",\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-18 00:01:49', '29');
INSERT INTO `sys_oper_log` VALUES ('363', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"约炮吗，出来玩呗\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-18 00:02:15\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', null, '1', '有敏感词 [约炮]', '2024-04-18 00:02:15', '21');
INSERT INTO `sys_oper_log` VALUES ('364', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"吗，出来约炮玩呗\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-18 00:02:22\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', null, '1', '有敏感词 [约炮]', '2024-04-18 00:02:22', '28');
INSERT INTO `sys_oper_log` VALUES ('365', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"好想澳门赌博\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-18 00:03:01\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', null, '1', '有敏感词 [赌博]', '2024-04-18 00:03:01', '27');
INSERT INTO `sys_oper_log` VALUES ('366', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"测试\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-18 00:03:18\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-18 00:03:18', '40');
INSERT INTO `sys_oper_log` VALUES ('367', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"好想澳门赌博\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-18 00:05:35\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', null, '1', '有敏感词 [赌博]', '2024-04-18 00:05:35', '68');
INSERT INTO `sys_oper_log` VALUES ('368', '文件', '2', 'com.ruoyi.disk.controller.DiskFileController.edit()', 'PUT', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-17 01:34:19\",\"delFlag\":\"0\",\"id\":58,\"isDir\":1,\"name\":\"好想去澳门赌博\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"size\":0,\"type\":5,\"updateTime\":\"2024-04-18 00:05:43\",\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/没有共产党就没有新中国\"}', null, '1', '有敏感词 [赌博]', '2024-04-18 00:05:43', '31');
INSERT INTO `sys_oper_log` VALUES ('369', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-18 00:05:54\",\"isDir\":1,\"name\":\"好想澳门赌博\",\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/好想澳门赌博\"}', null, '1', '有敏感词 [赌博]', '2024-04-18 00:05:54', '684');
INSERT INTO `sys_oper_log` VALUES ('370', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"51,54,58\",\"createId\":1,\"createTime\":\"2024-04-18 00:06:18\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"58,51,54\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"3wmj0t\",\"secretKeyRadio\":\"1\",\"type\":\"0\",\"uuid\":\"rulmr56bhwyd\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"51,54,58\",\"createId\":1,\"createTime\":\"2024-04-18 00:06:18\",\"expirationTimeRadio\":\"1\",\"fileIds\":\"58,51,54\",\"isPermanent\":1,\"params\":{},\"secretKey\":\"3wmj0t\",\"secretKeyRadio\":\"1\",\"type\":\"0\",\"uuid\":\"rulmr56bhwyd\"}}', '0', null, '2024-04-18 00:06:18', '106');
INSERT INTO `sys_oper_log` VALUES ('371', '分享', '1', 'com.ruoyi.disk.controller.DiskShareFileController.add()', 'POST', '1', 'admin', null, '/disk/share', '127.0.0.1', '内网IP', '{\"allFileIds\":\"51,54,58\",\"createId\":1,\"createTime\":\"2024-04-18 00:09:58\",\"expirationTime\":\"2024-04-21\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"58,51,54\",\"isPermanent\":0,\"params\":{},\"remark\":\"测试\",\"secretKeyRadio\":\"1\",\"type\":\"1\",\"uuid\":\"5w0nrmverqeu\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"allFileIds\":\"51,54,58\",\"createId\":1,\"createTime\":\"2024-04-18 00:09:58\",\"expirationTime\":\"2024-04-21\",\"expirationTimeRadio\":\"2\",\"fileIds\":\"58,51,54\",\"isPermanent\":0,\"params\":{},\"remark\":\"测试\",\"secretKeyRadio\":\"1\",\"type\":\"1\",\"uuid\":\"5w0nrmverqeu\"}}', '0', null, '2024-04-18 00:09:58', '142');
INSERT INTO `sys_oper_log` VALUES ('372', '敏感词', '1', 'com.ruoyi.disk.controller.DiskSensitiveWordController.add()', 'POST', '1', 'admin', null, '/disk/sensitiveWord', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-18 00:11:24\",\"id\":332,\"params\":{},\"sensitiveWord\":\"啪啪\",\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-18 00:11:24', '129');
INSERT INTO `sys_oper_log` VALUES ('373', '敏感词', '2', 'com.ruoyi.disk.controller.DiskSensitiveWordController.edit()', 'PUT', '1', 'admin', null, '/disk/sensitiveWord', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-18 00:11:24\",\"id\":332,\"params\":{},\"sensitiveWord\":\"啪啪3\",\"updateTime\":\"2024-04-18 00:11:36\",\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-18 00:11:36', '27');
INSERT INTO `sys_oper_log` VALUES ('374', '敏感词', '2', 'com.ruoyi.disk.controller.DiskSensitiveWordController.edit()', 'PUT', '1', 'admin', null, '/disk/sensitiveWord', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-18 00:11:24\",\"id\":332,\"params\":{},\"sensitiveWord\":\"啪啪\",\"updateTime\":\"2024-04-18 00:11:42\",\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-18 00:11:42', '8');
INSERT INTO `sys_oper_log` VALUES ('375', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-18 00:12:14\",\"isDir\":1,\"name\":\"好想啪啪\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/好想啪啪\"}', null, '1', '有敏感词 [啪啪]', '2024-04-18 00:12:14', '44');
INSERT INTO `sys_oper_log` VALUES ('376', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'admin', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":1,\"createTime\":\"2024-04-18 00:12:19\",\"id\":59,\"isDir\":1,\"name\":\"好想\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/b840c63567724e518174bec6abea8f65/好想\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-18 00:12:20', '58');
INSERT INTO `sys_oper_log` VALUES ('377', '敏感词', '1', 'com.ruoyi.disk.controller.DiskSensitiveWordController.add()', 'POST', '1', 'admin', null, '/disk/sensitiveWord', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-18 00:32:29\",\"id\":333,\"params\":{},\"sensitiveWord\":\"乱摸\",\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-18 00:32:29', '30');
INSERT INTO `sys_oper_log` VALUES ('378', '敏感词', '1', 'com.ruoyi.disk.controller.DiskSensitiveWordController.add()', 'POST', '1', 'admin', null, '/disk/sensitiveWord', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-18 00:32:40\",\"id\":334,\"params\":{},\"sensitiveWord\":\"肉体\",\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-18 00:32:40', '16');
INSERT INTO `sys_oper_log` VALUES ('379', '文件', '1', 'com.ruoyi.disk.controller.DiskFileController.add()', 'POST', '1', 'maple', null, '/disk/file', '127.0.0.1', '内网IP', '{\"createId\":3,\"createTime\":\"2024-04-18 00:46:15\",\"id\":60,\"isDir\":1,\"name\":\"四驱兄弟最新作品G杯豪臀绝色妖姬妲己呻吟刺激1080P高清完整原版\",\"params\":{},\"parentId\":0,\"type\":5,\"url\":\"/profile/upload/a90d31529f984501add2e4d2aa170d74/四驱兄弟最新作品G杯豪臀绝色妖姬妲己呻吟刺激1080P高清完整原版\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-18 00:46:15', '396');
INSERT INTO `sys_oper_log` VALUES ('380', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'maple', null, '/disk/file/60', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-18 00:46:21', '28');
INSERT INTO `sys_oper_log` VALUES ('381', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/57', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-24 12:48:47', '67');
INSERT INTO `sys_oper_log` VALUES ('382', '回收站', '3', 'com.ruoyi.disk.controller.DiskRecoveryFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/recovery/33', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-24 12:56:41', '483');
INSERT INTO `sys_oper_log` VALUES ('383', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/35', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-24 12:56:55', '30');
INSERT INTO `sys_oper_log` VALUES ('384', '文件', '3', 'com.ruoyi.disk.controller.DiskFileController.remove()', 'DELETE', '1', 'admin', null, '/disk/file/29,58', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-24 12:57:06', '34');
INSERT INTO `sys_oper_log` VALUES ('385', '恢复文件', '2', 'com.ruoyi.disk.controller.DiskRecoveryFileController.refresh()', 'PUT', '1', 'admin', null, '/disk/recovery/refresh/35', '127.0.0.1', '内网IP', '[35]', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2024-04-24 12:57:34', '34');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
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

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2024-01-05 23:55:11', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '用户角色', 'customer', '2', '2', '1', '1', '0', '0', 'admin', '2024-01-05 23:55:11', 'admin', '2024-04-14 11:31:12', '普通角色');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '2001');
INSERT INTO `sys_role_menu` VALUES ('2', '2002');
INSERT INTO `sys_role_menu` VALUES ('2', '2003');
INSERT INTO `sys_role_menu` VALUES ('2', '2004');
INSERT INTO `sys_role_menu` VALUES ('2', '2005');
INSERT INTO `sys_role_menu` VALUES ('2', '2006');
INSERT INTO `sys_role_menu` VALUES ('2', '2007');
INSERT INTO `sys_role_menu` VALUES ('2', '2008');
INSERT INTO `sys_role_menu` VALUES ('2', '2009');
INSERT INTO `sys_role_menu` VALUES ('2', '2010');
INSERT INTO `sys_role_menu` VALUES ('2', '2011');
INSERT INTO `sys_role_menu` VALUES ('2', '2012');
INSERT INTO `sys_role_menu` VALUES ('2', '2013');
INSERT INTO `sys_role_menu` VALUES ('2', '2014');
INSERT INTO `sys_role_menu` VALUES ('2', '2015');
INSERT INTO `sys_role_menu` VALUES ('2', '2016');
INSERT INTO `sys_role_menu` VALUES ('2', '2017');
INSERT INTO `sys_role_menu` VALUES ('2', '2018');
INSERT INTO `sys_role_menu` VALUES ('2', '2019');
INSERT INTO `sys_role_menu` VALUES ('2', '2020');
INSERT INTO `sys_role_menu` VALUES ('2', '2022');
INSERT INTO `sys_role_menu` VALUES ('2', '2026');
INSERT INTO `sys_role_menu` VALUES ('2', '2027');
INSERT INTO `sys_role_menu` VALUES ('2', '2028');
INSERT INTO `sys_role_menu` VALUES ('2', '2029');
INSERT INTO `sys_role_menu` VALUES ('2', '2030');
INSERT INTO `sys_role_menu` VALUES ('2', '2031');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
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

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2024/04/14/blob_20240414122012A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-04-24 13:01:30', 'admin', '2024-01-05 23:55:09', '', '2024-04-24 13:01:30', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-01-05 23:55:09', 'admin', '2024-01-05 23:55:09', '', null, '测试员');
INSERT INTO `sys_user` VALUES ('3', null, 'maple', 'maple', '01', '2132@qq.com', '17608690790', '0', '', '$2a$10$PVFkk4wP8qAXckkdRcOqx.TJz.VRzNGAS1sZ.ECCeGWczaVwGLdCq', '0', '0', '127.0.0.1', '2024-04-18 00:36:21', '', '2024-04-14 03:29:36', 'admin', '2024-04-18 00:36:21', null);
INSERT INTO `sys_user` VALUES ('4', null, 'maple168', 'maple168', '01', '', '', '0', '', '$2a$10$bmw05njVHQOL/fedHEbZEOPhd92DJqQcbJGXQIpI76XZJA1Zt59NC', '0', '0', '127.0.0.1', '2024-04-24 13:01:58', '', '2024-04-14 11:27:16', 'admin', '2024-04-24 13:01:57', null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '2');
