-- MySQL dump 10.13  Distrib 5.7.13, for Win64 (x86_64)
--
-- Host: localhost    Database: management
-- ------------------------------------------------------
-- Server version	5.7.13-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `application_number` char(32) NOT NULL,
  `invitation_raw` varchar(255) DEFAULT NULL,
  `invitation_zh` varchar(255) DEFAULT NULL,
  `plan` char(32) DEFAULT NULL,
  `purpose` char(32) DEFAULT NULL,
  `passport_info` char(18) DEFAULT NULL,
  `type` char(6) DEFAULT NULL,
  `conference_name` varchar(255) DEFAULT NULL,
  `conference_desc` mediumtext,
  `speech_outline` mediumtext,
  `papers_outline` mediumtext,
  `group_unit` varchar(255) DEFAULT NULL,
  `examine_unit` varchar(255) DEFAULT NULL,
  `group_work` varchar(255) DEFAULT NULL,
  `group_members` varchar(255) DEFAULT NULL,
  `inviter_info` char(32) DEFAULT NULL,
  `identify_type` varchar(255) DEFAULT NULL,
  `licence_type` char(6) DEFAULT NULL,
  `inviter_pay` varchar(255) DEFAULT NULL,
  `funds_id` char(32) DEFAULT NULL,
  `loan` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`application_number`),
  KEY `APPLICATION_FK_PURPOSE` (`purpose`),
  KEY `APPLICATION_FK_INVITER` (`inviter_info`),
  KEY `APPLICATION_FK_PLAN` (`plan`),
  KEY `APPLICAITON_FK_PASSWORD` (`passport_info`),
  KEY `APPLICATION_FK_FUNDS` (`funds_id`),
  CONSTRAINT `APPLICAITON_FK_PASSWORD` FOREIGN KEY (`passport_info`) REFERENCES `passport` (`identity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `APPLICATION_FK_FUNDS` FOREIGN KEY (`funds_id`) REFERENCES `funds` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `APPLICATION_FK_INVITER` FOREIGN KEY (`inviter_info`) REFERENCES `inviter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `APPLICATION_FK_PLAN` FOREIGN KEY (`plan`) REFERENCES `visit_plan` (`plan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `APPLICATION_FK_PURPOSE` FOREIGN KEY (`purpose`) REFERENCES `visit_purpose` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短期/长期出访申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funds`
--

DROP TABLE IF EXISTS `funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funds` (
  `id` char(32) NOT NULL,
  `pay_type` tinyint(1) DEFAULT NULL,
  `pay_item` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `funds_account` varchar(255) DEFAULT NULL,
  `prove_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经费负担情况';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funds`
--

LOCK TABLES `funds` WRITE;
/*!40000 ALTER TABLE `funds` DISABLE KEYS */;
/*!40000 ALTER TABLE `funds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inviter`
--

DROP TABLE IF EXISTS `inviter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inviter` (
  `id` char(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邀请人信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inviter`
--

LOCK TABLES `inviter` WRITE;
/*!40000 ALTER TABLE `inviter` DISABLE KEYS */;
/*!40000 ALTER TABLE `inviter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passport`
--

DROP TABLE IF EXISTS `passport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passport` (
  `identity` char(18) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `account_book` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='护照信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passport`
--

LOCK TABLES `passport` WRITE;
/*!40000 ALTER TABLE `passport` DISABLE KEYS */;
/*!40000 ALTER TABLE `passport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_destination`
--

DROP TABLE IF EXISTS `visit_destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_destination` (
  `destination` varchar(255) DEFAULT NULL,
  `arrival_date` datetime(6) DEFAULT NULL,
  `exit_city_date` datetime(6) DEFAULT NULL,
  `trans_addr` varchar(255) DEFAULT NULL,
  `plan_id` char(32) NOT NULL,
  KEY `DESTINATION` (`plan_id`),
  CONSTRAINT `DESTINATION` FOREIGN KEY (`plan_id`) REFERENCES `visit_plan` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出访计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_destination`
--

LOCK TABLES `visit_destination` WRITE;
/*!40000 ALTER TABLE `visit_destination` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_plan`
--

DROP TABLE IF EXISTS `visit_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_plan` (
  `plan_id` char(32) NOT NULL,
  `out_city` varchar(255) DEFAULT NULL,
  `exit_border_date` datetime(6) DEFAULT NULL,
  `back_city` varchar(255) DEFAULT NULL,
  `enter_border_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  UNIQUE KEY `plan_id_UNIQUE` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出访计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_plan`
--

LOCK TABLES `visit_plan` WRITE;
/*!40000 ALTER TABLE `visit_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_purpose`
--

DROP TABLE IF EXISTS `visit_purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_purpose` (
  `id` char(32) NOT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `partner_name` varchar(255) DEFAULT NULL,
  `partner_title` varchar(255) DEFAULT NULL,
  `partner_expertise` varchar(255) DEFAULT NULL,
  `cooperation_content` mediumtext,
  `train_content` mediumtext,
  `study_content` mediumtext,
  `teacher_name` varchar(255) DEFAULT NULL,
  `teacher_title` varchar(255) DEFAULT NULL,
  `teacher_expertise` varchar(255) DEFAULT NULL,
  `degree_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出访目的表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_purpose`
--

LOCK TABLES `visit_purpose` WRITE;
/*!40000 ALTER TABLE `visit_purpose` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_purpose` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-29 17:39:57
