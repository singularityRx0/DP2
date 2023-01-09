-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: arduino_attendence
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `'2023-01-06_attendencelog'`
--

DROP TABLE IF EXISTS `'2023-01-06_attendencelog'`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `'2023-01-06_attendencelog'` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `UID` varchar(255) NOT NULL,
  `timeStamp` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `'2023-01-06_attendencelog'`
--

LOCK TABLES `'2023-01-06_attendencelog'` WRITE;
/*!40000 ALTER TABLE `'2023-01-06_attendencelog'` DISABLE KEYS */;
INSERT INTO `'2023-01-06_attendencelog'` VALUES (1,'li','45 67 89','213123'),(2,'he','4362','23545');
/*!40000 ALTER TABLE `'2023-01-06_attendencelog'` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `'2023-01-07_attendencelog'`
--

DROP TABLE IF EXISTS `'2023-01-07_attendencelog'`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `'2023-01-07_attendencelog'` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `UID` varchar(255) NOT NULL,
  `timeStamp` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `'2023-01-07_attendencelog'`
--

LOCK TABLES `'2023-01-07_attendencelog'` WRITE;
/*!40000 ALTER TABLE `'2023-01-07_attendencelog'` DISABLE KEYS */;
INSERT INTO `'2023-01-07_attendencelog'` VALUES (1,'liew','4G 7H 9Q','13:57:55');
/*!40000 ALTER TABLE `'2023-01-07_attendencelog'` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `'2023-01-09_attendencelog'`
--

DROP TABLE IF EXISTS `'2023-01-09_attendencelog'`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `'2023-01-09_attendencelog'` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `UID` varchar(255) NOT NULL,
  `timeStamp` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `'2023-01-09_attendencelog'`
--

LOCK TABLES `'2023-01-09_attendencelog'` WRITE;
/*!40000 ALTER TABLE `'2023-01-09_attendencelog'` DISABLE KEYS */;
INSERT INTO `'2023-01-09_attendencelog'` VALUES (1,'NIC','B0 4C E0 32','09:36:32'),(2,'NIC','B0 4C E0 32','09:36:42'),(3,'NIC','B0 4C E0 32','09:36:52'),(4,'NIC','B0 4C E0 32','09:38:37'),(5,'NIC','B0 4C E0 32','09:39:20'),(6,'NIC','B0 4C E0 32','09:39:28'),(7,'NIC','B0 4C E0 32','09:39:58'),(8,'NIC','B0 4C E0 32','09:44:43'),(9,'NIC','B0 4C E0 32','09:46:17'),(10,'ch','9B 98 65 21','09:47:12'),(11,'NIC','B0 4C E0 32','09:47:21'),(12,'NIC','B0 4C E0 32','10:01:19'),(13,'ch','9B 98 65 21','10:01:58'),(14,'uiadhgiuhb','E7 E5 BF 3A','10:03:38');
/*!40000 ALTER TABLE `'2023-01-09_attendencelog'` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendence_table_list`
--

DROP TABLE IF EXISTS `attendence_table_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendence_table_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tblCreated_name` varchar(255) NOT NULL,
  `tblCreated_date` varchar(255) NOT NULL,
  `tblCreated_time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendence_table_list`
--

LOCK TABLES `attendence_table_list` WRITE;
/*!40000 ALTER TABLE `attendence_table_list` DISABLE KEYS */;
INSERT INTO `attendence_table_list` VALUES (4,'2023-01-06_AttendenceLog','2023-01-06','20:47:58'),(5,'2023-01-07_AttendenceLog','2023-01-07','13:57:40'),(6,'2023-01-09_AttendenceLog','2023-01-09','08:39:14');
/*!40000 ALTER TABLE `attendence_table_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `UID` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Liew','liew@ytrh.com','1245134532','Q3 T6 Z9 B7'),(2,'NIC','niv@89eudsg.com','94w06uw48','B0 4C E0 32'),(3,'ch','huhuih@sekhgkjdfs.com','72635t78t','9B 98 65 21'),(4,'uiadhgiuhb','isodjgnoiusd@gkaengkja.com','aosfngkjdan','E7 E5 BF 3A');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_employee`
--

DROP TABLE IF EXISTS `tbl_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_employee`
--

LOCK TABLES `tbl_employee` WRITE;
/*!40000 ALTER TABLE `tbl_employee` DISABLE KEYS */;
INSERT INTO `tbl_employee` VALUES (1,'123','123','123'),(2,'123','123','1'),(3,'1','1','1'),(4,'he','he','he'),(5,'yt','yt','yt');
/*!40000 ALTER TABLE `tbl_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_username` varchar(45) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'123','123@gmail.com','pbkdf2:sha256:260000$k6QWcezr6jxjF7bF$35e16ede0d5e7d9c30a273fc3c2993705d8e395e4bda8d1f6674f0388649c9d8'),(2,'12345','12345@gmail.com','pbkdf2:sha256:260000$5g4Mg3E4tFOtoTUw$08a1b654204a7fc218a15d827d985fbfde6a5db068dcd37585fe457b819d7104'),(3,'helloworld','helloworld@gmail.com','pbkdf2:sha256:260000$dFmN1cRRGzd6DHS1$421d65714714821ef68957e7fc20ad9822b6496e5ca8cbef34d7ed1b0ddbc314'),(4,'helloworld123','helloworld123@gmail.com','pbkdf2:sha256:260000$AaCMp7oJ6dXSU0ct$27bf343c531ca1b036028d793b9fb5301aced985b1cab45d219847a2ea3c835b'),(5,'hi','hi@yahoo.com','pbkdf2:sha256:260000$4YOS9KTE5dE3UQzd$3051516dbb3d8aa5e57317bea4c9d0d378947f6326e8230cbeb8a0c38bd2ef86'),(6,'yt','yt@gmail.com','pbkdf2:sha256:260000$p9LVLsir82cVFba5$6ee2fc6a54e10e0bedc543c2954b303595373992eda0a26b5650ac3840fa218d'),(7,'q','q@gmail.com','pbkdf2:sha256:260000$i3iI4OyCjYIMbtys$5f26b668a87a198bb5199a1f4b1c154b347d51d02f4520bc6b0a782a5e48db8a'),(8,'huhi','huhi@tasd.com','pbkdf2:sha256:260000$fzsK2NiPk3v0OCw8$30b44a8593f7e97a98d4792f11ccca51417da022a06710b7ac346c0eef9ed455');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-09 16:21:04
