# MySQL-Front 5.1  (Build 4.2)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: human_resource_db
# ------------------------------------------------------
# Server version 5.0.22-community-nt

#
# Source for table emergency_contact_person
#

DROP TABLE IF EXISTS `emergency_contact_person`;
CREATE TABLE `emergency_contact_person` (
  `id` char(36) NOT NULL default '0',
  `name` varchar(20) NOT NULL default '',
  `email` varchar(40) default NULL,
  `mobile_phone` varchar(20) default NULL,
  `fixed_phone` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='紧急联系人表';

#
# Dumping data for table emergency_contact_person
#

LOCK TABLES `emergency_contact_person` WRITE;
/*!40000 ALTER TABLE `emergency_contact_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_contact_person` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table human_resource
#

DROP TABLE IF EXISTS `human_resource`;
CREATE TABLE `human_resource` (
  `id` char(18) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `role` varchar(10) default 'r10',
  `name_ch` varchar(20) default NULL,
  `name_en` varchar(50) default NULL,
  `sex` char(4) default '男',
  `name_pinyin` varchar(30) default NULL,
  `other_name` varchar(50) default NULL,
  `birthday` date default '1990-01-01',
  `position` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `passport` varchar(40) default NULL,
  `email` varchar(40) default NULL,
  `mobile_phone` varchar(20) default NULL,
  `fixed_phone` varchar(20) default NULL,
  `emergency_contact_person` char(36) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人事表';

#
# Dumping data for table human_resource
#

LOCK TABLES `human_resource` WRITE;
/*!40000 ALTER TABLE `human_resource` DISABLE KEYS */;
INSERT INTO `human_resource` VALUES ('140000199503230002','1234','r10','李四','Lee','男','Li Si',NULL,'1995-08-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `human_resource` VALUES ('140000199503230001','','r10','张三','Jung','男',NULL,NULL,'1995-12-23',NULL,NULL,NULL,NULL,NULL,NULL,'d47ed4e2-8b9d-4368-8931-ab86f23e46ae');
INSERT INTO `human_resource` VALUES ('140000199503230003','1234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `human_resource` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
