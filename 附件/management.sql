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
INSERT INTO `application` VALUES ('f76851ad-ea5b-4a6f-8fa3-b87195f0cc79','140000199508080001','','2016-07-12','140000199508080001','本科','72ceeba5-b220-4f8d-beee-a18c90af7a31','c7220fbd-6602-45ab-9fd1-42507905a990','攻读学位','长期','否','','','','','53378da5-c084-46f8-899c-b493c80ec6b8','因公证照',2,0,NULL,NULL,NULL,'0000000000');
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
INSERT INTO `funds` VALUES ('f76851ad-ea5b-4a6f-8fa3-b87195f0cc79',1,NULL,NULL,'住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('f76851ad-ea5b-4a6f-8fa3-b87195f0cc79',2,'10000','140000199508080001','机票费','',NULL,NULL);
INSERT INTO `funds` VALUES ('f76851ad-ea5b-4a6f-8fa3-b87195f0cc79',2,'3000','140000199508080001','其他','吃喝玩乐',NULL,NULL);
INSERT INTO `funds` VALUES ('f76851ad-ea5b-4a6f-8fa3-b87195f0cc79',2,'','','住宿费，餐费','',NULL,NULL);
INSERT INTO `funds` VALUES ('f76851ad-ea5b-4a6f-8fa3-b87195f0cc79',3,NULL,NULL,NULL,NULL,'','');
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
INSERT INTO `inviter` VALUES ('53378da5-c084-46f8-899c-b493c80ec6b8','Andrew Fox','安德鲁 福克斯','Professor','伯克利大学','University of California,Berkeley Berkeley, CA 94720','(510) 642-3175','andrew@berkeley.com','www.berkeley.edu','','');
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
INSERT INTO `review` VALUES ('f76851ad-ea5b-4a6f-8fa3-b87195f0cc79','2016-07-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `visit_destination` VALUES ('72ceeba5-b220-4f8d-beee-a18c90af7a31','美国','加利福尼亚州','2016-07-20','2017-07-20','');
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
INSERT INTO `visit_plan` VALUES ('72ceeba5-b220-4f8d-beee-a18c90af7a31','东营','2016-07-18','济南','2017-07-21');
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
INSERT INTO `visit_purpose` VALUES ('c7220fbd-6602-45ab-9fd1-42507905a990','','','','','','','','Andrew Fox','教授','软件工程','软件工程','','','',NULL,'','');
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

# 创建公式表中的团组成员信息
create table `visit_members` (`id` char(36) not null,`name` varchar(255),`unit` varchar(255),`title` varchar(255), primary key (`id`,`name`)) engine=InnoDB default charset=utf8;

# 创建公示表
create table `publicity` (`id` char(36) not null,`members_id` char(36),`visit_places` varchar(255),`transfer_places` varchar(255),`exit_date` date,`enter_date` date,`detailed_schedule` varchar(900),`task_summary` varchar(600),`visit_persons` varchar(600),`budget` varchar(255),`inviter_desc` varchar(600), primary key (`id`), foreign key(`members_id`) references `visit_members`(`id`)) engine=InnoDB default charset=utf8;

# 为application表添加关于公示表的外键
alter table `application` add constraint FK_PUBLICITY foreign key(`public_notification_id`) references `publicity`(`id`);

# 创建备案表中的家庭成员表
create table `family` (`id` char(36) not null,`appellation` varchar(255),`name` varchar(255),`age` int(3),`political_status` char(24),`other_info` varchar(255),primary key (`id`,`name`)) engine=InnoDB default charset=utf8;

# 创建出访备案表
create table `visit_record` (`id` char(36) not null,`name` varchar(255),`sex` char(3),`birthday` date,`political_status` char(24),`health` varchar(255),`secret_info` varchar(255),`family_members` char(36),`group_unit` varchar(255),`position_in_group` varchar(255),`places_info` varchar(600),`latest_places` varchar(600),`authority_unit` varchar(255),primary key (`id`),foreign key (`family_members`) references `family`(`id`)) engine=InnoDB default charset=utf8;

# 为application表添加关于出访备案表的外键
alter table `application` add constraint FK_RECORD foreign key (`record_id`) references `visit_record`(`id`);


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
