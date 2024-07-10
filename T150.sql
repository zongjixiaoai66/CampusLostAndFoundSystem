/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t150`;
CREATE DATABASE IF NOT EXISTS `t150` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t150`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, 'picture1', 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1636451143961.jpg'),
	(2, 'picture2', 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1636451151455.jpg'),
	(3, 'picture3', 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1636451158274.jpg'),
	(6, 'homepage', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 COMMENT='字典表';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(65, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-03-09 09:29:17'),
	(66, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-03-09 09:29:18'),
	(67, 'shiwuzhaoling_types', '物品类型名称', 1, '物品类型1', NULL, NULL, '2022-03-09 09:29:18'),
	(68, 'shiwuzhaoling_types', '物品类型名称', 2, '物品类型2', NULL, NULL, '2022-03-09 09:29:18'),
	(69, 'status_types', '物品状态', 1, '未找回', NULL, NULL, '2022-03-09 09:29:18'),
	(70, 'status_types', '物品状态', 2, '已找回', NULL, NULL, '2022-03-09 09:29:18'),
	(73, 'yesno_types', '审核', 1, '未审核', NULL, NULL, '2022-03-09 09:29:18'),
	(74, 'yesno_types', '审核', 2, '通过', NULL, NULL, '2022-03-09 09:29:18'),
	(75, 'yesno_types', '审核', 3, '拒绝', NULL, NULL, '2022-03-09 09:29:18'),
	(76, 'news_types', '公告类型名称', 1, '公告类型1', NULL, NULL, '2022-03-09 09:29:18'),
	(77, 'news_types', '公告类型名称', 2, '公告类型2', NULL, NULL, '2022-03-09 09:29:18'),
	(78, 'xuanchuanshipin_types', '视频类型', 1, '视频类型1', NULL, NULL, NULL),
	(79, 'xuanchuanshipin_types', '视频类型', 2, '视频类型2', NULL, NULL, NULL),
	(80, 'forum_state_types', '帖子状态', 1, '发帖', NULL, NULL, '2022-02-16 09:19:59'),
	(81, 'forum_state_types', '帖子状态', 2, '回帖', NULL, NULL, '2022-02-16 09:19:59');

DROP TABLE IF EXISTS `forum`;
CREATE TABLE IF NOT EXISTS `forum` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `users_id` int DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int DEFAULT NULL COMMENT '父id',
  `forum_state_types` int DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='论坛';

DELETE FROM `forum`;
INSERT INTO `forum` (`id`, `forum_name`, `yonghu_id`, `users_id`, `forum_content`, `super_ids`, `forum_state_types`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, '标题1', 1, NULL, '帖子内容1', NULL, 1, '2022-02-16 09:26:18', NULL, '2022-02-16 09:26:18'),
	(2, NULL, 1, NULL, '评论内容1', 1, 2, '2022-02-16 09:26:26', NULL, '2022-02-16 09:26:26'),
	(10, NULL, NULL, 1, '管理回帖', 1, 2, '2022-02-16 11:43:00', NULL, '2022-02-16 11:43:00'),
	(11, '22', 1, NULL, '2222', NULL, 1, '2024-04-27 10:32:16', NULL, '2024-04-27 10:32:16');

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告名称  Search111 ',
  `news_types` int DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 show1 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='公告';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `news_name`, `news_types`, `news_photo`, `insert_time`, `news_content`, `create_time`) VALUES
	(3, '公告1', 1, 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1636451095323.jpg', '2022-03-09 09:44:59', '<p><span style="color: rgb(96, 98, 102);">公告详情1</span></p>', '2022-03-09 09:44:59');

DROP TABLE IF EXISTS `shiwurenling`;
CREATE TABLE IF NOT EXISTS `shiwurenling` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shiwuzhaoling_id` int DEFAULT NULL COMMENT '失物id',
  `yonghu_id` int DEFAULT NULL COMMENT '认领用户',
  `yesno_types` int DEFAULT NULL COMMENT '审核',
  `shiwurenling_text` text COMMENT '详情',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '认领时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='失物认领';

DELETE FROM `shiwurenling`;
INSERT INTO `shiwurenling` (`id`, `shiwuzhaoling_id`, `yonghu_id`, `yesno_types`, `shiwurenling_text`, `insert_time`, `create_time`) VALUES
	(1, 2, 1, 3, '123', '2022-03-09 01:33:48', '2022-03-09 01:33:48'),
	(6, 2, 1, 1, '111', '2022-03-09 02:52:25', '2022-03-09 02:52:25'),
	(8, 4, 1, 1, '333', '2022-02-16 09:47:29', '2022-02-16 09:47:29');

DROP TABLE IF EXISTS `shiwuzhaoling`;
CREATE TABLE IF NOT EXISTS `shiwuzhaoling` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shiwuzhaoling_uuid_number` varchar(200) DEFAULT NULL COMMENT '失物编号',
  `shiwuzhaoling_name` varchar(200) DEFAULT NULL COMMENT '物品名称 Search111',
  `shiwuzhaoling_types` int DEFAULT NULL COMMENT '物品类型 Search111',
  `status_types` int DEFAULT NULL COMMENT '物品状态 Search111',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `shiwuzhaoling_photo` varchar(200) DEFAULT NULL COMMENT '物品图片',
  `shiwuzhaoling_time` timestamp NULL DEFAULT NULL COMMENT '拾遗时间',
  `shiwuzhaoling_dizhi` varchar(200) DEFAULT NULL COMMENT '拾遗地址',
  `shiwuzhaoling_content` text COMMENT '详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='失物招领';

DELETE FROM `shiwuzhaoling`;
INSERT INTO `shiwuzhaoling` (`id`, `shiwuzhaoling_uuid_number`, `shiwuzhaoling_name`, `shiwuzhaoling_types`, `status_types`, `yonghu_id`, `shiwuzhaoling_photo`, `shiwuzhaoling_time`, `shiwuzhaoling_dizhi`, `shiwuzhaoling_content`, `create_time`) VALUES
	(2, '1636450742221', '物品1', 1, 2, 1, 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1636450760144.jpg', '2022-03-08 16:00:00', '拾遗地址1', '<p><span style="color: rgb(96, 98, 102);">详情1</span></p>', '2022-03-09 09:39:39'),
	(4, '1645002313680', '物品名称2', 2, 1, 3, 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1645002341273.jpg', '2022-02-16 16:00:00', '拾遗地址12', '<p><span style="color: rgb(96, 98, 102);">详情123</span></p>', '2022-02-16 09:05:50'),
	(5, '1645005212515', '物品名称3', 1, 1, 1, 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1645005237871.jpg', '2022-03-04 16:00:00', '拾遗地址3', '<p><span style="color: rgb(96, 98, 102);">详情3</span></p>', '2022-02-16 09:54:07'),
	(6, '1645005250379', '物品名称4', 2, 2, 3, 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1645005265927.jpg', '2022-03-11 16:00:00', '拾遗地址4', '<p><span style="color: rgb(96, 98, 102);">详情4</span></p>', '2022-02-16 09:54:39');

DROP TABLE IF EXISTS `shiwuzhaoling_liuyan`;
CREATE TABLE IF NOT EXISTS `shiwuzhaoling_liuyan` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shiwuzhaoling_id` int DEFAULT NULL COMMENT '物品',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `shiwuzhaoling_liuyan_text` text COMMENT '留言内容',
  `reply_text` text COMMENT '回复内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='失物招领留言';

DELETE FROM `shiwuzhaoling_liuyan`;

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'admin', 'users', '管理员', 'ujeg90w5dbtptlyif4ijskwe3m5pbcvs', '2022-03-09 09:23:39', '2024-04-27 11:30:11'),
	(2, 1, '111', 'yonghu', '用户', '14mf3yx9x72f6wnbtqqpxa0p0x86i699', '2022-03-09 09:46:09', '2024-04-27 11:32:03'),
	(3, 2, '222', 'yonghu', '用户', '3g5snwvumqiu8ak72p2b4j5zupwx4tf1', '2022-03-09 02:10:16', '2022-03-09 03:59:13'),
	(4, 3, '123', 'yonghu', '用户', 'lrujyt7pw0a0uor8vuklaszaanaoste9', '2022-03-09 02:54:01', '2022-02-16 12:43:33');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2022-03-09 07:59:12');

DROP TABLE IF EXISTS `wupinguashi`;
CREATE TABLE IF NOT EXISTS `wupinguashi` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wupinguashi_name` varchar(200) DEFAULT NULL COMMENT '物品名称 Search111',
  `shiwuzhaoling_types` int DEFAULT NULL COMMENT '物品类型 Search111',
  `status_types` int DEFAULT NULL COMMENT '物品状态 Search111',
  `wupinguashi_photo` varchar(200) DEFAULT NULL COMMENT '物品图片',
  `wupinguashi_time` timestamp NULL DEFAULT NULL COMMENT '丢失时间',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `wupinguashi_dizhi` varchar(200) DEFAULT NULL COMMENT '丢失地址',
  `wupinguashi_content` text COMMENT '详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='物品挂失';

DELETE FROM `wupinguashi`;
INSERT INTO `wupinguashi` (`id`, `wupinguashi_name`, `shiwuzhaoling_types`, `status_types`, `wupinguashi_photo`, `wupinguashi_time`, `yonghu_id`, `wupinguashi_dizhi`, `wupinguashi_content`, `create_time`) VALUES
	(2, '物品名称1', 1, 1, 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1636450836093.jpg', '2021-11-04 05:04:07', 1, '丢失地址1', '<p><span style="color: rgb(96, 98, 102);">详情1</span></p>', '2022-03-09 09:37:49'),
	(4, '物品名称2', 2, 2, 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1645005296242.jpg', '2022-03-11 16:00:00', 3, '丢失地址2', '<p><span style="color: rgb(96, 98, 102);">详情2</span></p>', '2022-03-09 02:53:55');

DROP TABLE IF EXISTS `wupinguashi_liuyan`;
CREATE TABLE IF NOT EXISTS `wupinguashi_liuyan` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wupinguashi_id` int DEFAULT NULL COMMENT '物品',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `wupinguashi_liuyan_text` text COMMENT '留言内容',
  `reply_text` text COMMENT '回复内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='物品挂失留言';

DELETE FROM `wupinguashi_liuyan`;
INSERT INTO `wupinguashi_liuyan` (`id`, `wupinguashi_id`, `yonghu_id`, `wupinguashi_liuyan_text`, `reply_text`, `insert_time`, `update_time`, `create_time`) VALUES
	(2, 2, 1, '留言111111', NULL, '2022-02-16 11:04:35', NULL, '2022-02-16 11:04:35'),
	(3, 4, 1, '留言1111', '回复', '2022-02-16 11:36:34', '2022-02-16 11:42:47', '2022-03-09 09:37:49');

DROP TABLE IF EXISTS `xuanchuanshipin`;
CREATE TABLE IF NOT EXISTS `xuanchuanshipin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `xuanchuanshipin_name` varchar(200) DEFAULT NULL COMMENT '视频标题  Search111',
  `xuanchuanshipin_photo` varchar(200) DEFAULT NULL COMMENT '视频封面',
  `xuanchuanshipin_video` varchar(200) DEFAULT NULL COMMENT '视频',
  `xuanchuanshipin_types` int DEFAULT NULL COMMENT '视频类型 Search111',
  `xuanchuanshipin_content` text COMMENT '详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='宣传视频';

DELETE FROM `xuanchuanshipin`;
INSERT INTO `xuanchuanshipin` (`id`, `xuanchuanshipin_name`, `xuanchuanshipin_photo`, `xuanchuanshipin_video`, `xuanchuanshipin_types`, `xuanchuanshipin_content`, `create_time`) VALUES
	(4, '视频标题1', 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1645003018442.png', 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1645003014562.mp4', 2, '<p><span style="color: rgb(96, 98, 102);">详情1</span></p>', '2022-02-16 09:12:41'),
	(5, '视频标题2', 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1645003026577.png', 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1645003029577.mp4', 2, '<p><span style="color: rgb(96, 98, 102);">详情2</span></p>', '2022-02-16 09:13:27'),
	(6, '视频标题3', 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1645003045658.png', 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1645003041631.mp4', 2, '<p><span style="color: rgb(96, 98, 102);">详情3</span></p>', '2022-02-16 09:13:41');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名  Search111',
  `sex_types` int DEFAULT NULL COMMENT '性别 Search111',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '照片',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `sex_types`, `yonghu_id_number`, `yonghu_phone`, `yonghu_photo`, `create_time`) VALUES
	(1, '用户1', '123456', '用户a1', 2, '410882200011121114', '17788559631', 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1636450676144.jpg', '2022-03-09 09:37:49'),
	(3, '用户2', '123456', '用户a2', 2, '410882199901126124', '13314414414', 'http://localhost:8080/xiaoyuansiwuzhaoling/upload/1637722494550.jpg', '2022-03-09 02:53:55');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
