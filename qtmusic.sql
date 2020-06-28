/*
Navicat MySQL Data Transfer

Source Server         : yxd
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : qtmusic

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2020-06-28 17:06:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for artist
-- ----------------------------
DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `artname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `artins` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `artphoto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of artist
-- ----------------------------
INSERT INTO `artist` VALUES ('new', '王红', '11', '原创', 'pop', ' wwww', 'images/photo1.jpg');
INSERT INTO `artist` VALUES ('qq', '岑宁儿', '11', '原创', 'pop', ' 嗡嗡嗡', 'images/photo2.png');
INSERT INTO `artist` VALUES ('yxd', '陈奕迅', '22', '演唱', 'soft', ' 呃呃呃', 'images/photo3.png');

-- ----------------------------
-- Table structure for artist_work
-- ----------------------------
DROP TABLE IF EXISTS `artist_work`;
CREATE TABLE `artist_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `artname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `songname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of artist_work
-- ----------------------------
INSERT INTO `artist_work` VALUES ('1', 'qq', '岑宁儿', '追光者');
INSERT INTO `artist_work` VALUES ('8', 'new', '王红', '笑场');

-- ----------------------------
-- Table structure for my_history
-- ----------------------------
DROP TABLE IF EXISTS `my_history`;
CREATE TABLE `my_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `history` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
-- Records of my_history
-- ----------------------------
INSERT INTO `my_history` VALUES ('1', 'sgt', ' 再见,再见');
INSERT INTO `my_history` VALUES ('2', 'sgt', ' 追光者');
INSERT INTO `my_history` VALUES ('3', 'sgt', ' 耿耿于怀');
INSERT INTO `my_history` VALUES ('4', 'sgt', ' 岁月轻狂');
INSERT INTO `my_history` VALUES ('5', 'yxd', '下一站茶山刘');
INSERT INTO `my_history` VALUES ('6', 'yxd', '勿忘');
INSERT INTO `my_history` VALUES ('7', 'yxd', '大学时代');
INSERT INTO `my_history` VALUES ('9', 'qq', '追光者');
INSERT INTO `my_history` VALUES ('15', 'qq', '岁月轻狂');
INSERT INTO `my_history` VALUES ('16', 'qq', '再见,再见');
INSERT INTO `my_history` VALUES ('20', 'new', '再见,再见');
INSERT INTO `my_history` VALUES ('21', 'new', '下一站茶山刘');
INSERT INTO `my_history` VALUES ('23', 'new', '笑场');

-- ----------------------------
-- Table structure for my_like
-- ----------------------------
DROP TABLE IF EXISTS `my_like`;
CREATE TABLE `my_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `song` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of my_like
-- ----------------------------
INSERT INTO `my_like` VALUES ('1', 'yxd', '勿忘');
INSERT INTO `my_like` VALUES ('11', 'qq', '耿耿于怀');
INSERT INTO `my_like` VALUES ('19', 'qq', '再见');
INSERT INTO `my_like` VALUES ('21', 'qq', '岁月轻狂');
INSERT INTO `my_like` VALUES ('22', 'qq', '追光者');
INSERT INTO `my_like` VALUES ('29', 'new', '当我们一起走过');
INSERT INTO `my_like` VALUES ('30', 'new', '下一站茶山刘');

-- ----------------------------
-- Table structure for my_songlist
-- ----------------------------
DROP TABLE IF EXISTS `my_songlist`;
CREATE TABLE `my_songlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `songlistname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of my_songlist
-- ----------------------------
INSERT INTO `my_songlist` VALUES ('1', 'qq', '珍惜，珍惜  那些留下的人');
INSERT INTO `my_songlist` VALUES ('2', 'yxd', '失恋后才听懂这些歌呀');
INSERT INTO `my_songlist` VALUES ('4', 'qq', '失恋后才听懂这些歌呀');
INSERT INTO `my_songlist` VALUES ('5', 'qq', '爵士集  你是雾我是酒馆');
INSERT INTO `my_songlist` VALUES ('8', 'new', '青春不散场 毕业是没有再见的骊歌');

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `len_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `singer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `album` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `songlistname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES ('1', '再见,再见', '05:29', '岑宁儿', '世界', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('2', '追光者', '03:55', '岑宁儿', '夏至未至 影视', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('3', '耿耿于怀', '04:14', '王笑文', '耿耿于怀', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('4', '岁月轻狂', '04:20', '李治廷', '岁月神偷', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('5', '下一站茶山刘', '03:25', '房东的猫', '拾贰', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('6', '勿忘', '03:56', '李代沫', '勿忘', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('7', '大学时代', '05:02', '海口飞曲', '《麦田里的守望》', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('8', '当我们一起走过', '04:44', '岑宁儿', ' 你在烦恼什么', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('9', '那些花儿', '04:54', '朴树', ' 我去2000年', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('10', '再见', '03:03', '张震岳', 'OK', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('11', '哗啦啦少年再见', '03:51', '焦迈奇', '我的名字', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('12', '把这青春唱完', '04:20', '木小雅', '把这青春唱完', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('13', '骊歌', '02:27', 'GALA', '追梦赤子心', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('14', '下个,路口,见', '03:30', '李宇春', '李宇春 同名专辑', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('15', '匆匆那年', '04:00', '王菲', '匆匆那年', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('16', '他夏了夏天', '05:04', '苏打绿', '夏 狂热', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('17', '再见 昨天', '04:55', '牛奶 咖啡', '再见 昨天', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('18', '北京东路的日子', '04:39', '汪源/刘千楚', '北京东路的日子', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('19', '纪念', '03:23', 'RAiNBOW', '橙', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('20', '时光正好', '03:59', '郁可唯', '时光正好', '青春不散场 毕业是没有再见的骊歌', '/music/');
INSERT INTO `song` VALUES ('46', '笑场', '04:11', '王红', '城市', null, '/music/');

-- ----------------------------
-- Table structure for songlist
-- ----------------------------
DROP TABLE IF EXISTS `songlist`;
CREATE TABLE `songlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `introdu` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
-- Records of songlist
-- ----------------------------
INSERT INTO `songlist` VALUES ('1', '青春不散场 毕业是没有再见的骊歌', 'cover/', '介绍：海子《小站》<br/>我们最终都要远行，最终都要与稚嫩的自己告别。也许路途有点艰辛，有点孤独，但熬过了痛苦，我们才能得以成长。<br/>董卿《朗读者》<br/>告别，是结束也是开始，是苦痛也是希望。面对告别，最好的态度就是好好告别。<br/>再见了，这些年盛放的青春。');
INSERT INTO `songlist` VALUES ('2', '爵士集  你是雾我是酒馆', 'cover/', ' 睡眠的质量，是由自己与自己的关系状况所决定，是由精神舒适所决定的，好的睡眠可以被称为内在“深度的和谐”<br>\r\n<br>\r\n一个人深度整理和收拾自己的内心，这事本身就很迷人<br>\r\n介绍：');
INSERT INTO `songlist` VALUES ('3', '歌癌晚期 谋杀时间计划', 'cover/', '介绍： 常常在夜深人静之时仰望星空，<br>\r\n\r\n看这一片闪烁的海洋，<br>\r\n\r\n不禁想，头上是数以亿计孤独的集合啊。<br>\r\n\r\n星星们看起来只有一指之隔，<br>事实上却比人世间所有的距离都遥不可及，<br><br>它们会难过吗？');
INSERT INTO `songlist` VALUES ('4', '珍惜，珍惜  那些留下的人', 'cover/', '介绍： 转·教给各位大宝贝一个完美的自杀方法：<br>1.洗一个热水澡<br>2.泡一杯热牛奶，加点蜂蜜<br>3.把空调开到舒适的温度<br>4.喝下牛奶，躺到床上（记得刷牙哦）<br>5.等你睁开眼看见太阳升起就是你已经死了并轮回啦');
INSERT INTO `songlist` VALUES ('5', '音乐十载，独宠J.Fla，英文惊艳翻唱', 'cover/', '介绍： 每一首歌都是一个片段 一个人物<br>-烟嗓男声<br>-优质原唱与翻唱<br>-华语音乐<br>温柔的烟嗓更显现出对歌词的表达，以及自己情意的表达\r\n<br>-烟嗓使得本来较为完美的中声区具有金属的质感。\r\n持续更新中…');
INSERT INTO `songlist` VALUES ('6', '现在的你，习惯一个人了吗', 'cover/', '介绍： 持续更新中，用新的旧歌，安抚旧的心灵。<br>\r\n这支歌单，从头到尾，都是对往日的思惦、悔悼、紧爱。我们，听着这些歌，走过绚烂无悔的青春，走向不可承受之重的中年。<br>\r\n<br>\r\n愿你的指尖不论停留在哪一页，都能触摸到自己内心一直不敢去宣泄的那一缕感动。<br>');
INSERT INTO `songlist` VALUES ('7', '失恋后才听懂这些歌呀', 'cover/', '介绍： 《“山水总相逢|来日皆可期”》\r\n<br>\r\n我不再思考，为什么全世界都在谈恋爱,而我在弹烟灰这个问题了，<br>我只知道钱会越赚越多， <br>酒会越喝越醉生活会越来越好，<br>至于爱人来不来都随你的便吧。');
INSERT INTO `songlist` VALUES ('8', '你再不来，我要下雪了', 'cover/', '介绍： 爱而不得 念而不见\r\n<br>\r\n我对你仍有爱意，我对自己无能为力，我很喜欢你，可是好像只能到这里。\r\n<br>\r\n如今我们仅有的默契，就是安静的躺在对方的好友列表里，<br><br>不闻不问，各自生活。\r\n');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ins` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isartist` int(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('new', '1111qqqqq', '17853591111', '123@qq.com', 'images/photo5.png', 'qqqqqqqqqqqq', '1');
INSERT INTO `user` VALUES ('qq', '11', '17853591111', '321@qq.com', 'images/photo1.jpg', '啊啊hh             ', '1');
INSERT INTO `user` VALUES ('sgt', '1111qqqq', '17853596869', '123@qq.com', 'images/photo1.jpg', ' hhhhhh', '0');
INSERT INTO `user` VALUES ('yxd', '1111qqqq', '12345', '12345', 'images/photo1.jpg', '哈哈哈哈', '1');
