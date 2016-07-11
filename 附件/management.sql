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
  KEY `APPLICATION_FK_PLAN` (`plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短期/长期出访申请表';

#
# Dumping data for table application
#

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES ('05a6df6b-ee32-41b5-8407-31dcc5cb6141','140000199508080001','140000199503230002','2016-07-11','140000199503230002','学生','692b788f-191b-4c50-b7c4-2d35c43142f6','cf2c2705-b955-469d-aba5-1e0a6dc7d883','任教','长期','是','山东大学','北京市出入境管理局','讲师','\\upload\\file\\7\\10\\57e9688f-7bcb-48f6-bc93-5057894a0be9_recruitment.pdf','6aaa1161-49c9-4d71-86fc-4b91bba57400','因私证照',2,0,NULL,NULL,NULL,'0000000000');
INSERT INTO `application` VALUES ('6abedcd2-e2d9-46e4-89ae-6531177a9998','140000199508080001','140000199503230002','2016-07-11','140000199503230002','行政','82062432-f1b6-414f-bde2-5ff987c4e71b','ea316a97-3522-434a-b9e3-ab898183e6ba','参加国际会议','短期','是','山东大学','山东大学','议员','\\upload\\file\\8\\9\\04feacac-7ad2-46d3-a42f-ff18235ed222_国际事务部出入境管理系统设计文档.docx','725f0d3b-3b19-44f1-9639-440750993377','因公证照',0,1,NULL,NULL,NULL,'0000000000');
INSERT INTO `application` VALUES ('86220436-a12b-4a3c-9fea-595152aea412','140000199508080001','140000199503230002','2016-07-11','140000199503230002','学生','f7ce43aa-08d2-4431-a94f-f242f0a87982','e50c1115-355e-4198-8dd6-b23bbadde4d9','任教','长期','是','山东大学','北京市出入境管理局','讲师','\\upload\\file\\12\\11\\bb0c9278-1c7b-4631-a1c8-4910c77657fe_国际事务部出入境管理系统设计文档.docx','7430932f-f2d4-487c-a082-213642e9e6bb','因私证照',2,0,NULL,NULL,NULL,'0000000000');
INSERT INTO `application` VALUES ('beb09897-0e6c-4f7e-bde9-738d88adc793','140000199508080001','','2016-07-11','140000199508080001','学生','a0999a2b-5933-4a71-9a77-9536482b67ca','81dc2eb2-5656-4622-bdbd-2bfa36b367b0','培训','长期','是','山东大学','山东大学','倒垃圾','\\upload\\file\\1\\7\\f567e87b-87dc-45a8-b42b-5e7e99e203d1_设计文档.docx','8a8d0b48-2607-49e3-8fa6-8394a79da4ba','因公证照',1,0,NULL,NULL,NULL,'0000000000');
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
INSERT INTO `funds` VALUES ('beb09897-0e6c-4f7e-bde9-738d88adc793',1,NULL,NULL,'住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('beb09897-0e6c-4f7e-bde9-738d88adc793',2,'3000','123','其他','嫖娼',NULL,NULL);
INSERT INTO `funds` VALUES ('beb09897-0e6c-4f7e-bde9-738d88adc793',2,'10000','456','机票费','',NULL,NULL);
INSERT INTO `funds` VALUES ('beb09897-0e6c-4f7e-bde9-738d88adc793',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('beb09897-0e6c-4f7e-bde9-738d88adc793',3,NULL,NULL,NULL,NULL,'','');
INSERT INTO `funds` VALUES ('6abedcd2-e2d9-46e4-89ae-6531177a9998',1,NULL,NULL,'住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('6abedcd2-e2d9-46e4-89ae-6531177a9998',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('6abedcd2-e2d9-46e4-89ae-6531177a9998',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('6abedcd2-e2d9-46e4-89ae-6531177a9998',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('6abedcd2-e2d9-46e4-89ae-6531177a9998',3,NULL,NULL,NULL,NULL,'','');
INSERT INTO `funds` VALUES ('86220436-a12b-4a3c-9fea-595152aea412',1,NULL,NULL,'住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('86220436-a12b-4a3c-9fea-595152aea412',2,'10000','123','机票费','',NULL,NULL);
INSERT INTO `funds` VALUES ('86220436-a12b-4a3c-9fea-595152aea412',2,'3000','123','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('86220436-a12b-4a3c-9fea-595152aea412',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('86220436-a12b-4a3c-9fea-595152aea412',3,NULL,NULL,NULL,NULL,'5000 公务经费','');
INSERT INTO `funds` VALUES ('05a6df6b-ee32-41b5-8407-31dcc5cb6141',1,NULL,NULL,'住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('05a6df6b-ee32-41b5-8407-31dcc5cb6141',2,'10000','123','机票费','',NULL,NULL);
INSERT INTO `funds` VALUES ('05a6df6b-ee32-41b5-8407-31dcc5cb6141',2,'3000','123','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('05a6df6b-ee32-41b5-8407-31dcc5cb6141',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('05a6df6b-ee32-41b5-8407-31dcc5cb6141',3,NULL,NULL,NULL,NULL,'5000 公务经费','');
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
INSERT INTO `inviter` VALUES ('6aaa1161-49c9-4d71-86fc-4b91bba57400','卡梅伦','英国首相','Premiere','英国议会',' House of Parliament,London,SW1A 0AA','1111111','parliament@london.gov','parliament.en','','');
INSERT INTO `inviter` VALUES ('725f0d3b-3b19-44f1-9639-440750993377','沙特王子三世','沙特王子三世','Prince','沙特皇室','迪拜亚特兰蒂斯酒店','88888888','atlantis@royal.com','atlantis.royal.com','','');
INSERT INTO `inviter` VALUES ('7430932f-f2d4-487c-a082-213642e9e6bb','卡梅伦','英国首相','Premiere','英国议会',' House of Parliament,London,SW1A 0AA','1111111','parliament@london.gov','parliament.en','','');
INSERT INTO `inviter` VALUES ('8a8d0b48-2607-49e3-8fa6-8394a79da4ba','奥巴马','美国总统','President','白宫','华盛顿特区','440-4833982','obama@gmail.com','www.whitehouse.gov','\\upload\\file\\14\\6\\5f79d0b0-5042-4857-bfce-6bf10b8a74f8_国际事务部出入境管理系统设计文档.docx','');
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
INSERT INTO `passport` VALUES ('140000199503230002',NULL,NULL,'英国护照','李四','女','伦敦','1995-03-23','2021-01-01',NULL);
INSERT INTO `passport` VALUES ('140000199508080001','\\upload\\picture\\14\\15\\d982c5b1-73e4-490b-b59e-9ce2d6dab0e3_idcard.jpg','\\upload\\picture\\15\\14\\a32491b4-6cba-4745-832a-cc028e1780ea_passport.jpg','美利坚合众国护照','任浩航','男','华盛顿','1995-08-08','2019-01-01','\\upload\\picture\\15\\4\\5330f8e6-9292-4687-8435-6c86eaa1e4e5_accountbook.jpg');
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
INSERT INTO `visit_destination` VALUES ('a0999a2b-5933-4a71-9a77-9536482b67ca','美国','旧金山','2016-07-19','2016-07-24','');
INSERT INTO `visit_destination` VALUES ('82062432-f1b6-414f-bde2-5ff987c4e71b','阿拉伯联合酋长国','迪拜','2016-07-20','2016-07-22','哈萨克斯坦');
INSERT INTO `visit_destination` VALUES ('82062432-f1b6-414f-bde2-5ff987c4e71b','马来西亚','吉隆坡','2016-07-23','2016-07-24','');
INSERT INTO `visit_destination` VALUES ('f7ce43aa-08d2-4431-a94f-f242f0a87982','英国','伦敦','2016-07-20','2016-12-31','赫尔辛基');
INSERT INTO `visit_destination` VALUES ('f7ce43aa-08d2-4431-a94f-f242f0a87982','爱尔兰','都柏林','2017-01-01','2017-07-01','');
INSERT INTO `visit_destination` VALUES ('692b788f-191b-4c50-b7c4-2d35c43142f6','英国','伦敦','2016-07-20','2016-12-31','赫尔辛基');
INSERT INTO `visit_destination` VALUES ('692b788f-191b-4c50-b7c4-2d35c43142f6','爱尔兰','都柏林','2017-01-01','2017-07-01','');
/*!40000 ALTER TABLE `visit_destination` ENABLE KEYS */;
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
INSERT INTO `visit_plan` VALUES ('692b788f-191b-4c50-b7c4-2d35c43142f6','北京','2016-07-18','上海','2017-07-03');
INSERT INTO `visit_plan` VALUES ('82062432-f1b6-414f-bde2-5ff987c4e71b','济南','2016-07-18','济南','2016-07-25');
INSERT INTO `visit_plan` VALUES ('a0999a2b-5933-4a71-9a77-9536482b67ca','东营','2016-07-18','枣庄','2016-08-01');
INSERT INTO `visit_plan` VALUES ('f7ce43aa-08d2-4431-a94f-f242f0a87982','北京','2016-07-18','上海','2017-07-03');
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
INSERT INTO `visit_purpose` VALUES ('81dc2eb2-5656-4622-bdbd-2bfa36b367b0','','','','','','软件工程','','','','','','','','',NULL,'','');
INSERT INTO `visit_purpose` VALUES ('cf2c2705-b955-469d-aba5-1e0a6dc7d883','伦理学与人生','贝尔 格里尔斯','明星','荒野求生','','','','','','','','','','',NULL,'','');
INSERT INTO `visit_purpose` VALUES ('e50c1115-355e-4198-8dd6-b23bbadde4d9','伦理学与人生','贝尔 格里尔斯','明星','荒野求生','','','','','','','','','','',NULL,'','');
INSERT INTO `visit_purpose` VALUES ('ea316a97-3522-434a-b9e3-ab898183e6ba','','','','','','','','','','','','世界气候大会','World Weather Meeting','世界各国领导人出席会议，商讨全球气候问题','0','\\upload\\file\\15\\13\\c30f4351-1800-4c33-a80c-8f123e63f167_实习推荐表模板（供参考）.docx','如何防止臭氧层破坏');
/*!40000 ALTER TABLE `visit_purpose` ENABLE KEYS */;
UNLOCK TABLES;

#
#  Foreign keys for table application
#

ALTER TABLE `application`
ADD CONSTRAINT `APPLICATION_FK_PLAN` FOREIGN KEY (`plan`) REFERENCES `visit_plan` (`plan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
