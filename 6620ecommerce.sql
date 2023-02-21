/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50737
Source Host           : localhost:13306
Source Database       : 6620ecommerce

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2023-02-19 22:23:56
*/

-- SET FOREIGN_KEY_CHECKS=0;  mysql 5.7

-- for mysql 8.0, use this
SET GLOBAL FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

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
INSERT INTO `auth_permission` VALUES ('25', 'Can add product', '7', 'add_product');
INSERT INTO `auth_permission` VALUES ('26', 'Can change product', '7', 'change_product');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete product', '7', 'delete_product');
INSERT INTO `auth_permission` VALUES ('28', 'Can view product', '7', 'view_product');
INSERT INTO `auth_permission` VALUES ('29', 'Can add order', '8', 'add_order');
INSERT INTO `auth_permission` VALUES ('30', 'Can change order', '8', 'change_order');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete order', '8', 'delete_order');
INSERT INTO `auth_permission` VALUES ('32', 'Can view order', '8', 'view_order');
INSERT INTO `auth_permission` VALUES ('33', 'Can add user profile', '9', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('34', 'Can change user profile', '9', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete user profile', '9', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('36', 'Can view user profile', '9', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('37', 'Can add cart', '10', 'add_cart');
INSERT INTO `auth_permission` VALUES ('38', 'Can change cart', '10', 'change_cart');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete cart', '10', 'delete_cart');
INSERT INTO `auth_permission` VALUES ('40', 'Can view cart', '10', 'view_cart');
INSERT INTO `auth_permission` VALUES ('41', 'Can add comment', '11', 'add_comment');
INSERT INTO `auth_permission` VALUES ('42', 'Can change comment', '11', 'change_comment');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete comment', '11', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('44', 'Can view comment', '11', 'view_comment');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$390000$ehszp19uwF5GtsbEjMTgw1$TepBegYl3hWs+WYI73OtBadIojB7TAB/AKcdIf2+hNo=', '2023-02-15 10:10:48.346945', '1', 'zhuwang96', '', '', 'wang.zhu1@northeastern.edu', '1', '1', '2023-02-15 10:10:22.729568');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for cartapp_cart
-- ----------------------------
DROP TABLE IF EXISTS `cartapp_cart`;
CREATE TABLE `cartapp_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cartApp_cart_user_id_product_id_2cdb26bb_uniq` (`user_id`,`product_id`),
  KEY `cartApp_cart_product_id_8be73930_fk_productApp_product_id` (`product_id`),
  CONSTRAINT `cartApp_cart_product_id_8be73930_fk_productApp_product_id` FOREIGN KEY (`product_id`) REFERENCES `productapp_product` (`id`),
  CONSTRAINT `cartApp_cart_user_id_e6f02a45_fk_userApp_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartapp_cart
-- ----------------------------

-- ----------------------------
-- Table structure for commentapp_comment
-- ----------------------------
DROP TABLE IF EXISTS `commentapp_comment`;
CREATE TABLE `commentapp_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_time` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commentApp_comment_product_id_a25c3aa6_fk_productApp_product_id` (`product_id`),
  KEY `commentApp_comment_user_id_f510549b_fk_userApp_userprofile_id` (`user_id`),
  CONSTRAINT `commentApp_comment_product_id_a25c3aa6_fk_productApp_product_id` FOREIGN KEY (`product_id`) REFERENCES `productapp_product` (`id`),
  CONSTRAINT `commentApp_comment_user_id_f510549b_fk_userApp_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commentapp_comment
-- ----------------------------
INSERT INTO `commentapp_comment` VALUES ('1', '2023-02-20 05:00:26.629655', 'sss', '1', '1');
INSERT INTO `commentapp_comment` VALUES ('4', '2023-02-20 05:07:04.216542', 'test', '1', '1');
INSERT INTO `commentapp_comment` VALUES ('5', '2023-02-20 05:07:22.827201', 'Hello， world\r\n', '1', '1');
INSERT INTO `commentapp_comment` VALUES ('6', '2023-02-20 05:11:55.752433', 'good tasty', '2', '1');
INSERT INTO `commentapp_comment` VALUES ('7', '2023-02-20 05:17:32.994469', 'jj', '2', '1');
INSERT INTO `commentapp_comment` VALUES ('8', '2023-02-20 06:19:28.325842', 'Delicious Coke, very satisfied!', '1', '2');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('10', 'cartApp', 'cart');
INSERT INTO `django_content_type` VALUES ('11', 'commentApp', 'comment');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('8', 'orderApp', 'order');
INSERT INTO `django_content_type` VALUES ('7', 'productApp', 'product');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('9', 'userApp', 'userprofile');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2023-02-15 10:08:43.504696');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2023-02-15 10:08:43.824947');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2023-02-15 10:08:43.888483');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2023-02-15 10:08:43.903484');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2023-02-15 10:08:43.908483');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2023-02-15 10:08:43.954321');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2023-02-15 10:08:43.982015');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2023-02-15 10:08:44.008698');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2023-02-15 10:08:44.014697');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2023-02-15 10:08:44.041697');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2023-02-15 10:08:44.044696');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2023-02-15 10:08:44.054699');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2023-02-15 10:08:44.083706');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2023-02-15 10:08:44.116700');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2023-02-15 10:08:44.144697');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2023-02-15 10:08:44.149699');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2023-02-15 10:08:44.178476');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2023-02-15 10:08:44.200479');
INSERT INTO `django_migrations` VALUES ('19', 'userApp', '0001_initial', '2023-02-15 22:44:20.164312');
INSERT INTO `django_migrations` VALUES ('20', 'productApp', '0001_initial', '2023-02-15 22:44:20.180312');
INSERT INTO `django_migrations` VALUES ('21', 'cartApp', '0001_initial', '2023-02-15 22:44:20.256312');
INSERT INTO `django_migrations` VALUES ('22', 'orderApp', '0001_initial', '2023-02-15 22:44:20.297312');
INSERT INTO `django_migrations` VALUES ('23', 'productApp', '0002_product_description', '2023-02-15 23:20:44.948458');
INSERT INTO `django_migrations` VALUES ('24', 'cartApp', '0002_alter_cart_unique_together', '2023-02-16 03:58:03.969617');
INSERT INTO `django_migrations` VALUES ('25', 'cartApp', '0003_alter_cart_quantity', '2023-02-16 04:09:02.411588');
INSERT INTO `django_migrations` VALUES ('26', 'commentApp', '0001_initial', '2023-02-20 04:07:31.557771');
INSERT INTO `django_migrations` VALUES ('27', 'userApp', '0002_remove_userprofile_address_and_more', '2023-02-20 06:15:23.636375');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('3o0vin6wg39wyk39312iwtt1bo2my7ea', 'e30:1pTzWh:d1nKEBP3Ni8TtmGwR91NNYGa-zYv6Fl47Qt9zNbz_ZQ', '2023-03-06 06:19:51.122326');
INSERT INTO `django_session` VALUES ('4soiky1992mcn6ddy0whmhb9do3h9vlp', 'e30:1pSSeI:bh_DrIgOta5PUvIQbx_CRfDjRnge-19hvD6izqjo2Jo', '2023-03-02 01:01:22.782668');
INSERT INTO `django_session` VALUES ('9h84wsa33liilac20o3dci7e3nc5h7xt', 'e30:1pSSLg:ZBvrQMb-5b8uInLj_-mdiMPqnzFnQWJS98dzUYT9IOc', '2023-03-02 00:42:08.172710');
INSERT INTO `django_session` VALUES ('9ndct6ulh8gfhct4bis4wqowpebr9t4h', 'eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6InpodXdhbmcifX0:1pTvNr:KZvIksp20Ax6FJrO87RpZf6JbP-z-lFOoxoDfvmioFs', '2023-03-06 01:54:27.984858');
INSERT INTO `django_session` VALUES ('aua6x0ztq33wct4to6tbkvyigc87ley2', '.eJxVjDsOwjAQBe_iGlmsP8GmpOcM0XrXiwPIluKkQtwdIqWA9s3Me6kR16WMa8_zOLE6K1CH3y0hPXLdAN-x3pqmVpd5SnpT9E67vjbOz8vu_h0U7OVbi2MO1hCkDEcSskMcXAxWvEPiKCwM3phTEMDoKAhCNInZB5shoqj3B_y2OKQ:1pSEkS:uAAQcCbhlkKiTass0J_HNcBWp_jgPW919G1jVrMnJWs', '2023-03-01 10:10:48.348945');
INSERT INTO `django_session` VALUES ('mn1aiylq2hoilr7iup19ck0n6z58t5hl', 'e30:1pSSNZ:6o6DiFQmhjJDYXShF6raMHSP5cH2wxNk73IeA-8sZ1o', '2023-03-02 00:44:05.781656');
INSERT INTO `django_session` VALUES ('qt69jh1x5jycfo5qu7fwf8ld9bfdhng2', 'e30:1pSSLF:kJqfU1ZdVZTaS9PAMN4ZRV8H264oASScpspB1x2dimw', '2023-03-02 00:41:41.175020');

-- ----------------------------
-- Table structure for orderapp_order
-- ----------------------------
DROP TABLE IF EXISTS `orderapp_order`;
CREATE TABLE `orderapp_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_time` datetime(6) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderApp_order_user_id_d8756840_fk_userApp_userprofile_id` (`user_id`),
  CONSTRAINT `orderApp_order_user_id_d8756840_fk_userApp_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderapp_order
-- ----------------------------

-- ----------------------------
-- Table structure for productapp_product
-- ----------------------------
DROP TABLE IF EXISTS `productapp_product`;
CREATE TABLE `productapp_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productapp_product
-- ----------------------------
INSERT INTO `productapp_product` VALUES ('1', 'Coke', '10.99', '10', '../static/coke.png', 'good product1');
INSERT INTO `productapp_product` VALUES ('2', 'Sprite', '20.99', '10', '../static/sprite.png', 'hello, it is product2');
INSERT INTO `productapp_product` VALUES ('3', 'Fanta', '30.99', '10', '../static/fanta.png', 'unbelievably great product');

-- ----------------------------
-- Table structure for userapp_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `userapp_userprofile`;
CREATE TABLE `userapp_userprofile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userapp_userprofile
-- ----------------------------
INSERT INTO `userapp_userprofile` VALUES ('1', 'zhuwang', 'abc123');
INSERT INTO `userapp_userprofile` VALUES ('2', 'bob', '123');
