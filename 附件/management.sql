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
  `apply_date` char(10) default NULL,
  `passport_id` char(18) default NULL,
  `category` varchar(14) default NULL,
  `plan` char(36) default NULL,
  `purpose` char(36) default NULL,
  `purpose_content` char(36) default NULL,
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
  KEY `APPLICATION_FK_PLAN` (`plan`),
  KEY `FK_PUBLICITY` (`public_notification_id`),
  KEY `FK_RECORD` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短期/长期出访申请表';

#
# Dumping data for table application
#

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES ('17daefb8-484a-490e-afcc-7165db72cdd5','140000199508080001','','2016-07-13','140000199508080001','本科','81172bd5-4c79-44b0-a136-7cbc6134ef7c','7faa35dc-6d04-4f4a-86ba-c3b6586163f9','攻读学位','长期','否','','','','','5578d403-3bf4-4d20-9c7a-f77eaccf2c0b','因公证照',2,0,NULL,'00ff8750-97ed-4164-9282-4f4ed8b73e79',NULL,'0100000000');
INSERT INTO `application` VALUES ('bb914955-9412-408f-87b2-c6b78203a18e','140000199508080001','140000199503230002','2016-07-13','140000199503230002','行政','3d2dcd77-4dfa-4fcc-aee8-5c7b5b20d1ae','27c71b84-ada5-48cf-8b60-ef35029dec53','任教','短期','是','山东大学','山东大学','讲师','\\upload\\file\\5\\13\\79e0d14a-f996-4a74-bf99-35d4c6616f6e_国际事务部出入境管理系统设计文档.docx','82604f1a-5f01-4751-8936-5ff914a4ffb7','因公证照',0,1,NULL,'2087c825-b733-41ba-b25e-7e4fa5dba4c3',NULL,'0000000000');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table family
#

