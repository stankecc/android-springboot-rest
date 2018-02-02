-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: car_service
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.29-MariaDB

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
-- Table structure for table `fuel_type`
--

DROP TABLE IF EXISTS `fuel_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_type` (
  `FUEL_TYPE_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `FUEL_TYPE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FUEL_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_type`
--

LOCK TABLES `fuel_type` WRITE;
/*!40000 ALTER TABLE `fuel_type` DISABLE KEYS */;
INSERT INTO `fuel_type` VALUES (1,'Diesel'),(2,'Gasoline'),(3,'Hybrid'),(4,'Electric'),(5,'CNG'),(6,'Ethanol');
/*!40000 ALTER TABLE `fuel_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ROLE_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `ROLE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Standard User - Has no admin rights','STANDARD_USER'),(2,'Admin User - Has permission to perform admin tasks','ADMIN_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `SERVICE_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `VEHICLE_ID` bigint(19) DEFAULT NULL,
  `USER_ID` bigint(19) DEFAULT NULL,
  `USER_VEHICLE_ID` bigint(19) DEFAULT NULL,
  `SERVICE_TYPE_ID` bigint(19) DEFAULT NULL,
  `DATE_PERFORMED` varchar(255) DEFAULT NULL,
  `DISTANCE_PASSED` decimal(6,4) DEFAULT NULL,
  `PRICE` decimal(6,4) DEFAULT NULL,
  PRIMARY KEY (`SERVICE_ID`),
  KEY `FK8e4s0klc1xdmf3dwoy16k7fmi` (`SERVICE_TYPE_ID`),
  KEY `FK21kefim0cvfxud7lrcnxctq9r` (`USER_ID`),
  KEY `FKprdwob3inh8oq0aq246bcuse0` (`USER_VEHICLE_ID`),
  KEY `FK6fnmjdjln3oexu231vwf1e5kh` (`VEHICLE_ID`),
  CONSTRAINT `FK21kefim0cvfxud7lrcnxctq9r` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `FK6fnmjdjln3oexu231vwf1e5kh` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `vehicle` (`VEHICLE_ID`),
  CONSTRAINT `FK8e4s0klc1xdmf3dwoy16k7fmi` FOREIGN KEY (`SERVICE_TYPE_ID`) REFERENCES `service_type` (`SERVICE_TYPE_ID`),
  CONSTRAINT `FKprdwob3inh8oq0aq246bcuse0` FOREIGN KEY (`USER_VEHICLE_ID`) REFERENCES `user_vehicle` (`USER_VEHICLE_ID`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `vehicle` (`VEHICLE_ID`),
  CONSTRAINT `service_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `service_ibfk_3` FOREIGN KEY (`USER_VEHICLE_ID`) REFERENCES `user_vehicle` (`USER_VEHICLE_ID`),
  CONSTRAINT `service_ibfk_4` FOREIGN KEY (`SERVICE_TYPE_ID`) REFERENCES `service_type` (`SERVICE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_type`
--

DROP TABLE IF EXISTS `service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_type` (
  `SERVICE_TYPE_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `SERVICE_TYPE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SERVICE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_type`
--

LOCK TABLES `service_type` WRITE;
/*!40000 ALTER TABLE `service_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john.doe','821f498d827d4edad2ed0960408a98edceb661d9f34287ceda2962417881231a','John','Doe'),(2,'admin.admin','821f498d827d4edad2ed0960408a98edceb661d9f34287ceda2962417881231a','Admin','Admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `USER_ROLE_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(19) NOT NULL,
  `ROLE_ID` bigint(19) NOT NULL,
  PRIMARY KEY (`USER_ROLE_ID`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`ROLE_ID`),
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`USER_ID`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1),(2,2,1),(3,2,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vehicle`
--

DROP TABLE IF EXISTS `user_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_vehicle` (
  `USER_VEHICLE_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `VEHICLE_ID` bigint(19) DEFAULT NULL,
  `USER_ID` bigint(19) DEFAULT NULL,
  `ACTIVE` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_VEHICLE_ID`),
  KEY `FKmvyxrhqaahtrdkj1ku3gxglla` (`USER_ID`),
  KEY `FKf7ny54rwjf0aq9r0ky2ei7ta0` (`VEHICLE_ID`),
  CONSTRAINT `FKf7ny54rwjf0aq9r0ky2ei7ta0` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `vehicle` (`VEHICLE_ID`),
  CONSTRAINT `FKmvyxrhqaahtrdkj1ku3gxglla` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `user_vehicle_ibfk_1` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `vehicle` (`VEHICLE_ID`),
  CONSTRAINT `user_vehicle_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vehicle`
--

LOCK TABLES `user_vehicle` WRITE;
/*!40000 ALTER TABLE `user_vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `VEHICLE_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `VEHICLE_MODEL_ID` bigint(19) DEFAULT NULL,
  `FUEL_TYPE_ID` bigint(19) DEFAULT NULL,
  `AVERAGE_FUEL_CONSUMPTION` decimal(6,4) DEFAULT NULL,
  `DISTANCE_DRIVEN` decimal(6,4) DEFAULT NULL,
  `ENGINE_POWER` int(11) DEFAULT NULL,
  `ENGINE_SIZE` decimal(6,4) DEFAULT NULL,
  `PRODUCTION_YEAR` varchar(20) DEFAULT NULL,
  `REGISTRATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`VEHICLE_ID`),
  KEY `FKd7tqnhepx1tiespf9xdpkeseo` (`FUEL_TYPE_ID`),
  KEY `FKjtchj1qk6y3jdm3ycsbaoci6q` (`VEHICLE_MODEL_ID`),
  CONSTRAINT `FKd7tqnhepx1tiespf9xdpkeseo` FOREIGN KEY (`FUEL_TYPE_ID`) REFERENCES `fuel_type` (`FUEL_TYPE_ID`),
  CONSTRAINT `FKjtchj1qk6y3jdm3ycsbaoci6q` FOREIGN KEY (`VEHICLE_MODEL_ID`) REFERENCES `vehicle_model` (`VEHICLE_MODEL_ID`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`VEHICLE_MODEL_ID`) REFERENCES `vehicle_model` (`VEHICLE_MODEL_ID`),
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`FUEL_TYPE_ID`) REFERENCES `fuel_type` (`FUEL_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_brand`
--

DROP TABLE IF EXISTS `vehicle_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_brand` (
  `VEHICLE_BRAND_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `BRAND_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VEHICLE_BRAND_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_brand`
--

LOCK TABLES `vehicle_brand` WRITE;
/*!40000 ALTER TABLE `vehicle_brand` DISABLE KEYS */;
INSERT INTO `vehicle_brand` VALUES (1,'Acura'),(2,'Alfa Romeo'),(3,'AMC'),(4,'Aston Martin'),(5,'Audi'),(6,'Avanti'),(7,'Bentley'),(8,'BMW'),(9,'Buick'),(10,'Cadillac'),(11,'Chevrolet'),(12,'Chrysler'),(13,'Daewoo'),(14,'Daihatsu'),(15,'Datsun'),(16,'DeLorean'),(17,'Dodge'),(18,'Eagle'),(19,'Ferrari'),(20,'FIAT'),(21,'Fisker'),(22,'Ford'),(23,'Freightliner'),(24,'Geo'),(25,'GMC'),(26,'Honda'),(27,'HUMMER'),(28,'Hyundai'),(29,'Infiniti'),(30,'Isuzu'),(31,'Jaguar'),(32,'Jeep'),(33,'Kia'),(34,'Lamborghini'),(35,'Lancia'),(36,'Land Rover'),(37,'Lexus'),(38,'Lincoln'),(39,'Lotus'),(40,'Maserati'),(41,'Maybach'),(42,'Mazda'),(43,'McLaren'),(44,'Mercedes-Benz'),(45,'Mercury'),(46,'Merkur'),(47,'MINI'),(48,'Mitsubishi'),(49,'Nissan'),(50,'Oldsmobile'),(51,'Peugeot'),(52,'Plymouth'),(53,'Pontiac'),(54,'Porsche'),(55,'RAM'),(56,'Renault'),(57,'Rolls-Royce'),(58,'Saab'),(59,'Saturn'),(60,'Scion'),(61,'smart'),(62,'SRT'),(63,'Sterling'),(64,'Subaru'),(65,'Suzuki'),(66,'Tesla'),(67,'Toyota'),(68,'Triumph'),(69,'Volkswagen'),(70,'Volvo'),(71,'Yugo');
/*!40000 ALTER TABLE `vehicle_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_model`
--

DROP TABLE IF EXISTS `vehicle_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_model` (
  `VEHICLE_MODEL_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `VEHICLE_BRAND_ID` bigint(19) DEFAULT NULL,
  `VEHICLE_TYPE_ID` bigint(19) DEFAULT NULL,
  `MODEL_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VEHICLE_MODEL_ID`),
  KEY `FKs7iitybspgqp6r38li2eqx28n` (`VEHICLE_BRAND_ID`),
  KEY `FKlsks76bnwy2sk36bovx0upych` (`VEHICLE_TYPE_ID`),
  CONSTRAINT `FKlsks76bnwy2sk36bovx0upych` FOREIGN KEY (`VEHICLE_TYPE_ID`) REFERENCES `vehicle_type` (`VEHICLE_TYPE_ID`),
  CONSTRAINT `FKs7iitybspgqp6r38li2eqx28n` FOREIGN KEY (`VEHICLE_BRAND_ID`) REFERENCES `vehicle_brand` (`VEHICLE_BRAND_ID`),
  CONSTRAINT `vehicle_model_ibfk_1` FOREIGN KEY (`VEHICLE_BRAND_ID`) REFERENCES `vehicle_brand` (`VEHICLE_BRAND_ID`),
  CONSTRAINT `vehicle_model_ibfk_2` FOREIGN KEY (`VEHICLE_TYPE_ID`) REFERENCES `vehicle_type` (`VEHICLE_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1315 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_model`
--

LOCK TABLES `vehicle_model` WRITE;
/*!40000 ALTER TABLE `vehicle_model` DISABLE KEYS */;
INSERT INTO `vehicle_model` VALUES (1,1,NULL,'CL Models (4)'),(2,1,NULL,' - 2.2CL'),(3,1,NULL,' - 2.3CL'),(4,1,NULL,' - 3.0CL'),(5,1,NULL,' - 3.2CL'),(6,1,NULL,'ILX'),(7,1,NULL,'Integra'),(8,1,NULL,'Legend'),(9,1,NULL,'MDX'),(10,1,NULL,'NSX'),(11,1,NULL,'RDX'),(12,1,NULL,'RL Models (2)'),(13,1,NULL,' - 3.5 RL'),(14,1,NULL,' - RL'),(15,1,NULL,'RSX'),(16,1,NULL,'SLX'),(17,1,NULL,'TL Models (3)'),(18,1,NULL,' - 2.5TL'),(19,1,NULL,' - 3.2TL'),(20,1,NULL,' - TL'),(21,1,NULL,'TSX'),(22,1,NULL,'Vigor'),(23,1,NULL,'ZDX'),(24,1,NULL,'Other Acura Models'),(25,2,NULL,'164'),(26,2,NULL,'8C Competizione'),(27,2,NULL,'GTV-6'),(28,2,NULL,'Milano'),(29,2,NULL,'Spider'),(30,2,NULL,'Other Alfa Romeo Models'),(31,3,NULL,'Alliance'),(32,3,NULL,'Concord'),(33,3,NULL,'Eagle'),(34,3,NULL,'Encore'),(35,3,NULL,'Spirit'),(36,3,NULL,'Other AMC Models'),(37,4,NULL,'DB7'),(38,4,NULL,'DB9'),(39,4,NULL,'DBS'),(40,4,NULL,'Lagonda'),(41,4,NULL,'Rapide'),(42,4,NULL,'V12 Vantage'),(43,4,NULL,'V8 Vantage'),(44,4,NULL,'Vanquish'),(45,4,NULL,'Virage'),(46,4,NULL,'Other Aston Martin Models'),(47,5,NULL,'100'),(48,5,NULL,'200'),(49,5,NULL,'4000'),(50,5,NULL,'5000'),(51,5,NULL,'80'),(52,5,NULL,'90'),(53,5,NULL,'A3'),(54,5,NULL,'A4'),(55,5,NULL,'A5'),(56,5,NULL,'A6'),(57,5,NULL,'A7'),(58,5,NULL,'A8'),(59,5,NULL,'allroad'),(60,5,NULL,'Cabriolet'),(61,5,NULL,'Coupe'),(62,5,NULL,'Q3'),(63,5,NULL,'Q5'),(64,5,NULL,'Q7'),(65,5,NULL,'Quattro'),(66,5,NULL,'R8'),(67,5,NULL,'RS 4'),(68,5,NULL,'RS 5'),(69,5,NULL,'RS 6'),(70,5,NULL,'S4'),(71,5,NULL,'S5'),(72,5,NULL,'S6'),(73,5,NULL,'S7'),(74,5,NULL,'S8'),(75,5,NULL,'TT'),(76,5,NULL,'TT RS'),(77,5,NULL,'TTS'),(78,5,NULL,'V8 Quattro'),(79,5,NULL,'Other Audi Models'),(80,6,NULL,'Convertible'),(81,6,NULL,'Coupe'),(82,6,NULL,'Sedan'),(83,6,NULL,'Other Avanti Models'),(84,7,NULL,'Arnage'),(85,7,NULL,'Azure'),(86,7,NULL,'Brooklands'),(87,7,NULL,'Continental'),(88,7,NULL,'Corniche'),(89,7,NULL,'Eight'),(90,7,NULL,'Mulsanne'),(91,7,NULL,'Turbo R'),(92,7,NULL,'Other Bentley Models'),(93,8,NULL,'1 Series (3)'),(94,8,NULL,' - 128i'),(95,8,NULL,' - 135i'),(96,8,NULL,' - 135is'),(97,8,NULL,'3 Series (29)'),(98,8,NULL,' - 318i'),(99,8,NULL,' - 318iC'),(100,8,NULL,' - 318iS'),(101,8,NULL,' - 318ti'),(102,8,NULL,' - 320i'),(103,8,NULL,' - 323ci'),(104,8,NULL,' - 323i'),(105,8,NULL,' - 323is'),(106,8,NULL,' - 323iT'),(107,8,NULL,' - 325Ci'),(108,8,NULL,' - 325e'),(109,8,NULL,' - 325es'),(110,8,NULL,' - 325i'),(111,8,NULL,' - 325is'),(112,8,NULL,' - 325iX'),(113,8,NULL,' - 325xi'),(114,8,NULL,' - 328Ci'),(115,8,NULL,' - 328i'),(116,8,NULL,' - 328iS'),(117,8,NULL,' - 328xi'),(118,8,NULL,' - 330Ci'),(119,8,NULL,' - 330i'),(120,8,NULL,' - 330xi'),(121,8,NULL,' - 335d'),(122,8,NULL,' - 335i'),(123,8,NULL,' - 335is'),(124,8,NULL,' - 335xi'),(125,8,NULL,' - ActiveHybrid 3'),(126,8,NULL,' - 325'),(127,8,NULL,'5 Series (19)'),(128,8,NULL,' - 524td'),(129,8,NULL,' - 525i'),(130,8,NULL,' - 525xi'),(131,8,NULL,' - 528e'),(132,8,NULL,' - 528i'),(133,8,NULL,' - 528iT'),(134,8,NULL,' - 528xi'),(135,8,NULL,' - 530i'),(136,8,NULL,' - 530iT'),(137,8,NULL,' - 530xi'),(138,8,NULL,' - 533i'),(139,8,NULL,' - 535i'),(140,8,NULL,' - 535i Gran Turismo'),(141,8,NULL,' - 535xi'),(142,8,NULL,' - 540i'),(143,8,NULL,' - 545i'),(144,8,NULL,' - 550i'),(145,8,NULL,' - 550i Gran Turismo'),(146,8,NULL,' - ActiveHybrid 5'),(147,8,NULL,'6 Series (8)'),(148,8,NULL,' - 633CSi'),(149,8,NULL,' - 635CSi'),(150,8,NULL,' - 640i'),(151,8,NULL,' - 640i Gran Coupe'),(152,8,NULL,' - 645Ci'),(153,8,NULL,' - 650i'),(154,8,NULL,' - 650i Gran Coupe'),(155,8,NULL,' - L6'),(156,8,NULL,'7 Series (15)'),(157,8,NULL,' - 733i'),(158,8,NULL,' - 735i'),(159,8,NULL,' - 735iL'),(160,8,NULL,' - 740i'),(161,8,NULL,' - 740iL'),(162,8,NULL,' - 740Li'),(163,8,NULL,' - 745i'),(164,8,NULL,' - 745Li'),(165,8,NULL,' - 750i'),(166,8,NULL,' - 750iL'),(167,8,NULL,' - 750Li'),(168,8,NULL,' - 760i'),(169,8,NULL,' - 760Li'),(170,8,NULL,' - ActiveHybrid 7'),(171,8,NULL,' - Alpina B7'),(172,8,NULL,'8 Series (4)'),(173,8,NULL,' - 840Ci'),(174,8,NULL,' - 850Ci'),(175,8,NULL,' - 850CSi'),(176,8,NULL,' - 850i'),(177,8,NULL,'L Series (1)'),(178,8,NULL,' - L7'),(179,8,NULL,'M Series (8)'),(180,8,NULL,' - 1 Series M'),(181,8,NULL,' - M Coupe'),(182,8,NULL,' - M Roadster'),(183,8,NULL,' - M3'),(184,8,NULL,' - M5'),(185,8,NULL,' - M6'),(186,8,NULL,' - X5 M'),(187,8,NULL,' - X6 M'),(188,8,NULL,'X Series (5)'),(189,8,NULL,' - ActiveHybrid X6'),(190,8,NULL,' - X1'),(191,8,NULL,' - X3'),(192,8,NULL,' - X5'),(193,8,NULL,' - X6'),(194,8,NULL,'Z Series (3)'),(195,8,NULL,' - Z3'),(196,8,NULL,' - Z4'),(197,8,NULL,' - Z8'),(198,8,NULL,'Other BMW Models'),(199,9,NULL,'Century'),(200,9,NULL,'Electra'),(201,9,NULL,'Enclave'),(202,9,NULL,'Encore'),(203,9,NULL,'LaCrosse'),(204,9,NULL,'Le Sabre'),(205,9,NULL,'Lucerne'),(206,9,NULL,'Park Avenue'),(207,9,NULL,'Rainier'),(208,9,NULL,'Reatta'),(209,9,NULL,'Regal'),(210,9,NULL,'Rendezvous'),(211,9,NULL,'Riviera'),(212,9,NULL,'Roadmaster'),(213,9,NULL,'Skyhawk'),(214,9,NULL,'Skylark'),(215,9,NULL,'Somerset'),(216,9,NULL,'Terraza'),(217,9,NULL,'Verano'),(218,9,NULL,'Other Buick Models'),(219,10,NULL,'Allante'),(220,10,NULL,'ATS'),(221,10,NULL,'Brougham'),(222,10,NULL,'Catera'),(223,10,NULL,'Cimarron'),(224,10,NULL,'CTS'),(225,10,NULL,'De Ville'),(226,10,NULL,'DTS'),(227,10,NULL,'Eldorado'),(228,10,NULL,'Escalade'),(229,10,NULL,'Escalade ESV'),(230,10,NULL,'Escalade EXT'),(231,10,NULL,'Fleetwood'),(232,10,NULL,'Seville'),(233,10,NULL,'SRX'),(234,10,NULL,'STS'),(235,10,NULL,'XLR'),(236,10,NULL,'XTS'),(237,10,NULL,'Other Cadillac Models'),(238,11,NULL,'Astro'),(239,11,NULL,'Avalanche'),(240,11,NULL,'Aveo'),(241,11,NULL,'Aveo5'),(242,11,NULL,'Beretta'),(243,11,NULL,'Blazer'),(244,11,NULL,'Camaro'),(245,11,NULL,'Caprice'),(246,11,NULL,'Captiva Sport'),(247,11,NULL,'Cavalier'),(248,11,NULL,'Celebrity'),(249,11,NULL,'Chevette'),(250,11,NULL,'Citation'),(251,11,NULL,'Cobalt'),(252,11,NULL,'Colorado'),(253,11,NULL,'Corsica'),(254,11,NULL,'Corvette'),(255,11,NULL,'Cruze'),(256,11,NULL,'El Camino'),(257,11,NULL,'Equinox'),(258,11,NULL,'Express Van'),(259,11,NULL,'G Van'),(260,11,NULL,'HHR'),(261,11,NULL,'Impala'),(262,11,NULL,'Kodiak C4500'),(263,11,NULL,'Lumina'),(264,11,NULL,'Lumina APV'),(265,11,NULL,'LUV'),(266,11,NULL,'Malibu'),(267,11,NULL,'Metro'),(268,11,NULL,'Monte Carlo'),(269,11,NULL,'Nova'),(270,11,NULL,'Prizm'),(271,11,NULL,'S10 Blazer'),(272,11,NULL,'S10 Pickup'),(273,11,NULL,'Silverado and other C/K1500'),(274,11,NULL,'Silverado and other C/K2500'),(275,11,NULL,'Silverado and other C/K3500'),(276,11,NULL,'Sonic'),(277,11,NULL,'Spark'),(278,11,NULL,'Spectrum'),(279,11,NULL,'Sprint'),(280,11,NULL,'SSR'),(281,11,NULL,'Suburban'),(282,11,NULL,'Tahoe'),(283,11,NULL,'Tracker'),(284,11,NULL,'TrailBlazer'),(285,11,NULL,'TrailBlazer EXT'),(286,11,NULL,'Traverse'),(287,11,NULL,'Uplander'),(288,11,NULL,'Venture'),(289,11,NULL,'Volt'),(290,11,NULL,'Other Chevrolet Models'),(291,12,NULL,'200'),(292,12,NULL,'300'),(293,12,NULL,'300M'),(294,12,NULL,'Aspen'),(295,12,NULL,'Caravan'),(296,12,NULL,'Cirrus'),(297,12,NULL,'Concorde'),(298,12,NULL,'Conquest'),(299,12,NULL,'Cordoba'),(300,12,NULL,'Crossfire'),(301,12,NULL,'E Class'),(302,12,NULL,'Fifth Avenue'),(303,12,NULL,'Grand Voyager'),(304,12,NULL,'Imperial'),(305,12,NULL,'Intrepid'),(306,12,NULL,'Laser'),(307,12,NULL,'LeBaron'),(308,12,NULL,'LHS'),(309,12,NULL,'Neon'),(310,12,NULL,'New Yorker'),(311,12,NULL,'Newport'),(312,12,NULL,'Pacifica'),(313,12,NULL,'Prowler'),(314,12,NULL,'PT Cruiser'),(315,12,NULL,'Sebring'),(316,12,NULL,'TC by Maserati'),(317,12,NULL,'Town & Country'),(318,12,NULL,'Voyager'),(319,12,NULL,'Other Chrysler Models'),(320,13,NULL,'Lanos'),(321,13,NULL,'Leganza'),(322,13,NULL,'Nubira'),(323,13,NULL,'Other Daewoo Models'),(324,14,NULL,'Charade'),(325,14,NULL,'Rocky'),(326,14,NULL,'Other Daihatsu Models'),(327,15,NULL,'200SX'),(328,15,NULL,'210'),(329,15,NULL,'280ZX'),(330,15,NULL,'300ZX'),(331,15,NULL,'310'),(332,15,NULL,'510'),(333,15,NULL,'720'),(334,15,NULL,'810'),(335,15,NULL,'Maxima'),(336,15,NULL,'Pickup'),(337,15,NULL,'Pulsar'),(338,15,NULL,'Sentra'),(339,15,NULL,'Stanza'),(340,15,NULL,'Other Datsun Models'),(341,16,NULL,'DMC-12'),(342,17,NULL,'400'),(343,17,NULL,'600'),(344,17,NULL,'Aries'),(345,17,NULL,'Avenger'),(346,17,NULL,'Caliber'),(347,17,NULL,'Caravan'),(348,17,NULL,'Challenger'),(349,17,NULL,'Charger'),(350,17,NULL,'Colt'),(351,17,NULL,'Conquest'),(352,17,NULL,'D/W Truck'),(353,17,NULL,'Dakota'),(354,17,NULL,'Dart'),(355,17,NULL,'Daytona'),(356,17,NULL,'Diplomat'),(357,17,NULL,'Durango'),(358,17,NULL,'Dynasty'),(359,17,NULL,'Grand Caravan'),(360,17,NULL,'Intrepid'),(361,17,NULL,'Journey'),(362,17,NULL,'Lancer'),(363,17,NULL,'Magnum'),(364,17,NULL,'Mirada'),(365,17,NULL,'Monaco'),(366,17,NULL,'Neon'),(367,17,NULL,'Nitro'),(368,17,NULL,'Omni'),(369,17,NULL,'Raider'),(370,17,NULL,'Ram 1500 Truck'),(371,17,NULL,'Ram 2500 Truck'),(372,17,NULL,'Ram 3500 Truck'),(373,17,NULL,'Ram 4500 Truck'),(374,17,NULL,'Ram 50 Truck'),(375,17,NULL,'RAM C/V'),(376,17,NULL,'Ram SRT-10'),(377,17,NULL,'Ram Van'),(378,17,NULL,'Ram Wagon'),(379,17,NULL,'Ramcharger'),(380,17,NULL,'Rampage'),(381,17,NULL,'Shadow'),(382,17,NULL,'Spirit'),(383,17,NULL,'Sprinter'),(384,17,NULL,'SRT-4'),(385,17,NULL,'St. Regis'),(386,17,NULL,'Stealth'),(387,17,NULL,'Stratus'),(388,17,NULL,'Viper'),(389,17,NULL,'Other Dodge Models'),(390,18,NULL,'Medallion'),(391,18,NULL,'Premier'),(392,18,NULL,'Summit'),(393,18,NULL,'Talon'),(394,18,NULL,'Vision'),(395,18,NULL,'Other Eagle Models'),(396,19,NULL,'308 GTB Quattrovalvole'),(397,19,NULL,'308 GTBI'),(398,19,NULL,'308 GTS Quattrovalvole'),(399,19,NULL,'308 GTSI'),(400,19,NULL,'328 GTB'),(401,19,NULL,'328 GTS'),(402,19,NULL,'348 GTB'),(403,19,NULL,'348 GTS'),(404,19,NULL,'348 Spider'),(405,19,NULL,'348 TB'),(406,19,NULL,'348 TS'),(407,19,NULL,'360'),(408,19,NULL,'456 GT'),(409,19,NULL,'456M GT'),(410,19,NULL,'458 Italia'),(411,19,NULL,'512 BBi'),(412,19,NULL,'512M'),(413,19,NULL,'512TR'),(414,19,NULL,'550 Maranello'),(415,19,NULL,'575M Maranello'),(416,19,NULL,'599 GTB Fiorano'),(417,19,NULL,'599 GTO'),(418,19,NULL,'612 Scaglietti'),(419,19,NULL,'California'),(420,19,NULL,'Enzo'),(421,19,NULL,'F355'),(422,19,NULL,'F40'),(423,19,NULL,'F430'),(424,19,NULL,'F50'),(425,19,NULL,'FF'),(426,19,NULL,'Mondial'),(427,19,NULL,'Testarossa'),(428,19,NULL,'Other Ferrari Models'),(429,20,NULL,'2000 Spider'),(430,20,NULL,'500'),(431,20,NULL,'Bertone X1/9'),(432,20,NULL,'Brava'),(433,20,NULL,'Pininfarina Spider'),(434,20,NULL,'Strada'),(435,20,NULL,'X1/9'),(436,20,NULL,'Other Fiat Models'),(437,21,NULL,'Karma'),(438,22,NULL,'Aerostar'),(439,22,NULL,'Aspire'),(440,22,NULL,'Bronco'),(441,22,NULL,'Bronco II'),(442,22,NULL,'C-MAX'),(443,22,NULL,'Club Wagon'),(444,22,NULL,'Contour'),(445,22,NULL,'Courier'),(446,22,NULL,'Crown Victoria'),(447,22,NULL,'E-150 and Econoline 150'),(448,22,NULL,'E-250 and Econoline 250'),(449,22,NULL,'E-350 and Econoline 350'),(450,22,NULL,'Edge'),(451,22,NULL,'Escape'),(452,22,NULL,'Escort'),(453,22,NULL,'Excursion'),(454,22,NULL,'EXP'),(455,22,NULL,'Expedition'),(456,22,NULL,'Expedition EL'),(457,22,NULL,'Explorer'),(458,22,NULL,'Explorer Sport Trac'),(459,22,NULL,'F100'),(460,22,NULL,'F150'),(461,22,NULL,'F250'),(462,22,NULL,'F350'),(463,22,NULL,'F450'),(464,22,NULL,'Fairmont'),(465,22,NULL,'Festiva'),(466,22,NULL,'Fiesta'),(467,22,NULL,'Five Hundred'),(468,22,NULL,'Flex'),(469,22,NULL,'Focus'),(470,22,NULL,'Freestar'),(471,22,NULL,'Freestyle'),(472,22,NULL,'Fusion'),(473,22,NULL,'Granada'),(474,22,NULL,'GT'),(475,22,NULL,'LTD'),(476,22,NULL,'Mustang'),(477,22,NULL,'Probe'),(478,22,NULL,'Ranger'),(479,22,NULL,'Taurus'),(480,22,NULL,'Taurus X'),(481,22,NULL,'Tempo'),(482,22,NULL,'Thunderbird'),(483,22,NULL,'Transit Connect'),(484,22,NULL,'Windstar'),(485,22,NULL,'ZX2 Escort'),(486,22,NULL,'Other Ford Models'),(487,23,NULL,'Sprinter'),(488,24,NULL,'Metro'),(489,24,NULL,'Prizm'),(490,24,NULL,'Spectrum'),(491,24,NULL,'Storm'),(492,24,NULL,'Tracker'),(493,24,NULL,'Other Geo Models'),(494,25,NULL,'Acadia'),(495,25,NULL,'Caballero'),(496,25,NULL,'Canyon'),(497,25,NULL,'Envoy'),(498,25,NULL,'Envoy XL'),(499,25,NULL,'Envoy XUV'),(500,25,NULL,'Jimmy'),(501,25,NULL,'Rally Wagon'),(502,25,NULL,'S15 Jimmy'),(503,25,NULL,'S15 Pickup'),(504,25,NULL,'Safari'),(505,25,NULL,'Savana'),(506,25,NULL,'Sierra C/K1500'),(507,25,NULL,'Sierra C/K2500'),(508,25,NULL,'Sierra C/K3500'),(509,25,NULL,'Sonoma'),(510,25,NULL,'Suburban'),(511,25,NULL,'Syclone'),(512,25,NULL,'Terrain'),(513,25,NULL,'TopKick C4500'),(514,25,NULL,'Typhoon'),(515,25,NULL,'Vandura'),(516,25,NULL,'Yukon'),(517,25,NULL,'Yukon XL'),(518,25,NULL,'Other GMC Models'),(519,26,NULL,'Accord'),(520,26,NULL,'Civic'),(521,26,NULL,'CR-V'),(522,26,NULL,'CR-Z'),(523,26,NULL,'CRX'),(525,26,NULL,' - Accord Crosstour'),(526,26,NULL,' - Crosstour'),(527,26,NULL,'Del Sol'),(528,26,NULL,'Element'),(529,26,NULL,'Fit'),(530,26,NULL,'Insight'),(531,26,NULL,'Odyssey'),(532,26,NULL,'Passport'),(533,26,NULL,'Pilot'),(534,26,NULL,'Prelude'),(535,26,NULL,'Ridgeline'),(536,26,NULL,'S2000'),(537,26,NULL,'Other Honda Models'),(538,27,NULL,'H1'),(539,27,NULL,'H2'),(540,27,NULL,'H3'),(541,27,NULL,'H3T'),(542,27,NULL,'Other Hummer Models'),(543,28,NULL,'Accent'),(544,28,NULL,'Azera'),(545,28,NULL,'Elantra'),(546,28,NULL,'Elantra Coupe'),(547,28,NULL,'Elantra Touring'),(548,28,NULL,'Entourage'),(549,28,NULL,'Equus'),(550,28,NULL,'Excel'),(551,28,NULL,'Genesis'),(552,28,NULL,'Genesis Coupe'),(553,28,NULL,'Santa Fe'),(554,28,NULL,'Scoupe'),(555,28,NULL,'Sonata'),(556,28,NULL,'Tiburon'),(557,28,NULL,'Tucson'),(558,28,NULL,'Veloster'),(559,28,NULL,'Veracruz'),(560,28,NULL,'XG300'),(561,28,NULL,'XG350'),(562,28,NULL,'Other Hyundai Models'),(563,29,NULL,'EX Models (2)'),(564,29,NULL,' - EX35'),(565,29,NULL,' - EX37'),(566,29,NULL,'FX Models (4)'),(567,29,NULL,' - FX35'),(568,29,NULL,' - FX37'),(569,29,NULL,' - FX45'),(570,29,NULL,' - FX50'),(571,29,NULL,'G Models (4)'),(572,29,NULL,' - G20'),(573,29,NULL,' - G25'),(574,29,NULL,' - G35'),(575,29,NULL,' - G37'),(576,29,NULL,'I Models (2)'),(577,29,NULL,' - I30'),(578,29,NULL,' - I35'),(579,29,NULL,'J Models (1)'),(580,29,NULL,' - J30'),(581,29,NULL,'JX Models (1)'),(582,29,NULL,' - JX35'),(583,29,NULL,'M Models (6)'),(584,29,NULL,' - M30'),(585,29,NULL,' - M35'),(586,29,NULL,' - M35h'),(587,29,NULL,' - M37'),(588,29,NULL,' - M45'),(589,29,NULL,' - M56'),(590,29,NULL,'Q Models (1)'),(591,29,NULL,' - Q45'),(592,29,NULL,'QX Models (2)'),(593,29,NULL,' - QX4'),(594,29,NULL,' - QX56'),(595,29,NULL,'Other Infiniti Models'),(596,30,NULL,'Amigo'),(597,30,NULL,'Ascender'),(598,30,NULL,'Axiom'),(599,30,NULL,'Hombre'),(600,30,NULL,'i-280'),(601,30,NULL,'i-290'),(602,30,NULL,'i-350'),(603,30,NULL,'i-370'),(604,30,NULL,'I-Mark'),(605,30,NULL,'Impulse'),(606,30,NULL,'Oasis'),(607,30,NULL,'Pickup'),(608,30,NULL,'Rodeo'),(609,30,NULL,'Stylus'),(610,30,NULL,'Trooper'),(611,30,NULL,'Trooper II'),(612,30,NULL,'VehiCROSS'),(613,30,NULL,'Other Isuzu Models'),(614,31,NULL,'S-Type'),(615,31,NULL,'X-Type'),(616,31,NULL,'XF'),(617,31,NULL,'XJ Series (10)'),(618,31,NULL,' - XJ12'),(619,31,NULL,' - XJ6'),(620,31,NULL,' - XJR'),(621,31,NULL,' - XJR-S'),(622,31,NULL,' - XJS'),(623,31,NULL,' - XJ Vanden Plas'),(624,31,NULL,' - XJ'),(625,31,NULL,' - XJ8'),(626,31,NULL,' - XJ8 L'),(627,31,NULL,' - XJ Sport'),(628,31,NULL,'XK Series (3)'),(629,31,NULL,' - XK8'),(630,31,NULL,' - XK'),(631,31,NULL,' - XKR'),(632,31,NULL,'Other Jaguar Models'),(633,32,NULL,'Cherokee'),(634,32,NULL,'CJ'),(635,32,NULL,'Comanche'),(636,32,NULL,'Commander'),(637,32,NULL,'Compass'),(638,32,NULL,'Grand Cherokee'),(639,32,NULL,'Grand Wagoneer'),(640,32,NULL,'Liberty'),(641,32,NULL,'Patriot'),(642,32,NULL,'Pickup'),(643,32,NULL,'Scrambler'),(644,32,NULL,'Wagoneer'),(645,32,NULL,'Wrangler'),(646,32,NULL,'Other Jeep Models'),(647,33,NULL,'Amanti'),(648,33,NULL,'Borrego'),(649,33,NULL,'Forte'),(650,33,NULL,'Forte Koup'),(651,33,NULL,'Optima'),(652,33,NULL,'Rio'),(653,33,NULL,'Rio5'),(654,33,NULL,'Rondo'),(655,33,NULL,'Sedona'),(656,33,NULL,'Sephia'),(657,33,NULL,'Sorento'),(658,33,NULL,'Soul'),(659,33,NULL,'Spectra'),(660,33,NULL,'Spectra5'),(661,33,NULL,'Sportage'),(662,33,NULL,'Other Kia Models'),(663,34,NULL,'Aventador'),(664,34,NULL,'Countach'),(665,34,NULL,'Diablo'),(666,34,NULL,'Gallardo'),(667,34,NULL,'Jalpa'),(668,34,NULL,'LM002'),(669,34,NULL,'Murcielago'),(670,34,NULL,'Other Lamborghini Models'),(671,35,NULL,'Beta'),(672,35,NULL,'Zagato'),(673,35,NULL,'Other Lancia Models'),(674,36,NULL,'Defender'),(675,36,NULL,'Discovery'),(676,36,NULL,'Freelander'),(677,36,NULL,'LR2'),(678,36,NULL,'LR3'),(679,36,NULL,'LR4'),(680,36,NULL,'Range Rover'),(681,36,NULL,'Range Rover Evoque'),(682,36,NULL,'Range Rover Sport'),(683,36,NULL,'Other Land Rover Models'),(684,37,NULL,'CT Models (1)'),(685,37,NULL,' - CT 200h'),(686,37,NULL,'ES Models (5)'),(687,37,NULL,' - ES 250'),(688,37,NULL,' - ES 300'),(689,37,NULL,' - ES 300h'),(690,37,NULL,' - ES 330'),(691,37,NULL,' - ES 350'),(692,37,NULL,'GS Models (6)'),(693,37,NULL,' - GS 300'),(694,37,NULL,' - GS 350'),(695,37,NULL,' - GS 400'),(696,37,NULL,' - GS 430'),(697,37,NULL,' - GS 450h'),(698,37,NULL,' - GS 460'),(699,37,NULL,'GX Models (2)'),(700,37,NULL,' - GX 460'),(701,37,NULL,' - GX 470'),(702,37,NULL,'HS Models (1)'),(703,37,NULL,' - HS 250h'),(704,37,NULL,'IS Models (6)'),(705,37,NULL,' - IS 250'),(706,37,NULL,' - IS 250C'),(707,37,NULL,' - IS 300'),(708,37,NULL,' - IS 350'),(709,37,NULL,' - IS 350C'),(710,37,NULL,' - IS F'),(711,37,NULL,'LFA'),(712,37,NULL,'LS Models (4)'),(713,37,NULL,' - LS 400'),(714,37,NULL,' - LS 430'),(715,37,NULL,' - LS 460'),(716,37,NULL,' - LS 600h'),(717,37,NULL,'LX Models (3)'),(718,37,NULL,' - LX 450'),(719,37,NULL,' - LX 470'),(720,37,NULL,' - LX 570'),(721,37,NULL,'RX Models (5)'),(722,37,NULL,' - RX 300'),(723,37,NULL,' - RX 330'),(724,37,NULL,' - RX 350'),(725,37,NULL,' - RX 400h'),(726,37,NULL,' - RX 450h'),(727,37,NULL,'SC Models (3)'),(728,37,NULL,' - SC 300'),(729,37,NULL,' - SC 400'),(730,37,NULL,' - SC 430'),(731,37,NULL,'Other Lexus Models'),(732,38,NULL,'Aviator'),(733,38,NULL,'Blackwood'),(734,38,NULL,'Continental'),(735,38,NULL,'LS'),(736,38,NULL,'Mark LT'),(737,38,NULL,'Mark VI'),(738,38,NULL,'Mark VII'),(739,38,NULL,'Mark VIII'),(740,38,NULL,'MKS'),(741,38,NULL,'MKT'),(742,38,NULL,'MKX'),(743,38,NULL,'MKZ'),(744,38,NULL,'Navigator'),(745,38,NULL,'Navigator L'),(746,38,NULL,'Town Car'),(747,38,NULL,'Zephyr'),(748,38,NULL,'Other Lincoln Models'),(749,39,NULL,'Elan'),(750,39,NULL,'Elise'),(751,39,NULL,'Esprit'),(752,39,NULL,'Evora'),(753,39,NULL,'Exige'),(754,39,NULL,'Other Lotus Models'),(755,40,NULL,'430'),(756,40,NULL,'Biturbo'),(757,40,NULL,'Coupe'),(758,40,NULL,'GranSport'),(759,40,NULL,'GranTurismo'),(760,40,NULL,'Quattroporte'),(761,40,NULL,'Spyder'),(762,40,NULL,'Other Maserati Models'),(763,41,NULL,'57'),(764,41,NULL,'62'),(765,41,NULL,'Other Maybach Models'),(766,42,NULL,'323'),(767,42,NULL,'626'),(768,42,NULL,'929'),(769,42,NULL,'B-Series Pickup'),(770,42,NULL,'CX-5'),(771,42,NULL,'CX-7'),(772,42,NULL,'CX-9'),(773,42,NULL,'GLC'),(774,42,NULL,'MAZDA2'),(775,42,NULL,'MAZDA3'),(776,42,NULL,'MAZDA5'),(777,42,NULL,'MAZDA6'),(778,42,NULL,'MAZDASPEED3'),(779,42,NULL,'MAZDASPEED6'),(780,42,NULL,'Miata MX5'),(781,42,NULL,'Millenia'),(782,42,NULL,'MPV'),(783,42,NULL,'MX3'),(784,42,NULL,'MX6'),(785,42,NULL,'Navajo'),(786,42,NULL,'Protege'),(787,42,NULL,'Protege5'),(788,42,NULL,'RX-7'),(789,42,NULL,'RX-8'),(790,42,NULL,'Tribute'),(791,42,NULL,'Other Mazda Models'),(792,43,NULL,'MP4-12C'),(793,44,NULL,'190 Class (2)'),(794,44,NULL,' - 190D'),(795,44,NULL,' - 190E'),(796,44,NULL,'240 Class (1)'),(797,44,NULL,' - 240D'),(798,44,NULL,'300 Class / E Class (6)'),(799,44,NULL,' - 300CD'),(800,44,NULL,' - 300CE'),(801,44,NULL,' - 300D'),(802,44,NULL,' - 300E'),(803,44,NULL,' - 300TD'),(804,44,NULL,' - 300TE'),(805,44,NULL,'C Class (13)'),(806,44,NULL,' - C220'),(807,44,NULL,' - C230'),(808,44,NULL,' - C240'),(809,44,NULL,' - C250'),(810,44,NULL,' - C280'),(811,44,NULL,' - C300'),(812,44,NULL,' - C320'),(813,44,NULL,' - C32 AMG'),(814,44,NULL,' - C350'),(815,44,NULL,' - C36 AMG'),(816,44,NULL,' - C43 AMG'),(817,44,NULL,' - C55 AMG'),(818,44,NULL,' - C63 AMG'),(819,44,NULL,'CL Class (6)'),(820,44,NULL,' - CL500'),(821,44,NULL,' - CL550'),(822,44,NULL,' - CL55 AMG'),(823,44,NULL,' - CL600'),(824,44,NULL,' - CL63 AMG'),(825,44,NULL,' - CL65 AMG'),(826,44,NULL,'CLK Class (7)'),(827,44,NULL,' - CLK320'),(828,44,NULL,' - CLK350'),(829,44,NULL,' - CLK430'),(830,44,NULL,' - CLK500'),(831,44,NULL,' - CLK550'),(832,44,NULL,' - CLK55 AMG'),(833,44,NULL,' - CLK63 AMG'),(834,44,NULL,'CLS Class (4)'),(835,44,NULL,' - CLS500'),(836,44,NULL,' - CLS550'),(837,44,NULL,' - CLS55 AMG'),(838,44,NULL,' - CLS63 AMG'),(839,44,NULL,'E Class (18)'),(840,44,NULL,' - 260E'),(841,44,NULL,' - 280CE'),(842,44,NULL,' - 280E'),(843,44,NULL,' - 400E'),(844,44,NULL,' - 500E'),(845,44,NULL,' - E300'),(846,44,NULL,' - E320'),(847,44,NULL,' - E320 Bluetec'),(848,44,NULL,' - E320 CDI'),(849,44,NULL,' - E350'),(850,44,NULL,' - E350 Bluetec'),(851,44,NULL,' - E400 Hybrid'),(852,44,NULL,' - E420'),(853,44,NULL,' - E430'),(854,44,NULL,' - E500'),(855,44,NULL,' - E550'),(856,44,NULL,' - E55 AMG'),(857,44,NULL,' - E63 AMG'),(858,44,NULL,'G Class (4)'),(859,44,NULL,' - G500'),(860,44,NULL,' - G550'),(861,44,NULL,' - G55 AMG'),(862,44,NULL,' - G63 AMG'),(863,44,NULL,'GL Class (5)'),(864,44,NULL,' - GL320 Bluetec'),(865,44,NULL,' - GL320 CDI'),(866,44,NULL,' - GL350 Bluetec'),(867,44,NULL,' - GL450'),(868,44,NULL,' - GL550'),(869,44,NULL,'GLK Class (1)'),(870,44,NULL,' - GLK350'),(871,44,NULL,'M Class (11)'),(872,44,NULL,' - ML320'),(873,44,NULL,' - ML320 Bluetec'),(874,44,NULL,' - ML320 CDI'),(875,44,NULL,' - ML350'),(876,44,NULL,' - ML350 Bluetec'),(877,44,NULL,' - ML430'),(878,44,NULL,' - ML450 Hybrid'),(879,44,NULL,' - ML500'),(880,44,NULL,' - ML550'),(881,44,NULL,' - ML55 AMG'),(882,44,NULL,' - ML63 AMG'),(883,44,NULL,'R Class (6)'),(884,44,NULL,' - R320 Bluetec'),(885,44,NULL,' - R320 CDI'),(886,44,NULL,' - R350'),(887,44,NULL,' - R350 Bluetec'),(888,44,NULL,' - R500'),(889,44,NULL,' - R63 AMG'),(890,44,NULL,'S Class (30)'),(891,44,NULL,' - 300SD'),(892,44,NULL,' - 300SDL'),(893,44,NULL,' - 300SE'),(894,44,NULL,' - 300SEL'),(895,44,NULL,' - 350SD'),(896,44,NULL,' - 350SDL'),(897,44,NULL,' - 380SE'),(898,44,NULL,' - 380SEC'),(899,44,NULL,' - 380SEL'),(900,44,NULL,' - 400SE'),(901,44,NULL,' - 400SEL'),(902,44,NULL,' - 420SEL'),(903,44,NULL,' - 500SEC'),(904,44,NULL,' - 500SEL'),(905,44,NULL,' - 560SEC'),(906,44,NULL,' - 560SEL'),(907,44,NULL,' - 600SEC'),(908,44,NULL,' - 600SEL'),(909,44,NULL,' - S320'),(910,44,NULL,' - S350'),(911,44,NULL,' - S350 Bluetec'),(912,44,NULL,' - S400 Hybrid'),(913,44,NULL,' - S420'),(914,44,NULL,' - S430'),(915,44,NULL,' - S500'),(916,44,NULL,' - S550'),(917,44,NULL,' - S55 AMG'),(918,44,NULL,' - S600'),(919,44,NULL,' - S63 AMG'),(920,44,NULL,' - S65 AMG'),(921,44,NULL,'SL Class (13)'),(922,44,NULL,' - 300SL'),(923,44,NULL,' - 380SL'),(924,44,NULL,' - 380SLC'),(925,44,NULL,' - 500SL'),(926,44,NULL,' - 560SL'),(927,44,NULL,' - 600SL'),(928,44,NULL,' - SL320'),(929,44,NULL,' - SL500'),(930,44,NULL,' - SL550'),(931,44,NULL,' - SL55 AMG'),(932,44,NULL,' - SL600'),(933,44,NULL,' - SL63 AMG'),(934,44,NULL,' - SL65 AMG'),(935,44,NULL,'SLK Class (8)'),(936,44,NULL,' - SLK230'),(937,44,NULL,' - SLK250'),(938,44,NULL,' - SLK280'),(939,44,NULL,' - SLK300'),(940,44,NULL,' - SLK320'),(941,44,NULL,' - SLK32 AMG'),(942,44,NULL,' - SLK350'),(943,44,NULL,' - SLK55 AMG'),(944,44,NULL,'SLR Class (1)'),(945,44,NULL,' - SLR'),(946,44,NULL,'SLS Class (1)'),(947,44,NULL,' - SLS AMG'),(948,44,NULL,'Sprinter Class (1)'),(949,44,NULL,' - Sprinter'),(950,44,NULL,'Other Mercedes-Benz Models'),(951,45,NULL,'Capri'),(952,45,NULL,'Cougar'),(953,45,NULL,'Grand Marquis'),(954,45,NULL,'Lynx'),(955,45,NULL,'Marauder'),(956,45,NULL,'Mariner'),(957,45,NULL,'Marquis'),(958,45,NULL,'Milan'),(959,45,NULL,'Montego'),(960,45,NULL,'Monterey'),(961,45,NULL,'Mountaineer'),(962,45,NULL,'Mystique'),(963,45,NULL,'Sable'),(964,45,NULL,'Topaz'),(965,45,NULL,'Tracer'),(966,45,NULL,'Villager'),(967,45,NULL,'Zephyr'),(968,45,NULL,'Other Mercury Models'),(969,46,NULL,'Scorpio'),(970,46,NULL,'XR4Ti'),(971,46,NULL,'Other Merkur Models'),(972,47,NULL,'Cooper Clubman Models (2)'),(973,47,NULL,' - Cooper Clubman'),(974,47,NULL,' - Cooper S Clubman'),(975,47,NULL,'Cooper Countryman Models (2)'),(976,47,NULL,' - Cooper Countryman'),(977,47,NULL,' - Cooper S Countryman'),(978,47,NULL,'Cooper Coupe Models (2)'),(979,47,NULL,' - Cooper Coupe'),(980,47,NULL,' - Cooper S Coupe'),(981,47,NULL,'Cooper Models (2)'),(982,47,NULL,' - Cooper'),(983,47,NULL,' - Cooper S'),(984,47,NULL,'Cooper Roadster Models (2)'),(985,47,NULL,' - Cooper Roadster'),(986,47,NULL,' - Cooper S Roadster'),(987,48,NULL,'3000GT'),(988,48,NULL,'Cordia'),(989,48,NULL,'Diamante'),(990,48,NULL,'Eclipse'),(991,48,NULL,'Endeavor'),(992,48,NULL,'Expo'),(993,48,NULL,'Galant'),(994,48,NULL,'i'),(995,48,NULL,'Lancer'),(996,48,NULL,'Lancer Evolution'),(997,48,NULL,'Mighty Max'),(998,48,NULL,'Mirage'),(999,48,NULL,'Montero'),(1000,48,NULL,'Montero Sport'),(1001,48,NULL,'Outlander'),(1002,48,NULL,'Outlander Sport'),(1003,48,NULL,'Precis'),(1004,48,NULL,'Raider'),(1005,48,NULL,'Sigma'),(1006,48,NULL,'Starion'),(1007,48,NULL,'Tredia'),(1008,48,NULL,'Van'),(1009,48,NULL,'Other Mitsubishi Models'),(1010,49,NULL,'200SX'),(1011,49,NULL,'240SX'),(1012,49,NULL,'300ZX'),(1013,49,NULL,'350Z'),(1014,49,NULL,'370Z'),(1015,49,NULL,'Altima'),(1016,49,NULL,'Armada'),(1017,49,NULL,'Axxess'),(1018,49,NULL,'Cube'),(1019,49,NULL,'Frontier'),(1020,49,NULL,'GT-R'),(1021,49,NULL,'Juke'),(1022,49,NULL,'Leaf'),(1023,49,NULL,'Maxima'),(1024,49,NULL,'Murano'),(1025,49,NULL,'Murano CrossCabriolet'),(1026,49,NULL,'NV'),(1027,49,NULL,'NX'),(1028,49,NULL,'Pathfinder'),(1029,49,NULL,'Pickup'),(1030,49,NULL,'Pulsar'),(1031,49,NULL,'Quest'),(1032,49,NULL,'Rogue'),(1033,49,NULL,'Sentra'),(1034,49,NULL,'Stanza'),(1035,49,NULL,'Titan'),(1036,49,NULL,'Van'),(1037,49,NULL,'Versa'),(1038,49,NULL,'Xterra'),(1039,49,NULL,'Other Nissan Models'),(1040,50,NULL,'88'),(1041,50,NULL,'Achieva'),(1042,50,NULL,'Alero'),(1043,50,NULL,'Aurora'),(1044,50,NULL,'Bravada'),(1045,50,NULL,'Custom Cruiser'),(1046,50,NULL,'Cutlass'),(1047,50,NULL,'Cutlass Calais'),(1048,50,NULL,'Cutlass Ciera'),(1049,50,NULL,'Cutlass Supreme'),(1050,50,NULL,'Firenza'),(1051,50,NULL,'Intrigue'),(1052,50,NULL,'Ninety-Eight'),(1053,50,NULL,'Omega'),(1054,50,NULL,'Regency'),(1055,50,NULL,'Silhouette'),(1056,50,NULL,'Toronado'),(1057,50,NULL,'Other Oldsmobile Models'),(1058,51,NULL,'405'),(1059,51,NULL,'504'),(1060,51,NULL,'505'),(1061,51,NULL,'604'),(1062,51,NULL,'Other Peugeot Models'),(1063,52,NULL,'Acclaim'),(1064,52,NULL,'Arrow'),(1065,52,NULL,'Breeze'),(1066,52,NULL,'Caravelle'),(1067,52,NULL,'Champ'),(1068,52,NULL,'Colt'),(1069,52,NULL,'Conquest'),(1070,52,NULL,'Gran Fury'),(1071,52,NULL,'Grand Voyager'),(1072,52,NULL,'Horizon'),(1073,52,NULL,'Laser'),(1074,52,NULL,'Neon'),(1075,52,NULL,'Prowler'),(1076,52,NULL,'Reliant'),(1077,52,NULL,'Sapporo'),(1078,52,NULL,'Scamp'),(1079,52,NULL,'Sundance'),(1080,52,NULL,'Trailduster'),(1081,52,NULL,'Voyager'),(1082,52,NULL,'Other Plymouth Models'),(1083,53,NULL,'1000'),(1084,53,NULL,'6000'),(1085,53,NULL,'Aztek'),(1086,53,NULL,'Bonneville'),(1087,53,NULL,'Catalina'),(1088,53,NULL,'Fiero'),(1089,53,NULL,'Firebird'),(1090,53,NULL,'G3'),(1091,53,NULL,'G5'),(1092,53,NULL,'G6'),(1093,53,NULL,'G8'),(1094,53,NULL,'Grand Am'),(1095,53,NULL,'Grand Prix'),(1096,53,NULL,'GTO'),(1097,53,NULL,'J2000'),(1098,53,NULL,'Le Mans'),(1099,53,NULL,'Montana'),(1100,53,NULL,'Parisienne'),(1101,53,NULL,'Phoenix'),(1102,53,NULL,'Safari'),(1103,53,NULL,'Solstice'),(1104,53,NULL,'Sunbird'),(1105,53,NULL,'Sunfire'),(1106,53,NULL,'Torrent'),(1107,53,NULL,'Trans Sport'),(1108,53,NULL,'Vibe'),(1109,53,NULL,'Other Pontiac Models'),(1110,54,NULL,'911'),(1111,54,NULL,'924'),(1112,54,NULL,'928'),(1113,54,NULL,'944'),(1114,54,NULL,'968'),(1115,54,NULL,'Boxster'),(1116,54,NULL,'Carrera GT'),(1117,54,NULL,'Cayenne'),(1118,54,NULL,'Cayman'),(1119,54,NULL,'Panamera'),(1120,54,NULL,'Other Porsche Models'),(1121,55,NULL,'1500'),(1122,55,NULL,'2500'),(1123,55,NULL,'3500'),(1124,55,NULL,'4500'),(1125,56,NULL,'18i'),(1126,56,NULL,'Fuego'),(1127,56,NULL,'Le Car'),(1128,56,NULL,'R18'),(1129,56,NULL,'Sportwagon'),(1130,56,NULL,'Other Renault Models'),(1131,57,NULL,'Camargue'),(1132,57,NULL,'Corniche'),(1133,57,NULL,'Ghost'),(1134,57,NULL,'Park Ward'),(1135,57,NULL,'Phantom'),(1136,57,NULL,'Silver Dawn'),(1137,57,NULL,'Silver Seraph'),(1138,57,NULL,'Silver Spirit'),(1139,57,NULL,'Silver Spur'),(1140,57,NULL,'Other Rolls-Royce Models'),(1141,58,NULL,'9-2X'),(1142,58,NULL,'9-3'),(1143,58,NULL,'9-4X'),(1144,58,NULL,'9-5'),(1145,58,NULL,'9-7X'),(1146,58,NULL,'900'),(1147,58,NULL,'9000'),(1148,58,NULL,'Other Saab Models'),(1149,59,NULL,'Astra'),(1150,59,NULL,'Aura'),(1151,59,NULL,'ION'),(1152,59,NULL,'L Series (3)'),(1153,59,NULL,' - L100'),(1154,59,NULL,' - L200'),(1155,59,NULL,' - L300'),(1156,59,NULL,'LS'),(1157,59,NULL,'LW Series (4)'),(1158,59,NULL,' - LW1'),(1159,59,NULL,' - LW2'),(1160,59,NULL,' - LW200'),(1161,59,NULL,' - LW300'),(1162,59,NULL,'Outlook'),(1163,59,NULL,'Relay'),(1164,59,NULL,'SC Series (2)'),(1165,59,NULL,' - SC1'),(1166,59,NULL,' - SC2'),(1167,59,NULL,'Sky'),(1168,59,NULL,'SL Series (3)'),(1169,59,NULL,' - SL'),(1170,59,NULL,' - SL1'),(1171,59,NULL,' - SL2'),(1172,59,NULL,'SW Series (2)'),(1173,59,NULL,' - SW1'),(1174,59,NULL,' - SW2'),(1175,59,NULL,'Vue'),(1176,59,NULL,'Other Saturn Models'),(1177,60,NULL,'FR-S'),(1178,60,NULL,'iQ'),(1179,60,NULL,'tC'),(1180,60,NULL,'xA'),(1181,60,NULL,'xB'),(1182,60,NULL,'xD'),(1183,61,NULL,'fortwo'),(1184,61,NULL,'Other smart Models'),(1185,62,NULL,'Viper'),(1186,63,NULL,'825'),(1187,63,NULL,'827'),(1188,63,NULL,'Other Sterling Models'),(1189,64,NULL,'Baja'),(1190,64,NULL,'Brat'),(1191,64,NULL,'BRZ'),(1192,64,NULL,'Forester'),(1193,64,NULL,'Impreza'),(1194,64,NULL,'Impreza WRX'),(1195,64,NULL,'Justy'),(1196,64,NULL,'L Series'),(1197,64,NULL,'Legacy'),(1198,64,NULL,'Loyale'),(1199,64,NULL,'Outback'),(1200,64,NULL,'SVX'),(1201,64,NULL,'Tribeca'),(1202,64,NULL,'XT'),(1203,64,NULL,'XV Crosstrek'),(1204,64,NULL,'Other Subaru Models'),(1205,65,NULL,'Aerio'),(1206,65,NULL,'Equator'),(1207,65,NULL,'Esteem'),(1208,65,NULL,'Forenza'),(1209,65,NULL,'Grand Vitara'),(1210,65,NULL,'Kizashi'),(1211,65,NULL,'Reno'),(1212,65,NULL,'Samurai'),(1213,65,NULL,'Sidekick'),(1214,65,NULL,'Swift'),(1215,65,NULL,'SX4'),(1216,65,NULL,'Verona'),(1217,65,NULL,'Vitara'),(1218,65,NULL,'X-90'),(1219,65,NULL,'XL7'),(1220,65,NULL,'Other Suzuki Models'),(1221,66,NULL,'Roadster'),(1222,67,NULL,'4Runner'),(1223,67,NULL,'Avalon'),(1224,67,NULL,'Camry'),(1225,67,NULL,'Celica'),(1226,67,NULL,'Corolla'),(1227,67,NULL,'Corona'),(1228,67,NULL,'Cressida'),(1229,67,NULL,'Echo'),(1230,67,NULL,'FJ Cruiser'),(1231,67,NULL,'Highlander'),(1232,67,NULL,'Land Cruiser'),(1233,67,NULL,'Matrix'),(1234,67,NULL,'MR2'),(1235,67,NULL,'MR2 Spyder'),(1236,67,NULL,'Paseo'),(1237,67,NULL,'Pickup'),(1238,67,NULL,'Previa'),(1239,67,NULL,'Prius'),(1240,67,NULL,'Prius C'),(1241,67,NULL,'Prius V'),(1242,67,NULL,'RAV4'),(1243,67,NULL,'Sequoia'),(1244,67,NULL,'Sienna'),(1245,67,NULL,'Solara'),(1246,67,NULL,'Starlet'),(1247,67,NULL,'Supra'),(1248,67,NULL,'T100'),(1249,67,NULL,'Tacoma'),(1250,67,NULL,'Tercel'),(1251,67,NULL,'Tundra'),(1252,67,NULL,'Van'),(1253,67,NULL,'Venza'),(1254,67,NULL,'Yaris'),(1255,67,NULL,'Other Toyota Models'),(1256,68,NULL,'TR7'),(1257,68,NULL,'TR8'),(1258,68,NULL,'Other Triumph Models'),(1259,69,NULL,'Beetle'),(1260,69,NULL,'Cabrio'),(1261,69,NULL,'Cabriolet'),(1262,69,NULL,'CC'),(1263,69,NULL,'Corrado'),(1264,69,NULL,'Dasher'),(1265,69,NULL,'Eos'),(1266,69,NULL,'Eurovan'),(1267,69,NULL,'Fox'),(1268,69,NULL,'GLI'),(1269,69,NULL,'Golf R'),(1270,69,NULL,'GTI'),(1271,69,NULL,'Golf and Rabbit Models (2)'),(1272,69,NULL,' - Golf'),(1273,69,NULL,' - Rabbit'),(1274,69,NULL,'Jetta'),(1275,69,NULL,'Passat'),(1276,69,NULL,'Phaeton'),(1277,69,NULL,'Pickup'),(1278,69,NULL,'Quantum'),(1279,69,NULL,'R32'),(1280,69,NULL,'Routan'),(1281,69,NULL,'Scirocco'),(1282,69,NULL,'Tiguan'),(1283,69,NULL,'Touareg'),(1284,69,NULL,'Vanagon'),(1285,69,NULL,'Other Volkswagen Models'),(1286,70,NULL,'240'),(1287,70,NULL,'260'),(1288,70,NULL,'740'),(1289,70,NULL,'760'),(1290,70,NULL,'780'),(1291,70,NULL,'850'),(1292,70,NULL,'940'),(1293,70,NULL,'960'),(1294,70,NULL,'C30'),(1295,70,NULL,'C70'),(1296,70,NULL,'S40'),(1297,70,NULL,'S60'),(1298,70,NULL,'S70'),(1299,70,NULL,'S80'),(1300,70,NULL,'S90'),(1301,70,NULL,'V40'),(1302,70,NULL,'V50'),(1303,70,NULL,'V70'),(1304,70,NULL,'V90'),(1305,70,NULL,'XC60'),(1306,70,NULL,'XC70'),(1307,70,NULL,'XC90'),(1308,70,NULL,'Other Volvo Models'),(1309,71,NULL,'GV'),(1310,71,NULL,'GVC'),(1311,71,NULL,'GVL'),(1312,71,NULL,'GVS'),(1313,71,NULL,'GVX'),(1314,71,NULL,'Other Yugo Models');
/*!40000 ALTER TABLE `vehicle_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_type` (
  `VEHICLE_TYPE_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `VEHICLE_TYPE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VEHICLE_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type`
--

LOCK TABLES `vehicle_type` WRITE;
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;
INSERT INTO `vehicle_type` VALUES (1,'Coupe'),(2,'SUV'),(3,'Sedan'),(4,'Hatchback'),(5,'Minivan'),(6,'Truck'),(7,'Crossover'),(8,'Convertible');
/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'car_service'
--

--
-- Dumping routines for database 'car_service'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-02 11:05:04
