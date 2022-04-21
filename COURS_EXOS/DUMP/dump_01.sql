-- MySQL dump 10.13  Distrib 5.7.32, for osx10.12 (x86_64)
--
-- Host: localhost    Database: db_aviation
-- ------------------------------------------------------
-- Server version	5.7.32

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `comp` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_street` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`comp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES ('AUS','Shenton Park','Perth','australia',20),('CHI','Qinghai','Xian de Tongde','china',17),('FRE1','Rue de la Lieure','Voiron','france',11),('ITA','mapoli','Rome','ITALIA Air',20),('SIN','Marymount','Singapour','singa',1);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilots`
--

DROP TABLE IF EXISTS `pilots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilots` (
  `certificate` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus` smallint(5) unsigned DEFAULT NULL,
  `num_flying` decimal(7,1) DEFAULT NULL,
  `company` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plane` enum('A380','A320','A340') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_day` datetime DEFAULT NULL,
  `next_flight` datetime DEFAULT NULL,
  `num_jobs` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`certificate`),
  KEY `fk_pilots_company` (`company`),
  CONSTRAINT `fk_pilots_company` FOREIGN KEY (`company`) REFERENCES `companies` (`comp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilots`
--

LOCK TABLES `pilots` WRITE;
/*!40000 ALTER TABLE `pilots` DISABLE KEYS */;
INSERT INTO `pilots` VALUES ('ct-1',1000,90.0,'AUS','Alan','A380',NULL,NULL,0),('ct-10',500,90.0,'FRE1','Tom','A320',NULL,NULL,0),('ct-100',500,200.0,'SIN','Yi','A340','1978-02-04 00:00:00','2020-12-04 09:50:52',10),('ct-11',1000,200.0,'AUS','Sophie','A380','1978-10-17 00:00:00','2020-06-11 12:00:52',50),('ct-12',1000,190.0,'AUS','Albert','A380','1990-04-04 00:00:00','2020-05-08 12:50:52',10),('ct-16',500,190.0,'SIN','Yan','A340','1998-01-04 00:00:00','2020-05-08 12:50:52',30),('ct-56',2000,300.0,'AUS','Benoit','A380','2000-01-04 00:00:00','2020-02-04 12:50:52',7),('ct-6',500,20.0,'FRE1','John','A320','2000-01-04 00:00:00','2020-12-04 12:50:52',13),('ct-7',500,80.0,'CHI','Pierre','A320','1977-01-04 00:00:00','2020-05-04 12:50:52',8);
/*!40000 ALTER TABLE `pilots` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-24  9:38:30
