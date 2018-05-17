# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: base_admin
# Generation Time: 2018-05-17 09:01:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table pp_uc_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pp_uc_admin`;

CREATE TABLE `pp_uc_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '真实姓名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `role_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '角色id字符串，如：2,3,4',
  `phone` varchar(20) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

LOCK TABLES `pp_uc_admin` WRITE;
/*!40000 ALTER TABLE `pp_uc_admin` DISABLE KEYS */;

INSERT INTO `pp_uc_admin` (`id`, `login_name`, `real_name`, `password`, `role_ids`, `phone`, `email`, `salt`, `last_login`, `last_ip`, `status`, `create_id`, `update_id`, `create_time`, `update_time`)
VALUES
	(1,'admin','超级管理员','840fa1e5f049c861c7ed245293afcf8d','0','13888888889','haodaquan2008@163.com','kmcB',1515904905,'[',1,0,0,0,1506128438),
	(2,'george518','georgeHao','e5d77ebaffd5e4fe7164b31c6d7f1921','1,2','13811558899','12@11.com','ONNy',1506125048,'127.0.0.1',0,0,0,0,1515116737),
	(3,'haodaquan','郝大全','e9fa9187e7497892c237433aee966cc1','2,1','13811559988','hao@123.com','6fWE',1505960085,'127.0.0.1',1,1,0,1505919245,1513388240),
	(4,'ceshizhanghao','测试姓名','fa3fb5825c2e64bc764f29245dd1ec7a','2','13988009988','232@124.com','i8Nf',0,'',1,1,0,1506047337,1513388111);

/*!40000 ALTER TABLE `pp_uc_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pp_uc_auth
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pp_uc_auth`;

CREATE TABLE `pp_uc_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID，0为顶级',
  `auth_name` varchar(64) NOT NULL DEFAULT '0' COMMENT '权限名称',
  `auth_url` varchar(255) NOT NULL DEFAULT '0' COMMENT 'URL地址',
  `sort` int(1) unsigned NOT NULL DEFAULT '999' COMMENT '排序，越小越前',
  `icon` varchar(255) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示，0-隐藏，1-显示',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常，0-删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限因子';

LOCK TABLES `pp_uc_auth` WRITE;
/*!40000 ALTER TABLE `pp_uc_auth` DISABLE KEYS */;

INSERT INTO `pp_uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`)
VALUES
	(1,0,'所有权限','/',1,'',0,1,1,1,1,1505620970,1505620970),
	(2,1,'权限管理','/',999,'fa-id-card',1,1,0,1,1,0,1505622360),
	(3,2,'管理员','/admin/list',1,'fa-user-o',1,1,1,1,1,1505621186,1505621186),
	(4,2,'角色管理','/role/list',2,'fa-user-circle-o',1,1,0,1,1,0,1505621852),
	(5,3,'新增','/admin/add',1,'',0,1,0,1,1,0,1505621685),
	(6,3,'修改','/admin/edit',2,'',0,1,0,1,1,0,1505621697),
	(7,3,'删除','/admin/ajaxdel',3,'',0,1,1,1,1,1505621756,1505621756),
	(8,4,'新增','/role/add',1,'',1,1,0,1,1,0,1505698716),
	(9,4,'修改','/role/edit',2,'',0,1,1,1,1,1505621912,1505621912),
	(10,4,'删除','/role/ajaxdel',3,'',0,1,1,1,1,1505621951,1505621951),
	(11,2,'权限因子','/auth/list',3,'fa-list',1,1,1,1,1,1505621986,1505621986),
	(12,11,'新增','/auth/add',1,'',0,1,1,1,1,1505622009,1505622009),
	(13,11,'修改','/auth/edit',2,'',0,1,1,1,1,1505622047,1505622047),
	(14,11,'删除','/auth/ajaxdel',3,'',0,1,1,1,1,1505622111,1505622111),
	(15,1,'个人中心','/profile/edit',1001,'fa-user-circle-o',1,1,0,1,1,0,1526547595),
	(24,15,'资料修改','/user/edit',1,'fa-edit',1,1,0,1,1,0,1506057468);

/*!40000 ALTER TABLE `pp_uc_auth` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pp_uc_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pp_uc_role`;

CREATE TABLE `pp_uc_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '角色名称',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改这ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1-正常，0-删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

LOCK TABLES `pp_uc_role` WRITE;
/*!40000 ALTER TABLE `pp_uc_role` DISABLE KEYS */;

INSERT INTO `pp_uc_role` (`id`, `role_name`, `detail`, `create_id`, `update_id`, `status`, `create_time`, `update_time`)
VALUES
	(2,'系统管理员','系统管理员',0,1,1,1526547642,1526547642);

/*!40000 ALTER TABLE `pp_uc_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pp_uc_role_auth
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pp_uc_role_auth`;

CREATE TABLE `pp_uc_role_auth` (
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `auth_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限和角色关系表';

LOCK TABLES `pp_uc_role_auth` WRITE;
/*!40000 ALTER TABLE `pp_uc_role_auth` DISABLE KEYS */;

INSERT INTO `pp_uc_role_auth` (`role_id`, `auth_id`)
VALUES
	(2,0),
	(2,1),
	(2,2),
	(2,3),
	(2,4),
	(2,5),
	(2,6),
	(2,7),
	(2,8),
	(2,9),
	(2,10),
	(2,11),
	(2,12),
	(2,13),
	(2,14),
	(2,15),
	(2,24);

/*!40000 ALTER TABLE `pp_uc_role_auth` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
