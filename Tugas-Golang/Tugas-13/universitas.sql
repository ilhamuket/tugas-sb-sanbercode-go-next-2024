-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: universitas
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mahasiswa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES (5,'ilham','2024-06-28 07:44:18','2024-06-28 07:44:18'),(6,'uket','2024-06-28 07:44:21','2024-06-28 07:44:21'),(7,'Cynthia Freeman','2023-04-26 03:20:23','2002-05-14 21:44:50'),(8,'Troy Turner','2013-08-25 21:42:00','2016-03-13 13:51:37'),(10,'Craig Jimenez','2004-11-06 09:31:55','2007-06-15 23:47:15'),(11,'Raymond Powell','2000-12-28 14:24:41','2007-06-23 01:43:23'),(12,'Kathy Lopez','2009-04-13 16:52:07','2021-10-17 01:13:27'),(13,'Wendy Torres','2021-01-18 23:00:14','2010-04-27 13:30:59'),(14,'Wayne Cruz','2006-12-12 03:41:12','2020-09-06 00:34:36'),(15,'Barbara Hughes','2002-03-17 14:53:49','2019-08-08 19:17:46'),(16,'Robert Romero','2015-04-27 08:41:26','2004-10-29 22:33:05'),(17,'uket','2024-06-28 07:52:17','2024-06-28 07:52:17'),(18,'uket','2024-06-28 07:53:51','2024-06-28 07:53:51'),(19,'aman','2024-06-28 08:02:18','2024-06-28 08:02:18');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mata_kuliah`
--

DROP TABLE IF EXISTS `mata_kuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mata_kuliah` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mata_kuliah`
--

LOCK TABLES `mata_kuliah` WRITE;
/*!40000 ALTER TABLE `mata_kuliah` DISABLE KEYS */;
INSERT INTO `mata_kuliah` VALUES (2,'Pemograman Mobile','2024-06-28 08:07:36','2024-06-28 08:07:36'),(3,'Statistik','2024-06-28 08:07:43','2024-06-28 08:07:43'),(4,'Product Quality','2005-10-06 12:49:29','2009-03-23 15:22:28'),(5,'Legal Department','2005-12-18 16:55:59','2008-07-24 16:21:16'),(6,'Sales','2018-12-19 01:02:19','2012-06-27 12:33:58'),(7,'Production','2007-02-19 11:28:36','2012-04-09 20:20:51'),(8,'Product Quality','2020-09-24 14:58:35','2018-11-26 23:47:47'),(9,'Human resource','2002-12-24 10:25:56','2002-05-14 22:34:03'),(10,'Legal Department','2002-07-01 03:47:51','2001-07-31 11:50:48'),(11,'Human resource','2005-01-23 21:17:45','2008-12-14 16:54:50'),(12,'Information Technology Support','2024-02-05 18:39:53','2020-03-22 16:34:40'),(13,'Marketing','2009-09-18 03:09:36','2007-07-14 21:51:50');
/*!40000 ALTER TABLE `mata_kuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nilai`
--

DROP TABLE IF EXISTS `nilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nilai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indeks` varchar(255) NOT NULL,
  `skor` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mata_kuliah_id` int DEFAULT NULL,
  `mahasiswa_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mata_kuliah_id` (`mata_kuliah_id`),
  KEY `mahasiswa_id` (`mahasiswa_id`),
  CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`),
  CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nilai`
--

LOCK TABLES `nilai` WRITE;
/*!40000 ALTER TABLE `nilai` DISABLE KEYS */;
INSERT INTO `nilai` VALUES (4,'A',85,'2024-06-28 08:23:11','2024-06-28 08:23:11',5,5),(5,'A',85,'2024-06-28 08:23:25','2024-06-28 08:23:25',9,11),(6,'A',85,'2024-06-28 08:23:31','2024-06-28 08:23:31',9,12),(7,'A',85,'2024-06-28 08:23:36','2024-06-28 08:23:36',6,12);
/*!40000 ALTER TABLE `nilai` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-28 15:24:26
