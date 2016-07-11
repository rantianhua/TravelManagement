# MySQL-Front 5.1  (Build 4.2)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: management
# ------------------------------------------------------
# Server version 5.0.22-community-nt

#
# Source for table application
#

DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `application_number` char(36) NOT NULL default '',
  `applicant_id` char(18) default NULL,
  `assignee_id` char(18) default NULL,
  `apply_date` date default NULL,
  `passport_id` char(18) default NULL,
  `category` varchar(14) default NULL,
  `plan` char(36) default NULL,
  `purpose` char(36) default NULL,
  `purpose_id` char(36) default NULL,
  `type` char(6) default NULL,
  `can_tuan` char(1) default NULL,
  `group_unit` varchar(255) default NULL,
  `examine_unit` varchar(255) default NULL,
  `group_work` varchar(255) default NULL,
  `group_members` varchar(255) default NULL,
  `inviter_info` char(36) default NULL,
  `licence_type` char(6) default NULL,
  `inviter_pay` tinyint(1) default NULL,
  `loan` tinyint(1) default NULL,
  `public_notification_id` varchar(255) default NULL,
  `record_id` varchar(255) default NULL,
  `verification` varchar(255) default NULL,
  `status` varchar(10) default NULL,
  PRIMARY KEY  (`application_number`),
  KEY `APPLICATION_FK_PURPOSE` (`purpose`),
  KEY `APPLICATION_FK_INVITER` (`inviter_info`),
  KEY `APPLICATION_FK_PLAN` (`plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短期/长期出访申请表';

#
# Dumping data for table application
#

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES ('1ce2b377-f020-465e-be79-1e0524400164','140000199508080001','','2016-07-10','140000199508080001','学生','cc40970e-bf3c-46df-955b-eade42a6243d','培训','7ae2a7a1-528a-41d7-abf9-9dd6fe079212','长期','否','','','','','55159618-75f2-405b-a375-cd382325b188','因私证照',0,1,NULL,NULL,NULL,'0000000000');
INSERT INTO `application` VALUES ('71c1c424-01d8-4f87-a537-46c51e89d20a','140000199508080001','140000199503230002','2016-07-10','140000199503230002','行政','a8f3bed7-8cb4-44ed-a473-d575219856af','44a9ca8c-9ea3-4cfb-bed5-e269c2b9319a','44a9ca8c-9ea3-4cfb-bed5-e269c2b9319a','短期','是','山东大学','山东大学','倒垃圾','\\upload\\file\\13\\3\\9e03244c-18a0-4b97-afe9-2cfd2ecdf4fe_设计文档.docx','b1a9b5d8-52f7-4d6b-bf26-80179565566e','因公证照',1,1,NULL,NULL,NULL,'0000000000');
INSERT INTO `application` VALUES ('7e071576-2af7-4dac-87a8-293334094c58','140000199508080001','140000199503230002','2016-07-10','140000199503230002','行政','b1930316-e974-4f4d-8e7b-702ba837b5ee','fe48ba86-4b91-4e57-84f2-12a6e8591ada','fe48ba86-4b91-4e57-84f2-12a6e8591ada','短期','是','山东大学','山东大学','倒垃圾','\\upload\\file\\9\\5\\d1f59a5b-1774-4a73-9ef8-992995b209b6_设计文档.docx','4ba29574-17a6-4547-8c51-72280bb1e193','因公证照',1,0,NULL,NULL,NULL,'0000000000');
INSERT INTO `application` VALUES ('9b8b9f87-176e-4f67-80a7-c8e5f98bc120','140000199508080001','','2016-07-10','140000199508080001','学生','69c67f5f-3182-478f-a3b6-dccfd2d922ba','6179e44f-ca5a-4a7e-8532-09d03ccbadea','6179e44f-ca5a-4a7e-8532-09d03ccbadea','长期','否','','','','','ba88e1ee-07f4-4d51-99f3-0803f452b6ea','因公证照',0,1,NULL,NULL,NULL,'0000000000');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table funds
#

DROP TABLE IF EXISTS `funds`;
CREATE TABLE `funds` (
  `id` char(36) NOT NULL default '',
  `pay_type` tinyint(1) default NULL,
  `pay_amount` varchar(255) default NULL,
  `account_name` varchar(255) default NULL,
  `pay_item` varchar(255) default NULL,
  `ps` varchar(255) default NULL,
  `pay_detail` mediumtext,
  `prove_file` varchar(255) default NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经费负担情况';

#
# Dumping data for table funds
#

LOCK TABLES `funds` WRITE;
/*!40000 ALTER TABLE `funds` DISABLE KEYS */;
INSERT INTO `funds` VALUES ('7e071576-2af7-4dac-87a8-293334094c58',1,NULL,NULL,'住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('7e071576-2af7-4dac-87a8-293334094c58',2,'3000','123','其他','嫖娼',NULL,NULL);
INSERT INTO `funds` VALUES ('7e071576-2af7-4dac-87a8-293334094c58',2,'1','456','机票费','',NULL,NULL);
INSERT INTO `funds` VALUES ('7e071576-2af7-4dac-87a8-293334094c58',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('7e071576-2af7-4dac-87a8-293334094c58',3,NULL,NULL,NULL,NULL,'','');
INSERT INTO `funds` VALUES ('71c1c424-01d8-4f87-a537-46c51e89d20a',1,NULL,NULL,'机票费','',NULL,NULL);
INSERT INTO `funds` VALUES ('71c1c424-01d8-4f87-a537-46c51e89d20a',2,'3000','123','其他','嫖娼',NULL,NULL);
INSERT INTO `funds` VALUES ('71c1c424-01d8-4f87-a537-46c51e89d20a',2,'1','456','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('71c1c424-01d8-4f87-a537-46c51e89d20a',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('71c1c424-01d8-4f87-a537-46c51e89d20a',3,NULL,NULL,NULL,NULL,'','');
INSERT INTO `funds` VALUES ('9b8b9f87-176e-4f67-80a7-c8e5f98bc120',1,NULL,NULL,'住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('9b8b9f87-176e-4f67-80a7-c8e5f98bc120',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('9b8b9f87-176e-4f67-80a7-c8e5f98bc120',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('9b8b9f87-176e-4f67-80a7-c8e5f98bc120',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('9b8b9f87-176e-4f67-80a7-c8e5f98bc120',3,NULL,NULL,NULL,NULL,'','');
INSERT INTO `funds` VALUES ('1ce2b377-f020-465e-be79-1e0524400164',1,NULL,NULL,'住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('1ce2b377-f020-465e-be79-1e0524400164',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('1ce2b377-f020-465e-be79-1e0524400164',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('1ce2b377-f020-465e-be79-1e0524400164',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('1ce2b377-f020-465e-be79-1e0524400164',3,NULL,NULL,NULL,NULL,'','');
/*!40000 ALTER TABLE `funds` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table inviter
#

DROP TABLE IF EXISTS `inviter`;
CREATE TABLE `inviter` (
  `id` char(36) NOT NULL default '',
  `name` varchar(255) default NULL,
  `title_ch` varchar(255) default NULL,
  `title_en` varchar(255) default NULL,
  `unit_name` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `telephone` varchar(45) default NULL,
  `email` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `invitation_raw` varchar(255) default NULL,
  `invitation_zh` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邀请人信息表';

#
# Dumping data for table inviter
#

LOCK TABLES `inviter` WRITE;
/*!40000 ALTER TABLE `inviter` DISABLE KEYS */;
INSERT INTO `inviter` VALUES ('4ba29574-17a6-4547-8c51-72280bb1e193','奥巴马','美国总统','American President','白宫','华盛顿特区','440-4833982','obama@gmail.com','www.whitehouse.gov','','');
INSERT INTO `inviter` VALUES ('55159618-75f2-405b-a375-cd382325b188','沙特王子三世','沙特王子三世','IS member','清真','迪拜亚特兰蒂斯酒店','88888888','atlantis@royal.com','atlantis.royal.com','','');
INSERT INTO `inviter` VALUES ('b1a9b5d8-52f7-4d6b-bf26-80179565566e','奥巴马','美国总统','American President','白宫','华盛顿特区','440-4833982','obama@gmail.com','www.whitehouse.gov','','');
INSERT INTO `inviter` VALUES ('ba88e1ee-07f4-4d51-99f3-0803f452b6ea','穆罕默德 准','虔诚的信徒','IS member','清真','伊斯坦布尔','6666666','cleantrue@is.com','is.com','','');
/*!40000 ALTER TABLE `inviter` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table passport
#

DROP TABLE IF EXISTS `passport`;
CREATE TABLE `passport` (
  `identity` char(18) NOT NULL,
  `id_card` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `passport_name` varchar(50) default NULL,
  `name` varchar(50) default NULL,
  `sex` char(2) default NULL,
  `issuing_place` varchar(255) default NULL,
  `birthday` date default NULL,
  `exp_date` date default NULL,
  `account_book` varchar(255) default NULL,
  PRIMARY KEY  (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='护照信息表';

#
# Dumping data for table passport
#

LOCK TABLES `passport` WRITE;
/*!40000 ALTER TABLE `passport` DISABLE KEYS */;
INSERT INTO `passport` VALUES ('140000199503230002',NULL,NULL,'山东大学出境特殊许可证','李四','女','中国','1995-03-23','2021-01-01',NULL);
INSERT INTO `passport` VALUES ('140000199503230003','\\upload\\picture\\3\\9\\ddbc9018-92c6-4a84-baff-f0a7ddc4a948_idcard.jpg','\\upload\\picture\\7\\2\\25d3d2d5-79b2-4c05-a208-7fee85c64613_passport.jpg','山东大学出境特殊许可证','孙朋朋','女','中国','1995-06-15','2016-07-31','\\upload\\picture\\5\\11\\cb272cae-b6ed-44d3-b041-89bfe87e8795_accountbook.jpg');
INSERT INTO `passport` VALUES ('140000199508080001','\\upload\\picture\\12\\5\\06e8f22b-e47e-4e8e-8a1a-b4be3133ac4c_idcard.jpg','\\upload\\picture\\4\\14\\5d2f6568-daef-4e51-82b2-5db166e1f102_passport.jpg','美利坚合众国护照','任浩航','男','华盛顿','1995-08-08','2019-01-01','\\upload\\picture\\3\\9\\c3cd5486-630d-4b8a-a675-eb0336ab915a_accountbook.jpg');
/*!40000 ALTER TABLE `passport` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table visit_destination
#

DROP TABLE IF EXISTS `visit_destination`;
CREATE TABLE `visit_destination` (
  `plan_id` char(36) NOT NULL default '',
  `country` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `arrive_date` datetime default NULL,
  `exit_city_date` datetime default NULL,
  `trans_addr` varchar(255) default NULL,
  KEY `DESTINATION` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出访计划表';

#
# Dumping data for table visit_destination
#

LOCK TABLES `visit_destination` WRITE;
/*!40000 ALTER TABLE `visit_destination` DISABLE KEYS */;
INSERT INTO `visit_destination` VALUES ('b1930316-e974-4f4d-8e7b-702ba837b5ee','泰国','曼谷','2016-07-23','2016-07-31','新乡');
INSERT INTO `visit_destination` VALUES ('b1930316-e974-4f4d-8e7b-702ba837b5ee','法国','巴黎','2016-08-01','2016-08-10','');
INSERT INTO `visit_destination` VALUES ('a8f3bed7-8cb4-44ed-a473-d575219856af','泰国','曼谷','2016-07-23','2016-07-31','新乡');
INSERT INTO `visit_destination` VALUES ('a8f3bed7-8cb4-44ed-a473-d575219856af','法国','巴黎','2016-08-01','2016-08-10','');
INSERT INTO `visit_destination` VALUES ('69c67f5f-3182-478f-a3b6-dccfd2d922ba','以色列','耶路撒冷','2016-07-19','2016-07-24','');
INSERT INTO `visit_destination` VALUES ('cc40970e-bf3c-46df-955b-eade42a6243d','阿拉伯联合酋长国','迪拜','2016-08-03','2016-09-01','');
/*!40000 ALTER TABLE `visit_destination` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table visit_plan
#

DROP TABLE IF EXISTS `visit_plan`;
CREATE TABLE `visit_plan` (
  `plan_id` char(36) NOT NULL default '',
  `out_city` varchar(255) default NULL,
  `exit_border_date` datetime default NULL,
  `back_city` varchar(255) default NULL,
  `enter_border_date` datetime default NULL,
  PRIMARY KEY  (`plan_id`),
  UNIQUE KEY `plan_id_UNIQUE` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出访计划表';

#
# Dumping data for table visit_plan
#

LOCK TABLES `visit_plan` WRITE;
/*!40000 ALTER TABLE `visit_plan` DISABLE KEYS */;
INSERT INTO `visit_plan` VALUES ('69c67f5f-3182-478f-a3b6-dccfd2d922ba','东营','2016-07-17','枣庄','2016-08-28');
INSERT INTO `visit_plan` VALUES ('a8f3bed7-8cb4-44ed-a473-d575219856af','东营','2016-07-14','枣庄','2016-08-28');
INSERT INTO `visit_plan` VALUES ('b1930316-e974-4f4d-8e7b-702ba837b5ee','东营','2016-07-14','枣庄','2016-08-28');
INSERT INTO `visit_plan` VALUES ('cc40970e-bf3c-46df-955b-eade42a6243d','东营','2016-08-01','枣庄','2016-09-03');
/*!40000 ALTER TABLE `visit_plan` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table visit_purpose
#

DROP TABLE IF EXISTS `visit_purpose`;
CREATE TABLE `visit_purpose` (
  `id` char(36) NOT NULL default '',
  `class_name` varchar(255) default NULL,
  `partner_name` varchar(255) default NULL,
  `partner_title` varchar(255) default NULL,
  `partner_expertise` varchar(255) default NULL,
  `cooperation_content` mediumtext,
  `train_content` mediumtext,
  `study_content` mediumtext,
  `teacher_name` varchar(255) default NULL,
  `teacher_title` varchar(255) default NULL,
  `teacher_expertise` varchar(255) default NULL,
  `degree_type` varchar(255) default NULL,
  `conference_name_ch` varchar(255) default NULL,
  `conference_name_en` varchar(255) default NULL,
  `conference_desc` varchar(255) default NULL,
  `speech` char(2) default NULL,
  `speech_outline` varchar(255) default NULL,
  `paper_outline` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出访目的表';

#
# Dumping data for table visit_purpose
#

LOCK TABLES `visit_purpose` WRITE;
/*!40000 ALTER TABLE `visit_purpose` DISABLE KEYS */;
INSERT INTO `visit_purpose` VALUES ('44a9ca8c-9ea3-4cfb-bed5-e269c2b9319a','','Obama','总统','政治','研究臭氧层破坏','','','','','','','','','',NULL,'','');
INSERT INTO `visit_purpose` VALUES ('6179e44f-ca5a-4a7e-8532-09d03ccbadea','','','','','','','','安拉胡阿克巴','真主','自杀式袭击','软件工程','','','',NULL,'','');
INSERT INTO `visit_purpose` VALUES ('fe48ba86-4b91-4e57-84f2-12a6e8591ada','','','','','','','','','','','','世界气候大会','World Weather Meeting','世界各国领导人出席会议','1','','');
INSERT INTO `visit_purpose` VALUES ('培训','','','','','','游泳','','','','','','','','',NULL,'','');
/*!40000 ALTER TABLE `visit_purpose` ENABLE KEYS */;
UNLOCK TABLES;

#
#  Foreign keys for table application
#

ALTER TABLE `application`
ADD CONSTRAINT `APPLICATION_FK_PLAN` FOREIGN KEY (`plan`) REFERENCES `visit_plan` (`plan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `APPLICATION_FK_PURPOSE` FOREIGN KEY (`purpose`) REFERENCES `visit_purpose` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table funds
#

ALTER TABLE `funds`
ADD CONSTRAINT `FUNDS_FK_APPLICATION` FOREIGN KEY (`id`) REFERENCES `application` (`application_number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table visit_destination
#

ALTER TABLE `visit_destination`
ADD CONSTRAINT `DESTINATION` FOREIGN KEY (`plan_id`) REFERENCES `visit_plan` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE;


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
