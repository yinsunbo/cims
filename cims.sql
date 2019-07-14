/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : cims

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2019-07-10 16:35:03
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `s_user`
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `userName` varchar(8) NOT NULL,
  `noId` int(7) NOT NULL AUTO_INCREMENT,
  `userPassword` varchar(16) NOT NULL,
  `power` int(1) NOT NULL DEFAULT '1',
  `cinema_id` int(6) NOT NULL,
  `tel` int(13) DEFAULT NULL,
  `sex` enum('女','男') DEFAULT NULL COMMENT 'check(sex=''男'' or sex=''女'')',
  `email` varchar(30) DEFAULT NULL,
  `age` year(4) DEFAULT NULL,
  `seniority` date DEFAULT NULL,
  PRIMARY KEY (`noId`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `t_cinema` (`cinema_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1000034 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_user
-- ----------------------------
INSERT INTO s_user VALUES ('张三', '1000001', '123456', '0', '100001', '188776655', '男', '1@qq.com', '1999', '2019-03-06');
INSERT INTO s_user VALUES ('钱大大', '1000005', '123456', '1', '100002', '123', '男', '2@QQ.com', '1963', '2019-02-06');
INSERT INTO s_user VALUES ('王大dad1', '1000006', '123545', '1', '100001', '333', '男', '2@QQ.com', '1972', '2019-03-01');
INSERT INTO s_user VALUES ('王二', '1000007', '123456', '1', '100001', '123', '男', '123456@qq.com', '1996', '2019-03-03');
INSERT INTO s_user VALUES ('王四', '1000009', '123456', '1', '100002', '123', '男', '1@31.com', '1962', '2019-03-03');
INSERT INTO s_user VALUES ('王四', '1000010', '123456', '1', '100002', '123', '男', '1@31.com', '1965', '2019-03-01');
INSERT INTO s_user VALUES ('王四', '1000011', '123456', '1', '100001', '123', '男', '1@31.com', '1964', '2019-03-04');
INSERT INTO s_user VALUES ('王四', '1000012', '123456', '1', '100002', '123', '男', '1@31.com', '1966', '2018-10-09');
INSERT INTO s_user VALUES ('钱大', '1000014', '123456', '1', '100001', '12345676', '男', '1@31.com', '1960', '2019-03-05');
INSERT INTO s_user VALUES ('王四', '1000015', '123456', '1', '100001', '123', '男', '1@31.com', '2016', '2019-03-05');
INSERT INTO s_user VALUES ('赵六', '1000016', '123456', '1', '100002', '123', '男', '2@QQ.com', '2003', '2019-03-06');
INSERT INTO s_user VALUES ('张大', '1000017', '123456', '1', '100002', '12345676', '女', '1@31.com', '1964', '2018-12-19');
INSERT INTO s_user VALUES ('魏中华', '1000018', '123456', '1', '100002', '3232321', '男', '32142154@qq.com', '1964', '2019-02-06');
INSERT INTO s_user VALUES ('张大', '1000019', '123456', '1', '100001', '12345676', '男', '32142154@qq.com', '2015', '2018-11-15');
INSERT INTO s_user VALUES ('钱大', '1000020', '123456', '1', '100002', '23543', '男', '342523@qq.com', '1966', '2019-03-21');
INSERT INTO s_user VALUES ('张大', '1000021', '123456', '1', '100002', '3232321', '男', '32142154@qq.com', '2013', '2019-03-02');
INSERT INTO s_user VALUES ('钱大', '1000022', '123456', '1', '100001', '123', '男', '1@31.com', '1964', '2019-03-04');
INSERT INTO s_user VALUES ('赵六', '1000023', '123456', '1', '100001', '12345676', '男', '1@31.com', '1966', '1999-09-09');
INSERT INTO s_user VALUES ('尹孙博', '1000025', '123545', '1', '100013', '12345676', '男', '342523@qq.com', '1989', '2019-04-03');
INSERT INTO s_user VALUES ('王四', '1000026', '123456', '1', '100006', '12345676', '男', '32142154@qq.com', '1958', '2019-04-10');
INSERT INTO s_user VALUES ('钱大', '1000027', '999999', '1', '100001', '123', '男', '2@QQ.com', '1965', '2019-04-11');
INSERT INTO s_user VALUES ('张大', '1000029', '999999', '1', '100013', '3232321', '男', '123456@qq.com', '1966', '2019-04-10');
INSERT INTO s_user VALUES ('张大', '1000030', '123466', '1', '100001', '12345676', '女', '342523@qq.com', '1965', '2019-04-11');
INSERT INTO s_user VALUES ('尹孙博', '1000031', '123456', '1', '100013', '12345676', '男', '32142154@qq.com', '1996', '2019-05-01');
INSERT INTO s_user VALUES ('赵六', '1000032', '888123', '1', '100001', '12345676', '男', '32142154@qq.com', '1982', '2018-08-08');
INSERT INTO s_user VALUES ('林刚', '1000033', '123545', '1', '100002', '123456', '男', '32142154@qq.com', '1994', '2019-01-01');

-- ----------------------------
-- Table structure for `t_cinema`
-- ----------------------------
DROP TABLE IF EXISTS `t_cinema`;
CREATE TABLE `t_cinema` (
  `cinema_id` int(6) NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(30) NOT NULL,
  `location` varchar(50) NOT NULL,
  `tel` int(12) NOT NULL,
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100018 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cinema
-- ----------------------------
INSERT INTO t_cinema VALUES ('100001', '大连中影星美国际影城(软件园店)1', '大连高新园区软件园路1A-12号', '0');
INSERT INTO t_cinema VALUES ('100002', '万达影城(大连一方广场店)', '大连市中山区鲁迅路12-1号一方国际四层', '0');
INSERT INTO t_cinema VALUES ('100006', '金逸影城(福佳新天地广场店)', '大连市沙河口区兴工南五街1号福佳新天地购物广场F5', '12345676');
INSERT INTO t_cinema VALUES ('100013', '大连华臣影城(锦辉商城店)', '大连市沙河口区数码路南段13号锦辉购物广场F2', '12345676');
INSERT INTO t_cinema VALUES ('100014', '儋州恒大影城(文化北路恒大名都店)', '儋州市那大镇文化北路恒大名都二期商业中心3层', '12345678');
INSERT INTO t_cinema VALUES ('100015', '儋州中视影城(大勇商城店)', '海南省儋州市那大镇人民中路大勇商城6楼', '23326111');
INSERT INTO t_cinema VALUES ('100017', '大连华臣影城(锦辉商城店)', '大连市甘井子区黄浦路517号锦辉购物广场F5-F6', '12345676');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `comment_id` int(12) NOT NULL AUTO_INCREMENT,
  `comment_title` varchar(30) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_id` int(8) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO t_comment VALUES ('1000001', '流浪地球真好看', '流浪地球真好看', '2019-05-08 14:32:53', '10000002', '62');

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `customer_id` int(8) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(10) NOT NULL,
  `customer_password` varchar(16) NOT NULL,
  `customer_phone` varchar(11) NOT NULL,
  `customer_email` varchar(30) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO t_customer VALUES ('10000001', '尹孙博', '12345678', '18940980130', '601519339@qq.com');
INSERT INTO t_customer VALUES ('10000002', '张六', '12345678', '18940980131', '123@qq.com');
INSERT INTO t_customer VALUES ('10000003', '李四', '12345678', '18940980132', '1234@qq.com');
INSERT INTO t_customer VALUES ('10000004', '李四', '12345678', '18940980133', '1234@qq.com');
INSERT INTO t_customer VALUES ('10000005', '张三', '12345678', '18940980134', '123@qq.com');
INSERT INTO t_customer VALUES ('10000006', '张三', '12345678', '18940980135', '123@qq.com');
INSERT INTO t_customer VALUES ('10000007', '张三', '12345678', '18940980136', '123@qq.com');

-- ----------------------------
-- Table structure for `t_movie`
-- ----------------------------
DROP TABLE IF EXISTS `t_movie`;
CREATE TABLE `t_movie` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(50) NOT NULL,
  `type_id` int(3) NOT NULL,
  `movie_introduce` text,
  `movie_language` varchar(10) DEFAULT NULL,
  `movie_date` date NOT NULL,
  `key_word` varchar(50) DEFAULT NULL,
  `img_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_movie
-- ----------------------------
INSERT INTO t_movie VALUES ('1', '憨豆先生', '1', '憨豆主演', '英语', '2018-12-19', null, '');
INSERT INTO t_movie VALUES ('2', '憨豆特工3', '1', '123', '英语', '2018-12-11', null, '');
INSERT INTO t_movie VALUES ('3', '憨豆特工3', '1', '123', '英语', '2018-12-11', null, '');
INSERT INTO t_movie VALUES ('4', '憨豆特工3', '1', '123', '英语', '2018-12-11', null, '');
INSERT INTO t_movie VALUES ('5', '憨豆特工3', '1', '123', '英语', '2018-12-11', null, '');
INSERT INTO t_movie VALUES ('6', '憨豆特工3', '1', '123', '英语', '2018-12-11', null, '');
INSERT INTO t_movie VALUES ('8', '憨豆特工2', '1', '1233', '英语', '2018-12-11', null, '');
INSERT INTO t_movie VALUES ('9', '海王', '1', '123', '英语', '2018-12-02', null, '');
INSERT INTO t_movie VALUES ('52', '电影名', '1', '123', '国语', '2018-12-24', null, '');
INSERT INTO t_movie VALUES ('53', '海王', '1', '123', '英语', '2018-12-10', null, '');
INSERT INTO t_movie VALUES ('54', '海王', '1', '123', '英语', '2018-12-10', null, '');
INSERT INTO t_movie VALUES ('55', '海王', '1', '123', '英语', '2018-12-10', null, '');
INSERT INTO t_movie VALUES ('57', '海王', '1', '123', '英语', '2018-12-10', null, '');
INSERT INTO t_movie VALUES ('58', '龙猫', '1', '123', '日语', '2018-12-11', null, '');
INSERT INTO t_movie VALUES ('59', '龙猫', '1', '宫崎骏', '日语', '2018-12-20', null, '');
INSERT INTO t_movie VALUES ('60', '我是谁？', '1', '成龙主演', '国语', '2018-12-21', null, '');
INSERT INTO t_movie VALUES ('61', '电影名称', '1', '介绍', '国语', '2018-12-21', null, '');
INSERT INTO t_movie VALUES ('62', '流浪地球1', '1', '近未来，科学家们发现太阳急速衰老膨胀，短时间内包括地球在内的整个太阳系都将被太阳所吞没。为了自救，人类提出一个名为“流浪地球”的大胆计划，即倾全球之力在地球表面建造上万座发动机和转向发动机，推动地球离开太阳系，用2500年的时间奔往另外一个栖息之地。中国航天员刘培强（吴京 饰）在儿子刘启四岁那年前往国际空间站，和国际同侪肩负起领航者的重任。转眼刘启（屈楚萧 饰）长大，他带着妹妹朵朵（赵今麦 饰）偷偷跑到地表，偷开外公韩子昂（吴孟达 饰）的运输车，结果不仅遭到逮捕，还遭遇了全球发动机停摆的事件。为了修好发动机，阻止地球坠入木星，全球开始展开饱和式营救，连刘启他们的车也被强征加入。在与时间赛跑的过程中，无数的人前仆后继，奋不顾身，只为延续百代子孙生存的希望…… \r\n　　本片根据刘慈欣的同名小说改编。', '国语', '2019-02-15', '吴京', 'img/012c5725-69db-417a-89e4-64471f8195ed.jpg');
INSERT INTO t_movie VALUES ('63', '流浪地球', '1', '', '国语', '2019-04-03', '吴京', 'img/230c4bb6-2105-4cfc-bc9d-1ff556edd361.jpg');
INSERT INTO t_movie VALUES ('65', '复仇者联盟4：终局之战', '3', '漫威影业荣誉出品《复仇者联盟4：终局之战》，故事发生在灭霸消灭宇宙一半的生灵并重创复仇者联盟之后，剩余的英雄被迫背水一战，为22部漫威电影写下传奇终章。', '英语', '2019-04-23', '漫威', 'img/7fffac02-c081-4ee0-ad14-52360e767e81.jpg');
INSERT INTO t_movie VALUES ('69', '大侦探皮卡丘 ', '7', '12321', '日语', '2019-05-10', '皮卡丘 动漫', 'img/b5c36a5f-fe0f-433c-a248-05708ad2638b.png');
INSERT INTO t_movie VALUES ('70', '大侦探皮卡丘 ', '3', '123', '英语', '2019-05-10', '皮卡丘', 'img/9b2930fc-9456-4d63-805b-7a0ea5653d2f.jpg');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` int(13) NOT NULL AUTO_INCREMENT,
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seat_location` text NOT NULL,
  `scene_id` int(12) NOT NULL,
  `order_state` int(2) NOT NULL DEFAULT '1',
  `customer_id` int(8) NOT NULL,
  `order_price` int(8) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO t_order VALUES ('1', '2019-05-06 09:46:21', '6_13,6_12', '10000001', '1', '10000002', '100');
INSERT INTO t_order VALUES ('2', '2019-05-06 09:50:25', '3_8,3_7', '10000001', '1', '10000002', '100');
INSERT INTO t_order VALUES ('3', '2019-05-06 09:51:03', '1_1,2_2', '10000001', '1', '10000002', '100');
INSERT INTO t_order VALUES ('4', '2019-05-06 10:55:48', '7_13', '10000001', '1', '10000002', '50');
INSERT INTO t_order VALUES ('5', '2019-05-06 11:19:42', '5_7,5_8', '10000001', '1', '10000002', '100');
INSERT INTO t_order VALUES ('6', '2019-05-06 14:22:02', '5_10,5_9', '10000002', '0', '10000002', '60');
INSERT INTO t_order VALUES ('7', '2019-05-06 14:28:56', '4_11,4_9,4_10', '10000002', '0', '10000006', '90');
INSERT INTO t_order VALUES ('8', '2019-05-06 16:05:26', '7_11,7_12,7_13', '10000002', '1', '10000002', '90');
INSERT INTO t_order VALUES ('9', '2019-05-09 16:59:33', '8_7,8_8,9_8,9_7,10_7,10_9', '10000001', '1', '10000006', '300');
INSERT INTO t_order VALUES ('10', '2019-05-22 10:38:46', '8_5,8_6', '10000001', '1', '10000002', '100');
INSERT INTO t_order VALUES ('11', '2019-05-22 16:05:29', '2_8,2_7', '10000006', '1', '10000007', '100');
INSERT INTO t_order VALUES ('12', '2019-05-24 19:37:35', '1_7,2_7,1_8,2_8', '10000005', '1', '10000002', '120');

-- ----------------------------
-- Table structure for `t_scene`
-- ----------------------------
DROP TABLE IF EXISTS `t_scene`;
CREATE TABLE `t_scene` (
  `scene_id` int(12) NOT NULL AUTO_INCREMENT,
  `scene_name` varchar(20) NOT NULL,
  `scene_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `seat_id` int(6) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `cinema_id` int(6) NOT NULL,
  `price` int(3) NOT NULL,
  PRIMARY KEY (`scene_id`),
  KEY `movie` (`movie_id`),
  KEY `cinema` (`cinema_id`),
  CONSTRAINT `cinema` FOREIGN KEY (`cinema_id`) REFERENCES `t_cinema` (`cinema_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `movie` FOREIGN KEY (`movie_id`) REFERENCES `t_movie` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10000009 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_scene
-- ----------------------------
INSERT INTO t_scene VALUES ('10000001', '流浪地球（国语3D）', '2019-03-20', '12:00:00', '13:36:00', '100001', '62', '100001', '51');
INSERT INTO t_scene VALUES ('10000002', '流浪地球', '2019-05-08', '14:58:00', '16:00:00', '100003', '62', '100001', '30');
INSERT INTO t_scene VALUES ('10000003', '复仇者联盟4：终局之战 ', '2019-05-07', '12:00:00', '14:00:00', '100007', '65', '100001', '30');
INSERT INTO t_scene VALUES ('10000005', '流浪地球1 ', '2019-05-28', '12:00:00', '13:00:00', '100003', '62', '100001', '30');
INSERT INTO t_scene VALUES ('10000007', '大侦探皮卡丘  ', '2019-05-23', '12:00:00', '14:00:00', '100008', '69', '100001', '40');
INSERT INTO t_scene VALUES ('10000008', '大侦探皮卡丘  (3D)', '2019-05-30', '12:00:00', '13:00:00', '100008', '70', '100001', '30');

-- ----------------------------
-- Table structure for `t_seat`
-- ----------------------------
DROP TABLE IF EXISTS `t_seat`;
CREATE TABLE `t_seat` (
  `seat_name` varchar(10) NOT NULL,
  `seat_id` int(6) NOT NULL AUTO_INCREMENT,
  `seat_map` text NOT NULL,
  `cinema_id` int(6) NOT NULL,
  `seat_row` int(3) DEFAULT NULL,
  `seat_column` int(3) DEFAULT NULL,
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100014 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seat
-- ----------------------------
INSERT INTO t_seat VALUES ('9号厅', '100001', 'sssss_sssssss,sssss_sssssss,sssss_sssssss,sssss_sssssss,sssss_sssssss,sssss_sssssss,sssss_sssssss,sssss_sssssss,sssss_sssssss,sssss_sssssss', '100001', '10', '13');
INSERT INTO t_seat VALUES ('四号观影厅', '100003', 'sssssssss_sss,sssssssss_sss,sssssssss_sss,sssssssss_sss,sssssssss_sss,sssssssss_sss,sssssssss_sss,sssssssss_sss', '100001', '8', '13');
INSERT INTO t_seat VALUES ('一号厅', '100004', 'ssssssss_sssssss,ssssssss_sssssss,ssssssss_sssssss,ssssssss_sssssss,ssssssss_sssssss,ssssssss_sssssss,ssssssss_sssssss,ssssssss_sssssss,ssssssss_sssssss,ssssssss_sssssss,ssssssss_sssssss,ssssssss_sssssss', '100001', '12', '16');
INSERT INTO t_seat VALUES ('二号大厅', '100005', 'ssss_sssss,ssss_sssss,ssss_sssss,ssss_sssss,ssss_sssss,ssss_sssss,ssss_sssss,ssss_sssss,ssss_sssss,ssss_sssss', '100001', '10', '10');
INSERT INTO t_seat VALUES ('5号观影厅321', '100006', 'ssssssssss,ssssssssss,ssssssssss,ssssssssss,ssssssssss,ssssssssss,ssssssssss,ssssssssss,ssssssssss,ssssssssss', '100001', '10', '10');
INSERT INTO t_seat VALUES ('一号厅', '100007', 'sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss,sssssssssss_ssssssss', '100001', '30', '20');
INSERT INTO t_seat VALUES ('一号厅', '100008', 'ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss', '100001', '22', '14');
INSERT INTO t_seat VALUES ('一号厅', '100009', 'ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss,ssssssssssssss', '100001', '13', '14');
INSERT INTO t_seat VALUES ('三号厅', '100010', 'sssss_ss,sssss_ss,sssss_ss,sssss_ss,sssss_ss,sssss_ss,sssss_ss,sssss_ss', '100001', '8', '8');
INSERT INTO t_seat VALUES ('测试大厅123', '100011', 'ssssssss_sssssssss,ssssssss_sssssssss,ssssssss_sssssssss,ssssssss_sssssssss,ssssssss_sssssssss,ssssssss_sssssssss,ssssssss_sssssssss,ssssssss_sssssssss,ssssssss_sssssssss', '100001', '9', '18');
INSERT INTO t_seat VALUES ('K厅', '100012', 'ssssssssss_ssss,ssssssssss_ssss,ssssssssss_ssss,ssssssssss_ssss,ssssssssss_ssss,ssssssssss_ssss,ssssssssss_ssss,ssssssssss_ssss,ssssssssss_ssss,ssssssssss_ssss,ssssssssss_ssss,ssssssssss_ssss,ssssssssss_ssss', '100001', '13', '15');
INSERT INTO t_seat VALUES ('测试大厅', '100013', 'ssssss_ssssss,ssssss_ssssss,ssssss_ssssss,ssssss_ssssss,ssssss_ssssss,ssssss_ssssss,ssssss_ssssss,ssssss_ssssss,ssssss_ssssss,ssssss_ssssss,ssssss_ssssss,ssssss_ssssss,ssssss_ssssss', '100001', '13', '13');

-- ----------------------------
-- Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `type_id` int(3) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(5) NOT NULL,
  PRIMARY KEY (`type_id`,`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO t_type VALUES ('1', '纪录片');
INSERT INTO t_type VALUES ('2', '战争片');
INSERT INTO t_type VALUES ('3', '科幻片');
INSERT INTO t_type VALUES ('4', '文艺片');
INSERT INTO t_type VALUES ('5', '武侠片');
INSERT INTO t_type VALUES ('6', '魔幻片');
INSERT INTO t_type VALUES ('7', '动画片');
