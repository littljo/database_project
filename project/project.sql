-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chambre` (
  `numHot` smallint unsigned DEFAULT NULL,
  `numCh` smallint unsigned NOT NULL,
  `nblits` int DEFAULT NULL,
  PRIMARY KEY (`numCh`),
  KEY `fk_chambre` (`numHot`),
  CONSTRAINT `fk_chambre` FOREIGN KEY (`numHot`) REFERENCES `hotel` (`numHoT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chambre`
--

LOCK TABLES `chambre` WRITE;
/*!40000 ALTER TABLE `chambre` DISABLE KEYS */;
/*!40000 ALTER TABLE `chambre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `numCli` int unsigned NOT NULL,
  `nomCli` varchar(20) DEFAULT NULL,
  `telCli` varchar(10) DEFAULT NULL,
  `adrCli` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`numCli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `numHoT` smallint unsigned NOT NULL,
  `nomHot` varchar(20) DEFAULT NULL,
  `numSta` smallint unsigned DEFAULT NULL,
  `categorie` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`numHoT`),
  KEY `fk_hotel` (`numSta`),
  CONSTRAINT `fk_hotel` FOREIGN KEY (`numSta`) REFERENCES `station` (`numSta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `numCli` int unsigned DEFAULT NULL,
  `numHot` smallint unsigned DEFAULT NULL,
  `numCh` smallint unsigned DEFAULT NULL,
  `dateDeb` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `nbpers` smallint unsigned DEFAULT NULL,
  KEY `numCli` (`numCli`),
  KEY `numHot` (`numHot`),
  KEY `numCh` (`numCh`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`numCli`) REFERENCES `client` (`numCli`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`numHot`) REFERENCES `hotel` (`numHoT`),
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`numCh`) REFERENCES `chambre` (`numCh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `numSta` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nomSta` varchar(20) DEFAULT NULL,
  `altitude` int DEFAULT NULL,
  `dept` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`numSta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-07  4:04:07
