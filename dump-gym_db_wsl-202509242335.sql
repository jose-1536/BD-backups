-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: gym_db_wsl
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attendance_date` date NOT NULL,
  `member_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `attendances_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES (1,'2025-09-16',1),(2,'2025-12-16',2),(3,'2025-08-29',3),(4,'2025-06-05',4),(5,'2025-02-26',5),(6,'2025-06-28',6),(7,'2025-12-25',7),(8,'2025-06-14',8),(9,'2025-04-21',9),(10,'2025-03-02',10),(11,'2025-12-02',11),(12,'2025-02-05',12),(13,'2025-09-22',13),(14,'2025-05-02',14),(15,'2025-07-01',15),(16,'2025-06-24',16),(17,'2025-11-27',17),(18,'2025-02-05',18),(19,'2025-10-06',19),(20,'2025-07-11',20),(21,'2025-05-04',21),(22,'2025-02-11',22),(23,'2025-07-23',23),(24,'2025-06-12',24),(25,'2025-07-22',25),(26,'2025-06-10',26),(27,'2025-07-12',27),(28,'2025-04-28',28),(29,'2025-01-11',29),(30,'2025-03-06',30),(31,'2025-10-20',31),(32,'2025-06-21',32),(33,'2025-12-13',33),(34,'2025-05-05',34),(35,'2025-11-07',35),(36,'2025-03-25',36),(37,'2025-08-03',37),(38,'2025-04-06',38),(39,'2025-07-17',39),(40,'2025-12-03',40),(41,'2025-12-24',41),(42,'2025-02-20',42),(43,'2025-10-01',43),(44,'2025-04-30',44),(45,'2025-05-24',45),(46,'2025-12-26',46),(47,'2025-09-30',47),(48,'2025-10-09',48),(49,'2025-08-17',49),(50,'2025-10-22',50),(51,'2025-02-28',51),(52,'2025-05-19',52),(53,'2025-06-01',53),(54,'2025-12-08',54),(55,'2025-06-10',55),(56,'2025-05-20',56),(57,'2025-08-08',57),(58,'2025-11-08',58),(59,'2025-06-20',59),(60,'2025-10-09',60),(61,'2025-06-14',1),(62,'2025-12-12',2),(63,'2025-05-18',3),(64,'2025-01-19',4),(65,'2025-02-12',5),(66,'2025-06-08',6),(67,'2025-10-29',7),(68,'2025-10-26',8),(69,'2025-08-13',9),(70,'2025-08-16',10),(71,'2025-04-08',11),(72,'2025-06-20',12),(73,'2025-07-14',13),(74,'2025-04-05',14),(75,'2025-09-14',15),(76,'2025-09-27',16),(77,'2025-08-02',17),(78,'2025-09-16',18),(79,'2025-10-14',19),(80,'2025-10-19',20),(81,'2025-08-22',21),(82,'2025-10-21',22),(83,'2025-02-07',23),(84,'2025-02-07',24),(85,'2025-03-16',25),(86,'2025-09-19',26),(87,'2025-12-19',27),(88,'2025-09-04',28),(89,'2025-06-26',29),(90,'2025-05-23',30),(91,'2025-07-03',31),(92,'2025-05-05',32),(93,'2025-03-13',33),(94,'2025-12-16',34),(95,'2025-03-16',35),(96,'2025-02-21',36),(97,'2025-02-04',37),(98,'2025-01-18',38),(99,'2025-12-14',39),(100,'2025-08-17',40),(101,'2025-04-08',41),(102,'2025-06-17',42),(103,'2025-06-28',43),(104,'2025-01-28',44),(105,'2025-11-29',45),(106,'2025-04-29',46),(107,'2025-11-23',47),(108,'2025-06-29',48),(109,'2025-10-11',49),(110,'2025-05-29',50),(111,'2025-09-17',51),(112,'2025-05-01',52),(113,'2025-07-10',53),(114,'2025-08-14',54),(115,'2025-07-10',55),(116,'2025-10-06',56),(117,'2025-03-29',57),(118,'2025-12-01',58),(119,'2025-11-11',59),(120,'2025-07-22',60);
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `muscle_group` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
INSERT INTO `exercises` VALUES (1,'Push Up','Push up exercise','Chest'),(2,'Squat','Squat exercise','Legs'),(3,'Plank','Plank exercise','Core'),(4,'Lunge','Lunge exercise','Legs'),(5,'Bicep Curl','Bicep exercise','Arms'),(6,'Jumping Jacks','Cardio warmup','Full Body');
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` char(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Jose Fernandez','jose1@gmail.com','3001000001','Calle 1'),(2,'Maria Lopez','maria2@gmail.com','3001000002','Calle 2'),(3,'Andres Gomez','andres3@gmail.com','3001000003','Calle 3'),(4,'Luisa Martinez','luisa4@gmail.com','3001000004','Calle 4'),(5,'Carlos Torres','carlos5@gmail.com','3001000005','Calle 5'),(6,'Ana Ramirez','ana6@gmail.com','3001000006','Calle 6'),(7,'Miguel Sanchez','miguel7@gmail.com','3001000007','Calle 7'),(8,'Sofia Diaz','sofia8@gmail.com','3001000008','Calle 8'),(9,'Luis Herrera','luis9@gmail.com','3001000009','Calle 9'),(10,'Camila Morales','camila10@gmail.com','3001000010','Calle 10'),(11,'Jorge Rojas','jorge11@gmail.com','3001000011','Calle 11'),(12,'Paula Castillo','paula12@gmail.com','3001000012','Calle 12'),(13,'Daniel Alvarez','daniel13@gmail.com','3001000013','Calle 13'),(14,'Valeria Sanchez','valeria14@gmail.com','3001000014','Calle 14'),(15,'Andres Molina','andres15@gmail.com','3001000015','Calle 15'),(16,'Carolina Herrera','carolina16@gmail.com','3001000016','Calle 16'),(17,'Diego Gomez','diego17@gmail.com','3001000017','Calle 17'),(18,'Laura Perez','laura18@gmail.com','3001000018','Calle 18'),(19,'Ricardo Diaz','ricardo19@gmail.com','3001000019','Calle 19'),(20,'Andrea Morales','andrea20@gmail.com','3001000020','Calle 20'),(21,'Felipe Torres','felipe21@gmail.com','3001000021','Calle 21'),(22,'Natalia Martinez','natalia22@gmail.com','3001000022','Calle 22'),(23,'Javier Ramirez','javier23@gmail.com','3001000023','Calle 23'),(24,'Karen Castillo','karen24@gmail.com','3001000024','Calle 24'),(25,'Esteban Alvarez','esteban25@gmail.com','3001000025','Calle 25'),(26,'Daniela Sanchez','daniela26@gmail.com','3001000026','Calle 26'),(27,'Mario Molina','mario27@gmail.com','3001000027','Calle 27'),(28,'Monica Herrera','monica28@gmail.com','3001000028','Calle 28'),(29,'Andres Diaz','andres29@gmail.com','3001000029','Calle 29'),(30,'Sofia Morales','sofia30@gmail.com','3001000030','Calle 30'),(31,'Juan Perez','juan31@gmail.com','3001000031','Calle 31'),(32,'Paula Lopez','paula32@gmail.com','3001000032','Calle 32'),(33,'Carlos Gomez','carlos33@gmail.com','3001000033','Calle 33'),(34,'Ana Martinez','ana34@gmail.com','3001000034','Calle 34'),(35,'Miguel Torres','miguel35@gmail.com','3001000035','Calle 35'),(36,'Sofia Ramirez','sofia36@gmail.com','3001000036','Calle 36'),(37,'Luis Fernandez','luis37@gmail.com','3001000037','Calle 37'),(38,'Camila Diaz','camila38@gmail.com','3001000038','Calle 38'),(39,'Jorge Morales','jorge39@gmail.com','3001000039','Calle 39'),(40,'Paula Perez','paula40@gmail.com','3001000040','Calle 40'),(41,'Daniel Gomez','daniel41@gmail.com','3001000041','Calle 41'),(42,'Valeria Martinez','valeria42@gmail.com','3001000042','Calle 42'),(43,'Andres Ramirez','andres43@gmail.com','3001000043','Calle 43'),(44,'Carolina Sanchez','carolina44@gmail.com','3001000044','Calle 44'),(45,'Diego Herrera','diego45@gmail.com','3001000045','Calle 45'),(46,'Laura Diaz','laura46@gmail.com','3001000046','Calle 46'),(47,'Ricardo Morales','ricardo47@gmail.com','3001000047','Calle 47'),(48,'Andrea Perez','andrea48@gmail.com','3001000048','Calle 48'),(49,'Felipe Lopez','felipe49@gmail.com','3001000049','Calle 49'),(50,'Natalia Gomez','natalia50@gmail.com','3001000050','Calle 50'),(51,'Javier Martinez','javier51@gmail.com','3001000051','Calle 51'),(52,'Karen Torres','karen52@gmail.com','3001000052','Calle 52'),(53,'Esteban Ramirez','esteban53@gmail.com','3001000053','Calle 53'),(54,'Daniela Herrera','daniela54@gmail.com','3001000054','Calle 54'),(55,'Mario Diaz','mario55@gmail.com','3001000055','Calle 55'),(56,'Monica Morales','monica56@gmail.com','3001000056','Calle 56'),(57,'Andres Perez','andres57@gmail.com','3001000057','Calle 57'),(58,'Sofia Lopez','sofia58@gmail.com','3001000058','Calle 58'),(59,'Juan Gomez','juan59@gmail.com','3001000059','Calle 59'),(60,'Paula Martinez','paula60@gmail.com','3001000060','Calle 60');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberships` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `member_id` int DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `trainer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `plan_id` (`plan_id`),
  KEY `trainer_id` (`trainer_id`),
  CONSTRAINT `memberships_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `memberships_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `memberships_ibfk_3` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` VALUES (1,'2025-01-12','2025-05-14',1,1,5),(2,'2025-01-12','2025-10-30',2,2,5),(3,'2025-10-04','2026-01-28',3,3,3),(4,'2025-03-27','2025-11-15',4,1,5),(5,'2025-09-18','2025-12-20',5,1,5),(6,'2025-03-01','2025-06-21',6,2,1),(7,'2025-01-15','2026-01-17',7,3,4),(8,'2025-12-30','2025-03-15',8,2,4),(9,'2025-06-20','2025-06-15',9,2,1),(10,'2025-05-18','2025-07-14',10,1,2),(11,'2025-11-11','2025-08-30',11,1,4),(12,'2025-01-15','2025-11-29',12,1,4),(13,'2025-01-09','2025-05-07',13,1,3),(14,'2025-08-10','2025-09-12',14,1,3),(15,'2025-04-22','2025-05-17',15,2,5),(16,'2025-07-03','2025-02-16',16,3,3),(17,'2025-01-11','2025-12-02',17,1,1),(18,'2025-09-19','2025-08-24',18,3,4),(19,'2025-03-28','2025-04-28',19,2,4),(20,'2025-03-25','2026-01-03',20,3,5),(21,'2025-09-09','2025-10-31',21,3,1),(22,'2025-09-19','2025-03-16',22,2,5),(23,'2025-06-25','2025-07-20',23,3,1),(24,'2025-08-30','2025-03-11',24,2,3),(25,'2025-06-03','2025-12-12',25,1,4),(26,'2025-05-02','2025-08-23',26,3,2),(27,'2025-04-29','2025-08-29',27,3,5),(28,'2025-04-27','2025-04-02',28,3,5),(29,'2025-02-01','2025-08-30',29,2,3),(30,'2025-03-08','2025-09-30',30,3,5),(31,'2025-02-28','2025-03-11',31,1,5),(32,'2025-08-25','2025-06-08',32,3,1),(33,'2025-08-14','2025-02-18',33,2,5),(34,'2025-01-09','2025-09-02',34,3,3),(35,'2025-03-21','2025-06-28',35,2,4),(36,'2025-03-29','2025-04-01',36,1,1),(37,'2025-02-06','2025-04-21',37,3,2),(38,'2025-07-09','2025-07-06',38,2,4),(39,'2025-06-29','2025-08-02',39,1,4),(40,'2025-05-17','2025-11-06',40,3,2),(41,'2025-03-19','2025-04-30',41,2,2),(42,'2025-06-10','2025-07-17',42,3,3),(43,'2025-06-25','2026-01-20',43,2,1),(44,'2025-08-02','2025-07-02',44,2,3),(45,'2025-03-05','2025-08-22',45,1,4),(46,'2025-06-11','2025-05-08',46,1,2),(47,'2025-04-12','2025-09-08',47,1,1),(48,'2025-11-15','2025-03-16',48,3,3),(49,'2025-01-06','2025-05-11',49,2,5),(50,'2025-03-22','2025-08-24',50,1,1),(51,'2025-01-07','2025-11-16',51,3,1),(52,'2025-03-01','2025-05-12',52,3,4),(53,'2025-09-02','2025-05-29',53,2,1),(54,'2025-09-06','2025-03-03',54,2,4),(55,'2025-04-07','2025-05-08',55,2,5),(56,'2025-12-12','2026-01-27',56,1,3),(57,'2025-08-19','2025-06-14',57,3,4),(58,'2025-07-07','2025-08-16',58,1,1),(59,'2025-06-02','2025-08-19',59,2,5),(60,'2025-08-27','2025-11-14',60,3,3);
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `membership_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `membership_id` (`membership_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'Basic','Acceso al gimnasio 3 veces por semana',50.00),(2,'Standard','Acceso ilimitado al gimnasio',80.00),(3,'Premium','Acceso ilimitado + clases grupales',120.00);
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routine_exercises`
--

DROP TABLE IF EXISTS `routine_exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routine_exercises` (
  `routine_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  PRIMARY KEY (`routine_id`,`exercise_id`),
  KEY `exercise_id` (`exercise_id`),
  CONSTRAINT `routine_exercises_ibfk_1` FOREIGN KEY (`routine_id`) REFERENCES `routines` (`id`),
  CONSTRAINT `routine_exercises_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routine_exercises`
--

LOCK TABLES `routine_exercises` WRITE;
/*!40000 ALTER TABLE `routine_exercises` DISABLE KEYS */;
INSERT INTO `routine_exercises` VALUES (1,1),(3,1),(1,2),(3,2),(1,3),(2,3),(3,4),(3,5),(2,6);
/*!40000 ALTER TABLE `routine_exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routines`
--

DROP TABLE IF EXISTS `routines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `trainer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `trainer_id` (`trainer_id`),
  CONSTRAINT `routines_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `routines_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routines`
--

LOCK TABLES `routines` WRITE;
/*!40000 ALTER TABLE `routines` DISABLE KEYS */;
INSERT INTO `routines` VALUES (1,'Routine A','Strength focus',1,1),(2,'Routine B','Cardio focus',2,2),(3,'Routine C','Full body',3,3);
/*!40000 ALTER TABLE `routines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialty` char(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'Carlos Perez','Strength Training'),(2,'Ana Gomez','Cardio'),(3,'Luis Martinez','Yoga'),(4,'Sofia Ramirez','Pilates'),(5,'Juan Torres','Crossfit');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gym_db_wsl'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-24 23:35:59
