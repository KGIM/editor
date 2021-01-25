/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 100313
 Source Host           : localhost:3306
 Source Schema         : newsapp

 Target Server Type    : MySQL
 Target Server Version : 100313
 File Encoding         : 65001

 Date: 15/01/2021 13:55:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(20000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `change_at` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '<p><span class=\"ql-size-huge\">test insert 1</span></p><p><br></p><p><span class=\"ql-size-huge\">test change old record</span></p>', '<p><span class=\"ql-size-huge\">test insert 1</span></p><p><br></p><p><span class=\"ql-size-huge\">test change old record</span></p>', '公告', 'http://127.0.0.1:5500', '2021-01-12 17:21:26.279112', '2021-01-12 17:21:26.279112');
INSERT INTO `news` VALUES (2, 'test paging', '<h1>test paging</h1><p><br></p><p>测试调用aegg的封装的pi</p>', '公告', 'http://192.168.56.252:10086', '2021-01-14 16:49:16.911824', '2021-01-14 16:49:16.911824');
INSERT INTO `news` VALUES (3, '<h1>test paging2</h1>', '<h1>test paging2</h1>', '', 'http://127.0.0.1:5500', '2021-01-12 17:21:16.488494', '2021-01-12 17:21:16.488494');
INSERT INTO `news` VALUES (4, 'test paging3<span class=\"ql-size-huge\">﻿</span><img src=\"/api/public/4-dfjbcj.png\"><img src=\"/api/public/4-bbfgjj.png\">', '<h1>test paging3<span class=\"ql-size-huge\">﻿</span><img src=\"/api/public/4-dfjbcj.png\"><img src=\"/api/public/4-bbfgjj.png\"></h1>', '公告', 'http://192.168.56.252:10086', '2021-01-14 15:27:49.723347', '2021-01-14 15:27:49.723347');
INSERT INTO `news` VALUES (5, '<h2>test paging4<strong class=\"ql-size-huge\"><u><span class=\"ql-cursor\">﻿</span></u></strong></h2>', '<h2>test paging4<strong class=\"ql-size-huge\"><u><span class=\"ql-cursor\">﻿</span></u></strong></h2>', '公告', 'http://127.0.0.1:5500', '2021-01-12 17:21:34.570736', '2021-01-12 17:21:34.570736');
INSERT INTO `news` VALUES (6, '<h1>test paging5<span class=\"ql-size-huge\"><span class=\"ql-cursor\">﻿</span></span></h1>', '<h1>test paging5<span class=\"ql-size-huge\"><span class=\"ql-cursor\">﻿</span></span></h1>', '公告', 'http://127.0.0.1:5500', '2021-01-12 17:21:40.166710', '2021-01-12 17:21:40.166710');
INSERT INTO `news` VALUES (7, '<h1><span class=\"ql-size-huge\">test paging6<span class=\"ql-cursor\">﻿</span></span></h1>', '<h1><span class=\"ql-size-huge\">test paging6<span class=\"ql-cursor\">﻿</span></span></h1>', '公告', 'http://127.0.0.1:5500', '2021-01-12 17:21:43.526943', '2021-01-12 17:21:43.526943');
INSERT INTO `news` VALUES (8, '<blockquote><span class=\"ql-size-huge\">test paging7</span></blockquote>', '<blockquote><span class=\"ql-size-huge\">test paging7</span></blockquote>', '公告', 'http://127.0.0.1:5500', '2021-01-12 17:21:46.878114', '2021-01-12 17:21:46.878114');
INSERT INTO `news` VALUES (9, '<h1><u class=\"ql-size-huge\">test paging 8</u></h1>', '<h1><u class=\"ql-size-huge\">test paging 8</u></h1>', '公告', 'http://127.0.0.1:5500', '2021-01-12 17:21:49.935512', '2021-01-12 17:21:49.935512');
INSERT INTO `news` VALUES (10, '<p><strong class=\"ql-size-huge\">test paging 9</strong></p>', '<p><strong class=\"ql-size-huge\">test paging 9</strong></p>', '公告', 'http://127.0.0.1:5500', '2021-01-12 17:21:57.044516', '2021-01-12 17:21:57.044516');
INSERT INTO `news` VALUES (11, '<h1><span class=\"ql-size-huge\">test paging10</span></h1>', '<h1><span class=\"ql-size-huge\">test paging10</span></h1>', '通知', 'http://127.0.0.1:5500', '2021-01-12 17:22:22.675131', '2021-01-12 17:22:22.675131');
INSERT INTO `news` VALUES (12, '<h1>222222222222222222222222222222222</h1>', '<h1>222222222222222222222222222222222</h1>', '公告', 'http://127.0.0.1:5500', '2021-01-12 17:22:26.805986', '2021-01-12 17:22:26.805986');
INSERT INTO `news` VALUES (13, '<p>11111111111111111111111111111111111111111111111111111111111111111</p>', '<p>11111111111111111111111111111111111111111111111111111111111111111</p>', '公告', 'http://127.0.0.1:5500', '2021-01-12 17:22:29.917218', '2021-01-12 17:22:29.917218');
INSERT INTO `news` VALUES (14, '<p>33333333333333333333333333333333</p>', '<p>33333333333333333333333333333333</p>', '公告', 'http://127.0.0.1:5500', '2021-01-12 17:22:33.245808', '2021-01-12 17:22:33.245808');
INSERT INTO `news` VALUES (15, '<p>4444444444444444444444444444444444</p>', '<p>4444444444444444444444444444444444</p>', '通知', 'http://127.0.0.1:5500', '2021-01-12 17:22:36.721807', '2021-01-12 17:22:36.721807');
INSERT INTO `news` VALUES (16, '<p>555555555555555555555555555555555555555</p>', '<p>555555555555555555555555555555555555555</p>', '通知', 'http://127.0.0.1:5500', '2021-01-12 17:22:39.238973', '2021-01-12 17:22:39.238973');
INSERT INTO `news` VALUES (17, '<p>666666666666666666666666666666666666666</p>', '<p>666666666666666666666666666666666666666</p>', '通知', 'http://127.0.0.1:5500', '2021-01-12 17:22:41.888827', '2021-01-12 17:22:41.888827');
INSERT INTO `news` VALUES (18, 'test title<p>77777777777777777777777777777777777777</p>', '<p>77777777777777777777777777777777777777</p>', '通知', 'http://127.0.0.1:5500', '2021-01-12 17:22:45.373856', '2021-01-12 17:22:45.373856');
INSERT INTO `news` VALUES (19, '<p>8888888888888888888888888888888888888888888</p>', '<p>8888888888888888888888888888888888888888888</p>', '通知', 'http://127.0.0.1:5500', '2021-01-12 17:22:48.511996', '2021-01-12 17:22:48.511996');
INSERT INTO `news` VALUES (20, '<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>', '<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>', '已发布', 'http://127.0.0.1:5500', '2021-01-12 17:22:52.014585', '2021-01-12 17:22:52.014585');
INSERT INTO `news` VALUES (21, '<p>饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿</p>', '<p>饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿饿</p>', '已发布', 'http://127.0.0.1:5500', '2021-01-12 17:22:54.814644', '2021-01-12 17:22:54.814644');
INSERT INTO `news` VALUES (22, '<p>哦哦哦哦哦哦哦哦哦哦</p>', '<p>哦哦哦哦哦哦哦哦哦哦</p>', '已发布', 'http://127.0.0.1:5500', '2021-01-12 17:22:57.693195', '2021-01-12 17:22:57.693195');
INSERT INTO `news` VALUES (23, '<p>哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈</p>', '<p>哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈</p>', '已发布', 'http://127.0.0.1:5500', '2021-01-12 17:23:00.555076', '2021-01-12 17:23:00.555076');
INSERT INTO `news` VALUES (24, '<p>咿呀咿呀呦咿呀咿呀哟咿呀咿呀呦</p>', '<p>咿呀咿呀呦咿呀咿呀哟咿呀咿呀呦</p>', '已发布', 'http://127.0.0.1:5500', '2021-01-12 17:23:03.624620', '2021-01-12 17:23:03.624620');
INSERT INTO `news` VALUES (25, '<h2>test add news type function whether works correctly</h2>', '<h2>test add news type function whether works correctly</h2>', '通知', 'http://127.0.0.1:5500', '2021-01-12 17:23:06.275374', '2021-01-12 17:23:06.275374');
INSERT INTO `news` VALUES (26, '<h1>test title</h1>', '<h1>test title</h1><p>test image upload</p>', '通知', '127.0.0.1', '2021-01-12 17:23:51.904064', '2021-01-12 17:23:51.904064');
INSERT INTO `news` VALUES (46, 'test upload img', '<h1>test upload img</h1><p><img src=\"/api/public/46-icon-2.png\"><img src=\"/api/public/46-icon-2.png\"><img src=\"/api/public/46-moon.png\"></p>', '公告', 'http://192.168.56.252:10086', '2021-01-14 15:14:26.546948', '2021-01-14 15:14:26.546948');
INSERT INTO `news` VALUES (47, 'test title', '<h1>test title</h1><p><img src=\"/api/public/47-icon-1.png\"></p>', '通知', 'http://192.168.56.252:10086', '2021-01-14 15:14:57.409411', '2021-01-14 15:14:57.409411');
INSERT INTO `news` VALUES (52, '测试', '<h1>测试</h1><p><img src=\"/api/public/52-hadcdf.png\" width=\"221\" style=\"\"></p>', '公告', 'http://192.168.56.252:10086', '2021-01-14 13:57:54.350732', '2021-01-14 13:57:54.350732');
INSERT INTO `news` VALUES (61, '测试插入多张图片', '<h1>测试插入多张图片</h1><p><br></p><p><img src=\"/api/public/61-ffibdi.png\"></p>', '公告', 'http://192.168.56.252:10086', '2021-01-14 14:22:29.638576', '2021-01-14 14:22:29.638576');
INSERT INTO `news` VALUES (64, '测试插入多张图片的点击展示效果', '<h1>测试插入多张图片的点击展示效果</h1><p><img src=\"/api/public/64-ifbiba.png\"></p>', '公告', 'http://192.168.56.252:10086', '2021-01-14 14:04:04.363755', '2021-01-14 14:04:04.363755');
INSERT INTO `news` VALUES (76, '测试编辑但不保存的情况', '<h1>测试编辑但不保存的情况</h1><p><img src=\"/api/public/76-dfjbah.png\"></p>', '公告', 'http://192.168.56.252:10086', '2021-01-14 14:04:48.028024', '2021-01-14 14:04:48.028024');
INSERT INTO `news` VALUES (81, '测试使用新插件的图片插入', '<h1>测试使用新插件的图片插入</h1><p><img src=\"/api/public/81-jagbfe.png\" width=\"262\" style=\"\"><img src=\"/api/public/81-fddafh.png\"></p>', '公告', 'http://192.168.56.252:10086', '2021-01-14 14:00:59.472534', '2021-01-14 14:00:59.472534');
INSERT INTO `news` VALUES (84, '测试新插件的多文件上传', '<h1>测试新插件的多文件上传</h1><p><img src=\"/api/public/84-cbcgbe.png\"></p>', '公告', 'http://192.168.56.252:10086', '2021-01-14 14:26:24.788849', '2021-01-14 14:26:24.788849');
INSERT INTO `news` VALUES (85, '再一次测试新插件的多文件上传', '<h1>再一次测试新插件的多文件上传</h1><p><img src=\"/api/public/85-cgaaef.png\" width=\"174\"><img src=\"/api/public/85-caegjg.png\" width=\"252\"><img src=\"/api/public/85-edfbfb.png\" width=\"466\" style=\"cursor: nesw-resize;\"></p>', '公告', 'http://192.168.56.252:10086', '2021-01-14 14:38:09.352517', '2021-01-14 14:38:09.352517');
INSERT INTO `news` VALUES (86, 'test anther news from another ip', '<h1>test anther news from another ip</h1><p>test insert another news from another ip</p><p><img src=\"/api/public/86-gdccad.jpeg\"><img src=\"/api/public/86-cjffda.jpeg\"></p>', '公告', '192.168.56.252', '2021-01-14 17:18:24.446426', '2021-01-14 17:18:24.446426');
INSERT INTO `news` VALUES (87, 'test insert news from another ip', '<h1>test insert news from another ip</h1><p><img src=\"/api/public/87-gegech.jpeg\"><img src=\"/api/public/87-bhigfe.jpeg\"></p>', '公告', '192.168.56.227', '2021-01-15 09:30:29.546950', '2021-01-15 09:30:29.546950');

SET FOREIGN_KEY_CHECKS = 1;
