-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: salutem
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `patients_patients`
--

DROP TABLE IF EXISTS `patients_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients_patients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Sex` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Surname` varchar(100) NOT NULL,
  `Patronymic` varchar(100) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Place_of_residence` varchar(100) NOT NULL,
  `Blood_type` varchar(10) NOT NULL,
  `Telephone` varchar(100) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_patients`
--

LOCK TABLES `patients_patients` WRITE;
/*!40000 ALTER TABLE `patients_patients` DISABLE KEYS */;
INSERT INTO `patients_patients` VALUES (1,'Мужской','Максимов ','Велор ','Владиславович','1995-01-11','місто Донецьк, пров. Шота Руставелі, 91','II+','+380914818785','jsdjfjs@gmail.com'),(2,'Мужской','Максимов ','Велор ','Владиславович','1995-01-11','місто Донецьк, пров. Шота Руставелі, 91','II+','+380914818785','jsdjfjs@gmail.com'),(3,'Мужской','Максимов ','Велор ','Владиславович','1995-01-11','місто Донецьк, пров. Шота Руставелі, 91','II+','+380914818785','jsdjfjs@gmail.com'),(4,'Мужской','Максимов ','Велор ','Владиславович','1995-01-11','місто Донецьк, пров. Шота Руставелі, 91','II+','+380914818785','jsdjfjs@gmail.com'),(5,'Мужской','Максимов ','Велор ','Владиславович','1995-01-11','місто Донецьк, пров. Шота Руставелі, 91','II+','+380914818785','jsdjfjs@gmail.com'),(6,'Мужской','Максимов ','Велор ','Владиславович','1995-01-11','місто Донецьк, пров. Шота Руставелі, 91','II+','+380914818785','jsdjfjs@gmail.com');
/*!40000 ALTER TABLE `patients_patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-15 20:46:55
