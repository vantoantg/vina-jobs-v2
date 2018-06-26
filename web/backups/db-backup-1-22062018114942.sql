DROP TABLE auth_assignment;

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO auth_assignment VALUES("admin","1","1516773665");
INSERT INTO auth_assignment VALUES("author","41","1516773665");



DROP TABLE auth_item;

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

INSERT INTO auth_item VALUES("admin","1","","","","1516773665","1516773665");
INSERT INTO auth_item VALUES("author","1","","","","1516773665","1516773665");
INSERT INTO auth_item VALUES("createPost","2","Create a post","","","1516773665","1516773665");
INSERT INTO auth_item VALUES("updatePost","2","Update post","","","1516773665","1516773665");



DROP TABLE auth_item_child;

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO auth_item_child VALUES("admin","author");
INSERT INTO auth_item_child VALUES("author","createPost");
INSERT INTO auth_item_child VALUES("admin","updatePost");



DROP TABLE auth_rule;

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE migration;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO migration VALUES("m000000_000000_base","1514960736");
INSERT INTO migration VALUES("m140506_102106_rbac_init","1516773316");
INSERT INTO migration VALUES("m170907_052038_rbac_add_index_on_auth_assignment_user_id","1516773316");
INSERT INTO migration VALUES("m180103_062712_tn_user","1514960974");
INSERT INTO migration VALUES("m180124_055839_init_rbac","1516773665");
INSERT INTO migration VALUES("m180130_052158_update_user","1517290665");
INSERT INTO migration VALUES("m180328_151738_add_setting_pagi_default","1523287772");
INSERT INTO migration VALUES("m180328_153820_ex_data","1523287772");
INSERT INTO migration VALUES("m180330_042506_create_skills_tables","1523287772");
INSERT INTO migration VALUES("m180401_144940_delete_user","1523287772");
INSERT INTO migration VALUES("m180403_033430_user_jobs","1523287772");
INSERT INTO migration VALUES("m180408_094758_field_ws","1523287772");
INSERT INTO migration VALUES("m180409_054628_change","1523287772");
INSERT INTO migration VALUES("m180414_151147_jobs_cate","1523723265");
INSERT INTO migration VALUES("m180418_054857_tn_file_uploads","1524670805");
INSERT INTO migration VALUES("m180419_135004_abc","1524670805");
INSERT INTO migration VALUES("m180425_152436_modify","1524670805");
INSERT INTO migration VALUES("m180426_160805_aaa","1524762403");
INSERT INTO migration VALUES("m180426_164323_aaaa","1524762403");
INSERT INTO migration VALUES("m180502_155604_user_candidate","1525277614");
INSERT INTO migration VALUES("m180503_152634_change_jobs","1525364036");
INSERT INTO migration VALUES("m180503_160004_comment","1525364036");
INSERT INTO migration VALUES("m180517_060358_add_field","1526572116");
INSERT INTO migration VALUES("m180607_151858_cv_end_date","1528388488");



DROP TABLE tn_article;

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

INSERT INTO tn_article VALUES("2","3","1","","du-an-cai-tao-khu-biet-thu-kinh-do","<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0036.JPG\" style=\"height:700px; width:1000px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0041.JPG\" style=\"height:700px; width:1000px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0059.JPG\" style=\"height:700px; width:1000px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0125.JPG\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0217.JPG\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0275.JPG\" style=\"height:700px; width:1000px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0233.JPG\" style=\"height:700px; width:1000px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0241.JPG\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0242.JPG\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0378.JPG\" /></p>\n","/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0378.JPG","","","","","","","","","0","","0","0","","0","1");
INSERT INTO tn_article VALUES("3","3","1","","nha-pho-duong-le-co-phuong-an-lac-quan-binh-tan","<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/9.JPG\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/10.JPG\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/1.JPG\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/2.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/3.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/4.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/5.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/6.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/7.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Le-co/8.JPG\" style=\"height:1000px; width:700px\" /></p>\n","/web/uploads/images/Dang-thi-cong/Le-co/10.JPG","","","","","","","","","0","","0","0","","0","1");
INSERT INTO tn_article VALUES("4","3","1","","nha-pho-duong-so-22-phuong-hiep-binh-chanh-q-thu-duc","<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/8.jpg\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/1.JPG\" style=\"height:700px; width:1000px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/2.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/3.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/4.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/5.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/6.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/7.JPG\" style=\"height:1000px; width:700px\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n","/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/8.jpg","","","","","","","","","0","","0","0","","0","1");
INSERT INTO tn_article VALUES("5","3","","","nha?-pho??-he?m-36-du?o??ng-bui-tu-toan-p-an-lac-qbinh-tan","<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/nha-hem-36-bui-tu-toan/IMG_0711.JPG\" /></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/nha-hem-36-bui-tu-toan/IMG_0712.JPG\" /></p>\n","/web/uploads/images/Dang-thi-cong/nha-hem-36-bui-tu-toan/IMG_0712.JPG","","","","","","","","","0","","0","0","","0","1");
INSERT INTO tn_article VALUES("6","3","1","","nha-pho-quan-2","<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Dang-thi-cong/nha-pho-q2/Phoi-canh-quan-2-003.jpg\" /></p>\n","/web/uploads/images/Dang-thi-cong/nha-pho-q2/Phoi-canh-quan-2-003.jpg","","nha dep, nha q2, nha quan 2, nha ho quan 2, thiet ke nha q2, nha quan 2 gia re","nha dep, nha q2, nha quan 2, nha ho quan 2, thiet ke nha q2, nha quan 2 gia re","","","","","","0","nha dep, nha q2, nha quan 2, nha ho quan 2, thiet ke nha q2, nha quan 2 gia re","0","0","","0","1");
INSERT INTO tn_article VALUES("7","3","2","","biet-thu-vuon-duong-so-22-p-hiep-binh-chanh-q-thu-duc","<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/6.PNG\" /></em></p>\n\n<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/1.JPG\" /></em></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/2.JPG\" /></em></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/3.JPG\" /></em></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/4.JPG\" /></em></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><em><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/5.JPG\" /></em></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n","/web/uploads/images/Da-thi-cong/biet-thu-vuong-duong22-thu-duc/6.PNG","","biet thu vuon, xay nha biet thu, biet thu vuon gia re, thiet ke biet thu, biet thu quan thu duc, nha quan thu duc, xay biet thu quan thu duc","biet thu vuon, xay nha biet thu, biet thu vuon gia re, thiet ke biet thu, biet thu quan thu duc, nha quan thu duc, xay biet thu quan thu duc, ","","","","","","0","biet thu vuon, xay nha biet thu, biet thu vuon gia re, thiet ke biet thu, biet thu quan thu duc, nha quan thu duc, xay biet thu quan thu duc","0","0","","0","1");
INSERT INTO tn_article VALUES("8","3","2","","biet-thu-duong-ho-van-long-pbinh-tri-dong-qbinh-tan","<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/Biet-thu-ho-van-long-binh-tan/xam.png\" /></p>\n","/web/uploads/images/Da-thi-cong/Biet-thu-ho-van-long-binh-tan/xam.png","","xay nha dep, xay biet thu","xay nha dep, xay biet thu","","","","","","0","","0","0","","0","1");
INSERT INTO tn_article VALUES("9","3","2","","nha-vuon-huyenk-binh-dai-tinh-ben-tre","<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-binh-dai-ben-tre/2015-11-17_11-30-04.png\" /></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-binh-dai-ben-tre/2015-11-17_11-30-58.png\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-binh-dai-ben-tre/2015-11-17_11-31-32.png\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-binh-dai-ben-tre/2015-11-17_11-31-54.png\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n","/web/uploads/images/Da-thi-cong/nha-binh-dai-ben-tre/2015-11-17_11-30-04.png","","","","","","","","","0","","0","0","","0","1");
INSERT INTO tn_article VALUES("10","3","2","","du-an-hado-duong-3-thang-2-quan-10","<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0372.JPG\" /></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0534.JPG\" /></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0537.JPG\" /></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0538.JPG\" /></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0540.JPG\" /></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0541.JPG\" /></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0543.JPG\" /></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0545.JPG\" /></p>\n","/web/uploads/images/Da-thi-cong/du-an-ha-do-3-thang-2/IMG_0545.JPG","","du an hado, hado, ha do, du an hado 3 thang 2, hado 3/2, hado 3 thang 2, du an duong 3/2","du an hado, hado, ha do, du an hado 3 thang 2, hado 3/2, hado 3 thang 2, du an duong 3/2","","","","","","0","du an hado, hado, ha do, du an hado 3 thang 2, hado 3/2, hado 3 thang 2, du an duong 3/2","0","0","","0","1");
INSERT INTO tn_article VALUES("11","3","2","","nha-pho-duong-pham-van-hai-phuong-2-q-phu-nhuan","<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/PVH-1.jpg\" style=\"height:960px; width:1280px\" /></p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/PVH-2.jpg\" style=\"height:960px; width:1280px\" /></p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/PVH-3%20-%20Copy.jpg\" style=\"height:1200px; width:800px\" /></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/PVH-3.jpg\" style=\"height:1200px; width:800px\" /></p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/Phong%20khach%201.jpg\" style=\"height:854px; width:1280px\" /></p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/Phong%20khach%202.jpg\" /></p>\n","/web/uploads/images/Da-thi-cong/nha-pho-pham-van-hai-phu-nhuan/PVH-2.jpg","","","","","","","","","0","","0","0","","0","1");



DROP TABLE tn_article_category;

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

INSERT INTO tn_article_category VALUES("1","0","Gioi thieu","gioi-thieu","","/web/uploads/images/nnt-500x300-ab59b985f1-92c0b3c88abec48591ee6ff9ac250463_small.jpg","","","1","1");
INSERT INTO tn_article_category VALUES("2","0","D?ch v?","dich-vu","dich-vu","/web/uploads/images/intranet_cover.jpg","d","","1","1");
INSERT INTO tn_article_category VALUES("3","0","","du-an","","/web/uploads/images/nnt-500x300-ab59b985f1-92c0b3c88abec48591ee6ff9ac250463_small.jpg","","","1","1");



DROP TABLE tn_cache_img;

CREATE TABLE `tn_cache_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `img_size` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tn_cache_img VALUES("1","7","carousel_thum","1130x400","/web/cache/img/89cd832fe515edc9cf9afb402846c255-IMG_0711.JPG","2017-05-05 17:56:44");
INSERT INTO tn_cache_img VALUES("2","3","carousel_thum","1130x400","/web/cache/img/89cd832fe515edc9cf9afb402846c255-IMG_0242.JPG","2017-05-05 17:56:44");
INSERT INTO tn_cache_img VALUES("3","5","carousel_thum","1130x400","/web/cache/img/89cd832fe515edc9cf9afb402846c255-10.JPG","2017-05-05 17:56:44");
INSERT INTO tn_cache_img VALUES("4","6","carousel_thum","1130x400","/web/cache/img/89cd832fe515edc9cf9afb402846c255-8.jpg","2017-05-05 17:56:45");
INSERT INTO tn_cache_img VALUES("5","6","project_thum_index","260x205","/web/cache/img/13d921690b45ae72c3dff01708d3f300-Phoi-canh-quan-2-003.jpg","2017-05-05 17:56:45");
INSERT INTO tn_cache_img VALUES("6","4","project_thum_index","260x205","/web/cache/img/13d921690b45ae72c3dff01708d3f300-8.jpg","2017-05-05 17:56:45");
INSERT INTO tn_cache_img VALUES("7","3","project_thum_index","260x205","/web/cache/img/13d921690b45ae72c3dff01708d3f300-10.JPG","2017-05-05 17:56:45");
INSERT INTO tn_cache_img VALUES("8","2","project_thum_index","260x205","/web/cache/img/13d921690b45ae72c3dff01708d3f300-IMG_0378.JPG","2017-05-05 17:56:45");
INSERT INTO tn_cache_img VALUES("9","9","project_thum_index","260x205","/web/cache/img/13d921690b45ae72c3dff01708d3f300-2015-11-17_11-30-04.png","2017-05-05 17:56:45");
INSERT INTO tn_cache_img VALUES("10","4","artitcle_detail","740x350","/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-8.jpg","2017-05-05 17:56:55");
INSERT INTO tn_cache_img VALUES("11","11","news_sidebar","65x65","/web/cache/img/f2a09407f24ceb8bf2b1476a582be0bc-100935baoxaydung_2.jpg","2017-05-05 17:56:55");
INSERT INTO tn_cache_img VALUES("12","10","news_sidebar","65x65","/web/cache/img/f2a09407f24ceb8bf2b1476a582be0bc-175801baoxaydung_16.jpg","2017-05-05 17:56:55");
INSERT INTO tn_cache_img VALUES("13","9","news_sidebar","65x65","/web/cache/img/f2a09407f24ceb8bf2b1476a582be0bc-150751baoxaydung_9.jpg","2017-05-05 17:56:55");
INSERT INTO tn_cache_img VALUES("14","9","artitcle_detail","740x350","/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-2015-11-17_11-30-04.png","2017-05-05 17:58:58");
INSERT INTO tn_cache_img VALUES("15","9","project_thum","260x171","/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-2015-11-17_11-30-04.png","2017-05-05 17:59:40");
INSERT INTO tn_cache_img VALUES("16","11","news_list","260x150","/web/cache/img/978e0517923493e37aeba87f8d2677fb-100935baoxaydung_2.jpg","2017-05-05 17:59:51");
INSERT INTO tn_cache_img VALUES("17","10","news_list","260x150","/web/cache/img/978e0517923493e37aeba87f8d2677fb-175801baoxaydung_16.jpg","2017-05-05 17:59:51");
INSERT INTO tn_cache_img VALUES("18","9","news_list","260x150","/web/cache/img/978e0517923493e37aeba87f8d2677fb-150751baoxaydung_9.jpg","2017-05-05 17:59:51");
INSERT INTO tn_cache_img VALUES("19","4","news_list","260x150","/web/cache/img/978e0517923493e37aeba87f8d2677fb-1490674562-149067129763960-toa-nha-1.jpg","2017-05-05 17:59:51");
INSERT INTO tn_cache_img VALUES("20","2","news_list","260x150","/web/cache/img/978e0517923493e37aeba87f8d2677fb-142337baoxaydung_29.jpg","2017-05-05 17:59:51");
INSERT INTO tn_cache_img VALUES("21","1","news_list","260x150","/web/cache/img/978e0517923493e37aeba87f8d2677fb-095621baoxaydung_8.jpg","2017-05-05 17:59:51");
INSERT INTO tn_cache_img VALUES("22","8","project_thum","260x171","/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-xam.png","2017-05-05 18:39:01");
INSERT INTO tn_cache_img VALUES("23","8","artitcle_detail","740x350","/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-xam.png","2017-05-05 18:39:08");
INSERT INTO tn_cache_img VALUES("24","8","project_thum_index","260x205","/web/cache/img/13d921690b45ae72c3dff01708d3f300-xam.png","2017-05-05 18:39:16");
INSERT INTO tn_cache_img VALUES("25","7","project_thum_index","260x205","/web/cache/img/13d921690b45ae72c3dff01708d3f300-6.PNG","2017-05-05 18:45:44");
INSERT INTO tn_cache_img VALUES("26","10","project_thum_index","260x205","/web/cache/img/13d921690b45ae72c3dff01708d3f300-IMG_0545.JPG","2017-05-05 19:00:47");
INSERT INTO tn_cache_img VALUES("27","10","artitcle_detail","740x350","/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-IMG_0545.JPG","2017-05-05 19:00:58");
INSERT INTO tn_cache_img VALUES("28","10","project_thum","260x171","/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-IMG_0545.JPG","2017-05-05 19:01:40");
INSERT INTO tn_cache_img VALUES("29","7","project_thum","260x171","/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-6.PNG","2017-05-05 19:01:41");
INSERT INTO tn_cache_img VALUES("30","6","project_thum","260x171","/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-Phoi-canh-quan-2-003.jpg","2017-05-05 19:01:46");
INSERT INTO tn_cache_img VALUES("31","4","project_thum","260x171","/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-8.jpg","2017-05-05 19:01:46");
INSERT INTO tn_cache_img VALUES("32","3","project_thum","260x171","/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-10.JPG","2017-05-05 19:01:46");
INSERT INTO tn_cache_img VALUES("33","2","project_thum","260x171","/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-IMG_0378.JPG","2017-05-05 19:01:46");
INSERT INTO tn_cache_img VALUES("34","3","artitcle_detail","740x350","/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-10.JPG","2017-05-05 20:06:32");
INSERT INTO tn_cache_img VALUES("35","7","artitcle_detail","740x350","/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-6.PNG","2017-05-05 20:56:37");
INSERT INTO tn_cache_img VALUES("36","6","artitcle_detail","740x350","/web/cache/img/4a0d950fb5362d31e49f5da29e5039e3-Phoi-canh-quan-2-003.jpg","2017-05-05 20:57:13");
INSERT INTO tn_cache_img VALUES("37","10","news_detail","200x250","/web/cache/img/cc59e3f985c49a939a2b0a39818b22c6-175801baoxaydung_16.jpg","2017-05-05 20:57:46");
INSERT INTO tn_cache_img VALUES("38","11","news_detail","200x250","/web/cache/img/cc59e3f985c49a939a2b0a39818b22c6-100935baoxaydung_2.jpg","2017-05-06 22:50:44");
INSERT INTO tn_cache_img VALUES("39","13","news_list","260x150","/web/cache/img/978e0517923493e37aeba87f8d2677fb-182338baoxaydung_3.jpg","2017-05-08 22:29:50");
INSERT INTO tn_cache_img VALUES("40","13","news_detail","200x250","/web/cache/img/cc59e3f985c49a939a2b0a39818b22c6-182338baoxaydung_3.jpg","2017-05-08 22:29:53");
INSERT INTO tn_cache_img VALUES("41","13","news_sidebar","65x65","/web/cache/img/f2a09407f24ceb8bf2b1476a582be0bc-182338baoxaydung_3.jpg","2017-05-08 22:29:53");
INSERT INTO tn_cache_img VALUES("42","11","project_thum_index","260x205","/web/cache/img/13d921690b45ae72c3dff01708d3f300-PVH-2.jpg","2017-05-08 22:46:05");
INSERT INTO tn_cache_img VALUES("43","11","project_thum","260x171","/web/cache/img/6f54dd5f105700ed7b1597e29f11b1e4-PVH-2.jpg","2017-05-08 22:52:40");
INSERT INTO tn_cache_img VALUES("44","2","news_detail","200x250","/web/cache/img/cc59e3f985c49a939a2b0a39818b22c6-142337baoxaydung_29.jpg","2017-05-09 09:54:24");



DROP TABLE tn_candidate;

CREATE TABLE `tn_candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `job_category_id` int(11) DEFAULT NULL,
  `skill_tags` varchar(1000) DEFAULT NULL,
  `skill` text,
  `location` varchar(255) DEFAULT NULL,
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
  `receives` smallint(1) DEFAULT '1',
  `star` smallint(1) DEFAULT '0',
  `client_status` smallint(1) DEFAULT '1',
  `status` smallint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

INSERT INTO tn_candidate VALUES("1","42","Consequatur pariatur Illo in suscipit Nam ut cumque","","9","tona|nguyen|van","tona|nguyen|van","66","Voluptatibus et cupiditate earum molestias illum eum est et officia beatae consequatur ullam soluta quaerat ratione sit et dolore temporibus","","","","","42","","","","","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("2","42","Quia et quas voluptas et aliquam Nam tenetur cum nemo possimus nemo molestias error eveniet dolorem totam in est","","29","tona|nguyen|van","tona|nguyen|van","17","Eu vitae quo labore mollitia aut enim expedita est enim expedita esse aliquam commodo eos nesciunt consequatur saepe atque consequatur","<p>Maecenas mollis dictum lectus quis scelerisque. Nulla at rutrum ipsum. Praesent augue quam, facilisis vitae felis vel, convallis convallis nisi. Donec maximus accumsan purus vel tempus. Aenean pretium luctus velit id fermentum. Aenean non velit non nulla interdum venenatis. Integer in libero sagittis, consequat est quis, commodo odio. Aliquam eu vulputate neque. Nunc et massa leo. Vestibulum a pretium dolor. Proin et fermentum sapien. Cras malesuada neque ac purus fermentum, a placerat quam malesuada. Quisque sollicitudin tellus a ex eleifend mattis. In vitae ipsum in mauris vestibulum imperdiet.\n\nMaecenas mollis dictum lectus quis scelerisque. Nulla at rutrum ipsum. Praesent augue quam, facilisis vitae felis vel, convallis convallis nisi. Donec maximus accumsan purus vel tempus. Aenean pretium luctus velit id fermentum. Aenean non velit non nulla interdum venenatis. Integer in libero sagittis, consequat est quis, commodo odio. Aliquam eu vulputate neque. Nunc et massa leo. Vestibulum a pretium dolor. Proin et fermentum sapien. Cras malesuada neque ac purus fermentum, a placerat quam malesuada. Quisque sollicitudin tellus a ex eleifend mattis. In vitae ipsum in mauris vestibulum imperdiet.</p>","","","","42","42","","","","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("3","42","Quia et quas voluptas et aliquam Nam tenetur cum nemo possimus nemo molestias error eveniet dolorem totam in est","","29","tona|nguyen|van","tona|nguyen|van","17","Eu vitae quo labore mollitia aut enim expedita est enim expedita esse aliquam commodo eos nesciunt consequatur saepe atque consequatur","<p>Error est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestia</p>","","","","42","42","2016-09-28 18:00:20","42","2016-09-28 18:00:20","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("4","42","Quia et quas voluptas et aliquam Nam tenetur cum nemo possimus nemo molestias error eveniet dolorem totam in est","","29","tona|nguyen|van","tona|nguyen|van","17","Eu vitae quo labore mollitia aut enim expedita est enim expedita esse aliquam commodo eos nesciunt consequatur saepe atque consequatur","<p>Error est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestia</p>","","","","42","42","2016-09-28 18:00:33","42","2016-09-28 18:00:33","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("5","42","Quia et quas voluptas et aliquam Nam tenetur cum nemo possimus nemo molestias error eveniet dolorem totam in est","","29","tona|nguyen|van","tona|nguyen|van","17","Eu vitae quo labore mollitia aut enim expedita est enim expedita esse aliquam commodo eos nesciunt consequatur saepe atque consequatur","<p>Error est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestia</p>","","","","42","42","2016-09-28 18:03:09","42","2016-09-28 18:03:09","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("6","42","Quia et quas voluptas et aliquam Nam tenetur cum nemo possimus nemo molestias error eveniet dolorem totam in est","","29","tona|nguyen|van","tona|nguyen|van","17","Eu vitae quo labore mollitia aut enim expedita est enim expedita esse aliquam commodo eos nesciunt consequatur saepe atque consequatur","<p>Error est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestia</p>","","","","42","42","2016-09-28 18:03:38","42","2016-09-28 18:03:38","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("7","43","Tempora ullamco voluptates quae at iste explicabo Laborum excepturi nulla sed eius iste provident rerum obcaecati culpa porro eum","","15","tona|nguyen|van","tona|nguyen|van","59","Aut dolor rerum asperiores qui molestias magnam modi harum reprehenderit commodo in beatae eiusmod aut","<p>Error est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestiaError est velit quod error hic earum omnis sint nemo ea magna aliquid molestia</p>","","[{\"id\":\"5\",\"value\":\"Ad sed aut in quis animi nihil molestiae sit officiis libero qui labore quod sint labore\"},{\"id\":\"3\",\"value\":\"In molestias et ea dolorum enim aut voluptas similique officia nisi aliquip aut numquam placeat et dolor aliquam totam dicta\"},{\"id\":\"5\",\"value\":\"Qui ex aut ut deserunt aut autem molestiae reprehenderit deserunt odit totam voluptatibus earum commodi\"}]","[{\"education_shool_name\":\"Lucian Cooley\",\"education_start_date\":\"12-Mar-1984\",\"education_qualifications\":\"Est amet Nam est nobis corporis reiciendis officia ipsa blanditiis corrupti minima non\",\"education_note\":\"Exercitationem et assumenda quo sit vel dolore in perferendis autem voluptas\"},{\"education_shool_name\":\"Abra Cardenas\",\"education_start_date\":\"13-Jan-1980\",\"education_qualifications\":\"Ab dolore nihil ut laudantium sed reprehenderit non\",\"education_note\":\"Esse sapiente illo est et soluta porro tempora\"}]","[{\"experience_employer\":\"Esse eveniet soluta nihil est dolore exercitation distinctio Exercitationem nihil et\",\"experience_start_date\":\"26-Mar-2012\",\"experience_job_title\":\"Tenetur est qui doloremque in maxime enim qui voluptas impedit ut quae ea suscipit\",\"experience_responsibilities\":\"Cupidatat ullam repudiandae libero adipisicing labore eu alias\"},{\"experience_employer\":\"Optio qui velit consequuntur ullam dolores labore distinctio Ipsum reprehenderit reprehenderit dolores sint perspiciatis consequuntur magna nihil\",\"experience_start_date\":\"06-Feb-2009\",\"experience_job_title\":\"Voluptas ut blanditiis veniam quis veritatis earum nulla recusandae Expedita possimus quidem provident amet id\",\"experience_responsibilities\":\"Eum unde aute rem deleniti mollitia vel atque labore\"}]","43","2016-09-30 19:12:41","43","2016-09-30 19:12:41","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("8","43","Tempora ullamco voluptates quae at iste explicabo Laborum excepturi nulla sed eius iste provident rerum obcaecati culpa porro eum","tempora-ullamco-voluptates-quae-at-iste-explicabo-laborum-excepturi-nulla-sed-eius-iste-provident-rerum-obcaecati-culpa-porro-eum","15","tona|nguyen|van","Laboris in pariatur. Nostrud magna cupiditate sequi quibusdam dolore dolorem accusantium incididunt error quos et minim quae voluptate eum anim.","59","Aut dolor rerum asperiores qui molestias magnam modi harum reprehenderit commodo in beatae eiusmod aut","","","[{\"id\":\"5\",\"value\":\"Ad sed aut in quis animi nihil molestiae sit officiis libero qui labore quod sint labore\"},{\"id\":\"3\",\"value\":\"In molestias et ea dolorum enim aut voluptas similique officia nisi aliquip aut numquam placeat et dolor aliquam totam dicta\"},{\"id\":\"5\",\"value\":\"Qui ex aut ut deserunt aut autem molestiae reprehenderit deserunt odit totam voluptatibus earum commodi\"}]","[{\"education_shool_name\":\"Lucian Cooley\",\"education_start_date\":\"12-Mar-1984\",\"education_qualifications\":\"Est amet Nam est nobis corporis reiciendis officia ipsa blanditiis corrupti minima non\",\"education_note\":\"Exercitationem et assumenda quo sit vel dolore in perferendis autem voluptas\"},{\"education_shool_name\":\"Abra Cardenas\",\"education_start_date\":\"13-Jan-1980\",\"education_qualifications\":\"Ab dolore nihil ut laudantium sed reprehenderit non\",\"education_note\":\"Esse sapiente illo est et soluta porro tempora\"}]","[{\"experience_employer\":\"Esse eveniet soluta nihil est dolore exercitation distinctio Exercitationem nihil et\",\"experience_start_date\":\"26-Mar-2012\",\"experience_job_title\":\"Tenetur est qui doloremque in maxime enim qui voluptas impedit ut quae ea suscipit\",\"experience_responsibilities\":\"Cupidatat ullam repudiandae libero adipisicing labore eu alias\"},{\"experience_employer\":\"Optio qui velit consequuntur ullam dolores labore distinctio Ipsum reprehenderit reprehenderit dolores sint perspiciatis consequuntur magna nihil\",\"experience_start_date\":\"06-Feb-2009\",\"experience_job_title\":\"Voluptas ut blanditiis veniam quis veritatis earum nulla recusandae Expedita possimus quidem provident amet id\",\"experience_responsibilities\":\"Eum unde aute rem deleniti mollitia vel atque labore\"}]","43","2016-09-30 19:35:37","43","2016-09-30 19:35:37","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("9","43","Officia ipsum mollit ut repellendus Repudiandae officia dolore tenetur quos saepe repudiandae ducimus ut","officia-ipsum-mollit-ut-repellendus-repudiandae-officia-dolore-tenetur-quos-saepe-repudiandae-ducimus-ut","42","tona|nguyen|van","Numquam et magna harum maxime optio, aperiam quae quidem ut.","1","Nostrud est aut suscipit cupiditate ut obcaecati occaecat sed reiciendis ea quasi veritatis reprehenderit delectus laboris dolore placeat magnam","<p>Numquam et magna harum maxime optio, aperiam quae quidem ut.Numquam et magna harum maxime optio, aperiam quae quidem ut.</p>","","[{\"id\":\"2\",\"value\":\"Recusandae Enim in asperiores voluptatem adipisicing consequatur Adipisicing totam ipsam recusandae Et deserunt placeat dignissimos impedit ea voluptate quibusdam enim\"},{\"id\":\"4\",\"value\":\"Accusantium Nam beatae tempore consectetur ea amet exercitationem nihil qui et quo temporibus tempore accusantium totam\"},{\"id\":\"2\",\"value\":\"Commodi at mollit debitis totam sapiente qui aut iusto velit omnis tempor\"}]","[{\"education_shool_name\":\"Xena Hahn\",\"education_start_date\":\"18-Feb-2013\",\"education_qualifications\":\"28-Jul-1977\",\"education_note\":\"12-Mar-2000\"}]","[{\"experience_employer\":\"Maxime dolore impedit eiusmod proident consectetur vel atque id\",\"experience_start_date\":\"27-Jun-2008\",\"experience_job_title\":\"Harum sint nostrud nesciunt voluptatum facere qui perferendis adipisci culpa libero eaque aute animi soluta iusto amet\",\"experience_responsibilities\":\"Quo est id eum Nam sed aliquip vitae\"},{\"experience_employer\":\"Dicta ut quisquam corporis incidunt nostrud at qui laborum Enim quisquam labore id mollitia\",\"experience_start_date\":\"14-Sep-1986\",\"experience_job_title\":\"Dolorem repudiandae harum hic harum dolor ea\",\"experience_responsibilities\":\"Eligendi similique aliqua Reiciendis labore corporis in\"}]","43","2016-09-30 19:36:11","43","2016-09-30 19:36:11","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("10","43","Autem non adipisci repellendus Atque sint est voluptatem reprehenderit magnam vel incidunt quod irure ullam","autem-non-adipisci-repellendus-atque-sint-est-voluptatem-reprehenderit-magnam-vel-incidunt-quod-irure-ullam","21","php","Maxime qui ex optio, in elit, a maxime laudantium, enim nisi eligendi dolorem corrupti, ad recusandae.","52","Rerum ratione iure lorem occaecat non quasi ea sint officia voluptatibus ea voluptatem id et rem vel natus ut neque","","","[]","[]","[]","43","2016-09-30 19:39:22","43","2016-09-30 19:39:22","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("11","44","Facilis aut obcaecati minima enim eos autem nobis enim est quibusdam laborum aut tempora doloremque deserunt odio officia ullam","facilis-aut-obcaecati-minima-enim-eos-autem-nobis-enim-est-quibusdam-laborum-aut-tempora-doloremque-deserunt-odio-officia-ullam","50","php","Non error occaecat qui magni quos sunt saepe nulla dolor veritatis dolore laboris dolore ex consectetur, velit, necessitatibus porro.","29","Qui reiciendis aut aliqua Sint","","","[]","[]","[]","44","2016-09-30 19:48:21","44","2016-09-30 19:48:21","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("12","44","Facilis aut obcaecati minima enim eos autem nobis enim est quibusdam laborum aut tempora doloremque deserunt odio officia ullam","facilis-aut-obcaecati-minima-enim-eos-autem-nobis-enim-est-quibusdam-laborum-aut-tempora-doloremque-deserunt-odio-officia-ullam","50","php","Non error occaecat qui magni quos sunt saepe nulla dolor veritatis dolore laboris dolore ex consectetur, velit, necessitatibus porro.","29","Qui reiciendis aut aliqua Sint","","","[]","[]","[]","44","2016-09-30 19:48:38","44","2016-09-30 19:48:38","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("13","44","Facilis aut obcaecati minima enim eos autem nobis enim est quibusdam laborum aut tempora doloremque deserunt odio officia ullam","facilis-aut-obcaecati-minima-enim-eos-autem-nobis-enim-est-quibusdam-laborum-aut-tempora-doloremque-deserunt-odio-officia-ullam","50","php","Non error occaecat qui magni quos sunt saepe nulla dolor veritatis dolore laboris dolore ex consectetur, velit, necessitatibus porro.","29","Qui reiciendis aut aliqua Sint","","","[]","[]","[]","44","2016-09-30 19:48:54","44","2016-09-30 19:48:54","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("14","44","Facilis aut obcaecati minima enim eos autem nobis enim est quibusdam laborum aut tempora doloremque deserunt odio officia ullam","facilis-aut-obcaecati-minima-enim-eos-autem-nobis-enim-est-quibusdam-laborum-aut-tempora-doloremque-deserunt-odio-officia-ullam","50","php","Non error occaecat qui magni quos sunt saepe nulla dolor veritatis dolore laboris dolore ex consectetur, velit, necessitatibus porro.","29","Qui reiciendis aut aliqua Sint","","","[]","[]","[]","44","2016-09-30 19:49:09","44","2016-09-30 19:49:09","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("16","44","Sit et accusamus voluptas labore minus maiores dolor minim saepe qui esse animi aperiam voluptas deleniti laboriosam id voluptatum temporibus","sit-et-accusamus-voluptas-labore-minus-maiores-dolor-minim-saepe-qui-esse-animi-aperiam-voluptas-deleniti-laboriosam-id-voluptatum-temporibus","67","php","Quisquam autem do est, eaque suscipit corrupti, earum ea pariatur? Cillum deleniti ut ipsa, nisi aut culpa, tempora aspernatur in.","79","Saepe quas eligendi optio voluptatibus perferendis ut amet qui ut qui dolores inventore et voluptatum magni","ssSaepe quas eligendi optio voluptatibus perferendis ut amet qui ut qui dolores inventore et voluptatum magni","","[]","[]","[]","44","2016-09-30 20:33:37","44","2016-09-30 20:33:37","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("17","44","Sit et accusamus voluptas labore minus maiores dolor minim saepe qui esse animi aperiam voluptas deleniti laboriosam id voluptatum temporibus","sit-et-accusamus-voluptas-labore-minus-maiores-dolor-minim-saepe-qui-esse-animi-aperiam-voluptas-deleniti-laboriosam-id-voluptatum-temporibus","67","php","Quisquam autem do est, eaque suscipit corrupti, earum ea pariatur? Cillum deleniti ut ipsa, nisi aut culpa, tempora aspernatur in.","79","Saepe quas eligendi optio voluptatibus perferendis ut amet qui ut qui dolores inventore et voluptatum magni","<p>ssSaepe quas eligendi optio voluptatibus perferendis ut amet qui ut qui dolores inventore et voluptatum magni</p>","","[]","[]","[]","44","2016-09-30 20:39:07","44","2016-09-30 20:39:07","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("18","43","Quod porro accusamus aperiam officia suscipit laborum aut quis totam dolor odit commodi minus","quod-porro-accusamus-aperiam-officia-suscipit-laborum-aut-quis-totam-dolor-odit-commodi-minus","57","php|jquery|js|html|css","<p>+ L&atilde;nh ??o</p>\n<p>+ L&agrave;m vi?c nh&oacute;m</p>\n<p>+ Gi?i quy?t v?n ??</p>\n<p>+ Ra quy?t ??nh</p>\n<p>+ Qu?n l&yacute; d? &aacute;n</p>\n<p>+ Qu?n l&yacute; th?i gian</p>\n<p>+ Qu?n l&yacute; giao ti?p</p>\n<p>+ Qu?n l&yacute; s&aacute;ng t?o</p>\n<p>+ H?c hi?u qu?</p>","21","Minus eaque earum sit quam veniam cupidatat quisquam id laborum Ut fugiat voluptatem et et sunt labore exercitation","<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span></p>","","[{\"id\":\"1\",\"value\":\"Neque magnam dolor consequatur sapiente id ipsam velit aspernatur veritatis dolor magna enim deserunt tempore quia\"}]","[{\"education_shool_name\":\"Andrew Perry\",\"education_start_date\":\"14-Jul-1996\",\"education_qualifications\":\"Explicabo Est veritatis laudantium nulla deserunt porro facilis perspiciatis minima quis enim totam quia omnis in deleniti harum accusamus\",\"education_note\":\"At corporis debitis qui dolores harum vel eaque lorem facilis nostrud exercitationem omnis\"}]","[{\"experience_employer\":\"Quos obcaecati voluptatum in quasi libero commodi minim sapiente ut ut libero sit et sed\",\"experience_start_date\":\"13-Sep-2016\",\"experience_job_title\":\"Similique est animi aut sunt provident illum velit ducimus aut voluptate sed aliqua Iusto aute quis veniam harum quisquam eaque\",\"experience_responsibilities\":\"Labore ut vitae totam dolor aut sunt mollitia\"}]","43","2016-10-01 18:50:57","43","2016-10-01 18:50:57","0","","0","1","1","0","1","0");
INSERT INTO tn_candidate VALUES("19","87","","","75","","","63,60","","","","","1","8","","","","","0","","0","1","1","0","7","1");
INSERT INTO tn_candidate VALUES("20","89","","","75","","","63,60","","","","","1","8","","","","","0","","0","1","1","0","8","1");
INSERT INTO tn_candidate VALUES("21","92","","","49","","","63","","","","","1","8","","","","","0","","0","1","1","0","7","1");
INSERT INTO tn_candidate VALUES("22","97","","","25","","","63","","","","","2","5","","","","","0","","0","1","1","0","7","1");
INSERT INTO tn_candidate VALUES("23","98","","","25","","","63,62","","","","","2","5","","","","","0","","0","1","1","0","8","1");



DROP TABLE tn_candidate_tags;

CREATE TABLE `tn_candidate_tags` (
  `candidate_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`candidate_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tn_candidate_tags VALUES("5","6");
INSERT INTO tn_candidate_tags VALUES("5","7");
INSERT INTO tn_candidate_tags VALUES("5","8");
INSERT INTO tn_candidate_tags VALUES("6","6");
INSERT INTO tn_candidate_tags VALUES("6","7");
INSERT INTO tn_candidate_tags VALUES("6","8");
INSERT INTO tn_candidate_tags VALUES("7","6");
INSERT INTO tn_candidate_tags VALUES("7","7");
INSERT INTO tn_candidate_tags VALUES("7","8");
INSERT INTO tn_candidate_tags VALUES("8","6");
INSERT INTO tn_candidate_tags VALUES("8","7");
INSERT INTO tn_candidate_tags VALUES("8","8");
INSERT INTO tn_candidate_tags VALUES("9","6");
INSERT INTO tn_candidate_tags VALUES("9","7");
INSERT INTO tn_candidate_tags VALUES("9","8");
INSERT INTO tn_candidate_tags VALUES("10","1");
INSERT INTO tn_candidate_tags VALUES("11","1");
INSERT INTO tn_candidate_tags VALUES("12","1");
INSERT INTO tn_candidate_tags VALUES("13","1");
INSERT INTO tn_candidate_tags VALUES("14","1");
INSERT INTO tn_candidate_tags VALUES("15","1");
INSERT INTO tn_candidate_tags VALUES("16","1");
INSERT INTO tn_candidate_tags VALUES("17","1");
INSERT INTO tn_candidate_tags VALUES("18","1");
INSERT INTO tn_candidate_tags VALUES("18","2");
INSERT INTO tn_candidate_tags VALUES("18","3");
INSERT INTO tn_candidate_tags VALUES("18","4");
INSERT INTO tn_candidate_tags VALUES("18","5");
INSERT INTO tn_candidate_tags VALUES("19","1");
INSERT INTO tn_candidate_tags VALUES("19","2");
INSERT INTO tn_candidate_tags VALUES("19","3");
INSERT INTO tn_candidate_tags VALUES("19","4");
INSERT INTO tn_candidate_tags VALUES("19","5");
INSERT INTO tn_candidate_tags VALUES("20","1");
INSERT INTO tn_candidate_tags VALUES("20","2");
INSERT INTO tn_candidate_tags VALUES("20","3");
INSERT INTO tn_candidate_tags VALUES("20","4");
INSERT INTO tn_candidate_tags VALUES("20","5");
INSERT INTO tn_candidate_tags VALUES("21","1");
INSERT INTO tn_candidate_tags VALUES("21","2");
INSERT INTO tn_candidate_tags VALUES("21","3");
INSERT INTO tn_candidate_tags VALUES("21","4");
INSERT INTO tn_candidate_tags VALUES("21","5");



DROP TABLE tn_carousel;

CREATE TABLE `tn_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tn_carousel VALUES("2","Dashboard","For dashboard","dashboard","1");



DROP TABLE tn_carousel_items;

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

INSERT INTO tn_carousel_items VALUES("3","2","","/web/uploads/images/Dang-thi-cong/Kinh-do/IMG_0242.JPG","","","","http://xaydungtaco.com/cong-trinh/du-an-cai-tao-khu-biet-thu-kinh-do.html","_blank","1","1");
INSERT INTO tn_carousel_items VALUES("5","2","","/web/uploads/images/Dang-thi-cong/Le-co/10.JPG","","","","http://xaydungtaco.com/cong-trinh/nha-pho-duong-le-co-phuong-an-lac-quan-binh-tan.html","","2","1");
INSERT INTO tn_carousel_items VALUES("6","2","","/web/uploads/images/Dang-thi-cong/Duong-22-hiep-binh-chanh/8.jpg","","","","http://xaydungtaco.com/cong-trinh/nha-pho-duong-so-22-phuong-hiep-binh-chanh-q-thu-duc.html","","3","1");
INSERT INTO tn_carousel_items VALUES("7","2","","/web/uploads/images/Dang-thi-cong/nha-hem-36-bui-tu-toan/IMG_0711.JPG","","","","","","","1");



DROP TABLE tn_comment;

CREATE TABLE `tn_comment` (
  `comment_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `comment` varchar(200) NOT NULL,
  `comment_sender_name` varchar(40) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tn_company;

CREATE TABLE `tn_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO tn_company VALUES("1","","Tona","","","","","","","","","66","","","");
INSERT INTO tn_company VALUES("2","","loc","","","<p>asdasd</p>","","","","","","67","","","");
INSERT INTO tn_company VALUES("3","","loc","","","<p>asdasd</p>","","","","","","68","","","");
INSERT INTO tn_company VALUES("4","","loc","","","","","","","","","84","","","");
INSERT INTO tn_company VALUES("5","","loc","","","","","","","","","85","","","");
INSERT INTO tn_company VALUES("6","","congty001@gmail.com","1.jpg","","<p>...</p>","","","","","","91","","","");
INSERT INTO tn_company VALUES("7","","LOCKON VN","","http://lockon-vn.com/","","","","","","","93","","","");
INSERT INTO tn_company VALUES("8","","LOCKON VN","","http://lockon-vn.com/","","","","","","","94","","","");
INSERT INTO tn_company VALUES("9","","LOCKON VN","Lockon-VN-Tranperant.png","http://lockon-vn.com","","","","","","","95","","","");
INSERT INTO tn_company VALUES("10","","LOCKON VN","Lockon-VN-Tranperant.png","http://lockon-vn.com","","","","","","","96","","","");



DROP TABLE tn_curriculum_vitae;

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




DROP TABLE tn_dropdown;

CREATE TABLE `tn_dropdown` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` int(5) DEFAULT '0',
  `decription` text,
  `arranged` int(5) DEFAULT '1',
  `status` smallint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

INSERT INTO tn_dropdown VALUES("1","1","","1","","2","1");
INSERT INTO tn_dropdown VALUES("2","1","","2","","3","1");
INSERT INTO tn_dropdown VALUES("3","1","","3","","4","1");
INSERT INTO tn_dropdown VALUES("4","1","","4","","5","1");
INSERT INTO tn_dropdown VALUES("5","1","","5","","6","1");
INSERT INTO tn_dropdown VALUES("6","2","","1","","2","1");
INSERT INTO tn_dropdown VALUES("7","2","D??i 1 n?m","2","","3","1");
INSERT INTO tn_dropdown VALUES("8","2","1 n?m","3","","4","1");
INSERT INTO tn_dropdown VALUES("9","2","2 n?m","4","","5","1");
INSERT INTO tn_dropdown VALUES("10","2","3 n?m","5","","6","1");
INSERT INTO tn_dropdown VALUES("11","2","4 n?m","6","","7","1");
INSERT INTO tn_dropdown VALUES("12","2","5 n?m","7","","8","1");
INSERT INTO tn_dropdown VALUES("13","2","","8","","9","1");
INSERT INTO tn_dropdown VALUES("14","3","??i h?c","1","","2","1");
INSERT INTO tn_dropdown VALUES("15","3","Cao ??ng","2","","3","1");
INSERT INTO tn_dropdown VALUES("16","3","Trung c?p","3","","4","1");
INSERT INTO tn_dropdown VALUES("17","3","Cao h?c","4","","5","1");
INSERT INTO tn_dropdown VALUES("18","3","Trung h?c","5","","6","1");
INSERT INTO tn_dropdown VALUES("19","3","Ch?ng ch?","6","","7","1");
INSERT INTO tn_dropdown VALUES("20","3","","7","","8","1");
INSERT INTO tn_dropdown VALUES("21","4","Nam","2","","3","1");
INSERT INTO tn_dropdown VALUES("22","4","N?","1","","2","1");
INSERT INTO tn_dropdown VALUES("23","4","Ch?n","0","","1","1");
INSERT INTO tn_dropdown VALUES("24","5","D??i 3","1","","1","1");
INSERT INTO tn_dropdown VALUES("25","5","3-5 Tri?u","2","","2","1");
INSERT INTO tn_dropdown VALUES("26","5","5-7 tri?u","3","","3","1");
INSERT INTO tn_dropdown VALUES("27","5","7-10 tri?u","4","","4","1");
INSERT INTO tn_dropdown VALUES("28","5","10-12 tri?u","5","","5","1");
INSERT INTO tn_dropdown VALUES("29","5","12-15 tri?u","6","","6","1");
INSERT INTO tn_dropdown VALUES("30","5","15-20 tri?u","7","","7","1");
INSERT INTO tn_dropdown VALUES("31","5","20-25 tri?u","8","","8","1");
INSERT INTO tn_dropdown VALUES("32","5","25-30 tri?u","9","","9","1");
INSERT INTO tn_dropdown VALUES("33","5","","10","","10","1");
INSERT INTO tn_dropdown VALUES("34","5","Ch?n","0","","11","1");
INSERT INTO tn_dropdown VALUES("35","3","Ch?n","0","","1","1");
INSERT INTO tn_dropdown VALUES("36","1","Ch?n","0","","1","1");
INSERT INTO tn_dropdown VALUES("37","2","Ch?n","0","","1","1");



DROP TABLE tn_events;

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




DROP TABLE tn_file_uploads;

CREATE TABLE `tn_file_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(50) NOT NULL,
  `object_id` int(11) NOT NULL,
  `file_path` varchar(155) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `arranged` int(5) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

INSERT INTO tn_file_uploads VALUES("2","company_gallery","6","11947627_1196879580337720_2083630260241166797_n-6c57937e2db0a9edab55c2637a297ba5.jpg","11947627_1196879580337720_2083630260241166797_n","jpg","2","2018-05-17 22:54:44","91","0");
INSERT INTO tn_file_uploads VALUES("3","company_gallery","6","Koala-300d623fb4a872959fac36e61f544f5b.jpg","Koala","jpg","3","2018-05-17 22:55:05","91","0");
INSERT INTO tn_file_uploads VALUES("4","company_gallery","6","11986529_1198041390221539_9015680406331197480_n-81767f1a645c9dcadcd66f2c0272fede.jpg","11986529_1198041390221539_9015680406331197480_n","jpg","1","2018-05-17 22:55:25","91","0");
INSERT INTO tn_file_uploads VALUES("5","company_gallery","9","19104953_2096160937075547_1448921044_o-4d13bc3813e4b14f419b3679bce38f6f.jpg","19104953_2096160937075547_1448921044_o","jpg","3","2018-06-13 14:20:17","95","0");
INSERT INTO tn_file_uploads VALUES("6","company_gallery","9","25625466_1937726096252647_1745775571_o-150bcf9dcea87dd40321af8ce50d7903.jpg","25625466_1937726096252647_1745775571_o","jpg","1","2018-06-13 14:20:29","95","0");
INSERT INTO tn_file_uploads VALUES("7","company_gallery","9","28944830_2094860050538969_551681024_o-d6fcc70d17bbfaf65ccdb5b5d8d55476.jpg","28944830_2094860050538969_551681024_o","jpg","2","2018-06-13 14:20:38","95","0");
INSERT INTO tn_file_uploads VALUES("8","candidate","0","install guide EC-CUBE 3.n for developer-bec72913fbb8e97d289620354c11e7ac.docx","install guide EC-CUBE 3.n for developer","docx","9999","2018-06-15 13:13:34","98","0");
INSERT INTO tn_file_uploads VALUES("9","candidate","0","install guide EC-CUBE 3.n for developer-8a5055521c3cc93840d74b00451a8c90.docx","install guide EC-CUBE 3.n for developer","docx","9999","2018-06-15 13:13:44","98","0");
INSERT INTO tn_file_uploads VALUES("10","candidate","0","Config Mail for Unit test-59a8e4f98d5fd8df794e5289aad0a264.docx","Config Mail for Unit test","docx","9999","2018-06-15 13:14:07","98","0");
INSERT INTO tn_file_uploads VALUES("11","candidate","0","install guide EC-CUBE 3.n for developer-93d83d7ea55f5192adf25b6ce53ab035.docx","install guide EC-CUBE 3.n for developer","docx","9999","2018-06-15 13:14:11","98","0");
INSERT INTO tn_file_uploads VALUES("12","candidate","0","install guide EC-CUBE 3.n for developer-878203dde895276e2bafa4824b8ad4a1.docx","install guide EC-CUBE 3.n for developer","docx","9999","2018-06-15 13:14:35","98","0");
INSERT INTO tn_file_uploads VALUES("13","candidate","0","install guide EC-CUBE 3.n for developer-388a78361847dbf954d90bc5fab6a241.docx","install guide EC-CUBE 3.n for developer","docx","9999","2018-06-15 13:14:37","98","0");
INSERT INTO tn_file_uploads VALUES("14","candidate","0","install guide EC-CUBE 3.n for developer-c60d7f4a02f101b7e20d6f77e2b0bc63.docx","install guide EC-CUBE 3.n for developer","docx","9999","2018-06-15 13:15:22","98","0");
INSERT INTO tn_file_uploads VALUES("15","candidate","0","install guide EC-CUBE 3.n for developer-ac7790e5a87ad94868c866ebc0a18d55.docx","install guide EC-CUBE 3.n for developer","docx","9999","2018-06-15 13:15:41","98","0");
INSERT INTO tn_file_uploads VALUES("16","candidate","0","install guide EC-CUBE 3.n for developer-96fb465ec5236745192d81457e5372f7.docx","install guide EC-CUBE 3.n for developer","docx","9999","2018-06-15 13:16:56","98","0");
INSERT INTO tn_file_uploads VALUES("17","candidate","0","install guide EC-CUBE 3.n for developer-7d51e284cbbce71290cbab7ed74afa2c.docx","install guide EC-CUBE 3.n for developer","docx","9999","2018-06-15 13:30:14","98","0");
INSERT INTO tn_file_uploads VALUES("18","candidate","0","install guide EC-CUBE 3.n for developer-e56f40c1d58af9c73a946cd28dd5dc01.docx","install guide EC-CUBE 3.n for developer","docx","9999","2018-06-15 13:30:45","98","0");
INSERT INTO tn_file_uploads VALUES("19","candidate","0","Config Mail for Unit test-f7d6e19c43f3b9ff9749137f5afb5ebb.docx","Config Mail for Unit test","docx","9999","2018-06-15 13:40:14","98","0");



DROP TABLE tn_job_categories;

CREATE TABLE `tn_job_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

INSERT INTO tn_job_categories VALUES("6","0","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("7","6","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("8","6","B?t ??ng s?n","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("9","0","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("10","9","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("11","9","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("12","9","M? Thu?t/Ngh? Thu?t/Thi?t K?","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("13","9","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("14","9","Internet/Online Media","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("15","9","In ?n/Xu?t b?n","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("16","0","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("17","16","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("18","16","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("19","16","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("20","16","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("21","16","B?o hi?m","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("22","0","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("23","22","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("24","22","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("25","22","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("26","22","Th?c ph?m & ?? u?ng","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("27","22","Th?i trang ","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("28","22","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("29","0","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("30","0","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("31","30","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("32","0","K? THU?T","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("33","32","?i?n/?i?n t?","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("34","32","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("35","32","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("36","32","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("37","32","?i?n l?nh/Nhi?t l?nh","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("38","0","S?N XU?T","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("39","38","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("40","38","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("41","38","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("42","38","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("43","38","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("44","38","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("45","38","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("46","38","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("47","0","Y T?","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("48","47","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("49","47","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("50","47","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("51","47","D??c s?","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("52","47","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("53","0","D?CH V?","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("54","53","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("55","53","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("56","53","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("57","53","T? v?n","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("58","0","V?N T?I","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("59","58","V?n chuy?n/Giao nh?n","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("60","58","Kho v?n","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("61","58","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("62","0","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("63","62","Marketing","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("64","62","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("65","62","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("66","62","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("67","0","B? PH?N H? TR?","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("68","67","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("69","67","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("70","67","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("71","67","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("72","67","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("73","0","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("74","73","IT - Ph?n c?ng/M?ng","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("75","73","IT - Ph?n m?m","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("76","0","H? TR? S?N XU?T","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("77","76","Xu?t nh?p kh?u","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("78","0","QA/QC","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("79","78","S?n Xu?t","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("80","78","Thu Mua/V?t T?/Cung V?n","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("81","78","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("82","78","","","","","","","","","1","","","1");
INSERT INTO tn_job_categories VALUES("83","78","","","","","","","","","1","","","1");



DROP TABLE tn_job_skill;

CREATE TABLE `tn_job_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tn_jobs;

CREATE TABLE `tn_jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text,
  `content` text,
  `cv_end_date` date DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `salary` int(3) DEFAULT NULL,
  `working_time` int(3) DEFAULT NULL,
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
  `client_status` smallint(1) DEFAULT '0',
  `status` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tn_jobs VALUES("1","75","9","PHP DEVELOPER (JAPANESE)","php-developer-japanese-","Ho Chi Minh\nSalary: Negotiable\nPHP?eCommerce?PostgreSql?mySQL","<p><b>JOB REQUIREMENT - Summary</b></p><p>Lockon Vietnam is a new company established December 2013 in HCMC, LOCKON VIETNAM, owned by LOCKON in Japan.<br>?NO.1 products in Japan!<br>[1] AD EBiS, online marketing suite: <a href=\"http://www.ebis.ne.jp/en/\">http://www.ebis.ne.jp/en/</a><br>[2] EC-CUBE, open platform in E-commerce: <a href=\"http://www.ec-cube.net/\">http://www.ec-cube.net/</a><br>[3] THREe, automation tool for online ads operation: <a href=\"http://three.ne.jp/\">http://three.ne.jp/</a></p><p>You will participate in a whole software development project. The main responsibilities of developers are: coding, unit testing and solution.<br>You will be able to join in Workshop or Study lesson conducted in company which is about Technique, knowledges used in Projects, languages such as Japanese or English.<br>Required:<br>N3+ for developer<br>N2+ for Bse</p><p>============================================<br><b>Technology and Tools</b><br>============================================</p><p>- Programming language: PHP ( Symfony, Doctrine, Twig )<br>- Database: PostgreSQL, MySQL, etc.<br>- Communication tool: Skype, Slack or TV conference system for video chat<br>- Communication language with JP team: English / Japanese (Our communicator can support you.)</p><p><b>Your Skills and Experience</b></p><p>============================================<br><b>Work experience / Hard Skills</b><br>============================================</p><p>- More than 3 years of WORK EXPERIENCE as a PHP developer.<br>- Experience in Ecommerce, EC-CUBE is a BIG PLUS.<br>- Hands on experience in HTML, CSS, jQuery, Ajax.<br>- Experience in popular DBMS like PgSQL, MySQL.<br>- Experience in phpUnit &amp; codeCeption.<br>- Experience with tools : Jira, PhpStorm, Docker, Github, Bitbucket,...<br>- Experience in reviewing work results of others (cross, mob review).<br>- Understanding about software development processes ( Open source is a plus)<br>- Understanding about object-oriented programming.<br>- Have knowledges about software testing, Database analyzing and designing.</p><p>============================================<br>Competencies / Soft Skills<br>============================================</p><p>?Love coding and want to be a core member of open source.<br>?Good sense of Teamwork.<br>?Working with Scrum, Agile, Kanban.<br>?Working under pressure ability and accomplish assigned task.<br>?Professional thinking or want to become a Professional engineer.<br>?Excellent communication, especially good in human relations.</p><p>============================================<br>? Ideal candidate<br>============================================<br>?Who can sympathize with the business content and vision of Lockon Vietnam.<br>?Who can work with ambition, motivation, sense of responsibility.<br>?Who are interested in new technologies and always think about how to apply into work.<br>?Understanding the goal of product and doing well orientation to Team.<br>?Flexible, energetic, patient and able to work within a multicultural environment.<br>?Good common of English (Japanese is plus).<br>?Understanding the right and obligation.<br>Environment<br>- Active, friendly, motivated and supportive colleagues (Teamwork is our pride.)<br>- Challenging development with advanced technology.<br>- Acquisition of the knowledge related to advanced online marketing.<br>- Exciting experience to build the new company and the development team.</p><p>============================================<br>Benefits<br>============================================</p><p>- Insurance: SI, HI and UI as defined in the Labor law<br>- Congratulatory or Condolence payments<br>- Health checkup<br>- Year-end gift, Moon cake, Birthday gift, Anniversary gift<br>- Monthly Team building event<br>- Company trip<br>- Monthly and Yearly Award program<br>- Day off: Saturday, Sunday, 12 days/ years and Viet Nam holidays</p><p>Other information<br>- 100% salary during probation period.<br>- Twice salary revision in a year (April and October).<br>- Basic Tet bonus (paid 2 times separately. 50% on July, 50% on January).<br>- Insurance: SI, HI and UI as defined in the Labor law.</p>","2018-12-31","","","8","1","63","95","95","2018-06-13 14:10:15","2018-06-13 14:10:42","2018-06-13 14:10:15","","2018-06-13 14:10:15","1","","0","7","1");
INSERT INTO tn_jobs VALUES("2","75","9","IT COMMUNICATOR","it-communicator","","<p><b>JOB DESCRIPTION</b></p><p><b></b>============================</p><p>?????Impact On The World???????????????????????????????????????????????????????????????????<br>[1] AD EBiS, online marketing suite : <a href=\"http://www.ebis.ne.jp/\">http://www.ebis.ne.jp/</a><br>[2] EC-CUBE, open platform in E-commerce : <a href=\"http://www.ec-cube.net/\">http://www.ec-cube.net/</a><br>[3] THREe, automation tool for online ads operation : <a href=\"http://three.ne.jp/\">http://three.ne.jp/</a></p><p>============================================<br><b>Your Mission</b><br>============================================<br>??????????????????????????????????????????????????????????????????<br>?????????????????????????????????Q&amp;A?????????????????????????????????????????????????????????????????????????????<br>????????????????????????????????????????????????????????????????????????????????<br>???????????????????????????????????????????????????????????????????????????</p><p>============================================<br><b>Benefits</b><br>============================================<br>- Insurance: SI, HI and UI as defined in the Labor law<br>- Congratulatory or Condolence payments<br>- Health checkup<br>- Year-end gift, Moon cake, Birthday gift, Anniversary gift<br>- Monthly Team building event<br>- Company trip<br>- Monthly and Yearly Award program<br>- Day off: Saturday, Sunday, 12 days/ years and Viet Nam holidays</p><p>============================================<br><b>Working time:</b><br>============================================<br>Monday to Friday: 8:00-17:30</p><p>============================================<br><b>Salary</b><br>============================================<br>- Twice salary appraisal in a year (April and October)<br>- Basic Tet bonus (paid 50% on July, 50% on January)</p><p>============================================<br><b>Work Experience / Hard Skills</b><br>============================================<br><must><br>?Strong Japanese skill in writing, reading, listening and speaking (equivalent to N2)<br>?Have ability to read and write documents in English fluently<br>?Have more than 2 years working experience using Japanese</must></p><p><plus><br>- Have experience in working as IT communicator for more than 1 year<br>- Have experience in managing tasks and facilitating a meeting.<br>- Have experience in working at a Japanese company for some years</plus></p><p>============================================<br><b>Competencies / Soft Skills</b><br>============================================<br>?Good sense of Team work<br>?Exact Comprehension &amp; Explanation skill<br>?Problem finding &amp; solving skill</p><p>============================================<br><b>Stance / Mind</b><br>============================================<br>?Try to understand what people say. Translate what you understand not what you hear<br>?Understanding the right and obligation<br>?Can learn from failure after challenging and usually improve to avoid the same failure</p><p>============================================<br><b>Character</b><br>============================================<br>?Proactive, Cooperative, Well-organized</p><p>============================================<br><b>?Work start date?</b><br>============================================<br>July 1st, 2018 or earlier</p>","2018-12-31","","","1","1","63","95","95","2018-06-13 14:12:53","2018-06-13 14:12:53","2018-06-13 14:12:53","","2018-06-13 14:12:53","1","","0","7","1");



DROP TABLE tn_locations;

CREATE TABLE `tn_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '3' COMMENT '1:Quoc Gia,2:Thanh pho,3Tinh thanh',
  `arranged` int(5) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

INSERT INTO tn_locations VALUES("1","64","An Giang","","3","11","1");
INSERT INTO tn_locations VALUES("2","64","","","3","12","1");
INSERT INTO tn_locations VALUES("3","64","B?c Giang","","3","13","1");
INSERT INTO tn_locations VALUES("4","64","B?c K?n","","3","14","1");
INSERT INTO tn_locations VALUES("5","64","","","3","15","1");
INSERT INTO tn_locations VALUES("6","64","B?c Ninh","","3","16","1");
INSERT INTO tn_locations VALUES("7","64","B?n Tre","","3","17","1");
INSERT INTO tn_locations VALUES("8","64","","","3","18","1");
INSERT INTO tn_locations VALUES("9","64","","","3","19","1");
INSERT INTO tn_locations VALUES("10","64","","","3","20","1");
INSERT INTO tn_locations VALUES("11","64","","","3","21","1");
INSERT INTO tn_locations VALUES("12","64","","","3","22","1");
INSERT INTO tn_locations VALUES("13","64","Cao B?ng","","3","23","1");
INSERT INTO tn_locations VALUES("14","64","??k L?k","","3","24","1");
INSERT INTO tn_locations VALUES("15","64","","","3","25","1");
INSERT INTO tn_locations VALUES("16","64","","","3","26","1");
INSERT INTO tn_locations VALUES("17","64","??ng Nai","","3","27","1");
INSERT INTO tn_locations VALUES("18","64","","","3","28","1");
INSERT INTO tn_locations VALUES("19","64","Gia Lai","","3","29","1");
INSERT INTO tn_locations VALUES("20","64","","","3","30","1");
INSERT INTO tn_locations VALUES("21","64","","","3","31","1");
INSERT INTO tn_locations VALUES("22","64","","","3","32","1");
INSERT INTO tn_locations VALUES("23","64","H?i D??ng","","3","33","1");
INSERT INTO tn_locations VALUES("24","64","H?u Giang","","3","34","1");
INSERT INTO tn_locations VALUES("25","64","","","3","35","1");
INSERT INTO tn_locations VALUES("26","64","","","3","36","1");
INSERT INTO tn_locations VALUES("27","64","","","3","37","1");
INSERT INTO tn_locations VALUES("28","64","","","3","38","1");
INSERT INTO tn_locations VALUES("29","64","Kon Tum","","3","39","1");
INSERT INTO tn_locations VALUES("30","64","","","3","40","1");
INSERT INTO tn_locations VALUES("31","64","","","3","41","1");
INSERT INTO tn_locations VALUES("32","64","L?ng S?n","","3","42","1");
INSERT INTO tn_locations VALUES("33","64","","","3","43","1");
INSERT INTO tn_locations VALUES("34","64","Long An","","3","44","1");
INSERT INTO tn_locations VALUES("35","64","Nam ??nh","","3","45","1");
INSERT INTO tn_locations VALUES("36","64","Ngh? An","","3","46","1");
INSERT INTO tn_locations VALUES("37","64","","","3","47","1");
INSERT INTO tn_locations VALUES("38","64","Ninh Thu?n","","3","48","1");
INSERT INTO tn_locations VALUES("39","64","","","3","49","1");
INSERT INTO tn_locations VALUES("40","64","","","3","50","1");
INSERT INTO tn_locations VALUES("41","64","Qu?ng Nam","","3","51","1");
INSERT INTO tn_locations VALUES("42","64","","","3","52","1");
INSERT INTO tn_locations VALUES("43","64","Qu?ng Ninh","","3","53","1");
INSERT INTO tn_locations VALUES("44","64","Qu?ng Tr?","","3","54","1");
INSERT INTO tn_locations VALUES("45","64","","","3","55","1");
INSERT INTO tn_locations VALUES("46","64","S?n La","","3","56","1");
INSERT INTO tn_locations VALUES("47","64","","","3","57","1");
INSERT INTO tn_locations VALUES("48","64","","","3","58","1");
INSERT INTO tn_locations VALUES("49","64","","","3","59","1");
INSERT INTO tn_locations VALUES("50","64","","","3","60","1");
INSERT INTO tn_locations VALUES("51","64","","","3","61","1");
INSERT INTO tn_locations VALUES("52","64","Ti?n Giang","","3","62","1");
INSERT INTO tn_locations VALUES("53","64","","","3","63","1");
INSERT INTO tn_locations VALUES("54","64","","","3","64","1");
INSERT INTO tn_locations VALUES("55","64","V?nh Long","","3","65","1");
INSERT INTO tn_locations VALUES("56","64","","","3","66","1");
INSERT INTO tn_locations VALUES("57","64","","","3","67","1");
INSERT INTO tn_locations VALUES("58","64","","","3","68","1");
INSERT INTO tn_locations VALUES("59","64","C?n Th?","","3","69","1");
INSERT INTO tn_locations VALUES("60","64","","","3","70","1");
INSERT INTO tn_locations VALUES("61","64","","","3","71","1");
INSERT INTO tn_locations VALUES("62","64","","","3","3","1");
INSERT INTO tn_locations VALUES("63","64","TP HCM","","3","2","1");
INSERT INTO tn_locations VALUES("64","0","Vi?t Nam","","1","74","1");
INSERT INTO tn_locations VALUES("65","63","Qu?n 1","","3","75","1");
INSERT INTO tn_locations VALUES("66","63","Qu?n 2","","3","76","1");
INSERT INTO tn_locations VALUES("67","63","Qu?n 3","","3","77","1");
INSERT INTO tn_locations VALUES("68","63","Qu?n 4","","3","78","1");
INSERT INTO tn_locations VALUES("69","63","Qu?n 5","","3","79","1");
INSERT INTO tn_locations VALUES("70","63","Qu?n 6","","3","80","1");
INSERT INTO tn_locations VALUES("71","63","Qu?n 7","","3","81","1");
INSERT INTO tn_locations VALUES("72","63","Qu?n 8","","3","82","1");
INSERT INTO tn_locations VALUES("73","63","Qu?n 9","","3","83","1");
INSERT INTO tn_locations VALUES("74","63","Qu?n 10","","3","84","1");
INSERT INTO tn_locations VALUES("75","63","Qu?n 11","","3","85","1");
INSERT INTO tn_locations VALUES("76","63","Qu?n 12","","3","86","1");
INSERT INTO tn_locations VALUES("77","63","","","3","87","1");
INSERT INTO tn_locations VALUES("78","63","","","3","88","1");
INSERT INTO tn_locations VALUES("79","63","","","3","89","1");
INSERT INTO tn_locations VALUES("80","63","","","3","90","1");
INSERT INTO tn_locations VALUES("81","63","","","3","91","1");
INSERT INTO tn_locations VALUES("82","63","","","3","92","1");
INSERT INTO tn_locations VALUES("83","63","Th? ??c","","3","93","1");
INSERT INTO tn_locations VALUES("84","64","Ch?n","","3","1","1");



DROP TABLE tn_log_system;

CREATE TABLE `tn_log_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `controller` varchar(55) DEFAULT NULL,
  `action` varchar(55) DEFAULT NULL,
  `method` varchar(15) DEFAULT NULL,
  `user_timezone` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1606 DEFAULT CHARSET=utf8;

INSERT INTO tn_log_system VALUES("1","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:28:09","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("2","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:28:19","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("3","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:28:24","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("4","http://www.vina-jobs.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:28:28","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("5","http://www.vina-jobs.com/employeers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:28:34","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("6","http://www.vina-jobs.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:28:39","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("7","http://www.vina-jobs.com/blog.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:28:42","site","blog","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("8","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:28:46","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("9","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:28:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("10","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:29:03","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("11","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:29:09","default","index","GET","");
INSERT INTO tn_log_system VALUES("12","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:29:52","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("13","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 22:35:42","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("14","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:04:32","default","index","GET","");
INSERT INTO tn_log_system VALUES("15","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:04:53","default","index","GET","");
INSERT INTO tn_log_system VALUES("16","http://www.vina-jobs.com/assets/img/img16.jpg","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:05:27","site","error","GET","");
INSERT INTO tn_log_system VALUES("17","http://www.vina-jobs.com/assets/img/img16.jpg","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:07:06","site","error","GET","");
INSERT INTO tn_log_system VALUES("18","http://www.vina-jobs.com/vendor/bower-asset/jquery-confirm2/css/jquery-confirm.css","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:07:12","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("19","http://www.vina-jobs.com/vendor/bower-asset/jquery-confirm2/js/jquery-confirm.js","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:07:13","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("20","http://www.vina-jobs.com/vendor/bower-asset/jquery-confirm2/css/jquery-confirm.css","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:08:04","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("21","http://www.vina-jobs.com/vendor/bower-asset/jquery-confirm2/js/jquery-confirm.js","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:08:07","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("22","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:08:10","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("23","http://www.vina-jobs.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:08:13","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("24","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:08:17","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("25","http://www.vina-jobs.com/vendor/bower-asset/jquery-confirm2/css/jquery-confirm.css","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:08:27","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("26","http://www.vina-jobs.com/vendor/bower-asset/jquery-confirm2/js/jquery-confirm.js","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:08:28","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("27","http://www.vina-jobs.com/vendor/bower-asset/jquery-confirm2/css/jquery-confirm.css","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:08:34","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("28","http://www.vina-jobs.com/vendor/bower-asset/jquery-confirm2/js/jquery-confirm.js","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:16:54","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("29","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:20:46","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("30","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:22:26","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("31","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-09 23:22:30","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("32","http://www.vina-jobs.com/index.php?r=wp-login.php","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko","2018-04-10 01:13:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("33","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)","2018-04-10 03:49:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("34","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon","2018-04-10 07:51:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("35","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)","2018-04-10 07:53:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("36","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 08:18:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("37","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 08:18:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("38","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 08:54:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("39","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 08:56:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("40","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 08:56:51","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("41","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 08:56:54","default","index","GET","");
INSERT INTO tn_log_system VALUES("42","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 08:56:56","site","blog","GET","");
INSERT INTO tn_log_system VALUES("43","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 08:56:58","site","contact","GET","");
INSERT INTO tn_log_system VALUES("44","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 08:57:16","site","blog","GET","");
INSERT INTO tn_log_system VALUES("45","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 08:57:20","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("46","http://www.vina-jobs.com/assets/img/img16.jpg","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 08:57:29","site","error","GET","");
INSERT INTO tn_log_system VALUES("47","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 09:00:42","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("48","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 09:00:45","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("49","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 09:00:57","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("50","http://www.vina-jobs.com/contact.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 09:02:14","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("51","http://www.vina-jobs.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 09:02:17","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("52","http://www.vina-jobs.com/employeers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 09:02:19","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("53","http://www.vina-jobs.com/about-us.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 09:02:22","site","about-us","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("54","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 09:03:48","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("55","http://www.vina-jobs.com/about-us.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 09:03:52","site","about-us","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("56","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 09:07:53","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("57","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 09:09:15","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("58","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 10:09:25","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("59","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 10:09:25","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("60","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 10:09:30","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("61","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 10:09:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("62","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 10:09:34","site","error","GET","");
INSERT INTO tn_log_system VALUES("63","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 10:28:32","default","index","GET","");
INSERT INTO tn_log_system VALUES("64","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 10:28:33","site","error","GET","");
INSERT INTO tn_log_system VALUES("65","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 10:28:35","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("66","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 10:28:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("67","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 10:28:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("68","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 12:39:58","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("69","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 12:44:45","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("70","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36","2018-04-10 13:14:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("71","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 14:01:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("72","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 14:02:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("73","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 14:02:44","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("74","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 14:03:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("75","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 14:50:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("76","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 14:50:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("77","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 14:51:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("78","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 14:51:08","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("79","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 14:51:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("80","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/41.0.2272.118 Mobile Safari/537.36","2018-04-10 14:51:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("81","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/41.0.2272.118 Safari/537.36","2018-04-10 14:51:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("82","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 18:08:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("83","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 18:08:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("84","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 18:08:32","site","search","POST","");
INSERT INTO tn_log_system VALUES("85","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 18:08:37","site","search","POST","");
INSERT INTO tn_log_system VALUES("86","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 18:08:46","site","search","POST","");
INSERT INTO tn_log_system VALUES("87","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 18:09:21","default","index","GET","");
INSERT INTO tn_log_system VALUES("88","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 18:09:21","default","index","GET","");
INSERT INTO tn_log_system VALUES("89","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 18:09:30","site","error","POST","");
INSERT INTO tn_log_system VALUES("90","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 18:09:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("91","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 18:09:38","site","search","POST","");
INSERT INTO tn_log_system VALUES("92","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 18:09:42","site","search","POST","");
INSERT INTO tn_log_system VALUES("93","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 19:58:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("94","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 19:59:07","default","index","GET","");
INSERT INTO tn_log_system VALUES("95","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 20:01:00","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("96","http://www.vina-jobs.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 20:01:28","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("97","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 20:01:40","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("98","http://www.vina-jobs.com/search/result.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 20:01:46","site","search","POST","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("99","http://www.vina-jobs.com/search/result.html?","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 20:01:56","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("100","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon","2018-04-10 20:54:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("101","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 20:57:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("102","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 20:58:04","site","search","POST","");
INSERT INTO tn_log_system VALUES("103","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-10 21:33:27","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("104","http://www.vina-jobs.com/","0","172.31.18.22","User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 21:45:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("105","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 23:10:37","default","index","GET","");
INSERT INTO tn_log_system VALUES("106","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 23:10:44","site","search","POST","");
INSERT INTO tn_log_system VALUES("107","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 23:10:51","site","search","POST","");
INSERT INTO tn_log_system VALUES("108","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 23:10:52","site","error","GET","");
INSERT INTO tn_log_system VALUES("109","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 23:10:57","site","search","POST","");
INSERT INTO tn_log_system VALUES("110","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 23:11:05","site","error","GET","");
INSERT INTO tn_log_system VALUES("111","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 23:12:59","site","search","GET","");
INSERT INTO tn_log_system VALUES("112","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-10 23:15:56","site","search","POST","");
INSERT INTO tn_log_system VALUES("113","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 00:41:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("114","http://www.vina-jobs.com/index.php?r=contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("115","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("116","http://www.vina-jobs.com/index.php?r=about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("117","http://www.vina-jobs.com/index.php?r=front/user/register","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("118","http://www.vina-jobs.com/index.php?r=job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("119","http://www.vina-jobs.com/index.php?r=employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("120","http://www.vina-jobs.com/index.php?r=blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("121","http://www.vina-jobs.com/index.php?r=register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("122","http://www.vina-jobs.com/index.php?r=register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("123","http://www.vina-jobs.com/index.php?r=user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("124","http://www.vina-jobs.com/index.php?r=site/auth&authclient=facebook","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("125","http://www.vina-jobs.com/index.php?r=site/auth&authclient=twitter","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("126","http://www.vina-jobs.com/index.php?r=site/auth&authclient=github","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 03:37:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("127","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 05:31:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("128","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 08:12:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("129","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 08:12:42","default","index","GET","");
INSERT INTO tn_log_system VALUES("130","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 08:14:26","site","search","POST","");
INSERT INTO tn_log_system VALUES("131","http://www.vina-jobs.com/search/result.html?[object%20Object],[object%20Object],[object%20Object],[object%20Object],[object%20Object],[object%20Object],[object%20Object],[object%20Object]","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 08:15:04","site","search","GET","");
INSERT INTO tn_log_system VALUES("132","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 08:15:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("133","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 08:15:23","default","index","GET","");
INSERT INTO tn_log_system VALUES("134","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 08:15:26","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("135","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 08:15:29","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("136","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 08:15:34","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("137","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("138","http://www.vina-jobs.com/index.php?r=job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("139","http://www.vina-jobs.com/index.php?r=employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("140","http://www.vina-jobs.com/index.php?r=blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("141","http://www.vina-jobs.com/index.php?r=register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("142","http://www.vina-jobs.com/index.php?r=contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("143","http://www.vina-jobs.com/index.php?r=register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("144","http://www.vina-jobs.com/index.php?r=site/auth&authclient=twitter","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("145","http://www.vina-jobs.com/index.php?r=user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("146","http://www.vina-jobs.com/index.php?r=front/user/register","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:14","default","index","GET","");
INSERT INTO tn_log_system VALUES("147","http://www.vina-jobs.com/index.php?r=about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:14","default","index","GET","");
INSERT INTO tn_log_system VALUES("148","http://www.vina-jobs.com/index.php?r=site/auth&authclient=facebook","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("149","http://www.vina-jobs.com/index.php?r=site/auth&authclient=github","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36","2018-04-11 08:43:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("150","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36","2018-04-11 08:44:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("151","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 08:59:28","default","index","GET","");
INSERT INTO tn_log_system VALUES("152","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 09:01:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("153","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 09:01:08","default","index","GET","");
INSERT INTO tn_log_system VALUES("154","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 09:02:08","default","index","GET","");
INSERT INTO tn_log_system VALUES("155","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 09:02:54","site","error","GET","");
INSERT INTO tn_log_system VALUES("156","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2)","2018-04-11 09:23:27","default","index","GET","");
INSERT INTO tn_log_system VALUES("157","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2)","2018-04-11 09:23:28","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("158","http://www.vina-jobs.com/front/user/register","0","172.31.18.22","Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2)","2018-04-11 09:23:28","site","error","GET","");
INSERT INTO tn_log_system VALUES("159","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2)","2018-04-11 09:23:28","site","blog","GET","");
INSERT INTO tn_log_system VALUES("160","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2)","2018-04-11 09:23:28","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("161","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 09:30:28","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("162","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 09:30:51","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("163","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 09:31:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("164","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 09:33:07","default","index","GET","");
INSERT INTO tn_log_system VALUES("165","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 09:35:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("166","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 09:45:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("167","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 09:54:15","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("168","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 11:23:29","default","index","GET","");
INSERT INTO tn_log_system VALUES("169","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 11:23:53","default","index","GET","");
INSERT INTO tn_log_system VALUES("170","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 11:23:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("171","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 11:26:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("172","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 11:26:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("173","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 11:28:13","site","search","POST","");
INSERT INTO tn_log_system VALUES("174","http://www.vina-jobs.com/search/result.html?[object%20Object],[object%20Object],[object%20Object]","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 11:28:36","site","search","GET","");
INSERT INTO tn_log_system VALUES("175","http://www.vina-jobs.com/search/result.html?[object%20Object],[object%20Object],[object%20Object]","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 11:28:43","site","search","GET","");
INSERT INTO tn_log_system VALUES("176","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 11:42:50","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("177","http://www.vina-jobs.com/index.php?r=about-us.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 14:35:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("178","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 14:44:06","default","index","GET","");
INSERT INTO tn_log_system VALUES("179","http://www.vina-jobs.com/assets/img/img16.jpg","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 14:44:11","site","error","GET","");
INSERT INTO tn_log_system VALUES("180","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-11 14:56:44","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("181","http://www.vina-jobs.com/index.php?r=assets/f7dc9fd7/authchoice.css","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 15:03:14","default","index","GET","");
INSERT INTO tn_log_system VALUES("182","http://www.vina-jobs.com/index.php?r=assets/f7dc9fd7/authchoice.js","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 15:03:16","default","index","GET","");
INSERT INTO tn_log_system VALUES("183","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-11 15:05:25","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("184","http://www.vina-jobs.com/index.php?r=admin","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 15:46:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("185","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 16:12:08","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("186","http://www.vina-jobs.com/dieu-khoan-su-dung.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 16:13:47","site","policy","GET","");
INSERT INTO tn_log_system VALUES("187","http://www.vina-jobs.com/index.php?r=about.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 16:54:32","default","index","GET","");
INSERT INTO tn_log_system VALUES("188","http://www.vina-jobs.com/index.php?r=contact.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 19:02:21","default","index","GET","");
INSERT INTO tn_log_system VALUES("189","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon","2018-04-11 20:57:04","default","index","GET","");
INSERT INTO tn_log_system VALUES("190","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 20:57:05","default","index","GET","");
INSERT INTO tn_log_system VALUES("191","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 20:57:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("192","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 20:57:19","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("193","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 20:57:23","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("194","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 20:57:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("195","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 20:57:31","site","contact","GET","");
INSERT INTO tn_log_system VALUES("196","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 20:57:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("197","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 20:57:39","site","search","POST","");
INSERT INTO tn_log_system VALUES("198","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 20:57:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("199","http://www.vina-jobs.com/search/result.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 21:01:36","site","search","POST","");
INSERT INTO tn_log_system VALUES("200","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 21:01:38","site","error","GET","");
INSERT INTO tn_log_system VALUES("201","http://www.vina-jobs.com/index.php?r=user/register.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-11 21:15:02","default","index","GET","");
INSERT INTO tn_log_system VALUES("202","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 21:34:46","default","index","GET","");
INSERT INTO tn_log_system VALUES("203","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 21:34:52","site","error","GET","");
INSERT INTO tn_log_system VALUES("204","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 21:35:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("205","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 21:35:04","site","error","GET","");
INSERT INTO tn_log_system VALUES("206","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 22:15:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("207","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 22:15:49","site","error","GET","");
INSERT INTO tn_log_system VALUES("208","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 22:15:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("209","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-11 22:26:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("210","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-11 22:43:23","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("211","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-11 22:44:19","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("212","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-11 22:44:46","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("213","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-11 22:44:56","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("214","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Android 7.0; Mobile; rv:59.0) Gecko/59.0 Firefox/59.0","2018-04-11 22:45:07","default","index","GET","");
INSERT INTO tn_log_system VALUES("215","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-11 22:47:04","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("216","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-11 22:48:12","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("217","http://www.vina-jobs.com/search/result.html?keywords=&jobs=1%2C2&loca=63%2C62%2C1%2C2%2C3%2C4%2C11&wkt=1%2C2","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-11 22:48:55","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("218","http://www.vina-jobs.com/search/result.html?keywords=&jobs=1%2C2&loca=63%2C62%2C1%2C2%2C3%2C4%2C11&wkt=1%2C2%2C3%2C4%2C5%2C6","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-11 22:49:02","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("219","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-11 22:49:07","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("220","http://www.vina-jobs.com/","0","172.31.18.22","Java/1.8.0_111","2018-04-12 03:20:27","default","index","GET","");
INSERT INTO tn_log_system VALUES("221","http://www.vina-jobs.com/","0","172.31.18.22","Java/1.8.0_111","2018-04-12 03:25:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("222","http://www.vina-jobs.com/","0","172.31.18.22","Java/1.8.0_111","2018-04-12 03:30:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("223","http://www.vina-jobs.com/","0","172.31.18.22","Java/1.8.0_111","2018-04-12 03:35:31","default","index","GET","");
INSERT INTO tn_log_system VALUES("224","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)","2018-04-12 08:13:17","default","index","GET","");
INSERT INTO tn_log_system VALUES("225","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:19:46","default","index","GET","");
INSERT INTO tn_log_system VALUES("226","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:19:53","default","index","GET","");
INSERT INTO tn_log_system VALUES("227","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:20:37","site","search","GET","");
INSERT INTO tn_log_system VALUES("228","http://www.vina-jobs.com/search/result.html?keywords=&wkt=1%2C2%2C3%2C4%2C5%2C6%2C10&salary=1%2C2","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:21:27","site","search","GET","");
INSERT INTO tn_log_system VALUES("229","http://www.vina-jobs.com/search/result.html?keywords=&wkt=1%2C2%2C3%2C4%2C5%2C6%2C10&salary=1%2C2","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:21:30","site","search","GET","");
INSERT INTO tn_log_system VALUES("230","http://www.vina-jobs.com/search/result.html?keywords=&wkt=1%2C2%2C3%2C4%2C5%2C6%2C10&salary=1%2C2","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:21:38","site","search","GET","");
INSERT INTO tn_log_system VALUES("231","http://www.vina-jobs.com/search/result.html?keywords=&wkt=1%2C2%2C3%2C4%2C5%2C6%2C10&salary=1%2C2%2C3","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:21:43","site","search","GET","");
INSERT INTO tn_log_system VALUES("232","http://www.vina-jobs.com/search/result.html?keywords=&wkt=1&wkt=2&wkt=3&wkt=4&wkt=5&wkt=6&wkt=10&salary=1&salary=2&salary=3","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:21:51","site","search","GET","");
INSERT INTO tn_log_system VALUES("233","http://www.vina-jobs.com/search/result.html?keywords=&wkt=1&wkt=10&salary=3","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:22:00","site","search","GET","");
INSERT INTO tn_log_system VALUES("234","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:22:06","default","index","GET","");
INSERT INTO tn_log_system VALUES("235","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:22:24","site","search","GET","");
INSERT INTO tn_log_system VALUES("236","http://www.vina-jobs.com/search/result.html?keywords=okconde&jobs=2&loca=63%2C62&wkt=1%2C2%2C3","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:22:49","site","search","GET","");
INSERT INTO tn_log_system VALUES("237","http://www.vina-jobs.com/search/result.html?keywords=okconde&jobs=2&loca=63%2C62&wkt=1%2C2%2C3%2C4%2C5%2C6","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:23:19","site","search","GET","");
INSERT INTO tn_log_system VALUES("238","http://www.vina-jobs.com/search/result.html?keywords=okconde&jobs=2&loca=63%2C62&wkt=1%2C2%2C3%2C4%2C5%2C6","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:23:29","site","search","GET","");
INSERT INTO tn_log_system VALUES("239","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:24:04","default","index","GET","");
INSERT INTO tn_log_system VALUES("240","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:24:06","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("241","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:24:08","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("242","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:24:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("243","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:24:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("244","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:25:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("245","http://www.vina-jobs.com/assets/302e4739/authchoice.css","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:26:42","site","error","GET","");
INSERT INTO tn_log_system VALUES("246","http://www.vina-jobs.com/assets/ed0e267b/css/bootstrap.css","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:26:42","site","error","GET","");
INSERT INTO tn_log_system VALUES("247","http://www.vina-jobs.com/assets/ea1041b1/yii.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:26:42","site","error","GET","");
INSERT INTO tn_log_system VALUES("248","http://www.vina-jobs.com/assets/ea1041b1/yii.validation.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:26:42","site","error","GET","");
INSERT INTO tn_log_system VALUES("249","http://www.vina-jobs.com/assets/ea1041b1/yii.activeForm.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:26:42","site","error","GET","");
INSERT INTO tn_log_system VALUES("250","http://www.vina-jobs.com/assets/302e4739/authchoice.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:26:43","site","error","GET","");
INSERT INTO tn_log_system VALUES("251","http://www.vina-jobs.com/assets/302e4739/authchoice.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:26:43","site","error","GET","");
INSERT INTO tn_log_system VALUES("252","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36,gzip(gfe)","2018-04-12 08:26:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("253","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 08:29:48","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("254","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 10:50:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("255","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 10:51:01","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("256","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 10:51:09","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("257","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 10:51:16","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("258","http://www.vina-jobs.com/assets/img/img16.jpg","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 10:51:33","site","error","GET","");
INSERT INTO tn_log_system VALUES("259","http://www.vina-jobs.com/register/company.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 10:55:14","user","register-company","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("260","http://www.vina-jobs.com/register/company.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 10:55:19","user","register-company","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("261","http://www.vina-jobs.com/register/company.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 10:56:01","user","register-company","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("262","http://www.vina-jobs.com/register/company.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 10:56:27","user","register-company","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("263","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 11:12:22","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("264","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 13:20:19","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("265","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 17:56:12","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("266","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 17:56:12","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("267","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 17:56:29","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("268","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 17:56:37","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("269","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 17:57:06","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("270","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 17:57:49","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("271","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 17:57:49","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("272","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 17:57:53","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("273","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 17:57:54","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("274","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 18:56:24","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("275","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 18:57:13","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("276","http://www.vina-jobs.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 18:57:18","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("277","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 18:57:23","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("278","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 18:57:26","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("279","http://www.vina-jobs.com/search/result.html?keywords=&loca=1&loca=2&wkt=1&wkt=2&wkt=3&wkt=4&wkt=5&wkt=6&wkt=10&exp=1&exp=2&exp=3&exp=4&exp=5","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 18:57:51","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("280","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:52:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("281","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:52:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("282","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:52:42","default","index","GET","");
INSERT INTO tn_log_system VALUES("283","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:52:59","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("284","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:53:02","default","index","GET","");
INSERT INTO tn_log_system VALUES("285","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:53:05","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("286","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:53:07","default","index","GET","");
INSERT INTO tn_log_system VALUES("287","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:53:09","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("288","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:53:12","site","blog","GET","");
INSERT INTO tn_log_system VALUES("289","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:53:14","site","contact","GET","");
INSERT INTO tn_log_system VALUES("290","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:53:19","default","index","GET","");
INSERT INTO tn_log_system VALUES("291","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:53:29","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("292","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:56:48","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("293","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-12 20:58:43","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("294","http://www.vina-jobs.com/search/result.html?keywords=&loca=1&loca=2&wkt=1&wkt=2&wkt=3&wkt=4&wkt=5&wkt=6&wkt=10&exp=1&exp=2&exp=3&exp=4&exp=5","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:17:12","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("295","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:17:27","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("296","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:17:44","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("297","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:17:51","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("298","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:17:54","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("299","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:17:58","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("300","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:18:10","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("301","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:18:15","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("302","http://www.vina-jobs.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:18:23","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("303","http://www.vina-jobs.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:18:28","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("304","http://www.vina-jobs.com/user/profile.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:18:39","user","user-profile","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("305","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:18:50","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("306","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:18:58","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("307","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:24:20","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("308","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-12 22:29:13","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("309","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux i686 on x86_64; rv:55.0) Gecko/20100101 Firefox/55.0","2018-04-13 02:57:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("310","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-13 07:38:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("311","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon","2018-04-13 07:47:17","default","index","GET","");
INSERT INTO tn_log_system VALUES("312","http://www.vina-jobs.com/dieu-khoan-su-dung.html","0","172.31.18.22","Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)","2018-04-13 09:02:30","site","policy","GET","");
INSERT INTO tn_log_system VALUES("313","http://www.vina-jobs.com/index.php?r=wp-content/uploads/8d5a12cf357a45d.php","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)","2018-04-13 09:54:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("314","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36","2018-04-13 10:42:09","default","index","GET","");
INSERT INTO tn_log_system VALUES("315","http://www.vina-jobs.com/index.php?r=8d5a134ade7e329.php","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)","2018-04-13 10:50:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("316","http://www.vina-jobs.com/index.php?r=8d5a1359f7863c6.php","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)","2018-04-13 10:56:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("317","http://www.vina-jobs.com/index.php?r=wp-content/plugins/revslider/temp/update_extract/8d5a13dd59509cc.php","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)","2018-04-13 11:55:42","default","index","GET","");
INSERT INTO tn_log_system VALUES("318","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 12:24:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("319","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 12:24:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("320","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 12:30:14","site","contact","GET","");
INSERT INTO tn_log_system VALUES("321","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 12:30:17","default","index","GET","");
INSERT INTO tn_log_system VALUES("322","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 12:30:21","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("323","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 12:33:01","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("324","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:21","default","index","GET","");
INSERT INTO tn_log_system VALUES("325","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:21","default","index","GET","");
INSERT INTO tn_log_system VALUES("326","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:27","site","error","GET","");
INSERT INTO tn_log_system VALUES("327","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:37","default","index","GET","");
INSERT INTO tn_log_system VALUES("328","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:37","site","error","GET","");
INSERT INTO tn_log_system VALUES("329","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("330","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:41","site","error","GET","");
INSERT INTO tn_log_system VALUES("331","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("332","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:43","site","error","GET","");
INSERT INTO tn_log_system VALUES("333","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("334","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:45","site","error","GET","");
INSERT INTO tn_log_system VALUES("335","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:46","default","index","GET","");
INSERT INTO tn_log_system VALUES("336","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:32:46","site","error","GET","");
INSERT INTO tn_log_system VALUES("337","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:35:06","default","index","GET","");
INSERT INTO tn_log_system VALUES("338","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:35:07","site","error","GET","");
INSERT INTO tn_log_system VALUES("339","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:35:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("340","http://www.vina-jobs.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:35:19","site","error","GET","");
INSERT INTO tn_log_system VALUES("341","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-13 13:41:32","default","index","GET","");
INSERT INTO tn_log_system VALUES("342","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-13 13:41:37","default","index","GET","");
INSERT INTO tn_log_system VALUES("343","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("344","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("345","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("346","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:23","default","index","GET","");
INSERT INTO tn_log_system VALUES("347","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("348","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:28","default","index","GET","");
INSERT INTO tn_log_system VALUES("349","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("350","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("351","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("352","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:53","default","index","GET","");
INSERT INTO tn_log_system VALUES("353","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:54","default","index","GET","");
INSERT INTO tn_log_system VALUES("354","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("355","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:42:59","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("356","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:43:02","default","index","GET","");
INSERT INTO tn_log_system VALUES("357","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:43:05","site","contact","GET","");
INSERT INTO tn_log_system VALUES("358","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299","2018-04-13 13:44:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("359","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299","2018-04-13 13:45:08","default","index","GET","");
INSERT INTO tn_log_system VALUES("360","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299","2018-04-13 13:45:14","site","search","GET","");
INSERT INTO tn_log_system VALUES("361","http://www.vina-jobs.com/search/result.html?keywords=&wkt=1%2C2%2C3%2C4%2C5%2C6","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299","2018-04-13 13:45:23","site","search","GET","");
INSERT INTO tn_log_system VALUES("362","http://www.vina-jobs.com/search/result.html?keywords=&wkt=1%2C2%2C3%2C4%2C5%2C6","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299","2018-04-13 13:45:29","site","search","GET","");
INSERT INTO tn_log_system VALUES("363","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:45:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("364","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:45:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("365","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:46:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("366","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 13:46:05","default","index","GET","");
INSERT INTO tn_log_system VALUES("367","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:13:08","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("368","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:13:20","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("369","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:13:22","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("370","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:13:25","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("371","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:32:55","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("372","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:33:02","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("373","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:33:06","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("374","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:33:08","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("375","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:33:11","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("376","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:33:13","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("377","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:33:16","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("378","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:33:19","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("379","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:34:07","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("380","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:34:10","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("381","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:34:12","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("382","http://www.vina-jobs.com/employeers.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:34:18","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("383","http://www.vina-jobs.com/search/result.html?keywords=saddsa&jobs=1&loca=2","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 14:34:35","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("384","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:23:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("385","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:23:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("386","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:23:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("387","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:23:42","default","index","GET","");
INSERT INTO tn_log_system VALUES("388","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:23:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("389","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:23:47","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("390","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:23:50","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("391","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:23:53","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("392","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:23:56","site","blog","GET","");
INSERT INTO tn_log_system VALUES("393","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:23:59","site","contact","GET","");
INSERT INTO tn_log_system VALUES("394","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:24:04","default","index","GET","");
INSERT INTO tn_log_system VALUES("395","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:24:07","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("396","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:24:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("397","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:24:13","site","search","GET","");
INSERT INTO tn_log_system VALUES("398","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:24:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("399","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:24:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("400","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:25:28","default","index","GET","");
INSERT INTO tn_log_system VALUES("401","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:28:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("402","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 15:28:23","default","index","GET","");
INSERT INTO tn_log_system VALUES("403","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:56:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("404","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:56:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("405","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:56:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("406","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:56:29","default","index","GET","");
INSERT INTO tn_log_system VALUES("407","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:56:31","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("408","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:56:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("409","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:56:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("410","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:56:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("411","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:57:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("412","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:59:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("413","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:59:31","default","index","GET","");
INSERT INTO tn_log_system VALUES("414","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:59:32","default","index","GET","");
INSERT INTO tn_log_system VALUES("415","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:59:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("416","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:59:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("417","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:59:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("418","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:59:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("419","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:59:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("420","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:59:54","default","index","GET","");
INSERT INTO tn_log_system VALUES("421","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:59:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("422","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 16:59:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("423","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:04","default","index","GET","");
INSERT INTO tn_log_system VALUES("424","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:06","default","index","GET","");
INSERT INTO tn_log_system VALUES("425","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:07","default","index","GET","");
INSERT INTO tn_log_system VALUES("426","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("427","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:11","default","index","GET","");
INSERT INTO tn_log_system VALUES("428","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:14","default","index","GET","");
INSERT INTO tn_log_system VALUES("429","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("430","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:23","default","index","GET","");
INSERT INTO tn_log_system VALUES("431","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:25","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("432","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:29","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("433","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:32","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("434","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:35","site","blog","GET","");
INSERT INTO tn_log_system VALUES("435","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:00:38","site","contact","GET","");
INSERT INTO tn_log_system VALUES("436","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:01:29","default","index","GET","");
INSERT INTO tn_log_system VALUES("437","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:02:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("438","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:02:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("439","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:02:49","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("440","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:02:53","default","index","GET","");
INSERT INTO tn_log_system VALUES("441","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:04:02","default","index","GET","");
INSERT INTO tn_log_system VALUES("442","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/41.0.2272.118 Safari/537.36","2018-04-13 17:10:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("443","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/41.0.2272.118 Mobile Safari/537.36","2018-04-13 17:10:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("444","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:26:04","default","index","GET","");
INSERT INTO tn_log_system VALUES("445","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:26:04","default","index","GET","");
INSERT INTO tn_log_system VALUES("446","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:26:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("447","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:26:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("448","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:27:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("449","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:27:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("450","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:27:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("451","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:27:52","default","index","GET","");
INSERT INTO tn_log_system VALUES("452","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:27:54","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("453","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:27:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("454","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:27:59","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("455","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:28:01","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("456","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:28:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("457","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:32:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("458","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/41.0.2272.118 Safari/537.36","2018-04-13 17:32:17","default","index","GET","");
INSERT INTO tn_log_system VALUES("459","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/41.0.2272.118 Mobile Safari/537.36","2018-04-13 17:32:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("460","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:45:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("461","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:45:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("462","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 17:45:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("463","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:35:47","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("464","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:36:00","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("465","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:36:01","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("466","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:37:08","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("467","http://www.vina-jobs.com/search/result.html?keywords=&wkt=1","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:37:14","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("468","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:38:15","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("469","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:38:17","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("470","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:38:20","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("471","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Safari/537.36","2018-04-13 19:38:47","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("472","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Safari/537.36","2018-04-13 19:38:53","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("473","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Safari/537.36","2018-04-13 19:39:52","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("474","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Safari/537.36","2018-04-13 19:39:58","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("475","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:40:05","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("476","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:40:12","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("477","http://www.vina-jobs.com/register/company.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:41:01","user","register-company","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("478","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:41:58","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("479","http://www.vina-jobs.com/register/company.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:42:04","user","register-company","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("480","http://www.vina-jobs.com/register/company.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:52:09","user","register-company","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("481","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:52:11","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("482","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:53:17","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("483","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:53:21","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("484","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:55:30","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("485","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 19:56:47","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("486","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon","2018-04-13 20:42:09","default","index","GET","");
INSERT INTO tn_log_system VALUES("487","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 20:42:20","default","index","GET","");
INSERT INTO tn_log_system VALUES("488","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 20:42:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("489","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 20:44:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("490","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 22:06:00","default","index","GET","");
INSERT INTO tn_log_system VALUES("491","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 22:17:19","default","index","GET","");
INSERT INTO tn_log_system VALUES("492","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:18:09","default","index","GET","");
INSERT INTO tn_log_system VALUES("493","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:18:09","default","index","GET","");
INSERT INTO tn_log_system VALUES("494","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:18:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("495","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:18:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("496","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:18:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("497","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:18:53","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("498","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:18:57","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("499","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:18:59","site","contact","GET","");
INSERT INTO tn_log_system VALUES("500","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:19:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("501","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:19:06","default","index","GET","");
INSERT INTO tn_log_system VALUES("502","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:36:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("503","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:36:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("504","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:36:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("505","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-13 23:40:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("506","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 23:44:52","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("507","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 23:45:00","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("508","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 23:45:08","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("509","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 23:45:11","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("510","http://www.vina-jobs.com/register/company.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 23:45:39","user","register-company","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("511","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 23:47:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("512","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 23:47:43","site","search","GET","");
INSERT INTO tn_log_system VALUES("513","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-13 23:47:49","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("514","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 00:21:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("515","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 00:22:23","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("516","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 00:23:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("517","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-14 00:59:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("518","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)","2018-04-14 03:11:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("519","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36","2018-04-14 06:33:00","default","index","GET","");
INSERT INTO tn_log_system VALUES("520","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36","2018-04-14 06:33:04","default","index","GET","");
INSERT INTO tn_log_system VALUES("521","http://www.vina-jobs.com/index.php?r=8d5a1e0709e99dd.php","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)","2018-04-14 07:19:42","default","index","GET","");
INSERT INTO tn_log_system VALUES("522","http://www.vina-jobs.com/index.php?r=wp-content/plugins/revslider/temp/update_extract/8d5a1e48e42d560.php","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)","2018-04-14 07:49:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("523","http://www.vina-jobs.com/index.php?r=8d5a1e4e585d468.php","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)","2018-04-14 07:51:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("524","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)","2018-04-14 09:14:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("525","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:45:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("526","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:48:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("527","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:48:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("528","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:49:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("529","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:49:09","default","index","GET","");
INSERT INTO tn_log_system VALUES("530","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:49:11","default","index","GET","");
INSERT INTO tn_log_system VALUES("531","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:49:15","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("532","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:49:21","site","search","GET","");
INSERT INTO tn_log_system VALUES("533","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:49:23","default","index","GET","");
INSERT INTO tn_log_system VALUES("534","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:49:32","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("535","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:50:23","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("536","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:50:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("537","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:50:59","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("538","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:51:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("539","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:51:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("540","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:53:07","default","index","GET","");
INSERT INTO tn_log_system VALUES("541","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:53:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("542","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:53:37","default","index","GET","");
INSERT INTO tn_log_system VALUES("543","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 09:58:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("544","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:06:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("545","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:06:39","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("546","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:08:04","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("547","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:08:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("548","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:08:30","site","contact","GET","");
INSERT INTO tn_log_system VALUES("549","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:08:34","site","blog","GET","");
INSERT INTO tn_log_system VALUES("550","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:08:57","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("551","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:09:06","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("552","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:09:10","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("553","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:09:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("554","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:09:16","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("555","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:09:49","site","blog","GET","");
INSERT INTO tn_log_system VALUES("556","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:09:52","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("557","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:10:04","default","index","GET","");
INSERT INTO tn_log_system VALUES("558","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:10:20","default","index","GET","");
INSERT INTO tn_log_system VALUES("559","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=63","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 10:10:47","site","search","GET","");
INSERT INTO tn_log_system VALUES("560","http://www.vina-jobs.com/index.php?r=blog.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 11:18:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("561","http://www.vina-jobs.com/index.php?r=admin","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:08:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("562","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:10:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("563","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:10:37","default","index","GET","");
INSERT INTO tn_log_system VALUES("564","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:10:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("565","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:10:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("566","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:10:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("567","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:10:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("568","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:10:46","default","index","GET","");
INSERT INTO tn_log_system VALUES("569","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:10:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("570","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:10:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("571","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:10:52","default","index","GET","");
INSERT INTO tn_log_system VALUES("572","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:10:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("573","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:11:26","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("574","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:13:05","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("575","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:13:12","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("576","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:13:15","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("577","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:13:17","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("578","http://www.vina-jobs.com/index.php?r=blog.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 12:20:11","default","index","GET","");
INSERT INTO tn_log_system VALUES("579","http://www.vina-jobs.com/index.php?r=web/template/jobs/my-site.css","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 12:20:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("580","http://www.vina-jobs.com/index.php?r=assets/f7dc9fd7/authchoice.css","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 12:20:45","default","index","GET","");
INSERT INTO tn_log_system VALUES("581","http://www.vina-jobs.com/index.php?r=assets/f7dc9fd7/authchoice.js","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 12:20:46","default","index","GET","");
INSERT INTO tn_log_system VALUES("582","http://www.vina-jobs.com/index.php?r=assets/f8968c06/css/bootstrap.css","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 12:20:46","default","index","GET","");
INSERT INTO tn_log_system VALUES("583","http://www.vina-jobs.com/index.php?r=assets/b234c6d2/yii.activeForm.js","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 12:20:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("584","http://www.vina-jobs.com/index.php?r=assets/b234c6d2/yii.validation.js","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 12:20:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("585","http://www.vina-jobs.com/index.php?r=assets/b234c6d2/yii.js","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 12:20:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("586","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:51:03","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("587","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:51:06","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("588","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:51:09","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("589","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 12:51:42","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("590","http://www.vina-jobs.com/assets/ea1041b1/yii.validation.js","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-14 13:58:00","site","error","GET","");
INSERT INTO tn_log_system VALUES("591","http://www.vina-jobs.com/index.php?r=employeers.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 14:16:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("592","http://www.vina-jobs.com/assets/cdb8abac/yii.activeForm.js","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-14 14:31:20","site","error","GET","");
INSERT INTO tn_log_system VALUES("593","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 15:23:21","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("594","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 15:23:28","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("595","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 15:23:31","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("596","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 15:23:31","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("597","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 15:23:33","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("598","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 15:23:56","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("599","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 15:43:16","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("600","http://www.vina-jobs.com/index.php?r=employeers.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 15:43:23","default","index","GET","");
INSERT INTO tn_log_system VALUES("601","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Safari/537.36","2018-04-14 15:43:34","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("602","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Safari/537.36","2018-04-14 15:43:38","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("603","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Safari/537.36","2018-04-14 15:44:11","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("604","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 15:44:24","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("605","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 15:44:26","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("606","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 15:44:29","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("607","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 15:44:52","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("608","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 16:14:35","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("609","http://www.vina-jobs.com/user/profile.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 16:15:06","user","user-profile","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("610","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 16:15:19","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("611","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 16:25:27","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("612","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 16:29:55","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("613","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 16:33:11","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("614","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 16:42:45","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("615","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 16:42:52","default","index","GET","");
INSERT INTO tn_log_system VALUES("616","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 16:42:57","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("617","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 16:51:21","default","index","GET","");
INSERT INTO tn_log_system VALUES("618","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 17:14:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("619","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 17:14:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("620","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 17:25:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("621","http://www.vina-jobs.com/site/auth?authclient=github&code=47e9b802ce8608e95c3d&state=9020368f8a543911fb6f3b7a59ac5ed98368c4f21e0c74b5682c73ca2fdc98ce","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 17:26:00","site","error","GET","");
INSERT INTO tn_log_system VALUES("622","http://www.vina-jobs.com/assets/302e4739/authchoice.css","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-14 17:47:17","site","error","GET","");
INSERT INTO tn_log_system VALUES("623","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 17:51:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("624","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 17:54:54","default","index","GET","");
INSERT INTO tn_log_system VALUES("625","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 17:54:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("626","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 17:54:59","default","index","GET","");
INSERT INTO tn_log_system VALUES("627","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-14 18:20:37","default","index","GET","");
INSERT INTO tn_log_system VALUES("628","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:28:46","default","index","GET","");
INSERT INTO tn_log_system VALUES("629","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:28:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("630","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:29:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("631","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:29:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("632","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:29:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("633","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:29:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("634","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:29:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("635","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:29:46","default","index","GET","");
INSERT INTO tn_log_system VALUES("636","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:29:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("637","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:29:52","default","index","GET","");
INSERT INTO tn_log_system VALUES("638","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:29:54","default","index","GET","");
INSERT INTO tn_log_system VALUES("639","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:29:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("640","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:29:59","default","index","GET","");
INSERT INTO tn_log_system VALUES("641","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:30:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("642","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:30:29","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("643","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:30:34","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("644","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:30:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("645","http://www.vina-jobs.com/index.php?r=job-seekers.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 18:51:31","default","index","GET","");
INSERT INTO tn_log_system VALUES("646","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:54:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("647","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 18:54:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("648","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:04:27","default","index","GET","");
INSERT INTO tn_log_system VALUES("649","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:04:39","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("650","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:04:43","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("651","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:04:44","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("652","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:04:46","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("653","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:04:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("654","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:04:59","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("655","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:05:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("656","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:05:37","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("657","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:05:42","default","index","GET","");
INSERT INTO tn_log_system VALUES("658","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:05:47","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("659","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:05:52","default","index","GET","");
INSERT INTO tn_log_system VALUES("660","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:05:57","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("661","http://www.vina-jobs.com/user/profile.html","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:06:14","user","user-profile","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("662","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:06:29","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("663","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:06:34","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("664","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:06:37","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("665","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:06:39","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("666","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:06:53","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("667","http://www.vina-jobs.com/job-seekers.html","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 19:07:40","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("668","http://www.vina-jobs.com/index.php?r=blog.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 19:27:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("669","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 20:27:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("670","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 20:28:07","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("671","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 20:28:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("672","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 20:29:05","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("673","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 20:29:11","default","index","GET","");
INSERT INTO tn_log_system VALUES("674","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 20:29:18","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("675","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 20:29:29","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("676","http://www.vina-jobs.com/index.php?r=blog.html","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 20:33:44","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("677","http://www.vina-jobs.com/index.php?r=blog.html","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 20:33:50","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("678","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon","2018-04-14 21:04:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("679","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36","2018-04-14 21:38:17","default","index","GET","");
INSERT INTO tn_log_system VALUES("680","http://www.vina-jobs.com/index.php?r=blog.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-14 21:49:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("681","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 23:27:52","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("682","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 23:27:52","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("683","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 23:27:57","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("684","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 23:28:04","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("685","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 23:28:08","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("686","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=63","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 23:28:18","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("687","http://www.vina-jobs.com/job-seekers.html","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 23:28:36","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("688","http://www.vina-jobs.com/employeers.html","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 23:28:40","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("689","http://www.vina-jobs.com/job-seekers.html","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 23:28:43","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("690","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-14 23:28:45","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("691","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:35:33","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("692","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=63","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:36:17","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("693","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:36:42","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("694","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:36:48","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("695","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:36:50","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("696","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:36:52","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("697","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:37:03","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("698","http://www.vina-jobs.com/update/candidate.html","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:37:10","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("699","http://www.vina-jobs.com/update/candidate.html","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:38:40","user","update-candidate","POST","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("700","http://www.vina-jobs.com/update/candidate.html","87","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:39:15","user","update-candidate","POST","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("701","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:39:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("702","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:39:29","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("703","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:40:14","default","index","GET","");
INSERT INTO tn_log_system VALUES("704","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:40:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("705","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:41:19","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("706","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:58:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("707","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:58:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("708","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-14 23:59:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("709","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 00:01:05","default","index","GET","");
INSERT INTO tn_log_system VALUES("710","http://www.vina-jobs.com/index.php?r=about-us.html","0","172.31.18.22","Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)","2018-04-15 00:48:08","default","index","GET","");
INSERT INTO tn_log_system VALUES("711","http://www.vina-jobs.com/assets/ea1041b1/yii.activeForm.js","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-15 02:20:15","site","error","GET","");
INSERT INTO tn_log_system VALUES("712","http://www.vina-jobs.com/assets/ea1041b1/yii.js","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-15 02:53:36","site","error","GET","");
INSERT INTO tn_log_system VALUES("713","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-15 06:18:14","default","index","GET","");
INSERT INTO tn_log_system VALUES("714","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-15 06:18:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("715","http://www.vina-jobs.com/index.php?r=8d5a2ac46237f0f.php","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)","2018-04-15 07:38:54","default","index","GET","");
INSERT INTO tn_log_system VALUES("716","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 07:56:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("717","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 07:57:09","site","search","GET","");
INSERT INTO tn_log_system VALUES("718","http://www.vina-jobs.com/assets/302e4739/authchoice.js","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-15 08:04:01","site","error","GET","");
INSERT INTO tn_log_system VALUES("719","http://www.vina-jobs.com/index.php?r=wp-content/plugins/revslider/temp/update_extract/8d5a2afd5073f19.php","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)","2018-04-15 08:04:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("720","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 08:05:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("721","http://www.vina-jobs.com/assets/img/img16.jpg","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 08:05:59","site","error","GET","");
INSERT INTO tn_log_system VALUES("722","http://www.vina-jobs.com/index.php?r=8d5a2b041b9488c.php","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)","2018-04-15 08:07:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("723","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 08:09:52","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("724","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 08:13:25","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("725","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 08:13:43","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("726","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 08:19:14","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("727","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 08:19:17","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("728","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 08:19:20","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("729","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 08:20:38","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("730","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-15 11:48:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("731","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:00:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("732","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:00:52","default","index","GET","");
INSERT INTO tn_log_system VALUES("733","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:01:11","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("734","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:01:55","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("735","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:01:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("736","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:02:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("737","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:02:17","default","index","GET","");
INSERT INTO tn_log_system VALUES("738","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:03:20","default","index","GET","");
INSERT INTO tn_log_system VALUES("739","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:03:42","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("740","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:04:59","default","index","GET","");
INSERT INTO tn_log_system VALUES("741","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:05:02","default","index","GET","");
INSERT INTO tn_log_system VALUES("742","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:07:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("743","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:07:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("744","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:07:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("745","http://www.vina-jobs.com/search/result.html?keywords=&jobs=25&loca=63","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:09:17","site","search","GET","");
INSERT INTO tn_log_system VALUES("746","http://www.vina-jobs.com/search/result.html?keywords=&jobs=25&loca=63&exp=1%2C2%2C3%2C4%2C5%2C6%2C7","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:09:36","site","search","GET","");
INSERT INTO tn_log_system VALUES("747","http://www.vina-jobs.com/search/result.html?keywords=&jobs=25&loca=63&exp=1%2C2%2C3%2C4%2C5%2C6%2C7","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:09:42","site","search","GET","");
INSERT INTO tn_log_system VALUES("748","http://www.vina-jobs.com/search/result.html?keywords=&jobs=25&loca=63&exp=1%2C2%2C3%2C4%2C5%2C6%2C7%2C8","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:09:59","site","search","GET","");
INSERT INTO tn_log_system VALUES("749","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:10:16","default","index","GET","");
INSERT INTO tn_log_system VALUES("750","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:10:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("751","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:10:21","default","index","GET","");
INSERT INTO tn_log_system VALUES("752","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:10:23","default","index","GET","");
INSERT INTO tn_log_system VALUES("753","http://www.vina-jobs.com/search/result.html?keywords=&jobs=25&loca=63&exp=1%2C2%2C3%2C4%2C5%2C6%2C7%2C8","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:10:49","site","search","GET","");
INSERT INTO tn_log_system VALUES("754","http://www.vina-jobs.com/search/result.html?keywords=&jobs=25&loca=63&exp=1%2C2%2C3%2C4%2C5%2C6%2C7%2C8","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:10:55","site","search","GET","");
INSERT INTO tn_log_system VALUES("755","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:29:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("756","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:29:52","default","index","GET","");
INSERT INTO tn_log_system VALUES("757","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 13:30:33","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("758","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 13:40:02","default","index","GET","");
INSERT INTO tn_log_system VALUES("759","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 13:40:05","default","index","GET","");
INSERT INTO tn_log_system VALUES("760","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 13:41:52","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("761","http://www.vina-jobs.com/update/candidate.html","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 13:41:57","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("762","http://www.vina-jobs.com/update/candidate.html","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 13:42:27","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("763","http://www.vina-jobs.com/update/candidate.html","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 13:42:35","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("764","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 13:42:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("765","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 13:42:54","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("766","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 13:45:24","site","blog","GET","");
INSERT INTO tn_log_system VALUES("767","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.85 Safari/537.36","2018-04-15 14:32:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("768","http://www.vina-jobs.com/assets/ed0e267b/css/bootstrap.css","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-15 14:41:46","site","error","GET","");
INSERT INTO tn_log_system VALUES("769","http://www.vina-jobs.com/index.php?r=wp-login.php","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.0; rv:29.0) Gecko/20120101 Firefox/29.0","2018-04-15 15:18:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("770","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-15 16:12:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("771","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows; U; MSIE 9.0; Windows NT 9.0; en-US)","2018-04-15 17:03:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("772","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 17:25:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("773","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 17:25:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("774","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 17:26:00","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("775","http://www.vina-jobs.com/update/candidate.html","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 17:40:37","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("776","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; ips-agent)","2018-04-15 20:39:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("777","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (compatible; ips-agent)","2018-04-15 20:39:40","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("778","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (compatible; ips-agent)","2018-04-15 20:39:41","site","blog","GET","");
INSERT INTO tn_log_system VALUES("779","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (compatible; ips-agent)","2018-04-15 20:39:43","site","contact","GET","");
INSERT INTO tn_log_system VALUES("780","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (compatible; ips-agent)","2018-04-15 20:39:44","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("781","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (compatible; ips-agent)","2018-04-15 20:39:45","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("782","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (compatible; ips-agent)","2018-04-15 20:39:47","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("783","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (compatible; ips-agent)","2018-04-15 20:39:49","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("784","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (compatible; ips-agent)","2018-04-15 20:39:52","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("785","http://www.vina-jobs.com/dieu-khoan-su-dung.html","0","172.31.18.22","Mozilla/5.0 (compatible; ips-agent)","2018-04-15 20:40:07","site","policy","GET","");
INSERT INTO tn_log_system VALUES("786","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 21:10:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("787","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 21:11:24","site","search","GET","");
INSERT INTO tn_log_system VALUES("788","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 21:11:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("789","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 21:11:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("790","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 21:11:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("791","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 21:11:57","site","search","GET","");
INSERT INTO tn_log_system VALUES("792","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 21:12:14","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("793","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:21:09","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("794","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:21:09","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("795","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:21:14","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("796","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:21:17","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("797","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:22:05","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("798","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:51:28","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("799","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:51:36","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("800","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:51:38","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("801","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:51:53","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("802","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:52:24","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("803","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:52:28","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("804","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:53:29","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("805","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:53:34","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("806","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:54:35","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("807","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:54:36","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("808","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:54:36","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("809","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:54:40","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("810","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:54:44","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("811","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:54:45","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("812","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 21:54:45","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("813","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:01:35","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("814","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:01:38","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("815","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:01:44","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("816","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:01:47","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("817","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:02:01","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("818","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:13","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("819","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:17","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("820","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:31","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("821","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:32","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("822","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:35","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("823","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:36","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("824","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:37","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("825","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:39","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("826","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:40","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("827","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:41","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("828","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:50","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("829","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:03:51","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("830","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:12:57","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("831","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:01","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("832","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:02","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("833","http://www.vina-jobs.com/","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:04","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("834","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:11","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("835","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:12","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("836","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:23","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("837","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=10&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:24","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("838","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=7%2C10&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:24","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("839","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=6%2C7%2C10&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:24","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("840","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=5%2C6%2C7%2C10&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:25","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("841","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=2%2C5%2C6%2C7%2C10&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:25","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("842","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=2%2C3%2C5%2C6%2C7%2C10&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:26","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("843","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=2%2C3%2C4%2C5%2C6%2C7%2C10&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:36","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("844","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=2%2C3%2C4%2C5%2C6%2C7&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:36","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("845","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=2%2C3%2C4%2C5%2C6%2C7&exp=1&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:37","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("846","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=2%2C3%2C4%2C5%2C6%2C7&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:39","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("847","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=2%2C3%2C4%2C5%2C6%2C7%2C10&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:40","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("848","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=2%2C3%2C4%2C5%2C6%2C10&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:40","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("849","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=2%2C3%2C4%2C6%2C10&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:47","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("850","http://www.vina-jobs.com/search/result.html?keywords=&jobs=81&loca=62&salary=2%2C3%2C4%2C6&mode=search-jobs","87","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-15 22:13:48","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("851","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:06","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("852","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("853","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("854","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("855","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:20","default","index","GET","");
INSERT INTO tn_log_system VALUES("856","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("857","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("858","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:30","site","search","GET","");
INSERT INTO tn_log_system VALUES("859","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:31","site","search","GET","");
INSERT INTO tn_log_system VALUES("860","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:33","site","search","GET","");
INSERT INTO tn_log_system VALUES("861","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:34","site","search","GET","");
INSERT INTO tn_log_system VALUES("862","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:35","site","search","GET","");
INSERT INTO tn_log_system VALUES("863","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:36","site","search","GET","");
INSERT INTO tn_log_system VALUES("864","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:37","site","search","GET","");
INSERT INTO tn_log_system VALUES("865","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:37","site","search","GET","");
INSERT INTO tn_log_system VALUES("866","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("867","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:41","site","search","GET","");
INSERT INTO tn_log_system VALUES("868","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:42","site","search","GET","");
INSERT INTO tn_log_system VALUES("869","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("870","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:45","site","search","GET","");
INSERT INTO tn_log_system VALUES("871","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:46","site","search","GET","");
INSERT INTO tn_log_system VALUES("872","http://www.vina-jobs.com/search/result.html?keywords=&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:48","site","search","GET","");
INSERT INTO tn_log_system VALUES("873","http://www.vina-jobs.com/search/result.html?keywords=&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:53","site","search","GET","");
INSERT INTO tn_log_system VALUES("874","http://www.vina-jobs.com/search/result.html?keywords=&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:54","site","search","GET","");
INSERT INTO tn_log_system VALUES("875","http://www.vina-jobs.com/search/result.html?keywords=&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:56","site","search","GET","");
INSERT INTO tn_log_system VALUES("876","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:57","site","search","GET","");
INSERT INTO tn_log_system VALUES("877","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:26:59","site","search","GET","");
INSERT INTO tn_log_system VALUES("878","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:00","site","search","GET","");
INSERT INTO tn_log_system VALUES("879","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:07","site","search","GET","");
INSERT INTO tn_log_system VALUES("880","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:08","site","search","GET","");
INSERT INTO tn_log_system VALUES("881","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:13","site","search","GET","");
INSERT INTO tn_log_system VALUES("882","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:14","site","search","GET","");
INSERT INTO tn_log_system VALUES("883","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:15","site","search","GET","");
INSERT INTO tn_log_system VALUES("884","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:16","site","search","GET","");
INSERT INTO tn_log_system VALUES("885","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:17","site","search","GET","");
INSERT INTO tn_log_system VALUES("886","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:18","site","search","GET","");
INSERT INTO tn_log_system VALUES("887","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("888","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:41","site","search","GET","");
INSERT INTO tn_log_system VALUES("889","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:42","site","search","GET","");
INSERT INTO tn_log_system VALUES("890","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("891","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:27:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("892","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:28:17","default","index","GET","");
INSERT INTO tn_log_system VALUES("893","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:28:34","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("894","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:29:03","site","error","POST","");
INSERT INTO tn_log_system VALUES("895","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:29:30","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("896","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:29:33","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("897","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:29:42","site","error","POST","");
INSERT INTO tn_log_system VALUES("898","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:29:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("899","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-15 22:30:28","default","index","GET","");
INSERT INTO tn_log_system VALUES("900","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-15 22:57:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("901","http://www.vina-jobs.com/index.php?r=admin/login","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-16 00:39:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("902","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)","2018-04-16 01:08:04","default","index","GET","");
INSERT INTO tn_log_system VALUES("903","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)","2018-04-16 03:18:45","default","index","GET","");
INSERT INTO tn_log_system VALUES("904","http://www.vina-jobs.com/index.php?r=contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0","2018-04-16 04:31:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("905","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0","2018-04-16 04:31:56","site","contact","GET","");
INSERT INTO tn_log_system VALUES("906","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0","2018-04-16 04:31:58","site","contact","GET","");
INSERT INTO tn_log_system VALUES("907","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-16 06:08:21","default","index","GET","");
INSERT INTO tn_log_system VALUES("908","http://www.vina-jobs.com/index.php?r=admin/logout","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-16 06:23:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("909","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36","2018-04-16 06:45:00","default","index","GET","");
INSERT INTO tn_log_system VALUES("910","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 07:52:32","site","search","GET","");
INSERT INTO tn_log_system VALUES("911","http://www.vina-jobs.com/search/result.html?keywords=&wkt=10&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 07:52:33","site","search","GET","");
INSERT INTO tn_log_system VALUES("912","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon","2018-04-16 07:53:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("913","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 07:59:59","default","index","GET","");
INSERT INTO tn_log_system VALUES("914","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:00:00","default","index","GET","");
INSERT INTO tn_log_system VALUES("915","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:19:17","default","index","GET","");
INSERT INTO tn_log_system VALUES("916","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:19:19","default","index","GET","");
INSERT INTO tn_log_system VALUES("917","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:19:21","default","index","GET","");
INSERT INTO tn_log_system VALUES("918","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:19:23","default","index","GET","");
INSERT INTO tn_log_system VALUES("919","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:19:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("920","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:19:27","default","index","GET","");
INSERT INTO tn_log_system VALUES("921","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:19:29","default","index","GET","");
INSERT INTO tn_log_system VALUES("922","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:19:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("923","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 08:24:20","default","index","GET","");
INSERT INTO tn_log_system VALUES("924","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 08:24:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("925","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 08:24:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("926","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 08:24:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("927","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 08:24:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("928","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 08:24:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("929","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 08:24:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("930","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 08:24:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("931","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 08:25:25","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("932","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 08:25:51","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("933","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:27:07","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("934","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:27:18","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("935","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:27:48","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("936","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:27:59","site","error","POST","");
INSERT INTO tn_log_system VALUES("937","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:28:15","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("938","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:28:17","default","index","GET","");
INSERT INTO tn_log_system VALUES("939","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:28:20","default","index","GET","");
INSERT INTO tn_log_system VALUES("940","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:29:52","site","contact","GET","");
INSERT INTO tn_log_system VALUES("941","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:30:11","default","index","GET","");
INSERT INTO tn_log_system VALUES("942","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:30:14","site","contact","GET","");
INSERT INTO tn_log_system VALUES("943","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:30:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("944","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:30:19","default","index","GET","");
INSERT INTO tn_log_system VALUES("945","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:30:21","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("946","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:30:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("947","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:30:27","site","contact","GET","");
INSERT INTO tn_log_system VALUES("948","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:30:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("949","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:43:23","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("950","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:43:27","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("951","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:43:30","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("952","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:43:34","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("953","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 08:45:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("954","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-16 08:46:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("955","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 09:29:59","default","index","GET","");
INSERT INTO tn_log_system VALUES("956","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)","2018-04-16 10:31:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("957","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:33:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("958","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:33:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("959","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:38:52","default","index","GET","");
INSERT INTO tn_log_system VALUES("960","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:38:52","default","index","GET","");
INSERT INTO tn_log_system VALUES("961","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:39:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("962","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:39:34","site","search","GET","");
INSERT INTO tn_log_system VALUES("963","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:39:34","site","search","GET","");
INSERT INTO tn_log_system VALUES("964","http://www.vina-jobs.com/","0","172.31.18.22","","2018-04-16 10:45:04","site","error","GET","");
INSERT INTO tn_log_system VALUES("965","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/602.3.12 (KHTML, like Gecko) Version/10.0.2 Safari/602.3.12","2018-04-16 10:45:05","default","index","GET","");
INSERT INTO tn_log_system VALUES("966","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko PTST/403","2018-04-16 10:46:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("967","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko PTST/403","2018-04-16 10:46:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("968","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:54:45","default","index","GET","");
INSERT INTO tn_log_system VALUES("969","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:54:45","default","index","GET","");
INSERT INTO tn_log_system VALUES("970","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:54:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("971","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:54:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("972","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 10:54:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("973","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 11:00:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("974","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 11:04:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("975","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 11:12:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("976","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 11:12:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("977","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 11:13:28","default","index","GET","");
INSERT INTO tn_log_system VALUES("978","http://www.vina-jobs.com/cdn-cgi/scripts/d07b1474/cloudflare-static/email-decode.min.js","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 11:13:30","site","error","GET","");
INSERT INTO tn_log_system VALUES("979","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 11:13:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("980","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 11:13:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("981","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 11:13:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("982","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 11:14:11","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("983","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 11:14:14","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("984","http://www.vina-jobs.com/cdn-cgi/scripts/d07b1474/cloudflare-static/email-decode.min.js","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 11:14:14","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("985","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 11:30:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("986","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 11:30:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("987","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:09:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("988","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:09:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("989","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:09:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("990","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:09:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("991","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:09:40","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("992","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:09:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("993","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:46:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("994","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:46:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("995","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:46:36","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("996","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:46:42","default","index","GET","");
INSERT INTO tn_log_system VALUES("997","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:47:15","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("998","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:47:18","site","blog","GET","");
INSERT INTO tn_log_system VALUES("999","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:47:20","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1000","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:47:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("1001","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:47:30","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("1002","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:48:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("1003","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 12:55:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("1004","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 14:25:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("1005","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 14:25:28","default","index","GET","");
INSERT INTO tn_log_system VALUES("1006","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 14:25:31","default","index","GET","");
INSERT INTO tn_log_system VALUES("1007","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 14:25:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("1008","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 14:25:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("1009","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 15:15:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("1010","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 16:00:37","default","index","GET","");
INSERT INTO tn_log_system VALUES("1011","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-16 16:00:37","default","index","GET","");
INSERT INTO tn_log_system VALUES("1012","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 16:19:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("1013","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 16:19:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("1014","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 16:19:16","default","index","GET","");
INSERT INTO tn_log_system VALUES("1015","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36","2018-04-16 17:05:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("1016","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:50:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("1017","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:50:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("1018","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:50:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("1019","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:50:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("1020","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:50:58","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1021","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:51:00","default","index","GET","");
INSERT INTO tn_log_system VALUES("1022","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:51:03","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1023","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:51:05","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1024","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:51:07","default","index","GET","");
INSERT INTO tn_log_system VALUES("1025","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:51:09","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1026","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:51:12","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1027","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:51:14","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1028","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-16 17:51:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("1029","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 17:51:55","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1030","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 17:51:57","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1031","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 17:52:01","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1032","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 17:52:02","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1033","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 17:52:04","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1034","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 17:52:06","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1035","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 17:52:08","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1036","http://www.vina-jobs.com/index.php?r=logo_img.php","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36","2018-04-16 18:46:43","default","index","GET","");
INSERT INTO tn_log_system VALUES("1037","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:10:59","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1038","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:11:07","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1039","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:11:34","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1040","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:11:54","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1041","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:12:01","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1042","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:12:20","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1043","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:12:24","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1044","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:12:27","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1045","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:12:38","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1046","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:12:40","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1047","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:12:46","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1048","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:13:00","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1049","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:14:50","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1050","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:14:55","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1051","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:14:58","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1052","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:16:02","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1053","http://www.vina-jobs.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:16:06","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1054","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:16:24","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1055","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:16:33","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1056","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:20:14","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1057","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:20:25","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1058","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:20:28","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1059","http://www.vina-jobs.com/update/candidate.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:20:35","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1060","http://www.vina-jobs.com/web/uploads/images/users/11947627_1196879580337720_2083630260241166797_n.jpg","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:20:39","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1061","http://www.vina-jobs.com/update/candidate.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:20:45","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1062","http://www.vina-jobs.com/web/uploads/images/users/11947627_1196879580337720_2083630260241166797_n.jpg","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:20:45","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1063","http://www.vina-jobs.com/update/candidate.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:20:53","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1064","http://www.vina-jobs.com/web/uploads/images/users/11947627_1196879580337720_2083630260241166797_n.jpg","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:20:54","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1065","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 20:53:58","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1066","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 21:11:54","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1067","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 21:14:18","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1068","http://www.vina-jobs.com/blog.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 21:14:36","site","blog","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1069","http://www.vina-jobs.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 21:14:58","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1070","http://www.vina-jobs.com/employeers.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 21:15:04","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1071","http://www.vina-jobs.com/employeers.html","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 21:22:46","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1072","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 21:22:49","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1073","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 21:22:52","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1074","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-16 21:50:28","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1075","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-17 04:11:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("1076","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; GrapeshotCrawler/2.0; +http://www.grapeshot.co.uk/crawler.php)","2018-04-17 05:14:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("1077","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; GrapeshotCrawler/2.0; +http://www.grapeshot.co.uk/crawler.php)","2018-04-17 06:01:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("1078","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:18:02","default","index","GET","");
INSERT INTO tn_log_system VALUES("1079","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:18:02","default","index","GET","");
INSERT INTO tn_log_system VALUES("1080","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:18:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("1081","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon","2018-04-17 08:18:32","default","index","GET","");
INSERT INTO tn_log_system VALUES("1082","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:18:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("1083","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:18:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("1084","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:18:53","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1085","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:18:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("1086","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:18:57","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1087","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:18:59","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1088","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:19:02","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1089","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:19:04","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1090","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:19:06","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1091","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:19:10","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1092","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:19:13","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1093","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:19:21","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("1094","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:19:32","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("1095","http://www.vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:19:40","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("1096","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:20:08","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1097","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:20:10","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1098","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:20:12","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1099","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:20:14","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1100","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:20:16","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1101","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:20:19","default","index","GET","");
INSERT INTO tn_log_system VALUES("1102","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 08:20:22","site","search","GET","");
INSERT INTO tn_log_system VALUES("1103","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 Safari/537.36","2018-04-17 10:18:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("1104","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; GrapeshotCrawler/2.0; +http://www.grapeshot.co.uk/crawler.php)","2018-04-17 11:24:09","default","index","GET","");
INSERT INTO tn_log_system VALUES("1105","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 12:39:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("1106","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 12:39:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("1107","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 12:39:11","default","index","GET","");
INSERT INTO tn_log_system VALUES("1108","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 12:39:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("1109","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 12:39:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("1110","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 12:39:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("1111","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:04:05","default","index","GET","");
INSERT INTO tn_log_system VALUES("1112","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:04:07","default","index","GET","");
INSERT INTO tn_log_system VALUES("1113","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:04:08","default","index","GET","");
INSERT INTO tn_log_system VALUES("1114","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:05:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("1115","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:07:18","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1116","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:07:20","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1117","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:07:23","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1118","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:07:25","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1119","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:07:29","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1120","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:07:31","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1121","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:07:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("1122","http://www.vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:07:42","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("1123","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:07:48","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("1124","http://www.vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:07:57","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("1125","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:08:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("1126","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:08:43","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1127","http://www.vina-jobs.com/update/candidate.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:08:55","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1128","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 13:09:24","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1129","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:54:57","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1130","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:54:58","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1131","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:10","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1132","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:10","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1133","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:19","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1134","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:20","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1135","http://www.vina-jobs.com/job-seekers.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:22","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1136","http://www.vina-jobs.com/employeers.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:23","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1137","http://www.vina-jobs.com/about-us.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:25","site","about-us","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1138","http://www.vina-jobs.com/blog.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:27","site","blog","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1139","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:30","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1140","http://www.vina-jobs.com/search/result.html?keywords=&jobs=0&loca=0","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:34","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1141","http://www.vina-jobs.com/search/result.html?keywords=&mode=search-jobs","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:36","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1142","http://www.vina-jobs.com/search/result.html?keywords=&mode=search-jobs","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 14:55:40","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1143","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 15:49:09","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1144","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 15:49:09","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1145","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:00","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1146","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:01","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1147","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:04","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1148","http://www.vina-jobs.com/job-seekers.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:06","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1149","http://www.vina-jobs.com/employeers.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:08","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1150","http://www.vina-jobs.com/about-us.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:12","site","about-us","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1151","http://www.vina-jobs.com/blog.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:16","site","blog","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1152","http://www.vina-jobs.com/contact.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:22","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1153","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:28","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1154","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:30","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1155","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:33","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1156","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:01:34","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1157","http://www.vina-jobs.com/employeers.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:02:01","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1158","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:15:32","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1159","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:15:35","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1160","http://www.vina-jobs.com/job-seekers.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:15:37","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1161","http://www.vina-jobs.com/employeers.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:15:39","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1162","http://www.vina-jobs.com/about-us.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:15:40","site","about-us","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1163","http://www.vina-jobs.com/blog.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:15:49","site","blog","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1164","http://www.vina-jobs.com/contact.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:15:51","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1165","http://www.vina-jobs.com/blog.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:15:53","site","blog","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1166","http://www.vina-jobs.com/about-us.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:15:55","site","about-us","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1167","http://www.vina-jobs.com/contact.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:15:57","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1168","http://www.vina-jobs.com/contact.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:19:10","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1169","http://www.vina-jobs.com/contact.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:19:45","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1170","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:41:32","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1171","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:41:41","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1172","http://www.vina-jobs.com/job-seekers.html","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:41:43","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1173","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 16:41:48","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1174","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0","2018-04-17 16:41:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("1175","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:07:29","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1176","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:14:38","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1177","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:14:39","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1178","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:31:26","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1179","http://www.vina-jobs.com/","88","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:31:27","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1180","http://www.vina-jobs.com/index.php?r=about-us.html","0","172.31.18.22","Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)","2018-04-17 17:33:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("1181","http://www.vina-jobs.com/index.php?r=blog.html","0","172.31.18.22","Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)","2018-04-17 17:33:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("1182","http://www.vina-jobs.com/index.php?r=contact.html","0","172.31.18.22","Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)","2018-04-17 17:33:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("1183","http://www.vina-jobs.com/index.php?r=employeers.html","0","172.31.18.22","Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)","2018-04-17 17:33:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("1184","http://www.vina-jobs.com/index.php?r=job-seekers.html","0","172.31.18.22","Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)","2018-04-17 17:33:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("1185","http://www.vina-jobs.com/index.php?r=user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)","2018-04-17 17:33:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("1186","http://www.vina-jobs.com/index.php?r=user/register.html","0","172.31.18.22","Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)","2018-04-17 17:33:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("1187","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("1188","http://www.jobsvina.com/vendor/bower-asset/select2/dist/css/select2.min.css","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:26","site","error","GET","");
INSERT INTO tn_log_system VALUES("1189","http://www.jobsvina.com/vendor/bower-asset/iCheck/skins/all.css","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:26","site","error","GET","");
INSERT INTO tn_log_system VALUES("1190","http://www.jobsvina.com/vendor/bower-asset/select2/dist/js/select2.min.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:28","site","error","GET","");
INSERT INTO tn_log_system VALUES("1191","http://www.jobsvina.com/vendor/bower-asset/iCheck/icheck.min.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:28","site","error","GET","");
INSERT INTO tn_log_system VALUES("1192","http://www.jobsvina.com/vendor/bower-asset/cropit/dist/jquery.cropit.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:28","site","error","GET","");
INSERT INTO tn_log_system VALUES("1193","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("1194","http://www.jobsvina.com/vendor/bower-asset/select2/dist/css/select2.min.css","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:31","site","error","GET","");
INSERT INTO tn_log_system VALUES("1195","http://www.jobsvina.com/vendor/bower-asset/iCheck/skins/all.css","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:31","site","error","GET","");
INSERT INTO tn_log_system VALUES("1196","http://www.jobsvina.com/vendor/bower-asset/cropit/dist/jquery.cropit.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:31","site","error","GET","");
INSERT INTO tn_log_system VALUES("1197","http://www.jobsvina.com/vendor/bower-asset/iCheck/icheck.min.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:31","site","error","GET","");
INSERT INTO tn_log_system VALUES("1198","http://www.jobsvina.com/vendor/bower-asset/select2/dist/js/select2.min.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:31","site","error","GET","");
INSERT INTO tn_log_system VALUES("1199","http://www.jobsvina.com/vendor/bower-asset/iCheck/icheck.min.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:32","site","error","GET","");
INSERT INTO tn_log_system VALUES("1200","http://www.jobsvina.com/vendor/bower-asset/cropit/dist/jquery.cropit.js","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:50:32","site","error","GET","");
INSERT INTO tn_log_system VALUES("1201","http://www.jobsvina.com/vendor/bower-asset/iCheck/skins/all.css","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:51:14","site","error","GET","");
INSERT INTO tn_log_system VALUES("1202","http://www.jobsvina.com/vendor/bower-asset/select2/dist/css/select2.min.css","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:51:14","site","error","GET","");
INSERT INTO tn_log_system VALUES("1203","http://www.jobsvina.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:51:14","site","error","GET","");
INSERT INTO tn_log_system VALUES("1204","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:52:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("1205","http://www.jobsvina.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:01","site","error","GET","");
INSERT INTO tn_log_system VALUES("1206","http://www.jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:03","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1207","http://www.jobsvina.com/web/template/jobs/js/underscore-min.map","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:03","site","error","GET","");
INSERT INTO tn_log_system VALUES("1208","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:06","default","index","GET","");
INSERT INTO tn_log_system VALUES("1209","http://www.jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:08","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1210","http://www.jobsvina.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:10","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1211","http://www.jobsvina.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:11","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1212","http://www.jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:12","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1213","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("1214","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:29","default","index","GET","");
INSERT INTO tn_log_system VALUES("1215","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("1216","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("1217","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("1218","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("1219","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:31","default","index","GET","");
INSERT INTO tn_log_system VALUES("1220","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:31","default","index","GET","");
INSERT INTO tn_log_system VALUES("1221","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:31","default","index","GET","");
INSERT INTO tn_log_system VALUES("1222","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:31","default","index","GET","");
INSERT INTO tn_log_system VALUES("1223","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:31","default","index","GET","");
INSERT INTO tn_log_system VALUES("1224","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:32","default","index","GET","");
INSERT INTO tn_log_system VALUES("1225","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:32","default","index","GET","");
INSERT INTO tn_log_system VALUES("1226","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:32","default","index","GET","");
INSERT INTO tn_log_system VALUES("1227","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("1228","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("1229","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:37","default","index","GET","");
INSERT INTO tn_log_system VALUES("1230","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("1231","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 17:53:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("1232","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-17 17:59:56","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1233","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)","2018-04-17 18:20:05","default","index","GET","");
INSERT INTO tn_log_system VALUES("1234","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-17 18:53:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("1235","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-17 18:53:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("1236","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-17 18:58:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("1237","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-17 20:26:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("1238","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-17 20:27:00","default","index","GET","");
INSERT INTO tn_log_system VALUES("1239","http://www.jobsvina.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-17 20:27:15","site","search","GET","");
INSERT INTO tn_log_system VALUES("1240","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon","2018-04-17 20:55:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("1241","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 20:56:00","default","index","GET","");
INSERT INTO tn_log_system VALUES("1242","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 20:56:00","default","index","GET","");
INSERT INTO tn_log_system VALUES("1243","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 20:56:19","default","index","GET","");
INSERT INTO tn_log_system VALUES("1244","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 20:56:20","default","index","GET","");
INSERT INTO tn_log_system VALUES("1245","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 20:56:30","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1246","http://www.vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 20:56:32","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1247","http://www.vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 20:56:34","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1248","http://www.vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 20:56:36","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1249","http://www.vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 20:56:37","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1250","http://www.vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 20:56:39","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1251","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 21:08:52","default","index","GET","");
INSERT INTO tn_log_system VALUES("1252","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 21:08:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("1253","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 21:08:56","default","index","GET","");
INSERT INTO tn_log_system VALUES("1254","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 21:08:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("1255","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 21:09:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("1256","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 21:12:28","default","index","GET","");
INSERT INTO tn_log_system VALUES("1257","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 21:12:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("1258","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 21:12:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("1259","http://www.jobsvina.com/index.php?r=v","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 Google (+https://developers.google.com/+/web/snippet/)","2018-04-17 21:15:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("1260","http://www.jobsvina.com/index.php?r=vina-j","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 Google (+https://developers.google.com/+/web/snippet/)","2018-04-17 21:15:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("1261","http://www.jobsvina.com/index.php?r=vina-jobs","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 Google (+https://developers.google.com/+/web/snippet/)","2018-04-17 21:15:27","default","index","GET","");
INSERT INTO tn_log_system VALUES("1262","http://www.jobsvina.com/index.php?r=vina-jobs.com","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 Google (+https://developers.google.com/+/web/snippet/)","2018-04-17 21:15:29","default","index","GET","");
INSERT INTO tn_log_system VALUES("1263","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 21:17:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("1264","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 21:44:28","default","index","GET","");
INSERT INTO tn_log_system VALUES("1265","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 21:44:28","default","index","GET","");
INSERT INTO tn_log_system VALUES("1266","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-17 21:59:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("1267","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 23:16:07","default","index","GET","");
INSERT INTO tn_log_system VALUES("1268","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 23:16:20","default","index","GET","");
INSERT INTO tn_log_system VALUES("1269","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 23:16:23","default","index","GET","");
INSERT INTO tn_log_system VALUES("1270","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 23:16:23","default","index","GET","");
INSERT INTO tn_log_system VALUES("1271","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0","2018-04-17 23:16:53","default","index","GET","");
INSERT INTO tn_log_system VALUES("1272","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0","2018-04-17 23:17:19","default","index","GET","");
INSERT INTO tn_log_system VALUES("1273","http://www.jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0","2018-04-17 23:17:21","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1274","http://www.jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0","2018-04-17 23:17:24","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1275","http://www.jobsvina.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0","2018-04-17 23:17:27","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1276","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0","2018-04-17 23:17:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("1277","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 23:22:07","default","index","GET","");
INSERT INTO tn_log_system VALUES("1278","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-17 23:22:08","default","index","GET","");
INSERT INTO tn_log_system VALUES("1279","http://www.vina-jobs.com/assets/8976f2ee/css/bootstrap.css","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-18 01:12:25","site","error","GET","");
INSERT INTO tn_log_system VALUES("1280","http://www.JOBSVINA.com/","0","172.31.18.22","Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)","2018-04-18 03:09:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("1281","http://www.JOBSVINA.com/contact.html","0","172.31.18.22","Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)","2018-04-18 03:09:34","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1282","http://www.vina-jobs.com/","0","172.31.18.22","","2018-04-18 04:00:06","site","error","GET","");
INSERT INTO tn_log_system VALUES("1283","http://www.jobsvina.com/search/result.html?keywords=&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 06:47:21","site","search","GET","");
INSERT INTO tn_log_system VALUES("1284","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 06:47:32","default","index","GET","");
INSERT INTO tn_log_system VALUES("1285","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 06:47:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("1286","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 08:03:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("1287","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 08:03:23","default","index","GET","");
INSERT INTO tn_log_system VALUES("1288","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:23:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("1289","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:23:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("1290","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:24:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("1291","http://www.jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:24:05","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1292","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-18 08:25:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("1293","http://www.jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:26:57","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1294","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:26:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("1295","http://www.jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:27:01","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1296","http://www.jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:27:02","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1297","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:27:05","default","index","GET","");
INSERT INTO tn_log_system VALUES("1298","http://www.jobsvina.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:27:06","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1299","http://www.jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:27:08","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1300","http://www.jobsvina.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:27:10","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1301","http://www.jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:27:12","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1302","http://www.jobsvina.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:27:14","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1303","http://www.jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:27:16","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1304","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:27:21","default","index","GET","");
INSERT INTO tn_log_system VALUES("1305","http://www.jobsvina.com/assets/img/img16.jpg","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:27:51","site","error","GET","");
INSERT INTO tn_log_system VALUES("1306","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:29:47","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1307","http://www.jobsvina.com/html/layouts/builder.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:33:28","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1308","http://www.jobsvina.com/html/layouts/builder.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:33:40","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1309","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 08:38:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("1310","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 08:39:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("1311","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 08:41:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("1312","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 08:41:36","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1313","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 08:41:56","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1314","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 08:42:07","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1315","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:44:37","default","index","GET","");
INSERT INTO tn_log_system VALUES("1316","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:44:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("1317","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 08:53:20","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1318","http://www.vina-jobs.com/cdn-cgi/l/email-protection","0","172.31.18.22","Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)","2018-04-18 08:55:57","site","error","GET","");
INSERT INTO tn_log_system VALUES("1319","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:00:01","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1320","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:00:10","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1321","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:00:29","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1322","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:00:36","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1323","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:00:37","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1324","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:00:38","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1325","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:00:38","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1326","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:00:39","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1327","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-18 09:01:16","default","index","GET","");
INSERT INTO tn_log_system VALUES("1328","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Macintosh; PPC Mac OS X 10.8; rv:50.0) Gecko/20100101 Firefox/50.0","2018-04-18 09:16:25","default","index","GET","");
INSERT INTO tn_log_system VALUES("1329","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-18 09:25:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("1330","http://www.jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-18 09:25:47","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1331","http://www.jobsvina.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-18 09:25:54","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("1332","http://www.jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-18 09:25:56","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1333","http://www.jobsvina.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-18 09:25:56","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("1334","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-18 09:25:59","default","index","GET","");
INSERT INTO tn_log_system VALUES("1335","http://www.jobsvina.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-18 09:26:00","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("1336","http://www.jobsvina.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-18 09:26:00","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1337","http://www.jobsvina.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-18 09:26:01","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1338","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-18 09:26:02","default","index","GET","");
INSERT INTO tn_log_system VALUES("1339","http://www.jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-18 09:26:02","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1340","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:33:57","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1341","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:36:23","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1342","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:36:27","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1343","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:37:41","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1344","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:38:25","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1345","http://www.jobsvina.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:38:27","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1346","http://www.jobsvina.com/employeers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:38:30","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1347","http://www.jobsvina.com/employeers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:42:20","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1348","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:42:23","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1349","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:42:29","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1350","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:42:30","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1351","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:42:33","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1352","http://www.jobsvina.com/employeers/detail/web-developer-java--javascript--jquery-1.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:42:43","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1353","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:42:54","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1354","http://www.jobsvina.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:42:56","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1355","http://www.jobsvina.com/employeers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:42:58","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1356","http://www.jobsvina.com/about-us.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:43:00","site","about-us","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1357","http://www.jobsvina.com/blog.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:43:01","site","blog","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1358","http://www.jobsvina.com/contact.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:43:02","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1359","http://www.jobsvina.com/contact.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:45:53","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1360","http://www.jobsvina.com/contact.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:45:55","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1361","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:45:57","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1362","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:46:00","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1363","http://www.jobsvina.com/search/result.html?keywords=&jobs=0&loca=0","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:46:02","site","search","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1364","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:46:04","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1365","http://www.jobsvina.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:46:06","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1366","http://www.jobsvina.com/employeers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:46:08","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1367","http://www.jobsvina.com/about-us.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:46:10","site","about-us","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1368","http://www.jobsvina.com/blog.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:46:13","site","blog","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1369","http://www.jobsvina.com/contact.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:46:16","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1370","http://www.jobsvina.com/contact.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:48:27","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1371","http://www.jobsvina.com/contact.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:48:30","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1372","http://www.jobsvina.com/contact.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:48:33","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1373","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:48:34","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1374","http://www.jobsvina.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:48:36","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1375","http://www.jobsvina.com/employeers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:48:39","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1376","http://www.jobsvina.com/about-us.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:48:44","site","about-us","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1377","http://www.jobsvina.com/update/candidate.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:48:46","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1378","http://www.jobsvina.com/web/uploads/images/users/11947627_1196879580337720_2083630260241166797_n.jpg","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:48:48","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1379","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:52:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("1380","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:52:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("1381","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:52:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("1382","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:53:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("1383","http://vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:53:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("1384","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:53:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("1385","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:53:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("1386","http://vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:53:29","default","index","GET","");
INSERT INTO tn_log_system VALUES("1387","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:53:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("1388","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:53:41","default","index","GET","");
INSERT INTO tn_log_system VALUES("1389","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:53:51","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1390","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 09:53:51","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1391","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:00:43","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1392","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:00:46","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1393","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:00:47","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1394","http://www.jobsvina.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:00:48","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1395","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:04:39","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1396","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:04:39","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1397","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:04:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("1398","http://jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:04:54","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1399","http://jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:04:56","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1400","http://jobsvina.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:04:57","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1401","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:04:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("1402","http://jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:05:01","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1403","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:05:06","default","index","GET","");
INSERT INTO tn_log_system VALUES("1404","http://jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:05:07","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1405","http://jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:05:09","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1406","http://jobsvina.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:05:10","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1407","http://jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:05:12","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1408","http://jobsvina.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:05:14","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1409","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 10:05:15","default","index","GET","");
INSERT INTO tn_log_system VALUES("1410","http://vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 Safari/537.36","2018-04-18 10:18:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("1411","http://www.vina-jobs.com/assets/8976f2ee/css/bootstrap.css","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-18 11:07:40","site","error","GET","");
INSERT INTO tn_log_system VALUES("1412","http://vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)","2018-04-18 11:20:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("1413","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)","2018-04-18 11:20:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("1414","http://vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-18 11:28:59","default","index","GET","");
INSERT INTO tn_log_system VALUES("1415","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 5.1; rv:5.0) Gecko/20100101 Firefox/5.0","2018-04-18 11:48:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("1416","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:02:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("1417","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:03:00","default","index","GET","");
INSERT INTO tn_log_system VALUES("1418","http://jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:03:03","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1419","http://jobsvina.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:03:05","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1420","http://jobsvina.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:04:41","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1421","http://jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:04:43","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1422","http://jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:04:45","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1423","http://jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:04:47","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1424","http://jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:04:53","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1425","http://jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:04:58","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1426","http://jobsvina.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:05:01","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1427","http://jobsvina.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:05:06","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1428","http://jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:05:08","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1429","http://jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:05:10","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1430","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 12:05:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("1431","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 5.1; rv:33.0) Gecko/20100101 Firefox/33.0","2018-04-18 13:04:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("1432","http://www.vina-jobs.com/index.php?r=blog.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-18 13:10:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("1433","http://www.vina-jobs.com/employeers/detail/web-developer-java--javascript--jquery-1.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-18 13:17:28","site","error","GET","");
INSERT INTO tn_log_system VALUES("1434","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; U; Android 2.2; en-us; Nexus One Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1","2018-04-18 13:40:36","default","index","GET","");
INSERT INTO tn_log_system VALUES("1435","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 14:03:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("1436","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 14:03:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("1437","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; U; Android 2.2; en-us; Nexus One Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1","2018-04-18 14:43:16","default","index","GET","");
INSERT INTO tn_log_system VALUES("1438","http://vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)","2018-04-18 15:24:53","default","index","GET","");
INSERT INTO tn_log_system VALUES("1439","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 16:11:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("1440","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 16:11:14","default","index","GET","");
INSERT INTO tn_log_system VALUES("1441","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 16:11:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("1442","http://www.jobsvina.com/","0","172.31.18.22","python-requests/2.18.4","2018-04-18 16:13:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("1443","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 GTB7.1","2018-04-18 16:19:21","default","index","GET","");
INSERT INTO tn_log_system VALUES("1444","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 17:07:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("1445","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 17:07:50","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1446","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 17:07:51","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1447","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 17:08:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("1448","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 17:08:15","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1449","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-18 17:08:17","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1450","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:32.0) Gecko/20100101 Firefox/32.0","2018-04-18 17:31:36","default","index","HEAD","");
INSERT INTO tn_log_system VALUES("1451","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1","2018-04-18 17:51:01","default","index","GET","");
INSERT INTO tn_log_system VALUES("1452","http://www.vina-jobs.com/","1","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 18:12:17","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1453","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 18:14:38","default","index","GET","");
INSERT INTO tn_log_system VALUES("1454","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 18:14:46","default","index","GET","");
INSERT INTO tn_log_system VALUES("1455","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 18:14:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("1456","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 18:14:59","default","index","GET","");
INSERT INTO tn_log_system VALUES("1457","http://www.jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 18:15:05","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1458","http://www.jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 18:15:08","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1459","http://www.jobsvina.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 18:15:16","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1460","http://www.jobsvina.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 18:15:39","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1461","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 18:15:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("1462","http://www.jobsvina.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 18:15:54","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("1463","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-18 18:22:18","default","index","GET","");
INSERT INTO tn_log_system VALUES("1464","http://jobsvina.com/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-18 18:22:18","site","error","GET","");
INSERT INTO tn_log_system VALUES("1465","http://jobsvina.com/xmlrpc.php?rsd","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-18 18:22:18","site","error","GET","");
INSERT INTO tn_log_system VALUES("1466","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-18 18:22:19","default","index","GET","");
INSERT INTO tn_log_system VALUES("1467","http://jobsvina.com/blog/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-18 18:22:19","site","error","GET","");
INSERT INTO tn_log_system VALUES("1468","http://jobsvina.com/wordpress/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-18 18:22:19","site","error","GET","");
INSERT INTO tn_log_system VALUES("1469","http://jobsvina.com/wp/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-18 18:22:20","site","error","GET","");
INSERT INTO tn_log_system VALUES("1470","http://jobsvina.com/site/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-18 18:22:21","site","error","GET","");
INSERT INTO tn_log_system VALUES("1471","http://jobsvina.com/cms/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-18 18:22:22","site","error","GET","");
INSERT INTO tn_log_system VALUES("1472","http://www.JOBSVINA.COM/","0","172.31.18.22","python-requests/2.7.0 CPython/2.7.6 Windows/2008ServerR2","2018-04-18 18:34:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("1473","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)","2018-04-18 19:10:30","default","index","GET","");
INSERT INTO tn_log_system VALUES("1474","http://www.vina-jobs.com/employeers/detail/web-developer-java--javascript--jquery-1.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-18 19:13:36","site","error","GET","");
INSERT INTO tn_log_system VALUES("1475","http://vina-jobs.com/user/register?element_parents=account/mail/%23value&ajax_form=1&_wrapper_format=drupal_ajax","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; rv:34.0) Gecko/20100101 Firefox/34.0","2018-04-18 19:22:21","site","error","POST","");
INSERT INTO tn_log_system VALUES("1476","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:06:45","default","index","GET","");
INSERT INTO tn_log_system VALUES("1477","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:06:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("1478","http://www.jobsvina.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:06:56","site","search","GET","");
INSERT INTO tn_log_system VALUES("1479","http://www.jobsvina.com/search/result.html?keywords=&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:07:32","site","search","GET","");
INSERT INTO tn_log_system VALUES("1480","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:07:48","default","index","GET","");
INSERT INTO tn_log_system VALUES("1481","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:07:50","default","index","GET","");
INSERT INTO tn_log_system VALUES("1482","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:40:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("1483","http://jobsvina.com/search/result.html?keywords=&jobs=0&loca=0","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:41:04","site","search","GET","");
INSERT INTO tn_log_system VALUES("1484","http://jobsvina.com/search/result.html?keywords=&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:42:16","site","search","GET","");
INSERT INTO tn_log_system VALUES("1485","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:42:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("1486","http://jobsvina.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:43:24","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("1487","http://jobsvina.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:50:12","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("1488","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:50:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("1489","http://jobsvina.com/search/result.html?keywords=&mode=search-jobs","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:50:25","site","search","GET","");
INSERT INTO tn_log_system VALUES("1490","http://vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 20:50:28","default","index","GET","");
INSERT INTO tn_log_system VALUES("1491","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 21:02:33","default","index","GET","");
INSERT INTO tn_log_system VALUES("1492","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 21:02:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("1493","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 21:02:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("1494","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-18 21:03:17","default","index","GET","");
INSERT INTO tn_log_system VALUES("1495","http://www.JOBSVINA.COM/","0","172.31.18.22","Mozilla/5.0 (Windows NT 5.1; rv:33.0) Gecko/20100101 Firefox/33.0","2018-04-18 21:18:06","default","index","GET","");
INSERT INTO tn_log_system VALUES("1496","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36","2018-04-18 21:53:26","default","index","GET","");
INSERT INTO tn_log_system VALUES("1497","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36","2018-04-18 23:14:16","default","index","GET","");
INSERT INTO tn_log_system VALUES("1498","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.0.1) Gecko/2008070208","2018-04-18 23:57:35","default","index","GET","");
INSERT INTO tn_log_system VALUES("1499","http://www.vina-jobs.com/employeers/detail/web-developer-java--javascript--jquery-1.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-19 00:50:05","site","error","GET","");
INSERT INTO tn_log_system VALUES("1500","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko)Chrome/37.0.2062.124 Safari/537.36","2018-04-19 01:51:52","default","index","GET","");
INSERT INTO tn_log_system VALUES("1501","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1","2018-04-19 01:51:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("1502","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36","2018-04-19 01:54:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("1503","http://www.vina-jobs.com/","0","172.31.18.22","","2018-04-19 03:57:02","site","error","GET","");
INSERT INTO tn_log_system VALUES("1504","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Macintosh; PPC Mac OS X 10.8; rv:52.0) Gecko/20100101 Firefox/52.0","2018-04-19 04:43:34","default","index","GET","");
INSERT INTO tn_log_system VALUES("1505","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (X11; U; Linux x86_64; es-ES; rv:1.9.0.4) Gecko/2008111217 Fedora/3.0.4-1.fc10 Firefox/3.0.4","2018-04-19 06:18:49","default","index","GET","");
INSERT INTO tn_log_system VALUES("1506","http://www.vina-jobs.com/employeers/detail/web-developer-java--javascript--jquery-1.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-19 07:10:28","site","error","GET","");
INSERT INTO tn_log_system VALUES("1507","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:10:46","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1508","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:10:47","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1509","http://www.jobsvina.com/update/candidate.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:11:31","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1510","http://www.jobsvina.com/web/uploads/images/users/11947627_1196879580337720_2083630260241166797_n.jpg","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:11:34","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1511","http://www.jobsvina.com/update/candidate.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:11:44","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1512","http://www.jobsvina.com/web/uploads/images/users/11947627_1196879580337720_2083630260241166797_n.jpg","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:11:44","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1513","http://www.jobsvina.com/employeers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:11:47","site","employeers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1514","http://www.jobsvina.com/update/candidate.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:11:52","user","update-candidate","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1515","http://www.jobsvina.com/web/uploads/images/users/11947627_1196879580337720_2083630260241166797_n.jpg","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:11:53","site","error","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1516","http://www.jobsvina.com/about-us.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:13:42","site","about-us","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1517","http://www.jobsvina.com/blog.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:13:44","site","blog","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1518","http://www.jobsvina.com/contact.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:13:47","site","contact","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1519","http://www.jobsvina.com/job-seekers.html","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:13:53","site","job-seekers","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1520","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:13:55","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1521","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:17:46","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1522","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:17:49","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1523","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:22:02","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1524","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:22:05","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1525","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:22:07","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1526","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:22:08","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1527","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:22:18","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1528","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:22:24","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1529","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:22:26","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1530","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:22:43","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1531","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:22:56","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1532","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:23:02","default","index","GET","");
INSERT INTO tn_log_system VALUES("1533","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:23:10","default","index","GET","");
INSERT INTO tn_log_system VALUES("1534","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:24:08","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1535","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:24:11","default","index","GET","");
INSERT INTO tn_log_system VALUES("1536","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:24:13","default","index","GET","");
INSERT INTO tn_log_system VALUES("1537","http://jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:24:15","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1538","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 08:24:19","default","index","GET","");
INSERT INTO tn_log_system VALUES("1539","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon","2018-04-19 08:25:44","default","index","GET","");
INSERT INTO tn_log_system VALUES("1540","http://jobsvina.com/","0","172.31.18.22","Curl/PHP 5.6.35 (http://github.com/shuber/curl)","2018-04-19 08:42:59","default","index","GET","");
INSERT INTO tn_log_system VALUES("1541","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 Safari/537.36","2018-04-19 10:16:55","default","index","GET","");
INSERT INTO tn_log_system VALUES("1542","http://vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 Safari/537.36","2018-04-19 10:19:29","default","index","GET","");
INSERT INTO tn_log_system VALUES("1543","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)","2018-04-19 11:08:39","default","index","GET","");
INSERT INTO tn_log_system VALUES("1544","http://www.jobsvina.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)","2018-04-19 11:09:49","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1545","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)","2018-04-19 11:13:27","default","index","GET","");
INSERT INTO tn_log_system VALUES("1546","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-19 11:22:27","default","index","GET","");
INSERT INTO tn_log_system VALUES("1547","http://www.jobsvina.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-19 11:23:36","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("1548","http://www.jobsvina.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 7.0; SM-N935F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36","2018-04-19 11:23:44","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("1549","http://www.jobsvina.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)","2018-04-19 11:24:20","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("1550","http://www.jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)","2018-04-19 11:28:49","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1551","http://www.vina-jobs.com/employeers/detail/web-developer-java--javascript--jquery-1.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-19 12:52:29","site","error","GET","");
INSERT INTO tn_log_system VALUES("1552","http://vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:12","default","index","GET","");
INSERT INTO tn_log_system VALUES("1553","http://vina-jobs.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:16","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1554","http://vina-jobs.com/employeers/detail/web-developer-java--javascript--jquery-1.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:16","site","error","GET","");
INSERT INTO tn_log_system VALUES("1555","http://vina-jobs.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:18","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("1556","http://vina-jobs.com/contact.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:19","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1557","http://vina-jobs.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:20","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("1558","http://vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:22","default","index","GET","");
INSERT INTO tn_log_system VALUES("1559","http://vina-jobs.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:22","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("1560","http://vina-jobs.com/about-us.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:23","site","about-us","GET","");
INSERT INTO tn_log_system VALUES("1561","http://vina-jobs.com/blog.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:23","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1562","http://vina-jobs.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:24","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1563","http://vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36","2018-04-19 13:26:24","default","index","GET","");
INSERT INTO tn_log_system VALUES("1564","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36","2018-04-19 13:37:32","default","index","GET","");
INSERT INTO tn_log_system VALUES("1565","http://www.jobsvina.com/?feed=rss2","0","172.31.18.22","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:18.0)  Gecko/20100101 Firefox/18.0","2018-04-19 14:02:40","default","index","GET","");
INSERT INTO tn_log_system VALUES("1566","http://www.vina-jobs.com/vvvnnutfs.html","0","172.31.18.22","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","2018-04-19 14:07:18","site","error","GET","");
INSERT INTO tn_log_system VALUES("1567","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:47","default","index","HEAD","");
INSERT INTO tn_log_system VALUES("1568","http://www.jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:47","default","index","GET","");
INSERT INTO tn_log_system VALUES("1569","http://www.jobsvina.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:48","user","forgot","HEAD","");
INSERT INTO tn_log_system VALUES("1570","http://www.jobsvina.com/user/forgot-password.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:48","user","forgot","GET","");
INSERT INTO tn_log_system VALUES("1571","http://www.jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:48","site","contact","HEAD","");
INSERT INTO tn_log_system VALUES("1572","http://www.jobsvina.com/contact.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:49","site","contact","GET","");
INSERT INTO tn_log_system VALUES("1573","http://www.jobsvina.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:49","user","register-candidate","HEAD","");
INSERT INTO tn_log_system VALUES("1574","http://www.jobsvina.com/register/candidate.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:49","user","register-candidate","GET","");
INSERT INTO tn_log_system VALUES("1575","http://www.jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:49","site","employeers","HEAD","");
INSERT INTO tn_log_system VALUES("1576","http://www.jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:50","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1577","http://www.jobsvina.com/employeers/detail/web-developer-java--javascript--jquery-1.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:51","site","error","HEAD","");
INSERT INTO tn_log_system VALUES("1578","http://www.jobsvina.com/employeers/detail/web-developer-java--javascript--jquery-1.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:52","site","error","GET","");
INSERT INTO tn_log_system VALUES("1579","http://www.jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:52","site","job-seekers","HEAD","");
INSERT INTO tn_log_system VALUES("1580","http://www.jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:52","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1581","http://www.jobsvina.com/blog.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:53","site","blog","HEAD","");
INSERT INTO tn_log_system VALUES("1582","http://www.jobsvina.com/blog.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:03:53","site","blog","GET","");
INSERT INTO tn_log_system VALUES("1583","http://www.jobsvina.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:04:24","user","register-company","HEAD","");
INSERT INTO tn_log_system VALUES("1584","http://www.jobsvina.com/register/company.html","0","172.31.18.22","Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML","2018-04-19 15:04:25","user","register-company","GET","");
INSERT INTO tn_log_system VALUES("1585","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 16:01:02","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1586","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-19 16:22:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("1587","http://jobsvina.com/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-19 16:22:57","site","error","GET","");
INSERT INTO tn_log_system VALUES("1588","http://jobsvina.com/xmlrpc.php?rsd","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-19 16:22:57","site","error","GET","");
INSERT INTO tn_log_system VALUES("1589","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-19 16:22:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("1590","http://jobsvina.com/blog/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-19 16:22:58","site","error","GET","");
INSERT INTO tn_log_system VALUES("1591","http://jobsvina.com/wordpress/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-19 16:22:58","site","error","GET","");
INSERT INTO tn_log_system VALUES("1592","http://jobsvina.com/wp/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-19 16:22:58","site","error","GET","");
INSERT INTO tn_log_system VALUES("1593","http://jobsvina.com/site/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-19 16:22:58","site","error","GET","");
INSERT INTO tn_log_system VALUES("1594","http://jobsvina.com/cms/wp-includes/wlwmanifest.xml","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","2018-04-19 16:22:59","site","error","GET","");
INSERT INTO tn_log_system VALUES("1595","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 17:01:51","default","index","GET","");
INSERT INTO tn_log_system VALUES("1596","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 17:01:52","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1597","http://www.jobsvina.com/","1","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 17:01:53","default","index","GET","Asia/Bangkok");
INSERT INTO tn_log_system VALUES("1598","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 17:01:57","default","index","GET","");
INSERT INTO tn_log_system VALUES("1599","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 17:01:58","default","index","GET","");
INSERT INTO tn_log_system VALUES("1600","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 17:02:05","default","index","GET","");
INSERT INTO tn_log_system VALUES("1601","http://jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 17:02:08","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1602","http://jobsvina.com/employeers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 17:02:54","site","employeers","GET","");
INSERT INTO tn_log_system VALUES("1603","http://jobsvina.com/","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 17:03:03","default","index","GET","");
INSERT INTO tn_log_system VALUES("1604","http://jobsvina.com/job-seekers.html","0","172.31.18.22","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36","2018-04-19 17:03:05","site","job-seekers","GET","");
INSERT INTO tn_log_system VALUES("1605","http://www.vina-jobs.com/","0","172.31.18.22","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon","2018-04-19 20:29:25","default","index","GET","");



DROP TABLE tn_news;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO tn_news VALUES("1","7","","","<div style=\"width: 80%\">\n<p style=\"text-align:justify\">UBND qu?n 1 v?a th&ocirc;ng b&aacute;o cho c? d&acirc;n chung c? 155-157 B&ugrave;i Vi?n (ph??ng Ph?m Ng? L&atilde;o) v&agrave; chung c? 128 Hai B&agrave; Tr?ng (ph??ng ?a Kao) v? t&igrave;nh tr?ng xu?ng c?p, ph?i di d?i, ph&aacute; d? kh?n c?p. K? ho?ch x&acirc;y d?ng l?i hai chung c? c&oacute; t? tr??c n?m 1975 n&agrave;y, ?ang ???c nghi&ecirc;n c?u.</p>\n\n<p style=\"text-align:justify\">Chung c? tr&ecirc;n ???ng B&ugrave;i Vi?n g?m m?t tr?t, 6 t?ng, c&oacute; k?t qu? ki?m ??nh ? m?c D - kh? n?ng ch?u l?c c?a k?t c?u kh&ocirc;ng ?&aacute;p ?ng ???c nhu c?u s? d?ng b&igrave;nh th??ng. Nh&agrave; xu?t hi?n t&igrave;nh tr?ng nguy hi?m t?ng th?.</p>\n\n<p style=\"text-align:justify\">Chung c? 3 t?ng tr&ecirc;n ???ng Hai B&agrave; Tr?ng c?ng c&oacute; k?t qu? ?&aacute;nh gi&aacute; t??ng t?, c&oacute; th? s?p b?t c? l&uacute;c n&agrave;o.</p>\n\n<p style=\"text-align:justify\">V? v?n ?? x? l&yacute; c&aacute;c chung c? c? n&aacute;t, h?i ??u th&aacute;ng 3 UBND TP HCM ?y quy?n cho c&aacute;c qu?n th?c hi?n nhi?m v? li&ecirc;n quan ??n th? t?c ??u t? c?i t?o, s?a ch?a, x&acirc;y d?ng chung c? m?i thay th?.</p>\n\n<p style=\"text-align:justify\">TP HCM hi?n c&oacute; 474 chung c? c? x&acirc;y d?ng tr??c n?m 1975 v?i g?n 27.000 h? sinh s?ng. Th&agrave;nh ph? ?ang c&oacute; ch? tr??ng k&ecirc;u g?i t? nh&acirc;n tham gia th&aacute;o d? ch&uacute;ng, do tr??c ?&oacute; ti?n ?? gi?i t?a ch?m - h?n 10 n?m nay ch? c&oacute; 32 chung c? ???c c?i t?o.</p>\n\n<p style=\"text-align:justify\">Theo Duy Tr?n/VnExpress.net</p>\n</div>\n","2-chung-cu-o-trung-tam-sai-gon-phai-thao-do-khan-cap","/web/uploads/images/095621baoxaydung_8.jpg","","","","","1","","2016-11-20 21:49:22","","2016-11-20 21:49:29","0","1","","1");
INSERT INTO tn_news VALUES("2","7","","","<p><span style=\"color:rgb(0, 0, 0); font-family:arial,helvetica,sans-serif; font-size:12px\">Th&agrave;nh ph? San Francisco (M?) l&agrave; n?i c&oacute; gi&aacute; nh&agrave; cho thu&ecirc; kh&aacute; cao n&ecirc;n ng??i d&acirc;n ph?i b? ra nhi?u ti?n ch? ?? ? trong c?n h? nh? l&agrave; chuy?n b&igrave;nh th??ng. Tuy nhi&ecirc;n, su?t tu?n qua, c?n nh&agrave; h?n 18 m2 ???c rao 2.000 USD m?t th&aacute;ng ?&atilde; g&acirc;y n&ecirc;n s? ch&uacute; &yacute; c?a c? b&aacute;o ch&iacute; v&agrave; c?ng ??ng m?ng. ?i?m khi?n m?i ng??i s?c nh?t l&agrave; c&aacute;ch b? tr&iacute; khu t?m ??ng, b?n c?u ngay trong khu n?u n??ng. ?i?u n&agrave;y ??ng ngh?a, n?u nh&agrave; c&oacute; hai ng??i, b?n s? kh&ocirc;ng th? ?i WC ho?c t?m khi c&oacute; ng??i ?ang n?u n??ng</span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://www.baoxaydung.com.vn/stores/news_dataimages/vananh/042017/14/14/142337baoxaydung_30.jpg\" style=\"height:375px; margin:0px; padding:0px; width:500px\" /></p>\n\n<p>C?n h? nh? n&ecirc;n ph&ograve;ng ng? ki&ecirc;m ph&ograve;ng kh&aacute;ch v?i b? sofa v&agrave;o ban ng&agrave;y v&agrave; gi??ng g?p s? ???c m? ra v&agrave;o bu?i t?i.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://www.baoxaydung.com.vn/stores/news_dataimages/vananh/042017/14/14/142337baoxaydung_31.jpg\" style=\"height:375px; margin:0px; padding:0px; width:500px\" /></p>\n\n<p style=\"text-align:justify\">Nh&agrave; c&oacute; t&ocirc;ng m&agrave;u ?en-tr?ng-g? kh&aacute; nh&atilde; nh?n, c&aacute;c trang thi?t b? hi?n ??i, t? ?? nhi?u ch? ch?a.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://www.baoxaydung.com.vn/stores/news_dataimages/vananh/042017/14/14/142337baoxaydung_32.jpg\" style=\"height:375px; margin:0px; padding:0px; width:500px\" /></p>\n\n<p style=\"text-align:justify\">Gia ch? kh&ocirc;ng cung c?p nhi?u h&igrave;nh ?nh, th&ocirc;ng tin v? nh&agrave; nh?ng c?n h? tr&ocirc;ng v?n c&ograve;n ??p nh? v?a m?i ???c x&acirc;y. Hi?n t?i, nh&agrave; v?n ch?a c&oacute; ng??i thu&ecirc;.</p>\n\n<p style=\"text-align:justify\">Theo Lam Huy?n (?nh: House Beautiful)/VnExpress.net</p>\n\n<p>&nbsp;</p>\n","ngoi-nha-thiet-ke-vo-duyen-gay-xon-xao-vi-gia-thue-qua-dat","/web/uploads/images/142337baoxaydung_29.jpg","","","","","0","","2016-11-21 21:49:35","","2016-11-21 21:49:38","0","1","","1");
INSERT INTO tn_news VALUES("4","7","","","<p style=\"text-align:justify\">Theo Daily Mail, c&ocirc;ng ty ki?n tr&uacute;c Clouds Architecture Office ? New York t? tin v&agrave;o k? ho?ch x&acirc;y t&ograve;a nh&agrave; ch?c tr?i ??c ?&aacute;o b?c nh?t t? tr??c ??n nay.</p>\n\n<p style=\"text-align:justify\">C? th?, Analemma Tower s? ???c x&acirc;y d?ng t? tr&ecirc;n tr?i xu?ng ??t, thay v&igrave; x&acirc;y d?ng tr&ecirc;n m?t ??t nh? th&ocirc;ng th??ng.</p>\n\n<p style=\"text-align:justify\">&ldquo;Analemma Tower l&agrave; m?t v&iacute; d? ?i?n h&igrave;nh c?a vi?c s? d?ng chi?n l??c thi?t k? h&agrave;nh tinh, t?o n&ecirc;n t&ograve;a nh&agrave; cao nh?t th? gi?i t? tr??c ??n nay&rdquo;, ??i di?n c&ocirc;ng ty n&oacute;i.</p>\n\n<p style=\"text-align:justify\">Trong b?n thi?t k?, c&ocirc;ng ty s? d?ng m?t h? th?ng c&aacute;p treo c? l?n, m?t ??u m&oacute;c v&agrave;o ti?u h&agrave;nh tinh&nbsp;c&ograve;n ??u kia gi? cho t&ograve;a nh&agrave; ch?c tr?i kh&ocirc;ng r?i xu?ng ??t.</p>\n\n<p style=\"text-align:justify\">&ldquo;V&igrave; t&ograve;a nh&agrave; n&agrave;y treo l? l?ng trong kh&ocirc;ng kh&iacute; n&ecirc;n n&oacute; c&oacute; th? ???c x&acirc;y d?ng ? b?t c? ?&acirc;u tr&ecirc;n th? gi?i, sau ?&oacute; ???c ??a ??n ??a ?i?m l?p ??t&rdquo;, Clouds Architecture Office chia s? tr&ecirc;n trang web.</p>\n\n<p style=\"text-align:justify\">&ldquo;Theo k? ho?ch ban ??u, Analemma Tower c&oacute; th? ???c x&acirc;y d?ng ? Dubai, n?i c&oacute; c&aacute;c chuy&ecirc;n gia thi?t k? nh&agrave; ch?c tr?i v?i chi ph&iacute; ch? b?ng m?t ph?n n?m ? New York&rdquo;.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/1490674562-149067184351595-toa-nha-6.jpg\" style=\"height:402px; width:700px\" /></p>\n\n<p style=\"text-align:center\"><em>Ti?u h&agrave;nh tinh c&oacute; qu? ??o c? ??nh h&igrave;nh s? 8.</em></p>\n\n<p style=\"text-align:justify\">M?c d&ugrave; k? ho?ch t&aacute;o b?o n&agrave;y v??ng ph?i nh?ng th&aacute;ch th?c nh? vi?c t&igrave;m ki?m m?t thi&ecirc;n th?ch ph&ugrave; h?p ?? neo gi? t&ograve;a nh&agrave;, Clouds Architecture Office tin r?ng, &yacute; t??ng n&agrave;y s? s?m tr? th&agrave;nh hi?n th?c.</p>\n\n<p style=\"text-align:justify\">&ldquo;N?m 2015, C? quan H&agrave;ng kh&ocirc;ng v? tr? ch&acirc;u &Acirc;u ?&atilde; kh?i ??ng chi?n d?ch thu h&uacute;t ??u t?, khai th&aacute;c ti?u h&agrave;nh tinh. NASA ??t m?c ti&ecirc;u b?t gi? m?t ti?u h&agrave;nh tinh v&agrave;o n?m 2021 ?? ch?ng minh t&iacute;nh kh? thi&rdquo;, trang web c?a c&ocirc;ng ty ki?n tr&uacute;c M? n&oacute;i.</p>\n\n<p style=\"text-align:justify\">N?u ???c x&acirc;y d?ng, t&ograve;a nh&agrave; ch?c tr?i s? di chuy?n theo h&igrave;nh s? 8, d?a tr&ecirc;n qu? ??o ti?u h&agrave;nh tinh trong v&ograve;ng 24 gi?, ??a c? d&acirc;n qua c&aacute;c th&agrave;nh ph? l?n ? B?c v&agrave; Nam b&aacute;n c?u nh? New York, Havana, Atlanta v&agrave; Panama.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/1490674562-149067162138430-toa-nha-5.jpg\" style=\"height:1200px; width:339px\" /></p>\n\n<p style=\"text-align:center\"><em>Ph&aacute;c h?a k? ho?ch t&aacute;o b?o c?a&nbsp;Cloud Architecture Office.</em></p>\n\n<p style=\"text-align:justify\">? ??nh t&ograve;a nh&agrave; Analemma Tower, qu&atilde;ng th?i gian ban ng&agrave;y t?ng th&ecirc;m 40 ph&uacute;t do t&aacute;c ??ng t? ?? cong c?a Tr&aacute;i ??t.</p>\n\n<p style=\"text-align:justify\">Trong b?n thi?t k?, Cloud Architecture Office kh&ocirc;ng ch? mu?n x&acirc;y d?ng t&ograve;a nh&agrave; ch?c tr?i kh?ng l?, m&agrave; c&ograve;n c? m?t th&agrave;nh ph? tr&ocirc;i n?i tr&ecirc;n b?u tr?i.</p>\n\n<p style=\"text-align:justify\">M?t khu v?c r?ng l?n b&ecirc;n trong t&ograve;a nh&agrave; s? ???c thi?t k? l&agrave;m ch? ngh? cho c? d&acirc;n, khi?n h? c?m th?y nh? ? nh&agrave;. V?n ph&ograve;ng l&agrave;m vi?c ???c ??t ? ph?n d??i trong khi n?i ngh? ng?i n?m ? n?a tr&ecirc;n.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/1490674562-14906713437144-toa-nha-2.jpg\" style=\"height:500px; width:500px\" /></p>\n\n<p style=\"text-align:center\"><em>C? d&acirc;n s?ng t?i t&ograve;a nh&agrave; s? kh&ocirc;ng ???c ph&eacute;p ra ngo&agrave;i h&oacute;ng gi&oacute; v&igrave; l&yacute; do an to&agrave;n.</em></p>\n\n<p style=\"text-align:justify\">C? d&acirc;n s?ng t?i ?&acirc;y c?ng ???c t?n h??ng khu v??n nh&acirc;n t?o, n?i ph?c v? t&iacute;n ng??ng v&agrave; khu v?c ?n u?ng, gi?i tr&iacute;.</p>\n\n<p style=\"text-align:justify\">Cloud Architecture Office c&oacute; k? ho?ch t?n d?ng t?i ?a v? tr&iacute; ??c bi?t c?a t&ograve;a nh&agrave;, v?i nh?ng t?m pin M?t tr?i ??t ? t?ng cao nh?t ?? t?o n&ecirc;n ngu?n n?ng l??ng t? &aacute;nh s&aacute;ng M?t tr?i.</p>\n\n<p style=\"text-align:justify\">Ngu?n n??c s?ch ???c l?c t? ?&aacute;m m&acirc;y v&agrave; n??c m?a, ??m b?o ?? tinh khi?t cao nh?t. C&aacute;c ki?n tr&uacute;c s? c?ng t&iacute;nh ??n vi?c thi?t k? c?a k&iacute;nh c&oacute; ?? d&agrave;y kh&aacute;c nhau, ph&ugrave; h?p v?i s?c &eacute;p v&agrave; nhi?t ?? ? ?? cao nh?t ??nh.</p>\n\n<p style=\"text-align:justify\">Tuy v?y, c? d&acirc;n nhi?u kh? n?ng s? kh&ocirc;ng ???c ph&eacute;p ra ngo&agrave;i h&oacute;ng m&aacute;t v&igrave; ?i?u ki?n kh?c nghi?t ? tr&ecirc;n cao. &ldquo;? ?? cao 32.000 m&eacute;t, kh&ocirc;ng kh&iacute; r?t lo&atilde;ng, nhi?t ?? &acirc;m 40 ?? C s? khi?n c? d&acirc;n kh&ocirc;ng th? ra ngo&agrave;i m&agrave; kh&ocirc;ng c&oacute; ?? b?o h?&rdquo;,&nbsp; Clouds Architecture Office cho bi?t.</p>\n\n<p style=\"text-align: right;\"><strong>Theo ??ng Nguy?n - Daily Mail (D&acirc;n Vi?t)</strong></p>\n","toa-nha-choc-troi-dua-cu-dan-di-khap-the-gioi-trong-24h","/web/uploads/images/1490674562-149067129763960-toa-nha-1.jpg","","","","http://vnexpress.net","1","","","","","0","1","","1");
INSERT INTO tn_news VALUES("6","10","","","<p>Nh?n b&agrave;n giao c?n h?/ nh&agrave; ph? l&agrave; c&ocirc;ng vi?c r?t d? x?y ra sai s&oacute;t, nh?t l&agrave; nh?ng ng??i mua nh&agrave; l?n ??u. D??i ?&acirc;y l&agrave; quy tr&igrave;nh 10 b??c, do &ocirc;ng Nguy?n Duy Th&agrave;nh, T?ng gi&aacute;m ??c C&ocirc;ng ty Qu?n l&yacute; nh&agrave; To&agrave;n C?u (Global Home), t?ng h?p t? kinh nghi?m th?c t?.</p>\n\n<p>B??c 1: Nghi?m thu ?i?u h&ograve;a</p>\n\n<p>??u ti&ecirc;n, ?&oacute;ng t?t c? c?a ph&ograve;ng l?i v&agrave; b?t ?i?u h&ograve;a l&ecirc;n ?? nhi?t ?? kho?ng 22 ??. ??m s? l??ng ?i?u h&ograve;a, s? l??ng c?c n&oacute;ng.</p>\n\n<p>- T?t c? c&aacute;c ph&ograve;ng ??u m&aacute;t, v&agrave; ph?i ng?t l?c sau t?i ?a 2 ti?ng, aptomat kh&ocirc;ng nh?y.</p>\n\n<p>- Kh&ocirc;ng ch?y n??c xu?ng s&agrave;n t?i mi?ng th?i v&agrave; mi?ng h?i.</p>\n\n<p>- L?ng nghe khi c?c n&oacute;ng ch?y c&oacute; ph&aacute;t ra ti?ng ?n qu&aacute; to kh&ocirc;ng. N?u ?n th&igrave; ph?i ki?m tra nh?ng b??c sau:</p>\n\n<p>+ Ki?m tra c&aacute;c t?m v?n chuy?n ?&atilde; th&aacute;o ch?a.</p>\n\n<p>+ Ki?m tra ???ng ?ng c&oacute; b? ch?m v&agrave;o v? m&aacute;y kh&ocirc;ng.</p>\n\n<p>+ Ki?m tra xem c?c n&oacute;ng c&oacute; b? nghi&ecirc;ng, xi&ecirc;u v?o hay kh&ocirc;ng. C&aacute;c bulong ?c v&iacute;t c&oacute; l?p ?? v&agrave; ch?t kh&ocirc;ng.</p>\n\n<p>?? ??m b?o qu&aacute; tr&igrave;nh thi c&ocirc;ng ?&uacute;ng k? thu?t v&agrave; ch?ng lo?i v?t t?, ch? nh&agrave; n&ecirc;n thu&ecirc; C&ocirc;ng ty t? v?n gi&aacute;m s&aacute;t nh&agrave; ph? chuy&ecirc;n nghi?p ?? gi&aacute;m s&aacute;t qu&aacute; tr&igrave;nh thi c&ocirc;ng n&agrave;y</p>\n\n<p>b&agrave;n giao c?n h?, quy tr&igrave;nh b&agrave;n giao c?n h?, nh?n b&agrave;n giao c?n h?<br />\nNh?n b&agrave;n giao c?n h? l&agrave; c&ocirc;ng vi?c r?t d? x?y ra sai s&oacute;t, do ?&oacute; kh&aacute;ch h&agrave;ng ph?i ki?m tra k? l??ng t&igrave;nh tr?ng c?n h? tr??c khi nh?n b&agrave;n giao. (?nh minh h?a: Internet)<br />\nB??c 2: C&aacute;c thi?t b? ?i?n, vi?n th&ocirc;ng</p>\n\n<p>- Ki?m tra t? ?i?n: C&aacute;c aptomat ph?i ? t&igrave;nh tr?ng gi?t xu?ng l&agrave; t?t, k&eacute;o l&ecirc;n l&agrave; b?t.</p>\n\n<p>- Ki?m tra ? c?m ?? xem t&igrave;nh tr?ng c&oacute; ?i?n c?a c&aacute;c ?.</p>\n\n<p>- Ki?m tra qu?t gi&oacute; v? sinh, m&aacute;y h&uacute;t m&ugrave;i: Nhanh nh?t l&agrave; ch&acirc;m ?i?u thu?c l&aacute;, h&iacute;t m?t h?i, ph? kh&oacute;i v&agrave;o g?n qu?t r?i theo d&otilde;i xem t?c ?? h&uacute;t.</p>\n\n<p>- T?t m? c&ocirc;ng t?c ki?m tra b&oacute;ng ?&egrave;n, y&ecirc;u c?u s&aacute;ng ??u kh&ocirc;ng b? nh&aacute;y.</p>\n\n<p>- D&ugrave;ng b&uacute;t th? ki?m tra r&ograve; ?i?n. N&ecirc;n ki?m tra ng?u h?ng tr&ecirc;n t??ng, khu xung quanh c&ocirc;ng t?c v&agrave; ? ?i?n.</p>\n\n<p>Tuy nhi&ecirc;n, v?i h?ng m?c thi?t b? ?i?n, vi?n th&ocirc;ng ?&ograve;i h?i ng??i c&oacute; chuy&ecirc;n m&ocirc;n ki?m tra, nghi?m thu trong su?t qu&aacute; tr&igrave;nh thi c&ocirc;ng, n?u ch? nh&agrave; c&oacute; ?i?u ki?n n&ecirc;n thu&ecirc; C&ocirc;ng ty t? v?n gi&aacute;m s&aacute;t nh&agrave; ph? chuy&ecirc;n nghi?p ?? gi&aacute;m s&aacute;t qu&aacute; tr&igrave;nh thi c&ocirc;ng n&agrave;y, chi ph&iacute; thu&ecirc; gi&aacute;m s&aacute;t nh&agrave; ph? hi?n nay kh&aacute; r?, b?n c&oacute; th? tham kh?o T?I ?&Acirc;Y&nbsp;</p>\n\n<p>B??c 3: Ki?m tra t??ng, tr?n</p>\n\n<p>- Nh&igrave;n m&agrave;u s?n ph?i ??ng ??u, kh&ocirc;ng loang l?, l?u &yacute; c&aacute;c ch? quanh c&ocirc;ng t?c, mi?ng ?i?u h&ograve;a, qu?t gi&oacute; l&agrave; hay l?i nh?t.</p>\n\n<p>- Ki?m tra ?? ph?ng c?a t??ng: d&ugrave;ng th??c nh&ocirc;m &aacute;p l&ecirc;n t??ng v&agrave; nh&igrave;n qua khe h? gi?a th??c v&agrave; t??ng, t?t ?&egrave;n v&agrave; d&ugrave;ng ?&egrave;n pin soi ng??c l?i xem &aacute;nh s&aacute;ng l?t ng??c l?i. Ki?m tra ??c bi?t ? cao ?? kho?ng 1,5m ??n 1,8m (ch? gi&aacute;p lai gi?a hai t?m gi&aacute;o) l&agrave; hay b? l?i nh?t.</p>\n\n<p>B??c 4 : Ki?m tra s&agrave;n g?, s&agrave;n g?ch</p>\n\n<p>Y&ecirc;u c?u ghi r&otilde; ch?ng lo?i, xu?t x? c?a s?n ph?m l?p ??t, cung c?p c&aacute;c th&ocirc;ng s? k? thu?t, ??c t&iacute;nh c?a v?t li?u, gi?y b?o h&agrave;nh v&agrave; th?i h?n b?o h&agrave;nh.</p>\n\n<p>Ph?n s&agrave;n g?:</p>\n\n<p>- M&agrave;u s?c: ??u m&agrave;u, ki?m tra l?p ph? v&acirc;n b? m?t, n?u x??c, l?i b?t thay.</p>\n\n<p>- Ki?m tra ?? ph?ng c?a s&agrave;n b?ng th??c nh&ocirc;m, k?t h?p ?&egrave;n pin nh? ki?m tra t??ng, n?u kh&ocirc;ng ph?ng, y&ecirc;u c?u s?a l?i.</p>\n\n<p>- Ki?m tra c&aacute;c khe h? gi?a 2 t?m g?, n?u h? l?n, y&ecirc;u c?u s?a l?i.</p>\n\n<p>- Ki?m tra to&agrave;n b? m?t s&agrave;n xem c&oacute; ch? n&agrave;o ph?ng, r?p kh&ocirc;ng (ch&uacute; &yacute; c&aacute;c g&oacute;c nh&agrave;, c?nh t??ng v&agrave; c?a toilet), n?u c&oacute; l?i, y&ecirc;u c?u s?a.</p>\n\n<p>- ?i l?i tr&ecirc;n s&agrave;n ph?i kh&ocirc;ng c&oacute; ti?ng c?t k?t, c? ?i l?i v&agrave; nh&uacute;n tr&ecirc;n s&agrave;n th&igrave; s? ph&aacute;t hi?n ra.</p>\n\n<p>- Ki?m tra n?p ch&acirc;n t??ng: Ph?i ??ng m?u, ch? n?i ??u ??u n?p ch&acirc;n t??ng ph?i ph?ng, kh&ocirc;ng nh&igrave;n th?y n?t ?inh tr&ecirc;n m?t n?p, c&aacute;c ?o?n n?i kh&ocirc;ng ???c qu&aacute; ng?n, ph?i &gt; 1,5 - 2m cho m?i ?o?n, ch? ti?p gi&aacute;p gi?a n?p ch?n t??ng v&agrave; s&agrave;n g? kh&ocirc;ng ???c h? khe theo m?t b?ng v&agrave; m?t ??ng. N?u h? m?t b?ng t?c l&agrave; s&agrave;n g? b? h?t, h? m?t ??ng l&agrave; n?p ch&acirc;n t??ng b? l?m ho?c cong.</p>\n\n<p>N?u b?n th?y kh&oacute; kh?n trong v?n ?? n&agrave;y, th&igrave; c&oacute; th? khi nh?n b&agrave;n giao nh&agrave; h&atilde;y d?n theo ng??i c&oacute; chuy&ecirc;n m&ocirc;n v&agrave; kinh nghi?m ?? t? v?n cho b?n, ho?c c?ng c&oacute; th? thu&ecirc; C&ocirc;ng ty t? v?n gi&aacute;m s&aacute;t nh&agrave; ph? chuy&ecirc;n nghi?p uy t&iacute;n h? tr? b?n, t?i Tphcm c&oacute; C&ocirc;ng ty t? v?n gi&aacute;m s&aacute;t nh&agrave; ph? uy t&iacute;n NhaPhoGroup, xem &nbsp;T?I ?&Acirc;Y</p>\n\n<p>Ph?n g?ch ?p:</p>\n\n<p>C&aacute;c m?ch ?p ph?i th?ng, ??u v&agrave; s?c n&eacute;t. To&agrave;n b? b? m?t k?t c?u ph?i l&agrave;m s?ch v?a, b?t tr&aacute;t m?ch v&agrave; c&aacute;c v?t b?n ? tr&ecirc;n b? m?t ?p. C&ocirc;ng t&aacute;c ki?m tra ch?t l??ng ?p ti?n h&agrave;nh theo tr&igrave;nh t? thi c&ocirc;ng v&agrave; bao g?m c&aacute;c ch? ti&ecirc;u ch&iacute;nh nh? sau:</p>\n\n<p>- ?? ph?ng c?a m?t ?p, l&agrave;m t??ng t? nh? ki?m tra t??ng.</p>\n\n<p>- ?? ??c ch?c v&agrave; b&aacute;m d&iacute;nh c?a n?n ?p v?i v?t li?u ?p - g&otilde; v&agrave;o b? m?t g?ch ?p.</p>\n\n<p>- ?? ??ng ??u c?a c?a m?t ?p v? m&agrave;u s?c, hoa v?n, c&aacute;c m?ch ?p, chi ti?t trang tr&iacute;.</p>\n\n<p>- ??i v?i c&aacute;c ph&ograve;ng kh&aacute;c c?ng ki?m tra t??ng t?, v? ?? ph?ng, ??ng ??u m&agrave;u s?c, kh&ocirc;ng b? n?t, v?, c&aacute;c m?ch g?ch ph?i ???c ??y v&agrave; c&ugrave;ng m&agrave;u s&agrave;n g?ch.</p>\n\n<p>M?t ?p ph?i tho? m&atilde;n c&aacute;c y&ecirc;u c?u:</p>\n\n<p>- T?ng th? m?t ?p ph?i ??m b?o ?&uacute;ng h&igrave;nh d&aacute;ng, k&iacute;ch th??c h&igrave;nh h?c theo y&ecirc;u c?u c?a thi?t k?.</p>\n\n<p>- V?t li?u ?p ph?i ?&uacute;ng quy c&aacute;ch v? ch?ng lo?i, k&iacute;ch th??c v&agrave; m&agrave;u s?c, kh&ocirc;ng cong v&ecirc;nh, s?t m?, kh&ocirc;ng c&oacute; khuy?t t?t</p>\n\n<p>- M&agrave;u s?c c?a m?t ?p b?ng v?t li?u nh&acirc;n t?o ph?i ??ng nh?t.</p>\n\n<p>- C&aacute;c m?ch ?p ngang d?c ph?i s?c n&eacute;t, ??u th?ng v&agrave; ??y v?a.</p>\n\n<p>- V?a tr&aacute;t tr&ecirc;n k?t c?u ph?i ch?c ??c. Khi ki?m tra v? l&ecirc;n m?t ?p kh&ocirc;ng c&oacute; ti?ng b?p. Nh?ng vi&ecirc;n b? b?p v&agrave; long ch&acirc;n ph?i th&aacute;o ra ?p l?i.</p>\n\n<p>- Tr&ecirc;n m?t ?p kh&ocirc;ng ???c c&oacute; v?t n?t, v?t ? do v?a, s?n, v&ocirc;i ho?c do c&aacute;c lo?i ho&aacute; ch?t g&acirc;y ra.</p>\n\n<p>- Khi ki?m tra b?ng th??c d&agrave;i 2m ??t &aacute;p s&aacute;t v&agrave;o m?t ?p, khe h? gi?a th??c v&agrave; m?t ?p kh&ocirc;ng qu&aacute; 2mm.</p>\n\n<p>C?n s? h? tr?, c&aacute;c b?n vui l&ograve;ng li&ecirc;n h? &nbsp;C&ocirc;ng ty t? v?n gi&aacute;m s&aacute;t nh&agrave; ph? NhaPhoGroup</p>\n","quy-trinh-ban-giao-can-ho-khach-hang-nao-cung-nen-biet","","","","","","0","","","","","0","0","","1");
INSERT INTO tn_news VALUES("9","7","","","<p style=\"text-align:justify\">M?c d&ugrave; quy tr&igrave;nh b&aacute;n nh&agrave; ?&atilde; ???c s?a ??i, b? sung ba l?n theo h??ng r&uacute;t ng?n th?i gian th? l&yacute; h? s? v&agrave; gi?m c&aacute;c th? t?c h&agrave;nh ch&iacute;nh; c&ocirc;ng khai gi&aacute; b&aacute;n c?ng nh? c&aacute;c ?i?u ki?n nh&agrave; ? ???c b&aacute;n v&agrave; nh&agrave; ? thu?c di?n kh&ocirc;ng ???c b&aacute;n, c&ugrave;ng v?i nhi?u ch? ??, ch&iacute;nh s&aacute;ch mi?n gi?m ti?n nh&agrave;, ti?n s? d?ng ??t&hellip;, nh?ng th?c t? cho th?y, vi?c b&aacute;n nh&agrave; v&agrave; c?p gi?y ch?ng nh?n cho ng??i mua nh&agrave; ? thu?c s? h?u Nh&agrave; n??c tr&ecirc;n ??a b&agrave;n th&agrave;nh ph? v?n c&ograve;n ch?m, t?n t?i nhi?u v??ng m?c.</p>\n\n<p style=\"text-align:justify\"><strong>G?n 11.000 c?n nh&agrave; kh&ocirc;ng ?? ?i?u ki?n b&aacute;n</strong></p>\n\n<p style=\"text-align:justify\">Theo S? X&acirc;y d?ng H&agrave; N?i, hi?n C&ocirc;ng ty Tr&aacute;ch nhi?m h?u h?n m?t th&agrave;nh vi&ecirc;n Qu?n l&yacute; v&agrave; Ph&aacute;t tri?n nh&agrave; H&agrave; N?i ?ang qu?n l&yacute; g?n 14.000 c?n h?; trong ?&oacute; g?n 3.000 c?n nh&agrave; thu?c di?n ???c b&aacute;n ?&atilde; c&oacute; ??n v&agrave; h? s? mua nh&agrave;, c&ograve;n l?i g?n 11.000 c?n thu?c di?n kh&ocirc;ng ?? ?i?u ki?n ?? b&aacute;n.</p>\n\n<p style=\"text-align:justify\">Theo k?t lu?n m?i ?&acirc;y c?a ?o&agrave;n Gi&aacute;m s&aacute;t H?i ??ng Nh&acirc;n d&acirc;n th&agrave;nh ph? H&agrave; N?i, nhi?u tr??ng h?p h? gia ?&igrave;nh thu?c di?n ?? ?i?u ki?n ???c mua nh&agrave; v&agrave; ?&atilde; ???c ??n v? qu?n l&yacute; nh&agrave; ti?p nh?n h? s? t? n?m 2015 nh?ng ch?a ???c xem x&eacute;t, gi?i quy?t b&aacute;n. Nhi?u tr??ng h?p c&oacute; v??ng m?c ch?a ???c C&ocirc;ng ty Tr&aacute;ch nhi?m h?u h?n m?t th&agrave;nh vi&ecirc;n Qu?n l&yacute; v&agrave; Ph&aacute;t tri?n nh&agrave; H&agrave; N?i v&agrave; c&aacute;c c? quan ch?c n?ng ki?m tra, th&aacute;o g? k?p th?i, g&acirc;y b?c x&uacute;c trong d? lu?n nh&acirc;n d&acirc;n.</p>\n\n<p style=\"text-align:justify\">??c bi?t, h?n b?y th&aacute;ng qua, t? khi c&oacute; Ch? th? 09-CT/TU c?a Th&agrave;nh ?y v&agrave; Ch? th? 11/CT-?y ban Nh&acirc;n d&acirc;n ng&agrave;y 17/5/2016 c?a ?y ban Nh&acirc;n d&acirc;n th&agrave;nh ph? v? ??y nhanh ti?n ?? b&aacute;n nh&agrave; thu?c s? h?u Nh&agrave; n??c v&agrave; c?p gi?y ch?ng nh?n, c&aacute;c ??n v? ch?c n?ng m?i gi?i quy?t b&aacute;n ???c 148 c?n. Kh&ocirc;ng nh?ng v?y, vi?c qu?n l&yacute;, th?ng k&ecirc;, theo d&otilde;i qu? nh&agrave; ? n&agrave;y c&ograve;n h?n ch?; kh&ocirc;ng c&oacute; s? li?u ch&iacute;nh th?c v? s? l??ng nh&agrave; ? c? do c&aacute;c c? quan t? qu?n c?a trung ??ng v&agrave; H&agrave; N?i ch?a b&agrave;n giao v? S? X&acirc;y d?ng qu?n l&yacute;.</p>\n\n<p style=\"text-align:justify\"><strong>Thi?u tr&aacute;ch nhi?m trong x? l&yacute;, gi?i quy?t</strong></p>\n\n<p style=\"text-align:justify\">&Ocirc;ng Nguy?n Ng?c Tu?n, Ph&oacute; Ch? t?ch th??ng tr?c, H?i ??ng Nh&acirc;n d&acirc;n th&agrave;nh ph? H&agrave; N?i - Ph&oacute; tr??ng ?o&agrave;n gi&aacute;m s&aacute;t, cho bi?t nhi?u nguy&ecirc;n nh&acirc;n d?n ??n nh?ng t?n t?i, b?t c?p trong c&ocirc;ng t&aacute;c b&aacute;n nh&agrave; thu?c s? h?u Nh&agrave; n??c. Tuy nhi&ecirc;n, tr&aacute;ch nhi?m tr??c h?t thu?c v? C&ocirc;ng ty Tr&aacute;ch nhi?m h?u h?n m?t th&agrave;nh vi&ecirc;n Qu?n l&yacute; v&agrave; Ph&aacute;t tri?n nh&agrave; H&agrave; N?i. C&ocirc;ng ty n&agrave;y ?&atilde; kh&ocirc;ng th?c hi?n t?t ch?c n?ng, nhi?m v? ???c giao ??i v?i c&aacute;c tr??ng h?p thu?c di?n ?? ?i?u ki?n ???c b&aacute;n; thi?u quy?t li?t trong gi?i quy?t c&aacute;c tr??ng h?p c&ograve;n v??ng m?c. B&ecirc;n c?nh ?&oacute;, c&ocirc;ng t&aacute;c ph?i h?p gi?a S? X&acirc;y d?ng v?i ch&iacute;nh quy?n c&aacute;c ??a ph??ng v&agrave; S? T&agrave;i nguy&ecirc;n v&agrave; M&ocirc;i tr??ng trong qu?n l&yacute;, k&ecirc; khai, x&eacute;t c?p gi?y ch?ng nh?n cho c&aacute;c c?n h? thu?c di?n nh&agrave; t? qu?n c?ng ch?a hi?u qu?.</p>\n\n<p style=\"text-align:justify\">Do ?&oacute;, ?o&agrave;n Gi&aacute;m s&aacute;t ?&atilde; ki?n ngh? ?y ban Nh&acirc;n d&acirc;n th&agrave;nh ph? ch? ??o r&agrave; so&aacute;t l?i ch?c n?ng, nhi?m v?, hi?u qu? ho?t ??ng, m&ocirc; h&igrave;nh t? ch?c c?a C&ocirc;ng Tr&aacute;ch nhi?m h?u h?n m?t th&agrave;nh vi&ecirc;n Qu?n l&yacute; v&agrave; Ph&aacute;t tri?n nh&agrave; H&agrave; N?i; xem x&eacute;t tr&aacute;ch nhi?m c&aacute; nh&acirc;n, t?p th? ?? h? s? t?n ??ng k&eacute;o d&agrave;i ho?c ?? x?y ra vi ph?m trong vi?c b&aacute;n nh&agrave;.</p>\n\n<p style=\"text-align:justify\">?y ban Nh&acirc;n d&acirc;n th&agrave;nh ph? c?ng ch? ??o c&aacute;c ??n v? ch?c n?ng ??y nhanh vi?c b&aacute;n nh&agrave;, c?p gi?y ch?ng nh?n ??i v?i c&aacute;c tr??ng h?p ?? ?i?u ki?n ???c b&aacute;n, ph?n ??u c? b?n ho&agrave;n th&agrave;nh trong n?m nay. C&ugrave;ng v?i ?&oacute;, th?c hi?n t?ng ki?m tra, th?ng k&ecirc; ??y ?? qu? nh&agrave; thu?c s? h?u Nh&agrave; n??c, qu? nh&agrave; ? t?p th? t? qu?n thu?c c&aacute;c c? quan trung ??ng-qu?c ph&ograve;ng b&agrave;n giao v? ??a ph??ng; ph&acirc;n c?p cho c&aacute;c qu?n, huy?n qu?n l&yacute; nh?m n&acirc;ng cao hi?u qu?, g?n tr&aacute;ch nhi?m c?a ch&iacute;nh quy?n c? s?.</p>\n\n<p style=\"text-align:justify\">Th&agrave;nh ph? c?n r&agrave; so&aacute;t, ki?m tra c&aacute;c d? &aacute;n ??u t? ?&atilde; c&oacute; quy?t ??nh thu h?i ??t, nh?ng qua nhi?u n?m ch?a gi?i ph&oacute;ng m?t b?ng, c&aacute;c di?n t&iacute;ch ??t v??ng v? quy ho?ch ?? c&oacute; gi?i ph&aacute;p th&aacute;o g? ??m b?o quy ??nh ph&aacute;p lu?t l&agrave;m c?n c? ?? c?p gi?y ch?ng nh?n. Tr??c m?t, ??y nhanh vi?c r&agrave; so&aacute;t t?i d? &aacute;n Nam ??i C? Vi?t, qu?n Hai B&agrave; Tr?ng.</p>\n\n<p style=\"text-align:justify\">Theo &ocirc;ng Nguy?n Ch&iacute; D?ng, Ph&oacute; Gi&aacute;m ??c, S? X&acirc;y d?ng H&agrave; N?i, vi?c gi?i quy?t c&aacute;c th? t?c b&aacute;n nh&agrave; c?a C&ocirc;ng ty Tr&aacute;ch nhi?m h?u h?n m?t th&agrave;nh vi&ecirc;n Qu?n l&yacute; v&agrave; Ph&aacute;t tri?n nh&agrave; H&agrave; N?i c&ograve;n ch?m, kh&ocirc;ng ??m b?o th?i gian theo quy tr&igrave;nh b&aacute;n nh&agrave; l&agrave; 45 ng&agrave;y l&agrave;m vi?c; ch?a ch? ??ng b&aacute;o c&aacute;o c&aacute;c kh&oacute; kh?n, v??ng m?c v&agrave; ?? xu?t h??ng gi?i quy?t, th&aacute;o g?.</p>\n\n<p style=\"text-align:justify\">Tuy nhi&ecirc;n, b&ecirc;n c?nh nh?ng nguy&ecirc;n nh&acirc;n ch? quan, &ocirc;ng D?ng cho bi?t th&ecirc;m, vi?c thay ??i c? ch? gi&aacute; b&aacute;n, tr&igrave;nh t? th? t?c, h? s?, th?m quy?n gi?i quy?t; nhi?u h? s? ph?c t?p nh? c&oacute; tranh ch?p, v??ng quy ho?ch, ?&atilde; c&oacute; quy?t ??nh thu h?i, nh&agrave; c? v&agrave; nh&agrave; bi?t th? kh&ocirc;ng ???c b&aacute;n&hellip; c?ng g&acirc;y ?nh h??ng ??n ti?n ?? b&aacute;n nh&agrave; c?a th&agrave;nh ph?.</p>\n\n<p style=\"text-align:justify\">??i v?i qu? nh&agrave; c&oacute; ngu?n g?c thu?c s? h?u Nh&agrave; n??c do c&aacute;c c? quan t? qu?n trung ??ng v&agrave; th&agrave;nh ph? qu?n l&yacute; tr??c ?&acirc;y, do bu&ocirc;ng l?ng n&ecirc;n h? s? g?c b? th?t l?c t? nhi?u n?m hay nhi?u c? quan ?&atilde; gi?i th?, s&aacute;p nh?p. Nhi?u c? quan kh&ocirc;ng h?p t&aacute;c ?? ho&agrave;n t?t th? t?c b&agrave;n giao, b&aacute;n nh&agrave; cho c&aacute;c h? gia ?&igrave;nh v&agrave; m?t s? khu v?c v??ng quy ho?ch, l?n chi?m ??t c&ocirc;ng, s? d?ng ??t sai m?c ?&iacute;ch c?n ph?i x? l&yacute; ho?c s?p x?p theo Quy?t ??nh s? 09/Q?-TTg.</p>\n\n<p style=\"text-align:justify\"><strong>Quy?t li?t th&aacute;o g? v??ng m?c</strong></p>\n\n<p style=\"text-align:justify\">Trong t?ng s? g?n 3.000 c?n nh&agrave; ?&atilde; c&oacute; h? s? mua nh&agrave; v&agrave; nh&agrave; ? ?&oacute; thu?c di?n ?? b&aacute;n, S? X&acirc;y d?ng y&ecirc;u c?u, trong n?m nay, C&ocirc;ng ty Tr&aacute;ch nhi?m h?u h?n m?t th&agrave;nh vi&ecirc;n Qu?n l&yacute; v&agrave; Ph&aacute;t tri?n nh&agrave; H&agrave; N?i ph?i gi?i quy?t xong 2.199 c?n ?&atilde; c&oacute; gi&aacute; b&aacute;n. C&oacute; 231 c?n c?n ???c x&aacute;c ??nh gi&aacute; b&aacute;n, S? s? tr&igrave;nh ?y ban Nh&acirc;n d&acirc;n th&agrave;nh ph? ph&ecirc; duy?t ph??ng &aacute;n t&iacute;nh gi&aacute; b&aacute;n trong qu&yacute; ba n?m nay. 483 c?n c&ograve;n l?i ch?a ki?m ??nh gi&aacute; b&aacute;n, c&ocirc;ng ty s? ph?i m?i t? chuy&ecirc;n vi&ecirc;n li&ecirc;n ng&agrave;nh ?i ki?m tra th?c ??a, x&aacute;c ??nh gi&aacute; b&aacute;n ?? ho&agrave;n th&agrave;nh vi?c t&iacute;nh gi&aacute; b&aacute;n trong qu&yacute; b?n.</p>\n\n<p style=\"text-align:justify\">Theo &ocirc;ng D?ng, v?i g?n 11.000 c?n nh&agrave; kh&ocirc;ng ?? ?i?u ki?n b&aacute;n do c&ograve;n nhi?u v??ng m?c, S? X&acirc;y d?ng s? ph&acirc;n lo?i c? th?, x&aacute;c ??nh r&otilde; tr&aacute;ch nhi?m c?a t?ng ??n v? li&ecirc;n quan v&agrave; ??a ra c&aacute;c gi?i ph&aacute;p ph?i th?c hi?n trong n?m nay. Theo ?&oacute;, C&ocirc;ng ty Tr&aacute;ch nhi?m h?u h?n m?t th&agrave;nh vi&ecirc;n Qu?n l&yacute; v&agrave; Ph&aacute;t tri?n nh&agrave; H&agrave; N?i s? th?c hi?n lo?i kh?i danh s&aacute;ch b&aacute;n nh&agrave; 1.698 c?n v??ng quy ho?ch, gi?i ph&oacute;ng m?t b?ng; th&iacute; ?i?m b&aacute;n 20 bi?n s? nh&agrave; trong khu ph? c? thu?c danh m?c nh&oacute;m ba ?? r&agrave; so&aacute;t, ?? xu?t th&agrave;nh ph? xem x&eacute;t, quy?t ??nh v?i 670 c?n c&ograve;n l?i; 1.592 c?n li&ecirc;n quan t?i v??ng m?c kh&ocirc;ng k&yacute; ???c h?p ??ng thu&ecirc; nh&agrave; v&agrave; 2.474 c?n thi?u v? th? t?c, h? s?...</p>\n\n<p style=\"text-align:justify\">S? X&acirc;y d?ng y&ecirc;u c?u C&ocirc;ng ty Tr&aacute;ch nhi?m h?u h?n m?t th&agrave;nh vi&ecirc;n Qu?n l&yacute; v&agrave; Ph&aacute;t tri?n nh&agrave; H&agrave; N?i b&aacute;o c&aacute;o c? th? t?ng tr??ng h?p tranh ch?p, khi?u ki?n, ?&ograve;i s? h?u nh&agrave; ?? giao Thanh tra S? th?c hi?n theo Lu?t Khi?u n?i. C?ng trong th&aacute;ng T? n&agrave;y, C&ocirc;ng ty ph?i b&agrave;n giao h? s? 3.576 c?n nh&agrave; c?p b?n cho ?y ban nh&acirc;n d&acirc;n c&aacute;c qu?n, huy?n, th? x&atilde; c?p gi?y ch?ng nh?n theo quy ??nh c?a ph&aacute;p lu?t v? ??t ?ai.</p>\n\n<p style=\"text-align:justify\">Theo ?? xu?t c?a S? X&acirc;y d?ng H&agrave; N?i, sau ng&agrave;y 30/12, n?u c&aacute;c c? quan t? qu?n c?a trung ??ng v&agrave; H&agrave; N?i kh&ocirc;ng th?c hi?n b&agrave;n giao nh&agrave; ??t, S? s? kh&ocirc;ng ti?p nh?n nh&agrave; do c&aacute;c c? quan n&agrave;y chuy?n giao. Tuy nhi&ecirc;n, ?? ??y nhanh ti?n ?? b&aacute;n nh&agrave;, S? ?? ngh? B? X&acirc;y d?ng th&aacute;o g? m?t s? v??ng m?c v? th?i ?i?m v&agrave; th?m quy?n x&aacute;c nh?n vi?c b? tr&iacute;, ph&acirc;n ph?i nh&agrave; ? cho c&aacute;n b? c&ocirc;ng nh&acirc;n vi&ecirc;n c?a c&aacute;c c? quan di?n t? qu?n tr??c ?&acirc;y (tr??c ng&agrave;y 27/11/1992) l&agrave;m c?n c? ?? t&iacute;nh ti?n b&aacute;n nh&agrave;; h??ng d?n v? h? s? nh&agrave; ? chung c? c&oacute; t?ng h?m, t?ng l?ng, thang m&aacute;y v&agrave; h? s? K ph&acirc;n l?p khi t&iacute;nh ti?n s? d?ng ??t, vi?c &aacute;p d?ng ch? ?? mi?n gi?m ti?n s? d?ng ??t.</p>\n\n<p style=\"text-align:justify\">Theo MINH NGH?A (TTXVN/VIETNAM+)</p>\n","go-vuong-cho-gan-11000-can-nha-khong-du-dieu-kien-ban","/web/uploads/images/150751baoxaydung_9.jpg","","","","http://www.baoxaydung.com.vn/","0","","","","","0","1","","1");
INSERT INTO tn_news VALUES("10","7","","","<p style=\"text-align:justify\">Lo?i h&igrave;nh b?t ??ng s?n nh&oacute;m nh&agrave; ??u t? c?a &ocirc;ng H?ng ?a chu?ng g?m c&oacute;: ??t n&ocirc;ng nghi?p, ??t ven s&ocirc;ng, ??t m?t ti?n bi?n v&agrave; nh&agrave; ph?, bi?t th? v??n. Nh&oacute;m t?p trung mua c&aacute;c l&ocirc; ??t c&oacute; h? t?ng ?ang tri?n khai ho?c c?u ???ng s?p ???c x&acirc;y d?ng trong 12-24 th&aacute;ng t?i.</p>\n\n<p style=\"text-align:justify\">&Ocirc;ng H?ng cho bi?t, ch? trong 3 th&aacute;ng ??u n?m, ??i s?n nh&agrave; ??t c?a &ocirc;ng ?&atilde; giao d?ch 5 th??ng v? v?i t? su?t l?i nhu?n trung b&igrave;nh kho?ng 15% m?i l?n mua b&aacute;n, c&aacute; bi?t c&oacute; 2 giao d?ch ??t t? su?t sinh l?i 25-30%.</p>\n\n<p style=\"text-align:justify\">C&oacute; s? v?n c&ograve;n nhi?u h?n c? ??i bu&ocirc;n c?a &ocirc;ng H?ng, &ocirc;ng B?o ng? qu?n B&igrave;nh T&acirc;n, TP HCM huy ??ng c&aacute;c nh&agrave; ??u t? c&aacute; nh&acirc;n th&acirc;n t&iacute;n l?p qu? h?n 100 t? ??ng chuy&ecirc;n s?n nh&agrave; ??t ph&iacute;a T&acirc;y S&agrave;i G&ograve;n, ??c bi?t l&agrave; ??a b&agrave;n qu?n 8, 12, T&acirc;n Ph&uacute; v&agrave; hai huy?n C? Chi, H&oacute;c M&ocirc;n.</p>\n\n<p style=\"text-align:justify\">M?i th&agrave;nh vi&ecirc;n c?a nh&oacute;m ?&oacute;ng g&oacute;p theo d?ng c? ph?n, t?i thi?u l&agrave; n?a t? ??ng m?t su?t, kh&ocirc;ng gi?i h?n v?n g&oacute;p, c&oacute; ng??i n?ng l?c t&agrave;i ch&iacute;nh t?t, ?? s?c h&ugrave;n h?p d?m ba t? ??ng. Nh&oacute;m nh&agrave; ??u t? c?a &ocirc;ng B?o chuy&ecirc;n ?&agrave;m ph&aacute;n mua l?i c&aacute;c qu? ??t t? nh?, l? ?&ocirc;i ba tr?m m2, ??n ??t l?n v&agrave;i ha, ??c bi?t ?a chu?ng 2 nh&oacute;m t&agrave;i s?n ?ang th? ch?p ng&acirc;n h&agrave;ng v&agrave; t?a l?c ? khu v?c c&oacute; bi?n ??ng l?n v? h? t?ng: cao t?c, c?u v??t, c?u b?c qua s&ocirc;ng, m? ???ng...</p>\n\n<p style=\"text-align:justify\">&Ocirc;ng B?o ti?t l?, nh&oacute;m m?i th&agrave;nh l?p ???c 8 th&aacute;ng nh?ng ?&atilde; th&acirc;u t&oacute;m ???c qu? ??t l?n l&ecirc;n ??n v&agrave;i ch?c ngh&igrave;n m2. ??i ch?t ???c trung b&igrave;nh 2-3 th??ng v? mua ?i b&aacute;n l?i m?i th&aacute;ng, l?i nhu?n b&igrave;nh qu&acirc;n tr&ecirc;n d??i 20%. Nh&oacute;m c&oacute; m?t ??i tr??ng gi&agrave;u kinh nghi?m c&oacute; quy?n quy?t ??nh cao nh?t. C&aacute;c th&agrave;nh vi&ecirc;n c&ograve;n l?i ho?t ??ng h? tr? l?n nhau ph?c v? m?c ti&ecirc;u chung t? vi?c s?n ngu?n h&agrave;ng, th?m ??nh gi&aacute;, kh?o s&aacute;t th?c t?, ki?m tra ph&aacute;p l&yacute; ??n th??ng l??ng, ch?t mua ch?t b&aacute;n.</p>\n\n<p style=\"text-align:justify\">Ghi nh?n c?a&nbsp;<em>VnExpress</em>, vi?c c&aacute;c nh&agrave; ??u t? c&aacute; nh&acirc;n t?i TP HCM l?p qu? t? h&agrave;ng ch?c t? ??ng ??n tr?m t? ?? th&acirc;u t&oacute;m nh&agrave; ??t ?ang r?c r?ch kh?i ??ng k? t? giai ?o?n 2015-2016 v&agrave; tr? n&ecirc;n r?m r? v&agrave;o n?m 2017.</p>\n\n<p style=\"text-align:justify\">C&aacute;c th&agrave;nh vi&ecirc;n trong nh&oacute;m nh&agrave; ??u t? n&agrave;y kh&aacute; ?a d?ng. C&oacute; ng??i ho?t ??ng ngo&agrave;i ng&agrave;nh ??a ?c nh?ng c?ng c&oacute; kh&aacute; nhi?u nh&acirc;n s? ch? ch?t t?i c&aacute;c c&ocirc;ng ty t? v?n ??u t?, ??c bi?t nh&acirc;n s? ng&agrave;nh ??a ?c chi?m t? l? tr&ecirc;n 50%. C&aacute;c nh&agrave; ??u t? n&agrave;y chia s?, d&ograve;ng ti?n t&iacute;ch l?y ???c thay v&igrave; g?i ng&acirc;n h&agrave;ng l&atilde;i su?t kh&ocirc;ng ?&aacute;ng k? n&ecirc;n h? ch?n ph??ng &aacute;n g?i ti?n v&agrave;o ??t, v?a gi? gi&aacute; t?t v?a c&oacute; c? h?i sinh l?i v&igrave; qu? ??t ?&ocirc; th? ?ang ng&agrave;y c&agrave;ng khan hi?m v&agrave; h? t?ng t?i TP HCM ???c ??u t? m?nh m?.</p>\n\n<p style=\"text-align:justify\">T?ng gi&aacute;m ??c C&ocirc;ng ty c? ph?n T? v?n ??u t? Ph&uacute; Vinh, Phan C&ocirc;ng Ch&aacute;nh ?&aacute;nh gi&aacute;, hi?n t??ng c&aacute;c nh&agrave; ??u t? c&aacute; nh&acirc;n l?p nh&oacute;m bu&ocirc;n ??t ven S&agrave;i G&ograve;n ?&atilde; b?t ??u xu?t hi?n ng&agrave;y c&agrave;ng nhi?u h?n trong kho?ng 2-3 n?m tr? l?i ?&acirc;y. T?i c&aacute;c x&atilde; v&ugrave;ng ven ? S&agrave;i G&ograve;n, nh?t l&agrave; c&aacute;c khu v?c ?ang c&oacute; th&ocirc;ng tin ???c l&ecirc;n qu?n nh? Nh&agrave; B&egrave;, B&igrave;nh Ch&aacute;nh, H&oacute;c M&ocirc;n ho?c t?i qu?n 9, C? Chi, C?n Gi? ?ang xu?t hi?n r?t nhi?u m&ocirc; h&igrave;nh ??u t? nh&agrave; ??t theo nh&oacute;m.</p>\n\n<p style=\"text-align:justify\">Nguy&ecirc;n nh&acirc;n s&acirc;u xa c?a l&agrave;n s&oacute;ng n&agrave;y, theo &ocirc;ng Ch&aacute;nh, xu?t ph&aacute;t t? nhi?u l&yacute; do ??c th&ugrave;. Th? nh?t, qu? ??t trung t&acirc;m ng&agrave;y c&agrave;ng h?n h?p. Gi&aacute; c? ?&atilde; r?t cao. R?t kh&oacute; ?? c&oacute; ??t bi?n v? gia t?ng gi&aacute; tr? n?u kh&ocirc;ng bi?t c&aacute;ch ??u t? v&agrave; c&oacute; chi?n l??c ?&uacute;ng. Trong t&igrave;nh hu?ng n&agrave;y, ??u t? theo ??i nh&oacute;m c&oacute; th? gi&uacute;p cho c&aacute;c ??i t&aacute;c c&ugrave;ng kh?o s&aacute;t, ?&aacute;nh gi&aacute; th?c t? v&agrave; ??nh gi&aacute; t&agrave;i s?n chu?n h?n, t? ?&oacute; ??a ra chi?n l??c ph&ugrave; h?p.</p>\n\n<p style=\"text-align:justify\">Nguy&ecirc;n nh&acirc;n th? hai, nhi?u ??i th? c?nh tranh s?ng s?, nh?t l&agrave; c&aacute;c nh&agrave; ??u t? chuy&ecirc;n nghi?p, c? trong v&agrave; ngo&agrave;i n??c khi?n cho th? tr??ng tr? n&ecirc;n ch?t ch?i v?i qu? ??t ng&agrave;y c&agrave;ng &iacute;t ?i. Gi?ng nh? m?t &quot;??i d??ng ??&quot;, n?i c&oacute; kh&aacute; &iacute;t nh?ng c? h?i th?t s? cho nh&agrave; ??u t? c&aacute; nh&acirc;n v?i s? v?n &iacute;t ?i v&agrave; ngu?n l?c h?n ch?. Trong b?i c?nh ?&oacute;, l?p nh&oacute;m bu&ocirc;n ??t v&ugrave;ng ven l&agrave; m?t l?a ch?n t?t h?n, ? g&oacute;c ?? ph&ugrave; h?p ngu?n l?c.</p>\n\n<p style=\"text-align:justify\">Nguy&ecirc;n nh&acirc;n th? ba, ??u t? theo nh&oacute;m d? ?&oacute;n ??u c? h?i h?n ?i m?t m&igrave;nh. Khi h? t?ng giao th&ocirc;ng t?i S&agrave;i G&ograve;n ???c c?i thi?n v?i t?c ?? c&agrave;ng nhanh, th&igrave; kho?ng c&aacute;ch t? trung t&acirc;m t?i c&aacute;c khu v?c v&ugrave;ng ven s? ???c r&uacute;t ng?n. C?ng v?i t?c ?? gia t?ng d&acirc;n s? ? m?c nhanh ch&oacute;ng v?i h?n 200.000 ng??i m?i n?m, kh&ocirc;ng bao l&acirc;u n?a qu? ??t c?ng s? c?n ki?t. ?&oacute; ch&iacute;nh l&agrave; l&uacute;c v&ugrave;ng ven tr? n&ecirc;n ??t gi&aacute;. C&aacute;c khu v?c tr??c ?&acirc;y 10 n?m ???c xem l&agrave; v&ugrave;ng ven c?a S&agrave;i G&ograve;n nh? Ph&uacute; M? H?ng, G&ograve; V?p, Trung S?n (B&igrave;nh Ch&aacute;nh), T&acirc;n Ph&uacute; nay nh? th? n&agrave;o m?i ng??i c?ng ?&atilde; th?y.</p>\n\n<p style=\"text-align:justify\">Ngo&agrave;i ra, su?t ??u t? m?i ng??i th?p nh?ng n?u g&oacute;p v?n c&ugrave;ng nhau ?? th&acirc;u t&oacute;m ??t v&ugrave;ng ven gi?ng nh? g&oacute;p gi&oacute; th&agrave;nh b&atilde;o. Ra ngo?i th&agrave;nh S&agrave;i G&ograve;n, d&ograve;ng v?n c&agrave;ng l?n s? c&agrave;ng c&oacute; nhi?u c? h?i. C&aacute;c l&yacute; do n&agrave;y l&agrave;m cho vi?c l?p nh&oacute;m ?? bu&ocirc;n ??t ? ngo?i &ocirc; S&agrave;i G&ograve;n tr? th&agrave;nh m?t xu h??ng ???c quan t&acirc;m v&agrave; xem x&eacute;t nghi&ecirc;m t&uacute;c v?i c&aacute;c nh&agrave; ??u t? b?t ??ng s?n c&aacute; nh&acirc;n.</p>\n\n<p style=\"text-align:justify\">Theo &ocirc;ng Ch&aacute;nh, m&ocirc; h&igrave;nh ??u t? theo nh&oacute;m c&oacute; c? ?u ?i?m v&agrave; nh??c ?i?m. ?u ?i?m l&agrave; m?i nh&agrave; ??u t? ch? c?n b? ra m?t d&ograve;ng ti?n v?a ph?i nh?ng c&oacute; th? tham gia nhi?u c? h?i l?n. ?i c&ugrave;ng nhau, c&aacute;c nh&oacute;m nh&agrave; ??u t? ??ng tr??c c? h?i ?&oacute;n ??u c&aacute;c xu th? m?i c?a th? tr??ng, c&oacute; th? s&agrave;ng l?c ???c nhi?u t&agrave;i s?n c&ograve;n ? d?ng ti?m n?ng.</p>\n\n<p style=\"text-align:justify\">Nh??c ?i?m c?a m&ocirc; h&igrave;nh n&agrave;y, theo &ocirc;ng Ch&aacute;nh, l&agrave; c&oacute; th? x?y ra t&igrave;nh tr?ng b?t ??ng trong tri?n khai ??u t? mua b&aacute;n t&agrave;i s?n. Ch?ng h?n nh?, m?t ng??i mu?n mua ho?c b&aacute;n m&agrave; ??i nh&oacute;m kh&ocirc;ng ??ng &yacute; s? d?n ??n m&acirc;u thu?n. Th&aacute;ch th?c c?a vi?c ??u t? b?t ??ng s?n v&ugrave;ng ven theo nh&oacute;m l&agrave; ??t ?ai ? xa, kh&oacute; th?m nom, vi?c ??nh gi&aacute;, kh?o s&aacute;t g?p kh&ocirc;ng &iacute;t kh&oacute; kh?n, tr? ng?i v&agrave; d&ograve;ng v?n n?m trong t&agrave;i s?n l&agrave; nh&agrave;, ??t c&oacute; th? b? t?n ??ng m?t th?i gian d&agrave;i n?u m?i vi?c kh&ocirc;ng ?&uacute;ng nh? k? ho?ch t&iacute;nh to&aacute;n.</p>\n\n<p style=\"text-align:justify\">&quot;?? th?c hi?n t?t m&ocirc; h&igrave;nh kinh doanh n&agrave;y, c&aacute;c ??i, nh&oacute;m ??u t? b?t ??ng s?n c?n c&oacute; m?t ng??i nhi?u kinh nghi?m ??ng ra c?m tr?ch, ???c m?i th&agrave;nh vi&ecirc;n giao ph&oacute; quy?n quy?t ??nh cao nh?t nh?m ??m b?o l?i nhu?n k? v?ng v&agrave; an to&agrave;n cho d&ograve;ng v?n kh&aacute; l?n c?a nh&oacute;m&quot;, &ocirc;ng Ch&aacute;nh cho hay.</p>\n\n<p style=\"text-align:justify\">Theo V? L&ecirc;/VnExpress.net</p>\n","nhom-dai-gia-sai-gon-lap-quy-tram-ty-san-dat-vung-ven","/web/uploads/images/175801baoxaydung_16.jpg","","","","","0","","","","","0","0","","1");
INSERT INTO tn_news VALUES("11","7","","","<p style=\"text-align:justify\">Theo ?&oacute;, t?ng di?n t&iacute;ch ??t quy ho?ch l&agrave; 197.230m2, bao g?m 4 ph&acirc;n khu ch?c n?ng t?i ph??ng Th? Quang, qu?n S?n Tr&agrave;. Khu ??t s? 1 c&oacute; di?n t&iacute;ch 20.777m2, d? ki?n s? d&agrave;nh ?? n&acirc;ng c?p x&acirc;y d?ng c&aacute;c c?u c?ng hi?n tr?ng th&agrave;nh c?u c?ng chuy&ecirc;n d&ugrave;ng v&agrave; c?u c?ng t?ng h?p. Ph&iacute;a B?c gi&aacute;p &Acirc;u thuy?n Th? Quang, ph&iacute;a Nam gi&aacute;p ???ng B&igrave;nh Than, ph&iacute;a T&acirc;y gi&aacute;p &Acirc;u thuy?n Th? Quang v&agrave; ph&iacute;a ?&ocirc;ng gi&aacute;p Ch? ??u m?i th?y s?n Th? Quang.</p>\n\n<p style=\"text-align:justify\">Khu ??t s? 2 c&oacute; di?n t&iacute;ch 2.549m2, d? ki?n ?? x&acirc;y d?ng c?i t?o l?i ch? c&aacute; c?. Ph&iacute;a B?c gi&aacute;p Ch? ??u m?i th?y s?n Th? Quang, ph&iacute;a Nam gi&aacute;p ???ng B&igrave;nh Than, ph&iacute;a T&acirc;y gi&aacute;p C?ng c&aacute; v&agrave; ph&iacute;a ?&ocirc;ng gi&aacute;p ???ng V&acirc;n ??n.</p>\n\n<p style=\"text-align:justify\">Khu ??t s? 3 c&oacute; di?n t&iacute;ch 173.904m2, d? ki?n x&acirc;y d?ng ph&aacute;t tri?n th&agrave;nh khu ?&ocirc; th? k?t h?p c?ng qu?c t?, c&oacute; ph&iacute;a Nam gi&aacute;p ???ng L&ecirc; ??c Th?. Ph&iacute;a ?&ocirc;ng, ph&iacute;a T&acirc;y, ph&iacute;a B?c ??u gi&aacute;p bi?n.</p>\n\n<p style=\"text-align:justify\">Khu ??t s? 4 c&oacute; di?n t&iacute;ch 3.825m2, d? ki?n ?? x? l&yacute; h? t?ng k? thu?t tuy?n c?ng ??i l?u hi?n tr?ng giao nhau v?i ???ng L&ecirc; ??c Th? v&agrave; ???ng H? H&aacute;n Th??ng.</p>\n\n<p style=\"text-align:justify\"><strong>Nguy?n Nam</strong></p>\n","da-nang-se-xay-dung-cang-ca-lon-nhat-mien-trung","/web/uploads/images/100935baoxaydung_2.jpg","","","","","0","","","","","0","1","","1");
INSERT INTO tn_news VALUES("12","11","","","<p>?? x&acirc;y m?t ng&ocirc;i nh&agrave; khang trang v?a v?i t&uacute;i ti?n, b?n c?n c&oacute; s? chu?n b? th?t chu ?&aacute;o tr??c khi b?t tay v&agrave;o m?i th?u. V?i m?i giai ?o?n c?n c&acirc;n nh?c k? l??ng, ch?t ch?, tu&acirc;n theo k? ho?ch ban ??u th&igrave; s? tr&aacute;nh ???c chi ph&iacute; ph&aacute;t sinh trong qu&aacute; tr&igrave;nh x&acirc;y d?ng. Nhi?u n?m c&ocirc;ng t&aacute;c trong l?nh v?c t? v?n, thi?t k? v&agrave; thi c&ocirc;ng nh&agrave; gi&aacute; r?, ki?n tr&uacute;c s? Hu?nh Xu&acirc;n H?i chia s? m?t s? l?i khuy&ecirc;n gi&uacute;p gia ch? ch? ??ng h?n trong vi?c gi&aacute;m s&aacute;t qu&aacute; tr&igrave;nh thi c&ocirc;ng ng&ocirc;i nh&agrave; c?a m&igrave;nh, ??ng th?i ti?t gi?m t?i ?a chi ph&iacute; ph&aacute;t sinh.</p>\n\n<p>1. Trang b? ki?n th?c c? b?n v? x&acirc;y d?ng</p>\n\n<p>?? chu?n b? l&agrave;m b?t c? vi?c g&igrave; n&ecirc;n trang b? cho m&igrave;nh v?n ki?n th?c c?n c&oacute; v&agrave; m?t kho?n kinh ph&iacute; d? tr&ugrave; ph&ugrave; h?p v?i ?i?u ki?n gia ?&igrave;nh. Nh?ng ki?n th?c n&agrave;y c&oacute; th? h?c h?i t? b?n b&egrave; ho?c tham kh?o s&aacute;ch b&aacute;o. Nh? ?&oacute;, b?n s? ch? ??ng h?n v&agrave; bi?t c&aacute;ch l?a ch?n ph??ng &aacute;n l&agrave;m vi?c ph&ugrave; h?p v&agrave; ti?t ki?m nh?t.</p>\n\n<p>2. Giai ?o?n chu?n b?</p>\n\n<p>?&acirc;y l&agrave; giai ?o?n ??u ti&ecirc;n v&agrave; quan tr?ng nh?t. Trong th?i gian n&agrave;y, b?n c?n l?p m?t k? ho?ch r&otilde; r&agrave;ng, c&agrave;ng chi ti?t c&agrave;ng t?t, v&iacute; d? d? ?o&aacute;n t?ng chi ph&iacute; x&acirc;y d?ng, gi&aacute; v?t li?u x&acirc;y d?ng, nh&acirc;n c&ocirc;ng... B?n c&oacute; th? tham kh?o &yacute; ki?n c?a nh?ng ng??i t?ng x&acirc;y nh&agrave; tr??c ?&oacute; c?ng nh? c?a b?n b&egrave;, nh?t l&agrave; nh?ng ng??i c&oacute; hi?u bi?t trong l?nh v?c x&acirc;y d?ng. Vi?c ti?p thu n&ecirc;n c&oacute; ch?n l?c nh?ng &yacute; ki?n ph&ugrave; h?p v?i ho&agrave;n c?nh c?a ng&ocirc;i nh&agrave; m&igrave;nh d? ??nh x&acirc;y.</p>\n\n<p>Trong giai ?o?n n&agrave;y, b?n c?n c&acirc;n nh?c gi?a di?n t&iacute;ch x&acirc;y d?ng v&agrave; di?n t&iacute;ch sinh ho?t, xem gia ?&igrave;nh c&oacute; bao nhi&ecirc;u ng??i ?? thi?t k? s? l??ng ph&ograve;ng h?p l&yacute;. C&acirc;n nh?c ???c v?n ?? n&agrave;y s? gi&uacute;p b?n tr&aacute;nh t&igrave;nh tr?ng x&acirc;y th?a ph&ograve;ng, l&agrave;m l&atilde;ng ph&iacute; kh&ocirc;ng gian v&agrave; t?n chi ph&iacute; x&acirc;y d?ng.</p>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"/web/uploads/images/0-4-565f61006d-3043ec1f96e9f34fafd885e353a3d8db.jpg\" style=\"height:280px; width:300px\" /></p>\n\n<p>3. Ch?n mua m?nh ??t d? x&acirc;y</p>\n\n<p>N?u ch?a c&oacute; s?n ??t x&acirc;y nh&agrave;, b?n n&ecirc;n ch?n mua m?nh ??t n&agrave;o b?ng ph?ng, giao th&ocirc;ng thu?n ti?n v&agrave; g?n nh?ng ti?n nghi c&ocirc;ng c?ng nh? tr??ng h?c, ch?, si&ecirc;u th?&hellip; S? thu?n l?i v? ??a th? gi&uacute;p b?n gi?m b?t r?t nhi?u chi ph&iacute; trong qu&aacute; tr&igrave;nh x&acirc;y d?ng c?ng nh? sinh s?ng sau n&agrave;y. N&ecirc;n tr&aacute;nh mua ??t ? nh?ng n?i l?i l&otilde;m, nhi?u ?&aacute;, nhi?u n??c, v&igrave; b?n s? m?t c&ocirc;ng thu&ecirc; ng??i d?n d?p, l?p ??t, ??p ?&aacute; v?a m?t c&ocirc;ng s?c v&agrave; t?n th&ecirc;m chi ph&iacute;.</p>\n\n<p>B?n n&ecirc;n tham kh?o nh?ng ng??i c&oacute; chuy&ecirc;n m&ocirc;n ?? gi&uacute;p b?n l?a ch?n khu ??t ? n?i g&ograve; ??i cao r&aacute;o, tr&aacute;nh nh?ng t?ng ??a ch?t y?u. Gi? s? mua ph?i m?t m?nh ??t ? khu v?c c&oacute; t?ng ??a ch?t y?u, b?n ph?i t?n m?t kho?n kinh ph&iacute; kh&ocirc;ng nh? cho vi?c gia c? m&oacute;ng nh? &eacute;p c?c, khoan c?c nh?i, ?&oacute;ng c? tr&agrave;m. Ng??c l?i, ??i v?i nh?ng n?i c&oacute; t?ng ??a ch?t c?ng, vi?c gia c? m&oacute;ng s? ??n gi?n h?n nhi?u, c&oacute; th? gi?m t? 20% t?i 30% gi&aacute; th&agrave;nh so v?i v&ugrave;ng ??t y?u.</p>\n\n<p>4. L?a ch?n phong c&aacute;ch c?a ng&ocirc;i nh&agrave;</p>\n\n<p>Phong c&aacute;ch ng&ocirc;i nh&agrave; s? quy?t ??nh s? ti?n b?n b? ra ?? chi tr? cho vi?c thi c&ocirc;ng. Nh&agrave; theo phong c&aacute;ch bi?t th?, c? ?i?n c?u k? ???ng nhi&ecirc;n s? m?t nhi?u chi ph&iacute; x&acirc;y d?ng h?n so v?i m?t ng&ocirc;i nh&agrave; mang phong c&aacute;ch hi?n ??i, ??n gi?n.&nbsp;</p>\n\n<p>N?u b?n c&oacute; ng&acirc;n s&aacute;ch v?a ph?i, h&atilde;y ch?n phong c&aacute;ch nh&agrave; hi?n ??i, v?i ???ng m&aacute;i v&agrave; c?a s? ??n gi?n. Thay v&igrave; nh?ng ki?u thi?t k? l? m?t, kh&aacute;c th??ng, h&atilde;y ch?n ki?u nh&agrave; h&igrave;nh ch? nh?t v?i v? tr&iacute; x&acirc;y, s?n t??ng v&agrave; c?nh quan b?t m?t.</p>\n","10-loi-khuyen-giup-tiet-kiem-chi-phi-xay-nha","/web/uploads/images/0%20(4).jpg","","","","","0","","","","","0","0","","1");
INSERT INTO tn_news VALUES("13","7","","","<p style=\"text-align:justify\">Theo ?&oacute;, ?? tri?n khai c&oacute; hi?u qu? c&aacute;c quy ??nh c?a ph&aacute;p lu?t li&ecirc;n quan ??n vi?c qu?n l&yacute;, s? d?ng nh&agrave; chung c?, nh?m gi?i quy?t d?t ?i?m c&aacute;c tranh ch?p, khi?u ki?n ph&aacute;t sinh, B? X&acirc;y d?ng ?? ngh? UBND c&aacute;c t?nh, TP tr?c thu?c Trung ??ng ch? ??o c&aacute;c c? quan ch?c n?ng c?a ??a ph??ng kh?n tr??ng th?c hi?n m?t s? c&ocirc;ng vi?c:</p>\n\n<p style=\"text-align:justify\">Th? nh?t, t?ng c??ng ph? bi?n, tuy&ecirc;n truy?n c&aacute;c quy ??nh c?a Lu?t Nh&agrave; ? s? 65/2014/QH13, Ngh? ??nh s? 99/2015/N?-CP, Th&ocirc;ng t? s? 02/2016/TT-BXD v&agrave; Th&ocirc;ng t? s? 28/2016/TT-BXD c?a B? X&acirc;y d?ng.</p>\n\n<p style=\"text-align:justify\">Th? 2, c?n c? v&agrave;o c&aacute;c quy ??nh c?a ph&aacute;p lu?t v? nh&agrave; ?, ban h&agrave;nh theo th?m quy?n c&aacute;c v?n b?n h??ng d?n, ch? ??o, ?&ocirc;n ??c c&aacute;c c? quan ch?c n?ng v&agrave; c&aacute;c t? ch?c, c&aacute; nh&acirc;n c&oacute; li&ecirc;n quan tr&ecirc;n ??a b&agrave;n th?c hi?n ?&uacute;ng c&aacute;c quy ??nh c?a ph&aacute;p lu?t v? nh&agrave; ?.</p>\n\n<p style=\"text-align:justify\">Th? 3, t?ng c??ng c&ocirc;ng t&aacute;c thanh tra, ki?m tra ph&aacute;t hi?n v&agrave; x? l&yacute; nghi&ecirc;m c&aacute;c tr??ng h?p vi ph?m ph&aacute;p lu?t v? nh&agrave; ? nh? kh&ocirc;ng b&agrave;n giao kinh ph&iacute; b?o tr&igrave; ph?n s? h?u chung, kh&ocirc;ng b&agrave;n giao h? s? nh&agrave; chung c? cho Ban qu?n tr? nh&agrave; chung c?, kh&ocirc;ng t? ch?c ho?c g&acirc;y kh&oacute; kh?n trong vi?c t? ch?c H?i ngh? nh&agrave; chung c?, vi?c s? d?ng c?n h? chung c? v&agrave;o m?c ?&iacute;ch kh&ocirc;ng ph?i ?? ?, vi?c l?n chi?m kh&ocirc;ng gian, x&acirc;y d?ng kh&ocirc;ng ?&uacute;ng v?i quy ho?ch ?&atilde; ???c c? quan c&oacute; th?m quy?n ph&ecirc; duy?t...</p>\n\n<p style=\"text-align:justify\">Th? 4, ch? ??ng gi?i quy?t c&aacute;c v??ng m?c, khi?u ki?n, tranh ch?p ph&aacute;t sinh trong qu&aacute; tr&igrave;nh qu?n l&yacute;, s? d?ng nh&agrave; chung c? theo ?&uacute;ng c&aacute;c quy ??nh c?a ph&aacute;p lu?t hi?n h&agrave;nh ?? kh?c ph?c t&igrave;nh tr?ng tranh ch?p, khi?u ki?n k&eacute;o d&agrave;i, v??t c?p l&ecirc;n c? quan trung ??ng.</p>\n\n<p style=\"text-align:justify\">??i v?i nh?ng n?i dung c?n nghi&ecirc;n c?u, s?a ??i, b? sung cho ph&ugrave; h?p v?i t&igrave;nh h&igrave;nh th?c t?, ?? ngh? UBND c&aacute;c t?nh, TP tr?c Trung ??ng thu?c b&aacute;o c&aacute;o v? B? X&acirc;y d?ng ?? xem x&eacute;t s?a ??i, b? sung theo th?m quy?n ho?c ?? ngh? c? quan c&oacute; th?m quy?n nghi&ecirc;n c?u, s?a ??i, b? sung cho ph&ugrave; h?p.</p>\n\n<p style=\"text-align:justify\">Theo B? X&acirc;y d?ng, ng&agrave;y 25/11/2013, Qu?c h?i kh&oacute;a 13 ?&atilde; th&ocirc;ng qua Lu?t Nh&agrave; ? s? 65/2014/QH13, trong ?&oacute; quy ??nh nhi?u n?i dung li&ecirc;n quan ??n vi?c qu?n l&yacute;, s? d?ng nh&agrave; chung c?. ?? h??ng d?n thi h&agrave;nh Lu?t Nh&agrave; ?, ng&agrave;y 20/10/2015 Ch&iacute;nh ph? ?&atilde; ban h&agrave;nh Ngh? ??nh s? 99/2015/N?-CP quy ??nh chi ti?t v&agrave; h??ng d?n thi h&agrave;nh m?t s? ?i?u c?a Lu?t Nh&agrave; ? v&agrave; B? X&acirc;y d?ng c?ng ?&atilde; ban h&agrave;nh Th&ocirc;ng t? s? 02/2016/TT-BXD ng&agrave;y 15/2/2016 v? Quy ch? qu?n l&yacute;, s? d?ng nh&agrave; chung c?. Hi?n nay, nhi?u ??a ph??ng c&oacute; nh&agrave; chung c? ?&atilde; ch? ??ng tri?n khai th?c hi?n c&oacute; hi?u qu? c&aacute;c quy ??nh v? qu?n l&yacute;, s? d?ng nh&agrave; chung c?, t?ng b??c ??a vi?c qu?n l&yacute;, s? d?ng nh&agrave; chung c? ?i v&agrave;o n? n?p, gi?i quy?t ???c c&aacute;c v??ng m?c, tranh ch?p, khi?u ki?n ph&aacute;t sinh v&agrave; t?o n?p s?ng v?n minh, hi?n ??i cho ng??i d&acirc;n t?i c&aacute;c ?&ocirc; th?. Ng&agrave;y 16/6/2014, B? X&acirc;y d?ng c?ng ?&atilde; ban h&agrave;nh v?n b?n s? 1334/BXD-QLN ?? ngh? c&aacute;c ??a ph??ng ?&ocirc;n ??c c&aacute;c t? ch?c, c&aacute; nh&acirc;n trong vi?c th?c hi?n c&aacute;c quy ??nh c?a ph&aacute;p lu?t c&oacute; li&ecirc;n quan ??n vi?c qu?n l&yacute;, s? d?ng nh&agrave; chung c? tr&ecirc;n ??a b&agrave;n.</p>\n\n<p style=\"text-align:justify\">Tuy nhi&ecirc;n, qua theo vi?c thi h&agrave;nh c&aacute;c quy ??nh v? qu?n l&yacute;, s? d?ng nh&agrave; chung c? trong th?i gian v?a qua cho th?y, m?c d&ugrave; ph&aacute;p lu?t v? nh&agrave; ? ?&atilde; c&oacute; c&aacute;c quy ??nh c? th? ?? x? l&yacute; c&aacute;c v??ng m?c trong qu&aacute; tr&igrave;nh s? d?ng nh&agrave; chung c?, nh?ng t?i m?t s? ??a ph??ng v?n c&ograve;n x?y ra c&aacute;c khi?u ki?n, tranh ch?p gi?a ng??i d&acirc;n v?i ch? ??u t? nh? vi?c t? ch?c h?i ngh? nh&agrave; chung c?, vi?c th&agrave;nh l?p v&agrave; quy?t ??nh c&ocirc;ng nh?n Ban qu?n tr? nh&agrave; chung c?, vi?c l?a ch?n ??n v? qu?n l&yacute; v?n h&agrave;nh nh&agrave; chung c?..., l&agrave;m ?nh h??ng ??n t&igrave;nh h&igrave;nh an ninh tr?t t? c?a ??a ph??ng v&agrave; t?o d? lu?n kh&ocirc;ng t?t trong nh&acirc;n d&acirc;n.</p>\n\n<p style=\"text-align:justify\">Do v?y, B? X&acirc;y d?ng ?? ngh? UBND c&aacute;c t?nh, TP tr?c thu?c Trung ??ng ch? ??o tri?n khai th?c hi?n c&aacute;c n?i dung n&ecirc;u tr&ecirc;n.</p>\n\n<p style=\"text-align:justify\">Vi?n Phong</p>\n","tang-cuong-xu-ly-nghiem-cac-truong-hop-vi-pham-phap-luat-ve-nha-o","/web/uploads/images/tin-tuc/182338baoxaydung_3.jpg","","","","","0","","","","","0","0","","1");



DROP TABLE tn_news_category;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO tn_news_category VALUES("1","0","Tin th? gi?i","tin-the-gioi","","","","","0");
INSERT INTO tn_news_category VALUES("2","0","Tin trong n??c","tin-trong-nuoc","","","","","0");
INSERT INTO tn_news_category VALUES("3","2","Th? thao","","","","","1","0");
INSERT INTO tn_news_category VALUES("4","2","","","","","","1","0");
INSERT INTO tn_news_category VALUES("5","1","Kinh t?","","","","","1","0");
INSERT INTO tn_news_category VALUES("6","3","","bong-da","","","","","0");
INSERT INTO tn_news_category VALUES("7","0","","tin-tuc-ve-xay-dung","/web/uploads/images/1388802558r1-500x300-95fced3eb3-a20cd8cb14505a0a6d4cbc50c3a57a72.jpg","","","","1");
INSERT INTO tn_news_category VALUES("8","0","T? v?n","tu-van","","","","","1");
INSERT INTO tn_news_category VALUES("11","8","","10-loi-khuyen-giup-tiet-kiem-chi-phi-xay-nha","/web/uploads/files/1-1511-1402390782.jpg","","","","1");



DROP TABLE tn_pages;

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

INSERT INTO tn_pages VALUES("2","","Gi?i thi?u","gioi-thieu","<p><span style=\"font-size:18px\"><span style=\"font-family:arial,helvetica,sans-serif\">Website gi?i&nbsp;thi?u vi?c l&agrave;m mi?n ph&iacute;</span></span></p>\n","","","","","232","1","","1","","2018-05-07 22:28:35","1");
INSERT INTO tn_pages VALUES("3","","","cong-trinh","","","","","","261","1","","","","","1");
INSERT INTO tn_pages VALUES("4","","","policy","<p><strong><em>C?p nh?t l?n cu?i ng&agrave;y 11&nbsp;th&aacute;ng 4&nbsp;n?m 2018</em></strong></p>\n\n<p><strong>VUI L&Ograve;NG ??C K? C&Aacute;C ?I?U KHO?N N&Agrave;Y TR??C KHI S? D?NG</strong> <a href=\"https://jobsvina.com\" target=\"_blank\">https://jobsvina.com</a> (Jobs Vina)</p>\n\n<p>Vi?c truy c?p v&agrave; s? d?ng Jobs Vina c&oacute; ngh?a l&agrave; b?n ?&atilde; hi?u v&agrave; ??ng &yacute; s? th?c hi?n theo c&aacute;c ?i?u kho?n s? d?ng m&agrave; Vina - Jobs ??a ra. N?u b?n kh&ocirc;ng ??ng &yacute; v?i c&aacute;c ?i?u kho?n n&agrave;y, b?n s? kh&ocirc;ng c&oacute; quy?n truy c?p ho?c s? d?ng c&aacute;c d?ch v?. C&aacute;c ?i?u kho?n n&agrave;y s? thay th? cho c&aacute;c th?a thu?n ho?c h?p ??ng c?a b?n. Ch&uacute;ng t&ocirc;i c&oacute; th? ngay l?p t?c ch?m d?t c&aacute;c ?i?u kho?n n&agrave;y ho?c b?t k? d?ch v? n&agrave;o li&ecirc;n quan ??n b?n, ho?c n&oacute;i chung l&agrave; ng?ng cung c?p ho?c t? ch?i quy?n truy c?p ??n c&aacute;c d?ch v? ho?c b?t k? ph?n n&agrave;o c?a d?ch v?, v&agrave;o b?t k? l&uacute;c n&agrave;o v&igrave; b?t k? l&yacute; do g&igrave;.<br />\nCH&Uacute;NG T&Ocirc;I C&Oacute; TO&Agrave;N QUY?N THAY ??I N?I DUNG C&Aacute;C ?I?U KHO?N ?? PH&Ugrave; H?P V?I M&Ocirc; H&Igrave;NH HO?T ??NG, QUY ??NH PH&Aacute;P LU?T M&Agrave; KH&Ocirc;NG C?N TH&Ocirc;NG B&Aacute;O T?I NG??I D&Ugrave;NG. V&Igrave; V?Y H&Atilde;Y TH??NG XUY&Ecirc;N TRUY C?P V&Agrave;O ?I?U KHO?N S? D?NG THEO D&Otilde;I NH?NG THAY ??I ?? ??M B?O QUY?N L?I V&Agrave; NGH?A V? C?A B?N.</p>\n\n<p>Jobs Vina l&agrave; s&agrave;n giao d?ch l&agrave;m vi?c t? do ? Vi?t Nam d&agrave;nh cho c&aacute;c b?n c?n t&igrave;m vi?c l&agrave;m ho?c mu?n t&igrave;m ki?m c? h?i t?t h?n, kh&aacute;ch h&agrave;ng ho?c doanh nghi?p s? d?ng Jobs Vina ?? ti?t ki?m chi ph&iacute;. Jobs Vina cho ph&eacute;p &quot;NG??I D&Ugrave;NG&quot; t?o h? s? c&aacute; nh&acirc;n, ??ng tin t&igrave;m vi?c.</p>\n\n<p><strong>1. ?I?U KI?N THAM GIA GIAO D?CH</strong></p>\n\n<p>1.1 &quot;NG??I D&Ugrave;NG&quot; tham gia giao d?ch ph?i ?&aacute;p ?ng c&aacute;c ?i?u ki?n sau:&nbsp;<br />\n- ?&atilde; ?? 18 tu?i tr? l&ecirc;n&nbsp;<br />\n- C&oacute; ??y ?? n?ng l?c h&agrave;nh vi d&acirc;n s? theo quy ??nh c?a ph&aacute;p lu?t. &quot;NG??I D&Ugrave;NG&quot; kh&ocirc;ng ???c ph&eacute;p tham gia giao d?ch trong tr??ng h?p kh&ocirc;ng ?&aacute;p ?ng ?? c&aacute;c ?i?u ki?n tr&ecirc;n, tr? tr??ng h?p c&oacute; tr??ng gi&aacute;m h? tr?c ti?p c?a &quot;NG??I D&Ugrave;NG&quot; ??ng &yacute; v&agrave; tham gia.<br />\n1.2. ?? c&oacute; th? s? d?ng Jobs Vina, &quot;NG??I D&Ugrave;NG&quot; c?n ph?i truy c?p v&agrave;o website:<a href=\"http://https://jobsvina.com\" target=\"_blank\"> https://jobsvina.com</a> v&agrave; ??ng k&yacute; t&agrave;i kho?n b?ng c&aacute;ch cung c?p th&ocirc;ng tin c&aacute; nh&acirc;n. Sau khi ho&agrave;n t?t vi?c ??ng k&yacute; t&agrave;i kho?n, Jobs Vina&nbsp;s? cung c?p cho &quot;NG??I D&Ugrave;NG&quot; m?t t&agrave;i kho?n c&aacute; nh&acirc;n ?? &quot;NG??I D&Ugrave;NG&quot; c&oacute; th? truy c?p v&agrave; qu?n l&yacute; qu&aacute; tr&igrave;nh giao d?ch c?a m&igrave;nh.<br />\n1.3. ??i v?i &quot;NG??I D&Ugrave;NG&quot;&nbsp;c?n ph?i cung c?p th&ocirc;ng tin ch&iacute;nh x&aacute;c cho Jobs Vina trong ph?n ??ng k&yacute; t&agrave;i kho?n bao g?m c&aacute;c th&ocirc;ng tin c&aacute; nh&acirc;n, s? ?i?n tho?i, ??a ch?, h&igrave;nh ?nh ??i di?n,&nbsp;kinh nghi?m l&agrave;m vi?c, ?&aacute;nh gi&aacute; c?a kh&aacute;ch h&agrave;ng tr??c ?&acirc;y,...<br />\n1.4. &quot;NG??I D&Ugrave;NG&quot; ph?i ch?u tr&aacute;ch nhi?m tr??c ph&aacute;p lu?t v? to&agrave;n b? c&aacute;c th&ocirc;ng tin m&agrave; m&igrave;nh k&ecirc; khai tr&ecirc;n website c?a <a href=\"https://jobsvina.com\" target=\"_blank\">https://jobsvina.com</a>.&nbsp;Trong m?i tr??ng h?p, Jobs Vina c&oacute; quy?n x&aacute;c minh th&ocirc;ng tin m&agrave; &quot;NG??I D&Ugrave;NG&quot; ?&atilde; cung c?p nh?ng kh&ocirc;ng c&oacute; ngh?a l&agrave; Jobs Vina c&oacute; th? ??m b?o th&ocirc;ng tin m&agrave; &quot;NG??I D&Ugrave;NG&quot; ?&atilde; khai l&agrave; ch&iacute;nh x&aacute;c. Jobs Vina s? kh&ocirc;ng gi?i quy?t c&aacute;c khi?u n?i c?a &quot;NG??I D&Ugrave;NG&quot; trong tr??ng h?p &quot;NG??I D&Ugrave;NG&quot; khai kh&ocirc;ng ?&uacute;ng c&aacute;c th&ocirc;ng tin m&agrave; website c?a Jobs Vina y&ecirc;u c?u khi ??ng k&yacute; th&ocirc;ng tin, ??ng tin t&igrave;m vi?c, ho?c ??ng h? s?.<br />\n1.5. &quot;NG??I D&Ugrave;NG&quot; ph?i ch?u tr&aacute;ch nhi?m qu?n l&yacute;, ki?m so&aacute;t t&agrave;i kho?n c?a m&igrave;nh tr&ecirc;n website c?a Jobs Vina. Kh&ocirc;ng ???c mua b&aacute;n, trao ??i, sang nh??ng cho ng??i kh&aacute;c d??i b?t k? h&igrave;nh th?c n&agrave;o.<br />\n1.6. Trong tr??ng h?p &quot;NG??I D&Ugrave;NG&quot; vi ph?m m?t trong c&aacute;c ?i?u ki?n tr&ecirc;n th&igrave; Jobs Vina c&oacute; to&agrave;n quy?n ??n ph??ng kh&oacute;a t&agrave;i kho?n v&agrave; t? ch?i m?i ho?t c?a &quot;NG??I D&Ugrave;NG&quot; tr&ecirc;n website c?a Jobs Vina.</p>\n\n<p><strong>2. H?P ??NG D?CH V? GI?A C&Aacute;C B&Ecirc;N</strong></p>\n\n<p>- H?p ??ng d?ch v? gi?a &quot;KH&Aacute;CH H&Agrave;NG&quot; v&agrave; &quot;https://jobsvina.com&quot; ???c t?o ra khi &quot;KH&Aacute;CH H&Agrave;NG&quot; ??ng vi?c ho?c mua d?ch v? tr&ecirc;n website c?a Jobs Vina v&agrave; ???c xem l&agrave; ?&atilde; k&yacute; k?t ngay khi c&oacute; &quot;https://jobsvina.com&quot; ??ng &yacute; nh?n th?c hi?n y&ecirc;u c?u c?a &quot;KH&Aacute;CH H&Agrave;NG&quot; (??i v?i tr??ng h?p &quot;KH&Aacute;CH H&Agrave;NG&quot; mua d?ch v?) ho?c &quot;KH&Aacute;CH H&Agrave;NG&quot; ch?n &quot;https://jobsvina.com&quot; th&ocirc;ng qua b&aacute;o gi&aacute; m&agrave; &quot;https://jobsvina.com&quot; ?&atilde; g?i (??i v?i tr??ng h?p &quot;KH&Aacute;CH H&Agrave;NG&quot; ??ng tin tuy?n dung) tr&ecirc;n website c?a Jobs Vina.<br />\n- Jobs Vina kh&ocirc;ng tham gia k&yacute; k?t h?p ??ng gi?a &quot;KH&Aacute;CH H&Agrave;NG&quot; v&agrave; &quot;https://jobsvina.com&quot;.</p>\n\n<p><strong>3. C&Aacute;CH S? D?NG Jobs Vina</strong></p>\n\n<p>??i v?i &quot;KH&Aacute;CH H&Agrave;NG&quot; c&oacute; nhu c?u t&igrave;m &quot;https://jobsvina.com&quot;: Website cho ph&eacute;p &quot;KH&Aacute;CH H&Agrave;NG&quot; t&igrave;m &quot;https://jobsvina.com&quot; qua 3 c&aacute;ch:<br />\n-&nbsp; &quot;KH&Aacute;CH H&Agrave;NG&quot; ??ng vi?c: &quot;KH&Aacute;CH H&Agrave;NG&quot; ph?i tr? l?i c&aacute;c c&acirc;u h?i theo t?ng danh m?c c&ocirc;ng vi?c m&agrave; Jobs Vina ??a ra nh?m gi&uacute;p &quot;https://jobsvina.com&quot; hi?u r&otilde; y&ecirc;u c?u c?a &quot;KH&Aacute;CH H&Agrave;NG&quot; ?? quy?t ??nh b&aacute;o gi&aacute; hay kh&ocirc;ng.<br />\n-&nbsp; &quot;KH&Aacute;CH H&Agrave;NG&quot; mua d?ch v?: C&aacute;c D?CH V? tr&ecirc;n website Jobs Vina ??a ra nh?m gi&uacute;p cho &quot;KH&Aacute;CH H&Agrave;NG&quot; nhanh ch&oacute;ng t&igrave;m ???c c&ocirc;ng vi?c/?ng vi&ecirc;n&nbsp;ph&ugrave; h?p.<br />\n- Sau khi &quot;https://jobsvina.com&quot; ho&agrave;n th&agrave;nh c&ocirc;ng vi?c, &quot;KH&Aacute;CH H&Agrave;NG&quot; x&aacute;c nh?n ho&agrave;n th&agrave;nh c&ocirc;ng vi?c v&agrave; ?&aacute;nh gi&aacute; &quot;https://jobsvina.com&quot;.</p>\n\n<p>- L?u &yacute;: Jobs Vina ch? ?&oacute;ng vai tr&ograve; trung gian gi?i thi?u &quot;https://jobsvina.com&quot; cho &quot;KH&Aacute;CH H&Agrave;NG&quot; ch? kh&ocirc;ng tham gia v&agrave;o qu&aacute; tr&igrave;nh th?a thu?n, l&agrave;m vi?c gi?a &quot;KH&Aacute;CH H&Agrave;NG&quot; v?i &quot;https://jobsvina.com&quot;.<br />\n- &quot;KH&Aacute;CH H&Agrave;NG&quot; c&oacute; th? h?y b? y&ecirc;u c?u ho?c t? ch?i l&agrave;m vi?c v?i &quot;https://jobsvina.com&quot; b?ng c&aacute;ch li&ecirc;n h? v?i b? ph?n ch?m s&oacute;c kh&aacute;ch h&agrave;ng c?a Jobs Vina ?? ???c h? tr?.</p>\n\n<p><strong>4. QUY ??NH V? N?I DUNG NG??I D&Ugrave;NG CUNG C?P</strong></p>\n\n<p>- Kh&ocirc;ng ??ng t?i, b&igrave;nh lu?n v? c&aacute;c v?n ?? ch&iacute;nh tr?, t&ocirc;n gi&aacute;o, s?c t?c.<br />\n- Kh&ocirc;ng truy?n b&aacute; n?i dung v?n ho&aacute; ph?m b?o l?c, ??i tr?y, ph?n c?m&hellip;tr&aacute;i v?i thu?n phong m? t?c Vi?t Nam.<br />\n- Kh&ocirc;ng s? d?ng Jobs Vina ?? ti?p tay cho c&aacute;c h&agrave;nh ??ng vi ph?m ph&aacute;p lu?t Nh&agrave; n??c CHXHCN Vi?t Nam.<br />\n- Kh&ocirc;ng vi ph?m b?n quy?n ?&atilde; ???c b?o h? v&agrave; c&aacute;c n?i dung ???c lu?t s? h?u tr&iacute; tu? b?o h? khi ch?a c&oacute; s? ??ng &yacute; b?ng v?n b?n c?a ng??i gi? b?n quy?n.<br />\n- Kh&ocirc;ng s? d?ng ng&ocirc;n t? thi?u v?n ho&aacute;, khi&ecirc;u d&acirc;m, ?e d?a, l?ng nh?c hay x&uacute;c ph?m c&aacute; nh&acirc;n, t? ch?c&hellip;<br />\n- Kh&ocirc;ng truy?n t?i c&aacute;c t&agrave;i li?u qu?ng c&aacute;o, khuy?n m?i, &quot;th? g?i h&agrave;ng lo?t&quot;, c&aacute;c th&ocirc;ng tin kh&ocirc;ng theo ch? ?? ?ang th?o lu?n.<br />\n- Kh&ocirc;ng ??ng k&yacute; nhi?u t&agrave;i kho?n v?i c&aacute;c th&ocirc;ng tin t??ng t? nhau.<br />\n- Kh&ocirc;ng ph&aacute;t t&aacute;n virus, trojan, adware, spyware, c&aacute;c ??an m&atilde; g&acirc;y h?i cho ch??ng tr&igrave;nh, c&aacute;c ch??ng tr&igrave;nh g&acirc;y c?n tr? s? ph&aacute;t tri?n c?a website, ph?n c?ng, ph?n m?m m&aacute;y t&iacute;nh ho?c c&aacute;c thi?t b? vi?n th&ocirc;ng.<br />\n- &quot;NG??I D&Ugrave;NG&quot; ph?i ch?u tr&aacute;ch nhi?m v? n?i dung m&agrave; m&igrave;nh ??ng t?i tr&ecirc;n <a href=\"https://jobsvina.com\" target=\"_blank\">https://jobsvina.com</a>. Ch&uacute;ng t&ocirc;i kh&ocirc;ng ch?u tr&aacute;ch nhi?m v? b?t k? n?i dung n&agrave;o do &quot;NG??I D&Ugrave;NG&quot; ??ng t?i.<br />\n- Ch&uacute;ng t&ocirc;i c&oacute; to&agrave;n quy?n s? d?ng ho?c thay ??i n?i dung &quot;NG??I D&Ugrave;NG&quot; cung c?p m&agrave; kh&ocirc;ng c?n th&ocirc;ng b&aacute;o tr??c. Nh?ng &quot;NG??I D&Ugrave;NG&quot; c? t&igrave;nh vi ph?m s? b? lo?i kh?i <a href=\"https://jobsvina.com\" target=\"_blank\">https://jobsvina.com</a>.</p>\n\n<p><strong>5. QUY?N C?A NG??I D&Ugrave;NG</strong></p>\n\n<p>Quy?n c?a &quot;NG??I D&Ugrave;NG&quot; khi ??ng k&yacute; v&agrave; s? d?ng https://jobsvina.com:<br />\n5.1. &quot;NG??I D&Ugrave;NG&quot; ???c Jobs Vina b?o m?t c&aacute;c th&ocirc;ng tin c&aacute; nh&acirc;n theo ch&iacute;nh s&aacute;ch b?o m?t th&ocirc;ng tin &quot;NG??I D&Ugrave;NG&quot; c?a Jobs Vina.<br />\n5.2. &quot;NG??I D&Ugrave;NG&quot; ???c quy?n t? ch?i s? d?ng Jobs Vina m&agrave; kh&ocirc;ng c?n ??a ra l&yacute; do.<br />\n5.3. &quot;NG??I D&Ugrave;NG&quot; ???c quy?n qu?n l&yacute; c&aacute;c th&ocirc;ng tin c&aacute; nh&acirc;n, l?ch s? l&agrave;m vi?c, d?ch v? ?&atilde; s? d?ng ngay tr&ecirc;n Jobs Vina.</p>\n\n<p><strong>6. NGH?A V? C?A NG??I D&Ugrave;NG</strong></p>\n\n<p>Ngo&agrave;i c&aacute;c ?i?u kho?n r&agrave;ng bu?c tr&ecirc;n, c&ugrave;ng v?i vi?c s? d?ng ?ng D?ng, website, &quot;NG??I D&Ugrave;NG&quot; ??ng &yacute; r?ng:<br />\n6.1. &quot;NG??I D&Ugrave;NG&quot; c&oacute; tr&aacute;ch nhi?m cung c?p ??y ?? v&agrave; ch&iacute;nh x&aacute;c c&aacute;c th&ocirc;ng tin theo y&ecirc;u c?u c?a Jobs Vina khi ??ng k&yacute; v&agrave; trong su?t qu&aacute; tr&igrave;nh s? d?ng Jobs Vina.<br />\n6.2. &quot;NG??I D&Ugrave;NG&quot; s? ch?u to&agrave;n b? tr&aacute;ch nhi?m trong vi?c s? d?ng T&agrave;i Kho?n c?a m&igrave;nh tr&ecirc;n h? th?ng c?a Jobs Vina.<br />\n6.3. Trong tr??ng h?p &quot;NG??I D&Ugrave;NG&quot; m?t t&agrave;i kho?n, &quot;NG??I D&Ugrave;NG&quot; c&oacute; ngh?a v? th&ocirc;ng b&aacute;o cho b? ph?n ch?m s&oacute;c kh&aacute;ch h&agrave;ng c?a Jobs Vina ?? Jobs Vina ti?n h&agrave;nh th? t?c thay ??i ho?c t?m th?i ch?n c&aacute;c giao d?ch c&oacute; li&ecirc;n quan gi&uacute;p &quot;NG??I D&Ugrave;NG&quot; qu?n l&yacute; qu&aacute; tr&igrave;nh s? d?ng c?a m&igrave;nh. Jobs Vina s? kh&ocirc;ng ch?u tr&aacute;ch nhi?m ho?c gi?i quy?t khi?u n?i trong tr??ng h?p &quot;NG??I D&Ugrave;NG&quot; kh&ocirc;ng th&ocirc;ng b&aacute;o cho Jobs Vina d?n ??n vi?c c&oacute; b&ecirc;n th? ba s? d?ng T&agrave;i Kho?n ?&oacute; c?a &quot;NG??I D&Ugrave;NG&quot; ?? th?c hi?n c&aacute;c ho?t ??ng tr&ecirc;n Jobs Vina.<br />\n6.4. &quot;NG??I D&Ugrave;NG&quot; s? kh&ocirc;ng ?y quy?n, chuy?n nh??ng hay chuy?n giao T&agrave;i Kho?n c?a m&igrave;nh v?i b?t k? h&igrave;nh th?c n&agrave;o cho b&ecirc;n th? ba b?t k?.<br />\n6.5. &quot;NG??I D&Ugrave;NG&quot; s? ch?u tr&aacute;ch nhi?m tr??c ph&aacute;p lu?t ??i v?i to&agrave;n b? th&ocirc;ng tin m&agrave; m&igrave;nh ?&atilde; cung c?p tr&ecirc;n ?ng d?ng,website.<br />\n6.6. &quot;NG??I D&Ugrave;NG&quot; kh&ocirc;ng s? d?ng Jobs Vina nh?m m?c ?&iacute;ch tr&aacute;i ph&aacute;p lu?t.<br />\n6.7. &quot;NG??I D&Ugrave;NG&quot; ??ng &yacute; ch?u tr&aacute;ch nhi?m v? t&iacute;nh ch&iacute;nh x&aacute;c c?a c&aacute;c th&ocirc;ng tin m&agrave; m&igrave;nh cung c?p ho?c b? sung khi s? d?ng Jobs Vina.<br />\n6.8. &quot;NG??I D&Ugrave;NG&quot; s? kh&ocirc;ng s? website Jobs Vina ?? g&acirc;y phi?n to&aacute;i ho?c l&agrave;m kh&oacute; Jobs Vina.<br />\n6.9. &quot;NG??I D&Ugrave;NG&quot; kh&ocirc;ng ???c c? t&igrave;nh b&ocirc;i nh?a danh d?, vu kh?ng, ho?c b?a ??t nh?ng ?i?u l&agrave;m t?n h?i ??n danh d?, uy t&iacute;n c?a Jobs Vina ho?c c&aacute;c b&ecirc;n li&ecirc;n quan.<br />\n6.10. &quot;NG??I D&Ugrave;NG&quot; s? kh&ocirc;ng c? t&igrave;nh g&acirc;y thi?t h?i cho Website Jobs Vina theo b?t k? c&aacute;ch n&agrave;o;<br />\n6.11. &quot;NG??I D&Ugrave;NG&quot; s? kh&ocirc;ng sao ch&eacute;p, s? d?ng c&aacute;c th&ocirc;ng tin, n?i dung tr&ecirc;n website c?a Jobs Vina m&agrave; kh&ocirc;ng c&oacute; s? cho ph&eacute;p b?ng v?n b?n c?a Jobs Vina.<br />\n6.12. &quot;KH&Aacute;CH H&Agrave;NG&quot; s? thanh to&aacute;n chi ph&iacute; cho &quot;https://jobsvina.com&quot; theo s? th?a thu?n gi?a hai b&ecirc;n.<br />\n6.13. &quot;NG??I D&Ugrave;NG&quot; s? kh&ocirc;ng c&ugrave;ng b&ecirc;n th? ba b?ng b?t k? ph??ng th?c n&agrave;o c&oacute; nh?ng h&agrave;nh vi g&acirc;y ph??ng h?i cho website c?ng nh? ch?t l??ng d?ch V? tr&ecirc;n website c?a Jobs Vina.<br />\n6.14. &quot;KH&Aacute;CH H&Agrave;NG&quot; c&oacute; tr&aacute;ch nhi?m ki?m tra th&ocirc;ng tin c?a &quot;https://jobsvina.com&quot; tr??c khi l&agrave;m vi?c.<br />\n6.15. &quot;KH&Aacute;CH H&Agrave;NG&quot; ch?u tr&aacute;ch nhi?m t? ki?m tra, b?o qu?n t&agrave;i s?n tr??c, trong v&agrave; sau khi &quot;https://jobsvina.com&quot; ho&agrave;n th&agrave;nh c&ocirc;ng vi?c.<br />\n6.16. &quot;https://jobsvina.com&quot; c&oacute; tr&aacute;ch nhi?m x&aacute;c nh?n l?i y&ecirc;u c?u c?a &quot;KH&Aacute;CH H&Agrave;NG&quot; tr??c khi l&agrave;m vi?c.<br />\nTrong tr??ng h?p &quot;NG??I D&Ugrave;NG&quot; vi ph?m ho?c Jobs Vina nh?n th?y &quot;NG??I D&Ugrave;NG&quot; c&oacute; d?u hi?u vi ph?m, Jobs Vina c&oacute; quy?n ngay l?p t?c ?&oacute;ng T&agrave;i Kho?n c?a &quot;NG??I D&Ugrave;NG&quot; m&agrave; kh&ocirc;ng c?n ph?i l?y &yacute; ki?n hay ???c s? ??ng &yacute; c?a &quot;NG??I D&Ugrave;NG&quot; ho?c b&ecirc;n th? ba n&agrave;o kh&aacute;c.</p>\n\n<p><strong>7. KHI?U N?I</strong></p>\n\n<p>- Khi c&oacute; b?t k? khi?u n?i g&igrave; v? ch?t l??ng c?a &quot;https://jobsvina.com&quot; ho?c nh?ng v?n ?? li&ecirc;n quan ??n t&agrave;i s?n c?a &quot;KH&Aacute;CH H&Agrave;NG&quot; trong qu&aacute; tr&igrave;nh &quot;https://jobsvina.com&quot; th?c hi?n. &quot;KH&Aacute;CH H&Agrave;NG&quot; h&atilde;y li&ecirc;n h? v?i b? ph?n ch?m s&oacute;c kh&aacute;ch h&agrave;ng c?a Jobs Vina ?? h? tr? gi?i quy?t.<br />\n- Trong tr??ng h?p c&oacute; tranh ch?p x?y ra gi?a &quot;KH&Aacute;CH H&Agrave;NG&quot; v?i &quot;https://jobsvina.com&quot;, Jobs Vina s? ??ng ra l&agrave;m ??n v? trung gian ?? gi?i quy?t m&acirc;u thu?n gi?a hai b&ecirc;n. N?u s? vi?c kh&ocirc;ng ???c gi?i quy?t th&igrave; s? ??a ra t&ograve;a &aacute;n nh&acirc;n d&acirc;n s? t?i ?? gi?i quy?t.</p>\n\n<p><strong>8. QU?NG C&Aacute;O V&Agrave; KHUY?N M&Atilde;I</strong></p>\n\n<p>C&ugrave;ng v?i vi?c truy c?p website Jobs Vina, ??ng k&yacute; th&ocirc;ng tin v&agrave; s? d?ng, &quot;NG??I D&Ugrave;NG&quot; ??ng &yacute; r?ng s? nh?n c&aacute;c th&ocirc;ng tin li&ecirc;n quan ??n vi?c s? d?ng website qua tin nh?n SMS, email, bao g?m nh?ng kh&ocirc;ng gi?i h?n c&aacute;c tin nh?n qu?ng c&aacute;o v? vi?c c?p nh?t th&ecirc;m d?ch v? tr&ecirc;n website, t&iacute;ch l?y ?i?m, tham gia ch??ng tr&igrave;nh r&uacute;t th?m tr&uacute;ng th??ng, c&aacute;c ch??ng tr&igrave;nh khuy?n m&atilde;i trong gi?, ng&agrave;y, tu?n, th&aacute;ng, n?m c?a Jobs Vina.</p>\n\n<p><strong>9. GI?I H?N, MI?N TR&Aacute;CH NHI?M PH&Aacute;P L&Yacute;</strong></p>\n\n<p>Ngo&agrave;i c&aacute;c tr&aacute;ch nhi?m c? th? ?&atilde; ???c th&ocirc;ng tin, c&ugrave;ng v?i vi?c truy c?p website Jobs Vina, ??ng k&yacute; th&ocirc;ng tin v&agrave; s? d?ng, &quot;NG??I D&Ugrave;NG&quot; ?&atilde; hi?u r&otilde; r?ng:<br />\n- C&aacute;c th&ocirc;ng tin, ch&iacute;nh s&aacute;ch, d?ch v? ???c c&ocirc;ng b? tr&ecirc;n website ch? mang t&iacute;nh ch?t th&ocirc;ng tin tham kh?o ?? &quot;KH&Aacute;CH H&Agrave;NG&quot; quy?t ??nh s? d?ng ho?c tham gia.<br />\n- Jobs Vina s? kh&ocirc;ng ch?u tr&aacute;ch nhi?m v? b?t k? thi?t h?i n&agrave;o c?a &quot;NG??I D&Ugrave;NG&quot; do vi?c s? d?ng website g&acirc;y ra, bao g?m nh?ng kh&ocirc;ng gi?i h?n c&aacute;c thi?t h?i do ph?n m?m ??c h?i, virus, c&aacute;c thi?t h?i v? vi?c kh&ocirc;ng th? truy c?p ???c c&aacute;c trang th&ocirc;ng tin li&ecirc;n l?c kh&aacute;c ho?c ph??ng ti?n ?i?n tho?i c?a &quot;NG??I D&Ugrave;NG&quot; b? ch?m&hellip;<br />\n- &quot;NG??I L&Agrave;M&quot; ch?u tr&aacute;ch nhi?m ch&iacute;nh v? qu&aacute; tr&igrave;nh v&agrave; kh? n?ng c?a m&igrave;nh ???c y&ecirc;u c?u th&ocirc;ng qua vi?c s? d?ng website. Trong m?i tr??ng h?p Jobs Vina kh&ocirc;ng ch?u tr&aacute;ch nhi?m li&ecirc;n quan ??n v&agrave;/ho?c ph&aacute;t sinh t? vi?c cung c?p d?ch V? c?a &quot;https://jobsvina.com&quot; ho?c b?t k? h&agrave;nh ??ng, th&aacute;i ?? v&agrave;/ho?c s? su?t n&agrave;o t? &quot;https://jobsvina.com&quot;.</p>\n\n<p><strong>10. CH&Iacute;NH S&Aacute;CH V? B?N QUY?N</strong></p>\n\n<p>- Ch&iacute;nh S&aacute;ch B?n Quy?n c?a Jobs Vina ???c thi?t l?p ?i k&egrave;m v?i ?i?u Kho?n S? D?ng n&agrave;y. &quot;NG??I D&Ugrave;NG&quot; cam k?t s? kh&ocirc;ng vi ph?m vi?c s? d?ng, sao ch&eacute;p hay ph&acirc;n ph?i b?t k? n?i dung, th&ocirc;ng tin n&agrave;o c&oacute; li&ecirc;n quan ??n ho?c ???c n&ecirc;u trong ?i?u Kho?n S? D?ng ho?c Ch&iacute;nh S&aacute;ch B?n Quy?n c?a Jobs Vina.<br />\n- &quot;NG??I D&Ugrave;NG&quot; x&aacute;c nh?n v&agrave; ??ng &yacute; r?ng t?t c? c&aacute;c t&agrave;i li?u, th&ocirc;ng tin v&agrave; n?i dung bao g?m logo, th??ng hi?u, nh&atilde;n hi?u, bi?u t??ng, v?n b?n, h&igrave;nh ?nh, ph?n m?m, s?n ph?m, d? li?u, d?ch v?, giao di?n Website, giao di?n ?ng d?ng v&agrave; c&aacute;c t&agrave;i s?n s? h?u tr&iacute; tu? kh&aacute;c ???c Jobs Vina c&ocirc;ng b? tr&ecirc;n Website, ?ng D?ng c?ng nh? c&aacute;c ?i?u Kho?n S? D?ng l&agrave; c&aacute;c t&agrave;i s?n tr&iacute; tu? thu?c quy?n s? h?u c?a Jobs Vina v&agrave; ???c b?o v? b?i Lu?t S? h?u tr&iacute; tu? c?a Vi?t Nam. Jobs Vina gi? quy?n c?p ph&eacute;p truy c?p th&ocirc;ng tin c?a C?ng th&ocirc;ng tin theo ?i?u kho?n n&agrave;y.<br />\n- &quot;NG??I D&Ugrave;NG&quot; kh&ocirc;ng ???c ph&eacute;p s? d?ng, sao ch&eacute;p Th&ocirc;ng Tin ho?c t?o ra c&aacute;c b?n ph&aacute;t sinh c?a Th&ocirc;ng Tin l&ecirc;n b?t k? m?t ph??ng ti?n, trang web hay b?t k? m?t ti?n &iacute;ch n&agrave;o kh&aacute;c m&agrave; kh&ocirc;ng ???c s? ??ng &yacute; b?ng v?n b?n c?a Jobs Vina.</p>\n\n<p><br />\n<strong>N?U B?N C&Oacute; B?T K? TH?C M?C N&Agrave;O H&Atilde;Y LI&Ecirc;N H? V?I <a href=\"https://jobsvina.com/contact.html\">JOBS VINA</a> ?? ???C H? TR? V&Agrave; GI?I ?&Aacute;P</strong></p>\n","","","","","96","3","","1","","2018-05-22 21:34:21","1");
INSERT INTO tn_pages VALUES("5","","T? v?n","tu-van","<blockquote>\n<p><strong>1) N?u b?n kh&ocirc;ng bi?t v? tr&igrave;nh t? c&aacute;c b??c khi x&acirc;y nh&agrave; :</strong>&nbsp;c&oacute; th? b?n s? b? ti&ecirc;u t?n kho?ng&nbsp;<strong>5% - 10%</strong>&nbsp;chi ph&iacute; cho vi?c s?a ch?a, ?i?u ch?nh c?n nh&agrave; c?a m&igrave;nh. V&iacute; d? : nh?ng v?n ?? v? phong th?y n?u kh&ocirc;ng d? tr&ugrave; tr??c, m&agrave; sau khi thi c&ocirc;ng m?i xem th&igrave; ch?c ch?n b?n s? ph?i ch?nh s?a l?i c?n nh&agrave; c?a m&igrave;nh ; ho?c kh&ocirc;ng bi?t c&aacute;ch v?n d?ng thi?t k? c&oacute; th? l&agrave;m h?ng c? kh&ocirc;ng gian, b? c?c c?n nh&agrave; v&agrave; ph?i t?n ti?n ch?nh s?a.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/7.jpg\" style=\"height:600px; width:800px\" /></p>\n</blockquote>\n\n<blockquote>\n<p><strong>2) N?u b?n kh&ocirc;ng bi?t c&aacute;ch d? tr&ugrave; chi ph&iacute; x&acirc;y nh&agrave; :</strong>&nbsp;b?n c&oacute; th? s? ph?i ?i vay ti?n ?? ho&agrave;n th&agrave;nh c?n nh&agrave;. Vi?c vay ti?n n&agrave;y c&oacute; th? ?nh h??ng ??n v?n ?? t&agrave;i ch&iacute;nh c?a nh&agrave; b?n. Ngo&agrave;i ra, vi?c d? tr&ugrave; chi ph&iacute; x&acirc;y d?ng kh&ocirc;ng t?t c&oacute; th? khi?n b?n b? qua vi?c th??ng l??ng v?i ng??i b&aacute;n ??t v? chi ph&iacute; khi ph?i gia c? m&oacute;ng tr&ecirc;n v&ugrave;ng ??t y?u, ho?c b? qua chi ph&iacute; ??m b?o ch?t l??ng cho c?n nh&agrave; c?a m&igrave;nh nh? chi ph&iacute; thi?t k? v&agrave; gi&aacute;m s&aacute;t. Chi ph&iacute; ?? kh?c ph?c ch?t l??ng k&eacute;m sau khi thi c&ocirc;ng c&oacute; th? chi?m t?&nbsp;<strong>10% - 20%</strong>&nbsp;gi&aacute; tr? c?n nh&agrave; c?a b?n.</p>\n</blockquote>\n\n<blockquote>\n<p><strong>3) N?u b?n kh&ocirc;ng bi?t c&aacute;ch l&agrave;m r&otilde; thi?t k? :&nbsp;</strong>n?u b?n kh&ocirc;ng bi?t c&aacute;ch l&agrave;m r&otilde; thi?t k? ngay t? ban ??u, c&oacute; th? b?n s? ph?i t?n th&ecirc;m t?&nbsp;<strong>10% - 20%</strong>&nbsp;cho chi ph&iacute; thi?t k? v&igrave; vi?c l&agrave;m l?i. Ngo&agrave;i ra, vi?c l&agrave;m l?i thi?t k? c&oacute; th? ?nh h??ng ??n hi?u qu? c&ocirc;ng vi?c c?a ng??i l&agrave;m thi?t k? b?i v&igrave; th?c s? kh&ocirc;ng c&oacute; c&ocirc;ng vi?c g&igrave; ch&aacute;n ng&aacute;n h?n l&agrave; ph?i s?a ?i, s?a l?i m?t s?n ph?m do m&igrave;nh l&agrave;m ra. Ch?a k? c&ograve;n ?nh h??ng ??n quan h? gi?a ch? nh&agrave; v&agrave; b&ecirc;n thi?t k? n?u nh? &yacute; ki?n c?a b?n thay ??i li&ecirc;n t?c. Cho n&ecirc;n, b?n c?n c&oacute; m?t b? th? vi?n m?u nh&agrave; ?? tham kh?o tr??c khi b?t ??u l&agrave;m vi?c v?i thi?t k? v? c?n nh&agrave; c?a m&igrave;nh. Khi ?&oacute;, nh?ng &yacute; t??ng v? c?n nh&agrave; c?a b?n s? tr? n&ecirc;n r&otilde; r&agrave;ng h?n r?t nhi?u.</p>\n</blockquote>\n\n<blockquote>\n<p><strong>4) N?u b?n kh&ocirc;ng bi?t c&aacute;ch ?&aacute;nh gi&aacute; ch?n th?u :</strong>&nbsp;kh&ocirc;ng c&oacute; g&igrave; sai l?m h?n vi?c ch?n ph?i m?t nh&agrave; th?u thi?t k? / thi c&ocirc;ng / gi&aacute;m s&aacute;t t? h?i. K?t qu? c?a vi?c ?&aacute;nh gi&aacute; v&agrave; ch?n th?u sai s? d?n ??n c&ocirc;ng tr&igrave;nh c?a b?n b? ?nh h??ng v? nhi?u kh&iacute;a c?nh nh? ph&aacute;t sinh chi ph&iacute;, ti?n ?? k&eacute;o d&agrave;i, ch?t l??ng kh&ocirc;ng ??m b?o... Vi?c kh?c ph?c nh?ng h? l?y n&agrave;y kh&ocirc;ng bao gi? l&agrave; nh?. Th?m ch&iacute; c&oacute; tr??ng h?p ph?i ti&ecirc;u t?n t?&nbsp;<strong>20% - 30%</strong>gi&aacute; tr? c?n nh&agrave; ?? kh?c ph?c.</p>\n</blockquote>\n\n<blockquote>\n<p><strong>5) N?u b?n kh&ocirc;ng bi?t l&agrave;m r&otilde; h?p ??ng :</strong>&nbsp;n?u b?n kh&ocirc;ng bi?t c&aacute;ch l&agrave;m r&otilde; h?p ??ng, ch?c ch?n khi c&oacute; s? c? ho?c khi nh&agrave; th?u c? &yacute; &quot;l&agrave;m m&igrave;nh l&agrave;m m?y&quot; th&igrave; b?n s? l&agrave; ng??i ch?u thi?t. B?n s? l&agrave;m g&igrave; n?u nh&agrave; th?u l&agrave;m ch?m ti?n ?? m&agrave; trong th?a thu?n th&igrave; ch?ng c&oacute; ?i?u ki?n g&igrave; ?? r&agrave;ng bu?c ? B?n s? l&agrave;m g&igrave; n?u b?n mu?n ng?ng h?p ??ng v&igrave; nh&agrave; th?u l&agrave;m vi?c kh&ocirc;ng ??m b?o ch?t l??ng ? Ch?c ch?n nh?ng tr??ng h?p ?&oacute; s? l&agrave;m m?t m?i c? ?&ocirc;i b&ecirc;n n?u kh&ocirc;ng ???c quy ??nh tr??c, ??ng th?i b?n c&ograve;n ph?i ch?u thi?t v? ti?n b?c, th?i gian n?u kh&ocirc;ng chu?n b? k? c&agrave;ng.</p>\n</blockquote>\n\n<blockquote><strong>6) N?u b?n kh&ocirc;ng bi?t nh?ng kh&acirc;u quan tr?ng c?n ph?i ki?m tra :&nbsp;</strong>c&oacute; th? nh&agrave; th?u / gi&aacute;m s&aacute;t s? qua m?t b?n, v&igrave; ??n gi?n ch? l&agrave; b?n kh&ocirc;ng bi?t. Ho?c s? s? s&oacute;t, thi?u c?n tr?ng c?a nh&agrave; th?u / gi&aacute;m s&aacute;t c&oacute; th? l&agrave;m ?nh h??ng ??n ch?t l??ng c&ocirc;ng tr&igrave;nh n?u b? qua m?t v&agrave;i kh&acirc;u quan tr?ng. Vi?c b?n bi?t nh?ng kh&acirc;u quan tr?ng c?n ki?m tra khi?n cho nh&agrave; th?u / gi&aacute;m s&aacute;t ph?i n? b?n h?n v&agrave; ph?i k? l??ng h?n trong to&agrave;n b? c&ocirc;ng tr&igrave;nh. ?i?u ?&oacute; gi&uacute;p cho c&ocirc;ng tr&igrave;nh c?a b?n ch?c ch?n &iacute;t sai s&oacute;t h?n v&agrave; ch?t l??ng ??m b?o h?n.</blockquote>\n\n<blockquote><strong>7) N?u b?n kh&ocirc;ng bi?t v? nh?ng quy ??nh khi x&acirc;y nh&agrave; :</strong>&nbsp;c&oacute; th? b?n s? ph?i chi ti&ecirc;u nhi?u h?n cho vi?c x&acirc;y nh&agrave; c?a m&igrave;nh trong tr??ng h?p l? nh? b?n x&acirc;y nh&agrave; b? kh&aacute;c v?i gi?y ph&eacute;p ???c c?p. C&oacute; nhi?u tr??ng h?p, th?m ch&iacute; nh&agrave; th?u c?ng kh&ocirc;ng n?m r&otilde; lu?t quy ??nh v? vi?c x&acirc;y d?ng kh&aacute;c v?i gi?y ph&eacute;p. Trong m?t s? tr??ng h?p b?n b? ph?t h&agrave;nh ch&iacute;nh, ph?i ph&aacute; d? ph?n x&acirc;y tr&aacute;i ph&eacute;p ; m?t s? tr??ng h?p kh&aacute;c b?n ch? b? ph?t h&agrave;nh ch&iacute;nh m&agrave; kh&ocirc;ng c?n ph&aacute; d? ; th?m ch&iacute; c&oacute; c? tr??ng h?p m?c d&ugrave; x&acirc;y sai ph&eacute;p nh?ng b?n kh&ocirc;ng b? ph?t c?ng kh&ocirc;ng b? ph&aacute; d?. T?t c? nh?ng ?i?u ?&oacute; ??u c&oacute; quy ??nh r?t r&otilde;, nh?ng n?u nh? b?n kh&ocirc;ng n?m b?t th&igrave; d? nhi&ecirc;n b?n s? ph?i ch?u thi?t th&ograve;i v? ph?n m&igrave;nh r?i.</blockquote>\n","","","","","154","1","","","","","1");
INSERT INTO tn_pages VALUES("6","","Tin t?c","tin-tuc","","","","","","190","1","","","","","0");
INSERT INTO tn_pages VALUES("7","","","lien-he","<p><iframe frameborder=\"0\" height=\"450\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6592.660851715465!2d106.6146472899516!3d10.732971854713854!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752dc334067e89%3A0x48f1936395b3114b!2zMzYvMjcvNjEgQsO5aSBUxrAgVG_DoG4sIEFuIEzhuqFjLCBCw6xuaCBUw6JuLCBI4buTIENow60gTWluaCwgVmlldG5hbQ!5e0!3m2!1sen!2s!4v1490523632330\" style=\"border:0\" width=\"100%\"></iframe></p>\n","","","","","167","2","","1","","2018-05-07 22:32:08","1");
INSERT INTO tn_pages VALUES("8","","Trang chu","home","","","","","","946","","","","","","1");
INSERT INTO tn_pages VALUES("9","0","Tin tuc detail","tin-tuc-detail","","","","","","159","3","","","","","1");
INSERT INTO tn_pages VALUES("10","","contruction-detail","contruction-detail","","","","","/web/uploads/images/received_1559098641017329.jpeg","281","3","","","","","1");
INSERT INTO tn_pages VALUES("11","","Dich vu","dich-vu","","","","","","42","3","","","","","1");
INSERT INTO tn_pages VALUES("12","","","user-dang-ky-thanh-cong","<p>&nbsp;</p>\n\n<p>Ch&uacute;c m?ng b?n&nbsp;?&atilde;&nbsp;??ng k&yacute; th&agrave;nh c&ocirc;ng, m?t email k&iacute;ch ho?t&nbsp;?&atilde; g?i v&agrave;o t&agrave;i kho?n c?a b?n.</p>\n\n<p>Vui l&ograve;ng ki?m tra v&agrave; l&agrave;m theo h??ng d?n&nbsp;?? k&iacute;ch ho?t t&agrave;i kho?n c?a b?n. Xin c?m&nbsp;?n !</p>\n","","","","","","","","","","","1");
INSERT INTO tn_pages VALUES("13","","register company","register-company","","","","","","","","","1","","2018-05-07 22:32:46","1");
INSERT INTO tn_pages VALUES("14","0","blog-detail","blog-detail","","","","","","","","1","1","2018-04-30 23:47:14","2018-05-07 22:33:09","1");
INSERT INTO tn_pages VALUES("15","","candidate-detail","candidate-detail","","","","","","","","1","1","2018-04-30 23:47:33","2018-04-30 23:47:33","1");
INSERT INTO tn_pages VALUES("16","","register-company","register-company","","","","","","","","1","1","2018-04-30 23:47:48","2018-04-30 23:47:48","1");
INSERT INTO tn_pages VALUES("17","","jobs-detail","jobs-detail","","","","","","","","1","1","2018-04-30 23:48:09","2018-04-30 23:48:09","1");
INSERT INTO tn_pages VALUES("18","","register-candidate","register-candidate","","","","","","","","1","1","2018-04-30 23:48:26","2018-04-30 23:48:26","1");
INSERT INTO tn_pages VALUES("19","","forgot-password","forgot-password","","","","","","","","1","1","2018-04-30 23:49:06","2018-04-30 23:49:06","1");
INSERT INTO tn_pages VALUES("20","","forgot-password-success","forgot-password-success","","","","","","","","1","1","2018-04-30 23:49:32","2018-04-30 23:49:32","1");
INSERT INTO tn_pages VALUES("21","","update-candidate","update-candidate","","","","","","","","1","1","2018-04-30 23:49:52","2018-04-30 23:49:52","1");
INSERT INTO tn_pages VALUES("22","","change-password","change-password","","","","","","","","1","1","2018-04-30 23:50:08","2018-04-30 23:50:08","1");
INSERT INTO tn_pages VALUES("23","","candidate","candidate","","","","","","","","1","1","2018-04-30 23:50:18","2018-04-30 23:50:18","1");
INSERT INTO tn_pages VALUES("24","","user-dang-ky-thanh-cong","user-dang-ky-thanh-cong","","","","","","","","1","1","2018-04-30 23:50:40","2018-04-30 23:50:40","1");
INSERT INTO tn_pages VALUES("25","","blog","blog","","","","","","","","1","1","2018-04-30 23:50:51","2018-04-30 23:50:51","1");
INSERT INTO tn_pages VALUES("26","","jobs","jobs","","","","","","","","1","1","2018-04-30 23:51:05","2018-04-30 23:51:05","1");
INSERT INTO tn_pages VALUES("27","","reset-password","reset-password","","","","","","","","1","1","2018-04-30 23:51:25","2018-04-30 23:51:25","1");
INSERT INTO tn_pages VALUES("28","","profile-contact","profile-contact","","","","","","","","1","1","2018-04-30 23:51:39","2018-04-30 23:51:39","1");
INSERT INTO tn_pages VALUES("29","","search","search","","","","","","","","1","1","2018-04-30 23:51:49","2018-04-30 23:51:49","1");
INSERT INTO tn_pages VALUES("30","","policy","policy","","","","","","","","1","1","2018-04-30 23:52:03","2018-04-30 23:52:03","1");
INSERT INTO tn_pages VALUES("31","","register-company","register-company","","","","","","","","1","1","2018-04-30 23:52:16","2018-04-30 23:52:16","1");
INSERT INTO tn_pages VALUES("32","","user-dang-ky-thanh-cong","user-dang-ky-thanh-cong","","","","","","","","1","1","2018-04-30 23:52:33","2018-04-30 23:52:33","1");
INSERT INTO tn_pages VALUES("33","","profile-user","profile-user","","","","","","","","1","1","2018-04-30 23:52:46","2018-04-30 23:52:46","1");
INSERT INTO tn_pages VALUES("34","","job-seekers-html","job-seekers-html","","","","","","","","1","1","2018-04-30 23:53:12","2018-04-30 23:53:12","1");



DROP TABLE tn_post;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tn_post VALUES("1","1","","Ban-se-quyet-dinh-tuong-lai-cua-ban-nhu-the-nao-","","<div class=\"td-post-content\" style=\"box-sizing: border-box; font-size: 17px; line-height: 20px; margin-top: 21px; padding-bottom: 16px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">\n<p><em><strong>T??ng lai&nbsp;</strong></em>l&agrave; n?i b?n mu?n h??ng t?i v? sau n&agrave;y, ai c?ng mu?n c&oacute; m?t t??ng lai t?t ??p. Nhi?u b?n t? l&uacute;c c&ograve;n r?t tr? ?&atilde; suy ngh? r?t nhi?u v? cu?c s?ng c?a m&igrave;nh. B?n ph?i bi?t l&agrave; ch&iacute;nh nh?ng suy ngh? h&agrave;nh ??ng c?a b?n m?i quy?t ??nh cho b?n. D??i ?&acirc;y l&agrave; v&agrave;i lu?n ?i?m ?? xem b?n s? quy?t ??nh t??ng lai b?n ra sao.</p>\n\n<h3><strong>D?y th?t s?m</strong></h3>\n\n<p>D?y th?t s?m, v&iacute; d? nh? tr??c l&uacute;c m?t tr?i m?c, s? l&agrave; c&aacute;ch kh?i ??u ng&agrave;y m?i ?? l&agrave;m vi?c v&agrave; h?c h&agrave;nh t?t nh?t. Vi?c d?y l&uacute;c 5 gi? s&aacute;ng, khi m?i ng??i v?n ?ang ch&igrave;m v&agrave;o gi?c ng? l&agrave; s? kh?i ??u ho&agrave;n h?o trong s? y&ecirc;n t?nh, m?c d&ugrave; ?&acirc;y l&agrave; m?t th&aacute;ch th?c kh&ocirc;ng nh?&nbsp;nh?ng ch&uacute;ng ta s? l&agrave;m ???c n?u quy?t t&acirc;m v&agrave; t?o l?p th&agrave;nh th&oacute;i quen. T??ng lai c?a b?n c?ng ??n t? nh?ng th? nh? nh?t nh? v?y. B?n n&ecirc;n thay ??i t? b&acirc;y gi?, h&atilde;y b? th&oacute;i quen th?c khuya v&agrave; d?y mu?n nh&eacute;.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Blogs/ngu-day-som.jpg\" style=\"height:413px; width:660px\" /></p>\n\n<h3><strong>L&agrave;m vi?c mang t&iacute;nh s&aacute;ng t?o</strong></h3>\n\n<p>Ai c?ng mu?n l&agrave;m g&igrave; ?&oacute; s&aacute;ng t?o cho cu?c s?ng c?a h?, nh?ng &iacute;t ng??i c&oacute; th? th?c hi?n ???c v&igrave; h? s? th?t b?i. B?n c?n h?c s? ki&ecirc;n nh?n c?ng nh? c?n th?i gian cho m?i s? s&aacute;ng t?o c?a b?n. Nh? v?y s? ?em l?i nhi?u l?i &iacute;ch cho c? th? ch?t l?n t&acirc;m h?n.&nbsp;??c bi?t, trong kinh doanh th&igrave; s? s&aacute;ng t?o s? gi&uacute;p b?n t?o n&ecirc;n s? kh&aacute;c bi?t cho doanh nghi?p&nbsp;c?a m&igrave;nh. ?i?u n&agrave;y quy?t ??nh m?c ??&nbsp;th&agrave;nh c&ocirc;ng c?a m?t doanh nghi?p.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Blogs/sang-tao.jpg\" /></p>\n\n<h3><strong>Ki?m so&aacute;t t&agrave;i ch&iacute;nh</strong></h3>\n\n<p>L&agrave; m?t ng??i tr??ng th&agrave;nh mai sau b?n s? c?ng ph?i bi?t ??n vi?c qu?n l&yacute; t&agrave;i ch&iacute;nh c?a m&igrave;nh. B?n h&atilde;y xem l?i nh?ng chi ti&ecirc;u c?a b?n t? nh?ng th? nh? nh?t. H&atilde;y t&iacute;nh to&aacute;n m?t c&aacute;ch c?n th?n v? chi ti&ecirc;u c?a m&igrave;nh trong v&agrave;i th&aacute;ng li&ecirc;n ti?p. Nh?ng c?ng ??ng qu&aacute; kh?t khe v? t&agrave;i ch&iacute;nh, n?u b?n ch?t ch? qu&aacute; c?ng kh&ocirc;ng t?t cho b?n. V&agrave; ch?c h?n b?n c?ng s? ng?c nhi&ecirc;n v? s? ti?n c?a m&igrave;nh sau khi chi ti&ecirc;u h?p l&yacute;. V&igrave; v?y t??ng lai c?a b?n c?ng s? ph? thu?c v&agrave;o v?n ?? t&agrave;i ch&iacute;nh.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Blogs/tai-chinh.jpg\" style=\"height:427px; width:640px\" /></p>\n\n<h3><strong>T?p n&oacute;i tr??c ?&aacute;m ?&ocirc;ng&nbsp;</strong></h3>\n\n<p>Vi?c n&agrave;y ??i v?i nhi?u ng??i l&agrave; m?t c?c h&igrave;nh, v&agrave; trong ??i s?ng s? c&oacute; l&uacute;c ch&uacute;ng ta ph?i n&oacute;i tr??c ?&aacute;m ?&ocirc;ng nh? v?y. Tuy nhi&ecirc;n ?&acirc;y l&agrave; c&aacute;ch hay ?? khi?n ch&uacute;ng ta n?i b?t trong ?&aacute;m ?&ocirc;ng. M?t ng??i c&oacute; kh? n?ng n&oacute;i gi?i lu&ocirc;n ??t ???c nh?ng th&agrave;nh c&ocirc;ng nh?t ??nh trong cu?c s?ng. H&atilde;y t?p luy?n thuy?t tr&igrave;nh tr??c g??ng, sau ?&oacute; ? nh&oacute;m nh? v&agrave; nh&oacute;m l?n h?n.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Blogs/noi-truoc-dam-dong.jpg\" style=\"height:337px; width:600px\" /></p>\n\n<h3><strong>Ch? ?n nh?ng th? t?t cho s?c kh?e</strong></h3>\n\n<p>M?t khi ?&atilde; ki?m so&aacute;t ???c nh?ng th? m&igrave;nh ?n, h&atilde;y ?n nh?ng th? th?c s? c&oacute; l?i cho s?c kh?e, n&oacute; s? thay ??i cu?c s?ng c?a b?n m&atilde;i m&atilde;i. H&atilde;y t? chu?n b? m&oacute;n ?n, ?n nh?ng th?c ph?m h?u c? c&agrave;ng nhi?u c&agrave;ng t?t, tuy n&oacute; ??t ??y nh?ng n&oacute; s? r? h?n chi ph&iacute; ch?a b?nh sau n&agrave;y. Kh&ocirc;ng n&ecirc;n ?n nhi?u th?t m?, ?n nhi?u rau v&agrave; ch?t x?. Tuy ?i?u n&agrave;y r?t kh&oacute;, m?t th?i gian v&agrave; h?i ??t ??, c&oacute; th? v? s? kh&ocirc;ng ngon nh? nh?ng th?c ?n nhi?u ch?t b&eacute;o, nh?ng n&oacute; s? x?ng ?&aacute;ng v?i nh?ng c&ocirc;ng s?c m&agrave; ch&uacute;ng ta b? ra. B?n s? c?m th?y t?t h?n kh&ocirc;ng ch? v? th? ch?t, m&agrave; c&ograve;n v? t&acirc;m h?n.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Blogs/rau-cu.jpg\" style=\"height:435px; width:600px\" /></p>\n\n<h3><strong>C?t ?i?n tho?i v&agrave;o t&uacute;i</strong></h3>\n\n<p>Trong m?t ng&agrave;y th?i gian b?n d&ugrave;ng chi?m kho?ng bao l&acirc;u? M?i l?n b?n l&ocirc;i ra l&ocirc;i v&agrave;o m? m&agrave;n h&igrave;nh, b?n c&oacute; nh? s? l?n kh&ocirc;ng? N?u c&acirc;u tr? l?i c?a b?n l&agrave; &rdquo; kh&ocirc;ng ??m ???c&rdquo;, b?n h&atilde;y ng?ng vi?c n&agrave;y l?i. B?n h&atilde;y t?p d&acirc;n th&oacute;i quen h?n ch? d&ugrave;ng ?i?n tho?i. C&aacute;c nh&agrave; nghi&ecirc;n c?u ?&atilde; cho r?ng n?u b?n c?t ?i?n tho?i ?i v&agrave; l&agrave;m vi?c tr&iacute; &oacute;c. B?n s? ???c ph&aacute;t tri?n r?t nhi?u kh&ocirc;ng ph? thu?c qu&aacute; nhi?u v&agrave;o ?i?n tho?i. M?t kh&aacute;c khi b?n ?i n&oacute;i chuy?n v?i nh?ng ng??i b?n kh&aacute;c. C?t ?i?n tho?i ?i ???c xem l&agrave; ?ng x? l?ch s?.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/web/uploads/images/Blogs/phone.jpg\" style=\"height:393px; width:700px\" /></p>\n\n<p><strong><em>Tr&ecirc;n ?&acirc;y l&agrave; nh?ng lu?n ?i?m c?a m&igrave;nh, b?n c&oacute; th? tham kh?o ?? c&oacute; th? ph&aacute;t tri?n t??ng lai c?a m&igrave;nh. T??ng lai b?n n?m trong ch&iacute;nh s? h&agrave;nh ??ng c?ng nh? suy ngh? c?a b?n.</em></strong></p>\n\n<p style=\"text-align:right\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ngu?n: S?u T?m</p>\n</div>\n","/web/uploads/images/Blogs/ngu-day-som.jpg","","1","1","2018-04-30 23:16:20","1","2018-06-11 21:57:18","1","1");
INSERT INTO tn_post VALUES("2","1","","Con-duong-phat-trien-su-nghiep-career-path-cho-developer","","","","","","91","2018-05-17 23:04:12","91","2018-05-17 23:08:30","","0");



DROP TABLE tn_post_category;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO tn_post_category VALUES("1","0","jobsvina.com","jobsvina-com","","","","1","1");



DROP TABLE tn_product;

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




DROP TABLE tn_product_category;

CREATE TABLE `tn_product_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `arranged` int(5) DEFAULT NULL,
  `status` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tn_product_category VALUES("1","0","Laptop","","","","0");
INSERT INTO tn_product_category VALUES("2","0","Desktop","","","2","0");



DROP TABLE tn_setting;

CREATE TABLE `tn_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(55) NOT NULL,
  `value` varchar(55) DEFAULT NULL,
  `default` varchar(55) DEFAULT NULL,
  `sorted` int(11) DEFAULT '1',
  `input` enum('text','password','submit','reset','radio','checkbox','number','email','select','textarea','image') DEFAULT 'text',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO tn_setting VALUES("1","Phone number","phone","0908300383","","3","text");
INSERT INTO tn_setting VALUES("2","Logo","logo","/web/uploads/images/site/logo.png","","2","image");
INSERT INTO tn_setting VALUES("3","Site name","site_name","Ta co","Tona Site","1","text");
INSERT INTO tn_setting VALUES("4","Company name","com_name","","<span>Tona</span> Nguy?n Company Web","1","text");
INSERT INTO tn_setting VALUES("5","Company address","com_address","","","1","text");
INSERT INTO tn_setting VALUES("6","Default pagination","page_size","15","10","1","text");



DROP TABLE tn_system;

CREATE TABLE `tn_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(55) NOT NULL,
  `value` varchar(55) DEFAULT NULL,
  `value_number` int(11) DEFAULT NULL,
  `default` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tn_system VALUES("1","user_online_total","user_online_total","0","10647","0");
INSERT INTO tn_system VALUES("2","user_online_week","user_online_week","0","","0");
INSERT INTO tn_system VALUES("3","user_online_month","user_online_month","0","","0");



DROP TABLE tn_tags;

CREATE TABLE `tn_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO tn_tags VALUES("1","php","php","1");
INSERT INTO tn_tags VALUES("2","html","html","1");
INSERT INTO tn_tags VALUES("3","css","css","1");
INSERT INTO tn_tags VALUES("4","jquery","jquery","1");
INSERT INTO tn_tags VALUES("5","js","js","1");
INSERT INTO tn_tags VALUES("6","tona","","1");
INSERT INTO tn_tags VALUES("7","nguyen","","1");
INSERT INTO tn_tags VALUES("8","van","","1");



DROP TABLE tn_time_zone;

CREATE TABLE `tn_time_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(155) DEFAULT NULL,
  `code` varchar(155) DEFAULT NULL,
  `utc` varchar(15) DEFAULT NULL,
  `sorted` int(11) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=590 DEFAULT CHARSET=utf8;

INSERT INTO tn_time_zone VALUES("1","Africa/Abidjan","Africa/Abidjan","","1","0");
INSERT INTO tn_time_zone VALUES("2","Africa/Accra","Africa/Accra","","1","0");
INSERT INTO tn_time_zone VALUES("3","Africa/Addis_Ababa","Africa/Addis_Ababa","","1","0");
INSERT INTO tn_time_zone VALUES("4","Africa/Algiers","Africa/Algiers","","1","0");
INSERT INTO tn_time_zone VALUES("5","Africa/Asmara","Africa/Asmara","","1","0");
INSERT INTO tn_time_zone VALUES("6","Africa/Asmera","Africa/Asmera","","1","0");
INSERT INTO tn_time_zone VALUES("7","Africa/Bamako","Africa/Bamako","","1","0");
INSERT INTO tn_time_zone VALUES("8","Africa/Bangui","Africa/Bangui","","1","0");
INSERT INTO tn_time_zone VALUES("9","Africa/Banjul","Africa/Banjul","","1","0");
INSERT INTO tn_time_zone VALUES("10","Africa/Bissau","Africa/Bissau","","1","0");
INSERT INTO tn_time_zone VALUES("11","Africa/Blantyre","Africa/Blantyre","","1","0");
INSERT INTO tn_time_zone VALUES("12","Africa/Brazzaville","Africa/Brazzaville","","1","0");
INSERT INTO tn_time_zone VALUES("13","Africa/Bujumbura","Africa/Bujumbura","","1","0");
INSERT INTO tn_time_zone VALUES("14","Africa/Cairo","Africa/Cairo","","1","0");
INSERT INTO tn_time_zone VALUES("15","Africa/Casablanca","Africa/Casablanca","","1","0");
INSERT INTO tn_time_zone VALUES("16","Africa/Ceuta","Africa/Ceuta","","1","0");
INSERT INTO tn_time_zone VALUES("17","Africa/Conakry","Africa/Conakry","","1","0");
INSERT INTO tn_time_zone VALUES("18","Africa/Dakar","Africa/Dakar","","1","0");
INSERT INTO tn_time_zone VALUES("19","Africa/Dar_es_Salaam","Africa/Dar_es_Salaam","","1","0");
INSERT INTO tn_time_zone VALUES("20","Africa/Djibouti","Africa/Djibouti","","1","0");
INSERT INTO tn_time_zone VALUES("21","Africa/Douala","Africa/Douala","","1","0");
INSERT INTO tn_time_zone VALUES("22","Africa/El_Aaiun","Africa/El_Aaiun","","1","0");
INSERT INTO tn_time_zone VALUES("23","Africa/Freetown","Africa/Freetown","","1","0");
INSERT INTO tn_time_zone VALUES("24","Africa/Gaborone","Africa/Gaborone","","1","0");
INSERT INTO tn_time_zone VALUES("25","Africa/Harare","Africa/Harare","","1","0");
INSERT INTO tn_time_zone VALUES("26","Africa/Johannesburg","Africa/Johannesburg","","1","0");
INSERT INTO tn_time_zone VALUES("27","Africa/Juba","Africa/Juba","","1","0");
INSERT INTO tn_time_zone VALUES("28","Africa/Kampala","Africa/Kampala","","1","0");
INSERT INTO tn_time_zone VALUES("29","Africa/Khartoum","Africa/Khartoum","","1","0");
INSERT INTO tn_time_zone VALUES("30","Africa/Kigali","Africa/Kigali","","1","0");
INSERT INTO tn_time_zone VALUES("31","Africa/Kinshasa","Africa/Kinshasa","","1","0");
INSERT INTO tn_time_zone VALUES("32","Africa/Lagos","Africa/Lagos","","1","0");
INSERT INTO tn_time_zone VALUES("33","Africa/Libreville","Africa/Libreville","","1","0");
INSERT INTO tn_time_zone VALUES("34","Africa/Lome","Africa/Lome","","1","0");
INSERT INTO tn_time_zone VALUES("35","Africa/Luanda","Africa/Luanda","","1","0");
INSERT INTO tn_time_zone VALUES("36","Africa/Lubumbashi","Africa/Lubumbashi","","1","0");
INSERT INTO tn_time_zone VALUES("37","Africa/Lusaka","Africa/Lusaka","","1","0");
INSERT INTO tn_time_zone VALUES("38","Africa/Malabo","Africa/Malabo","","1","0");
INSERT INTO tn_time_zone VALUES("39","Africa/Maputo","Africa/Maputo","","1","0");
INSERT INTO tn_time_zone VALUES("40","Africa/Maseru","Africa/Maseru","","1","0");
INSERT INTO tn_time_zone VALUES("41","Africa/Mbabane","Africa/Mbabane","","1","0");
INSERT INTO tn_time_zone VALUES("42","Africa/Mogadishu","Africa/Mogadishu","","1","0");
INSERT INTO tn_time_zone VALUES("43","Africa/Monrovia","Africa/Monrovia","","1","0");
INSERT INTO tn_time_zone VALUES("44","Africa/Nairobi","Africa/Nairobi","","1","0");
INSERT INTO tn_time_zone VALUES("45","Africa/Ndjamena","Africa/Ndjamena","","1","0");
INSERT INTO tn_time_zone VALUES("46","Africa/Niamey","Africa/Niamey","","1","0");
INSERT INTO tn_time_zone VALUES("47","Africa/Nouakchott","Africa/Nouakchott","","1","0");
INSERT INTO tn_time_zone VALUES("48","Africa/Ouagadougou","Africa/Ouagadougou","","1","0");
INSERT INTO tn_time_zone VALUES("49","Africa/Porto-Novo","Africa/Porto-Novo","","1","0");
INSERT INTO tn_time_zone VALUES("50","Africa/Sao_Tome","Africa/Sao_Tome","","1","0");
INSERT INTO tn_time_zone VALUES("51","Africa/Timbuktu","Africa/Timbuktu","","1","0");
INSERT INTO tn_time_zone VALUES("52","Africa/Tripoli","Africa/Tripoli","","1","0");
INSERT INTO tn_time_zone VALUES("53","Africa/Tunis","Africa/Tunis","","1","0");
INSERT INTO tn_time_zone VALUES("54","Africa/Windhoek","Africa/Windhoek","","1","0");
INSERT INTO tn_time_zone VALUES("55","America/Adak","America/Adak","","1","0");
INSERT INTO tn_time_zone VALUES("56","America/Anchorage","America/Anchorage","","1","0");
INSERT INTO tn_time_zone VALUES("57","America/Anguilla","America/Anguilla","","1","0");
INSERT INTO tn_time_zone VALUES("58","America/Antigua","America/Antigua","","1","0");
INSERT INTO tn_time_zone VALUES("59","America/Araguaina","America/Araguaina","","1","0");
INSERT INTO tn_time_zone VALUES("60","America/Argentina/Buenos_Aires","America/Argentina/Buenos_Aires","","1","0");
INSERT INTO tn_time_zone VALUES("61","America/Argentina/Catamarca","America/Argentina/Catamarca","","1","0");
INSERT INTO tn_time_zone VALUES("62","America/Argentina/ComodRivadavia","America/Argentina/ComodRivadavia","","1","0");
INSERT INTO tn_time_zone VALUES("63","America/Argentina/Cordoba","America/Argentina/Cordoba","","1","0");
INSERT INTO tn_time_zone VALUES("64","America/Argentina/Jujuy","America/Argentina/Jujuy","","1","0");
INSERT INTO tn_time_zone VALUES("65","America/Argentina/La_Rioja","America/Argentina/La_Rioja","","1","0");
INSERT INTO tn_time_zone VALUES("66","America/Argentina/Mendoza","America/Argentina/Mendoza","","1","0");
INSERT INTO tn_time_zone VALUES("67","America/Argentina/Rio_Gallegos","America/Argentina/Rio_Gallegos","","1","0");
INSERT INTO tn_time_zone VALUES("68","America/Argentina/Salta","America/Argentina/Salta","","1","0");
INSERT INTO tn_time_zone VALUES("69","America/Argentina/San_Juan","America/Argentina/San_Juan","","1","0");
INSERT INTO tn_time_zone VALUES("70","America/Argentina/San_Luis","America/Argentina/San_Luis","","1","0");
INSERT INTO tn_time_zone VALUES("71","America/Argentina/Tucuman","America/Argentina/Tucuman","","1","0");
INSERT INTO tn_time_zone VALUES("72","America/Argentina/Ushuaia","America/Argentina/Ushuaia","","1","0");
INSERT INTO tn_time_zone VALUES("73","America/Aruba","America/Aruba","","1","0");
INSERT INTO tn_time_zone VALUES("74","America/Asuncion","America/Asuncion","","1","0");
INSERT INTO tn_time_zone VALUES("75","America/Atikokan","America/Atikokan","","1","0");
INSERT INTO tn_time_zone VALUES("76","America/Atka","America/Atka","","1","0");
INSERT INTO tn_time_zone VALUES("77","America/Bahia","America/Bahia","","1","0");
INSERT INTO tn_time_zone VALUES("78","America/Bahia_Banderas","America/Bahia_Banderas","","1","0");
INSERT INTO tn_time_zone VALUES("79","America/Barbados","America/Barbados","","1","0");
INSERT INTO tn_time_zone VALUES("80","America/Belem","America/Belem","","1","0");
INSERT INTO tn_time_zone VALUES("81","America/Belize","America/Belize","","1","0");
INSERT INTO tn_time_zone VALUES("82","America/Blanc-Sablon","America/Blanc-Sablon","","1","0");
INSERT INTO tn_time_zone VALUES("83","America/Boa_Vista","America/Boa_Vista","","1","0");
INSERT INTO tn_time_zone VALUES("84","America/Bogota","America/Bogota","","1","0");
INSERT INTO tn_time_zone VALUES("85","America/Boise","America/Boise","","1","0");
INSERT INTO tn_time_zone VALUES("86","America/Buenos_Aires","America/Buenos_Aires","","1","0");
INSERT INTO tn_time_zone VALUES("87","America/Cambridge_Bay","America/Cambridge_Bay","","1","0");
INSERT INTO tn_time_zone VALUES("88","America/Campo_Grande","America/Campo_Grande","","1","0");
INSERT INTO tn_time_zone VALUES("89","America/Cancun","America/Cancun","","1","0");
INSERT INTO tn_time_zone VALUES("90","America/Caracas","America/Caracas","","1","0");
INSERT INTO tn_time_zone VALUES("91","America/Catamarca","America/Catamarca","","1","0");
INSERT INTO tn_time_zone VALUES("92","America/Cayenne","America/Cayenne","","1","0");
INSERT INTO tn_time_zone VALUES("93","America/Cayman","America/Cayman","","1","0");
INSERT INTO tn_time_zone VALUES("94","America/Chicago","America/Chicago","","1","0");
INSERT INTO tn_time_zone VALUES("95","America/Chihuahua","America/Chihuahua","","1","0");
INSERT INTO tn_time_zone VALUES("96","America/Coral_Harbour","America/Coral_Harbour","","1","0");
INSERT INTO tn_time_zone VALUES("97","America/Cordoba","America/Cordoba","","1","0");
INSERT INTO tn_time_zone VALUES("98","America/Costa_Rica","America/Costa_Rica","","1","0");
INSERT INTO tn_time_zone VALUES("99","America/Creston","America/Creston","","1","0");
INSERT INTO tn_time_zone VALUES("100","America/Cuiaba","America/Cuiaba","","1","0");
INSERT INTO tn_time_zone VALUES("101","America/Curacao","America/Curacao","","1","0");
INSERT INTO tn_time_zone VALUES("102","America/Danmarkshavn","America/Danmarkshavn","","1","0");
INSERT INTO tn_time_zone VALUES("103","America/Dawson","America/Dawson","","1","0");
INSERT INTO tn_time_zone VALUES("104","America/Dawson_Creek","America/Dawson_Creek","","1","0");
INSERT INTO tn_time_zone VALUES("105","America/Denver","America/Denver","","1","0");
INSERT INTO tn_time_zone VALUES("106","America/Detroit","America/Detroit","","1","0");
INSERT INTO tn_time_zone VALUES("107","America/Dominica","America/Dominica","","1","0");
INSERT INTO tn_time_zone VALUES("108","America/Edmonton","America/Edmonton","","1","0");
INSERT INTO tn_time_zone VALUES("109","America/Eirunepe","America/Eirunepe","","1","0");
INSERT INTO tn_time_zone VALUES("110","America/El_Salvador","America/El_Salvador","","1","0");
INSERT INTO tn_time_zone VALUES("111","America/Ensenada","America/Ensenada","","1","0");
INSERT INTO tn_time_zone VALUES("112","America/Fort_Nelson","America/Fort_Nelson","","1","0");
INSERT INTO tn_time_zone VALUES("113","America/Fort_Wayne","America/Fort_Wayne","","1","0");
INSERT INTO tn_time_zone VALUES("114","America/Fortaleza","America/Fortaleza","","1","0");
INSERT INTO tn_time_zone VALUES("115","America/Glace_Bay","America/Glace_Bay","","1","0");
INSERT INTO tn_time_zone VALUES("116","America/Godthab","America/Godthab","","1","0");
INSERT INTO tn_time_zone VALUES("117","America/Goose_Bay","America/Goose_Bay","","1","0");
INSERT INTO tn_time_zone VALUES("118","America/Grand_Turk","America/Grand_Turk","","1","0");
INSERT INTO tn_time_zone VALUES("119","America/Grenada","America/Grenada","","1","0");
INSERT INTO tn_time_zone VALUES("120","America/Guadeloupe","America/Guadeloupe","","1","0");
INSERT INTO tn_time_zone VALUES("121","America/Guatemala","America/Guatemala","","1","0");
INSERT INTO tn_time_zone VALUES("122","America/Guayaquil","America/Guayaquil","","1","0");
INSERT INTO tn_time_zone VALUES("123","America/Guyana","America/Guyana","","1","0");
INSERT INTO tn_time_zone VALUES("124","America/Halifax","America/Halifax","","1","0");
INSERT INTO tn_time_zone VALUES("125","America/Havana","America/Havana","","1","0");
INSERT INTO tn_time_zone VALUES("126","America/Hermosillo","America/Hermosillo","","1","0");
INSERT INTO tn_time_zone VALUES("127","America/Indiana/Indianapolis","America/Indiana/Indianapolis","","1","0");
INSERT INTO tn_time_zone VALUES("128","America/Indiana/Knox","America/Indiana/Knox","","1","0");
INSERT INTO tn_time_zone VALUES("129","America/Indiana/Marengo","America/Indiana/Marengo","","1","0");
INSERT INTO tn_time_zone VALUES("130","America/Indiana/Petersburg","America/Indiana/Petersburg","","1","0");
INSERT INTO tn_time_zone VALUES("131","America/Indiana/Tell_City","America/Indiana/Tell_City","","1","0");
INSERT INTO tn_time_zone VALUES("132","America/Indiana/Vevay","America/Indiana/Vevay","","1","0");
INSERT INTO tn_time_zone VALUES("133","America/Indiana/Vincennes","America/Indiana/Vincennes","","1","0");
INSERT INTO tn_time_zone VALUES("134","America/Indiana/Winamac","America/Indiana/Winamac","","1","0");
INSERT INTO tn_time_zone VALUES("135","America/Indianapolis","America/Indianapolis","","1","0");
INSERT INTO tn_time_zone VALUES("136","America/Inuvik","America/Inuvik","","1","0");
INSERT INTO tn_time_zone VALUES("137","America/Iqaluit","America/Iqaluit","","1","0");
INSERT INTO tn_time_zone VALUES("138","America/Jamaica","America/Jamaica","","1","0");
INSERT INTO tn_time_zone VALUES("139","America/Jujuy","America/Jujuy","","1","0");
INSERT INTO tn_time_zone VALUES("140","America/Juneau","America/Juneau","","1","0");
INSERT INTO tn_time_zone VALUES("141","America/Kentucky/Louisville","America/Kentucky/Louisville","","1","0");
INSERT INTO tn_time_zone VALUES("142","America/Kentucky/Monticello","America/Kentucky/Monticello","","1","0");
INSERT INTO tn_time_zone VALUES("143","America/Knox_IN","America/Knox_IN","","1","0");
INSERT INTO tn_time_zone VALUES("144","America/Kralendijk","America/Kralendijk","","1","0");
INSERT INTO tn_time_zone VALUES("145","America/La_Paz","America/La_Paz","","1","0");
INSERT INTO tn_time_zone VALUES("146","America/Lima","America/Lima","","1","0");
INSERT INTO tn_time_zone VALUES("147","America/Los_Angeles","America/Los_Angeles","","1","0");
INSERT INTO tn_time_zone VALUES("148","America/Louisville","America/Louisville","","1","0");
INSERT INTO tn_time_zone VALUES("149","America/Lower_Princes","America/Lower_Princes","","1","0");
INSERT INTO tn_time_zone VALUES("150","America/Maceio","America/Maceio","","1","0");
INSERT INTO tn_time_zone VALUES("151","America/Managua","America/Managua","","1","0");
INSERT INTO tn_time_zone VALUES("152","America/Manaus","America/Manaus","","1","0");
INSERT INTO tn_time_zone VALUES("153","America/Marigot","America/Marigot","","1","0");
INSERT INTO tn_time_zone VALUES("154","America/Martinique","America/Martinique","","1","0");
INSERT INTO tn_time_zone VALUES("155","America/Matamoros","America/Matamoros","","1","0");
INSERT INTO tn_time_zone VALUES("156","America/Mazatlan","America/Mazatlan","","1","0");
INSERT INTO tn_time_zone VALUES("157","America/Mendoza","America/Mendoza","","1","0");
INSERT INTO tn_time_zone VALUES("158","America/Menominee","America/Menominee","","1","0");
INSERT INTO tn_time_zone VALUES("159","America/Merida","America/Merida","","1","0");
INSERT INTO tn_time_zone VALUES("160","America/Metlakatla","America/Metlakatla","","1","0");
INSERT INTO tn_time_zone VALUES("161","America/Mexico_City","America/Mexico_City","","1","0");
INSERT INTO tn_time_zone VALUES("162","America/Miquelon","America/Miquelon","","1","0");
INSERT INTO tn_time_zone VALUES("163","America/Moncton","America/Moncton","","1","0");
INSERT INTO tn_time_zone VALUES("164","America/Monterrey","America/Monterrey","","1","0");
INSERT INTO tn_time_zone VALUES("165","America/Montevideo","America/Montevideo","","1","0");
INSERT INTO tn_time_zone VALUES("166","America/Montreal","America/Montreal","","1","0");
INSERT INTO tn_time_zone VALUES("167","America/Montserrat","America/Montserrat","","1","0");
INSERT INTO tn_time_zone VALUES("168","America/Nassau","America/Nassau","","1","0");
INSERT INTO tn_time_zone VALUES("169","America/New_York","America/New_York","","1","0");
INSERT INTO tn_time_zone VALUES("170","America/Nipigon","America/Nipigon","","1","0");
INSERT INTO tn_time_zone VALUES("171","America/Nome","America/Nome","","1","0");
INSERT INTO tn_time_zone VALUES("172","America/Noronha","America/Noronha","","1","0");
INSERT INTO tn_time_zone VALUES("173","America/North_Dakota/Beulah","America/North_Dakota/Beulah","","1","0");
INSERT INTO tn_time_zone VALUES("174","America/North_Dakota/Center","America/North_Dakota/Center","","1","0");
INSERT INTO tn_time_zone VALUES("175","America/North_Dakota/New_Salem","America/North_Dakota/New_Salem","","1","0");
INSERT INTO tn_time_zone VALUES("176","America/Ojinaga","America/Ojinaga","","1","0");
INSERT INTO tn_time_zone VALUES("177","America/Panama","America/Panama","","1","0");
INSERT INTO tn_time_zone VALUES("178","America/Pangnirtung","America/Pangnirtung","","1","0");
INSERT INTO tn_time_zone VALUES("179","America/Paramaribo","America/Paramaribo","","1","0");
INSERT INTO tn_time_zone VALUES("180","America/Phoenix","America/Phoenix","","1","0");
INSERT INTO tn_time_zone VALUES("181","America/Port-au-Prince","America/Port-au-Prince","","1","0");
INSERT INTO tn_time_zone VALUES("182","America/Port_of_Spain","America/Port_of_Spain","","1","0");
INSERT INTO tn_time_zone VALUES("183","America/Porto_Acre","America/Porto_Acre","","1","0");
INSERT INTO tn_time_zone VALUES("184","America/Porto_Velho","America/Porto_Velho","","1","0");
INSERT INTO tn_time_zone VALUES("185","America/Puerto_Rico","America/Puerto_Rico","","1","0");
INSERT INTO tn_time_zone VALUES("186","America/Rainy_River","America/Rainy_River","","1","0");
INSERT INTO tn_time_zone VALUES("187","America/Rankin_Inlet","America/Rankin_Inlet","","1","0");
INSERT INTO tn_time_zone VALUES("188","America/Recife","America/Recife","","1","0");
INSERT INTO tn_time_zone VALUES("189","America/Regina","America/Regina","","1","0");
INSERT INTO tn_time_zone VALUES("190","America/Resolute","America/Resolute","","1","0");
INSERT INTO tn_time_zone VALUES("191","America/Rio_Branco","America/Rio_Branco","","1","0");
INSERT INTO tn_time_zone VALUES("192","America/Rosario","America/Rosario","","1","0");
INSERT INTO tn_time_zone VALUES("193","America/Santa_Isabel","America/Santa_Isabel","","1","0");
INSERT INTO tn_time_zone VALUES("194","America/Santarem","America/Santarem","","1","0");
INSERT INTO tn_time_zone VALUES("195","America/Santiago","America/Santiago","","1","0");
INSERT INTO tn_time_zone VALUES("196","America/Santo_Domingo","America/Santo_Domingo","","1","0");
INSERT INTO tn_time_zone VALUES("197","America/Sao_Paulo","America/Sao_Paulo","","1","0");
INSERT INTO tn_time_zone VALUES("198","America/Scoresbysund","America/Scoresbysund","","1","0");
INSERT INTO tn_time_zone VALUES("199","America/Shiprock","America/Shiprock","","1","0");
INSERT INTO tn_time_zone VALUES("200","America/Sitka","America/Sitka","","1","0");
INSERT INTO tn_time_zone VALUES("201","America/St_Barthelemy","America/St_Barthelemy","","1","0");
INSERT INTO tn_time_zone VALUES("202","America/St_Johns","America/St_Johns","","1","0");
INSERT INTO tn_time_zone VALUES("203","America/St_Kitts","America/St_Kitts","","1","0");
INSERT INTO tn_time_zone VALUES("204","America/St_Lucia","America/St_Lucia","","1","0");
INSERT INTO tn_time_zone VALUES("205","America/St_Thomas","America/St_Thomas","","1","0");
INSERT INTO tn_time_zone VALUES("206","America/St_Vincent","America/St_Vincent","","1","0");
INSERT INTO tn_time_zone VALUES("207","America/Swift_Current","America/Swift_Current","","1","0");
INSERT INTO tn_time_zone VALUES("208","America/Tegucigalpa","America/Tegucigalpa","","1","0");
INSERT INTO tn_time_zone VALUES("209","America/Thule","America/Thule","","1","0");
INSERT INTO tn_time_zone VALUES("210","America/Thunder_Bay","America/Thunder_Bay","","1","0");
INSERT INTO tn_time_zone VALUES("211","America/Tijuana","America/Tijuana","","1","0");
INSERT INTO tn_time_zone VALUES("212","America/Toronto","America/Toronto","","1","0");
INSERT INTO tn_time_zone VALUES("213","America/Tortola","America/Tortola","","1","0");
INSERT INTO tn_time_zone VALUES("214","America/Vancouver","America/Vancouver","","1","0");
INSERT INTO tn_time_zone VALUES("215","America/Virgin","America/Virgin","","1","0");
INSERT INTO tn_time_zone VALUES("216","America/Whitehorse","America/Whitehorse","","1","0");
INSERT INTO tn_time_zone VALUES("217","America/Winnipeg","America/Winnipeg","","1","0");
INSERT INTO tn_time_zone VALUES("218","America/Yakutat","America/Yakutat","","1","0");
INSERT INTO tn_time_zone VALUES("219","America/Yellowknife","America/Yellowknife","","1","0");
INSERT INTO tn_time_zone VALUES("220","Antarctica/Casey","Antarctica/Casey","","1","0");
INSERT INTO tn_time_zone VALUES("221","Antarctica/Davis","Antarctica/Davis","","1","0");
INSERT INTO tn_time_zone VALUES("222","Antarctica/DumontDUrville","Antarctica/DumontDUrville","","1","0");
INSERT INTO tn_time_zone VALUES("223","Antarctica/Macquarie","Antarctica/Macquarie","","1","0");
INSERT INTO tn_time_zone VALUES("224","Antarctica/Mawson","Antarctica/Mawson","","1","0");
INSERT INTO tn_time_zone VALUES("225","Antarctica/McMurdo","Antarctica/McMurdo","","1","0");
INSERT INTO tn_time_zone VALUES("226","Antarctica/Palmer","Antarctica/Palmer","","1","0");
INSERT INTO tn_time_zone VALUES("227","Antarctica/Rothera","Antarctica/Rothera","","1","0");
INSERT INTO tn_time_zone VALUES("228","Antarctica/South_Pole","Antarctica/South_Pole","","1","0");
INSERT INTO tn_time_zone VALUES("229","Antarctica/Syowa","Antarctica/Syowa","","1","0");
INSERT INTO tn_time_zone VALUES("230","Antarctica/Troll","Antarctica/Troll","","1","0");
INSERT INTO tn_time_zone VALUES("231","Antarctica/Vostok","Antarctica/Vostok","","1","0");
INSERT INTO tn_time_zone VALUES("232","Arctic/Longyearbyen","Arctic/Longyearbyen","","1","0");
INSERT INTO tn_time_zone VALUES("233","Asia/Aden","Asia/Aden","","1","0");
INSERT INTO tn_time_zone VALUES("234","Asia/Almaty","Asia/Almaty","","1","0");
INSERT INTO tn_time_zone VALUES("235","Asia/Amman","Asia/Amman","","1","0");
INSERT INTO tn_time_zone VALUES("236","Asia/Anadyr","Asia/Anadyr","","1","0");
INSERT INTO tn_time_zone VALUES("237","Asia/Aqtau","Asia/Aqtau","","1","0");
INSERT INTO tn_time_zone VALUES("238","Asia/Aqtobe","Asia/Aqtobe","","1","0");
INSERT INTO tn_time_zone VALUES("239","Asia/Ashgabat","Asia/Ashgabat","","1","0");
INSERT INTO tn_time_zone VALUES("240","Asia/Ashkhabad","Asia/Ashkhabad","","1","0");
INSERT INTO tn_time_zone VALUES("241","Asia/Baghdad","Asia/Baghdad","","1","0");
INSERT INTO tn_time_zone VALUES("242","Asia/Bahrain","Asia/Bahrain","","1","0");
INSERT INTO tn_time_zone VALUES("243","Asia/Baku","Asia/Baku","","1","0");
INSERT INTO tn_time_zone VALUES("244","Asia/Bangkok","Asia/Bangkok","","1","0");
INSERT INTO tn_time_zone VALUES("245","Asia/Barnaul","Asia/Barnaul","","1","0");
INSERT INTO tn_time_zone VALUES("246","Asia/Beirut","Asia/Beirut","","1","0");
INSERT INTO tn_time_zone VALUES("247","Asia/Bishkek","Asia/Bishkek","","1","0");
INSERT INTO tn_time_zone VALUES("248","Asia/Brunei","Asia/Brunei","","1","0");
INSERT INTO tn_time_zone VALUES("249","Asia/Calcutta","Asia/Calcutta","","1","0");
INSERT INTO tn_time_zone VALUES("250","Asia/Chita","Asia/Chita","","1","0");
INSERT INTO tn_time_zone VALUES("251","Asia/Choibalsan","Asia/Choibalsan","","1","0");
INSERT INTO tn_time_zone VALUES("252","Asia/Chongqing","Asia/Chongqing","","1","0");
INSERT INTO tn_time_zone VALUES("253","Asia/Chungking","Asia/Chungking","","1","0");
INSERT INTO tn_time_zone VALUES("254","Asia/Colombo","Asia/Colombo","","1","0");
INSERT INTO tn_time_zone VALUES("255","Asia/Dacca","Asia/Dacca","","1","0");
INSERT INTO tn_time_zone VALUES("256","Asia/Damascus","Asia/Damascus","","1","0");
INSERT INTO tn_time_zone VALUES("257","Asia/Dhaka","Asia/Dhaka","","1","0");
INSERT INTO tn_time_zone VALUES("258","Asia/Dili","Asia/Dili","","1","0");
INSERT INTO tn_time_zone VALUES("259","Asia/Dubai","Asia/Dubai","","1","0");
INSERT INTO tn_time_zone VALUES("260","Asia/Dushanbe","Asia/Dushanbe","","1","0");
INSERT INTO tn_time_zone VALUES("261","Asia/Gaza","Asia/Gaza","","1","0");
INSERT INTO tn_time_zone VALUES("262","Asia/Harbin","Asia/Harbin","","1","0");
INSERT INTO tn_time_zone VALUES("263","Asia/Hebron","Asia/Hebron","","1","0");
INSERT INTO tn_time_zone VALUES("264","Asia/Ho_Chi_Minh","Asia/Ho_Chi_Minh","UTC+7","1","1");
INSERT INTO tn_time_zone VALUES("265","Asia/Hong_Kong","Asia/Hong_Kong","","1","0");
INSERT INTO tn_time_zone VALUES("266","Asia/Hovd","Asia/Hovd","","1","0");
INSERT INTO tn_time_zone VALUES("267","Asia/Irkutsk","Asia/Irkutsk","","1","0");
INSERT INTO tn_time_zone VALUES("268","Asia/Istanbul","Asia/Istanbul","","1","0");
INSERT INTO tn_time_zone VALUES("269","Asia/Jakarta","Asia/Jakarta","","1","0");
INSERT INTO tn_time_zone VALUES("270","Asia/Jayapura","Asia/Jayapura","","1","0");
INSERT INTO tn_time_zone VALUES("271","Asia/Jerusalem","Asia/Jerusalem","","1","0");
INSERT INTO tn_time_zone VALUES("272","Asia/Kabul","Asia/Kabul","","1","0");
INSERT INTO tn_time_zone VALUES("273","Asia/Kamchatka","Asia/Kamchatka","","1","0");
INSERT INTO tn_time_zone VALUES("274","Asia/Karachi","Asia/Karachi","","1","0");
INSERT INTO tn_time_zone VALUES("275","Asia/Kashgar","Asia/Kashgar","","1","0");
INSERT INTO tn_time_zone VALUES("276","Asia/Kathmandu","Asia/Kathmandu","","1","0");
INSERT INTO tn_time_zone VALUES("277","Asia/Katmandu","Asia/Katmandu","","1","0");
INSERT INTO tn_time_zone VALUES("278","Asia/Khandyga","Asia/Khandyga","","1","0");
INSERT INTO tn_time_zone VALUES("279","Asia/Kolkata","Asia/Kolkata","","1","0");
INSERT INTO tn_time_zone VALUES("280","Asia/Krasnoyarsk","Asia/Krasnoyarsk","","1","0");
INSERT INTO tn_time_zone VALUES("281","Asia/Kuala_Lumpur","Asia/Kuala_Lumpur","","1","0");
INSERT INTO tn_time_zone VALUES("282","Asia/Kuching","Asia/Kuching","","1","0");
INSERT INTO tn_time_zone VALUES("283","Asia/Kuwait","Asia/Kuwait","","1","0");
INSERT INTO tn_time_zone VALUES("284","Asia/Macao","Asia/Macao","","1","0");
INSERT INTO tn_time_zone VALUES("285","Asia/Macau","Asia/Macau","","1","0");
INSERT INTO tn_time_zone VALUES("286","Asia/Magadan","Asia/Magadan","","1","0");
INSERT INTO tn_time_zone VALUES("287","Asia/Makassar","Asia/Makassar","","1","0");
INSERT INTO tn_time_zone VALUES("288","Asia/Manila","Asia/Manila","","1","0");
INSERT INTO tn_time_zone VALUES("289","Asia/Muscat","Asia/Muscat","","1","0");
INSERT INTO tn_time_zone VALUES("290","Asia/Nicosia","Asia/Nicosia","","1","0");
INSERT INTO tn_time_zone VALUES("291","Asia/Novokuznetsk","Asia/Novokuznetsk","","1","0");
INSERT INTO tn_time_zone VALUES("292","Asia/Novosibirsk","Asia/Novosibirsk","","1","0");
INSERT INTO tn_time_zone VALUES("293","Asia/Omsk","Asia/Omsk","","1","0");
INSERT INTO tn_time_zone VALUES("294","Asia/Oral","Asia/Oral","","1","0");
INSERT INTO tn_time_zone VALUES("295","Asia/Phnom_Penh","Asia/Phnom_Penh","","1","0");
INSERT INTO tn_time_zone VALUES("296","Asia/Pontianak","Asia/Pontianak","","1","0");
INSERT INTO tn_time_zone VALUES("297","Asia/Pyongyang","Asia/Pyongyang","","1","0");
INSERT INTO tn_time_zone VALUES("298","Asia/Qatar","Asia/Qatar","","1","0");
INSERT INTO tn_time_zone VALUES("299","Asia/Qyzylorda","Asia/Qyzylorda","","1","0");
INSERT INTO tn_time_zone VALUES("300","Asia/Rangoon","Asia/Rangoon","","1","0");
INSERT INTO tn_time_zone VALUES("301","Asia/Riyadh","Asia/Riyadh","","1","0");
INSERT INTO tn_time_zone VALUES("302","Asia/Saigon","Asia/Saigon","","1","0");
INSERT INTO tn_time_zone VALUES("303","Asia/Sakhalin","Asia/Sakhalin","","1","0");
INSERT INTO tn_time_zone VALUES("304","Asia/Samarkand","Asia/Samarkand","","1","0");
INSERT INTO tn_time_zone VALUES("305","Asia/Seoul","Asia/Seoul","","1","0");
INSERT INTO tn_time_zone VALUES("306","Asia/Shanghai","Asia/Shanghai","","1","0");
INSERT INTO tn_time_zone VALUES("307","Asia/Singapore","Asia/Singapore","","1","0");
INSERT INTO tn_time_zone VALUES("308","Asia/Srednekolymsk","Asia/Srednekolymsk","","1","0");
INSERT INTO tn_time_zone VALUES("309","Asia/Taipei","Asia/Taipei","","1","0");
INSERT INTO tn_time_zone VALUES("310","Asia/Tashkent","Asia/Tashkent","","1","0");
INSERT INTO tn_time_zone VALUES("311","Asia/Tbilisi","Asia/Tbilisi","","1","0");
INSERT INTO tn_time_zone VALUES("312","Asia/Tehran","Asia/Tehran","","1","0");
INSERT INTO tn_time_zone VALUES("313","Asia/Tel_Aviv","Asia/Tel_Aviv","","1","0");
INSERT INTO tn_time_zone VALUES("314","Asia/Thimbu","Asia/Thimbu","","1","0");
INSERT INTO tn_time_zone VALUES("315","Asia/Thimphu","Asia/Thimphu","","1","0");
INSERT INTO tn_time_zone VALUES("316","Asia/Tokyo","Asia/Tokyo","","1","0");
INSERT INTO tn_time_zone VALUES("317","Asia/Tomsk","Asia/Tomsk","","1","0");
INSERT INTO tn_time_zone VALUES("318","Asia/Ujung_Pandang","Asia/Ujung_Pandang","","1","0");
INSERT INTO tn_time_zone VALUES("319","Asia/Ulaanbaatar","Asia/Ulaanbaatar","","1","0");
INSERT INTO tn_time_zone VALUES("320","Asia/Ulan_Bator","Asia/Ulan_Bator","","1","0");
INSERT INTO tn_time_zone VALUES("321","Asia/Urumqi","Asia/Urumqi","","1","0");
INSERT INTO tn_time_zone VALUES("322","Asia/Ust-Nera","Asia/Ust-Nera","","1","0");
INSERT INTO tn_time_zone VALUES("323","Asia/Vientiane","Asia/Vientiane","","1","0");
INSERT INTO tn_time_zone VALUES("324","Asia/Vladivostok","Asia/Vladivostok","","1","0");
INSERT INTO tn_time_zone VALUES("325","Asia/Yakutsk","Asia/Yakutsk","","1","0");
INSERT INTO tn_time_zone VALUES("326","Asia/Yekaterinburg","Asia/Yekaterinburg","","1","0");
INSERT INTO tn_time_zone VALUES("327","Asia/Yerevan","Asia/Yerevan","","1","0");
INSERT INTO tn_time_zone VALUES("328","Atlantic/Azores","Atlantic/Azores","","1","0");
INSERT INTO tn_time_zone VALUES("329","Atlantic/Bermuda","Atlantic/Bermuda","","1","0");
INSERT INTO tn_time_zone VALUES("330","Atlantic/Canary","Atlantic/Canary","","1","0");
INSERT INTO tn_time_zone VALUES("331","Atlantic/Cape_Verde","Atlantic/Cape_Verde","","1","0");
INSERT INTO tn_time_zone VALUES("332","Atlantic/Faeroe","Atlantic/Faeroe","","1","0");
INSERT INTO tn_time_zone VALUES("333","Atlantic/Faroe","Atlantic/Faroe","","1","0");
INSERT INTO tn_time_zone VALUES("334","Atlantic/Jan_Mayen","Atlantic/Jan_Mayen","","1","0");
INSERT INTO tn_time_zone VALUES("335","Atlantic/Madeira","Atlantic/Madeira","","1","0");
INSERT INTO tn_time_zone VALUES("336","Atlantic/Reykjavik","Atlantic/Reykjavik","","1","0");
INSERT INTO tn_time_zone VALUES("337","Atlantic/South_Georgia","Atlantic/South_Georgia","","1","0");
INSERT INTO tn_time_zone VALUES("338","Atlantic/St_Helena","Atlantic/St_Helena","","1","0");
INSERT INTO tn_time_zone VALUES("339","Atlantic/Stanley","Atlantic/Stanley","","1","0");
INSERT INTO tn_time_zone VALUES("340","Australia/ACT","Australia/ACT","","1","0");
INSERT INTO tn_time_zone VALUES("341","Australia/Adelaide","Australia/Adelaide","","1","0");
INSERT INTO tn_time_zone VALUES("342","Australia/Brisbane","Australia/Brisbane","","1","0");
INSERT INTO tn_time_zone VALUES("343","Australia/Broken_Hill","Australia/Broken_Hill","","1","0");
INSERT INTO tn_time_zone VALUES("344","Australia/Canberra","Australia/Canberra","","1","0");
INSERT INTO tn_time_zone VALUES("345","Australia/Currie","Australia/Currie","","1","0");
INSERT INTO tn_time_zone VALUES("346","Australia/Darwin","Australia/Darwin","","1","0");
INSERT INTO tn_time_zone VALUES("347","Australia/Eucla","Australia/Eucla","","1","0");
INSERT INTO tn_time_zone VALUES("348","Australia/Hobart","Australia/Hobart","","1","0");
INSERT INTO tn_time_zone VALUES("349","Australia/LHI","Australia/LHI","","1","0");
INSERT INTO tn_time_zone VALUES("350","Australia/Lindeman","Australia/Lindeman","","1","0");
INSERT INTO tn_time_zone VALUES("351","Australia/Lord_Howe","Australia/Lord_Howe","","1","0");
INSERT INTO tn_time_zone VALUES("352","Australia/Melbourne","Australia/Melbourne","","1","0");
INSERT INTO tn_time_zone VALUES("353","Australia/North","Australia/North","","1","0");
INSERT INTO tn_time_zone VALUES("354","Australia/NSW","Australia/NSW","","1","0");
INSERT INTO tn_time_zone VALUES("355","Australia/Perth","Australia/Perth","","1","0");
INSERT INTO tn_time_zone VALUES("356","Australia/Queensland","Australia/Queensland","","1","0");
INSERT INTO tn_time_zone VALUES("357","Australia/South","Australia/South","","1","0");
INSERT INTO tn_time_zone VALUES("358","Australia/Sydney","Australia/Sydney","","1","0");
INSERT INTO tn_time_zone VALUES("359","Australia/Tasmania","Australia/Tasmania","","1","0");
INSERT INTO tn_time_zone VALUES("360","Australia/Victoria","Australia/Victoria","","1","0");
INSERT INTO tn_time_zone VALUES("361","Australia/West","Australia/West","","1","0");
INSERT INTO tn_time_zone VALUES("362","Australia/Yancowinna","Australia/Yancowinna","","1","0");
INSERT INTO tn_time_zone VALUES("363","Brazil/Acre","Brazil/Acre","","1","0");
INSERT INTO tn_time_zone VALUES("364","Brazil/DeNoronha","Brazil/DeNoronha","","1","0");
INSERT INTO tn_time_zone VALUES("365","Brazil/East","Brazil/East","","1","0");
INSERT INTO tn_time_zone VALUES("366","Brazil/West","Brazil/West","","1","0");
INSERT INTO tn_time_zone VALUES("367","Canada/Atlantic","Canada/Atlantic","","1","0");
INSERT INTO tn_time_zone VALUES("368","Canada/Central","Canada/Central","","1","0");
INSERT INTO tn_time_zone VALUES("369","Canada/East-Saskatchewan","Canada/East-Saskatchewan","","1","0");
INSERT INTO tn_time_zone VALUES("370","Canada/Eastern","Canada/Eastern","","1","0");
INSERT INTO tn_time_zone VALUES("371","Canada/Mountain","Canada/Mountain","","1","0");
INSERT INTO tn_time_zone VALUES("372","Canada/Newfoundland","Canada/Newfoundland","","1","0");
INSERT INTO tn_time_zone VALUES("373","Canada/Pacific","Canada/Pacific","","1","0");
INSERT INTO tn_time_zone VALUES("374","Canada/Saskatchewan","Canada/Saskatchewan","","1","0");
INSERT INTO tn_time_zone VALUES("375","Canada/Yukon","Canada/Yukon","","1","0");
INSERT INTO tn_time_zone VALUES("376","CET","CET","","1","0");
INSERT INTO tn_time_zone VALUES("377","Chile/Continental","Chile/Continental","","1","0");
INSERT INTO tn_time_zone VALUES("378","Chile/EasterIsland","Chile/EasterIsland","","1","0");
INSERT INTO tn_time_zone VALUES("379","CST6CDT","CST6CDT","","1","0");
INSERT INTO tn_time_zone VALUES("380","Cuba","Cuba","","1","0");
INSERT INTO tn_time_zone VALUES("381","EET","EET","","1","0");
INSERT INTO tn_time_zone VALUES("382","Egypt","Egypt","","1","0");
INSERT INTO tn_time_zone VALUES("383","Eire","Eire","","1","0");
INSERT INTO tn_time_zone VALUES("384","EST","EST","","1","0");
INSERT INTO tn_time_zone VALUES("385","EST5EDT","EST5EDT","","1","0");
INSERT INTO tn_time_zone VALUES("386","Etc/GMT","Etc/GMT","","1","0");
INSERT INTO tn_time_zone VALUES("387","Etc/GMT+0","Etc/GMT+0","","1","0");
INSERT INTO tn_time_zone VALUES("388","Etc/GMT+1","Etc/GMT+1","","1","0");
INSERT INTO tn_time_zone VALUES("389","Etc/GMT+10","Etc/GMT+10","","1","0");
INSERT INTO tn_time_zone VALUES("390","Etc/GMT+11","Etc/GMT+11","","1","0");
INSERT INTO tn_time_zone VALUES("391","Etc/GMT+12","Etc/GMT+12","","1","0");
INSERT INTO tn_time_zone VALUES("392","Etc/GMT+2","Etc/GMT+2","","1","0");
INSERT INTO tn_time_zone VALUES("393","Etc/GMT+3","Etc/GMT+3","","1","0");
INSERT INTO tn_time_zone VALUES("394","Etc/GMT+4","Etc/GMT+4","","1","0");
INSERT INTO tn_time_zone VALUES("395","Etc/GMT+5","Etc/GMT+5","","1","0");
INSERT INTO tn_time_zone VALUES("396","Etc/GMT+6","Etc/GMT+6","","1","0");
INSERT INTO tn_time_zone VALUES("397","Etc/GMT+7","Etc/GMT+7","","1","0");
INSERT INTO tn_time_zone VALUES("398","Etc/GMT+8","Etc/GMT+8","","1","0");
INSERT INTO tn_time_zone VALUES("399","Etc/GMT+9","Etc/GMT+9","","1","0");
INSERT INTO tn_time_zone VALUES("400","Etc/GMT-0","Etc/GMT-0","","1","0");
INSERT INTO tn_time_zone VALUES("401","Etc/GMT-1","Etc/GMT-1","","1","0");
INSERT INTO tn_time_zone VALUES("402","Etc/GMT-10","Etc/GMT-10","","1","0");
INSERT INTO tn_time_zone VALUES("403","Etc/GMT-11","Etc/GMT-11","","1","0");
INSERT INTO tn_time_zone VALUES("404","Etc/GMT-12","Etc/GMT-12","","1","0");
INSERT INTO tn_time_zone VALUES("405","Etc/GMT-13","Etc/GMT-13","","1","0");
INSERT INTO tn_time_zone VALUES("406","Etc/GMT-14","Etc/GMT-14","","1","0");
INSERT INTO tn_time_zone VALUES("407","Etc/GMT-2","Etc/GMT-2","","1","0");
INSERT INTO tn_time_zone VALUES("408","Etc/GMT-3","Etc/GMT-3","","1","0");
INSERT INTO tn_time_zone VALUES("409","Etc/GMT-4","Etc/GMT-4","","1","0");
INSERT INTO tn_time_zone VALUES("410","Etc/GMT-5","Etc/GMT-5","","1","0");
INSERT INTO tn_time_zone VALUES("411","Etc/GMT-6","Etc/GMT-6","","1","0");
INSERT INTO tn_time_zone VALUES("412","Etc/GMT-7","Etc/GMT-7","","1","0");
INSERT INTO tn_time_zone VALUES("413","Etc/GMT-8","Etc/GMT-8","","1","0");
INSERT INTO tn_time_zone VALUES("414","Etc/GMT-9","Etc/GMT-9","","1","0");
INSERT INTO tn_time_zone VALUES("415","Etc/GMT0","Etc/GMT0","","1","0");
INSERT INTO tn_time_zone VALUES("416","Etc/Greenwich","Etc/Greenwich","","1","0");
INSERT INTO tn_time_zone VALUES("417","Etc/UCT","Etc/UCT","","1","0");
INSERT INTO tn_time_zone VALUES("418","Etc/Universal","Etc/Universal","","1","0");
INSERT INTO tn_time_zone VALUES("419","Etc/UTC","Etc/UTC","","1","0");
INSERT INTO tn_time_zone VALUES("420","Etc/Zulu","Etc/Zulu","","1","0");
INSERT INTO tn_time_zone VALUES("421","Europe/Amsterdam","Europe/Amsterdam","","1","0");
INSERT INTO tn_time_zone VALUES("422","Europe/Andorra","Europe/Andorra","","1","0");
INSERT INTO tn_time_zone VALUES("423","Europe/Astrakhan","Europe/Astrakhan","","1","0");
INSERT INTO tn_time_zone VALUES("424","Europe/Athens","Europe/Athens","","1","0");
INSERT INTO tn_time_zone VALUES("425","Europe/Belfast","Europe/Belfast","","1","0");
INSERT INTO tn_time_zone VALUES("426","Europe/Belgrade","Europe/Belgrade","","1","0");
INSERT INTO tn_time_zone VALUES("427","Europe/Berlin","Europe/Berlin","","1","0");
INSERT INTO tn_time_zone VALUES("428","Europe/Bratislava","Europe/Bratislava","","1","0");
INSERT INTO tn_time_zone VALUES("429","Europe/Brussels","Europe/Brussels","","1","0");
INSERT INTO tn_time_zone VALUES("430","Europe/Bucharest","Europe/Bucharest","","1","0");
INSERT INTO tn_time_zone VALUES("431","Europe/Budapest","Europe/Budapest","","1","0");
INSERT INTO tn_time_zone VALUES("432","Europe/Busingen","Europe/Busingen","","1","0");
INSERT INTO tn_time_zone VALUES("433","Europe/Chisinau","Europe/Chisinau","","1","0");
INSERT INTO tn_time_zone VALUES("434","Europe/Copenhagen","Europe/Copenhagen","","1","0");
INSERT INTO tn_time_zone VALUES("435","Europe/Dublin","Europe/Dublin","","1","0");
INSERT INTO tn_time_zone VALUES("436","Europe/Gibraltar","Europe/Gibraltar","","1","0");
INSERT INTO tn_time_zone VALUES("437","Europe/Guernsey","Europe/Guernsey","","1","0");
INSERT INTO tn_time_zone VALUES("438","Europe/Helsinki","Europe/Helsinki","","1","0");
INSERT INTO tn_time_zone VALUES("439","Europe/Isle_of_Man","Europe/Isle_of_Man","","1","0");
INSERT INTO tn_time_zone VALUES("440","Europe/Istanbul","Europe/Istanbul","","1","0");
INSERT INTO tn_time_zone VALUES("441","Europe/Jersey","Europe/Jersey","","1","0");
INSERT INTO tn_time_zone VALUES("442","Europe/Kaliningrad","Europe/Kaliningrad","","1","0");
INSERT INTO tn_time_zone VALUES("443","Europe/Kiev","Europe/Kiev","","1","0");
INSERT INTO tn_time_zone VALUES("444","Europe/Kirov","Europe/Kirov","","1","0");
INSERT INTO tn_time_zone VALUES("445","Europe/Lisbon","Europe/Lisbon","","1","0");
INSERT INTO tn_time_zone VALUES("446","Europe/Ljubljana","Europe/Ljubljana","","1","0");
INSERT INTO tn_time_zone VALUES("447","Europe/London","Europe/London","","1","0");
INSERT INTO tn_time_zone VALUES("448","Europe/Luxembourg","Europe/Luxembourg","","1","0");
INSERT INTO tn_time_zone VALUES("449","Europe/Madrid","Europe/Madrid","","1","0");
INSERT INTO tn_time_zone VALUES("450","Europe/Malta","Europe/Malta","","1","0");
INSERT INTO tn_time_zone VALUES("451","Europe/Mariehamn","Europe/Mariehamn","","1","0");
INSERT INTO tn_time_zone VALUES("452","Europe/Minsk","Europe/Minsk","","1","0");
INSERT INTO tn_time_zone VALUES("453","Europe/Monaco","Europe/Monaco","","1","0");
INSERT INTO tn_time_zone VALUES("454","Europe/Moscow","Europe/Moscow","","1","0");
INSERT INTO tn_time_zone VALUES("455","Europe/Nicosia","Europe/Nicosia","","1","0");
INSERT INTO tn_time_zone VALUES("456","Europe/Oslo","Europe/Oslo","","1","0");
INSERT INTO tn_time_zone VALUES("457","Europe/Paris","Europe/Paris","","1","0");
INSERT INTO tn_time_zone VALUES("458","Europe/Podgorica","Europe/Podgorica","","1","0");
INSERT INTO tn_time_zone VALUES("459","Europe/Prague","Europe/Prague","","1","0");
INSERT INTO tn_time_zone VALUES("460","Europe/Riga","Europe/Riga","","1","0");
INSERT INTO tn_time_zone VALUES("461","Europe/Rome","Europe/Rome","","1","0");
INSERT INTO tn_time_zone VALUES("462","Europe/Samara","Europe/Samara","","1","0");
INSERT INTO tn_time_zone VALUES("463","Europe/San_Marino","Europe/San_Marino","","1","0");
INSERT INTO tn_time_zone VALUES("464","Europe/Sarajevo","Europe/Sarajevo","","1","0");
INSERT INTO tn_time_zone VALUES("465","Europe/Simferopol","Europe/Simferopol","","1","0");
INSERT INTO tn_time_zone VALUES("466","Europe/Skopje","Europe/Skopje","","1","0");
INSERT INTO tn_time_zone VALUES("467","Europe/Sofia","Europe/Sofia","","1","0");
INSERT INTO tn_time_zone VALUES("468","Europe/Stockholm","Europe/Stockholm","","1","0");
INSERT INTO tn_time_zone VALUES("469","Europe/Tallinn","Europe/Tallinn","","1","0");
INSERT INTO tn_time_zone VALUES("470","Europe/Tirane","Europe/Tirane","","1","0");
INSERT INTO tn_time_zone VALUES("471","Europe/Tiraspol","Europe/Tiraspol","","1","0");
INSERT INTO tn_time_zone VALUES("472","Europe/Ulyanovsk","Europe/Ulyanovsk","","1","0");
INSERT INTO tn_time_zone VALUES("473","Europe/Uzhgorod","Europe/Uzhgorod","","1","0");
INSERT INTO tn_time_zone VALUES("474","Europe/Vaduz","Europe/Vaduz","","1","0");
INSERT INTO tn_time_zone VALUES("475","Europe/Vatican","Europe/Vatican","","1","0");
INSERT INTO tn_time_zone VALUES("476","Europe/Vienna","Europe/Vienna","","1","0");
INSERT INTO tn_time_zone VALUES("477","Europe/Vilnius","Europe/Vilnius","","1","0");
INSERT INTO tn_time_zone VALUES("478","Europe/Volgograd","Europe/Volgograd","","1","0");
INSERT INTO tn_time_zone VALUES("479","Europe/Warsaw","Europe/Warsaw","","1","0");
INSERT INTO tn_time_zone VALUES("480","Europe/Zagreb","Europe/Zagreb","","1","0");
INSERT INTO tn_time_zone VALUES("481","Europe/Zaporozhye","Europe/Zaporozhye","","1","0");
INSERT INTO tn_time_zone VALUES("482","Europe/Zurich","Europe/Zurich","","1","0");
INSERT INTO tn_time_zone VALUES("483","Factory","Factory","","1","0");
INSERT INTO tn_time_zone VALUES("484","GB","GB","","1","0");
INSERT INTO tn_time_zone VALUES("485","GB-Eire","GB-Eire","","1","0");
INSERT INTO tn_time_zone VALUES("486","GMT","GMT","","1","0");
INSERT INTO tn_time_zone VALUES("487","GMT+0","GMT+0","","1","0");
INSERT INTO tn_time_zone VALUES("488","GMT-0","GMT-0","","1","0");
INSERT INTO tn_time_zone VALUES("489","GMT0","GMT0","","1","0");
INSERT INTO tn_time_zone VALUES("490","Greenwich","Greenwich","","1","0");
INSERT INTO tn_time_zone VALUES("491","Hongkong","Hongkong","","1","0");
INSERT INTO tn_time_zone VALUES("492","HST","HST","","1","0");
INSERT INTO tn_time_zone VALUES("493","Iceland","Iceland","","1","0");
INSERT INTO tn_time_zone VALUES("494","Indian/Antananarivo","Indian/Antananarivo","","1","0");
INSERT INTO tn_time_zone VALUES("495","Indian/Chagos","Indian/Chagos","","1","0");
INSERT INTO tn_time_zone VALUES("496","Indian/Christmas","Indian/Christmas","","1","0");
INSERT INTO tn_time_zone VALUES("497","Indian/Cocos","Indian/Cocos","","1","0");
INSERT INTO tn_time_zone VALUES("498","Indian/Comoro","Indian/Comoro","","1","0");
INSERT INTO tn_time_zone VALUES("499","Indian/Kerguelen","Indian/Kerguelen","","1","0");
INSERT INTO tn_time_zone VALUES("500","Indian/Mahe","Indian/Mahe","","1","0");
INSERT INTO tn_time_zone VALUES("501","Indian/Maldives","Indian/Maldives","","1","0");
INSERT INTO tn_time_zone VALUES("502","Indian/Mauritius","Indian/Mauritius","","1","0");
INSERT INTO tn_time_zone VALUES("503","Indian/Mayotte","Indian/Mayotte","","1","0");
INSERT INTO tn_time_zone VALUES("504","Indian/Reunion","Indian/Reunion","","1","0");
INSERT INTO tn_time_zone VALUES("505","Iran","Iran","","1","0");
INSERT INTO tn_time_zone VALUES("506","Israel","Israel","","1","0");
INSERT INTO tn_time_zone VALUES("507","Jamaica","Jamaica","","1","0");
INSERT INTO tn_time_zone VALUES("508","Japan","Japan","","1","0");
INSERT INTO tn_time_zone VALUES("509","Kwajalein","Kwajalein","","1","0");
INSERT INTO tn_time_zone VALUES("510","Libya","Libya","","1","0");
INSERT INTO tn_time_zone VALUES("511","MET","MET","","1","0");
INSERT INTO tn_time_zone VALUES("512","Mexico/BajaNorte","Mexico/BajaNorte","","1","0");
INSERT INTO tn_time_zone VALUES("513","Mexico/BajaSur","Mexico/BajaSur","","1","0");
INSERT INTO tn_time_zone VALUES("514","Mexico/General","Mexico/General","","1","0");
INSERT INTO tn_time_zone VALUES("515","MST","MST","","1","0");
INSERT INTO tn_time_zone VALUES("516","MST7MDT","MST7MDT","","1","0");
INSERT INTO tn_time_zone VALUES("517","Navajo","Navajo","","1","0");
INSERT INTO tn_time_zone VALUES("518","NZ","NZ","","1","0");
INSERT INTO tn_time_zone VALUES("519","NZ-CHAT","NZ-CHAT","","1","0");
INSERT INTO tn_time_zone VALUES("520","Pacific/Apia","Pacific/Apia","","1","0");
INSERT INTO tn_time_zone VALUES("521","Pacific/Auckland","Pacific/Auckland","","1","0");
INSERT INTO tn_time_zone VALUES("522","Pacific/Bougainville","Pacific/Bougainville","","1","0");
INSERT INTO tn_time_zone VALUES("523","Pacific/Chatham","Pacific/Chatham","","1","0");
INSERT INTO tn_time_zone VALUES("524","Pacific/Chuuk","Pacific/Chuuk","","1","0");
INSERT INTO tn_time_zone VALUES("525","Pacific/Easter","Pacific/Easter","","1","0");
INSERT INTO tn_time_zone VALUES("526","Pacific/Efate","Pacific/Efate","","1","0");
INSERT INTO tn_time_zone VALUES("527","Pacific/Enderbury","Pacific/Enderbury","","1","0");
INSERT INTO tn_time_zone VALUES("528","Pacific/Fakaofo","Pacific/Fakaofo","","1","0");
INSERT INTO tn_time_zone VALUES("529","Pacific/Fiji","Pacific/Fiji","","1","0");
INSERT INTO tn_time_zone VALUES("530","Pacific/Funafuti","Pacific/Funafuti","","1","0");
INSERT INTO tn_time_zone VALUES("531","Pacific/Galapagos","Pacific/Galapagos","","1","0");
INSERT INTO tn_time_zone VALUES("532","Pacific/Gambier","Pacific/Gambier","","1","0");
INSERT INTO tn_time_zone VALUES("533","Pacific/Guadalcanal","Pacific/Guadalcanal","","1","0");
INSERT INTO tn_time_zone VALUES("534","Pacific/Guam","Pacific/Guam","","1","0");
INSERT INTO tn_time_zone VALUES("535","Pacific/Honolulu","Pacific/Honolulu","","1","0");
INSERT INTO tn_time_zone VALUES("536","Pacific/Johnston","Pacific/Johnston","","1","0");
INSERT INTO tn_time_zone VALUES("537","Pacific/Kiritimati","Pacific/Kiritimati","","1","0");
INSERT INTO tn_time_zone VALUES("538","Pacific/Kosrae","Pacific/Kosrae","","1","0");
INSERT INTO tn_time_zone VALUES("539","Pacific/Kwajalein","Pacific/Kwajalein","","1","0");
INSERT INTO tn_time_zone VALUES("540","Pacific/Majuro","Pacific/Majuro","","1","0");
INSERT INTO tn_time_zone VALUES("541","Pacific/Marquesas","Pacific/Marquesas","","1","0");
INSERT INTO tn_time_zone VALUES("542","Pacific/Midway","Pacific/Midway","","1","0");
INSERT INTO tn_time_zone VALUES("543","Pacific/Nauru","Pacific/Nauru","","1","0");
INSERT INTO tn_time_zone VALUES("544","Pacific/Niue","Pacific/Niue","","1","0");
INSERT INTO tn_time_zone VALUES("545","Pacific/Norfolk","Pacific/Norfolk","","1","0");
INSERT INTO tn_time_zone VALUES("546","Pacific/Noumea","Pacific/Noumea","","1","0");
INSERT INTO tn_time_zone VALUES("547","Pacific/Pago_Pago","Pacific/Pago_Pago","","1","0");
INSERT INTO tn_time_zone VALUES("548","Pacific/Palau","Pacific/Palau","","1","0");
INSERT INTO tn_time_zone VALUES("549","Pacific/Pitcairn","Pacific/Pitcairn","","1","0");
INSERT INTO tn_time_zone VALUES("550","Pacific/Pohnpei","Pacific/Pohnpei","","1","0");
INSERT INTO tn_time_zone VALUES("551","Pacific/Ponape","Pacific/Ponape","","1","0");
INSERT INTO tn_time_zone VALUES("552","Pacific/Port_Moresby","Pacific/Port_Moresby","","1","0");
INSERT INTO tn_time_zone VALUES("553","Pacific/Rarotonga","Pacific/Rarotonga","","1","0");
INSERT INTO tn_time_zone VALUES("554","Pacific/Saipan","Pacific/Saipan","","1","0");
INSERT INTO tn_time_zone VALUES("555","Pacific/Samoa","Pacific/Samoa","","1","0");
INSERT INTO tn_time_zone VALUES("556","Pacific/Tahiti","Pacific/Tahiti","","1","0");
INSERT INTO tn_time_zone VALUES("557","Pacific/Tarawa","Pacific/Tarawa","","1","0");
INSERT INTO tn_time_zone VALUES("558","Pacific/Tongatapu","Pacific/Tongatapu","","1","0");
INSERT INTO tn_time_zone VALUES("559","Pacific/Truk","Pacific/Truk","","1","0");
INSERT INTO tn_time_zone VALUES("560","Pacific/Wake","Pacific/Wake","","1","0");
INSERT INTO tn_time_zone VALUES("561","Pacific/Wallis","Pacific/Wallis","","1","0");
INSERT INTO tn_time_zone VALUES("562","Pacific/Yap","Pacific/Yap","","1","0");
INSERT INTO tn_time_zone VALUES("563","Poland","Poland","","1","0");
INSERT INTO tn_time_zone VALUES("564","Portugal","Portugal","","1","0");
INSERT INTO tn_time_zone VALUES("565","PRC","PRC","","1","0");
INSERT INTO tn_time_zone VALUES("566","PST8PDT","PST8PDT","","1","0");
INSERT INTO tn_time_zone VALUES("567","ROC","ROC","","1","0");
INSERT INTO tn_time_zone VALUES("568","ROK","ROK","","1","0");
INSERT INTO tn_time_zone VALUES("569","Singapore","Singapore","","1","0");
INSERT INTO tn_time_zone VALUES("570","Turkey","Turkey","","1","0");
INSERT INTO tn_time_zone VALUES("571","UCT","UCT","","1","0");
INSERT INTO tn_time_zone VALUES("572","Universal","Universal","","1","0");
INSERT INTO tn_time_zone VALUES("573","US/Alaska","US/Alaska","","1","0");
INSERT INTO tn_time_zone VALUES("574","US/Aleutian","US/Aleutian","","1","0");
INSERT INTO tn_time_zone VALUES("575","US/Arizona","US/Arizona","","1","0");
INSERT INTO tn_time_zone VALUES("576","US/Central","US/Central","","1","0");
INSERT INTO tn_time_zone VALUES("577","US/East-Indiana","US/East-Indiana","","1","0");
INSERT INTO tn_time_zone VALUES("578","US/Eastern","US/Eastern","","1","0");
INSERT INTO tn_time_zone VALUES("579","US/Hawaii","US/Hawaii","","1","0");
INSERT INTO tn_time_zone VALUES("580","US/Indiana-Starke","US/Indiana-Starke","","1","0");
INSERT INTO tn_time_zone VALUES("581","US/Michigan","US/Michigan","","1","0");
INSERT INTO tn_time_zone VALUES("582","US/Mountain","US/Mountain","","1","0");
INSERT INTO tn_time_zone VALUES("583","US/Pacific","US/Pacific","","1","0");
INSERT INTO tn_time_zone VALUES("584","US/Pacific-New","US/Pacific-New","","1","0");
INSERT INTO tn_time_zone VALUES("585","US/Samoa","US/Samoa","","1","0");
INSERT INTO tn_time_zone VALUES("586","UTC","UTC","","1","0");
INSERT INTO tn_time_zone VALUES("587","W-SU","W-SU","","1","0");
INSERT INTO tn_time_zone VALUES("588","WET","WET","","1","0");
INSERT INTO tn_time_zone VALUES("589","Zulu","Zulu","","1","0");



DROP TABLE tn_user;

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
  `token_waiting_active` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token` (`access_token`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

INSERT INTO tn_user VALUES("1","admin","","$2y$13$HAh9iitRiwHuDnNUM8w/qubkrFmh1GLZ.EG/VwkTz3jSBSzg1nafC","!","admin","Jvm(","1","Tona","","/web/uploads/images/users/11947627_1196879580337720_2083630260241166797_n.jpg","","0","1","vi","Asia/Bangkok","","","1");
INSERT INTO tn_user VALUES("95","nvtoan@lockon-vn.com","nvtoan@lockon-vn.com","$2y$13$4YqiyEbxjsv1eAdK7GAQvuTctJhqvRzmDCyrhkZkBq4IoULrksbYq","9hKeS7BnnZuY4JGVoGZVzhuem3hXOUaj","","","8","","","","","0","9","vi","Asia/Bangkok","","2018-06-13 13:56:32","1");
INSERT INTO tn_user VALUES("96","nguyennguyen.vt88@gmail.com","nguyennguyen.vt88@gmail.com","$2y$13$uRUs9ll/CqsDqSN3cN9RnuVWLbSwktBGaS0T36qcXsWivhm34SzhG","1VPr__2YAk_Y8Gy7YJP21uoXUafu3t4u","","","8","","","","","0","9","vi","Asia/Bangkok","","lutREG2RZSZelzX8U8eZcfCvSZYpn_xf","1");
INSERT INTO tn_user VALUES("98","tonanguyen.swe@gmail.com","tonanguyen.swe@gmail.com","$2y$13$0PtGfqsOYdz5FaB8ENLmNO8WRIhNiQan5uB.HfsrhdH9WoyMvd3tu","7Gq3NYCSHj4VkOiLR_aD219xaBEwoguN","","","8","Tona SWE","","","","0","1","vi","Asia/Bangkok","","4dhR8VjW3fF65rDb8W6M9Ck6g7wLRNv4","0");



DROP TABLE tn_user_candidate;

CREATE TABLE `tn_user_candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_deleted` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tn_user_details;

CREATE TABLE `tn_user_details` (
  `user_id` int(11) unsigned NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `about_me` text,
  `gender` tinyint(1) DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `changed_password_date` datetime DEFAULT NULL,
  `job_title_id` int(11) DEFAULT NULL,
  `experience` int(5) DEFAULT NULL,
  `level` int(5) DEFAULT NULL,
  `direct_manager_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `active_tour_guide` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tn_user_details VALUES("1","","Idola","","Santos","","1","2018-03-21","0932252414","143/70 Go Dau, Tan Phu","","4","6","1","","","","","","1");
INSERT INTO tn_user_details VALUES("92","001@gmail.com","","","Test","","2","","0932252414","","","","","","","","2018-05-20 09:40:17","","","1");
INSERT INTO tn_user_details VALUES("95","","","","","","2","1988-10-25","0932252414","Robot Tower, 308-308C Dien Bien Phu St., Ward 4, Dist. 3, Ho Chi Minh City","","","","","","63","2018-06-13 11:44:13","","","1");
INSERT INTO tn_user_details VALUES("96","","","","","","2","1988-10-25","0932252414","Robot Tower, 308-308C Dien Bien Phu St., Ward 4, Dist. 3, Ho Chi Minh City","","","","","","63","2018-06-13 11:51:10","","","1");
INSERT INTO tn_user_details VALUES("97","tonanguyen.swe@gmail.com","Tona","","SWE","","1","2014-06-17","0932252414","HCM","","","","","","","2018-06-15 12:56:40","","","1");
INSERT INTO tn_user_details VALUES("98","tonanguyen.swe@gmail.com","Tona","","SWE","","1","2014-06-17","0932252414","HCM","","","","","","","2018-06-15 13:04:13","","","1");



DROP TABLE tn_user_jobs;

CREATE TABLE `tn_user_jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `jobs_id` int(11) DEFAULT NULL,
  `applied` smallint(1) DEFAULT '0',
  `applied_time` datetime DEFAULT NULL,
  `saved` smallint(1) DEFAULT '0',
  `saved_time` datetime DEFAULT NULL,
  `arranged` int(11) DEFAULT '1',
  `is_deleted` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tn_user_online;

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
) ENGINE=InnoDB AUTO_INCREMENT=505685 DEFAULT CHARSET=utf8;

INSERT INTO tn_user_online VALUES("505681","us4m4pjq1lkqln2uff931sao42","172.31.28.221","2018-06-11 14:57:20","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36","https://jobsvina.com/admin/ajax/php-working","ajax","php-working","GET");
INSERT INTO tn_user_online VALUES("505682","57khial200t3r0skk952n6qe61","172.31.28.221","2018-06-12 06:05:43","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36","https://jobsvina.com/admin/ajax/php-working","ajax","php-working","GET");
INSERT INTO tn_user_online VALUES("505683","vvq09neifua9ed4cv0edbirq9v","127.0.0.1","2018-06-19 09:57:19","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0","http://localhost:88/demo2/admin/ajax/php-working","ajax","php-working","GET");
INSERT INTO tn_user_online VALUES("505684","86e7bdgsbsos40q7aqlkiejkn3","::1","2018-06-22 04:49:40","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0","http://localhost:88/demo2/admin/ajax/php-working","ajax","php-working","GET");



