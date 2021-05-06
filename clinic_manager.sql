-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: clinic_manager
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `drug_money` float NOT NULL,
  `exam_money` float NOT NULL,
  `medicalform_id` int NOT NULL,
  `creator_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `medicalform_id` (`medicalform_id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`medicalform_id`) REFERENCES `medical_form` (`id`),
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'2020-12-14',3030000,30000,2,1),(2,'2020-11-14',245000,30000,3,1),(3,'2020-12-15',30000,30000,4,1),(4,'2020-12-15',4000000,30000,5,1);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_form`
--

DROP TABLE IF EXISTS `medical_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `symptom` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `disease_prediction` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `patient_id` int NOT NULL,
  `creator_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `medical_form_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  CONSTRAINT `medical_form_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_form`
--

LOCK TABLES `medical_form` WRITE;
/*!40000 ALTER TABLE `medical_form` DISABLE KEYS */;
INSERT INTO `medical_form` VALUES (2,'2020-12-14','Đau đầu','Rối loạn Tiền Đình',1,1),(3,'2020-12-14','Chóng Mặt Buồn nôn','Thiếu ăn',3,1),(4,'2020-12-14','Khó ngủ','Căng Thẳng Quá độ',6,1),(5,'2020-12-14','Đau Chân','Bệnh A',4,1);
/*!40000 ALTER TABLE `medical_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `date_of_manufacture` date NOT NULL,
  `expiry_date` date NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `number_of_product` int NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `medicine_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Paracetamol',15000,'2020-12-01','2022-12-06','Vỉ',100,1),(2,'Tretinoin',1000000,'2019-12-25','2020-12-31','Chai',50,1),(3,'Nicotinamide',200000,'2020-12-09','2020-12-30','Chai',74,1);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `yob` int NOT NULL,
  `created_at` date DEFAULT NULL,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Hoàng Trang','12 Tôn Thất Thuyết, Phường 3, Quận Gò Vấp',2000,'2020-12-13','Nam',1),(2,'Minh Nhật','252 Lý Chính Thắng, Phường 2, Quận 3',2001,'2020-12-13','Nam',1),(3,'Thu Uyên','145 Hoàng Văn Thụ, Phường 4, Quận Bình Thạnh',2000,'2020-12-12','Nữ',1),(4,'Thảo Nguyên','12 Võ Văn Tần, Phường 4, Quận 1',2002,'2020-12-13','Nam',1),(6,'Tuấn Anh','366 Trường Chinh, Phường 13, Tân Bình',2005,'2020-12-12','Nam',1),(7,'Nguyễn Trãi','jksd, sdfui ,d fefisdjf',2002,'2020-12-13','Nam',1),(8,'Minh Quân ','sdfsdfmsdf ưeh ksdhf ưeu adsfe',2000,'2020-12-13','Nam',1),(11,'Hoàng Quý','sdfwe ẻt4rt ẻytyrzrfd',1999,'2020-12-14','Nam',1),(12,'Văn Nguyên','fdfe edf eojeb',2000,'2020-12-14','Nam',1),(13,'Nguyễn Huệ','hgfdsadfghjkl',1674,'2020-12-14','Nam',1);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `medicine_id` int NOT NULL,
  `medicalform_id` int NOT NULL,
  `amount` int NOT NULL,
  `usage` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`medicine_id`,`medicalform_id`),
  KEY `medicalform_id` (`medicalform_id`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`),
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`medicalform_id`) REFERENCES `medical_form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,2,2,'Sáng tối'),(1,3,3,'Sáng tối'),(1,4,2,'Sáng trưa tối'),(2,2,3,'Sáng trưa tối'),(2,5,3,'3'),(3,3,1,'Sáng tối'),(3,5,5,'1');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `user_role` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`is_active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1@gmail.com','Minh Nhật','21232f297a57a5a743894a0e4a801fc3','images/upload/e22fd36fbbde276628ea3d3375a7009aa5109780.jpg',1,'2020-12-13','admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-06 14:42:07
