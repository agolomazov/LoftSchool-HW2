/*
 Navicat Premium Data Transfer

 Source Server         : MyDB
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : localhost
 Source Database       : hw2

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : utf-8

 Date: 09/23/2015 16:25:25 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id_order` int(11) unsigned NOT NULL COMMENT 'номер заказа',
  `id_product` int(11) unsigned NOT NULL COMMENT 'товар',
  `price` decimal(10,2) unsigned NOT NULL COMMENT 'цена продукта',
  `count` int(11) unsigned NOT NULL COMMENT 'кол-во товара в заказе',
  KEY `id_order` (`id_order`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cart`
-- ----------------------------
BEGIN;
INSERT INTO `cart` VALUES ('1', '1', '1970.30', '7'), ('1', '28', '1570.60', '10'), ('1', '27', '950.90', '1'), ('2', '27', '950.90', '3'), ('3', '18', '1550.80', '9'), ('4', '9', '1750.70', '1'), ('4', '30', '1020.30', '7'), ('4', '9', '1750.70', '3'), ('4', '11', '2000.60', '4'), ('5', '23', '970.20', '1'), ('6', '15', '1170.30', '4'), ('6', '26', '300.10', '9'), ('6', '1', '1970.30', '10'), ('6', '13', '450.40', '9'), ('7', '9', '1750.70', '2'), ('7', '14', '960.50', '8'), ('7', '9', '1750.70', '8'), ('8', '5', '400.20', '7'), ('9', '18', '1550.80', '6'), ('10', '29', '1610.20', '2'), ('11', '7', '1900.20', '4'), ('12', '3', '1910.70', '5'), ('12', '12', '1660.40', '2'), ('12', '18', '1550.80', '7'), ('12', '16', '1130.60', '3'), ('12', '10', '1170.70', '7'), ('13', '23', '970.20', '10'), ('13', '18', '1550.80', '6'), ('14', '23', '970.20', '2'), ('14', '20', '700.10', '5'), ('14', '14', '960.50', '7'), ('14', '13', '450.40', '2'), ('15', '6', '1540.30', '6'), ('15', '12', '1660.40', '7'), ('16', '7', '1900.20', '1'), ('16', '13', '450.40', '1'), ('17', '20', '700.10', '5'), ('18', '27', '950.90', '6'), ('19', '2', '1440.30', '10'), ('19', '6', '1540.30', '6'), ('19', '9', '1750.70', '9'), ('20', '15', '1170.30', '8'), ('21', '7', '1900.20', '10'), ('21', '23', '970.20', '4'), ('22', '12', '1660.40', '8'), ('23', '1', '1970.30', '7'), ('23', '30', '1020.30', '8'), ('23', '30', '1020.30', '3'), ('24', '1', '1970.30', '3'), ('25', '4', '520.60', '1'), ('25', '16', '1130.60', '6'), ('26', '19', '1610.40', '9'), ('26', '1', '1970.30', '6'), ('27', '4', '520.60', '1'), ('27', '17', '860.20', '8'), ('28', '11', '2000.60', '10'), ('28', '18', '1550.80', '5'), ('29', '7', '1900.20', '6'), ('29', '2', '1440.30', '1'), ('29', '20', '700.10', '7'), ('30', '11', '2000.60', '8');
COMMIT;

-- ----------------------------
--  Table structure for `catalog`
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор категории',
  `title` varchar(255) NOT NULL COMMENT 'название категории товаров',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `catalog`
-- ----------------------------
BEGIN;
INSERT INTO `catalog` VALUES ('1', 'Канцтовары'), ('2', 'Письменные принадлежности'), ('3', 'Картриджи и тонеры'), ('4', 'Бутилированная вода и кулеры'), ('5', 'Папки и системы архивации'), ('6', 'Бумага и бумажные изделия для офиса'), ('7', 'Демонстрационное оборудование');
COMMIT;

-- ----------------------------
--  Table structure for `mark`
-- ----------------------------
DROP TABLE IF EXISTS `mark`;
CREATE TABLE `mark` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор марки товара',
  `title` varchar(100) NOT NULL COMMENT 'название марки товара',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mark`
-- ----------------------------
BEGIN;
INSERT INTO `mark` VALUES ('1', 'Без названия'), ('2', 'Attache'), ('3', 'Koh-I-Noor'), ('4', 'Комус'), ('5', 'Rexel'), ('6', 'Xerox'), ('7', 'HP'), ('8', 'Casio'), ('9', 'BIC');
COMMIT;

-- ----------------------------
--  Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор заказа',
  `id_user` int(11) unsigned NOT NULL COMMENT 'идентификатор юзера',
  `date_order` datetime NOT NULL COMMENT 'дата заказа',
  `id_status` int(11) unsigned NOT NULL COMMENT 'идентификатор статуса',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_status` (`id_status`),
  KEY `date_order` (`date_order`),
  KEY `date_order_status` (`date_order`,`id_status`) USING BTREE,
  CONSTRAINT `id_ user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `order`
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES ('1', '44', '2014-08-24 11:48:00', '3'), ('2', '19', '2014-09-03 12:46:00', '3'), ('3', '9', '2014-09-27 17:00:00', '3'), ('4', '9', '2014-10-10 20:10:00', '3'), ('5', '35', '2014-10-18 23:35:00', '3'), ('6', '39', '2014-10-23 11:47:00', '3'), ('7', '2', '2014-11-16 03:23:00', '3'), ('8', '39', '2014-11-29 05:23:00', '3'), ('9', '46', '2014-12-27 14:46:00', '1'), ('10', '27', '2015-01-14 22:28:00', '2'), ('11', '26', '2015-01-16 16:48:00', '4'), ('12', '26', '2015-01-23 09:10:00', '1'), ('13', '15', '2015-01-28 10:36:00', '4'), ('14', '50', '2015-02-20 04:34:00', '2'), ('15', '36', '2015-02-20 06:04:00', '4'), ('16', '34', '2015-02-24 17:26:00', '2'), ('17', '23', '2015-03-05 05:44:00', '4'), ('18', '42', '2015-03-23 21:43:00', '1'), ('19', '22', '2015-04-10 15:16:00', '1'), ('20', '37', '2015-04-28 19:57:00', '4'), ('21', '13', '2015-05-25 15:14:00', '4'), ('22', '22', '2015-06-13 17:45:00', '1'), ('23', '18', '2015-06-15 14:40:00', '4'), ('24', '34', '2015-07-22 03:54:00', '3'), ('25', '10', '2015-07-25 13:21:00', '3'), ('26', '10', '2015-07-26 20:20:00', '4'), ('27', '41', '2015-08-11 05:33:00', '4'), ('28', '15', '2015-08-18 05:38:00', '3'), ('29', '38', '2015-08-18 18:43:00', '1'), ('30', '8', '2015-08-28 15:39:00', '1');
COMMIT;

-- ----------------------------
--  Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор товара',
  `id_catalog` int(11) unsigned NOT NULL COMMENT 'идентификатор категории товара',
  `title` varchar(255) NOT NULL COMMENT 'название товара',
  `id_mark` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'марка товара',
  `price` decimal(10,2) NOT NULL COMMENT 'цена товара',
  `count` int(11) NOT NULL COMMENT 'количество товара на складе',
  `description` text COMMENT 'описание товара',
  PRIMARY KEY (`id`),
  KEY `id_catalog` (`id_catalog`),
  KEY `id_mark` (`id_mark`),
  KEY `title` (`title`),
  CONSTRAINT `id_catalog` FOREIGN KEY (`id_catalog`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_mark` FOREIGN KEY (`id_mark`) REFERENCES `mark` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `product`
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('1', '3', 'товар 1', '1', '1970.30', '21', 'Possimus possimus excepturi ratione blanditiis officiis eaque explicabo modi eveniet quam eveniet.'), ('2', '7', 'товар 2', '8', '1440.30', '45', 'Quos explicabo ex temporibus minus consectetur sit doloribus dolor explicabo ad laudantium asperiores consectetur.'), ('3', '5', 'товар 3', '7', '1910.70', '88', 'Elit excepturi ipsa iste maxime odio elit magni laborum odio officiis iste consectetur eum.'), ('4', '7', 'товар 4', '3', '520.60', '21', 'Laudantium cumque et beatae veritatis doloribus doloribus officiis ratione doloribus.'), ('5', '2', 'товар 5', '9', '400.20', '95', 'Doloribus ex eum maxime nam possimus molestiae rerum repudiandae.'), ('6', '2', 'товар 6', '1', '1540.30', '62', 'Modi officia corporis consectetur explicabo veritatis doloribus praesentium rerum ad soluta minus lorem excepturi optio.'), ('7', '4', 'товар 7', '2', '1900.20', '49', 'Lorem magni porro architecto nam fugit quis fugiat minus consectetur eveniet optio.'), ('8', '6', 'товар 8', '1', '1050.30', '98', 'Eaque adipisicing ab beatae blanditiis laudantium consectetur.'), ('9', '2', 'товар 9', '6', '1750.70', '32', 'Nam magni officiis enim repudiandae nam consectetur consectetur dicta lorem iure ipsa autem cumque eveniet.'), ('10', '6', 'товар 10', '9', '1170.70', '87', 'Beatae blanditiis asperiores ad eligendi nam architecto elit minus ut.'), ('11', '2', 'товар 11', '3', '2000.60', '10', 'Cupiditate quam temporibus fugit ipsum dolor amet perferendis temporibus ab dicta temporibus.'), ('12', '6', 'товар 12', '6', '1660.40', '77', 'Quod animi facere et cupiditate est iste nihil magni perferendis officia beatae.'), ('13', '6', 'товар 13', '6', '450.40', '38', 'Optio veritatis cumque eius doloremque tempore consequatur consectetur dolor laudantium laborum possimus iure officia.'), ('14', '6', 'товар 14', '3', '960.50', '24', 'Nostrum magni quam iste tempore magni eum beatae consectetur minus autem temporibus doloribus excepturi quibusdam.'), ('15', '3', 'товар 15', '1', '1170.30', '49', 'Nisi sit perferendis ipsum minima quam adipisicing.'), ('16', '5', 'товар 16', '2', '1130.60', '34', 'Asperiores perferendis blanditiis soluta officia magni.'), ('17', '3', 'товар 17', '5', '860.20', '97', 'Nam consequatur quos quam voluptates ut necessitatibus.'), ('18', '2', 'товар 18', '4', '1550.80', '57', 'Laborum nisi doloribus odio possimus cupiditate veritatis eveniet error.'), ('19', '3', 'товар 19', '4', '1610.40', '75', 'Corporis veritatis quod et consequatur voluptates blanditiis fugiat.'), ('20', '2', 'товар 20', '1', '700.10', '46', 'Et dicta sit ut molestiae asperiores.'), ('21', '1', 'товар 21', '9', '1840.30', '18', 'Iste fugiat elit quos praesentium excepturi blanditiis.'), ('22', '6', 'товар 22', '1', '420.70', '15', 'Molestiae ipsa est laudantium adipisicing lorem ex eligendi adipisicing officiis optio blanditiis temporibus impedit.'), ('23', '4', 'товар 23', '9', '970.20', '35', 'Nam dolore ad minima temporibus quod doloribus repudiandae fugiat.'), ('24', '4', 'товар 24', '3', '1090.30', '23', 'Ab possimus eius eaque dolore quod.'), ('25', '4', 'товар 25', '6', '1960.60', '39', 'Sit nam consectetur minus necessitatibus fugiat laudantium impedit eaque impedit.'), ('26', '3', 'товар 26', '3', '300.10', '83', 'Consectetur optio perferendis dicta quis odio odio labore impedit nihil asperiores ipsum magni architecto temporibus.'), ('27', '1', 'товар 27', '6', '950.90', '33', 'Ipsa nostrum eum autem consequatur repudiandae nostrum labore necessitatibus quis ipsa ad.'), ('28', '3', 'товар 28', '8', '1570.60', '58', 'Necessitatibus quis voluptates molestiae veritatis cumque ex ex cupiditate cupiditate dolor laborum error.'), ('29', '3', 'товар 29', '5', '1610.20', '40', 'Consectetur minima quibusdam consectetur corporis magni fugit nostrum doloribus nam optio magni consectetur dolor quam.'), ('30', '2', 'товар 30', '7', '1020.30', '77', 'Dicta officia rerum est porro blanditiis ab fugit.');
COMMIT;

-- ----------------------------
--  Table structure for `status`
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификтатор статуса заказа',
  `title` varchar(30) NOT NULL COMMENT 'название статуса заказа',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `status`
-- ----------------------------
BEGIN;
INSERT INTO `status` VALUES ('1', 'В обработке'), ('2', 'Оплачен'), ('3', 'Доставлен'), ('4', 'Отменен');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор пользователя',
  `lastname` varchar(50) DEFAULT NULL COMMENT 'фамилия пользователя',
  `name` varchar(30) NOT NULL COMMENT 'имя пользователя',
  `birthday` date NOT NULL COMMENT 'дата рождения',
  `email` varchar(100) NOT NULL COMMENT 'email пользователя',
  `password` varchar(30) NOT NULL COMMENT 'пароль пользователя',
  `reg_date` datetime NOT NULL,
  `last_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `is_active` (`is_active`),
  KEY `birthday` (`birthday`),
  KEY `last_update` (`last_update`),
  KEY `birthday_is_active` (`birthday`,`is_active`),
  KEY `reg_date` (`reg_date`),
  KEY `reg_date_is_active` (`reg_date`,`is_active`),
  KEY `last_update_is_active` (`last_update`,`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'Степанов', 'Гурий', '1990-12-16', 'stepanov1@testmail.com', '605rSL0Ed', '2014-09-18 00:17:00', '2015-09-18 19:28:00', '0'), ('2', 'Волковa', 'Акулина', '1975-02-22', 'volkova2@testmail.com', 'UUXoxw', '2015-05-27 07:05:00', '2015-08-31 13:30:00', '1'), ('3', 'Андреевa', 'Ксения', '1987-01-06', 'andreyeva3@testmail.com', 'W9g4882Nd1', '2014-07-30 00:53:00', '2015-08-22 22:24:00', '1'), ('4', 'Ильинa', 'Галина', '1982-09-30', 'ilina4@testmail.com', 'nYJ6O0', '2015-06-12 23:34:00', '2015-09-18 03:53:00', '1'), ('5', 'Шараповa', 'Алла', '1985-06-21', 'sharapova5@testmail.com', '5nPzhO6p', '2015-05-09 16:27:00', '2015-09-09 18:57:00', '0'), ('6', 'Лебедевa', 'Лика', '1977-02-25', 'lebedeva6@testmail.com', '1vMZLzx0iC0', '2014-10-15 00:11:00', '2015-08-26 17:00:00', '1'), ('7', 'Андреевa', 'Анисия', '1982-10-19', 'andreyeva7@testmail.com', 'IWUxpJ7s0', '2014-05-18 08:49:00', '2015-09-16 10:06:00', '1'), ('8', 'Виноградовa', 'Василиса', '1989-10-30', 'vinogradova8@testmail.com', '5RrT731', '2014-08-01 09:08:00', '2015-09-04 21:40:00', '0'), ('9', 'Макаровa', 'Гликерия', '1990-09-26', 'makarova9@testmail.com', 'eBU3KTB3', '2014-05-20 03:50:00', '2015-08-26 18:51:00', '1'), ('10', 'Щукинa', 'Тамара', '1974-10-13', 'shchukina10@testmail.com', 'NyQ9mEr886g', '2015-07-28 13:28:00', '2015-09-12 04:47:00', '0'), ('11', 'Козлов', 'Фома', '1987-02-16', 'kozlov11@testmail.com', '4cilzOSCSHa', '2015-08-11 03:27:00', '2015-08-21 02:46:00', '1'), ('12', 'Кузьмин', 'Гурий', '1972-09-27', 'kuzmin12@testmail.com', 'XApLs6', '2014-09-13 10:23:00', '2015-09-03 15:22:00', '0'), ('13', 'Андреев', 'Елисей', '1994-10-12', 'andreyev13@testmail.com', 'CyRftNq', '2015-04-26 15:47:00', '2015-09-19 03:59:00', '1'), ('14', 'Комаров', 'Ибрагим', '1977-05-19', 'komarov14@testmail.com', '69yEhd5188', '2014-11-01 12:30:00', '2015-08-29 16:23:00', '0'), ('15', 'Сорокинa', 'Мелания', '1995-09-11', 'sorokina15@testmail.com', 'jVMPDuJansS', '2014-08-07 06:37:00', '2015-08-27 11:35:00', '0'), ('16', 'Комаров', 'Назар', '1977-06-07', 'komarov16@testmail.com', '45qiVy0NK9', '2015-06-20 16:47:00', '2015-09-16 22:54:00', '1'), ('17', 'Виноградовa', 'Ирина', '1996-09-16', 'vinogradova17@testmail.com', 'Gs0v1fCr', '2014-06-04 11:21:00', '2015-08-23 07:05:00', '0'), ('18', 'Васильевa', 'Евдокия', '1996-06-23', 'vasilyeva18@testmail.com', '7l2y5TtSU', '2015-06-18 03:12:00', '2015-09-09 03:17:00', '0'), ('19', 'Андреев', 'Елисей', '1992-11-03', 'andreyev19@testmail.com', 'FZvJ7Mt0', '2015-06-04 19:34:00', '2015-08-27 02:29:00', '0'), ('20', 'Алексеевa', 'Прасковья', '1994-04-22', 'alekseyeva20@testmail.com', 'NyR5uQs8', '2014-12-06 07:52:00', '2015-09-16 20:00:00', '1'), ('21', 'Васильевa', 'Ангелина', '1976-05-23', 'vasilyeva21@testmail.com', '10u5KC', '2014-07-31 16:48:00', '2015-08-31 00:06:00', '1'), ('22', 'Сазоновa', 'Лика', '1971-05-01', 'sazonova22@testmail.com', '20B9e83s', '2015-06-01 18:31:00', '2015-09-01 01:56:00', '1'), ('23', 'Виноградов', 'Елисей', '1985-11-02', 'vinogradov23@testmail.com', 'oLvIm6', '2015-04-09 18:03:00', '2015-09-20 15:06:00', '1'), ('24', 'Тарасов', 'Измаил', '1983-07-14', 'tarasov24@testmail.com', 'I1aD7Qd10', '2015-02-28 03:15:00', '2015-08-20 07:20:00', '0'), ('25', 'Зайцев', 'Ананий', '1972-09-30', 'zaytsev25@testmail.com', 'kZJP0LOK2d', '2015-07-31 06:07:00', '2015-08-24 00:40:00', '1'), ('26', 'Беловa', 'Раиса', '1991-12-20', 'belova26@testmail.com', 'l0tK92U', '2015-02-20 00:27:00', '2015-09-22 04:34:00', '0'), ('27', 'Петровa', 'Алиса', '1989-05-08', 'petrova27@testmail.com', 'cHG497M4', '2014-09-29 15:50:00', '2015-09-09 07:15:00', '1'), ('28', 'Макаровa', 'Раиса', '1975-12-27', 'makarova28@testmail.com', 'g8BW0A5ztVp', '2015-06-17 01:11:00', '2015-09-10 07:54:00', '1'), ('29', 'Кудрявцевa', 'Зинаида', '1986-07-22', 'kudryavtseva29@testmail.com', 'ls3T4pr3z', '2015-04-17 09:30:00', '2015-09-03 05:46:00', '0'), ('30', 'Куликовa', 'Анжела', '1985-03-29', 'kulikova30@testmail.com', 'w050hb0m', '2015-01-31 08:03:00', '2015-09-20 13:54:00', '0'), ('31', 'Степанов', 'Фома', '1983-03-07', 'stepanov31@testmail.com', '65JOA62VJ8R', '2015-08-03 22:17:00', '2015-09-17 13:16:00', '1'), ('32', 'Беляев', 'Ананий', '1979-02-06', 'belyayev32@testmail.com', 'hGV232i', '2014-08-29 00:05:00', '2015-09-17 08:06:00', '1'), ('33', 'Степановa', 'Анжелика', '1988-09-06', 'stepanova33@testmail.com', 'IxJHL8Wm', '2015-01-30 02:29:00', '2015-09-06 22:01:00', '0'), ('34', 'Гусев', 'Варфоломей', '1982-02-11', 'gusev34@testmail.com', '7cjg3gvZ', '2014-12-04 10:23:00', '2015-08-24 15:49:00', '1'), ('35', 'Гусев', 'Назар', '1979-11-13', 'gusev35@testmail.com', 'ZiS9a1f', '2014-11-28 09:32:00', '2015-09-04 09:09:00', '1'), ('36', 'Богданов', 'Иван', '1972-01-01', 'bogdanov36@testmail.com', 'WWKA6IoQ2Bx', '2015-02-18 19:56:00', '2015-09-15 22:27:00', '0'), ('37', 'Богданов', 'Ананий', '1993-01-20', 'bogdanov37@testmail.com', 'm3inmm9sf9', '2014-06-19 06:48:00', '2015-09-20 06:20:00', '0'), ('38', 'Попов', 'Еремей', '1994-08-11', 'popov38@testmail.com', 'gHmDdx0hz1', '2015-03-25 02:28:00', '2015-09-19 11:45:00', '1'), ('39', 'Андреевa', 'Лариса', '1972-02-11', 'andreyeva39@testmail.com', 'vybNVHI69', '2015-02-11 16:47:00', '2015-08-24 02:37:00', '0'), ('40', 'Лебедев', 'Измаил', '1980-04-28', 'lebedev40@testmail.com', '684Izy', '2014-05-30 19:52:00', '2015-08-31 04:53:00', '0'), ('41', 'Сазонов', 'Лазарь', '1980-06-01', 'sazonov41@testmail.com', 'JVmmK45L', '2014-08-29 10:15:00', '2015-08-23 02:51:00', '1'), ('42', 'Тарасовa', 'Элла', '1970-04-17', 'tarasova42@testmail.com', 'GCWeYR427', '2014-07-01 13:33:00', '2015-08-26 16:50:00', '1'), ('43', 'Тарасовa', 'Лина', '1984-10-01', 'tarasova43@testmail.com', 'BOyGdcXL11', '2015-03-08 02:26:00', '2015-08-29 13:44:00', '1'), ('44', 'Ильин', 'Фома', '1971-02-17', 'ilin44@testmail.com', '2U9O773X', '2015-05-14 18:46:00', '2015-08-21 09:59:00', '1'), ('45', 'Новиков', 'Михаил', '1981-02-15', 'novikov45@testmail.com', 'lewWAGLK', '2015-06-10 09:42:00', '2015-08-29 05:01:00', '0'), ('46', 'Киселёвa', 'Лариса', '1993-07-15', 'kiseleva46@testmail.com', '1b158221', '2014-06-20 20:09:00', '2015-09-01 20:04:00', '0'), ('47', 'Васильев', 'Гавриил', '1991-03-25', 'vasilyev47@testmail.com', '7zzPEKnt4d', '2015-05-09 04:44:00', '2015-09-12 16:55:00', '0'), ('48', 'Морозовa', 'Елена', '1995-04-22', 'morozova48@testmail.com', '1VvDXSb', '2014-10-08 00:18:00', '2015-09-11 10:44:00', '1'), ('49', 'Тарасовa', 'Дарья', '1987-06-25', 'tarasova49@testmail.com', 'c7YVnl0', '2015-06-28 00:16:00', '2015-08-23 21:41:00', '0'), ('50', 'Титов', 'Аким', '1987-12-05', 'titov50@testmail.com', 'Z30XF23g4', '2014-07-21 07:58:00', '2015-09-03 12:22:00', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
