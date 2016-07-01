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
  `invitation_raw` varchar(255) default NULL,
  `invitation_zh` varchar(255) default NULL,
  `plan` char(36) default NULL,
  `purpose` char(36) default NULL,
  `passport_info` char(18) default NULL,
  `type` char(6) default NULL,
  `conference_name` varchar(255) default NULL,
  `conference_desc` mediumtext,
  `speech_outline` mediumtext,
  `papers_outline` mediumtext,
  `group_unit` varchar(255) default NULL,
  `examine_unit` varchar(255) default NULL,
  `group_work` varchar(255) default NULL,
  `group_members` varchar(255) default NULL,
  `inviter_info` char(36) default NULL,
  `identify_type` varchar(255) default NULL,
  `licence_type` char(6) default NULL,
  `inviter_pay` varchar(255) default NULL,
  `funds_id` char(36) default NULL,
  `loan` tinyint(1) default NULL,
  PRIMARY KEY  (`application_number`),
  KEY `APPLICATION_FK_PURPOSE` (`purpose`),
  KEY `APPLICATION_FK_INVITER` (`inviter_info`),
  KEY `APPLICATION_FK_PLAN` (`plan`),
  KEY `APPLICAITON_FK_PASSWORD` (`passport_info`),
  KEY `APPLICATION_FK_FUNDS` (`funds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短期/长期出访申请表';

#
# Dumping data for table application
#

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table funds
#

DROP TABLE IF EXISTS `funds`;
CREATE TABLE `funds` (
  `id` char(36) NOT NULL default '',
  `pay_type` tinyint(1) default NULL,
  `pay_item` varchar(255) default NULL,
  `account_name` varchar(255) default NULL,
  `funds_account` varchar(255) default NULL,
  `prove_file` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经费负担情况';

#
# Dumping data for table funds
#

LOCK TABLES `funds` WRITE;
/*!40000 ALTER TABLE `funds` DISABLE KEYS */;
/*!40000 ALTER TABLE `funds` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table inviter
#

DROP TABLE IF EXISTS `inviter`;
CREATE TABLE `inviter` (
  `id` char(36) NOT NULL default '',
  `title` varchar(255) default NULL,
  `unit_name` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `telephone` varchar(45) default NULL,
  `email` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邀请人信息表';

#
# Dumping data for table inviter
#

LOCK TABLES `inviter` WRITE;
/*!40000 ALTER TABLE `inviter` DISABLE KEYS */;
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
  `account_book` varchar(255) default NULL,
  PRIMARY KEY  (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='护照信息表';

#
# Dumping data for table passport
#

LOCK TABLES `passport` WRITE;
/*!40000 ALTER TABLE `passport` DISABLE KEYS */;
/*!40000 ALTER TABLE `passport` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table visit_destination
#

DROP TABLE IF EXISTS `visit_destination`;
CREATE TABLE `visit_destination` (
  `destination` varchar(255) default NULL,
  `arrival_date` datetime default NULL,
  `exit_city_date` datetime default NULL,
  `trans_addr` varchar(255) default NULL,
  `plan_id` char(36) NOT NULL default '',
  KEY `DESTINATION` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出访计划表';

#
# Dumping data for table visit_destination
#

LOCK TABLES `visit_destination` WRITE;
/*!40000 ALTER TABLE `visit_destination` DISABLE KEYS */;
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
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出访目的表';

#
# Dumping data for table visit_purpose
#

LOCK TABLES `visit_purpose` WRITE;
/*!40000 ALTER TABLE `visit_purpose` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_purpose` ENABLE KEYS */;
UNLOCK TABLES;

#
#  Foreign keys for table application
#

ALTER TABLE `application`
ADD CONSTRAINT `APPLICAITON_FK_PASSWORD` FOREIGN KEY (`passport_info`) REFERENCES `passport` (`identity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `APPLICATION_FK_INVITER` FOREIGN KEY (`inviter_info`) REFERENCES `inviter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `APPLICATION_FK_PLAN` FOREIGN KEY (`plan`) REFERENCES `visit_plan` (`plan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `APPLICATION_FK_PURPOSE` FOREIGN KEY (`purpose`) REFERENCES `visit_purpose` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table visit_destination
#

ALTER TABLE `visit_destination`
ADD CONSTRAINT `DESTINATION` FOREIGN KEY (`plan_id`) REFERENCES `visit_plan` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE;


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
