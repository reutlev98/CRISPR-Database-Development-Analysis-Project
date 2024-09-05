-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: try
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
-- Table structure for table `guide_seq_data`
--

DROP TABLE IF EXISTS `guide_seq_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide_seq_data` (
  `idguide_seq_data` int NOT NULL AUTO_INCREMENT,
  `BED_Chromosome` varchar(100) NOT NULL,
  `BED_Min.Position` int unsigned NOT NULL,
  `BED_Max.Position` int unsigned NOT NULL,
  `BED_Name` varchar(100) NOT NULL,
  `Filename` varchar(255) NOT NULL,
  `WindowIndex` int NOT NULL,
  `WindowChromosome` varchar(255) NOT NULL,
  `Position` int unsigned NOT NULL,
  `WindowSequence` varchar(255) NOT NULL,
  `+.mi` int DEFAULT NULL,
  `-.mi` int DEFAULT NULL,
  `bi.sum.mi` int DEFAULT NULL,
  `bi.geometric_mean.mi` float DEFAULT NULL,
  `+.total` int DEFAULT NULL,
  `-.total` int DEFAULT NULL,
  `total.sum` int DEFAULT NULL,
  `total.geometric_mean` float DEFAULT NULL,
  `primer1.mi` int DEFAULT NULL,
  `primer2.mi` int DEFAULT NULL,
  `primer.geometric_mean` int DEFAULT NULL,
  `position.stdev` float DEFAULT NULL,
  `BED_Site_Name` varchar(45) DEFAULT NULL,
  `BED_Score` varchar(45) DEFAULT NULL,
  `BED_Site_Chromosome` varchar(45) DEFAULT NULL,
  `Site_SubstitutionsOnly.Sequence` varchar(255) DEFAULT NULL,
  `Site_SubstitutionsOnly.NumSubstitutions` varchar(45) DEFAULT NULL,
  `Site_SubstitutionsOnly.Strand` varchar(45) DEFAULT NULL,
  `Site_SubstitutionsOnly.Start` varchar(45) DEFAULT NULL,
  `Site_SubstitutionsOnly.End` varchar(45) DEFAULT NULL,
  `Site_GapsAllowed.Sequence` varchar(255) DEFAULT NULL,
  `Site_GapsAllowed.Length` varchar(45) DEFAULT NULL,
  `Site_GapsAllowed.Score` varchar(45) DEFAULT NULL,
  `Site_GapsAllowed.Substitutions` varchar(45) DEFAULT NULL,
  `Site_GapsAllowed.Insertions` varchar(45) DEFAULT NULL,
  `Site_GapsAllowed.Deletions` varchar(45) DEFAULT NULL,
  `Site_GapsAllowed.Strand` varchar(45) DEFAULT NULL,
  `Site_GapsAllowed.Start` varchar(45) DEFAULT NULL,
  `Site_GapsAllowed.End` varchar(45) DEFAULT NULL,
  `Cell` varchar(255) DEFAULT NULL,
  `Targetsite` varchar(255) DEFAULT NULL,
  `TargetSequence` varchar(255) DEFAULT NULL,
  `RealignedTargetSequence` varchar(255) DEFAULT NULL,
  `Comments` varchar(255) DEFAULT NULL,
  `IdentifyID` int NOT NULL,
  `AnalysisParametersId` int NOT NULL,
  `experiment_parametersId` int NOT NULL,
  PRIMARY KEY (`idguide_seq_data`),
  KEY `IdentifyID_idx` (`IdentifyID`),
  KEY `AnalysisParametersId_idx` (`AnalysisParametersId`),
  KEY `experiment_parametersId_idx` (`experiment_parametersId`),
  CONSTRAINT `AnalysisParametersId` FOREIGN KEY (`AnalysisParametersId`) REFERENCES `analysis_parameters` (`IDanalysis_parameters`),
  CONSTRAINT `experiment_parametersId` FOREIGN KEY (`experiment_parametersId`) REFERENCES `experiment_parameters` (`ID_experiment_parameters`),
  CONSTRAINT `IdentifyID` FOREIGN KEY (`IdentifyID`) REFERENCES `identified` (`IDidentified`)
) ENGINE=InnoDB AUTO_INCREMENT=3871 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-02 17:20:05