DROP TABLE IF EXISTS `family`;
CREATE TABLE `family` (
  `id` char(36) NOT NULL,
  `appellation` varchar(255) default NULL,
  `name` varchar(255) NOT NULL default '',
  `age` int(3) default NULL,
  `political_status` char(24) default NULL,
  `other_info` varchar(255) default NULL,
  PRIMARY KEY  (`id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table family
#

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
INSERT INTO `family` VALUES ('03628911-9330-4f6e-aced-105403f07e5a','父亲','人挺好',50,'务农','');
INSERT INTO `family` VALUES ('1c0c60a0-2ab5-4414-b696-99fc6e71101d','父亲','人挺好',50,'务农','');
INSERT INTO `family` VALUES ('407b4f29-a2a9-4158-a8e9-11e181a9f457','父亲','人挺好',50,'务农','');
INSERT INTO `family` VALUES ('483b77b9-2938-47d5-a910-f4afff05f761','父亲','人挺好',50,'务农','');
INSERT INTO `family` VALUES ('7a575735-303f-4f8b-8524-f56ce8edb482','父亲','人挺好',50,'务农','');
INSERT INTO `family` VALUES ('8eb88214-1d64-4a33-9e82-4c7d951cba88','父亲','人挺好',50,'务农','');
INSERT INTO `family` VALUES ('ae3a5a61-2aa4-4ac9-8a37-50fa433c3021','父亲','人挺好',50,'务农','');
INSERT INTO `family` VALUES ('b5c4152e-5076-46a5-8827-3b4956d3fe74','父亲','人挺好',50,'务农','');
INSERT INTO `family` VALUES ('ed119ecd-bbdb-4911-9a7a-55efded33d73','父亲','李三',60,'务农','');
INSERT INTO `family` VALUES ('f4307606-3dc2-4db9-a322-42c8f01aadf9','父亲','人挺好',50,'务农','');
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
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
INSERT INTO `funds` VALUES ('bb914955-9412-408f-87b2-c6b78203a18e',1,NULL,NULL,'住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('bb914955-9412-408f-87b2-c6b78203a18e',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('bb914955-9412-408f-87b2-c6b78203a18e',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('bb914955-9412-408f-87b2-c6b78203a18e',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('bb914955-9412-408f-87b2-c6b78203a18e',3,NULL,NULL,NULL,NULL,'','');
INSERT INTO `funds` VALUES ('17daefb8-484a-490e-afcc-7165db72cdd5',1,NULL,NULL,'住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('17daefb8-484a-490e-afcc-7165db72cdd5',2,'10000','140000199508080001','机票费','',NULL,NULL);
INSERT INTO `funds` VALUES ('17daefb8-484a-490e-afcc-7165db72cdd5',2,'3000','140000199508080001','住宿费，餐费','吃喝玩乐',NULL,NULL);
INSERT INTO `funds` VALUES ('17daefb8-484a-490e-afcc-7165db72cdd5',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('17daefb8-484a-490e-afcc-7165db72cdd5',3,NULL,NULL,NULL,NULL,'','');
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
INSERT INTO `inviter` VALUES ('5578d403-3bf4-4d20-9c7a-f77eaccf2c0b','Andrew Fox','安德鲁 福克斯','Professor','伯克利大学','University of California,Berkeley Berkeley, CA 94720','(510) 642-3175','andrew@berkeley.com','www.berkeley.edu','','');
INSERT INTO `inviter` VALUES ('82604f1a-5f01-4751-8936-5ff914a4ffb7','卡梅伦','英国首相','Premiere','英国议会','House of Parliament,London,SW1A 0AA','440-4833982','parliament@london.gov','parliament.en','','');
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
  `birthday` char(10) default NULL,
  `exp_date` char(10) default NULL,
  `account_book` varchar(255) default NULL,
  PRIMARY KEY  (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='护照信息表';

#
# Dumping data for table passport
#

LOCK TABLES `passport` WRITE;
/*!40000 ALTER TABLE `passport` DISABLE KEYS */;
INSERT INTO `passport` VALUES ('140000199503230002',NULL,NULL,'英国护照','李四','女','中国','1995-03-23','2021-01-01',NULL);
INSERT INTO `passport` VALUES ('140000199508080001','\\upload\\picture\\14\\15\\d982c5b1-73e4-490b-b59e-9ce2d6dab0e3_idcard.jpg','\\upload\\picture\\15\\14\\a32491b4-6cba-4745-832a-cc028e1780ea_passport.jpg','美利坚合众国护照','任浩航','男','华盛顿','1995-08-08','2019-01-01','\\upload\\picture\\15\\4\\5330f8e6-9292-4687-8435-6c86eaa1e4e5_accountbook.jpg');
/*!40000 ALTER TABLE `passport` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table publicity
#

DROP TABLE IF EXISTS `publicity`;
CREATE TABLE `publicity` (
  `id` char(36) NOT NULL,
  `members_id` char(36) default NULL,
  `visit_places` varchar(255) default NULL,
  `transfer_places` varchar(255) default NULL,
  `exit_date` date default NULL,
  `enter_date` date default NULL,
  `detailed_schedule` varchar(900) default NULL,
  `task_summary` varchar(600) default NULL,
  `visit_persons` varchar(600) default NULL,
  `budget` varchar(255) default NULL,
  `inviter_desc` varchar(600) default NULL,
  PRIMARY KEY  (`id`),
  KEY `members_id` (`members_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table publicity
#

LOCK TABLES `publicity` WRITE;
/*!40000 ALTER TABLE `publicity` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicity` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table review
#

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `application_id` char(36) NOT NULL default '',
  `apply_date` char(10) default NULL,
  `reject_reason` varchar(255) default NULL,
  `tutor_state` varchar(10) default NULL,
  `tutor_time` char(10) default NULL,
  `tutor_length` varchar(3) default NULL,
  `depart_lead_state` varchar(10) default NULL,
  `depart_lead_time` char(10) default NULL,
  `depart_lead_length` varchar(3) default NULL,
  `finance_state` varchar(10) default NULL,
  `finance_time` char(10) default NULL,
  `finance_length` varchar(3) default NULL,
  `hr_state` varchar(10) default NULL,
  `hr_time` char(10) default NULL,
  `hr_length` varchar(3) default NULL,
  `bks_state` varchar(10) default NULL,
  `bks_time` char(10) default NULL,
  `bks_length` varchar(3) default NULL,
  `yjs_state` varchar(10) default NULL,
  `yjs_time` char(10) default NULL,
  `yjs_length` varchar(3) default NULL,
  `xgb_state` varchar(10) default NULL,
  `xgb_time` char(10) default NULL,
  `xgb_length` varchar(3) default NULL,
  `ygb_state` varchar(10) default NULL,
  `ygb_time` char(10) default NULL,
  `ygb_length` varchar(3) default NULL,
  `internation_state` varchar(10) default NULL,
  `internation_time` char(10) default NULL,
  `internation_length` varchar(3) default NULL,
  `school_lead_state` varchar(10) default NULL,
  `school_lead_time` char(10) default NULL,
  `school_lead_length` varchar(3) default NULL,
  PRIMARY KEY  (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table review
#

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('17daefb8-484a-490e-afcc-7165db72cdd5','2016-07-13',NULL,NULL,NULL,NULL,'已审核','2016-07-13','0天','已审核','2016-07-13','0天',NULL,NULL,NULL,'已审核','2016-07-13','0天',NULL,NULL,NULL,'已审核','2016-07-13','0天',NULL,NULL,NULL,'已审核','2016-07-13','0天',NULL,NULL,NULL);
INSERT INTO `review` VALUES ('bb914955-9412-408f-87b2-c6b78203a18e','2016-07-13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table visit_destination
#

DROP TABLE IF EXISTS `visit_destination`;
CREATE TABLE `visit_destination` (
  `plan_id` char(36) NOT NULL default '',
  `country` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `arrive_date` char(10) default NULL,
  `exit_city_date` char(10) default NULL,
  `trans_addr` varchar(255) default NULL,
  KEY `DESTINATION` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出访计划表';

#
# Dumping data for table visit_destination
#

LOCK TABLES `visit_destination` WRITE;
/*!40000 ALTER TABLE `visit_destination` DISABLE KEYS */;
INSERT INTO `visit_destination` VALUES ('3d2dcd77-4dfa-4fcc-aee8-5c7b5b20d1ae','英国','伦敦','2016-08-03','2016-08-15','赫尔辛基');
INSERT INTO `visit_destination` VALUES ('3d2dcd77-4dfa-4fcc-aee8-5c7b5b20d1ae','爱尔兰','都柏林','2016-08-16','2016-08-31','');
INSERT INTO `visit_destination` VALUES ('81172bd5-4c79-44b0-a136-7cbc6134ef7c','美国','加利福尼亚州','2016-07-20','2017-07-20','');
/*!40000 ALTER TABLE `visit_destination` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table visit_members
#

DROP TABLE IF EXISTS `visit_members`;
CREATE TABLE `visit_members` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `unit` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table visit_members
#

LOCK TABLES `visit_members` WRITE;
/*!40000 ALTER TABLE `visit_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_members` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table visit_plan
#

DROP TABLE IF EXISTS `visit_plan`;
CREATE TABLE `visit_plan` (
  `plan_id` char(36) NOT NULL default '',
  `out_city` varchar(255) default NULL,
  `exit_border_date` char(10) default NULL,
  `back_city` varchar(255) default NULL,
  `enter_border_date` char(10) default NULL,
  PRIMARY KEY  (`plan_id`),
  UNIQUE KEY `plan_id_UNIQUE` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出访计划表';

#
# Dumping data for table visit_plan
#

LOCK TABLES `visit_plan` WRITE;
/*!40000 ALTER TABLE `visit_plan` DISABLE KEYS */;
INSERT INTO `visit_plan` VALUES ('3d2dcd77-4dfa-4fcc-aee8-5c7b5b20d1ae','北京','2016-08-01','上海','2016-09-01');
INSERT INTO `visit_plan` VALUES ('81172bd5-4c79-44b0-a136-7cbc6134ef7c','东营','2016-07-18','济南','2017-07-21');
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
INSERT INTO `visit_purpose` VALUES ('27c71b84-ada5-48cf-8b60-ef35029dec53','伦理学与人生','贝尔 格里尔斯','明星','荒野求生','','','','','','','','','','',NULL,'','');
INSERT INTO `visit_purpose` VALUES ('7faa35dc-6d04-4f4a-86ba-c3b6586163f9','','','','','','','','Andrew Fox','教授','软件工程','软件工程','','','',NULL,'','');
/*!40000 ALTER TABLE `visit_purpose` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table visit_record
#

DROP TABLE IF EXISTS `visit_record`;
CREATE TABLE `visit_record` (
  `id` char(36) NOT NULL,
  `name` varchar(255) default NULL,
  `sex` char(3) default NULL,
  `birthday` date default NULL,
  `political_status` char(24) default NULL,
  `health` varchar(255) default NULL,
  `secret_info` varchar(255) default NULL,
  `family_members` char(36) default NULL,
  `group_unit` varchar(255) default NULL,
  `position_in_group` varchar(255) default NULL,
  `places_info` varchar(600) default NULL,
  `latest_places` varchar(600) default NULL,
  `authority_unit` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `family_members` (`family_members`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table visit_record
#

LOCK TABLES `visit_record` WRITE;
/*!40000 ALTER TABLE `visit_record` DISABLE KEYS */;
INSERT INTO `visit_record` VALUES ('00ff8750-97ed-4164-9282-4f4ed8b73e79','任浩航','男','1995-08-08','团员','健康','山东大学 学生','03628911-9330-4f6e-aced-105403f07e5a','山东大学','学生','美国 1年','山东大学','山东大学');
INSERT INTO `visit_record` VALUES ('2087c825-b733-41ba-b25e-7e4fa5dba4c3','李四','女','1995-03-23','党员','健康','山东大学 辅导员','ed119ecd-bbdb-4911-9a7a-55efded33d73','山东大学','老师','英国','山东大学','山东大学');
INSERT INTO `visit_record` VALUES ('2d66b4f3-7572-49ae-8678-e14d2b712e0a','任浩航','男','1995-08-08','团员','健康','山东大学 学生','7a575735-303f-4f8b-8524-f56ce8edb482','山东大学','学生','美国 1年','山东大学','山东大学');
INSERT INTO `visit_record` VALUES ('32c3be44-dc10-4cec-9095-a3d1b57b9dfa','任浩航','男','1995-08-08','团员','健康','山东大学 学生','407b4f29-a2a9-4158-a8e9-11e181a9f457','山东大学','学生','美国 1年','山东大学','山东大学');
INSERT INTO `visit_record` VALUES ('a328100d-aeb3-4154-b2dc-8aba2ee767a2','任浩航','男','1995-08-08','团员','健康','山东大学 学生','1c0c60a0-2ab5-4414-b696-99fc6e71101d','山东大学','学生','美国 1年','山东大学','山东大学');
INSERT INTO `visit_record` VALUES ('a5370ad0-3b51-45e0-be34-f6b6611bbbfe','任浩航','男','1995-08-08','团员','健康','山东大学 学生','b5c4152e-5076-46a5-8827-3b4956d3fe74','山东大学','学生','美国 1年','山东大学','山东大学');
INSERT INTO `visit_record` VALUES ('bbd24af7-8e67-4d46-afc1-22f7fb1b46de','任浩航','男','1995-08-08','团员','健康','山东大学 学生','f4307606-3dc2-4db9-a322-42c8f01aadf9','山东大学','学生','美国 1年','山东大学','山东大学');
INSERT INTO `visit_record` VALUES ('de8b2f0c-c305-4e31-840c-417707d65e74','任浩航','男','1995-08-08','团员','健康','山东大学 学生','8eb88214-1d64-4a33-9e82-4c7d951cba88','山东大学','学生','美国 1年','山东大学','山东大学');
INSERT INTO `visit_record` VALUES ('ec81f3d2-f93b-47a6-bff4-6fa9294d97f5','任浩航','男','1995-08-08','团员','健康','山东大学 学生','ae3a5a61-2aa4-4ac9-8a37-50fa433c3021','山东大学','学生','美国 1年','山东大学','山东大学');
INSERT INTO `visit_record` VALUES ('efd48e4e-b678-4976-b935-97918e1c9dc9','任浩航','男','1995-08-08','团员','健康','山东大学 学生','483b77b9-2938-47d5-a910-f4afff05f761','山东大学','学生','美国 1年','山东大学','山东大学');
/*!40000 ALTER TABLE `visit_record` ENABLE KEYS */;
UNLOCK TABLES;

#
#  Foreign keys for table application
#

ALTER TABLE `application`
ADD CONSTRAINT `APPLICATION_FK_PLAN` FOREIGN KEY (`plan`) REFERENCES `visit_plan` (`plan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_PUBLICITY` FOREIGN KEY (`public_notification_id`) REFERENCES `publicity` (`id`),
ADD CONSTRAINT `FK_RECORD` FOREIGN KEY (`record_id`) REFERENCES `visit_record` (`id`);

#
#  Foreign keys for table funds
#

ALTER TABLE `funds`
ADD CONSTRAINT `FUNDS_FK_APPLICATION` FOREIGN KEY (`id`) REFERENCES `application` (`application_number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table publicity
#

ALTER TABLE `publicity`
ADD CONSTRAINT `publicity_ibfk_1` FOREIGN KEY (`members_id`) REFERENCES `visit_members` (`id`);

#
#  Foreign keys for table visit_destination
#

ALTER TABLE `visit_destination`
ADD CONSTRAINT `DESTINATION` FOREIGN KEY (`plan_id`) REFERENCES `visit_plan` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

#
#  Foreign keys for table visit_record
#

ALTER TABLE `visit_record`
ADD CONSTRAINT `visit_record_ibfk_1` FOREIGN KEY (`family_members`) REFERENCES `family` (`id`);


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
