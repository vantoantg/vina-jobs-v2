/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.26-MariaDB : Database - vinajobs_db
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

insert  into `auth_item_child`(`parent`,`child`) values ('admin','author'),('admin','updatePost'),('author','createPost');

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

/*Table structure for table `tn_job_categories` */

DROP TABLE IF EXISTS `tn_job_categories`;

CREATE TABLE `tn_job_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon_class` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `arrange` int(5) DEFAULT NULL,
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

/*Table structure for table `tn_location` */

DROP TABLE IF EXISTS `tn_location`;

CREATE TABLE `tn_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `arrange` int(11) DEFAULT NULL,
  `status` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tn_location` */

/*Table structure for table `tn_user` */

DROP TABLE IF EXISTS `tn_user`;

CREATE TABLE `tn_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Data for the table `tn_user` */

insert  into `tn_user`(`id`,`username`,`email`,`password`,`auth_key`,`access_token`,`password_reset_token`,`role`,`name`,`slug_name`,`avatar`,`avatar_url`,`archive`,`type`,`lang`,`timezone`,`attributes`,`status`) values (1,'admin',NULL,'$2y$13$HAh9iitRiwHuDnNUM8w/qubkrFmh1GLZ.EG/VwkTz3jSBSzg1nafC','!','admin','Jvm(',1,'Tona','','/web/uploads/images/users/11947627_1196879580337720_2083630260241166797_n.jpg',NULL,0,1,'vi','Asia/Bangkok',NULL,1),(41,'tonanguyen',NULL,'$2y$13$HAh9iitRiwHuDnNUM8w/qubkrFmh1GLZ.EG/VwkTz3jSBSzg1nafC','p','','',1,'Nguyen Tona','','',NULL,0,1,'vi','Asia/Bangkok',NULL,1),(55,'trangnguyen',NULL,'$2y$13$XgdSsGjA1jqk99QnQY1F9uMoAeQoRPmTPVeGj4j53RVfgEWdcaTye','','a','d',1,'Nguyễn Thu Trang','','',NULL,0,1,'vi','Asia/Bangkok',NULL,1),(63,'toannguyen-lockon','nvtoan@lockon-vn.com','$2y$13$OCtc0eLIyUhc9T8D23FY6egggHyXv/9GvpwKOAm3kTWJ0zV59ip.K','?#??`?g?(E`sp?΅???EB|???D@O?C',NULL,'l????\'??\'?`0?ӍS\0s#?1~\Z˩\nJߑ;?_1517375379',0,NULL,NULL,NULL,'https://avatars3.githubusercontent.com/u/32531859?v=4',0,4,'vi','Asia/Bangkok','{\"login\":\"toannguyen-lockon\",\"id\":32531859,\"avatar_url\":\"https:\\/\\/avatars3.githubusercontent.com\\/u\\/32531859?v=4\",\"gravatar_id\":\"\",\"url\":\"https:\\/\\/api.github.com\\/users\\/toannguyen-lockon\",\"html_url\":\"https:\\/\\/github.com\\/toannguyen-lockon\",\"followers_url\":\"https:\\/\\/api.github.com\\/users\\/toannguyen-lockon\\/followers\",\"following_url\":\"https:\\/\\/api.github.com\\/users\\/toannguyen-lockon\\/following{\\/other_user}\",\"gists_url\":\"https:\\/\\/api.github.com\\/users\\/toannguyen-lockon\\/gists{\\/gist_id}\",\"starred_url\":\"https:\\/\\/api.github.com\\/users\\/toannguyen-lockon\\/starred{\\/owner}{\\/repo}\",\"subscriptions_url\":\"https:\\/\\/api.github.com\\/users\\/toannguyen-lockon\\/subscriptions\",\"organizations_url\":\"https:\\/\\/api.github.com\\/users\\/toannguyen-lockon\\/orgs\",\"repos_url\":\"https:\\/\\/api.github.com\\/users\\/toannguyen-lockon\\/repos\",\"events_url\":\"https:\\/\\/api.github.com\\/users\\/toannguyen-lockon\\/events{\\/privacy}\",\"received_events_url\":\"https:\\/\\/api.github.com\\/users\\/toannguyen-lockon\\/received_events\",\"type\":\"User\",\"site_admin\":false,\"name\":null,\"company\":null,\"blog\":\"\",\"location\":null,\"email\":\"nvtoan@lockon-vn.com\",\"hireable\":null,\"bio\":null,\"public_repos\":9,\"public_gists\":0,\"followers\":0,\"following\":0,\"created_at\":\"2017-10-05T02:54:21Z\",\"updated_at\":\"2017-10-05T02:55:33Z\",\"private_gists\":0,\"total_private_repos\":0,\"owned_private_repos\":0,\"disk_usage\":0,\"collaborators\":0,\"two_factor_authentication\":false,\"plan\":{\"name\":\"free\",\"space\":976562499,\"collaborators\":0,\"private_repos\":0}}',1),(64,'nguyennguyen.vt88@gmail.com','nguyennguyen.vt88@gmail.com','$2y$13$AJw38Z7YPQKYXfUSgZjYTOkca9pMdKVEGlWGCrTjTdJbvH0.A6wdO','?9q?kV31?M#?\'A?!?$5=??t??e)?1??',NULL,'ļ?\"Fq??????)X?l?a????W???]?Rd?_1517915594',0,'Tona Nguyễn',NULL,NULL,'http://pbs.twimg.com/profile_images/783859214158401536/HtcoUwaV_normal.jpg',0,4,'vi','Asia/Bangkok','{\"id\":212611144,\"id_str\":\"212611144\",\"name\":\"Tona Nguy\\u1ec5n\",\"screen_name\":\"vantoantg\",\"location\":\"Vietnam\",\"description\":\"\\ud83d\\ude04\",\"url\":\"https:\\/\\/t.co\\/oKrn9ZcfBD\",\"entities\":{\"url\":{\"urls\":[{\"url\":\"https:\\/\\/t.co\\/oKrn9ZcfBD\",\"expanded_url\":\"http:\\/\\/vina-jobs.com\",\"display_url\":\"vina-jobs.com\",\"indices\":[0,23]}]},\"description\":{\"urls\":[]}},\"protected\":false,\"followers_count\":16,\"friends_count\":16,\"listed_count\":0,\"created_at\":\"Sat Nov 06 15:20:31 +0000 2010\",\"favourites_count\":0,\"utc_offset\":25200,\"time_zone\":\"Bangkok\",\"geo_enabled\":false,\"verified\":false,\"statuses_count\":133,\"lang\":\"en\",\"status\":{\"created_at\":\"Wed May 17 06:39:38 +0000 2017\",\"id\":864732121658662912,\"id_str\":\"864732121658662912\",\"text\":\"https:\\/\\/t.co\\/cFP0rWC0TF via @koonktech\",\"truncated\":false,\"entities\":{\"hashtags\":[],\"symbols\":[],\"user_mentions\":[{\"screen_name\":\"KoonkTech\",\"name\":\"Koonk-Cloudrino\",\"id\":2579381322,\"id_str\":\"2579381322\",\"indices\":[28,38]}],\"urls\":[{\"url\":\"https:\\/\\/t.co\\/cFP0rWC0TF\",\"expanded_url\":\"http:\\/\\/cloudrino.xyz\\/?ref=210020\",\"display_url\":\"cloudrino.xyz\\/?ref=210020\",\"indices\":[0,23]}]},\"source\":\"<a href=\\\"http:\\/\\/twitter.com\\\" rel=\\\"nofollow\\\">Twitter Web Client<\\/a>\",\"in_reply_to_status_id\":null,\"in_reply_to_status_id_str\":null,\"in_reply_to_user_id\":null,\"in_reply_to_user_id_str\":null,\"in_reply_to_screen_name\":null,\"geo\":null,\"coordinates\":null,\"place\":null,\"contributors\":null,\"is_quote_status\":false,\"retweet_count\":0,\"favorite_count\":0,\"favorited\":false,\"retweeted\":false,\"possibly_sensitive\":false,\"lang\":\"und\"},\"contributors_enabled\":false,\"is_translator\":false,\"is_translation_enabled\":false,\"profile_background_color\":\"000000\",\"profile_background_image_url\":\"http:\\/\\/abs.twimg.com\\/images\\/themes\\/theme4\\/bg.gif\",\"profile_background_image_url_https\":\"https:\\/\\/abs.twimg.com\\/images\\/themes\\/theme4\\/bg.gif\",\"profile_background_tile\":false,\"profile_image_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/783859214158401536\\/HtcoUwaV_normal.jpg\",\"profile_image_url_https\":\"https:\\/\\/pbs.twimg.com\\/profile_images\\/783859214158401536\\/HtcoUwaV_normal.jpg\",\"profile_link_color\":\"ABB8C2\",\"profile_sidebar_border_color\":\"000000\",\"profile_sidebar_fill_color\":\"000000\",\"profile_text_color\":\"000000\",\"profile_use_background_image\":false,\"has_extended_profile\":true,\"default_profile\":false,\"default_profile_image\":false,\"following\":false,\"follow_request_sent\":false,\"notifications\":false,\"translator_type\":\"none\",\"email\":\"nguyennguyen.vt88@gmail.com\",\"login\":\"vantoantg\",\"avatar_url\":\"http:\\/\\/pbs.twimg.com\\/profile_images\\/783859214158401536\\/HtcoUwaV_normal.jpg\"}',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
