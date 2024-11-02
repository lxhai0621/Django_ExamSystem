/*
Navicat MySQL Data Transfer

Source Server         : li
Source Server Version : 80030
Source Host           : localhost:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 80030
File Encoding         : 65001

Date: 2022-11-02 09:13:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 选择题', '7', 'add_choice');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 选择题', '7', 'change_choice');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 选择题', '7', 'delete_choice');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 选择题', '7', 'view_choice');
INSERT INTO `auth_permission` VALUES ('29', 'Can add 班级', '8', 'add_class');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 班级', '8', 'change_class');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 班级', '8', 'delete_class');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 班级', '8', 'view_class');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 考试', '9', 'add_exam');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 考试', '9', 'change_exam');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 考试', '9', 'delete_exam');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 考试', '9', 'view_exam');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 填空题', '10', 'add_fill');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 填空题', '10', 'change_fill');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 填空题', '10', 'delete_fill');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 填空题', '10', 'view_fill');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 判断题', '11', 'add_judge');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 判断题', '11', 'change_judge');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 判断题', '11', 'delete_judge');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 判断题', '11', 'view_judge');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 试卷', '12', 'add_paper');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 试卷', '12', 'change_paper');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 试卷', '12', 'delete_paper');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 试卷', '12', 'view_paper');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 学生', '13', 'add_student');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 学生', '13', 'change_student');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 学生', '13', 'delete_student');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 学生', '13', 'view_student');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 学生成绩', '14', 'add_grade');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 学生成绩', '14', 'change_grade');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 学生成绩', '14', 'delete_grade');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 学生成绩', '14', 'view_grade');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 教师', '15', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 教师', '15', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 教师', '15', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 教师', '15', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('61', 'Can add captcha store', '16', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('62', 'Can change captcha store', '16', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete captcha store', '16', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('64', 'Can view captcha store', '16', 'view_captchastore');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$390000$yrff6djamGjloBEWCPXeWa$/4MjvYaMqzfvvZJROQbcSg35z8wNNnGTJhqDSUtb9+Y=', '2022-11-02 00:51:47.318108', '1', 'li', '', '', '1848229772@qq.com', '1', '1', '2022-09-26 08:43:21.760535');
INSERT INTO `auth_user` VALUES ('3', 'pbkdf2_sha256$390000$Raej8uooQevUl0Pk86LJq7$i/4U0VopSVK3p3DWiOdOEIzsdSqTP2b9WxKScRqoY4U=', '2022-11-02 01:11:58.433574', '0', '200214006', '', '', '', '1', '1', '2022-09-29 12:42:00.000000');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
INSERT INTO `auth_user_user_permissions` VALUES ('1', '3', '25');
INSERT INTO `auth_user_user_permissions` VALUES ('2', '3', '26');
INSERT INTO `auth_user_user_permissions` VALUES ('3', '3', '27');
INSERT INTO `auth_user_user_permissions` VALUES ('4', '3', '28');
INSERT INTO `auth_user_user_permissions` VALUES ('5', '3', '29');
INSERT INTO `auth_user_user_permissions` VALUES ('6', '3', '30');
INSERT INTO `auth_user_user_permissions` VALUES ('7', '3', '31');
INSERT INTO `auth_user_user_permissions` VALUES ('8', '3', '32');
INSERT INTO `auth_user_user_permissions` VALUES ('9', '3', '33');
INSERT INTO `auth_user_user_permissions` VALUES ('10', '3', '34');
INSERT INTO `auth_user_user_permissions` VALUES ('11', '3', '35');
INSERT INTO `auth_user_user_permissions` VALUES ('12', '3', '36');
INSERT INTO `auth_user_user_permissions` VALUES ('13', '3', '37');
INSERT INTO `auth_user_user_permissions` VALUES ('14', '3', '38');
INSERT INTO `auth_user_user_permissions` VALUES ('15', '3', '39');
INSERT INTO `auth_user_user_permissions` VALUES ('16', '3', '40');
INSERT INTO `auth_user_user_permissions` VALUES ('17', '3', '41');
INSERT INTO `auth_user_user_permissions` VALUES ('18', '3', '42');
INSERT INTO `auth_user_user_permissions` VALUES ('19', '3', '43');
INSERT INTO `auth_user_user_permissions` VALUES ('20', '3', '44');
INSERT INTO `auth_user_user_permissions` VALUES ('21', '3', '45');
INSERT INTO `auth_user_user_permissions` VALUES ('22', '3', '46');
INSERT INTO `auth_user_user_permissions` VALUES ('23', '3', '47');
INSERT INTO `auth_user_user_permissions` VALUES ('24', '3', '48');
INSERT INTO `auth_user_user_permissions` VALUES ('25', '3', '49');
INSERT INTO `auth_user_user_permissions` VALUES ('26', '3', '50');
INSERT INTO `auth_user_user_permissions` VALUES ('27', '3', '51');
INSERT INTO `auth_user_user_permissions` VALUES ('28', '3', '52');
INSERT INTO `auth_user_user_permissions` VALUES ('29', '3', '53');
INSERT INTO `auth_user_user_permissions` VALUES ('30', '3', '54');
INSERT INTO `auth_user_user_permissions` VALUES ('31', '3', '55');
INSERT INTO `auth_user_user_permissions` VALUES ('32', '3', '56');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2022-09-27 08:42:27.959899', '2', '20201102428', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2022-09-29 12:40:12.565469', '20201100003', '王五', '3', '', '13', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2022-09-29 12:42:25.325231', '3', '200214006', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2022-09-29 12:42:47.125183', '3', '200214006', '2', '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2022-09-29 12:43:00.827067', '2', '20201102428', '3', '', '4', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2022-09-29 12:46:05.743098', '3', '200214006', '2', '[{\"changed\": {\"fields\": [\"User permissions\", \"Last login\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2022-09-29 12:46:53.557002', '20201100001', '张三', '2', '[]', '13', '3');
INSERT INTO `django_admin_log` VALUES ('8', '2022-09-29 13:17:31.274795', '1', '1111', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('9', '2022-09-29 15:41:30.731672', '1', '龚俊豪帅不帅', '1', '[{\"added\": {}}]', '10', '3');
INSERT INTO `django_admin_log` VALUES ('10', '2022-09-29 15:41:55.672383', '1', '白勇全帅', '1', '[{\"added\": {}}]', '11', '3');
INSERT INTO `django_admin_log` VALUES ('11', '2022-09-29 15:42:04.353509', '2', '刘磊帅不帅', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('12', '2022-09-29 15:42:11.570889', '1', '1111', '3', '', '12', '3');
INSERT INTO `django_admin_log` VALUES ('13', '2022-09-29 15:42:43.264831', '1', '小测试', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('14', '2022-09-30 02:45:20.150338', '2', '1+1', '1', '[{\"added\": {}}]', '7', '3');
INSERT INTO `django_admin_log` VALUES ('15', '2022-09-30 02:45:40.895400', '3', '小测试2', '1', '[{\"added\": {}}]', '12', '3');
INSERT INTO `django_admin_log` VALUES ('16', '2022-09-30 02:45:47.407359', '2', '小测试2', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('17', '2022-09-30 02:48:09.682816', '2', '小测试2', '3', '', '9', '3');
INSERT INTO `django_admin_log` VALUES ('18', '2022-10-04 08:18:04.868175', '4', 'ceshi', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2022-10-04 08:18:30.371015', '3', 'ceshi', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2022-10-07 07:33:23.181094', '4', '小测试', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2022-10-07 07:33:44.194287', '5', '小测试2', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2022-10-07 09:01:33.417265', '6', '小测试', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('23', '2022-10-07 09:01:46.842739', '7', '小测试2', '1', '[{\"added\": {}}]', '9', '3');
INSERT INTO `django_admin_log` VALUES ('24', '2022-11-01 15:14:36.972614', '3', '信息的价值随时间的推移逐渐耗尽”这句话说明信息具有', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2022-11-01 15:15:28.372632', '4', '李斌发现按照车的的ＧＰＳ导航仪规划的路线驾驶经常出错，他更新了导航软件的地图文件后，出现错误的概率大大降低．该事例反映出息息具有', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2022-11-01 15:16:11.687643', '5', '“信息无时不在，无处不有”，这句话表明了信息具有（）的特点？', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2022-11-01 15:17:42.662599', '6', '下面对信息的特征的理解，错误的', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2022-11-01 15:18:38.428649', '7', '下面对数据库特点的不正确叙述是', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2022-11-01 15:19:42.562106', '8', '下面对数据模型的不正确叙述是', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2022-11-01 15:20:40.412059', '9', '下面对数据库管理系统（DBMS）的不正确叙述是', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2022-11-01 15:21:17.399961', '10', '下面不属于数据库管理系统（DBMS）功能的是', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2022-11-01 15:22:38.581160', '2', '计算机数据管理经历了三个阶段从过去到现在依次是：人工阶段、文件管理阶段、（  ）阶段。', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2022-11-01 15:23:12.293902', '3', '数据库系统的三级模式结构是：模式、内模式、（   ）。', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2022-11-01 15:23:51.599827', '4', '数据模型的三个要素是：（数据结构）、（数据操作）、（   ）。', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2022-11-01 15:24:13.215758', '5', 'DBMS 向用户提供的功能应该包括：数据库的（  ）功能、数据库的（操纵）功能、数据库的（保护）功能和数据库的维护功能。', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2022-11-01 15:25:08.514418', '2', '信息能够消除某种不确定性', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2022-11-01 15:25:22.181463', '3', '数据库中的数据冗余度高', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2022-11-01 15:25:33.620082', '4', '数据库的三级模式结构能够提高系统的安全性', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2022-11-01 15:25:52.142543', '5', '数据库中的数据采用统一的模型来表示', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2022-11-01 15:26:08.846468', '6', '物理独立性是指：修改内模式后，可以不修改模式', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2022-11-01 15:26:19.640078', '7', 'DBA 应该具有查看、修改数据库中数据的权限', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2022-11-01 15:26:29.395484', '8', '数据库三级模式中，体现全体数据逻辑结构的是内模式', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2022-11-01 15:27:03.879764', '9', '关系模型的数据结构就是关系，关系是规范化的二维表', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2022-11-01 15:27:16.275379', '10', '实体完整性要求：关系中任何一个元组在组成“主键”的属性上不能取“空值”。', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2022-11-01 15:27:55.468738', '6', '实体完整性是指：在一个关系中，元组在主键属性上不能取（  ）值，也不能取（重复）值。', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2022-11-01 15:28:13.642883', '7', '关系模型的三类完整性约束是（  ）、（参照约束）和（用户自定义约束）。', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2022-11-01 15:28:32.233259', '8', '在对两个关系做连接运算时，如果把悬浮元组也保存在结果关系中，而在其他属性上填空或者NULL 值，就叫做（   ）', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2022-11-01 15:30:27.234587', '9', '3+3=', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2022-11-01 15:30:36.330528', '10', '4*3=', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2022-11-02 00:47:32.372977', '5', '数据库原理', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2022-11-02 00:47:44.437025', '2', '刘磊帅不帅', '3', '', '12', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2022-11-02 00:48:21.499768', '8', '数据库原理', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2022-11-02 00:53:16.257394', '9', '小测试', '1', '[{\"added\": {}}]', '9', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('16', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'exam', 'choice');
INSERT INTO `django_content_type` VALUES ('8', 'exam', 'class');
INSERT INTO `django_content_type` VALUES ('9', 'exam', 'exam');
INSERT INTO `django_content_type` VALUES ('10', 'exam', 'fill');
INSERT INTO `django_content_type` VALUES ('14', 'exam', 'grade');
INSERT INTO `django_content_type` VALUES ('11', 'exam', 'judge');
INSERT INTO `django_content_type` VALUES ('12', 'exam', 'paper');
INSERT INTO `django_content_type` VALUES ('13', 'exam', 'student');
INSERT INTO `django_content_type` VALUES ('15', 'exam', 'teacher');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2022-09-26 08:41:13.264785');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2022-09-26 08:41:15.866454');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2022-09-26 08:41:16.564530');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2022-09-26 08:41:16.605350');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2022-09-26 08:41:16.645393');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2022-09-26 08:41:16.902116');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2022-09-26 08:41:17.122858');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2022-09-26 08:41:17.211916');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2022-09-26 08:41:17.242828');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2022-09-26 08:41:17.461823');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2022-09-26 08:41:17.499593');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2022-09-26 08:41:17.531311');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2022-09-26 08:41:17.740078');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2022-09-26 08:41:17.948165');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2022-09-26 08:41:18.024547');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2022-09-26 08:41:18.068222');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2022-09-26 08:41:18.311338');
INSERT INTO `django_migrations` VALUES ('18', 'exam', '0001_initial', '2022-09-26 08:41:21.250038');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2022-09-26 08:41:21.473244');
INSERT INTO `django_migrations` VALUES ('20', 'exam', '0002_teacher_alter_choice_id_alter_class_id_alter_exam_id_and_more', '2022-09-26 12:00:29.560079');
INSERT INTO `django_migrations` VALUES ('21', 'captcha', '0001_initial', '2022-09-27 10:36:38.667267');
INSERT INTO `django_migrations` VALUES ('22', 'captcha', '0002_alter_captchastore_id', '2022-09-27 10:36:38.709754');
INSERT INTO `django_migrations` VALUES ('23', 'exam', '0003_alter_student_age', '2022-09-28 02:17:32.003945');
INSERT INTO `django_migrations` VALUES ('24', 'exam', '0004_alter_student_age_alter_student_pwd', '2022-09-28 08:37:07.992050');
INSERT INTO `django_migrations` VALUES ('25', 'exam', '0005_student_email', '2022-09-28 09:31:15.013680');
INSERT INTO `django_migrations` VALUES ('26', 'exam', '0006_class_tno', '2022-09-28 10:08:56.523487');
INSERT INTO `django_migrations` VALUES ('27', 'exam', '0007_alter_class_tno', '2022-09-28 10:08:57.737357');
INSERT INTO `django_migrations` VALUES ('28', 'exam', '0008_alter_class_tno', '2022-09-28 10:08:58.407302');
INSERT INTO `django_migrations` VALUES ('29', 'exam', '0009_teacher_password', '2022-09-28 10:15:17.671144');
INSERT INTO `django_migrations` VALUES ('30', 'exam', '0010_alter_teacher_password', '2022-09-28 10:15:31.280269');
INSERT INTO `django_migrations` VALUES ('31', 'exam', '0011_paper_choice_question_paper_fill_question_and_more', '2022-09-29 13:21:50.935638');
INSERT INTO `django_migrations` VALUES ('32', 'exam', '0012_alter_choice_id_alter_fill_id_alter_judge_id', '2022-10-04 14:16:12.604488');
INSERT INTO `django_migrations` VALUES ('33', 'exam', '0013_alter_grade_score', '2022-10-06 11:56:00.074093');
INSERT INTO `django_migrations` VALUES ('34', 'exam', '0014_alter_grade_score', '2022-10-06 11:56:43.282305');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('41fl6vy5zfpunhi5p3lqqahb177v18x7', 'eyJ2ZXJpZnljb2RlIjoiWlREWCJ9:1ofD7T:AQHYxhWz1vrArDfTTq8h-IkUZAiouJGOabBTDY6uhyg', '2022-10-17 04:31:55.737000');
INSERT INTO `django_session` VALUES ('99m336rfog346ul4x00hno0eylql7lg4', 'eyJ2ZXJpZnljb2RlIjoiWjNKNyIsInNubyI6IjIwMjAxMTAyNDI4IiwiaXNfbG9naW4iOnRydWV9:1oibAz:HFbMp2G6Q1xt-cFTGzaePMMW3R-3EiPL59kHu2S3Owc', '2022-10-26 12:49:33.508823');
INSERT INTO `django_session` VALUES ('9ge6h2re9cjn1lx6w2ur910vbx64doia', 'eyJ2ZXJpZnljb2RlIjoiN1laQSIsInNubyI6IjIwMjAxMTAyNDI4IiwiaXNfbG9naW4iOnRydWV9:1ofbo2:G0Tp1Jajk5PTacNXnFAyqZn_SXmHDWTm4NzX7g__QD8', '2022-10-18 06:53:30.122889');
INSERT INTO `django_session` VALUES ('d3f4edwdhy3ugzezwpqqzlp1fjh2kh1t', '.eJxVjcsKwjAQRf8laymT5lVduhN0Z9dh8mqjkkDaCiL-uyl0ocs5994zb6JxmUe9TL7o6MiBMLL7ZQbt3ac1cDdMQ25sTnOJplkrzZZOzSU7_zhu3T_BiNNY1zIw13WKdhgA90owSbmxDKkSgNRaGpgIlqMRsrUeVMsEl7QTwAGFM75Kn77E8LL1U_X1_ela2ZxyPVqAlnIAWUmc9DkPMZHDXBb_-QIsiUde:1oduYU:0XzK3z7M94VSGREPBZv44brNKIWnjr5iUI6yzZsAuqI', '2022-10-13 14:30:26.279887');
INSERT INTO `django_session` VALUES ('eirdx7886dwm21npqgfmjn12kep7onn3', '.eJxVjcsKgzAURP_lrkVuzMu6lC7bb5Cbl6YtCfgolNJ_bwQ3LmfmzMwX3n6O4WOz89CBxv4KFawpF9EgNkwgquLEZbjlMSbo1nnzFQy0rdOwLX4eoissh5NnyD592gP3oDTm2ua0ztHUO1If6VLfy-urP9jTwETLVNoqcNe2mrUUkC5acsWEsZyYlkjMWha4DFaQkaqxHnXDpVCslSiQpDMefn8BU0cE:1oq2IQ:sJg3lhioN6_kW3b_ONeUyfJgMBge9tlfUwP7FAJjM2A', '2022-11-16 01:11:58.454940');
INSERT INTO `django_session` VALUES ('qlve0nwd0mts9lxlkfka4dt7hum1qvh2', 'eyJ2ZXJpZnljb2RlIjoiSUhPNCJ9:1ofbCk:0bxYaSWD1gtwVOxeUJgyib0cRIUvzoHSv4W5Ll8EnQQ', '2022-10-18 06:14:58.553524');

-- ----------------------------
-- Table structure for exam_choice
-- ----------------------------
DROP TABLE IF EXISTS `exam_choice`;
CREATE TABLE `exam_choice` (
  `id` varchar(20) NOT NULL,
  `question` longtext NOT NULL,
  `answer_A` varchar(200) NOT NULL,
  `answer_B` varchar(200) NOT NULL,
  `answer_C` varchar(200) NOT NULL,
  `answer_D` varchar(200) NOT NULL,
  `right_answer` varchar(1) NOT NULL,
  `analysis` longtext NOT NULL,
  `score` smallint unsigned NOT NULL,
  `level` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `exam_choice_chk_1` CHECK ((`score` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of exam_choice
-- ----------------------------
INSERT INTO `exam_choice` VALUES ('1', '刘磊帅吗', '帅', '不帅', '不知道', '很模糊', 'D', '五', '1', '1');
INSERT INTO `exam_choice` VALUES ('10', '下面不属于数据库管理系统（DBMS）功能的是', '数据库定义功能', '数据库中数据的导出功能。', '数据库操作功能', '数据库保护功能', 'B', '暂无', '5', '1');
INSERT INTO `exam_choice` VALUES ('2', '1+1', '1', '2', '3', '4', 'B', '暂无', '1', '1');
INSERT INTO `exam_choice` VALUES ('3', '信息的价值随时间的推移逐渐耗尽”这句话说明信息具有', '价值性', '客观性', '依存性', '时效性', 'D', '暂无', '5', '1');
INSERT INTO `exam_choice` VALUES ('4', '李斌发现按照车的的ＧＰＳ导航仪规划的路线驾驶经常出错，他更新了导航软件的地图文件后，出现错误的概率大大降低．该事例反映出息息具有', '载体依附性', '共享性', '传递性', '时效性', 'D', '暂无', '5', '1');
INSERT INTO `exam_choice` VALUES ('5', '“信息无时不在，无处不有”，这句话表明了信息具有（）的特点？', '多样性', '普遍性', '变化性', '储存性', 'B', '暂无', '5', '1');
INSERT INTO `exam_choice` VALUES ('6', '下面对信息的特征的理解，错误的', '“孙膑减灶”引出信息有传递性和可伪性特征', '天气预报、情报等引出信息有时效性', '信息不会随着时间的推移而变化', '盲人摸象引出信息具有不完全性，人们难以一次就获得客观事物的全部信息。', 'C', '暂无', '5', '1');
INSERT INTO `exam_choice` VALUES ('7', '下面对数据库特点的不正确叙述是', '数据库中的数据采用统一的模型来表示。', '数据之间的联系强', '数据冗余度高', '数据由一个软件统一管理。', 'C', '暂无', '5', '1');
INSERT INTO `exam_choice` VALUES ('8', '下面对数据模型的不正确叙述是', '数据模型是用来表示数据及数据之间联系的。', '数据模型可分为三个层次：概念模型、逻辑模型、物理模型。', '逻辑层次上的数据模型有三个要素：数据结构、数据操作、数据完整性约束', '到目前为止，逻辑数据模型只有三种：层次模型、网状模型、关系模型。', 'D', '暂无', '5', '1');
INSERT INTO `exam_choice` VALUES ('9', '下面对数据库管理系统（DBMS）的不正确叙述是', 'DBMS 是一个对数据库进行统一管理、控制的软件', '用户必须通过DBMS 来使用数据库中的数据', 'SQL Server2012 是一个基于关系模型的 DBMS', '一个DBMS 可以用多个逻辑模型来管理数据', 'D', '暂无', '5', '1');

-- ----------------------------
-- Table structure for exam_class
-- ----------------------------
DROP TABLE IF EXISTS `exam_class`;
CREATE TABLE `exam_class` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `year` varchar(20) NOT NULL,
  `major` varchar(20) NOT NULL,
  `clazz` varchar(20) NOT NULL,
  `tno_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_class_tno_id_4622cf03_fk_teacher_tno` (`tno_id`),
  CONSTRAINT `exam_class_tno_id_4622cf03_fk_teacher_tno` FOREIGN KEY (`tno_id`) REFERENCES `teacher` (`tno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of exam_class
-- ----------------------------
INSERT INTO `exam_class` VALUES ('1', '2020', 'computer', '汉一班', '200214006');
INSERT INTO `exam_class` VALUES ('2', '2020', 'computer', '汉二班', '200214006');

-- ----------------------------
-- Table structure for exam_fill
-- ----------------------------
DROP TABLE IF EXISTS `exam_fill`;
CREATE TABLE `exam_fill` (
  `id` varchar(20) NOT NULL,
  `question` longtext NOT NULL,
  `right_answer` varchar(200) NOT NULL,
  `analysis` longtext NOT NULL,
  `score` smallint unsigned NOT NULL,
  `level` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `exam_fill_chk_1` CHECK ((`score` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of exam_fill
-- ----------------------------
INSERT INTO `exam_fill` VALUES ('1', '龚俊豪帅不帅', '帅', '暂无', '1', '1');
INSERT INTO `exam_fill` VALUES ('10', '4*3=', '12', '暂无', '5', '1');
INSERT INTO `exam_fill` VALUES ('2', '计算机数据管理经历了三个阶段从过去到现在依次是：人工阶段、文件管理阶段、（  ）阶段。', '数据库管理', '暂无', '5', '1');
INSERT INTO `exam_fill` VALUES ('3', '数据库系统的三级模式结构是：模式、内模式、（   ）。', '外模式', '暂无', '5', '1');
INSERT INTO `exam_fill` VALUES ('4', '数据模型的三个要素是：（数据结构）、（数据操作）、（   ）。', '完整性约束', '暂无', '5', '1');
INSERT INTO `exam_fill` VALUES ('5', 'DBMS 向用户提供的功能应该包括：数据库的（  ）功能、数据库的（操纵）功能、数据库的（保护）功能和数据库的维护功能。', '定义', '暂无', '5', '1');
INSERT INTO `exam_fill` VALUES ('6', '实体完整性是指：在一个关系中，元组在主键属性上不能取（  ）值，也不能取（重复）值。', '空', '暂无', '5', '1');
INSERT INTO `exam_fill` VALUES ('7', '关系模型的三类完整性约束是（  ）、（参照约束）和（用户自定义约束）。', '实体约束', '暂无', '5', '1');
INSERT INTO `exam_fill` VALUES ('8', '在对两个关系做连接运算时，如果把悬浮元组也保存在结果关系中，而在其他属性上填空或者NULL 值，就叫做（   ）', '外连接', '暂无', '5', '1');
INSERT INTO `exam_fill` VALUES ('9', '3+3=', '6', '暂无', '5', '1');

-- ----------------------------
-- Table structure for exam_grade
-- ----------------------------
DROP TABLE IF EXISTS `exam_grade`;
CREATE TABLE `exam_grade` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `score` smallint unsigned NOT NULL,
  `exam_id` bigint NOT NULL,
  `student_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_grade_student_id_11f03731_fk_student_sno` (`student_id`),
  KEY `exam_grade_exam_id_11d71dd5_fk` (`exam_id`),
  CONSTRAINT `exam_grade_exam_id_11d71dd5_fk` FOREIGN KEY (`exam_id`) REFERENCES `exam_info` (`id`),
  CONSTRAINT `exam_grade_student_id_11f03731_fk_student_sno` FOREIGN KEY (`student_id`) REFERENCES `student` (`sno`),
  CONSTRAINT `exam_grade_chk_1` CHECK ((`score` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of exam_grade
-- ----------------------------
INSERT INTO `exam_grade` VALUES ('90', '79', '7', '20201100003');
INSERT INTO `exam_grade` VALUES ('94', '95', '9', '20201102428');
INSERT INTO `exam_grade` VALUES ('95', '80', '9', '20201100001');
INSERT INTO `exam_grade` VALUES ('96', '91', '9', '20201100002');
INSERT INTO `exam_grade` VALUES ('97', '74', '9', '20201100004');
INSERT INTO `exam_grade` VALUES ('98', '66', '9', '20201100005');
INSERT INTO `exam_grade` VALUES ('99', '57', '9', '20201100006');

-- ----------------------------
-- Table structure for exam_info
-- ----------------------------
DROP TABLE IF EXISTS `exam_info`;
CREATE TABLE `exam_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `exam_date` date NOT NULL,
  `total_time` smallint unsigned NOT NULL,
  `major` varchar(20) NOT NULL,
  `paper_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paper_id` (`paper_id`),
  CONSTRAINT `exam_info_paper_id_dbb2621f_fk` FOREIGN KEY (`paper_id`) REFERENCES `exam_paper` (`id`),
  CONSTRAINT `exam_info_chk_1` CHECK ((`total_time` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of exam_info
-- ----------------------------
INSERT INTO `exam_info` VALUES ('7', '小测试2', '2022-10-07', '120', 'computer', '3');
INSERT INTO `exam_info` VALUES ('8', '数据库原理', '2022-11-02', '60', 'computer', '5');
INSERT INTO `exam_info` VALUES ('9', '小测试', '2022-11-02', '60', 'computer', '4');

-- ----------------------------
-- Table structure for exam_info_clazzs
-- ----------------------------
DROP TABLE IF EXISTS `exam_info_clazzs`;
CREATE TABLE `exam_info_clazzs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_id` bigint NOT NULL,
  `class_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_info_clazzs_exam_id_class_id_44ee5081_uniq` (`exam_id`,`class_id`),
  KEY `exam_info_clazzs_class_id_8b4cc076_fk` (`class_id`),
  CONSTRAINT `exam_info_clazzs_class_id_8b4cc076_fk` FOREIGN KEY (`class_id`) REFERENCES `exam_class` (`id`),
  CONSTRAINT `exam_info_clazzs_exam_id_64575d1e_fk` FOREIGN KEY (`exam_id`) REFERENCES `exam_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of exam_info_clazzs
-- ----------------------------
INSERT INTO `exam_info_clazzs` VALUES ('7', '7', '2');
INSERT INTO `exam_info_clazzs` VALUES ('8', '8', '1');
INSERT INTO `exam_info_clazzs` VALUES ('9', '8', '2');
INSERT INTO `exam_info_clazzs` VALUES ('10', '9', '1');

-- ----------------------------
-- Table structure for exam_judge
-- ----------------------------
DROP TABLE IF EXISTS `exam_judge`;
CREATE TABLE `exam_judge` (
  `id` varchar(20) NOT NULL,
  `question` longtext NOT NULL,
  `right_answer` varchar(1) NOT NULL,
  `analysis` longtext NOT NULL,
  `score` smallint unsigned NOT NULL,
  `level` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `exam_judge_chk_1` CHECK ((`score` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of exam_judge
-- ----------------------------
INSERT INTO `exam_judge` VALUES ('1', '白勇全帅', 'T', '暂无', '1', '1');
INSERT INTO `exam_judge` VALUES ('10', '实体完整性要求：关系中任何一个元组在组成“主键”的属性上不能取“空值”。', 'T', '暂无', '5', '1');
INSERT INTO `exam_judge` VALUES ('2', '信息能够消除某种不确定性', 'T', '暂无', '5', '1');
INSERT INTO `exam_judge` VALUES ('3', '数据库中的数据冗余度高', 'F', '暂无', '5', '1');
INSERT INTO `exam_judge` VALUES ('4', '数据库的三级模式结构能够提高系统的安全性', 'T', '暂无', '5', '1');
INSERT INTO `exam_judge` VALUES ('5', '数据库中的数据采用统一的模型来表示', 'T', '暂无', '5', '1');
INSERT INTO `exam_judge` VALUES ('6', '物理独立性是指：修改内模式后，可以不修改模式', 'T', '暂无', '5', '1');
INSERT INTO `exam_judge` VALUES ('7', 'DBA 应该具有查看、修改数据库中数据的权限', 'F', '暂无', '5', '1');
INSERT INTO `exam_judge` VALUES ('8', '数据库三级模式中，体现全体数据逻辑结构的是内模式', 'F', '暂无', '5', '1');
INSERT INTO `exam_judge` VALUES ('9', '关系模型的数据结构就是关系，关系是规范化的二维表', 'T', '暂无', '5', '1');

-- ----------------------------
-- Table structure for exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper`;
CREATE TABLE `exam_paper` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `score` smallint unsigned NOT NULL,
  `choice_number` smallint unsigned NOT NULL,
  `fill_number` smallint unsigned NOT NULL,
  `judge_number` smallint unsigned NOT NULL,
  `level` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `exam_paper_chk_1` CHECK ((`score` >= 0)),
  CONSTRAINT `exam_paper_chk_2` CHECK ((`choice_number` >= 0)),
  CONSTRAINT `exam_paper_chk_3` CHECK ((`fill_number` >= 0)),
  CONSTRAINT `exam_paper_chk_4` CHECK ((`judge_number` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of exam_paper
-- ----------------------------
INSERT INTO `exam_paper` VALUES ('3', '小测试2', '100', '5', '5', '10', '1');
INSERT INTO `exam_paper` VALUES ('4', 'ceshi', '20', '2', '1', '1', '1');
INSERT INTO `exam_paper` VALUES ('5', '数据库原理', '100', '8', '5', '7', '1');

-- ----------------------------
-- Table structure for exam_paper_choice_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_choice_question`;
CREATE TABLE `exam_paper_choice_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paper_id` bigint NOT NULL,
  `choice_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_paper_choice_question_paper_id_choice_id_6a342740_uniq` (`paper_id`,`choice_id`),
  KEY `exam_paper_choice_question_choice_id_bca0549f_fk` (`choice_id`),
  CONSTRAINT `exam_paper_choice_question_choice_id_bca0549f_fk` FOREIGN KEY (`choice_id`) REFERENCES `exam_choice` (`id`),
  CONSTRAINT `exam_paper_choice_question_paper_id_b5a13b64_fk_exam_paper_id` FOREIGN KEY (`paper_id`) REFERENCES `exam_paper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of exam_paper_choice_question
-- ----------------------------
INSERT INTO `exam_paper_choice_question` VALUES ('2', '3', '2');
INSERT INTO `exam_paper_choice_question` VALUES ('3', '4', '1');
INSERT INTO `exam_paper_choice_question` VALUES ('4', '4', '2');
INSERT INTO `exam_paper_choice_question` VALUES ('8', '5', '10');
INSERT INTO `exam_paper_choice_question` VALUES ('5', '5', '3');
INSERT INTO `exam_paper_choice_question` VALUES ('12', '5', '4');
INSERT INTO `exam_paper_choice_question` VALUES ('10', '5', '5');
INSERT INTO `exam_paper_choice_question` VALUES ('7', '5', '6');
INSERT INTO `exam_paper_choice_question` VALUES ('9', '5', '7');
INSERT INTO `exam_paper_choice_question` VALUES ('11', '5', '8');
INSERT INTO `exam_paper_choice_question` VALUES ('6', '5', '9');

-- ----------------------------
-- Table structure for exam_paper_fill_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_fill_question`;
CREATE TABLE `exam_paper_fill_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paper_id` bigint NOT NULL,
  `fill_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_paper_fill_question_paper_id_fill_id_26618e7b_uniq` (`paper_id`,`fill_id`),
  KEY `exam_paper_fill_question_fill_id_ff6a0523_fk` (`fill_id`),
  CONSTRAINT `exam_paper_fill_question_fill_id_ff6a0523_fk` FOREIGN KEY (`fill_id`) REFERENCES `exam_fill` (`id`),
  CONSTRAINT `exam_paper_fill_question_paper_id_03cade56_fk_exam_paper_id` FOREIGN KEY (`paper_id`) REFERENCES `exam_paper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of exam_paper_fill_question
-- ----------------------------
INSERT INTO `exam_paper_fill_question` VALUES ('2', '3', '1');
INSERT INTO `exam_paper_fill_question` VALUES ('3', '4', '1');
INSERT INTO `exam_paper_fill_question` VALUES ('5', '5', '2');
INSERT INTO `exam_paper_fill_question` VALUES ('4', '5', '3');
INSERT INTO `exam_paper_fill_question` VALUES ('8', '5', '4');
INSERT INTO `exam_paper_fill_question` VALUES ('7', '5', '5');
INSERT INTO `exam_paper_fill_question` VALUES ('6', '5', '6');

-- ----------------------------
-- Table structure for exam_paper_judge_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_judge_question`;
CREATE TABLE `exam_paper_judge_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paper_id` bigint NOT NULL,
  `judge_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_paper_judge_question_paper_id_judge_id_2823aa35_uniq` (`paper_id`,`judge_id`),
  KEY `exam_paper_judge_question_judge_id_981ddfdb_fk` (`judge_id`),
  CONSTRAINT `exam_paper_judge_question_judge_id_981ddfdb_fk` FOREIGN KEY (`judge_id`) REFERENCES `exam_judge` (`id`),
  CONSTRAINT `exam_paper_judge_question_paper_id_094b1213_fk_exam_paper_id` FOREIGN KEY (`paper_id`) REFERENCES `exam_paper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of exam_paper_judge_question
-- ----------------------------
INSERT INTO `exam_paper_judge_question` VALUES ('2', '3', '1');
INSERT INTO `exam_paper_judge_question` VALUES ('3', '4', '1');
INSERT INTO `exam_paper_judge_question` VALUES ('7', '5', '10');
INSERT INTO `exam_paper_judge_question` VALUES ('5', '5', '2');
INSERT INTO `exam_paper_judge_question` VALUES ('4', '5', '3');
INSERT INTO `exam_paper_judge_question` VALUES ('10', '5', '4');
INSERT INTO `exam_paper_judge_question` VALUES ('9', '5', '5');
INSERT INTO `exam_paper_judge_question` VALUES ('6', '5', '6');
INSERT INTO `exam_paper_judge_question` VALUES ('8', '5', '7');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `age` int NOT NULL,
  `pwd` varchar(256) NOT NULL,
  `clazz_id` bigint NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `student_clazz_id_d3ce3f5b_fk` (`clazz_id`),
  CONSTRAINT `student_clazz_id_d3ce3f5b_fk` FOREIGN KEY (`clazz_id`) REFERENCES `exam_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('20201100001', '张三', 'm', '18', 'e0cf678eee29810b837cbb60d041912c87b0e5f0fa5aaa2c3d1b3c009cd031fa', '1', '1848229772@qq.com');
INSERT INTO `student` VALUES ('20201100002', '刘磊', 'm', '18', 'e0cf678eee29810b837cbb60d041912c87b0e5f0fa5aaa2c3d1b3c009cd031fa', '1', '1848229772@qq.com');
INSERT INTO `student` VALUES ('20201100003', '李四', 'm', '18', 'e0cf678eee29810b837cbb60d041912c87b0e5f0fa5aaa2c3d1b3c009cd031fa', '2', '1848229772@qq.com');
INSERT INTO `student` VALUES ('20201100004', 'aa', 'm', '18', 'e0cf678eee29810b837cbb60d041912c87b0e5f0fa5aaa2c3d1b3c009cd031fa', '1', '1848229772@qq.com');
INSERT INTO `student` VALUES ('20201100005', '刘六', 'm', '18', 'e0cf678eee29810b837cbb60d041912c87b0e5f0fa5aaa2c3d1b3c009cd031fa', '1', '1848229772@qq.com');
INSERT INTO `student` VALUES ('20201100006', '张三丰', 'm', '18', 'e0cf678eee29810b837cbb60d041912c87b0e5f0fa5aaa2c3d1b3c009cd031fa', '1', '1848229772@qq.com');
INSERT INTO `student` VALUES ('20201102428', 'li xiaohai', 'm', '20', 'e0cf678eee29810b837cbb60d041912c87b0e5f0fa5aaa2c3d1b3c009cd031fa', '1', '1848229772@qq.com');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tno` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `password` varchar(256) NOT NULL,
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('200214006', 'yu', 'm', '123456');
