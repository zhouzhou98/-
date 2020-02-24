/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : erp

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2020-02-24 16:38:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bus_customer`
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `connectionperson` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES ('1', '小张超市', '111', '武汉', '027-9123131', '张大明', '13812312312321312', '中国银行', '654431331343413', '213123@sina.com', '430000', '1');
INSERT INTO `bus_customer` VALUES ('2', '小明超市', '222', '深圳', '0755-9123131', '张小明', '13812312312321312', '中国银行', '654431331343413', '213123@sina.com', '430000', '1');
INSERT INTO `bus_customer` VALUES ('3', '快七超市', '430000', '武汉', '027-11011011', '雷生', '13434134131', '招商银行', '6543123341334133', '6666@66.com', '545341', '1');

-- ----------------------------
-- Table structure for `bus_goods`
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) DEFAULT NULL,
  `produceplace` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `goodspackage` varchar(255) DEFAULT NULL,
  `productcode` varchar(255) DEFAULT NULL,
  `promitcode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `dangernum` int(11) DEFAULT NULL,
  `goodsimg` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sq0btr2v2lq8gt8b4gb8tlk0i` (`providerid`) USING BTREE,
  CONSTRAINT `bus_goods_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_goods
-- ----------------------------
INSERT INTO `bus_goods` VALUES ('1', '娃哈哈', '武汉', '120ML', '瓶', 'PH12345', 'PZ1234', '小孩子都爱的', '2', '488', '10', 'images/1.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('2', '旺旺雪饼[小包]', '仙桃', '包', '袋', 'PH12312312', 'PZ12312', '好吃不上火', '4', '1100', '10', 'images/13.jpg', '1', '1');
INSERT INTO `bus_goods` VALUES ('3', '旺旺大礼包', '仙桃', '盒', '盒', '11', '11', '111', '28', '1021', '100', 'images/3.jpg', '1', '1');
INSERT INTO `bus_goods` VALUES ('4', '娃哈哈', '武汉', '200ML', '瓶', '11', '111', '12321', '3', '1100', '10', 'images/4.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('5', '娃哈哈', '武汉', '300ML', '瓶', '1234', '12321', '22221111', '3', '1000', '100', 'images/5.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('7', 'ff', 'f', 'f', '2', '2', '1', 'f', '2', '2', '23', '2020-02-24/133C9C9DB3FB4026A6E9E0C376D1AB6F.jpg', '1', '1');

-- ----------------------------
-- Table structure for `bus_inport`
-- ----------------------------
DROP TABLE IF EXISTS `bus_inport`;
CREATE TABLE `bus_inport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) DEFAULT NULL,
  `inporttime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `inportprice` double DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_1o4bujsyd2kl4iqw48fie224v` (`providerid`) USING BTREE,
  KEY `FK_ho29poeu4o2dxu4rg1ammeaql` (`goodsid`) USING BTREE,
  CONSTRAINT `bus_inport_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`),
  CONSTRAINT `bus_inport_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_inport
-- ----------------------------
INSERT INTO `bus_inport` VALUES ('1', '微信', '2018-05-07 00:00:00', '张三', '100', '备注', '3.5', '1', '1');
INSERT INTO `bus_inport` VALUES ('2', '支付宝', '2018-05-07 00:00:00', '张三', '1000', '无', '2.5', '3', '3');
INSERT INTO `bus_inport` VALUES ('3', '银联', '2018-05-07 00:00:00', '张三', '100', '1231', '111', '3', '3');
INSERT INTO `bus_inport` VALUES ('4', '银联', '2018-05-07 00:00:00', '张三', '1000', '无', '2', '3', '1');
INSERT INTO `bus_inport` VALUES ('5', '银联', '2018-05-07 00:00:00', '张三', '100', '无', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('6', '银联', '2018-05-07 00:00:00', '张三', '100', '1231', '2.5', '1', '2');
INSERT INTO `bus_inport` VALUES ('8', '支付宝', '2018-05-07 00:00:00', '张三', '100', '', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('10', '支付宝', '2018-08-07 17:17:57', '超级管理员', '100', 'sadfasfdsa', '1.5', '3', '1');
INSERT INTO `bus_inport` VALUES ('11', '支付宝', '2018-09-17 16:12:25', '超级管理员', '21', '21', '21', '1', '3');
INSERT INTO `bus_inport` VALUES ('12', '微信', '2018-12-25 16:48:24', '超级管理员', '100', '123213213', '12321321', '3', '1');

-- ----------------------------
-- Table structure for `bus_outport`
-- ----------------------------
DROP TABLE IF EXISTS `bus_outport`;
CREATE TABLE `bus_outport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `outputtime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `outportprice` double(10,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_outport
-- ----------------------------
INSERT INTO `bus_outport` VALUES ('1', '3', '微信', '2019-08-16 08:19:50', '超级管理员', '12321321.00', '1', '', '1');
INSERT INTO `bus_outport` VALUES ('2', '3', '微信', '2019-08-16 08:26:54', '超级管理员', '12321321.00', '11', '11', '1');

-- ----------------------------
-- Table structure for `bus_provider`
-- ----------------------------
DROP TABLE IF EXISTS `bus_provider`;
CREATE TABLE `bus_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `connectionperson` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_provider
-- ----------------------------
INSERT INTO `bus_provider` VALUES ('1', '旺旺食品', '434000', '仙桃', '0728-4124312', '小明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('2', '达利园食品', '430000', '汉川', '0728-4124312', '大明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('3', '娃哈哈集团', '513131', '杭州', '21312', '小晨', '12312', '建设银行', '512314141541', '123131', '312312', '1');

-- ----------------------------
-- Table structure for `bus_sales`
-- ----------------------------
DROP TABLE IF EXISTS `bus_sales`;
CREATE TABLE `bus_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `salestime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `saleprice` decimal(10,2) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_sales
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_salesback`
-- ----------------------------
DROP TABLE IF EXISTS `bus_salesback`;
CREATE TABLE `bus_salesback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `salesbacktime` datetime DEFAULT NULL,
  `salebackprice` double(10,2) DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_salesback
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `pid` int(11) DEFAULT NULL COMMENT '父级部门编号',
  `title` varchar(20) NOT NULL,
  `open` int(1) DEFAULT '0',
  `remark` varchar(30) DEFAULT NULL COMMENT '备注',
  `address` varchar(30) DEFAULT NULL COMMENT '地址',
  `available` int(1) NOT NULL DEFAULT '1' COMMENT '状态【0不可用，1可用】',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '总经办', '1', '大BOSS', '深圳', '1', '1', '2020-02-02 22:01:13');
INSERT INTO `sys_dept` VALUES ('2', '1', '销售部', '0', '销售总部', '北京', '1', '2', '2020-02-02 22:01:19');
INSERT INTO `sys_dept` VALUES ('3', '1', '运营部', '0', '运营总部', '北京', '1', '3', '2020-02-02 22:01:23');
INSERT INTO `sys_dept` VALUES ('4', '1', '生产部', '0', '生产总部', '北京', '1', '4', '2020-02-02 22:01:26');
INSERT INTO `sys_dept` VALUES ('5', '2', '销售一部', '0', '销售一部', '广州', '1', '5', '2020-02-02 22:01:29');
INSERT INTO `sys_dept` VALUES ('6', '2', '销售二部', '0', '销售二部', '广州', '1', '6', '2020-02-02 22:01:31');
INSERT INTO `sys_dept` VALUES ('7', '2', '销售三部', '0', '销售三部', '广州', '1', '7', '2020-02-02 22:06:23');
INSERT INTO `sys_dept` VALUES ('8', '3', '运营一部', '0', '运营一部', '上海', '1', '8', '2020-02-02 22:08:52');
INSERT INTO `sys_dept` VALUES ('9', '3', '运营二部', '0', '运营二部', '上海', '1', '9', '2020-02-02 22:08:55');
INSERT INTO `sys_dept` VALUES ('10', '4', '生产一部', '0', '生产一部', '杭州', '1', '10', '2020-02-02 22:08:58');
INSERT INTO `sys_dept` VALUES ('11', '4', '生产二部', '0', '生产二部', '杭州', '1', '11', '2020-02-02 22:09:01');
INSERT INTO `sys_dept` VALUES ('12', '2', '销售四部', '0', '销售四部', '天津', '1', '12', '2020-02-03 20:26:33');
INSERT INTO `sys_dept` VALUES ('15', '4', '生产3部', '0', '生产三部', '深圳', '1', '13', '2020-02-04 13:13:10');
INSERT INTO `sys_dept` VALUES ('18', '1', '测试部', '1', '测试总部', '深圳', '1', '16', '2020-02-04 15:24:17');
INSERT INTO `sys_dept` VALUES ('30', '4', 'nnn', '1', 'aaa', 'mmmm', '1', '25', '2020-02-07 12:21:46');
INSERT INTO `sys_dept` VALUES ('32', '18', '啊短发', '0', '撒点粉', 'asdf', '0', '26', '2020-02-08 18:47:38');
INSERT INTO `sys_dept` VALUES ('33', '18', '撒点粉', '0', '撒旦', 'asdf', '0', '27', '2020-02-08 18:47:50');
INSERT INTO `sys_dept` VALUES ('34', '18', '撒点粉', '0', '发送端发撒旦法', 'asdf', '0', '28', '2020-02-08 18:47:57');
INSERT INTO `sys_dept` VALUES ('35', '18', '丰富的高分段', '0', '撒点粉', '发的个地方', '0', '29', '2020-02-08 18:48:05');
INSERT INTO `sys_dept` VALUES ('36', '18', '谁的风格', '0', '是撒点粉', '的方式告诉', '0', '30', '2020-02-08 18:48:17');

-- ----------------------------
-- Table structure for `sys_loginfo`
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginfo`;
CREATE TABLE `sys_loginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL,
  `loginip` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_loginfo
-- ----------------------------
INSERT INTO `sys_loginfo` VALUES ('11', '超级管理员-system', '127.0.0.1', '2018-12-22 09:46:56');
INSERT INTO `sys_loginfo` VALUES ('12', '超级管理员-system', '127.0.0.1', '2018-12-22 09:48:29');
INSERT INTO `sys_loginfo` VALUES ('13', '超级管理员-system', '127.0.0.1', '2018-12-22 09:49:13');
INSERT INTO `sys_loginfo` VALUES ('14', '超级管理员-system', '127.0.0.1', '2018-12-22 09:49:57');
INSERT INTO `sys_loginfo` VALUES ('16', '超级管理员-system', '127.0.0.1', '2018-12-22 10:21:53');
INSERT INTO `sys_loginfo` VALUES ('17', '超级管理员-system', '127.0.0.1', '2018-12-22 10:38:25');
INSERT INTO `sys_loginfo` VALUES ('18', '超级管理员-system', '127.0.0.1', '2018-12-22 10:49:21');
INSERT INTO `sys_loginfo` VALUES ('19', '超级管理员-system', '127.0.0.1', '2018-12-22 14:01:42');
INSERT INTO `sys_loginfo` VALUES ('20', '超级管理员-system', '127.0.0.1', '2018-12-22 14:19:48');
INSERT INTO `sys_loginfo` VALUES ('21', '超级管理员-system', '127.0.0.1', '2018-12-22 14:45:29');
INSERT INTO `sys_loginfo` VALUES ('22', '超级管理员-system', '127.0.0.1', '2018-12-22 15:58:05');
INSERT INTO `sys_loginfo` VALUES ('23', '超级管理员-system', '127.0.0.1', '2018-12-22 16:40:53');
INSERT INTO `sys_loginfo` VALUES ('24', '超级管理员-system', '127.0.0.1', '2018-12-22 17:12:01');
INSERT INTO `sys_loginfo` VALUES ('25', '超级管理员-system', '127.0.0.1', '2018-12-24 09:19:15');
INSERT INTO `sys_loginfo` VALUES ('26', '超级管理员-system', '127.0.0.1', '2018-12-24 09:37:28');
INSERT INTO `sys_loginfo` VALUES ('27', '超级管理员-system', '127.0.0.1', '2018-12-24 09:46:51');
INSERT INTO `sys_loginfo` VALUES ('28', '超级管理员-system', '127.0.0.1', '2018-12-24 09:50:40');
INSERT INTO `sys_loginfo` VALUES ('29', '超级管理员-system', '127.0.0.1', '2018-12-24 09:52:52');
INSERT INTO `sys_loginfo` VALUES ('30', '超级管理员-system', '127.0.0.1', '2018-12-24 10:00:26');
INSERT INTO `sys_loginfo` VALUES ('31', '超级管理员-system', '127.0.0.1', '2018-12-24 10:10:58');
INSERT INTO `sys_loginfo` VALUES ('32', '超级管理员-system', '127.0.0.1', '2018-12-24 10:21:28');
INSERT INTO `sys_loginfo` VALUES ('33', '超级管理员-system', '127.0.0.1', '2018-12-24 11:22:27');
INSERT INTO `sys_loginfo` VALUES ('34', '超级管理员-system', '127.0.0.1', '2018-12-24 11:35:28');
INSERT INTO `sys_loginfo` VALUES ('35', '超级管理员-system', '127.0.0.1', '2018-12-24 14:05:28');
INSERT INTO `sys_loginfo` VALUES ('36', '超级管理员-system', '127.0.0.1', '2018-12-24 15:16:29');
INSERT INTO `sys_loginfo` VALUES ('37', '李四-ls', '127.0.0.1', '2018-12-24 15:16:50');
INSERT INTO `sys_loginfo` VALUES ('38', '王五-ww', '127.0.0.1', '2018-12-24 15:17:36');
INSERT INTO `sys_loginfo` VALUES ('39', '赵六-zl', '127.0.0.1', '2018-12-24 15:17:47');
INSERT INTO `sys_loginfo` VALUES ('40', '孙七-sq', '127.0.0.1', '2018-12-24 15:17:58');
INSERT INTO `sys_loginfo` VALUES ('41', '刘八-lb', '127.0.0.1', '2018-12-24 15:18:09');
INSERT INTO `sys_loginfo` VALUES ('42', '超级管理员-system', '127.0.0.1', '2018-12-24 15:34:59');
INSERT INTO `sys_loginfo` VALUES ('43', '超级管理员-system', '127.0.0.1', '2018-12-24 15:35:09');
INSERT INTO `sys_loginfo` VALUES ('44', '刘八-lb', '127.0.0.1', '2018-12-24 15:36:09');
INSERT INTO `sys_loginfo` VALUES ('45', '刘八-lb', '127.0.0.1', '2018-12-24 15:42:58');
INSERT INTO `sys_loginfo` VALUES ('46', '刘八-lb', '127.0.0.1', '2018-12-24 15:43:04');
INSERT INTO `sys_loginfo` VALUES ('47', '超级管理员-system', '127.0.0.1', '2018-12-24 15:46:01');
INSERT INTO `sys_loginfo` VALUES ('48', '超级管理员-system', '127.0.0.1', '2018-12-24 17:03:54');
INSERT INTO `sys_loginfo` VALUES ('49', '超级管理员-system', '127.0.0.1', '2018-12-24 17:26:32');
INSERT INTO `sys_loginfo` VALUES ('50', '超级管理员-system', '127.0.0.1', '2018-12-25 09:07:42');
INSERT INTO `sys_loginfo` VALUES ('51', '超级管理员-system', '127.0.0.1', '2018-12-25 09:16:27');
INSERT INTO `sys_loginfo` VALUES ('52', '超级管理员-system', '127.0.0.1', '2018-12-25 09:59:03');
INSERT INTO `sys_loginfo` VALUES ('53', '超级管理员-system', '127.0.0.1', '2018-12-25 10:05:13');
INSERT INTO `sys_loginfo` VALUES ('54', '超级管理员-system', '127.0.0.1', '2018-12-25 10:05:47');
INSERT INTO `sys_loginfo` VALUES ('55', '超级管理员-system', '127.0.0.1', '2018-12-25 10:11:17');
INSERT INTO `sys_loginfo` VALUES ('56', '超级管理员-system', '127.0.0.1', '2018-12-25 10:14:06');
INSERT INTO `sys_loginfo` VALUES ('57', '超级管理员-system', '127.0.0.1', '2018-12-25 10:36:16');
INSERT INTO `sys_loginfo` VALUES ('58', '超级管理员-system', '127.0.0.1', '2018-12-25 14:17:21');
INSERT INTO `sys_loginfo` VALUES ('59', '超级管理员-system', '127.0.0.1', '2018-12-25 14:20:00');
INSERT INTO `sys_loginfo` VALUES ('60', '超级管理员-system', '127.0.0.1', '2018-12-25 14:34:22');
INSERT INTO `sys_loginfo` VALUES ('61', '超级管理员-system', '127.0.0.1', '2018-12-25 14:34:27');
INSERT INTO `sys_loginfo` VALUES ('62', '超级管理员-system', '127.0.0.1', '2018-12-25 14:38:37');
INSERT INTO `sys_loginfo` VALUES ('63', '超级管理员-system', '127.0.0.1', '2018-12-25 14:50:37');
INSERT INTO `sys_loginfo` VALUES ('64', '超级管理员-system', '127.0.0.1', '2018-12-25 16:01:35');
INSERT INTO `sys_loginfo` VALUES ('65', '超级管理员-system', '127.0.0.1', '2018-12-25 16:25:28');
INSERT INTO `sys_loginfo` VALUES ('66', '超级管理员-system', '127.0.0.1', '2018-12-25 16:27:37');
INSERT INTO `sys_loginfo` VALUES ('67', '超级管理员-system', '127.0.0.1', '2018-12-25 16:28:28');
INSERT INTO `sys_loginfo` VALUES ('68', '超级管理员-system', '127.0.0.1', '2018-12-25 16:44:02');
INSERT INTO `sys_loginfo` VALUES ('69', '超级管理员-system', '127.0.0.1', '2018-12-25 16:47:55');
INSERT INTO `sys_loginfo` VALUES ('70', '超级管理员-system', '127.0.0.1', '2018-12-28 15:59:34');
INSERT INTO `sys_loginfo` VALUES ('71', '超级管理员-system', '127.0.0.1', '2018-12-28 17:27:16');
INSERT INTO `sys_loginfo` VALUES ('72', '超级管理员-system', '127.0.0.1', '2018-12-28 17:29:40');
INSERT INTO `sys_loginfo` VALUES ('73', '超级管理员-system', '127.0.0.1', '2018-12-28 17:51:10');
INSERT INTO `sys_loginfo` VALUES ('74', '超级管理员-system', '127.0.0.1', '2019-04-15 17:05:02');
INSERT INTO `sys_loginfo` VALUES ('75', '超级管理员-system', '127.0.0.1', '2019-04-15 17:05:12');
INSERT INTO `sys_loginfo` VALUES ('76', '超级管理员-system', '127.0.0.1', '2019-04-15 17:10:22');
INSERT INTO `sys_loginfo` VALUES ('77', '刘八-lb', '127.0.0.1', '2019-04-15 17:11:45');
INSERT INTO `sys_loginfo` VALUES ('78', '刘八-lb', '127.0.0.1', '2019-04-15 17:28:50');
INSERT INTO `sys_loginfo` VALUES ('79', '超级管理员-system', '127.0.0.1', '2019-04-15 17:29:13');
INSERT INTO `sys_loginfo` VALUES ('80', '刘八-lb', '127.0.0.1', '2019-04-15 17:30:59');
INSERT INTO `sys_loginfo` VALUES ('81', '刘八-lb', '127.0.0.1', '2019-04-15 17:32:42');
INSERT INTO `sys_loginfo` VALUES ('82', '刘八-lb', '127.0.0.1', '2019-04-15 17:33:48');
INSERT INTO `sys_loginfo` VALUES ('83', '刘八-lb', '127.0.0.1', '2019-04-15 17:34:17');
INSERT INTO `sys_loginfo` VALUES ('84', '超级管理员-system', '127.0.0.1', '2019-04-15 17:36:40');
INSERT INTO `sys_loginfo` VALUES ('85', '超级管理员-system', '127.0.0.1', '2019-04-15 17:47:21');
INSERT INTO `sys_loginfo` VALUES ('86', '超级管理员-system', '127.0.0.1', '2019-04-15 17:54:10');
INSERT INTO `sys_loginfo` VALUES ('87', '超级管理员-system', '127.0.0.1', '2019-04-15 17:55:52');
INSERT INTO `sys_loginfo` VALUES ('88', '超级管理员-system', '127.0.0.1', '2019-04-16 09:26:01');
INSERT INTO `sys_loginfo` VALUES ('89', '超级管理员-system', '127.0.0.1', '2019-04-16 09:26:25');
INSERT INTO `sys_loginfo` VALUES ('90', '超级管理员-system', '127.0.0.1', '2019-04-16 09:46:54');
INSERT INTO `sys_loginfo` VALUES ('91', '超级管理员-system', '127.0.0.1', '2019-04-16 10:07:48');
INSERT INTO `sys_loginfo` VALUES ('92', '超级管理员-system', '127.0.0.1', '2019-04-16 10:10:30');
INSERT INTO `sys_loginfo` VALUES ('93', '超级管理员-system', '127.0.0.1', '2019-04-16 10:14:29');
INSERT INTO `sys_loginfo` VALUES ('94', '超级管理员-system', '127.0.0.1', '2019-04-16 10:15:04');
INSERT INTO `sys_loginfo` VALUES ('95', '超级管理员-system', '127.0.0.1', '2019-04-16 10:15:58');
INSERT INTO `sys_loginfo` VALUES ('96', '超级管理员-system', '127.0.0.1', '2019-04-16 10:28:14');
INSERT INTO `sys_loginfo` VALUES ('97', '超级管理员-system', '127.0.0.1', '2019-04-16 10:32:42');
INSERT INTO `sys_loginfo` VALUES ('98', '超级管理员-system', '127.0.0.1', '2019-04-16 10:33:03');
INSERT INTO `sys_loginfo` VALUES ('99', '超级管理员-system', '127.0.0.1', '2019-04-16 11:02:01');
INSERT INTO `sys_loginfo` VALUES ('100', '超级管理员-system', '127.0.0.1', '2019-04-16 11:03:09');
INSERT INTO `sys_loginfo` VALUES ('101', '超级管理员-system', '127.0.0.1', '2019-04-16 11:13:42');
INSERT INTO `sys_loginfo` VALUES ('102', '超级管理员-system', '127.0.0.1', '2019-04-16 11:24:55');
INSERT INTO `sys_loginfo` VALUES ('104', '超级管理员-system', '127.0.0.1', '2019-08-14 01:11:34');
INSERT INTO `sys_loginfo` VALUES ('105', '超级管理员-system', '127.0.0.1', '2019-08-14 01:24:03');
INSERT INTO `sys_loginfo` VALUES ('106', '李四-ls', '127.0.0.1', '2019-08-14 01:25:47');
INSERT INTO `sys_loginfo` VALUES ('107', '李四-ls', '127.0.0.1', '2019-08-14 01:26:41');
INSERT INTO `sys_loginfo` VALUES ('108', '孙七-sq', '127.0.0.1', '2019-08-14 01:28:22');
INSERT INTO `sys_loginfo` VALUES ('109', '刘八-lb', '127.0.0.1', '2019-08-14 01:28:32');
INSERT INTO `sys_loginfo` VALUES ('110', '超级管理员-system', '127.0.0.1', '2019-08-14 01:46:18');
INSERT INTO `sys_loginfo` VALUES ('111', '超级管理员-system', '127.0.0.1', '2019-08-14 02:18:44');
INSERT INTO `sys_loginfo` VALUES ('112', '超级管理员-system', '127.0.0.1', '2019-08-14 02:32:06');
INSERT INTO `sys_loginfo` VALUES ('113', '李四-ls', '127.0.0.1', '2019-08-14 03:00:19');
INSERT INTO `sys_loginfo` VALUES ('114', '李四-ls', '127.0.0.1', '2019-08-14 03:00:56');
INSERT INTO `sys_loginfo` VALUES ('115', '李四-ls', '127.0.0.1', '2019-08-14 03:01:31');
INSERT INTO `sys_loginfo` VALUES ('116', '李四-ls', '127.0.0.1', '2019-08-14 03:01:39');
INSERT INTO `sys_loginfo` VALUES ('117', '李四-ls', '127.0.0.1', '2019-08-14 03:02:25');
INSERT INTO `sys_loginfo` VALUES ('118', '李四-ls', '127.0.0.1', '2019-08-14 03:04:57');
INSERT INTO `sys_loginfo` VALUES ('119', '李四-ls', '127.0.0.1', '2019-08-14 03:07:19');
INSERT INTO `sys_loginfo` VALUES ('120', '李四-ls', '127.0.0.1', '2019-08-14 03:07:54');
INSERT INTO `sys_loginfo` VALUES ('121', '超级管理员-system', '127.0.0.1', '2019-08-14 03:13:06');
INSERT INTO `sys_loginfo` VALUES ('122', '李四-ls', '127.0.0.1', '2019-08-14 03:14:46');
INSERT INTO `sys_loginfo` VALUES ('123', '超级管理员-system', '127.0.0.1', '2019-08-14 06:03:47');
INSERT INTO `sys_loginfo` VALUES ('124', '超级管理员-system', '127.0.0.1', '2019-08-14 07:20:12');
INSERT INTO `sys_loginfo` VALUES ('125', '超级管理员-system', '127.0.0.1', '2019-08-14 07:23:05');
INSERT INTO `sys_loginfo` VALUES ('126', '超级管理员-system', '127.0.0.1', '2019-08-14 07:25:30');
INSERT INTO `sys_loginfo` VALUES ('127', '超级管理员-system', '127.0.0.1', '2019-08-14 07:26:34');
INSERT INTO `sys_loginfo` VALUES ('128', '超级管理员-system', '127.0.0.1', '2019-08-14 07:27:22');
INSERT INTO `sys_loginfo` VALUES ('129', '超级管理员-system', '127.0.0.1', '2019-08-14 07:27:51');
INSERT INTO `sys_loginfo` VALUES ('130', '超级管理员-system', '127.0.0.1', '2019-08-14 08:22:05');
INSERT INTO `sys_loginfo` VALUES ('131', '超级管理员-system', '127.0.0.1', '2019-08-14 08:43:53');
INSERT INTO `sys_loginfo` VALUES ('132', '超级管理员-system', '127.0.0.1', '2019-08-14 08:45:55');
INSERT INTO `sys_loginfo` VALUES ('133', '超级管理员-system', '127.0.0.1', '2019-08-14 08:47:13');
INSERT INTO `sys_loginfo` VALUES ('134', '超级管理员-system', '127.0.0.1', '2019-08-14 09:35:20');
INSERT INTO `sys_loginfo` VALUES ('135', '超级管理员-system', '127.0.0.1', '2019-08-14 09:41:02');
INSERT INTO `sys_loginfo` VALUES ('136', '超级管理员-system', '127.0.0.1', '2019-08-14 09:44:04');
INSERT INTO `sys_loginfo` VALUES ('137', '超级管理员-system', '127.0.0.1', '2019-08-14 09:50:27');
INSERT INTO `sys_loginfo` VALUES ('138', '超级管理员-system', '127.0.0.1', '2019-08-14 09:56:57');
INSERT INTO `sys_loginfo` VALUES ('139', '超级管理员-system', '127.0.0.1', '2019-08-14 09:59:02');
INSERT INTO `sys_loginfo` VALUES ('140', '超级管理员-system', '127.0.0.1', '2019-08-16 01:05:37');
INSERT INTO `sys_loginfo` VALUES ('141', '超级管理员-system', '127.0.0.1', '2019-08-16 02:01:44');
INSERT INTO `sys_loginfo` VALUES ('142', '超级管理员-system', '127.0.0.1', '2019-08-16 02:05:57');
INSERT INTO `sys_loginfo` VALUES ('143', '超级管理员-system', '127.0.0.1', '2019-08-16 02:07:04');
INSERT INTO `sys_loginfo` VALUES ('144', '超级管理员-system', '127.0.0.1', '2019-08-16 02:20:02');
INSERT INTO `sys_loginfo` VALUES ('145', '超级管理员-system', '127.0.0.1', '2019-08-16 02:20:20');
INSERT INTO `sys_loginfo` VALUES ('146', '超级管理员-system', '127.0.0.1', '2019-08-16 02:21:42');
INSERT INTO `sys_loginfo` VALUES ('147', '超级管理员-system', '127.0.0.1', '2019-08-16 03:37:37');
INSERT INTO `sys_loginfo` VALUES ('148', '超级管理员-system', '127.0.0.1', '2019-08-16 03:52:40');
INSERT INTO `sys_loginfo` VALUES ('149', '超级管理员-system', '127.0.0.1', '2019-08-16 03:59:37');
INSERT INTO `sys_loginfo` VALUES ('150', '超级管理员-system', '127.0.0.1', '2019-08-16 06:11:45');
INSERT INTO `sys_loginfo` VALUES ('151', '超级管理员-system', '127.0.0.1', '2019-08-16 06:23:27');
INSERT INTO `sys_loginfo` VALUES ('152', '超级管理员-system', '127.0.0.1', '2019-08-16 06:50:31');
INSERT INTO `sys_loginfo` VALUES ('153', '超级管理员-system', '127.0.0.1', '2019-08-16 06:54:49');
INSERT INTO `sys_loginfo` VALUES ('154', '超级管理员-system', '127.0.0.1', '2019-08-16 07:00:48');
INSERT INTO `sys_loginfo` VALUES ('155', '超级管理员-system', '127.0.0.1', '2019-08-16 07:01:18');
INSERT INTO `sys_loginfo` VALUES ('156', '超级管理员-system', '127.0.0.1', '2019-08-16 07:03:35');
INSERT INTO `sys_loginfo` VALUES ('157', '超级管理员-system', '127.0.0.1', '2019-08-16 07:09:55');
INSERT INTO `sys_loginfo` VALUES ('158', '超级管理员-system', '127.0.0.1', '2019-08-16 07:46:09');
INSERT INTO `sys_loginfo` VALUES ('159', '超级管理员-system', '127.0.0.1', '2019-08-16 08:17:59');
INSERT INTO `sys_loginfo` VALUES ('160', '超级管理员-system', '127.0.0.1', '2019-08-16 08:22:29');
INSERT INTO `sys_loginfo` VALUES ('161', '超级管理员-system', '127.0.0.1', '2019-08-16 08:23:32');
INSERT INTO `sys_loginfo` VALUES ('162', '超级管理员-system', '127.0.0.1', '2019-08-16 08:26:48');
INSERT INTO `sys_loginfo` VALUES ('163', '超级管理员-system', '127.0.0.1', '2019-08-16 08:31:19');
INSERT INTO `sys_loginfo` VALUES ('166', '超级管理员-system', '127.0.0.1', '2019-08-16 08:56:53');
INSERT INTO `sys_loginfo` VALUES ('167', '超级管理员-system', '127.0.0.1', '2019-08-16 08:57:42');
INSERT INTO `sys_loginfo` VALUES ('169', 'system', '0:0:0:0:0:0:0:1', '2020-02-02 14:45:12');
INSERT INTO `sys_loginfo` VALUES ('170', 'system', '0:0:0:0:0:0:0:1', '2020-02-02 14:57:16');
INSERT INTO `sys_loginfo` VALUES ('171', 'system', '0:0:0:0:0:0:0:1', '2020-02-02 14:59:14');
INSERT INTO `sys_loginfo` VALUES ('172', 'system', '127.0.0.1', '2020-02-02 15:02:45');
INSERT INTO `sys_loginfo` VALUES ('173', 'system', '127.0.0.1', '2020-02-02 15:39:48');
INSERT INTO `sys_loginfo` VALUES ('174', 'system', '127.0.0.1', '2020-02-02 16:12:22');
INSERT INTO `sys_loginfo` VALUES ('175', 'system', '127.0.0.1', '2020-02-02 16:15:40');
INSERT INTO `sys_loginfo` VALUES ('176', 'system', '127.0.0.1', '2020-02-02 16:24:35');
INSERT INTO `sys_loginfo` VALUES ('177', 'system', '127.0.0.1', '2020-02-02 17:45:13');
INSERT INTO `sys_loginfo` VALUES ('178', 'system', '127.0.0.1', '2020-02-02 17:46:29');
INSERT INTO `sys_loginfo` VALUES ('179', 'system', '127.0.0.1', '2020-02-02 18:41:56');
INSERT INTO `sys_loginfo` VALUES ('180', 'system', '127.0.0.1', '2020-02-02 19:03:49');
INSERT INTO `sys_loginfo` VALUES ('181', 'system', '127.0.0.1', '2020-02-02 19:44:36');
INSERT INTO `sys_loginfo` VALUES ('182', 'system', '127.0.0.1', '2020-02-02 19:51:45');
INSERT INTO `sys_loginfo` VALUES ('183', 'system', '127.0.0.1', '2020-02-02 21:20:34');
INSERT INTO `sys_loginfo` VALUES ('184', 'system', '127.0.0.1', '2020-02-02 23:05:35');
INSERT INTO `sys_loginfo` VALUES ('185', 'system', '127.0.0.1', '2020-02-02 23:52:01');
INSERT INTO `sys_loginfo` VALUES ('186', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 13:48:32');
INSERT INTO `sys_loginfo` VALUES ('187', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 14:28:01');
INSERT INTO `sys_loginfo` VALUES ('188', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 14:38:47');
INSERT INTO `sys_loginfo` VALUES ('189', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 14:45:07');
INSERT INTO `sys_loginfo` VALUES ('190', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 15:55:10');
INSERT INTO `sys_loginfo` VALUES ('191', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 16:34:34');
INSERT INTO `sys_loginfo` VALUES ('192', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 17:35:41');
INSERT INTO `sys_loginfo` VALUES ('193', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 18:55:37');
INSERT INTO `sys_loginfo` VALUES ('194', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 19:08:05');
INSERT INTO `sys_loginfo` VALUES ('195', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 19:13:18');
INSERT INTO `sys_loginfo` VALUES ('196', 'system', '127.0.0.1', '2020-02-03 19:13:32');
INSERT INTO `sys_loginfo` VALUES ('197', 'system', '127.0.0.1', '2020-02-03 19:21:33');
INSERT INTO `sys_loginfo` VALUES ('198', 'system', '127.0.0.1', '2020-02-03 19:23:45');
INSERT INTO `sys_loginfo` VALUES ('199', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 19:25:00');
INSERT INTO `sys_loginfo` VALUES ('200', 'system', '127.0.0.1', '2020-02-03 19:27:16');
INSERT INTO `sys_loginfo` VALUES ('201', 'system', '127.0.0.1', '2020-02-03 19:32:37');
INSERT INTO `sys_loginfo` VALUES ('202', 'system', '127.0.0.1', '2020-02-03 19:37:34');
INSERT INTO `sys_loginfo` VALUES ('203', 'system', '127.0.0.1', '2020-02-03 19:46:04');
INSERT INTO `sys_loginfo` VALUES ('204', 'system', '127.0.0.1', '2020-02-03 20:02:54');
INSERT INTO `sys_loginfo` VALUES ('205', 'system', '127.0.0.1', '2020-02-03 20:13:36');
INSERT INTO `sys_loginfo` VALUES ('206', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 21:42:35');
INSERT INTO `sys_loginfo` VALUES ('207', 'system', '0:0:0:0:0:0:0:1', '2020-02-03 21:51:17');
INSERT INTO `sys_loginfo` VALUES ('208', 'system', '127.0.0.1', '2020-02-04 13:11:09');
INSERT INTO `sys_loginfo` VALUES ('209', 'system', '127.0.0.1', '2020-02-04 14:08:41');
INSERT INTO `sys_loginfo` VALUES ('210', 'system', '127.0.0.1', '2020-02-04 14:11:14');
INSERT INTO `sys_loginfo` VALUES ('211', 'system', '127.0.0.1', '2020-02-04 14:22:50');
INSERT INTO `sys_loginfo` VALUES ('212', 'system', '127.0.0.1', '2020-02-04 15:23:27');
INSERT INTO `sys_loginfo` VALUES ('213', 'system', '127.0.0.1', '2020-02-04 17:31:05');
INSERT INTO `sys_loginfo` VALUES ('214', 'system', '127.0.0.1', '2020-02-04 20:02:07');
INSERT INTO `sys_loginfo` VALUES ('215', 'system', '127.0.0.1', '2020-02-04 20:22:54');
INSERT INTO `sys_loginfo` VALUES ('216', 'system', '127.0.0.1', '2020-02-04 20:32:37');
INSERT INTO `sys_loginfo` VALUES ('217', 'system', '127.0.0.1', '2020-02-04 20:45:52');
INSERT INTO `sys_loginfo` VALUES ('218', 'system', '127.0.0.1', '2020-02-04 21:15:03');
INSERT INTO `sys_loginfo` VALUES ('219', 'system', '127.0.0.1', '2020-02-04 21:18:03');
INSERT INTO `sys_loginfo` VALUES ('220', 'system', '127.0.0.1', '2020-02-04 22:27:16');
INSERT INTO `sys_loginfo` VALUES ('221', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-05 09:15:54');
INSERT INTO `sys_loginfo` VALUES ('222', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-05 10:26:51');
INSERT INTO `sys_loginfo` VALUES ('223', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-06 10:02:28');
INSERT INTO `sys_loginfo` VALUES ('224', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-06 10:24:40');
INSERT INTO `sys_loginfo` VALUES ('225', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-06 11:27:34');
INSERT INTO `sys_loginfo` VALUES ('226', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-06 11:48:27');
INSERT INTO `sys_loginfo` VALUES ('227', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 09:48:46');
INSERT INTO `sys_loginfo` VALUES ('228', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 10:09:02');
INSERT INTO `sys_loginfo` VALUES ('229', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 10:18:07');
INSERT INTO `sys_loginfo` VALUES ('230', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 10:35:01');
INSERT INTO `sys_loginfo` VALUES ('231', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 10:41:36');
INSERT INTO `sys_loginfo` VALUES ('232', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 11:17:04');
INSERT INTO `sys_loginfo` VALUES ('233', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 11:21:11');
INSERT INTO `sys_loginfo` VALUES ('234', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 11:39:08');
INSERT INTO `sys_loginfo` VALUES ('235', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 11:45:06');
INSERT INTO `sys_loginfo` VALUES ('236', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 11:48:09');
INSERT INTO `sys_loginfo` VALUES ('237', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 11:50:00');
INSERT INTO `sys_loginfo` VALUES ('238', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 11:51:13');
INSERT INTO `sys_loginfo` VALUES ('239', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 11:56:23');
INSERT INTO `sys_loginfo` VALUES ('240', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 11:57:15');
INSERT INTO `sys_loginfo` VALUES ('241', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 12:03:58');
INSERT INTO `sys_loginfo` VALUES ('242', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 12:05:55');
INSERT INTO `sys_loginfo` VALUES ('243', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 12:11:38');
INSERT INTO `sys_loginfo` VALUES ('244', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 12:11:38');
INSERT INTO `sys_loginfo` VALUES ('245', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-07 12:16:12');
INSERT INTO `sys_loginfo` VALUES ('246', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-08 09:33:53');
INSERT INTO `sys_loginfo` VALUES ('247', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-08 11:11:46');
INSERT INTO `sys_loginfo` VALUES ('248', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-08 16:21:00');
INSERT INTO `sys_loginfo` VALUES ('249', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-08 17:00:54');
INSERT INTO `sys_loginfo` VALUES ('250', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-08 17:18:26');
INSERT INTO `sys_loginfo` VALUES ('251', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-08 18:01:06');
INSERT INTO `sys_loginfo` VALUES ('252', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-08 19:15:24');
INSERT INTO `sys_loginfo` VALUES ('253', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-09 10:24:42');
INSERT INTO `sys_loginfo` VALUES ('254', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-09 10:27:42');
INSERT INTO `sys_loginfo` VALUES ('255', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-09 10:31:43');
INSERT INTO `sys_loginfo` VALUES ('256', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-09 10:38:09');
INSERT INTO `sys_loginfo` VALUES ('257', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-09 10:40:34');
INSERT INTO `sys_loginfo` VALUES ('258', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-09 10:44:53');
INSERT INTO `sys_loginfo` VALUES ('259', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-09 11:19:53');
INSERT INTO `sys_loginfo` VALUES ('260', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-09 11:36:20');
INSERT INTO `sys_loginfo` VALUES ('261', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-09 11:55:44');
INSERT INTO `sys_loginfo` VALUES ('262', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-09 11:56:21');
INSERT INTO `sys_loginfo` VALUES ('263', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-09 18:17:37');
INSERT INTO `sys_loginfo` VALUES ('264', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 09:49:37');
INSERT INTO `sys_loginfo` VALUES ('265', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 09:54:58');
INSERT INTO `sys_loginfo` VALUES ('266', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 10:03:02');
INSERT INTO `sys_loginfo` VALUES ('267', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 10:44:24');
INSERT INTO `sys_loginfo` VALUES ('268', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 11:00:17');
INSERT INTO `sys_loginfo` VALUES ('269', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 11:05:03');
INSERT INTO `sys_loginfo` VALUES ('270', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 15:25:32');
INSERT INTO `sys_loginfo` VALUES ('271', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 15:31:06');
INSERT INTO `sys_loginfo` VALUES ('272', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 16:20:36');
INSERT INTO `sys_loginfo` VALUES ('273', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 16:24:42');
INSERT INTO `sys_loginfo` VALUES ('274', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 17:39:07');
INSERT INTO `sys_loginfo` VALUES ('275', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-10 19:07:00');
INSERT INTO `sys_loginfo` VALUES ('276', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 09:56:26');
INSERT INTO `sys_loginfo` VALUES ('277', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 10:14:25');
INSERT INTO `sys_loginfo` VALUES ('278', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 11:25:38');
INSERT INTO `sys_loginfo` VALUES ('279', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 11:28:04');
INSERT INTO `sys_loginfo` VALUES ('280', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 11:28:58');
INSERT INTO `sys_loginfo` VALUES ('281', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 11:57:18');
INSERT INTO `sys_loginfo` VALUES ('282', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 11:58:11');
INSERT INTO `sys_loginfo` VALUES ('283', '超级管理员-system', '127.0.0.1', '2020-02-11 12:11:44');
INSERT INTO `sys_loginfo` VALUES ('284', '肖小梅-xiaoxiaomei', '0:0:0:0:0:0:0:1', '2020-02-11 12:13:43');
INSERT INTO `sys_loginfo` VALUES ('285', '肖小梅-xiaoxiaomei', '0:0:0:0:0:0:0:1', '2020-02-11 12:14:54');
INSERT INTO `sys_loginfo` VALUES ('286', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 12:15:07');
INSERT INTO `sys_loginfo` VALUES ('287', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 13:58:11');
INSERT INTO `sys_loginfo` VALUES ('288', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 14:13:08');
INSERT INTO `sys_loginfo` VALUES ('289', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 14:14:27');
INSERT INTO `sys_loginfo` VALUES ('290', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 14:30:59');
INSERT INTO `sys_loginfo` VALUES ('291', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 14:45:16');
INSERT INTO `sys_loginfo` VALUES ('292', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 14:47:23');
INSERT INTO `sys_loginfo` VALUES ('293', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 14:49:20');
INSERT INTO `sys_loginfo` VALUES ('294', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 14:54:42');
INSERT INTO `sys_loginfo` VALUES ('295', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 14:57:06');
INSERT INTO `sys_loginfo` VALUES ('296', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 15:02:18');
INSERT INTO `sys_loginfo` VALUES ('297', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 15:05:18');
INSERT INTO `sys_loginfo` VALUES ('298', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 15:42:25');
INSERT INTO `sys_loginfo` VALUES ('299', '超级管理员-system', '127.0.0.1', '2020-02-11 15:47:53');
INSERT INTO `sys_loginfo` VALUES ('300', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 19:27:27');
INSERT INTO `sys_loginfo` VALUES ('301', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 19:48:31');
INSERT INTO `sys_loginfo` VALUES ('302', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 19:51:31');
INSERT INTO `sys_loginfo` VALUES ('303', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-11 20:04:49');
INSERT INTO `sys_loginfo` VALUES ('304', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 09:32:53');
INSERT INTO `sys_loginfo` VALUES ('305', '爱的色放-aidesefang', '0:0:0:0:0:0:0:1', '2020-02-12 09:34:13');
INSERT INTO `sys_loginfo` VALUES ('306', '李四-ls', '0:0:0:0:0:0:0:1', '2020-02-12 09:34:34');
INSERT INTO `sys_loginfo` VALUES ('307', '王五-ww', '0:0:0:0:0:0:0:1', '2020-02-12 09:34:44');
INSERT INTO `sys_loginfo` VALUES ('308', '赵六-zl', '0:0:0:0:0:0:0:1', '2020-02-12 09:35:43');
INSERT INTO `sys_loginfo` VALUES ('309', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 09:36:12');
INSERT INTO `sys_loginfo` VALUES ('310', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 10:31:47');
INSERT INTO `sys_loginfo` VALUES ('311', '刘八-lb', '0:0:0:0:0:0:0:1', '2020-02-12 10:32:25');
INSERT INTO `sys_loginfo` VALUES ('312', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 10:53:06');
INSERT INTO `sys_loginfo` VALUES ('313', '刘八-lb', '0:0:0:0:0:0:0:1', '2020-02-12 10:53:17');
INSERT INTO `sys_loginfo` VALUES ('314', '刘八-lb', '0:0:0:0:0:0:0:1', '2020-02-12 10:55:34');
INSERT INTO `sys_loginfo` VALUES ('315', '刘八-lb', '0:0:0:0:0:0:0:1', '2020-02-12 11:00:47');
INSERT INTO `sys_loginfo` VALUES ('316', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 11:03:29');
INSERT INTO `sys_loginfo` VALUES ('317', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 11:39:18');
INSERT INTO `sys_loginfo` VALUES ('318', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 13:52:39');
INSERT INTO `sys_loginfo` VALUES ('319', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 13:55:49');
INSERT INTO `sys_loginfo` VALUES ('320', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 13:57:54');
INSERT INTO `sys_loginfo` VALUES ('321', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 14:00:00');
INSERT INTO `sys_loginfo` VALUES ('322', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 14:04:26');
INSERT INTO `sys_loginfo` VALUES ('323', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 14:57:21');
INSERT INTO `sys_loginfo` VALUES ('324', '超级管理员-system', '127.0.0.1', '2020-02-12 14:59:10');
INSERT INTO `sys_loginfo` VALUES ('326', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 16:18:48');
INSERT INTO `sys_loginfo` VALUES ('328', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 16:25:55');
INSERT INTO `sys_loginfo` VALUES ('329', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-12 17:10:08');
INSERT INTO `sys_loginfo` VALUES ('330', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-13 17:40:27');
INSERT INTO `sys_loginfo` VALUES ('331', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-13 19:24:20');
INSERT INTO `sys_loginfo` VALUES ('332', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 06:44:17');
INSERT INTO `sys_loginfo` VALUES ('333', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 14:48:32');
INSERT INTO `sys_loginfo` VALUES ('334', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 14:52:08');
INSERT INTO `sys_loginfo` VALUES ('335', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 14:56:00');
INSERT INTO `sys_loginfo` VALUES ('336', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 14:56:19');
INSERT INTO `sys_loginfo` VALUES ('337', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 14:57:08');
INSERT INTO `sys_loginfo` VALUES ('338', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 15:01:51');
INSERT INTO `sys_loginfo` VALUES ('339', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 16:18:53');
INSERT INTO `sys_loginfo` VALUES ('340', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 17:15:51');
INSERT INTO `sys_loginfo` VALUES ('341', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 17:30:31');
INSERT INTO `sys_loginfo` VALUES ('342', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 17:46:32');
INSERT INTO `sys_loginfo` VALUES ('343', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 18:03:16');
INSERT INTO `sys_loginfo` VALUES ('344', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 18:09:10');
INSERT INTO `sys_loginfo` VALUES ('345', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 18:10:15');
INSERT INTO `sys_loginfo` VALUES ('346', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 19:33:16');
INSERT INTO `sys_loginfo` VALUES ('347', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 19:36:00');
INSERT INTO `sys_loginfo` VALUES ('348', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 20:00:14');
INSERT INTO `sys_loginfo` VALUES ('349', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 20:19:15');
INSERT INTO `sys_loginfo` VALUES ('350', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 20:45:23');
INSERT INTO `sys_loginfo` VALUES ('351', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-18 21:10:29');
INSERT INTO `sys_loginfo` VALUES ('352', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-19 09:18:08');
INSERT INTO `sys_loginfo` VALUES ('353', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-19 09:46:43');
INSERT INTO `sys_loginfo` VALUES ('354', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-19 14:36:33');
INSERT INTO `sys_loginfo` VALUES ('355', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-19 15:11:25');
INSERT INTO `sys_loginfo` VALUES ('356', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-19 16:08:36');
INSERT INTO `sys_loginfo` VALUES ('357', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-19 16:11:15');
INSERT INTO `sys_loginfo` VALUES ('358', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-19 17:11:50');
INSERT INTO `sys_loginfo` VALUES ('359', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-19 19:43:47');
INSERT INTO `sys_loginfo` VALUES ('360', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-19 19:49:05');
INSERT INTO `sys_loginfo` VALUES ('361', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-19 21:26:33');
INSERT INTO `sys_loginfo` VALUES ('362', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-21 09:56:10');
INSERT INTO `sys_loginfo` VALUES ('363', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-21 14:53:58');
INSERT INTO `sys_loginfo` VALUES ('364', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-21 16:05:15');
INSERT INTO `sys_loginfo` VALUES ('365', '超级管理员-system', '127.0.0.1', '2020-02-21 16:38:57');
INSERT INTO `sys_loginfo` VALUES ('366', '速度-sudu', '0:0:0:0:0:0:0:1', '2020-02-21 16:49:59');
INSERT INTO `sys_loginfo` VALUES ('367', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-23 09:43:15');
INSERT INTO `sys_loginfo` VALUES ('368', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-23 09:54:00');
INSERT INTO `sys_loginfo` VALUES ('369', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-23 10:01:21');
INSERT INTO `sys_loginfo` VALUES ('370', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-23 10:04:52');
INSERT INTO `sys_loginfo` VALUES ('371', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-23 13:44:21');
INSERT INTO `sys_loginfo` VALUES ('372', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-23 14:01:35');
INSERT INTO `sys_loginfo` VALUES ('373', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-23 14:51:39');
INSERT INTO `sys_loginfo` VALUES ('374', '李四-ls', '0:0:0:0:0:0:0:1', '2020-02-23 14:53:43');
INSERT INTO `sys_loginfo` VALUES ('375', '王五-ww', '0:0:0:0:0:0:0:1', '2020-02-23 14:53:54');
INSERT INTO `sys_loginfo` VALUES ('376', '刘八-lb', '0:0:0:0:0:0:0:1', '2020-02-23 15:26:56');
INSERT INTO `sys_loginfo` VALUES ('377', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-23 16:49:07');
INSERT INTO `sys_loginfo` VALUES ('378', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-23 21:01:41');
INSERT INTO `sys_loginfo` VALUES ('379', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-23 21:15:57');
INSERT INTO `sys_loginfo` VALUES ('380', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-23 21:17:21');
INSERT INTO `sys_loginfo` VALUES ('381', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 09:48:24');
INSERT INTO `sys_loginfo` VALUES ('382', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 13:54:46');
INSERT INTO `sys_loginfo` VALUES ('383', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 14:12:02');
INSERT INTO `sys_loginfo` VALUES ('384', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 14:14:12');
INSERT INTO `sys_loginfo` VALUES ('385', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 14:19:11');
INSERT INTO `sys_loginfo` VALUES ('386', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 14:20:17');
INSERT INTO `sys_loginfo` VALUES ('387', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 14:24:31');
INSERT INTO `sys_loginfo` VALUES ('388', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 14:25:20');
INSERT INTO `sys_loginfo` VALUES ('389', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 14:29:59');
INSERT INTO `sys_loginfo` VALUES ('390', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 14:32:20');
INSERT INTO `sys_loginfo` VALUES ('391', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 14:34:23');
INSERT INTO `sys_loginfo` VALUES ('392', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 14:37:24');
INSERT INTO `sys_loginfo` VALUES ('393', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 14:43:20');
INSERT INTO `sys_loginfo` VALUES ('394', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 15:47:15');
INSERT INTO `sys_loginfo` VALUES ('395', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 16:04:55');
INSERT INTO `sys_loginfo` VALUES ('396', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 16:19:12');
INSERT INTO `sys_loginfo` VALUES ('397', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 16:25:33');
INSERT INTO `sys_loginfo` VALUES ('398', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 16:26:46');
INSERT INTO `sys_loginfo` VALUES ('399', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 16:28:05');
INSERT INTO `sys_loginfo` VALUES ('400', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 16:29:54');
INSERT INTO `sys_loginfo` VALUES ('401', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-02-24 16:34:51');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `createtime` datetime DEFAULT NULL,
  `opername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '关于系统V1.3更新公告', '2', '2018-08-07 00:00:00', '管理员');
INSERT INTO `sys_notice` VALUES ('10', '关于系统V1.2更新公告', '12312312<img src=\"/resources/layui/images/face/42.gif\" alt=\"[抓狂]\">', '2018-08-07 00:00:00', '超级管理员');
INSERT INTO `sys_notice` VALUES ('11', '关于系统V1.1更新公告', '21321321321<img src=\"/resources/layui/images/face/18.gif\" alt=\"[右哼哼]\">', '2018-08-07 00:00:00', '超级管理员');
INSERT INTO `sys_notice` VALUES ('12', 'fdsa氛围让24', 'fdsafg<img src=\"http://127.0.0.1:8080/resources/layui/images/face/2.gif\" alt=\"[哈哈]\">', '2020-02-02 18:57:14', '超级管理员');
INSERT INTO `sys_notice` VALUES ('13', 'hgkljdhsak', '范德萨洛凯股份的挥洒感觉到&nbsp; 地方萨芬荔湾区安徽省大名', '2020-02-02 19:11:51', '超级管理员');
INSERT INTO `sys_notice` VALUES ('14', 'fdsa', 'rdsfadsa', '2020-02-02 19:20:36', '超级管理员');
INSERT INTO `sys_notice` VALUES ('15', 'fdsa', 'fds', '2020-02-02 19:20:59', '超级管理员');
INSERT INTO `sys_notice` VALUES ('16', 'fdsa', 'dsgas', '2020-02-02 19:21:12', '超级管理员');
INSERT INTO `sys_notice` VALUES ('17', 'fdsa11', 'fds<img src=\"http://127.0.0.1:8080/resources/layui/images/face/1.gif\" alt=\"[嘻嘻]\">fdsafdsaewrq而奋斗未发生', '2020-02-02 19:52:27', '超级管理员');
INSERT INTO `sys_notice` VALUES ('19', 'fdsafewfdsa', '56465456', '2020-02-02 20:05:26', '超级管理员');
INSERT INTO `sys_notice` VALUES ('23', 'fdsae', 'fxsafeaewf', '2020-02-02 20:20:07', '超级管理员');
INSERT INTO `sys_notice` VALUES ('26', 'fsdf', 'SDAFDASF', '2020-02-18 20:00:24', '超级管理员');
INSERT INTO `sys_notice` VALUES ('27', 'FDSA', 'FDSAF', '2020-02-18 20:10:50', '超级管理员');

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '权限类型[menu/permission]',
  `title` varchar(255) DEFAULT NULL,
  `percode` varchar(255) DEFAULT NULL COMMENT '权限编码[只有type= permission才有  user:view]',
  `icon` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', 'menu', '进销存管理系统', null, '&#xe68e;', '', '', '1', '1', '1');
INSERT INTO `sys_permission` VALUES ('2', '1', 'menu', '基础管理', null, '&#xe857;', '', '', '0', '2', '1');
INSERT INTO `sys_permission` VALUES ('3', '1', 'menu', '进货管理', null, '&#xe645;', '', null, '0', '3', '1');
INSERT INTO `sys_permission` VALUES ('4', '1', 'menu', '销售管理', null, '&#xe611;', '', '', '0', '4', '1');
INSERT INTO `sys_permission` VALUES ('5', '1', 'menu', '系统管理', null, '&#xe614;', '', '', '1', '5', '1');
INSERT INTO `sys_permission` VALUES ('6', '1', 'menu', '其它管理', null, '&#xe628;', '', '', '0', '6', '1');
INSERT INTO `sys_permission` VALUES ('7', '2', 'menu', '客户管理', null, '&#xe651;', '/bus/toCustomerManager', '', '0', '7', '1');
INSERT INTO `sys_permission` VALUES ('8', '2', 'menu', '供应商管理', null, '&#xe658;', '/bus/toProviderManager', '', '0', '8', '1');
INSERT INTO `sys_permission` VALUES ('9', '2', 'menu', '商品管理', null, '&#xe657;', '/bus/toGoodsManager', '', '0', '9', '1');
INSERT INTO `sys_permission` VALUES ('10', '3', 'menu', '商品进货', null, '&#xe756;', '/bus/toInportManager', '', '0', '10', '1');
INSERT INTO `sys_permission` VALUES ('11', '3', 'menu', '商品退货查询', null, '&#xe65a;', '/bus/toOutportManager', '', '0', '11', '1');
INSERT INTO `sys_permission` VALUES ('12', '4', 'menu', '商品销售', null, '&#xe65b;', '/bus/toSalesManager', '', '0', '12', '1');
INSERT INTO `sys_permission` VALUES ('13', '4', 'menu', '销售退货查询', null, '&#xe770;', '/bus/toSalesbackManager', '', '0', '13', '1');
INSERT INTO `sys_permission` VALUES ('14', '5', 'menu', '部门管理', null, '&#xe770;', '/sys/toDeptManager', '', '0', '14', '1');
INSERT INTO `sys_permission` VALUES ('15', '5', 'menu', '菜单管理', null, '&#xe857;', '/sys/toMenuManager', '', '0', '15', '1');
INSERT INTO `sys_permission` VALUES ('16', '5', 'menu', '权限管理', '', '&#xe857;', '/sys/toPermissionManager', '', '0', '16', '1');
INSERT INTO `sys_permission` VALUES ('17', '5', 'menu', '角色管理', '', '&#xe650;', '/sys/toRoleManager', '', '0', '17', '1');
INSERT INTO `sys_permission` VALUES ('18', '5', 'menu', '用户管理', '', '&#xe612;', '/sys/toUserManager', '', '0', '18', '1');
INSERT INTO `sys_permission` VALUES ('21', '6', 'menu', '登陆日志', null, '&#xe675;', '/sys/toLoginfoManager', '', '0', '21', '1');
INSERT INTO `sys_permission` VALUES ('22', '6', 'menu', '系统公告', null, '&#xe756;', '/sys/toNoticeManager', null, '0', '22', '1');
INSERT INTO `sys_permission` VALUES ('23', '6', 'menu', '图标管理', null, '&#xe670;', '../resources/page/icon.html', null, '0', '23', '1');
INSERT INTO `sys_permission` VALUES ('30', '14', 'permission', '添加部门', 'dept:create', '', null, null, '0', '24', '1');
INSERT INTO `sys_permission` VALUES ('31', '14', 'permission', '修改部门', 'dept:update', '', null, null, '0', '26', '1');
INSERT INTO `sys_permission` VALUES ('32', '14', 'permission', '删除部门', 'dept:delete', '', null, null, '0', '27', '1');
INSERT INTO `sys_permission` VALUES ('34', '15', 'permission', '添加菜单', 'menu:create', '', '', '', '0', '29', '1');
INSERT INTO `sys_permission` VALUES ('35', '15', 'permission', '修改菜单', 'menu:update', '', null, null, '0', '30', '1');
INSERT INTO `sys_permission` VALUES ('36', '15', 'permission', '删除菜单', 'menu:delete', '', null, null, '0', '31', '1');
INSERT INTO `sys_permission` VALUES ('38', '16', 'permission', '添加权限', 'permission:create', '', null, null, '0', '33', '1');
INSERT INTO `sys_permission` VALUES ('39', '16', 'permission', '修改权限', 'permission:update', '', null, null, '0', '34', '1');
INSERT INTO `sys_permission` VALUES ('40', '16', 'permission', '删除权限', 'permission:delete', '', null, null, '0', '35', '1');
INSERT INTO `sys_permission` VALUES ('42', '17', 'permission', '添加角色', 'role:create', '', null, null, '0', '37', '1');
INSERT INTO `sys_permission` VALUES ('43', '17', 'permission', '修改角色', 'role:update', '', null, null, '0', '38', '1');
INSERT INTO `sys_permission` VALUES ('44', '17', 'permission', '角色删除', 'role:delete', '', null, null, '0', '39', '1');
INSERT INTO `sys_permission` VALUES ('46', '17', 'permission', '分配权限', 'role:selectPermission', '', null, null, '0', '41', '1');
INSERT INTO `sys_permission` VALUES ('47', '18', 'permission', '添加用户', 'user:create', '', null, null, '0', '42', '1');
INSERT INTO `sys_permission` VALUES ('48', '18', 'permission', '修改用户', 'user:update', '', null, null, '0', '43', '1');
INSERT INTO `sys_permission` VALUES ('49', '18', 'permission', '删除用户', 'user:delete', '', null, null, '0', '44', '1');
INSERT INTO `sys_permission` VALUES ('51', '18', 'permission', '用户分配角色', 'user:selectRole', '', null, null, '0', '46', '1');
INSERT INTO `sys_permission` VALUES ('52', '18', 'permission', '重置密码', 'user:resetPwd', null, null, null, '0', '47', '1');
INSERT INTO `sys_permission` VALUES ('53', '14', 'permission', '部门查询', 'dept:view', null, null, null, '0', '48', '1');
INSERT INTO `sys_permission` VALUES ('54', '15', 'permission', '菜单查询', 'menu:view', null, null, null, '0', '49', '1');
INSERT INTO `sys_permission` VALUES ('55', '16', 'permission', '权限查询', 'permission:view', null, null, null, '0', '50', '1');
INSERT INTO `sys_permission` VALUES ('56', '17', 'permission', '角色查询', 'role:view', null, null, null, '0', '51', '1');
INSERT INTO `sys_permission` VALUES ('57', '18', 'permission', '用户查询', 'user:view', null, null, null, '0', '52', '1');
INSERT INTO `sys_permission` VALUES ('68', '7', 'permission', '客户查询', 'customer:view', null, null, null, '0', '60', '1');
INSERT INTO `sys_permission` VALUES ('69', '7', 'permission', '客户添加', 'customer:create', null, null, null, '0', '61', '1');
INSERT INTO `sys_permission` VALUES ('70', '7', 'permission', '客户修改', 'customer:update', null, null, null, '0', '62', '1');
INSERT INTO `sys_permission` VALUES ('71', '7', 'permission', '客户删除', 'customer:delete', null, null, null, '0', '63', '1');
INSERT INTO `sys_permission` VALUES ('73', '21', 'permission', '日志查询', 'info:view', null, null, null, '0', '65', '1');
INSERT INTO `sys_permission` VALUES ('74', '21', 'permission', '日志删除', 'info:delete', null, null, null, '0', '66', '1');
INSERT INTO `sys_permission` VALUES ('75', '21', 'permission', '日志批量删除', 'info:batchdelete', null, null, null, '0', '67', '1');
INSERT INTO `sys_permission` VALUES ('76', '22', 'permission', '公告查询', 'notice:view', null, null, null, '0', '68', '1');
INSERT INTO `sys_permission` VALUES ('77', '22', 'permission', '公告添加', 'notice:create', null, null, null, '0', '69', '1');
INSERT INTO `sys_permission` VALUES ('78', '22', 'permission', '公告修改', 'notice:update', null, null, null, '0', '70', '1');
INSERT INTO `sys_permission` VALUES ('79', '22', 'permission', '公告删除', 'notice:delete', null, null, null, '0', '71', '1');
INSERT INTO `sys_permission` VALUES ('81', '8', 'permission', '供应商查询', 'provider:view', null, null, null, '0', '73', '1');
INSERT INTO `sys_permission` VALUES ('82', '8', 'permission', '供应商添加', 'provider:create', null, null, null, '0', '74', '1');
INSERT INTO `sys_permission` VALUES ('83', '8', 'permission', '供应商修改', 'provider:update', null, null, null, '0', '75', '1');
INSERT INTO `sys_permission` VALUES ('84', '8', 'permission', '供应商删除', 'provider:delete', null, null, null, '0', '76', '1');
INSERT INTO `sys_permission` VALUES ('86', '22', 'permission', '公告查看', 'notice:viewnotice', null, null, null, '0', '78', '1');
INSERT INTO `sys_permission` VALUES ('91', '9', 'permission', '商品查询', 'goods:view', null, null, null, '0', '79', '1');
INSERT INTO `sys_permission` VALUES ('92', '9', 'permission', '商品添加', 'goods:create', null, null, null, '0', '80', '1');
INSERT INTO `sys_permission` VALUES ('96', '6', 'permission', 'fdsa', 'fdsa', null, null, null, '0', '81', '1');
INSERT INTO `sys_permission` VALUES ('102', '9', 'permission', '商品修改', 'goods:update', null, null, null, '1', '82', '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '拥有所有菜单权限', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('4', '基础数据管理员', '基础数据管理员', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('5', '仓库管理员', '仓库管理员', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('6', '销售管理员', '销售管理员', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('7', '系统管理员', '系统管理员', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('11', 'fasdf', 'dsf', '1', '2020-02-19 21:45:15');

-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`rid`) USING BTREE,
  KEY `FK_tcsr9ucxypb3ce1q5qngsfk33` (`rid`) USING BTREE,
  CONSTRAINT `sys_role_permission_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_role_permission_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1');
INSERT INTO `sys_role_permission` VALUES ('1', '2');
INSERT INTO `sys_role_permission` VALUES ('1', '3');
INSERT INTO `sys_role_permission` VALUES ('1', '4');
INSERT INTO `sys_role_permission` VALUES ('1', '5');
INSERT INTO `sys_role_permission` VALUES ('1', '6');
INSERT INTO `sys_role_permission` VALUES ('1', '7');
INSERT INTO `sys_role_permission` VALUES ('1', '8');
INSERT INTO `sys_role_permission` VALUES ('1', '9');
INSERT INTO `sys_role_permission` VALUES ('1', '10');
INSERT INTO `sys_role_permission` VALUES ('1', '11');
INSERT INTO `sys_role_permission` VALUES ('1', '12');
INSERT INTO `sys_role_permission` VALUES ('1', '13');
INSERT INTO `sys_role_permission` VALUES ('1', '14');
INSERT INTO `sys_role_permission` VALUES ('1', '15');
INSERT INTO `sys_role_permission` VALUES ('1', '16');
INSERT INTO `sys_role_permission` VALUES ('1', '17');
INSERT INTO `sys_role_permission` VALUES ('1', '18');
INSERT INTO `sys_role_permission` VALUES ('1', '21');
INSERT INTO `sys_role_permission` VALUES ('1', '22');
INSERT INTO `sys_role_permission` VALUES ('1', '23');
INSERT INTO `sys_role_permission` VALUES ('1', '31');
INSERT INTO `sys_role_permission` VALUES ('1', '34');
INSERT INTO `sys_role_permission` VALUES ('1', '35');
INSERT INTO `sys_role_permission` VALUES ('1', '36');
INSERT INTO `sys_role_permission` VALUES ('1', '38');
INSERT INTO `sys_role_permission` VALUES ('1', '39');
INSERT INTO `sys_role_permission` VALUES ('1', '40');
INSERT INTO `sys_role_permission` VALUES ('1', '42');
INSERT INTO `sys_role_permission` VALUES ('1', '43');
INSERT INTO `sys_role_permission` VALUES ('1', '44');
INSERT INTO `sys_role_permission` VALUES ('1', '46');
INSERT INTO `sys_role_permission` VALUES ('1', '47');
INSERT INTO `sys_role_permission` VALUES ('1', '48');
INSERT INTO `sys_role_permission` VALUES ('1', '49');
INSERT INTO `sys_role_permission` VALUES ('1', '51');
INSERT INTO `sys_role_permission` VALUES ('1', '52');
INSERT INTO `sys_role_permission` VALUES ('1', '53');
INSERT INTO `sys_role_permission` VALUES ('1', '54');
INSERT INTO `sys_role_permission` VALUES ('1', '55');
INSERT INTO `sys_role_permission` VALUES ('1', '56');
INSERT INTO `sys_role_permission` VALUES ('1', '57');
INSERT INTO `sys_role_permission` VALUES ('1', '68');
INSERT INTO `sys_role_permission` VALUES ('1', '69');
INSERT INTO `sys_role_permission` VALUES ('1', '70');
INSERT INTO `sys_role_permission` VALUES ('1', '71');
INSERT INTO `sys_role_permission` VALUES ('1', '73');
INSERT INTO `sys_role_permission` VALUES ('1', '74');
INSERT INTO `sys_role_permission` VALUES ('1', '75');
INSERT INTO `sys_role_permission` VALUES ('1', '76');
INSERT INTO `sys_role_permission` VALUES ('1', '77');
INSERT INTO `sys_role_permission` VALUES ('1', '78');
INSERT INTO `sys_role_permission` VALUES ('1', '79');
INSERT INTO `sys_role_permission` VALUES ('1', '81');
INSERT INTO `sys_role_permission` VALUES ('1', '82');
INSERT INTO `sys_role_permission` VALUES ('1', '83');
INSERT INTO `sys_role_permission` VALUES ('1', '84');
INSERT INTO `sys_role_permission` VALUES ('1', '86');
INSERT INTO `sys_role_permission` VALUES ('1', '91');
INSERT INTO `sys_role_permission` VALUES ('1', '92');
INSERT INTO `sys_role_permission` VALUES ('4', '1');
INSERT INTO `sys_role_permission` VALUES ('4', '2');
INSERT INTO `sys_role_permission` VALUES ('4', '7');
INSERT INTO `sys_role_permission` VALUES ('4', '8');
INSERT INTO `sys_role_permission` VALUES ('4', '9');
INSERT INTO `sys_role_permission` VALUES ('4', '68');
INSERT INTO `sys_role_permission` VALUES ('4', '69');
INSERT INTO `sys_role_permission` VALUES ('4', '70');
INSERT INTO `sys_role_permission` VALUES ('4', '71');
INSERT INTO `sys_role_permission` VALUES ('4', '81');
INSERT INTO `sys_role_permission` VALUES ('4', '82');
INSERT INTO `sys_role_permission` VALUES ('4', '83');
INSERT INTO `sys_role_permission` VALUES ('4', '84');
INSERT INTO `sys_role_permission` VALUES ('4', '91');
INSERT INTO `sys_role_permission` VALUES ('4', '92');
INSERT INTO `sys_role_permission` VALUES ('5', '1');
INSERT INTO `sys_role_permission` VALUES ('5', '3');
INSERT INTO `sys_role_permission` VALUES ('5', '10');
INSERT INTO `sys_role_permission` VALUES ('5', '11');
INSERT INTO `sys_role_permission` VALUES ('6', '1');
INSERT INTO `sys_role_permission` VALUES ('6', '4');
INSERT INTO `sys_role_permission` VALUES ('6', '12');
INSERT INTO `sys_role_permission` VALUES ('6', '13');
INSERT INTO `sys_role_permission` VALUES ('7', '1');
INSERT INTO `sys_role_permission` VALUES ('7', '5');
INSERT INTO `sys_role_permission` VALUES ('7', '14');
INSERT INTO `sys_role_permission` VALUES ('7', '15');
INSERT INTO `sys_role_permission` VALUES ('7', '16');
INSERT INTO `sys_role_permission` VALUES ('7', '17');
INSERT INTO `sys_role_permission` VALUES ('7', '18');
INSERT INTO `sys_role_permission` VALUES ('7', '30');
INSERT INTO `sys_role_permission` VALUES ('7', '31');
INSERT INTO `sys_role_permission` VALUES ('7', '34');
INSERT INTO `sys_role_permission` VALUES ('7', '35');
INSERT INTO `sys_role_permission` VALUES ('7', '36');
INSERT INTO `sys_role_permission` VALUES ('7', '38');
INSERT INTO `sys_role_permission` VALUES ('7', '39');
INSERT INTO `sys_role_permission` VALUES ('7', '40');
INSERT INTO `sys_role_permission` VALUES ('7', '42');
INSERT INTO `sys_role_permission` VALUES ('7', '43');
INSERT INTO `sys_role_permission` VALUES ('7', '44');
INSERT INTO `sys_role_permission` VALUES ('7', '46');
INSERT INTO `sys_role_permission` VALUES ('7', '47');
INSERT INTO `sys_role_permission` VALUES ('7', '48');
INSERT INTO `sys_role_permission` VALUES ('7', '49');
INSERT INTO `sys_role_permission` VALUES ('7', '51');
INSERT INTO `sys_role_permission` VALUES ('7', '52');
INSERT INTO `sys_role_permission` VALUES ('7', '53');
INSERT INTO `sys_role_permission` VALUES ('7', '54');
INSERT INTO `sys_role_permission` VALUES ('7', '55');
INSERT INTO `sys_role_permission` VALUES ('7', '56');
INSERT INTO `sys_role_permission` VALUES ('7', '57');
INSERT INTO `sys_role_permission` VALUES ('11', '1');
INSERT INTO `sys_role_permission` VALUES ('11', '5');
INSERT INTO `sys_role_permission` VALUES ('11', '14');
INSERT INTO `sys_role_permission` VALUES ('11', '15');
INSERT INTO `sys_role_permission` VALUES ('11', '30');
INSERT INTO `sys_role_permission` VALUES ('11', '31');
INSERT INTO `sys_role_permission` VALUES ('11', '32');
INSERT INTO `sys_role_permission` VALUES ('11', '34');
INSERT INTO `sys_role_permission` VALUES ('11', '35');
INSERT INTO `sys_role_permission` VALUES ('11', '36');
INSERT INTO `sys_role_permission` VALUES ('11', '53');
INSERT INTO `sys_role_permission` VALUES ('11', '54');

-- ----------------------------
-- Table structure for `sys_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rid`) USING BTREE,
  KEY `FK_203gdpkwgtow7nxlo2oap5jru` (`rid`) USING BTREE,
  CONSTRAINT `sys_role_user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `sys_role_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('1', '2');
INSERT INTO `sys_role_user` VALUES ('4', '3');
INSERT INTO `sys_role_user` VALUES ('5', '4');
INSERT INTO `sys_role_user` VALUES ('6', '5');
INSERT INTO `sys_role_user` VALUES ('6', '10');
INSERT INTO `sys_role_user` VALUES ('7', '6');
INSERT INTO `sys_role_user` VALUES ('7', '10');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `loginname` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `mgr` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT '1',
  `ordernum` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '用户类型[0超级管理员1，管理员，2普通用户]',
  `imgpath` varchar(100) DEFAULT NULL COMMENT '头像地址',
  `salt` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_3rrcpvho2w1mx1sfiuuyir1h` (`deptid`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '超级管理员', 'system', '系统深处的男人', '1', '超级管理员', '532ac00e86893901af5f0be6b704dbc7', '1', '2018-06-25 11:06:34', '1', '1', '1', '0', 'upload/image/head_1580481429615.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES ('2', '李四', 'ls', '武汉', '0', 'KING', 'b07b848d69e0553b80e601d31571797e', '1', '2018-06-25 11:06:36', '1', '1', '2', '1', '../resources/images/defaultusertitle.jpg', 'FC1EE06AE4354D3FBF7FDD15C8FCDA71');
INSERT INTO `sys_user` VALUES ('3', '王五', 'ww', '武汉', '1', '管理员', '3c3f971eae61e097f59d52360323f1c8', '3', '2018-06-25 11:06:38', '2', '1', '3', '1', '../resources/images/defaultusertitle.jpg', '3D5F956E053C4E85B7D2681386E235D2');
INSERT INTO `sys_user` VALUES ('4', '赵六', 'zl', '武汉', '0', '程序员', '2e969742a7ea0c7376e9551d578e05dd', '3', '2018-06-25 11:06:40', '1', '1', '4', '1', '../resources/images/defaultusertitle.jpg', '6480EE1391E34B0886ACADA501E31145');
INSERT INTO `sys_user` VALUES ('5', '孙七', 'sq', '武汉', '1', '程序员', '47b4c1ad6e4b54dd9387a09cb5a03de1', '2', '2018-06-25 11:06:43', '4', '1', '5', '1', '../resources/images/defaultusertitle.jpg', 'FE3476C3E3674E5690C737C269FCBF8E');
INSERT INTO `sys_user` VALUES ('6', '刘八', 'lb', '深圳', '1', '程序员', 'bcee2b05b4b591106829aec69a094806', '4', '2018-08-06 11:21:12', '3', '1', '6', '1', '../resources/images/defaultusertitle.jpg', 'E6CCF54A09894D998225878BBD139B20');
INSERT INTO `sys_user` VALUES ('9', '爱的色放', 'aidesefang', '多少', '0', '阿凡达', '369f83fdaf11c859c06efa79facd614e', '3', '2020-02-11 15:42:45', '5', '0', '7', '1', null, 'E1D3640543784EEEAEA51CCBE51B2B2A');
INSERT INTO `sys_user` VALUES ('10', '速度', 'sudu', 'dfas', '1', 'fsadf', 'aa49f20952b525f3e4de51695a481498', '3', '2020-02-21 16:49:04', '3', '1', '8', '1', null, '3D6B295C577F4ADCB1732EA5F4526FB1');
