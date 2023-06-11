-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `experiment_parameters`
--

DROP TABLE IF EXISTS `experiment_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiment_parameters` (
  `ID_experiment_parameters` int NOT NULL,
  `experimentID` int NOT NULL,
  `cellID` int NOT NULL,
  `guideID` int NOT NULL,
  `moreInfo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID_experiment_parameters`),
  KEY `idCell_idx` (`cellID`),
  KEY `idExperiment_idx` (`experimentID`),
  KEY `idGuide_idx` (`guideID`),
  CONSTRAINT `cellID` FOREIGN KEY (`cellID`) REFERENCES `cell` (`idCell`),
  CONSTRAINT `ExperimentID` FOREIGN KEY (`experimentID`) REFERENCES `experiment` (`idExperiment`),
  CONSTRAINT `idGuide` FOREIGN KEY (`guideID`) REFERENCES `guide` (`idGuide`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_parameters`
--

LOCK TABLES `experiment_parameters` WRITE;
/*!40000 ALTER TABLE `experiment_parameters` DISABLE KEYS */;
INSERT INTO `experiment_parameters` VALUES (1,1,1,1,''),(2,2,1,1,''),(3,3,1,2,''),(4,4,1,2,''),(5,5,1,3,''),(6,6,1,3,''),(7,7,1,4,''),(8,8,1,4,''),(9,9,1,5,''),(10,10,1,5,''),(11,11,1,6,''),(12,12,1,6,''),(13,13,1,7,''),(14,14,1,7,''),(15,15,1,8,''),(16,16,1,8,''),(17,17,1,9,''),(18,18,1,9,''),(19,19,1,10,''),(20,20,1,10,''),(21,21,1,11,''),(22,22,1,11,''),(23,23,1,12,''),(24,24,1,12,''),(25,25,1,13,''),(26,26,1,13,''),(27,27,1,14,''),(28,28,1,14,''),(29,29,1,15,''),(30,30,1,15,''),(31,31,1,16,''),(32,32,1,16,''),(33,33,1,17,''),(34,34,1,17,''),(35,35,1,18,''),(36,36,1,18,''),(37,37,1,19,''),(38,38,1,19,''),(39,39,1,20,''),(40,40,1,20,''),(41,41,1,21,''),(42,42,1,21,''),(43,43,1,22,''),(44,44,1,22,''),(45,45,1,23,''),(46,46,1,23,''),(47,47,1,24,''),(48,48,1,24,''),(49,49,1,25,''),(50,50,1,25,''),(51,51,1,26,''),(52,52,1,26,''),(53,53,1,27,''),(54,54,1,27,''),(55,55,1,28,''),(56,56,1,28,''),(57,57,1,29,''),(58,58,1,29,''),(59,59,1,30,''),(60,60,1,30,''),(61,61,1,31,''),(62,62,1,31,''),(63,63,1,32,''),(64,64,1,32,''),(65,65,1,33,''),(66,66,1,33,''),(67,67,1,34,''),(68,68,1,34,''),(69,69,1,35,''),(70,70,1,35,''),(71,71,1,36,''),(72,72,1,36,''),(73,73,1,37,''),(74,74,1,37,''),(75,75,1,38,''),(76,76,1,38,''),(77,77,1,39,''),(78,78,1,39,''),(79,79,1,40,''),(80,80,1,40,''),(81,81,1,41,''),(82,82,1,42,''),(83,83,1,43,''),(84,84,1,44,''),(85,85,1,45,''),(86,86,1,46,''),(87,87,1,47,''),(88,88,1,48,''),(89,89,1,49,''),(90,90,1,50,''),(91,91,1,51,''),(92,92,1,52,''),(93,93,1,53,''),(94,94,1,54,''),(95,95,1,55,''),(96,96,1,56,''),(97,97,1,57,''),(98,98,1,58,''),(99,99,1,59,''),(100,100,1,60,''),(101,101,1,61,''),(102,102,1,62,''),(103,103,1,63,''),(104,104,1,64,''),(105,105,1,65,''),(106,106,1,66,''),(107,107,1,67,''),(108,108,1,68,''),(109,109,1,69,''),(110,110,1,70,''),(111,111,1,71,''),(112,112,1,72,''),(113,113,1,73,''),(114,114,1,74,''),(115,115,1,75,''),(116,116,1,76,''),(117,117,1,77,''),(118,118,1,78,''),(119,119,1,79,''),(120,120,1,80,''),(121,121,1,81,''),(122,122,1,82,''),(123,123,1,83,''),(124,124,1,84,''),(125,125,1,85,''),(126,126,1,86,''),(127,127,1,87,''),(128,128,1,88,''),(129,129,1,89,''),(130,130,1,90,'');
/*!40000 ALTER TABLE `experiment_parameters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-11 20:16:50
