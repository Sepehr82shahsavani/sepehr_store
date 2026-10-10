-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: db_store
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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `age` int unsigned DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`),
  CONSTRAINT `accounts_customuser_chk_1` CHECK ((`age` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$1000000$mQdSIFElvxhNvFjDn4De8z$wHtoQ4e5irhaCRqfJqoSB1BRVRbqRezyZKc4IrxalV8=','2026-09-21 06:47:43.445955',1,'taha','','','',1,1,'2026-08-01 15:57:32.031881',NULL,NULL),(2,'pbkdf2_sha256$1000000$aBdgoRKRO3JhrcUixRuEze$xBvHIyNvqoV4IF026KY5UjqkQU0hAPf2L7RIJGDsbhw=','2026-08-04 18:11:18.172972',0,'shamila','','','',0,1,'2026-08-04 18:11:15.442918',NULL,NULL);
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

LOCK TABLES `accounts_customuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_user_permissions`
--

LOCK TABLES `accounts_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add email address',6,'add_emailaddress'),(22,'Can change email address',6,'change_emailaddress'),(23,'Can delete email address',6,'delete_emailaddress'),(24,'Can view email address',6,'view_emailaddress'),(25,'Can add email confirmation',7,'add_emailconfirmation'),(26,'Can change email confirmation',7,'change_emailconfirmation'),(27,'Can delete email confirmation',7,'delete_emailconfirmation'),(28,'Can view email confirmation',7,'view_emailconfirmation'),(29,'Can add user',8,'add_customuser'),(30,'Can change user',8,'change_customuser'),(31,'Can delete user',8,'delete_customuser'),(32,'Can view user',8,'view_customuser'),(33,'Can add product',12,'add_product'),(34,'Can change product',12,'change_product'),(35,'Can delete product',12,'delete_product'),(36,'Can view product',12,'view_product'),(37,'Can add product comment',13,'add_productcomment'),(38,'Can change product comment',13,'change_productcomment'),(39,'Can delete product comment',13,'delete_productcomment'),(40,'Can view product comment',13,'view_productcomment'),(41,'Can add camera spec',9,'add_cameraspec'),(42,'Can change camera spec',9,'change_cameraspec'),(43,'Can delete camera spec',9,'delete_cameraspec'),(44,'Can view camera spec',9,'view_cameraspec'),(45,'Can add laptop spec',10,'add_laptopspec'),(46,'Can change laptop spec',10,'change_laptopspec'),(47,'Can delete laptop spec',10,'delete_laptopspec'),(48,'Can view laptop spec',10,'view_laptopspec'),(49,'Can add phone spec',11,'add_phonespec'),(50,'Can change phone spec',11,'change_phonespec'),(51,'Can delete phone spec',11,'delete_phonespec'),(52,'Can view phone spec',11,'view_phonespec'),(53,'Can add order',14,'add_order'),(54,'Can change order',14,'change_order'),(55,'Can delete order',14,'delete_order'),(56,'Can view order',14,'view_order'),(57,'Can add order item',15,'add_orderitem'),(58,'Can change order item',15,'change_orderitem'),(59,'Can delete order item',15,'delete_orderitem'),(60,'Can view order item',15,'view_orderitem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-08-01 15:58:59.040215','1','fdsjlhglkgdg',1,'[{\"added\": {}}, {\"added\": {\"name\": \"phone spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644: fdsjlhglkgdg\"}}]',12,1),(2,'2026-08-03 10:32:22.543358','2','tdjygj',1,'[{\"added\": {}}, {\"added\": {\"name\": \"laptop spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0644\\u067e\\u200c\\u062a\\u0627\\u067e: tdjygj\"}}]',12,1),(3,'2026-08-19 17:50:42.027684','3','یبریقرقر',1,'[{\"added\": {}}]',12,1),(4,'2026-08-26 16:26:33.841102','4','لپ تاپ 15.6 اینچی ایسوس TUF Gaming FA506NCG R7 7445HS 16GB 512GB SSD RTX 3050',1,'[{\"added\": {}}, {\"added\": {\"name\": \"laptop spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0644\\u067e\\u200c\\u062a\\u0627\\u067e: \\u0644\\u067e \\u062a\\u0627\\u067e 15.6 \\u0627\\u06cc\\u0646\\u0686\\u06cc \\u0627\\u06cc\\u0633\\u0648\\u0633 TUF Gaming FA506NCG R7 7445HS 16GB 512GB SSD RTX 3050\"}}]',12,1),(5,'2026-08-26 16:40:38.147143','3','یبریقرقر',3,'',12,1),(6,'2026-08-26 16:40:41.718625','2','tdjygj',3,'',12,1),(7,'2026-08-26 16:40:45.600190','1','fdsjlhglkgdg',3,'',12,1),(8,'2026-08-26 16:41:00.534258','4','لپ تاپ 15.6 اینچی ایسوس TUF Gaming FA506NCG R7 7445HS 16GB 512GB SSD RTX 3050',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',12,1),(9,'2026-08-26 17:46:30.492917','5','لپ تاپ 14 اینچی ایسوس Vivobook X1404VAP Core 5 120U 8GB 512GB SSD Intel',1,'[{\"added\": {}}, {\"added\": {\"name\": \"laptop spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0644\\u067e\\u200c\\u062a\\u0627\\u067e: \\u0644\\u067e \\u062a\\u0627\\u067e 14 \\u0627\\u06cc\\u0646\\u0686\\u06cc \\u0627\\u06cc\\u0633\\u0648\\u0633 Vivobook X1404VAP Core 5 120U 8GB 512GB SSD Intel\"}}]',12,1),(10,'2026-08-26 17:49:18.931226','6','لپ تاپ 14 اینچی ایسوس Zenbook UX3405CA Ultra 9 285H 32GB 1TB SSD INTEL',1,'[{\"added\": {}}, {\"added\": {\"name\": \"laptop spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0644\\u067e\\u200c\\u062a\\u0627\\u067e: \\u0644\\u067e \\u062a\\u0627\\u067e 14 \\u0627\\u06cc\\u0646\\u0686\\u06cc \\u0627\\u06cc\\u0633\\u0648\\u0633 Zenbook UX3405CA Ultra 9 285H 32GB 1TB SSD INTEL\"}}]',12,1),(11,'2026-08-26 17:55:09.271328','7','TUF Gaming F16 FX608JMR i7 14650HX 32GB 1TB SSD RTX 5060',1,'[{\"added\": {}}, {\"added\": {\"name\": \"laptop spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0644\\u067e\\u200c\\u062a\\u0627\\u067e: TUF Gaming F16 FX608JMR i7 14650HX 32GB 1TB SSD RTX 5060\"}}]',12,1),(12,'2026-08-26 17:58:44.902538','8','لپ تاپ 16 اینچی ایسوس مدل ProArt StudioBook Pro 16 W7600H3A L2008',1,'[{\"added\": {}}, {\"added\": {\"name\": \"laptop spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0644\\u067e\\u200c\\u062a\\u0627\\u067e: \\u0644\\u067e \\u062a\\u0627\\u067e 16 \\u0627\\u06cc\\u0646\\u0686\\u06cc \\u0627\\u06cc\\u0633\\u0648\\u0633 \\u0645\\u062f\\u0644 ProArt StudioBook Pro 16 W7600H3A L2008\"}}]',12,1),(13,'2026-08-26 18:02:44.828767','9','لپ تاپ 15.6 اینچی ایسوس Expert Book P1503CVA i5 13420H 8GB 512GB SSD INTEL (IPS)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"laptop spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0644\\u067e\\u200c\\u062a\\u0627\\u067e: \\u0644\\u067e \\u062a\\u0627\\u067e 15.6 \\u0627\\u06cc\\u0646\\u0686\\u06cc \\u0627\\u06cc\\u0633\\u0648\\u0633 Expert Book P1503CVA i5 13420H 8GB 512GB SSD INTEL (IPS)\"}}]',12,1),(14,'2026-08-26 19:06:01.455046','10','Alpha 9 III - Full-frame Mirrorless Interchangeable Lens Camera',1,'[{\"added\": {}}, {\"added\": {\"name\": \"camera spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u062f\\u0648\\u0631\\u0628\\u06cc\\u0646: Alpha 9 III - Full-frame Mirrorless Interchangeable Lens Camera\"}}]',12,1),(15,'2026-08-26 19:15:59.339069','11','Alpha ZV-E10 II - APS-C Interchangeable Lens Mirrorless Content Creators’ Camera',1,'[{\"added\": {}}, {\"added\": {\"name\": \"camera spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u062f\\u0648\\u0631\\u0628\\u06cc\\u0646: Alpha ZV-E10 II - APS-C Interchangeable Lens Mirrorless Content Creators\\u2019 Camera\"}}]',12,1),(16,'2026-08-26 19:23:27.029576','12','Alpha 6400 - APS-C Interchangeable Lens Camera & Lens Kit 24.2MP, 11FPS, 4K/30p',1,'[{\"added\": {}}, {\"added\": {\"name\": \"camera spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u062f\\u0648\\u0631\\u0628\\u06cc\\u0646: Alpha 6400 - APS-C Interchangeable Lens Camera & Lens Kit 24.2MP, 11FPS, 4K/30p\"}}]',12,1),(17,'2026-08-26 19:25:18.857547','6','لپ تاپ 14 اینچی ایسوس Zenbook UX3405CA Ultra 9 285H 32GB 1TB SSD INTEL',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',12,1),(18,'2026-08-26 19:39:59.693489','13','iPhone 17 Pro',1,'[{\"added\": {}}, {\"added\": {\"name\": \"phone spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644: iPhone 17 Pro\"}}]',12,1),(19,'2026-08-26 19:43:54.991214','14','iPhone 16 Pro Max ZAA',1,'[{\"added\": {}}, {\"added\": {\"name\": \"phone spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644: iPhone 16 Pro Max ZAA\"}}]',12,1),(20,'2026-08-26 19:58:40.767020','15','Galaxy A37',1,'[{\"added\": {}}, {\"added\": {\"name\": \"phone spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644: Galaxy A37\"}}]',12,1),(21,'2026-08-26 20:08:36.457976','16','گوشی موبایل نوکیا مدل 125 2024',1,'[{\"added\": {}}, {\"added\": {\"name\": \"phone spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644: \\u06af\\u0648\\u0634\\u06cc \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644 \\u0646\\u0648\\u06a9\\u06cc\\u0627 \\u0645\\u062f\\u0644 125 2024\"}}]',12,1),(22,'2026-08-26 20:19:50.049401','17','Redmi Note 15 4G',1,'[{\"added\": {}}, {\"added\": {\"name\": \"phone spec\", \"object\": \"\\u0645\\u0634\\u062e\\u0635\\u0627\\u062a \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644: Redmi Note 15 4G\"}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'account','emailaddress'),(7,'account','emailconfirmation'),(8,'accounts','customuser'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'contenttypes','contenttype'),(14,'orders','order'),(15,'orders','orderitem'),(9,'products','cameraspec'),(10,'products','laptopspec'),(11,'products','phonespec'),(12,'products','product'),(13,'products','productcomment'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-08-01 13:44:59.021388'),(2,'contenttypes','0002_remove_content_type_name','2026-08-01 13:44:59.115491'),(3,'auth','0001_initial','2026-08-01 13:44:59.363877'),(4,'auth','0002_alter_permission_name_max_length','2026-08-01 13:44:59.422343'),(5,'auth','0003_alter_user_email_max_length','2026-08-01 13:44:59.428839'),(6,'auth','0004_alter_user_username_opts','2026-08-01 13:44:59.436886'),(7,'auth','0005_alter_user_last_login_null','2026-08-01 13:44:59.444180'),(8,'auth','0006_require_contenttypes_0002','2026-08-01 13:44:59.446704'),(9,'auth','0007_alter_validators_add_error_messages','2026-08-01 13:44:59.454621'),(10,'auth','0008_alter_user_username_max_length','2026-08-01 13:44:59.461785'),(11,'auth','0009_alter_user_last_name_max_length','2026-08-01 13:44:59.468532'),(12,'auth','0010_alter_group_name_max_length','2026-08-01 13:44:59.492870'),(13,'auth','0011_update_proxy_permissions','2026-08-01 13:44:59.504610'),(14,'auth','0012_alter_user_first_name_max_length','2026-08-01 13:44:59.512908'),(15,'accounts','0001_initial','2026-08-01 13:44:59.941431'),(16,'account','0001_initial','2026-08-01 13:45:00.224701'),(17,'account','0002_email_max_length','2026-08-01 13:45:00.270122'),(18,'account','0003_alter_emailaddress_create_unique_verified_email','2026-08-01 13:45:00.317135'),(19,'account','0004_alter_emailaddress_drop_unique_email','2026-08-01 13:45:00.371450'),(20,'account','0005_emailaddress_idx_upper_email','2026-08-01 13:45:00.395171'),(21,'account','0006_emailaddress_lower','2026-08-01 13:45:00.410570'),(22,'account','0007_emailaddress_idx_email','2026-08-01 13:45:00.449641'),(23,'account','0008_emailaddress_unique_primary_email_fixup','2026-08-01 13:45:00.463762'),(24,'account','0009_emailaddress_unique_primary_email','2026-08-01 13:45:00.472062'),(25,'admin','0001_initial','2026-08-01 13:45:00.672166'),(26,'admin','0002_logentry_remove_auto_add','2026-08-01 13:45:00.696926'),(27,'admin','0003_logentry_add_action_flag_choices','2026-08-01 13:45:00.732390'),(28,'products','0001_initial','2026-08-01 13:45:00.961249'),(29,'products','0002_camera_laptop_mobile_product_discount_percentage_and_more','2026-08-01 13:45:01.368851'),(30,'orders','0001_initial','2026-08-01 13:45:01.621330'),(31,'products','0003_remove_laptop_product_ptr_remove_mobile_product_ptr_and_more','2026-08-01 13:45:02.178720'),(32,'sessions','0001_initial','2026-08-01 13:45:02.217422');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5hp08o5k9g2fyw21frhmx1avkdxcsc7k','eyJjYXJ0Ijp7IjE2Ijp7InF1YW50aXR5Ijo0fX19:1x1JTj:tnm_FWPy0x17ONsQb9bW85wvsrgSxjLhkzTV1h47zgE','2026-09-15 08:04:23.742064'),('f04q9qfn5um5xfn5gex9sh8fa1c7r0tg','eyJjYXJ0Ijp7fX0:1wwjuX:fvusQr_QcQm7wHqJa_94Iut2-ZFTJiNRf5_w2vj-Jvo','2026-09-02 17:17:09.072850'),('fa7deoj6nnbaot9boz38nqlqvqm1efzk','.eJxVjDkOgzAUBe_iOrLwik2ZPmdAf3MgiUBiqRB3D0gUSftm3myqhXXp2nWWqe1ZNcqo2--GQG8ZTsAvGJ6jpnFYph71qeiLzvoxsnzul_sX6GDujjcZb4MtnIr11hsKWWLJzmEMIAw1hIrJYG3RI3k2KVGuJGZ05LKVckQJpkU1275_ASSJO30:1wszjp:di8L1TQZy4xIBroZbt_ZAZukx1515EuOwLjL4hrLsI0','2026-08-23 09:22:37.878711'),('m4zb10yipwjc10leluuam2imqf9zj6dr','.eJxVkMtqxDAMRf9F6xDiRx7Osvv5glKCLCtN2o49jR3aEvLvtdvZDAghdO89IB1AuCUYDxCq9M8dfVrTD4ziPCtAorD7NOGeFs4CYVqDn66cluAijM8H_M8wwg1j_AqbgxzLRNEPxvRKdqrWjcrVVrBH3jxeObsTLgjnSwV_7Kko01owAh52FumdfRHcG_rXUFPwaVttXSz1XY31JTj-eLp7HwALxiWnSWjZytkNs9RSC2oNd7NRynYtssMe28aRsL202pJ2YhjINNwZq0gZyXOBRo6xnM_ft3UrL5KN6Zrm_AVvy2qW:1x8Xos:y8DiWeewDLLY2qzeAju1Tc3JJsuFx0WtOyuVPUFHEZo','2026-10-05 06:48:06.796661'),('sd5rssr19cufhvntesm8yu0w7j5bj76w','.eJxVjDsOgzAQRO-ydWThL5gyfc6A1ut1IImMAqaIEHcPSDQ0U8x7MysQTgXaFeQR3wVzGcoPWr1tN-hwKX23zDx1Q4R2dy5dQHpzPkB8YX6OgsZcpiGIQxEnncVjjPy5n-7loMe539ckjbIqxSYpo4wk69klr3VwFjlijbaKJEOtgglkomwa8hU7HzRprzjB9geDPkFU:1wqC7H:_io1LQBLS4gm6vlMKbCrmq-kiVxUiLtGJRvH_Qoooyw','2026-08-15 15:59:15.810361'),('zxe3otw87t5ex6xks77h4djj32h2wijh','.eJxVjDEOgzAQBP9ydWThs00wZfq8AZ3v7EASGQVMESH-niDR0GyxM7srME0F2hW03fOzUC5D-UKL23aBjpbSd8scp24QaEHDqQvEr5h3IE_Kj1HxmMs0BLUr6qCzuo8S37fDPR30NPf_NWuLDpM0CS1azc7HOnljQu0oCl3JVcI6XDHYwFZ007CvYu2DYeMxJth-rGZBhw:1wzbr6:KCIDxFObO_Pu2bJbco03tj9KSQHu5TTBpzH1C62V3CE','2026-09-10 15:17:28.673317');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_ordered` tinyint(1) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_ordered` date NOT NULL,
  `date_modified` date NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_user_id_e9b59eb1_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderitem`
--

DROP TABLE IF EXISTS `orders_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` int unsigned NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` (`order_id`),
  KEY `orders_orderitem_product_id_afe4254a_fk_products_product_id` (`product_id`),
  CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderitem_product_id_afe4254a_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `orders_orderitem_chk_1` CHECK ((`price` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderitem`
--

LOCK TABLES `orders_orderitem` WRITE;
/*!40000 ALTER TABLE `orders_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_cameraspec`
--

DROP TABLE IF EXISTS `products_cameraspec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_cameraspec` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sensor_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resolution` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lens_mount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_resolution` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  CONSTRAINT `products_cameraspec_product_id_234ecf3a_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_cameraspec`
--

LOCK TABLES `products_cameraspec` WRITE;
/*!40000 ALTER TABLE `products_cameraspec` DISABLE KEYS */;
INSERT INTO `products_cameraspec` VALUES (1,'دوربین با لنز قابل تعویض','EOS ۲۰۰۰D','۱۲۹x۱۰۱x۷۷ میلی‌متر','1080',10),(2,'3840 x 2160 (30p),','AAC-LC 2ch (16bit 48 kHz)','a۷ III','4k',11),(3,'دوربین با لنز غیرقابل تعویض','+ 16-50mm Power Zoom Lens','Lens Kit 24.2MP','4k',12);
/*!40000 ALTER TABLE `products_cameraspec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_laptopspec`
--

DROP TABLE IF EXISTS `products_laptopspec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_laptopspec` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cpu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ram` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gpu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  CONSTRAINT `products_laptopspec_product_id_2cd58c94_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_laptopspec`
--

LOCK TABLES `products_laptopspec` WRITE;
/*!40000 ALTER TABLE `products_laptopspec` DISABLE KEYS */;
INSERT INTO `products_laptopspec` VALUES (2,'AMD Ryzen 7 7445HS','16 گیگابایت','گرافیکی: 4 گیگابایت','512 گیگابایت SSD',4),(3,'intel ULTRA 9 275HX','8 گیگابایت DDR5','Onboard','512 گیگابایت SSD',5),(4,'Intel ULTRA 9 285H','32 گیگابایت LPDDR5X','INTEL','1 ترابایت SSD',6),(5,'intel Core i7 14650HX','32 گیگابایت DDR5','8 گیگابایت GDDR7','1 ترابایت SSD',7),(6,'intel Core i7 11800H','1 ترابایت SSD','NVIDIA RTX A3000','1 ترابایت SSD',8),(7,'Intel Core i5 13420H','8 گیگابایت DDR5','INTEL UHD',': 512 گیگابایت SSD',9);
/*!40000 ALTER TABLE `products_laptopspec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_phonespec`
--

DROP TABLE IF EXISTS `products_phonespec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_phonespec` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `screen_size` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `camera_resolution` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `battery_capacity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  CONSTRAINT `products_phonespec_product_id_9f1b7be8_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_phonespec`
--

LOCK TABLES `products_phonespec` WRITE;
/*!40000 ALTER TABLE `products_phonespec` DISABLE KEYS */;
INSERT INTO `products_phonespec` VALUES (2,'۱۶۳.۴x۷۸x۸.۸ میلی‌متر','۱۳۲۰x۲۸۶۸ پیکسل','۵۱۲ گیگابایت','۴۸۲۳ میلی آمپر ساعت',13),(3,'124 34x','1080','5000mph','512',14),(4,'۱۶۲.۹x۷۸.۲x۷.۴ میلی‌متر','۵۰ مگاپیکسل','3200','128',15),(5,'124 34x','320','90000','128',16),(6,'124 34x','40','1200','512',17);
/*!40000 ALTER TABLE `products_phonespec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  `image_big` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_small` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `category` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `products_product_chk_1` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (4,'لپ تاپ 15.6 اینچی ایسوس TUF Gaming FA506NCG R7 7445HS 16GB 512GB SSD RTX 3050','لپ تاپ گیمینگ ASUS TUF Gaming FA506NCG\r\nعملکرد مطمئن، طراحی مقاوم و ارزش خرید بالا\r\n\r\nASUS TUF Gaming FA506NCG یکی از لپ‌تاپ‌های اقتصادی–گیمینگ سری TUF است که با پردازنده قدرتمند AMD Ryzen 7 7445HS، گرافیک NVIDIA GeForce RTX 3050 و نمایشگر 144 هرتزی، گزینه‌ای مناسب برای گیمرهایی است که به دنبال عملکرد روان، کیفیت ساخت بالا و قیمت منطقی هستند. این مدل با استانداردهای سری TUF ساخته شده و با طراحی مستحکم، بدنه مقاوم و کیبورد RGB، یک انتخاب عالی برای گیمینگ روزمره و کارهای سنگین محسوب می‌شود.\r\nطراحی و کیفیت ساخت با هویت TUF\r\n\r\nطراحی بدنه دستگاه مطابق سبک شناخته‌شده سری TUF است؛ ترکیب خطوط هندسی، بافت‌های برجسته و رنگ مشکی مات، حس قدرت و استحکام را منتقل می‌کند. قاب پشتی همراه با لوگوی TUF ظاهری کاملاً گیمینگ دارد و کیفیت ساخت بدنه پلاستیکی تقویت‌شده، دوام بالایی را تضمین می‌کند.',190000,1,'products/pic/big/TUF-Gaming-FA506NCR-R7-7435HS-5.webp','products/pic/small/TUF-Gaming-FA506NCR-R7-7435HS-2.webp','2026-08-26 16:26:33.836047','2026-08-26 16:41:00.531248','laptop'),(5,'لپ تاپ 14 اینچی ایسوس Vivobook X1404VAP Core 5 120U 8GB 512GB SSD Intel','اگر به دنبال یک لپ تاپ گیمینگ فوق پیشرفته هستید که عملکردی در سطح دسکتاپ ارائه دهد، لپ تاپ ایسوس ROG Strix SCAR 16 G635LW یکی از کامل ترین گزینه ها در بازار است. ایسوس با طراحی خیره کننده و قدرت پردازشی خارق العاده در این مدل، بار دیگر استانداردهای لپ تاپ های مخصوص بازی را بالا برده است. شما می توانید این مدل را از طریق ایسوس ایران با گارانتی معتبر تهیه کنید تا از اصالت کالا و پشتیبانی حرفه ای برخوردار باشید.\r\n\r\nبدنه لپ تاپ از جنس پلاستیک فشرده با رنگ مشکی مات ساخته شده که در کنار وزن 2.65 کیلوگرمی، تعادل کاملی بین زیبایی و قدرت ایجاد می کند. خطوط تهاجمی طراحی و نور RGB در اطراف کیبورد، حس واقعی یک لپ تاپ گیمینگ پریمیوم را منتقل می کند.',240000,1,'products/pic/big/x1404vap-silver-4.webp','products/pic/small/x1404vap-silver-1.webp','2026-08-26 17:46:30.489902','2026-08-26 17:46:30.489902','laptop'),(6,'لپ تاپ 14 اینچی ایسوس Zenbook UX3405CA Ultra 9 285H 32GB 1TB SSD INTEL','در قلب این لپ تاپ پردازنده قدرتمند Intel Ultra 9 مدل 275HX قرار دارد که با 24 هسته و 24 رشته و فرکانس تا 5.4 گیگاهرتز، عملکردی شبیه کامپیوترهای حرفه ای رومیزی ارائه می دهد. حافظه کش 36 مگابایتی این پردازنده باعث می شود حتی پرحجم ترین بازی ها و نرم افزارهای سنگین به راحتی اجرا شوند. رم 32 گیگابایتی از نوع DDR5 و قابلیت ارتقا تا 64 گیگابایت، سرعتی مثال زدنی برای پردازش های سنگین فراهم کرده است.\r\n\r\nاز نظر ذخیره سازی، یک ترابایت حافظه SSD از نوع M.2 NVMe PCIe 4.0 استفاده شده که سرعت بوت سیستم و لود بازی ها را چندین برابر افزایش می دهد. تمام این مشخصات باعث شده خرید ROG Strix SCAR 16 G635LW گزینه ای مناسب برای گیمرهای حرفه ای و کاربران خلاق باشد.\r\n\r\nاگر قصد خرید لپ تاپ راگ ایسوس را دارید، این مدل یکی از قابل اعتمادترین و پیشرفته ترین گزینه های موجود در بازار ایران است.',340000,0,'products/pic/big/Asus-Zenbook-UX3405MA-QD519.webp','products/pic/small/لپ-تاپ-14-اینچی-ایسوس-Zenbook-2.webp','2026-08-26 17:49:18.929225','2026-08-26 19:25:18.855559','laptop'),(7,'TUF Gaming F16 FX608JMR i7 14650HX 32GB 1TB SSD RTX 5060','لپ تاپ ایسوس TUF Gaming F16 FX608JMR یکی از قدرتمندترین و به‌روزترین مدل‌های سری TUF در سال 2024 و 2025 است که با هدف ارائه کارایی بالا در رده گیمینگ اقتصادی و میان‌رده حرفه‌ای عرضه شده است. ترکیب پردازنده نسل چهاردهم Core i7، کارت گرافیک نسل جدید RTX 5060 و نمایشگر 16 اینچی 165 هرتزی، این مدل را به انتخابی عالی برای گیمرها، مهندسان و تولیدکنندگان محتوا تبدیل کرده است که به دنبال قدرت و پایداری در کنار قیمت مناسب هستند.',130000,1,'products/pic/big/TUF-Gaming-F16-FX608JH.webp','products/pic/small/TUF-Gaming-F16-FX608JH-2.webp','2026-08-26 17:55:09.267792','2026-08-26 17:55:09.267792','laptop'),(8,'لپ تاپ 16 اینچی ایسوس مدل ProArt StudioBook Pro 16 W7600H3A L2008','لپ تاپ ۱۶ اینچ 4K ایسوس W7600H3A مجهز به صفحه نمایش 16 اینچی با پنلی از نوع OLED، بوده که نسبت تصویر 16:10 را به کاربران ارائه کرده و بسیار مناسب کارهای حرفه ای است. همچنین رزولوشن آن WQXGA و نرخ بروزرسانی این صفحه نمایش 120 هرتز است.\r\n\r\nپشتیبانی 100 درصد از محیط رنگی DCI-P3 و تاییدیه PANTONE برای رنگ های نمایش داده شده، لپ تاپ ایسوس مدل ProArt StudioBook 16 W7600H3A را مناسب کارهای تنظیم رنگی و طراحی های حساس به رنگ کرده است.',620000,1,'products/pic/big/asus-proart-studiobook-W7600H3A-1.jpeg','products/pic/small/asus-proart-studiobook-W7600H3A-3.jpeg','2026-08-26 17:58:44.899517','2026-08-26 17:58:44.899517','laptop'),(9,'لپ تاپ 15.6 اینچی ایسوس Expert Book P1503CVA i5 13420H 8GB 512GB SSD INTEL (IPS)','لپ تاپ ایسوس Expert Book P1503CVA یکی از مدل‌های محبوب سری تجاری ایسوس است که برای کاربران حرفه‌ای و دانشجویان طراحی شده است. این لپ تاپ با برخورداری از پردازنده نسل سیزدهم اینتل و طراحی سبک و مقاوم، تعادلی عالی بین عملکرد و قابلیت حمل ارائه می‌کند. اگر به دنبال بررسی و خرید Expert Book P1503CVA هستید، باید بدانید که این مدل یکی از به‌صرفه‌ترین گزینه‌ها در بازار میان‌رده محسوب می‌شود.\r\n\r\nدر فروشگاه ایسوس ایران می‌توانید این مدل را با گارانتی معتبر و اطمینان از اصالت کالا تهیه کنید. در ادامه مشخصات، مزایا و نقاط تمایز لپ تاپ P1503CVA را به شکل دقیق بررسی می‌کنیم.',230000,1,'products/pic/big/Asus-Expert-Book-P1503CVA.webp','products/pic/small/Asus-Expert-Book-P1503CVA-3.webp','2026-08-26 18:02:44.825758','2026-08-26 18:02:44.825758','laptop'),(10,'Alpha 9 III - Full-frame Mirrorless Interchangeable Lens Camera','The Alpha 9 III is the world\'s first camera with a global shutter full-frame image sensor. This enables blackout-free 120 fps continuous shooting with full AF/AE tracking and distortion-free capture of fast action.',1100000,1,'products/pic/big/150066_original_local_1200x1050_v3_converted.webp','products/pic/small/150061_original_local_1200x1050_v3_converted.webp','2026-08-26 19:06:01.449042','2026-08-26 19:06:01.449042','camera'),(11,'Alpha ZV-E10 II - APS-C Interchangeable Lens Mirrorless Content Creators’ Camera','The Alpha ZV-E10 II features a new 26MP APS-C back-illuminated Exmor R CMOS sensor and BIONZ XR processor for improved image quality, dynamic range and high-ISO performance. It also adds 4K up to 60p recording, an updated built-in microphone system, and Sony\'s larger NP-FZ100 battery for significantly better battery life.',430000,1,'products/pic/big/120986_original_local_1200x1050_v3_converted.webp','products/pic/small/120983_original_local_1200x1050_v3_converted.webp','2026-08-26 19:15:59.336068','2026-08-26 19:15:59.336068','camera'),(12,'Alpha 6400 - APS-C Interchangeable Lens Camera & Lens Kit 24.2MP, 11FPS, 4K/30p','دوربین دیجیتال بدون آینه سونی مدل ZV-E10 به همراه لنز 16-50 میلی متر OSS: روایت تازه از دنیای بدون آینه‌ها\r\n\r\nوقتی سونی ZV-E10 معرفی شد، بسیاری آن را نسخه تکامل‌یافته ZV-1 دانستند؛ دوربینی که با بدنه‌ای جمع‌وجور، حسگری بزرگ‌تر و قابلیت تعویض لنز، مرز میان دوربین‌های کامپکت و حرفه‌ای را بار دیگر جابه‌جا کرد. ZV-E10 نه‌تنها برای ولاگرها، بلکه برای علاقه‌مندان به عکاسی و فیلم‌برداری نیمه‌حرفه‌ای هم انتخابی وسوسه‌کننده است.',810000,1,'products/pic/big/93766_original_local_1200x1050_v3_converted.webp','products/pic/small/101671_original_local_1200x1050_v3_converted.webp','2026-08-26 19:23:27.026576','2026-08-26 19:23:27.026576','camera'),(13,'iPhone 17 Pro','آیفون ۱۷ پرو مکس جدیدترین پرچم‌دار اپل است که با ترکیب طراحی نوآورانه، قدرت سخت‌افزاری و قابلیت‌های نرم‌افزاری پیشرفته، استانداردهای تازه‌ای را در بازار گوشی‌های هوشمند تعریف می‌کند. بدنه این دستگاه از آلومینیوم فورج‌شده ساخته شده که علاوه بر سبکی، انتقال حرارت بهتری نسبت به نسل قبل دارد و همراه با پوشش مقاوم Ceramic Shield نسل دوم، استحکام و ظاهری مدرن را به همراه آورده است. نمایشگر ۶.۹ اینچی Super Retina XDR OLED با رزولوشن بالا، روشنایی ۳۰۰۰ نیت و پشتیبانی از ProMotion، HD ...',430000,1,'products/pic/big/fa4efaff76b26da6d46d36cb7d696a1b62ec380c_1757770187.webp','products/pic/small/b691a366ed4413ad1581ac9d2c275866c5f1273d_1757770186.webp','2026-08-26 19:39:59.689480','2026-08-26 19:39:59.690487','phone'),(14,'iPhone 16 Pro Max ZAA','آیفون 16 پرو مکس، جدیدترین شاهکار اپل، با طراحی شیک، دوربین‌های بی‌نظیر و عملکردی فوق‌العاده، استانداردهای جدیدی را برای گوشی‌های هوشمند تعریف می‌کند. نمایشگر 6.9 اینچی Super Retina XDR OLED با وضوح بالا و نرخ نوسازی 120 هرتز، تجربه بصری کم‌نظیری را ارائه می‌دهد و بدنه‌ مقاوم از جنس شیشه و تیتانیوم، زیبایی و دوام را در کنار هم به ارمغان می‌آورد. چیپست قدرتمند A18 Bionic با فناوری 3 نانومتری، به کاربران امکان می‌دهد تا بازی‌ها و اپلیکیشن‌های سنگین را به راحتی اجرا کنند. دورب ...',230000,1,'products/pic/big/79d3bc1cd735754ea98daf72812e04314582cb1d_1757835518.webp','products/pic/small/10c9fa36b8068b3259e63b4b62760447431fee8f_1757835495.webp','2026-08-26 19:43:54.989219','2026-08-26 19:43:54.989219','phone'),(15,'Galaxy A37','گوشی موبایل سامسونگ Galaxy A37 یک میان‌رده همه‌فن‌حریف و ارزنده‌ است که با ویژگی‌های پریمیوم و مشخصات فنی متعادل، ارزش خرید بالایی را در بازار مدرن امروزی خلق کرده است. سامسونگ در طراحی بدنه این دستگاه سنگ تمام گذاشته و قاب جلو و پشت آن را به پوشش سخت و مقاوم Corning Gorilla Glass Victus+ مجهز کرده است. این بدنه شیشه‌ای در کنار فریم پلاستیکی مقاوم و دریافت گواهی ضدآب و گرد و غبار IP68 (مقاومت در عمق ۱.۵ متری آب به مدت ۳۰ دقیقه)، تضمین‌کننده دوام فوق‌العاده دستگاه در سناریوهای ...',120000,1,'products/pic/big/b60f764aa93bd7ba499770cb108845fdf5becd51_1776510189.webp','products/pic/small/93dfa04aa45bfffb3657699b41453e53d1119816_1776510183.webp','2026-08-26 19:58:40.764021','2026-08-26 19:58:40.764021','phone'),(16,'گوشی موبایل نوکیا مدل 125 2024','بهترین گوشی حال حاظر موجود',10000,1,'products/pic/big/ad1c5769dbf6196b570bb3f96244cffe47117167_1787069655.webp','products/pic/small/ec012c634454b74bb585618452cbce8cbbea050a_1787069656.webp','2026-08-26 20:08:36.454977','2026-08-26 20:08:36.454977','phone'),(17,'Redmi Note 15 4G','گوشی Redmi Note 15 4G ادامه سری پرطرفدار نوت شیائومی است و پیش‌بینی می‌شود به یکی از پرفروش‌ترین‌ میان‌رده‌های سال 2026 تبدیل شود. این گوشی با تمرکز بر نمایشگر باکیفیت، باتری بسیار پرظرفیت و طراحی باریک وارد بازار شده است. با بدنه‌ای به ضخامت ۷.۹ میلی‌متر و وزن حدود ۱۸۴ گرم یک گوشی خوش‌دست است و در کنار گواهی IP64 در برابر گردوغبار و پاشش آب مقاوم است و ترکیبی از ظرافت و دوام را ارائه می‌دهد. نمایشگر ۶.۷۷ اینچی AMOLED با نرخ نوسازی ۱۲۰ هرتز، روشنایی فوق‌العاده ۳۲۰۰ نیت',230000,1,'products/pic/big/344fa97a9529d68be3ca0d93927f86e1e8195139_1770735649.webp','products/pic/small/048b03834d18e57db67b5dd01537a27a82a0bbdd_1770735657.webp','2026-08-26 20:19:50.046405','2026-08-26 20:19:50.046405','phone');
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productcomment`
--

DROP TABLE IF EXISTS `products_productcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_productcomment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` smallint unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_name_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productcomm_product_id_1e45f07c_fk_products_` (`product_id`),
  KEY `products_productcomm_user_name_id_0be0d7a9_fk_accounts_` (`user_name_id`),
  CONSTRAINT `products_productcomm_product_id_1e45f07c_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_productcomm_user_name_id_0be0d7a9_fk_accounts_` FOREIGN KEY (`user_name_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `products_productcomment_chk_1` CHECK ((`rating` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productcomment`
--

LOCK TABLES `products_productcomment` WRITE;
/*!40000 ALTER TABLE `products_productcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_productcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_store'
--

--
-- Dumping routines for database 'db_store'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-21 14:56:05
