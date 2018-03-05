/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.20 : Database - vinajobs_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vinajobs_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `vinajobs_db`;

/*Table structure for table `auth_assignment` */

DROP TABLE IF EXISTS `auth_assignment`;

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_assignment` */

insert  into `auth_assignment`(`item_name`,`user_id`,`created_at`) values ('admin','1',1516773665),('author','41',1516773665);

/*Table structure for table `auth_item` */

DROP TABLE IF EXISTS `auth_item`;

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_item` */

insert  into `auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values ('admin',1,NULL,NULL,NULL,1516773665,1516773665),('author',1,NULL,NULL,NULL,1516773665,1516773665),('createPost',2,'Create a post',NULL,NULL,1516773665,1516773665),('updatePost',2,'Update post',NULL,NULL,1516773665,1516773665);

/*Table structure for table `auth_item_child` */

DROP TABLE IF EXISTS `auth_item_child`;

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_item_child` */

insert  into `auth_item_child`(`parent`,`child`) values ('admin','author'),('author','createPost'),('admin','updatePost');

/*Table structure for table `auth_rule` */

DROP TABLE IF EXISTS `auth_rule`;

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_rule` */

/*Table structure for table `migration` */

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `migration` */

insert  into `migration`(`version`,`apply_time`) values ('m000000_000000_base',1514960736),('m140506_102106_rbac_init',1516773316),('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1516773316),('m180103_062712_tn_user',1514960974),('m180124_055839_init_rbac',1516773665),('m180130_052158_update_user',1517290665);

/*Table structure for table `tn_article` */

DROP TABLE IF EXISTS `tn_article`;

CREATE TABLE `tn_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `type_id` tinyint(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` text,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `keyword` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `star` tinyint(1) DEFAULT '0',
  `source` varchar(255) DEFAULT NULL,
  `is_comment` tinyint(1) DEFAULT '0',
  `comment_totel` int(11) DEFAULT '0',
  `sorted` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_tn_article` (`category_id`),
  CONSTRAINT `FK_tn_article` FOREIGN KEY (`category_id`) REFERENCES `tn_article_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tn_article` */

insert  into `tn_article`(`id`,`category_id`,`type_id`,`name`,`slug`,`content`,`image`,`description`,`keyword`,`tag`,`view`,`created_by`,`created_at`,`updated_by`,`updated_at`,`star`,`source`,`is_comment`,`comment_totel`,`sorted`,`is_deleted`,`status`) values (2,3,1,'Dự án cải tạo khu biệt thự Kinh Đô','du-an-cai-tao-khu-biet-thu-kinh-do','<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0036.JPG\" style=\"height:700px; width:1000px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0041.JPG\" style=\"height:700px; width:1000px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0059.JPG\" style=\"height:700px; width:1000px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0125.JPG\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0217.JPG\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0275.JPG\" style=\"height:700px; width:1000px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0233.JPG\" style=\"height:700px; width:1000px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0241.JPG\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0242.JPG\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0378.JPG\" /></p>\r\n','/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0378.JPG','Dự án cải tạo khu biệt thự Kinh Đô','','',NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,0,1),(3,3,1,'Nhà phố đường Lê Cơ, Phường An Lạc, Quận Bình Tân','nha-pho-duong-le-co-phuong-an-lac-quan-binh-tan','<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/9.JPG\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/10.JPG\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/1.JPG\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/2.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/3.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/4.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/5.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/6.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/7.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/8.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n','/web/uploads/images/Dang-thi-cong/Le-co/10.JPG','Nhà phố đường Lê Cơ, Phường An Lạc, Quận Bình Tân','','',NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,0,1),(4,3,1,'Nhà phố đường số 22, Phường Hiệp Bình Chánh, Q. Thủ Đức','nha-pho-duong-so-22-phuong-hiep-binh-chanh-q-thu-duc','<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/8.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/1.JPG\" style=\"height:700px; width:1000px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/2.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/3.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/4.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/5.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/6.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/7.JPG\" style=\"height:1000px; width:700px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n','/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/8.jpg','Nhà phố đường số 22, Phường Hiệp Bình Chánh, Q. Thủ Đức','','',NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,0,1),(5,3,NULL,'Nhà phố hẻm 36 đường Bùi Tư Toàn, P. An Lạc, Q.Bình Tân','nhà-phố-hẻm-36-dường-bui-tu-toan-p-an-lac-qbinh-tan','<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/nha-hem-36-bui-tu-toan/IMG_0711.JPG\" /></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/nha-hem-36-bui-tu-toan/IMG_0712.JPG\" /></p>\r\n','/web/uploads/images/Dang-thi-cong/nha-hem-36-bui-tu-toan/IMG_0712.JPG','Nhà phố hẻm 36 đường Bùi Tư Toàn, P. An Lạc, Q.Bình Tân','','',NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,0,1),(6,3,1,'Nhà phố quận 2','nha-pho-quan-2','<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/nha-pho-q2/Phoi-canh-quan-2-003.jpg\" /></p>\r\n','/web/uploads/images/Dang-thi-cong/nha-pho-q2/Phoi-canh-quan-2-003.jpg','Nhà phố quận 2','nha dep, nha q2, nha quan 2, nha ho quan 2, thiet ke nha q2, nha quan 2 gia re','nha dep, nha q2, nha quan 2, nha ho quan 2, thiet ke nha q2, nha quan 2 gia re',NULL,NULL,NULL,NULL,NULL,0,'nha dep, nha q2, nha quan 2, nha ho quan 2, thiet ke nha q2, nha quan 2 gia re',0,0,NULL,0,1),(7,3,2,'Biệt thự vườn đường số 22, P. Hiệp Bình Chánh, Q. Thủ Đức','biet-thu-vuon-duong-so-22-p-hiep-binh-chanh-q-thu-duc','<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/6.PNG\" /></em></p>\r\n\r\n<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/1.JPG\" /></em></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/2.JPG\" /></em></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/3.JPG\" /></em></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/4.JPG\" /></em></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/5.JPG\" /></em></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n','/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/6.PNG','Biệt thự vườn đường số 22, P. Hiệp Bình Chánh, Q. Thủ Đức','biet thu vuon, xay nha biet thu, biet thu vuon gia re, thiet ke biet thu, biet thu quan thu duc, nha quan thu duc, xay biet thu quan thu duc','biet thu vuon, xay nha biet thu, biet thu vuon gia re, thiet ke biet thu, biet thu quan thu duc, nha quan thu duc, xay biet thu quan thu duc, ',NULL,NULL,NULL,NULL,NULL,0,'biet thu vuon, xay nha biet thu, biet thu vuon gia re, thiet ke biet thu, biet thu quan thu duc, nha quan thu duc, xay biet thu quan thu duc',0,0,NULL,0,1),(8,3,2,'Biệt thự đường Hồ Văn Long, P.Bình Trị Đông, Q.Bình Tân','biet-thu-duong-ho-van-long-pbinh-tri-dong-qbinh-tan','<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/Biet-thu-ho-van-long-binh-tan/xam.png\" /></p>\r\n','/web/uploads/images/Da-thi-cong/Biet-thu-ho-van-long-binh-tan/xam.png','Biệt thự đường Hồ Văn Long, P.Bình Trị Đông, Q.Bình Tân','xay nha dep, xay biet thu','xay nha dep, xay biet thu',NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,0,1),(9,3,2,'Nhà vườn Huyện Bình Đại, Tỉnh Bến Tre','nha-vuon-huyenk-binh-dai-tinh-ben-tre','<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-binh-dai-ben-tre/2015-11-17_11-30-04.png\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-binh-dai-ben-tre/2015-11-17_11-30-58.png\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-binh-dai-ben-tre/2015-11-17_11-31-32.png\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-binh-dai-ben-tre/2015-11-17_11-31-54.png\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n','/web/uploads/images/Da-thi-cong/nha-binh-dai-ben-tre/2015-11-17_11-30-04.png','Nhà vườn Huyện Bình Đại, Tỉnh Bến Tre','','',NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,0,1),(10,3,2,'Dự án HaDo đường 3 tháng 2 quận 10','du-an-hado-duong-3-thang-2-quan-10','<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0372.JPG\" /></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0534.JPG\" /></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0537.JPG\" /></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0538.JPG\" /></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0540.JPG\" /></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0541.JPG\" /></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0543.JPG\" /></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0545.JPG\" /></p>\r\n','/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0545.JPG','Dự án HaDo đường 3 tháng 2 quận 10','du an hado, hado, ha do, du an hado 3 thang 2, hado 3/2, hado 3 thang 2, du an duong 3/2','du an hado, hado, ha do, du an hado 3 thang 2, hado 3/2, hado 3 thang 2, du an duong 3/2',NULL,NULL,NULL,NULL,NULL,0,'du an hado, hado, ha do, du an hado 3 thang 2, hado 3/2, hado 3 thang 2, du an duong 3/2',0,0,NULL,0,1),(11,3,2,'Nhà phố đường Phạm Văn Hai, Phường 2, Q. Phú Nhuận','nha-pho-duong-pham-van-hai-phuong-2-q-phu-nhuan','<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/PVH-1.jpg\" style=\"height:960px; width:1280px\" /></p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/PVH-2.jpg\" style=\"height:960px; width:1280px\" /></p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/PVH-3%20-%20Copy.jpg\" style=\"height:1200px; width:800px\" /></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/PVH-3.jpg\" style=\"height:1200px; width:800px\" /></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/Phong%20khach%201.jpg\" style=\"height:854px; width:1280px\" /></p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/Phong%20khach%202.jpg\" /></p>\r\n','/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/PVH-2.jpg','Nhà phố đường Phạm Văn Hai, Phường 2, Q. Phú Nhuận','','',NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,0,1);

/*Table structure for table `tn_article_category` */

DROP TABLE IF EXISTS `tn_article_category`;

CREATE TABLE `tn_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` text,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `keyword` varchar(255) DEFAULT NULL,
  `sorted` int(11) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tn_article_category` */

insert  into `tn_article_category`(`id`,`parent_id`,`name`,`slug`,`content`,`image`,`description`,`keyword`,`sorted`,`status`) values (1,0,'Gioi thieu','gioi-thieu','','/web/uploads/images/nnt-500x300-ab59b985f1-92c0b3c88abec48591ee6ff9ac250463_small.jpg','','',1,1),(2,0,'Dịch vụ','dich-vu','dich-vu','/web/uploads/images/intranet_cover.jpg','d','',1,1),(3,0,'Dự án','du-an','','/web/uploads/images/nnt-500x300-ab59b985f1-92c0b3c88abec48591ee6ff9ac250463_small.jpg','','',1,1);

/*Table structure for table `tn_cache_img` */

DROP TABLE IF EXISTS `tn_cache_img`;

CREATE TABLE `tn_cache_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `img_size` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tn_cache_img` */

insert  into `tn_cache_img`(`id`,`object_id`,`object_type`,`img_size`,`img_path`,`created_at`) values (1,7,'carousel_thum','1130x400','/web/cache/img/89cd832fe515edc9cf9afb402846c255-IMG_0711.JPG','2017-05-05 17:56:44'),(2,3,'carousel_thum','1130x400','/web/cache/img/89cd832fe515edc9cf9afb402846c255-IMG_0242.JPG','2017-05-05 17:56:44'),(3,5,'carousel_thum','1130x400','/web/cache/img/89cd832fe515edc9cf9afb402846c255-10.JPG','2017-05-05 17:56:44'),(4,6,'carousel_thum','1130x400','/web/cache/img/89cd832fe515edc9cf9afb402846c255-8.jpg','2017-05-05 17:56:45'),(5,6,'project_thum_index','260x205','/web/cache/img/13d921690b45ae72c3dff01708d3f300-Phoi-canh-quan-2-003.jpg','2017-05-05 17:56:45'),(6,4,'project_thum_index','260x205','/web/cache/img/13d921690b45ae72c3dff01708d3f300-8.jpg','2017-05-05 17:56:45'),(7,3,'project_thum_index','260x205','/web/cache/img/13d921690b45ae72c3dff01708d3f300-10.JPG','2017-05-05 17:56:45'),(8,2,'project_thum_index','260x205','/web/cache/img/13d921690b45ae72c3dff01708d3f300-IMG_0378.JPG','2017-05-05 17:56:45'),(9,9,'project_thum_index','260x205','/web/cache/img/13d921690b45ae72c3dff01708d3f300-2015-11-17_11-30-04.png','2017-05-05 17:56:45'),(10,4,'artitcle_detail','740x350','/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-8.jpg','2017-05-05 17:56:55'),(11,11,'news_sidebar','65x65','/web/cache/img/f2a09407f24ceb8bf2b1476a582be0bc-100935baoxaydung_2.jpg','2017-05-05 17:56:55'),(12,10,'news_sidebar','65x65','/web/cache/img/f2a09407f24ceb8bf2b1476a582be0bc-175801baoxaydung_16.jpg','2017-05-05 17:56:55'),(13,9,'news_sidebar','65x65','/web/cache/img/f2a09407f24ceb8bf2b1476a582be0bc-150751baoxaydung_9.jpg','2017-05-05 17:56:55'),(14,9,'artitcle_detail','740x350','/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-2015-11-17_11-30-04.png','2017-05-05 17:58:58'),(15,9,'project_thum','260x171','/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-2015-11-17_11-30-04.png','2017-05-05 17:59:40'),(16,11,'news_list','260x150','/web/cache/img/978e0517923493e37aeba87f8d2677fb-100935baoxaydung_2.jpg','2017-05-05 17:59:51'),(17,10,'news_list','260x150','/web/cache/img/978e0517923493e37aeba87f8d2677fb-175801baoxaydung_16.jpg','2017-05-05 17:59:51'),(18,9,'news_list','260x150','/web/cache/img/978e0517923493e37aeba87f8d2677fb-150751baoxaydung_9.jpg','2017-05-05 17:59:51'),(19,4,'news_list','260x150','/web/cache/img/978e0517923493e37aeba87f8d2677fb-1490674562-149067129763960-toa-nha-1.jpg','2017-05-05 17:59:51'),(20,2,'news_list','260x150','/web/cache/img/978e0517923493e37aeba87f8d2677fb-142337baoxaydung_29.jpg','2017-05-05 17:59:51'),(21,1,'news_list','260x150','/web/cache/img/978e0517923493e37aeba87f8d2677fb-095621baoxaydung_8.jpg','2017-05-05 17:59:51'),(22,8,'project_thum','260x171','/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-xam.png','2017-05-05 18:39:01'),(23,8,'artitcle_detail','740x350','/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-xam.png','2017-05-05 18:39:08'),(24,8,'project_thum_index','260x205','/web/cache/img/13d921690b45ae72c3dff01708d3f300-xam.png','2017-05-05 18:39:16'),(25,7,'project_thum_index','260x205','/web/cache/img/13d921690b45ae72c3dff01708d3f300-6.PNG','2017-05-05 18:45:44'),(26,10,'project_thum_index','260x205','/web/cache/img/13d921690b45ae72c3dff01708d3f300-IMG_0545.JPG','2017-05-05 19:00:47'),(27,10,'artitcle_detail','740x350','/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-IMG_0545.JPG','2017-05-05 19:00:58'),(28,10,'project_thum','260x171','/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-IMG_0545.JPG','2017-05-05 19:01:40'),(29,7,'project_thum','260x171','/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-6.PNG','2017-05-05 19:01:41'),(30,6,'project_thum','260x171','/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-Phoi-canh-quan-2-003.jpg','2017-05-05 19:01:46'),(31,4,'project_thum','260x171','/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-8.jpg','2017-05-05 19:01:46'),(32,3,'project_thum','260x171','/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-10.JPG','2017-05-05 19:01:46'),(33,2,'project_thum','260x171','/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-IMG_0378.JPG','2017-05-05 19:01:46'),(34,3,'artitcle_detail','740x350','/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-10.JPG','2017-05-05 20:06:32'),(35,7,'artitcle_detail','740x350','/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-6.PNG','2017-05-05 20:56:37'),(36,6,'artitcle_detail','740x350','/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-Phoi-canh-quan-2-003.jpg','2017-05-05 20:57:13'),(37,10,'news_detail','200x250','/web/cache/img/cc59e3f985c49a939a2b0a39818b22c6-175801baoxaydung_16.jpg','2017-05-05 20:57:46'),(38,11,'news_detail','200x250','/web/cache/img/cc59e3f985c49a939a2b0a39818b22c6-100935baoxaydung_2.jpg','2017-05-06 22:50:44'),(39,13,'news_list','260x150','/web/cache/img/978e0517923493e37aeba87f8d2677fb-182338baoxaydung_3.jpg','2017-05-08 22:29:50'),(40,13,'news_detail','200x250','/web/cache/img/cc59e3f985c49a939a2b0a39818b22c6-182338baoxaydung_3.jpg','2017-05-08 22:29:53'),(41,13,'news_sidebar','65x65','/web/cache/img/f2a09407f24ceb8bf2b1476a582be0bc-182338baoxaydung_3.jpg','2017-05-08 22:29:53'),(42,11,'project_thum_index','260x205','/web/cache/img/13d921690b45ae72c3dff01708d3f300-PVH-2.jpg','2017-05-08 22:46:05'),(43,11,'project_thum','260x171','/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-PVH-2.jpg','2017-05-08 22:52:40'),(44,2,'news_detail','200x250','/web/cache/img/cc59e3f985c49a939a2b0a39818b22c6-142337baoxaydung_29.jpg','2017-05-09 09:54:24');

/*Table structure for table `tn_candidate` */

DROP TABLE IF EXISTS `tn_candidate`;

CREATE TABLE `tn_candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `job_category_id` int(11) DEFAULT NULL,
  `skill_tags` varchar(1000) DEFAULT NULL,
  `skill` text,
  `location` int(11) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `resume_content` text,
  `resume_file` varchar(255) DEFAULT NULL,
  `social_network` varchar(1000) DEFAULT NULL,
  `education` varchar(1000) DEFAULT NULL,
  `experience` varchar(1000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT '0',
  `approved_at` datetime DEFAULT NULL,
  `view` int(11) DEFAULT '0',
  `sorted` int(11) DEFAULT '1',
  `star` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `tn_candidate` */

insert  into `tn_candidate`(`id`,`user_id`,`title`,`slug`,`job_category_id`,`skill_tags`,`skill`,`location`,`video`,`resume_content`,`resume_file`,`social_network`,`education`,`experience`,`created_by`,`created_at`,`updated_by`,`updated_at`,`approved_by`,`approved_at`,`view`,`sorted`,`star`,`status`) values (1,42,'Consequatur pariatur Illo in suscipit Nam ut cumque',NULL,9,'tona|nguyen|van','tona|nguyen|van',66,'Voluptatibus et cupiditate earum molestias illum eum est et officia beatae consequatur ullam soluta quaerat ratione sit et dolore temporibus','','',NULL,NULL,'42',NULL,NULL,NULL,NULL,0,NULL,0,1,0,0),(2,42,'Quia et quas voluptas et aliquam Nam tenetur cum nemo possimus nemo molestias error eveniet dolorem totam in est',NULL,29,'tona|nguyen|van','tona|nguyen|van',17,'Eu vitae quo labore mollitia aut enim expedita est enim expedita esse aliquam commodo eos nesciunt consequatur saepe atque consequatur','<p>Maecenas mollis dictum lectus quis scelerisque. Nulla at rutrum ipsum. Praesent augue quam, facilisis vitae felis vel, convallis convallis nisi. Donec maximus accumsan purus vel tempus. Aenean pretium luctus velit id fermentum. Aenean non velit non nulla interdum venenatis. Integer in libero sagittis, consequat est quis, commodo odio. Aliquam eu vulputate neque. Nunc et massa leo. Vestibulum a pretium dolor. Proin et fermentum sapien. Cras malesuada neque ac purus fermentum, a placerat quam malesuada. Quisque sollicitudin tellus a ex eleifend mattis. In vitae ipsum in mauris vestibulum imperdiet.\r\n\r\nMaecenas mollis dictum lectus quis scelerisque. Nulla at rutrum ipsum. Praesent augue quam, facilisis vitae felis vel, convallis convallis nisi. Donec maximus accumsan purus vel tempus. Aenean pretium luctus velit id fermentum. Aenean non velit non nulla interdum venenatis. Integer in libero sagittis, consequat est quis, commodo odio. Aliquam eu vulputate neque. Nunc et massa leo. Vestibulum a pretium dolor. Proin et fermentum sapien. Cras malesuada neque ac purus fermentum, a placerat quam malesuada. Quisque sollicitudin tellus a ex eleifend mattis. In vitae ipsum in mauris vestibulum imperdiet.</p>','',NULL,NULL,'42',42,NULL,NULL,NULL,0,NULL,0,1,0,0),(3,42,'Quia et quas voluptas et aliquam Nam tenetur cum nemo possimus nemo molestias error eveniet dolorem totam in est',NULL,29,'tona|nguyen|van','tona|nguyen|van',17,'Eu vitae quo labore mollitia aut enim expedita est enim expedita esse aliquam commodo eos nesciunt consequatur saepe atque consequatur','<p>Error est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestia</p>','',NULL,NULL,'42',42,'2016-09-28 18:00:20',42,'2016-09-28 18:00:20',0,NULL,0,1,0,0),(4,42,'Quia et quas voluptas et aliquam Nam tenetur cum nemo possimus nemo molestias error eveniet dolorem totam in est',NULL,29,'tona|nguyen|van','tona|nguyen|van',17,'Eu vitae quo labore mollitia aut enim expedita est enim expedita esse aliquam commodo eos nesciunt consequatur saepe atque consequatur','<p>Error est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestia</p>','',NULL,NULL,'42',42,'2016-09-28 18:00:33',42,'2016-09-28 18:00:33',0,NULL,0,1,0,0),(5,42,'Quia et quas voluptas et aliquam Nam tenetur cum nemo possimus nemo molestias error eveniet dolorem totam in est',NULL,29,'tona|nguyen|van','tona|nguyen|van',17,'Eu vitae quo labore mollitia aut enim expedita est enim expedita esse aliquam commodo eos nesciunt consequatur saepe atque consequatur','<p>Error est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestia</p>','',NULL,NULL,'42',42,'2016-09-28 18:03:09',42,'2016-09-28 18:03:09',0,NULL,0,1,0,0),(6,42,'Quia et quas voluptas et aliquam Nam tenetur cum nemo possimus nemo molestias error eveniet dolorem totam in est',NULL,29,'tona|nguyen|van','tona|nguyen|van',17,'Eu vitae quo labore mollitia aut enim expedita est enim expedita esse aliquam commodo eos nesciunt consequatur saepe atque consequatur','<p>Error est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestia</p>','',NULL,NULL,'42',42,'2016-09-28 18:03:38',42,'2016-09-28 18:03:38',0,NULL,0,1,0,0),(7,43,'Tempora ullamco voluptates quae at iste explicabo Laborum excepturi nulla sed eius iste provident rerum obcaecati culpa porro eum',NULL,15,'tona|nguyen|van','tona|nguyen|van',59,'Aut dolor rerum asperiores qui molestias magnam modi harum reprehenderit commodo in beatae eiusmod aut','<p>Error est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestia</p>','','[{\"id\":\"5\",\"value\":\"Ad sed aut in quis animi nihil molestiae sit officiis libero qui labore quod sint labore\"},{\"id\":\"3\",\"value\":\"In molestias et ea dolorum enim aut voluptas similique officia nisi aliquip aut numquam placeat et dolor aliquam totam dicta\"},{\"id\":\"5\",\"value\":\"Qui ex aut ut deserunt aut autem molestiae reprehenderit deserunt odit totam voluptatibus earum commodi\"}]','[{\"education_shool_name\":\"Lucian Cooley\",\"education_start_date\":\"12-Mar-1984\",\"education_qualifications\":\"Est amet Nam est nobis corporis reiciendis officia ipsa blanditiis corrupti minima non\",\"education_note\":\"Exercitationem et assumenda quo sit vel dolore in perferendis autem voluptas\"},{\"education_shool_name\":\"Abra Cardenas\",\"education_start_date\":\"13-Jan-1980\",\"education_qualifications\":\"Ab dolore nihil ut laudantium sed reprehenderit non\",\"education_note\":\"Esse sapiente illo est et soluta porro tempora\"}]','[{\"experience_employer\":\"Esse eveniet soluta nihil est dolore exercitation distinctio Exercitationem nihil et\",\"experience_start_date\":\"26-Mar-2012\",\"experience_job_title\":\"Tenetur est qui doloremque in maxime enim qui voluptas impedit ut quae ea suscipit\",\"experience_responsibilities\":\"Cupidatat ullam repudiandae libero adipisicing labore eu alias\"},{\"experience_employer\":\"Optio qui velit consequuntur ullam dolores labore distinctio Ipsum reprehenderit reprehenderit dolores sint perspiciatis consequuntur magna nihil\",\"experience_start_date\":\"06-Feb-2009\",\"experience_job_title\":\"Voluptas ut blanditiis veniam quis veritatis earum nulla recusandae Expedita possimus quidem provident amet id\",\"experience_responsibilities\":\"Eum unde aute rem deleniti mollitia vel atque labore\"}]',43,'2016-09-30 19:12:41',43,'2016-09-30 19:12:41',0,NULL,0,1,0,0),(8,43,'Tempora ullamco voluptates quae at iste explicabo Laborum excepturi nulla sed eius iste provident rerum obcaecati culpa porro eum','tempora-ullamco-voluptates-quae-at-iste-explicabo-laborum-excepturi-nulla-sed-eius-iste-provident-rerum-obcaecati-culpa-porro-eum',15,'tona|nguyen|van','Laboris in pariatur. Nostrud magna cupiditate sequi quibusdam dolore dolorem accusantium incididunt error quos et minim quae voluptate eum anim.',59,'Aut dolor rerum asperiores qui molestias magnam modi harum reprehenderit commodo in beatae eiusmod aut','','','[{\"id\":\"5\",\"value\":\"Ad sed aut in quis animi nihil molestiae sit officiis libero qui labore quod sint labore\"},{\"id\":\"3\",\"value\":\"In molestias et ea dolorum enim aut voluptas similique officia nisi aliquip aut numquam placeat et dolor aliquam totam dicta\"},{\"id\":\"5\",\"value\":\"Qui ex aut ut deserunt aut autem molestiae reprehenderit deserunt odit totam voluptatibus earum commodi\"}]','[{\"education_shool_name\":\"Lucian Cooley\",\"education_start_date\":\"12-Mar-1984\",\"education_qualifications\":\"Est amet Nam est nobis corporis reiciendis officia ipsa blanditiis corrupti minima non\",\"education_note\":\"Exercitationem et assumenda quo sit vel dolore in perferendis autem voluptas\"},{\"education_shool_name\":\"Abra Cardenas\",\"education_start_date\":\"13-Jan-1980\",\"education_qualifications\":\"Ab dolore nihil ut laudantium sed reprehenderit non\",\"education_note\":\"Esse sapiente illo est et soluta porro tempora\"}]','[{\"experience_employer\":\"Esse eveniet soluta nihil est dolore exercitation distinctio Exercitationem nihil et\",\"experience_start_date\":\"26-Mar-2012\",\"experience_job_title\":\"Tenetur est qui doloremque in maxime enim qui voluptas impedit ut quae ea suscipit\",\"experience_responsibilities\":\"Cupidatat ullam repudiandae libero adipisicing labore eu alias\"},{\"experience_employer\":\"Optio qui velit consequuntur ullam dolores labore distinctio Ipsum reprehenderit reprehenderit dolores sint perspiciatis consequuntur magna nihil\",\"experience_start_date\":\"06-Feb-2009\",\"experience_job_title\":\"Voluptas ut blanditiis veniam quis veritatis earum nulla recusandae Expedita possimus quidem provident amet id\",\"experience_responsibilities\":\"Eum unde aute rem deleniti mollitia vel atque labore\"}]',43,'2016-09-30 19:35:37',43,'2016-09-30 19:35:37',0,NULL,0,1,0,0),(9,43,'Officia ipsum mollit ut repellendus Repudiandae officia dolore tenetur quos saepe repudiandae ducimus ut','officia-ipsum-mollit-ut-repellendus-repudiandae-officia-dolore-tenetur-quos-saepe-repudiandae-ducimus-ut',42,'tona|nguyen|van','Numquam et magna harum maxime optio, aperiam quae quidem ut.',1,'Nostrud est aut suscipit cupiditate ut obcaecati occaecat sed reiciendis ea quasi veritatis reprehenderit delectus laboris dolore placeat magnam','<p>Numquam et magna harum maxime optio, aperiam quae quidem ut.Numquam et magna harum maxime optio, aperiam quae quidem ut.</p>','','[{\"id\":\"2\",\"value\":\"Recusandae Enim in asperiores voluptatem adipisicing consequatur Adipisicing totam ipsam recusandae Et deserunt placeat dignissimos impedit ea voluptate quibusdam enim\"},{\"id\":\"4\",\"value\":\"Accusantium Nam beatae tempore consectetur ea amet exercitationem nihil qui et quo temporibus tempore accusantium totam\"},{\"id\":\"2\",\"value\":\"Commodi at mollit debitis totam sapiente qui aut iusto velit omnis tempor\"}]','[{\"education_shool_name\":\"Xena Hahn\",\"education_start_date\":\"18-Feb-2013\",\"education_qualifications\":\"28-Jul-1977\",\"education_note\":\"12-Mar-2000\"}]','[{\"experience_employer\":\"Maxime dolore impedit eiusmod proident consectetur vel atque id\",\"experience_start_date\":\"27-Jun-2008\",\"experience_job_title\":\"Harum sint nostrud nesciunt voluptatum facere qui perferendis adipisci culpa libero eaque aute animi soluta iusto amet\",\"experience_responsibilities\":\"Quo est id eum Nam sed aliquip vitae\"},{\"experience_employer\":\"Dicta ut quisquam corporis incidunt nostrud at qui laborum Enim quisquam labore id mollitia\",\"experience_start_date\":\"14-Sep-1986\",\"experience_job_title\":\"Dolorem repudiandae harum hic harum dolor ea\",\"experience_responsibilities\":\"Eligendi similique aliqua Reiciendis labore corporis in\"}]',43,'2016-09-30 19:36:11',43,'2016-09-30 19:36:11',0,NULL,0,1,0,0),(10,43,'Autem non adipisci repellendus Atque sint est voluptatem reprehenderit magnam vel incidunt quod irure ullam','autem-non-adipisci-repellendus-atque-sint-est-voluptatem-reprehenderit-magnam-vel-incidunt-quod-irure-ullam',21,'php','Maxime qui ex optio, in elit, a maxime laudantium, enim nisi eligendi dolorem corrupti, ad recusandae.',52,'Rerum ratione iure lorem occaecat non quasi ea sint officia voluptatibus ea voluptatem id et rem vel natus ut neque','','','[]','[]','[]',43,'2016-09-30 19:39:22',43,'2016-09-30 19:39:22',0,NULL,0,1,0,0),(11,44,'Facilis aut obcaecati minima enim eos autem nobis enim est quibusdam laborum aut tempora doloremque deserunt odio officia ullam','facilis-aut-obcaecati-minima-enim-eos-autem-nobis-enim-est-quibusdam-laborum-aut-tempora-doloremque-deserunt-odio-officia-ullam',50,'php','Non error occaecat qui magni quos sunt saepe nulla dolor veritatis dolore laboris dolore ex consectetur, velit, necessitatibus porro.',29,'Qui reiciendis aut aliqua Sint','','','[]','[]','[]',44,'2016-09-30 19:48:21',44,'2016-09-30 19:48:21',0,NULL,0,1,0,0),(12,44,'Facilis aut obcaecati minima enim eos autem nobis enim est quibusdam laborum aut tempora doloremque deserunt odio officia ullam','facilis-aut-obcaecati-minima-enim-eos-autem-nobis-enim-est-quibusdam-laborum-aut-tempora-doloremque-deserunt-odio-officia-ullam',50,'php','Non error occaecat qui magni quos sunt saepe nulla dolor veritatis dolore laboris dolore ex consectetur, velit, necessitatibus porro.',29,'Qui reiciendis aut aliqua Sint','','','[]','[]','[]',44,'2016-09-30 19:48:38',44,'2016-09-30 19:48:38',0,NULL,0,1,0,0),(13,44,'Facilis aut obcaecati minima enim eos autem nobis enim est quibusdam laborum aut tempora doloremque deserunt odio officia ullam','facilis-aut-obcaecati-minima-enim-eos-autem-nobis-enim-est-quibusdam-laborum-aut-tempora-doloremque-deserunt-odio-officia-ullam',50,'php','Non error occaecat qui magni quos sunt saepe nulla dolor veritatis dolore laboris dolore ex consectetur, velit, necessitatibus porro.',29,'Qui reiciendis aut aliqua Sint','','','[]','[]','[]',44,'2016-09-30 19:48:54',44,'2016-09-30 19:48:54',0,NULL,0,1,0,0),(14,44,'Facilis aut obcaecati minima enim eos autem nobis enim est quibusdam laborum aut tempora doloremque deserunt odio officia ullam','facilis-aut-obcaecati-minima-enim-eos-autem-nobis-enim-est-quibusdam-laborum-aut-tempora-doloremque-deserunt-odio-officia-ullam',50,'php','Non error occaecat qui magni quos sunt saepe nulla dolor veritatis dolore laboris dolore ex consectetur, velit, necessitatibus porro.',29,'Qui reiciendis aut aliqua Sint','','','[]','[]','[]',44,'2016-09-30 19:49:09',44,'2016-09-30 19:49:09',0,NULL,0,1,0,0),(16,44,'Sit et accusamus voluptas labore minus maiores dolor minim saepe qui esse animi aperiam voluptas deleniti laboriosam id voluptatum temporibus','sit-et-accusamus-voluptas-labore-minus-maiores-dolor-minim-saepe-qui-esse-animi-aperiam-voluptas-deleniti-laboriosam-id-voluptatum-temporibus',67,'php','Quisquam autem do est, eaque suscipit corrupti, earum ea pariatur? Cillum deleniti ut ipsa, nisi aut culpa, tempora aspernatur in.',79,'Saepe quas eligendi optio voluptatibus perferendis ut amet qui ut qui dolores inventore et voluptatum magni','ssSaepe quas eligendi optio voluptatibus perferendis ut amet qui ut qui dolores inventore et voluptatum magni','','[]','[]','[]',44,'2016-09-30 20:33:37',44,'2016-09-30 20:33:37',0,NULL,0,1,0,0),(17,44,'Sit et accusamus voluptas labore minus maiores dolor minim saepe qui esse animi aperiam voluptas deleniti laboriosam id voluptatum temporibus','sit-et-accusamus-voluptas-labore-minus-maiores-dolor-minim-saepe-qui-esse-animi-aperiam-voluptas-deleniti-laboriosam-id-voluptatum-temporibus',67,'php','Quisquam autem do est, eaque suscipit corrupti, earum ea pariatur? Cillum deleniti ut ipsa, nisi aut culpa, tempora aspernatur in.',79,'Saepe quas eligendi optio voluptatibus perferendis ut amet qui ut qui dolores inventore et voluptatum magni','<p>ssSaepe quas eligendi optio voluptatibus perferendis ut amet qui ut qui dolores inventore et voluptatum magni</p>','','[]','[]','[]',44,'2016-09-30 20:39:07',44,'2016-09-30 20:39:07',0,NULL,0,1,0,0),(18,43,'Quod porro accusamus aperiam officia suscipit laborum aut quis totam dolor odit commodi minus','quod-porro-accusamus-aperiam-officia-suscipit-laborum-aut-quis-totam-dolor-odit-commodi-minus',57,'php|jquery|js|html|css','<p>+ L&atilde;nh đạo</p>\r\n<p>+ L&agrave;m việc nh&oacute;m</p>\r\n<p>+ Giải quyết vấn đề</p>\r\n<p>+ Ra quyết định</p>\r\n<p>+ Quản l&yacute; dự &aacute;n</p>\r\n<p>+ Quản l&yacute; thời gian</p>\r\n<p>+ Quản l&yacute; giao tiếp</p>\r\n<p>+ Quản l&yacute; s&aacute;ng tạo</p>\r\n<p>+ Học hiệu quả</p>',21,'Minus eaque earum sit quam veniam cupidatat quisquam id laborum Ut fugiat voluptatem et et sunt labore exercitation','<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span></p>','','[{\"id\":\"1\",\"value\":\"Neque magnam dolor consequatur sapiente id ipsam velit aspernatur veritatis dolor magna enim deserunt tempore quia\"}]','[{\"education_shool_name\":\"Andrew Perry\",\"education_start_date\":\"14-Jul-1996\",\"education_qualifications\":\"Explicabo Est veritatis laudantium nulla deserunt porro facilis perspiciatis minima quis enim totam quia omnis in deleniti harum accusamus\",\"education_note\":\"At corporis debitis qui dolores harum vel eaque lorem facilis nostrud exercitationem omnis\"}]','[{\"experience_employer\":\"Quos obcaecati voluptatum in quasi libero commodi minim sapiente ut ut libero sit et sed\",\"experience_start_date\":\"13-Sep-2016\",\"experience_job_title\":\"Similique est animi aut sunt provident illum velit ducimus aut voluptate sed aliqua Iusto aute quis veniam harum quisquam eaque\",\"experience_responsibilities\":\"Labore ut vitae totam dolor aut sunt mollitia\"}]',43,'2016-10-01 18:50:57',43,'2016-10-01 18:50:57',0,NULL,0,1,0,0);

/*Table structure for table `tn_candidate_tags` */

DROP TABLE IF EXISTS `tn_candidate_tags`;

CREATE TABLE `tn_candidate_tags` (
  `candidate_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`candidate_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_candidate_tags` */

insert  into `tn_candidate_tags`(`candidate_id`,`tag_id`) values (5,6),(5,7),(5,8),(6,6),(6,7),(6,8),(7,6),(7,7),(7,8),(8,6),(8,7),(8,8),(9,6),(9,7),(9,8),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(18,2),(18,3),(18,4),(18,5),(19,1),(19,2),(19,3),(19,4),(19,5),(20,1),(20,2),(20,3),(20,4),(20,5),(21,1),(21,2),(21,3),(21,4),(21,5);

/*Table structure for table `tn_carousel` */

DROP TABLE IF EXISTS `tn_carousel`;

CREATE TABLE `tn_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tn_carousel` */

insert  into `tn_carousel`(`id`,`name`,`description`,`slug`,`status`) values (2,'Dashboard','For dashboard','dashboard',1);

/*Table structure for table `tn_carousel_items` */

DROP TABLE IF EXISTS `tn_carousel_items`;

CREATE TABLE `tn_carousel_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_id` int(11) NOT NULL,
  `img_thum` varchar(255) DEFAULT NULL,
  `img_view` varchar(255) NOT NULL,
  `img_original` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `link` varchar(255) DEFAULT NULL,
  `target` varchar(15) DEFAULT '_self',
  `sorted` int(11) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `tn_carousel_items` */

insert  into `tn_carousel_items`(`id`,`carousel_id`,`img_thum`,`img_view`,`img_original`,`title`,`description`,`link`,`target`,`sorted`,`status`) values (3,2,NULL,'/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0242.JPG',NULL,'Dự án cải tạo khu biệt thự Kinh Đô','Dự án cải tạo khu biệt thự Kinh Đô','http://xaydungtaco.com/cong-trinh/du-an-cai-tao-khu-biet-thu-kinh-do.html','_blank',1,1),(5,2,NULL,'/web/uploads/images/Dang-thi-cong/Le-co/10.JPG',NULL,'Nhà phố đường Lê Cơ, Phường An Lạc, Quận Bình Tân','Nhà phố đường Lê Cơ, Phường An Lạc, Quận Bình Tân','http://xaydungtaco.com/cong-trinh/nha-pho-duong-le-co-phuong-an-lac-quan-binh-tan.html','',2,1),(6,2,NULL,'/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/8.jpg',NULL,'Nhà phố đường số 22, Phường Hiệp Bình Chánh, Q. Thủ Đức','Nhà phố đường số 22, Phường Hiệp Bình Chánh, Q. Thủ Đức','http://xaydungtaco.com/cong-trinh/nha-pho-duong-so-22-phuong-hiep-binh-chanh-q-thu-duc.html','',3,1),(7,2,NULL,'/web/uploads/images/Dang-thi-cong/nha-hem-36-bui-tu-toan/IMG_0711.JPG',NULL,'Nhà phố hẻm 36 đường Bùi Tư Toàn, P.An Lạc, Q. BÌnh Tân','Nhà phố hẻm 36 đường Bùi Tư Toàn, P.An Lạc, Q. BÌnh Tân','','',NULL,1);

/*Table structure for table `tn_company` */

DROP TABLE IF EXISTS `tn_company`;

CREATE TABLE `tn_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `content` text,
  `scale` int(5) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` smallint(1) DEFAULT NULL,
  `arranged` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tn_company` */

insert  into `tn_company`(`id`,`location_id`,`name`,`logo`,`content`,`scale`,`address`,`phone`,`fax`,`tax_id`,`created_by`,`created_at`,`status`,`arranged`) values (1,NULL,'Tona com','','<p>ấ<br></p>',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(2,NULL,'Nana','','<p>Nânnâ</p>',NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL);

/*Table structure for table `tn_curriculum_vitae` */

DROP TABLE IF EXISTS `tn_curriculum_vitae`;

CREATE TABLE `tn_curriculum_vitae` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `content` text,
  `tags` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `effect_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `arrange` int(5) DEFAULT NULL,
  `star` smallint(1) DEFAULT '0',
  `status` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_curriculum_vitae` */

/*Table structure for table `tn_dropdown` */

DROP TABLE IF EXISTS `tn_dropdown`;

CREATE TABLE `tn_dropdown` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `decription` text,
  `arranged` int(5) DEFAULT '1',
  `status` smallint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `tn_dropdown` */

insert  into `tn_dropdown`(`id`,`type`,`name`,`decription`,`arranged`,`status`) values (1,1,'Nhân viên chính thức',NULL,1,1),(2,1,'Nhân viên thời vụ',NULL,1,1),(3,1,'Bán thời gian',NULL,1,1),(4,1,'Làm thêm ngoài giờ',NULL,1,1),(5,1,'Thực tập & dự án',NULL,1,1),(6,2,'Chưa có kinh nghiệm',NULL,1,1),(7,2,'Dưới 1 năm',NULL,1,1),(8,2,'1 năm',NULL,1,1),(9,2,'2 năm',NULL,1,1),(10,2,'3 năm',NULL,1,1),(11,2,'4 năm',NULL,1,1),(12,2,'5 năm',NULL,1,1),(13,2,'Trên 5 năm',NULL,1,1),(14,3,'Đại học',NULL,1,1),(15,3,'Cao đẳng',NULL,1,1),(16,3,'Trung cấp',NULL,1,1),(17,3,'Cao học',NULL,1,1),(18,3,'Trung học',NULL,1,1),(19,3,'Chứng chỉ',NULL,1,1),(20,3,'Lao động phổ thông',NULL,1,1),(21,4,'Nam',NULL,1,1),(22,4,'Nữ',NULL,1,1),(23,4,'Không yêu cầu',NULL,1,1),(24,5,'Dưới 3',NULL,1,1),(25,5,'3-5 Triệu',NULL,1,1),(26,5,'5-7 triệu',NULL,1,1),(27,5,'7-10 triệu',NULL,1,1),(28,5,'10-12 triệu',NULL,1,1),(29,5,'12-15 triệu',NULL,1,1),(30,5,'15-20 triệu',NULL,1,1),(31,5,'20-25 triệu',NULL,1,1),(32,5,'25-30 triệu',NULL,1,1),(33,5,'Trên 30 triệu',NULL,1,1);

/*Table structure for table `tn_events` */

DROP TABLE IF EXISTS `tn_events`;

CREATE TABLE `tn_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type_id` tinyint(2) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `slug` varchar(255) DEFAULT NULL,
  `all_day` tinyint(1) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `url` varchar(155) DEFAULT NULL,
  `className` varchar(155) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT NULL,
  `startEditable` tinyint(1) DEFAULT NULL,
  `durationEditable` tinyint(1) DEFAULT NULL,
  `resourceEditable` tinyint(1) DEFAULT NULL,
  `rendering` varchar(155) DEFAULT NULL,
  `overlap` tinyint(1) DEFAULT NULL,
  `constraint` varchar(155) DEFAULT NULL,
  `source` varchar(155) DEFAULT NULL,
  `color` varchar(55) DEFAULT NULL,
  `backgroundColor` varchar(55) DEFAULT NULL,
  `borderColor` varchar(55) DEFAULT NULL,
  `textColor` varchar(55) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_events` */

/*Table structure for table `tn_job_categories` */

DROP TABLE IF EXISTS `tn_job_categories`;

CREATE TABLE `tn_job_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(11) DEFAULT NULL,
  `description` text,
  `icon_class` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `arranged` int(5) DEFAULT '1',
  `total_jobs` int(5) DEFAULT NULL,
  `total_cv` int(5) DEFAULT NULL,
  `status` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_job_categories` */

/*Table structure for table `tn_jobs` */

DROP TABLE IF EXISTS `tn_jobs`;

CREATE TABLE `tn_jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `content` text,
  `tags` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `effect_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `arrange` int(5) DEFAULT NULL,
  `star` smallint(1) DEFAULT '0',
  `status` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_jobs` */

/*Table structure for table `tn_locations` */

DROP TABLE IF EXISTS `tn_locations`;

CREATE TABLE `tn_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '3' COMMENT '1:Quoc Gia,2:Thanh pho,3Tinh thanh',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

/*Data for the table `tn_locations` */

insert  into `tn_locations`(`id`,`parent_id`,`name`,`description`,`type`,`status`) values (1,64,'An Giang',NULL,3,1),(2,64,'Bà Rịa - Vũng Tàu',NULL,3,1),(3,64,'Bắc Giang',NULL,3,1),(4,64,'Bắc Kạn',NULL,3,1),(5,64,'Bạc Liêu',NULL,3,1),(6,64,'Bắc Ninh',NULL,3,1),(7,64,'Bến Tre',NULL,3,1),(8,64,'Bình Định',NULL,3,1),(9,64,'Bình Dương',NULL,3,1),(10,64,'Bình Phước',NULL,3,1),(11,64,'Bình Thuận',NULL,3,1),(12,64,'Cà Mau',NULL,3,1),(13,64,'Cao Bằng',NULL,3,1),(14,64,'Đắk Lắk',NULL,3,1),(15,64,'Đắk Nông',NULL,3,1),(16,64,'Điện Biên',NULL,3,1),(17,64,'Đồng Nai',NULL,3,1),(18,64,'Đồng Tháp',NULL,3,1),(19,64,'Gia Lai',NULL,3,1),(20,64,'Hà Giang',NULL,3,1),(21,64,'Hà Nam',NULL,3,1),(22,64,'Hà Tĩnh',NULL,3,1),(23,64,'Hải Dương',NULL,3,1),(24,64,'Hậu Giang',NULL,3,1),(25,64,'Hòa Bình',NULL,3,1),(26,64,'Hưng Yên',NULL,3,1),(27,64,'Khánh Hòa',NULL,3,1),(28,64,'Kiên Giang',NULL,3,1),(29,64,'Kon Tum',NULL,3,1),(30,64,'Lai Châu',NULL,3,1),(31,64,'Lâm Đồng',NULL,3,1),(32,64,'Lạng Sơn',NULL,3,1),(33,64,'Lào Cai',NULL,3,1),(34,64,'Long An',NULL,3,1),(35,64,'Nam Định',NULL,3,1),(36,64,'Nghệ An',NULL,3,1),(37,64,'Ninh Bình',NULL,3,1),(38,64,'Ninh Thuận',NULL,3,1),(39,64,'Phú Thọ',NULL,3,1),(40,64,'Quảng Bình',NULL,3,1),(41,64,'Quảng Nam',NULL,3,1),(42,64,'Quảng Ngãi',NULL,3,1),(43,64,'Quảng Ninh',NULL,3,1),(44,64,'Quảng Trị',NULL,3,1),(45,64,'Sóc Trăng',NULL,3,1),(46,64,'Sơn La',NULL,3,1),(47,64,'Tây Ninh',NULL,3,1),(48,64,'Thái Bình',NULL,3,1),(49,64,'Thái Nguyên',NULL,3,1),(50,64,'Thanh Hóa',NULL,3,1),(51,64,'Thừa Thiên Huế',NULL,3,1),(52,64,'Tiền Giang',NULL,3,1),(53,64,'Trà Vinh',NULL,3,1),(54,64,'Tuyên Quang',NULL,3,1),(55,64,'Vĩnh Long',NULL,3,1),(56,64,'Vĩnh Phúc',NULL,3,1),(57,64,'Yên Bái',NULL,3,1),(58,64,'Phú Yên',NULL,3,1),(59,64,'Cần Thơ',NULL,3,1),(60,64,'Đà Nẵng',NULL,3,1),(61,64,'Hải Phòng',NULL,3,1),(62,64,'Hà Nội',NULL,3,1),(63,64,'TP HCM',NULL,3,1),(64,0,'Việt Nam',NULL,1,1),(65,63,'Quận 1',NULL,3,1),(66,63,'Quận 2',NULL,3,1),(67,63,'Quận 3',NULL,3,1),(68,63,'Quận 4',NULL,3,1),(69,63,'Quận 5',NULL,3,1),(70,63,'Quận 6',NULL,3,1),(71,63,'Quận 7',NULL,3,1),(72,63,'Quận 8',NULL,3,1),(73,63,'Quận 9',NULL,3,1),(74,63,'Quận 10',NULL,3,1),(75,63,'Quận 11',NULL,3,1),(76,63,'Quận 12',NULL,3,1),(77,63,'Bình Tân',NULL,3,1),(78,63,'Bình Thạnh',NULL,3,1),(79,63,'Tân Bình',NULL,3,1),(80,63,'Gò Vấp',NULL,3,1),(81,63,'Phú Nhuận',NULL,3,1),(82,63,'Tân Phú',NULL,3,1),(83,63,'Thủ Đức',NULL,3,1);

/*Table structure for table `tn_log_system` */

DROP TABLE IF EXISTS `tn_log_system`;

CREATE TABLE `tn_log_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `controller` varchar(55) DEFAULT NULL,
  `action` varchar(55) DEFAULT NULL,
  `method` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11460 DEFAULT CHARSET=utf8;

/*Data for the table `tn_log_system` */

/*Table structure for table `tn_news` */

DROP TABLE IF EXISTS `tn_news`;

CREATE TABLE `tn_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` text,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `sorted` int(11) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `start` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_comment` tinyint(1) DEFAULT '0',
  `is_publish` tinyint(1) DEFAULT '1',
  `publish_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_news` */

/*Table structure for table `tn_news_category` */

DROP TABLE IF EXISTS `tn_news_category`;

CREATE TABLE `tn_news_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` text,
  `description` varchar(255) DEFAULT NULL,
  `sorted` int(11) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_news_category` */

/*Table structure for table `tn_page` */

DROP TABLE IF EXISTS `tn_page`;

CREATE TABLE `tn_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` text,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `actived` tinyint(1) DEFAULT NULL,
  `pape_template` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_page` */

/*Table structure for table `tn_pages` */

DROP TABLE IF EXISTS `tn_pages`;

CREATE TABLE `tn_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `view` int(11) DEFAULT '0',
  `pape_template` smallint(1) DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_pages` */

/*Table structure for table `tn_post` */

DROP TABLE IF EXISTS `tn_post`;

CREATE TABLE `tn_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text,
  `content` text,
  `img` varchar(255) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `sorted` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `arranged` int(5) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_post` */

/*Table structure for table `tn_post_category` */

DROP TABLE IF EXISTS `tn_post_category`;

CREATE TABLE `tn_post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `content` text,
  `img` varchar(255) DEFAULT NULL,
  `arranged` int(11) DEFAULT '1',
  `status` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_post_category` */

/*Table structure for table `tn_product` */

DROP TABLE IF EXISTS `tn_product`;

CREATE TABLE `tn_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` text,
  `content` text,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `price_in` double DEFAULT NULL,
  `price_out` double DEFAULT NULL,
  `price_sale` double DEFAULT NULL,
  `quantity_remaining` float DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `is_comment` smallint(1) DEFAULT NULL,
  `arranged` int(11) DEFAULT NULL,
  `status` smallint(1) DEFAULT NULL,
  `is_deleted` smallint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_product` */

/*Table structure for table `tn_product_category` */

DROP TABLE IF EXISTS `tn_product_category`;

CREATE TABLE `tn_product_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `arranged` int(5) DEFAULT NULL,
  `status` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_product_category` */

/*Table structure for table `tn_setting` */

DROP TABLE IF EXISTS `tn_setting`;

CREATE TABLE `tn_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(55) NOT NULL,
  `value` varchar(55) DEFAULT NULL,
  `default` varchar(55) DEFAULT NULL,
  `sorted` int(11) DEFAULT '1',
  `input` enum('text','password','submit','reset','radio','checkbox','number','email','select','textarea','image') DEFAULT 'text',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_setting` */

/*Table structure for table `tn_system` */

DROP TABLE IF EXISTS `tn_system`;

CREATE TABLE `tn_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(55) NOT NULL,
  `value` varchar(55) DEFAULT NULL,
  `value_number` int(11) DEFAULT NULL,
  `default` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_system` */

/*Table structure for table `tn_tags` */

DROP TABLE IF EXISTS `tn_tags`;

CREATE TABLE `tn_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_tags` */

/*Table structure for table `tn_time_zone` */

DROP TABLE IF EXISTS `tn_time_zone`;

CREATE TABLE `tn_time_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(155) DEFAULT NULL,
  `code` varchar(155) DEFAULT NULL,
  `utc` varchar(15) DEFAULT NULL,
  `sorted` int(11) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_time_zone` */

/*Table structure for table `tn_user` */

DROP TABLE IF EXISTS `tn_user`;

CREATE TABLE `tn_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `auth_key` varchar(128) NOT NULL,
  `access_token` varchar(128) DEFAULT NULL,
  `password_reset_token` varchar(128) DEFAULT NULL,
  `role` tinyint(1) DEFAULT '0',
  `name` varchar(32) DEFAULT '--',
  `slug_name` varchar(155) DEFAULT NULL,
  `avatar` varchar(155) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `type` tinyint(1) DEFAULT '1',
  `lang` varchar(5) DEFAULT 'vi',
  `timezone` varchar(100) DEFAULT 'Asia/Bangkok',
  `attributes` text,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token` (`access_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tn_user` */

insert  into `tn_user`(`id`,`username`,`email`,`password`,`auth_key`,`access_token`,`password_reset_token`,`role`,`name`,`slug_name`,`avatar`,`avatar_url`,`archive`,`type`,`lang`,`timezone`,`attributes`,`status`) values (1,'nguyennguyen.vt89@gmail.com','nguyennguyen.vt89@gmail.com','$2y$13$oaZ8yXovgTCy11dG5HvoCOLQ5PPVCEuxENiutTjfdvG6yrKnh/hKe','nVNrKnJTkszeCdmw20pVEz_bUoNNFgkj',NULL,'',0,'Tona',NULL,NULL,NULL,0,1,'vi','Asia/Bangkok',NULL,1),(2,'na@gmail.com','na@gmail.com','123123','eX7C3RC0BSn7z4eCML7X9ATWnVA_WERy',NULL,'',0,'Na',NULL,NULL,NULL,0,1,'vi','Asia/Bangkok',NULL,1);

/*Table structure for table `tn_user_details` */

DROP TABLE IF EXISTS `tn_user_details`;

CREATE TABLE `tn_user_details` (
  `user_id` int(11) unsigned NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `changed_password_date` datetime DEFAULT NULL,
  `job_title_id` int(11) DEFAULT NULL,
  `direct_manager_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `active_tour_guide` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_user_details` */

insert  into `tn_user_details`(`user_id`,`email`,`first_name`,`middle_name`,`last_name`,`gender`,`birthday`,`phone`,`address`,`changed_password_date`,`job_title_id`,`direct_manager_id`,`city_id`,`registration_date`,`approved_by`,`approved_at`,`active_tour_guide`) values (1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,NULL,NULL,NULL,NULL,21,NULL,'','HCM',NULL,NULL,NULL,2,NULL,NULL,NULL,1);

/*Table structure for table `tn_user_online` */

DROP TABLE IF EXISTS `tn_user_online`;

CREATE TABLE `tn_user_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(255) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `controller` varchar(55) DEFAULT NULL,
  `action` varchar(55) DEFAULT NULL,
  `method` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_user_online` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
