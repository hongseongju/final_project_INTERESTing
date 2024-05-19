-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: interesting
-- ------------------------------------------------------
-- Server version	8.4.0

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
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_upper` ((upper(`email`))),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'aa@a.com',0,1,1),(2,'bb@b.com',0,1,3),(3,'aaa@naver.com',0,1,4),(4,'bb@ddb.com',0,1,5);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;

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
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;

--
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `cash` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$600000$OboV1QmSRf31HA0TQa5wrx$trkDS6durs2g2OkPXk7OOGupA8O8GPBfKjTMqPuY0YM=','2024-05-18 12:51:29.548951',0,'fire1','','','aa@a.com',0,1,'2024-05-18 12:51:29.156578','plzplz',0.00),(2,'pbkdf2_sha256$600000$ObLVxTLLbbRstxjcfzATbb$GqzQO8BLspyrXdD9UhgP5jWjEvNd5dYXOnJHy1Hz8B4=','2024-05-18 14:02:34.198433',0,'kitty','','','aa@a.com',0,1,'2024-05-18 14:02:33.120902','plzplz',0.00),(3,'pbkdf2_sha256$600000$XhXwkGE06AGj0BGJ9AA9LG$hbXBJPqEgT7mjK+Q0rihxIz7PbDeZHq+jM0xZgj3Khw=','2024-05-18 14:04:27.301171',0,'flower1','','','bb@b.com',0,1,'2024-05-18 14:04:26.305224','가입돼줘제발',0.00),(4,'pbkdf2_sha256$600000$uUQAF4YsWoA1ilVcnNPSrH$z/u6ez5YO5GlEWnPc7YCWMTq2GpdThfhReCjZ9PNNUE=','2024-05-18 16:23:46.976876',0,'ice1','','','aaa@naver.com',0,1,'2024-05-18 16:23:46.516274','plzplz',0.00),(5,'pbkdf2_sha256$600000$7z3hhbCl8yeQieH4fxthPh$NaHBotI4yCieiYM7De6ygRiWXvoZZ4+3g9Zrc5ekRTY=','2024-05-18 17:12:11.855209',0,'water1','','','bb@ddb.com',0,1,'2024-05-18 16:28:55.375521','슬리피우드',2000.00),(6,'pbkdf2_sha256$600000$lY2gWwmjZLT1BndQCdijmD$Lmmx60ho/1mWbZjD8NlpyO+F3bvrc3o91CVxpHXZmE0=','2024-05-19 07:11:03.301035',0,'hot1','','','bb@b.com',0,1,'2024-05-19 06:31:01.099583','예적금',10010300.00);
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_groups` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_user_permissions`
--

/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` ENABLE KEYS */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user',1,'add_customuser'),(2,'Can change user',1,'change_customuser'),(3,'Can delete user',1,'delete_customuser'),(4,'Can view user',1,'view_customuser'),(5,'Can add financial product',2,'add_financialproduct'),(6,'Can change financial product',2,'change_financialproduct'),(7,'Can delete financial product',2,'delete_financialproduct'),(8,'Can view financial product',2,'view_financialproduct'),(9,'Can add option list',3,'add_optionlist'),(10,'Can change option list',3,'change_optionlist'),(11,'Can delete option list',3,'delete_optionlist'),(12,'Can view option list',3,'view_optionlist'),(13,'Can add deposit product',4,'add_depositproduct'),(14,'Can change deposit product',4,'change_depositproduct'),(15,'Can delete deposit product',4,'delete_depositproduct'),(16,'Can view deposit product',4,'view_depositproduct'),(17,'Can add deposit option',5,'add_depositoption'),(18,'Can change deposit option',5,'change_depositoption'),(19,'Can delete deposit option',5,'delete_depositoption'),(20,'Can view deposit option',5,'view_depositoption'),(21,'Can add exchange',6,'add_exchange'),(22,'Can change exchange',6,'change_exchange'),(23,'Can delete exchange',6,'delete_exchange'),(24,'Can view exchange',6,'view_exchange'),(25,'Can add site',7,'add_site'),(26,'Can change site',7,'change_site'),(27,'Can delete site',7,'delete_site'),(28,'Can view site',7,'view_site'),(29,'Can add email address',8,'add_emailaddress'),(30,'Can change email address',8,'change_emailaddress'),(31,'Can delete email address',8,'delete_emailaddress'),(32,'Can view email address',8,'view_emailaddress'),(33,'Can add email confirmation',9,'add_emailconfirmation'),(34,'Can change email confirmation',9,'change_emailconfirmation'),(35,'Can delete email confirmation',9,'delete_emailconfirmation'),(36,'Can view email confirmation',9,'view_emailconfirmation'),(37,'Can add social account',10,'add_socialaccount'),(38,'Can change social account',10,'change_socialaccount'),(39,'Can delete social account',10,'delete_socialaccount'),(40,'Can view social account',10,'view_socialaccount'),(41,'Can add social application',11,'add_socialapp'),(42,'Can change social application',11,'change_socialapp'),(43,'Can delete social application',11,'delete_socialapp'),(44,'Can view social application',11,'view_socialapp'),(45,'Can add social application token',12,'add_socialtoken'),(46,'Can change social application token',12,'change_socialtoken'),(47,'Can delete social application token',12,'delete_socialtoken'),(48,'Can view social application token',12,'view_socialtoken'),(49,'Can add Token',13,'add_token'),(50,'Can change Token',13,'change_token'),(51,'Can delete Token',13,'delete_token'),(52,'Can view Token',13,'view_token'),(53,'Can add token',14,'add_tokenproxy'),(54,'Can change token',14,'change_tokenproxy'),(55,'Can delete token',14,'delete_tokenproxy'),(56,'Can view token',14,'view_tokenproxy'),(57,'Can add log entry',15,'add_logentry'),(58,'Can change log entry',15,'change_logentry'),(59,'Can delete log entry',15,'delete_logentry'),(60,'Can view log entry',15,'view_logentry'),(61,'Can add permission',16,'add_permission'),(62,'Can change permission',16,'change_permission'),(63,'Can delete permission',16,'delete_permission'),(64,'Can view permission',16,'view_permission'),(65,'Can add group',17,'add_group'),(66,'Can change group',17,'change_group'),(67,'Can delete group',17,'delete_group'),(68,'Can view group',17,'view_group'),(69,'Can add content type',18,'add_contenttype'),(70,'Can change content type',18,'change_contenttype'),(71,'Can delete content type',18,'delete_contenttype'),(72,'Can view content type',18,'view_contenttype'),(73,'Can add session',19,'add_session'),(74,'Can change session',19,'change_session'),(75,'Can delete session',19,'delete_session'),(76,'Can view session',19,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('509a5f9bf9c7998301804ffdb75401c6318e90d7','2024-05-18 14:02:34.190442',2),('86c5d58585ac97467926a1272b1aba7d2c34d3bc','2024-05-18 14:04:27.284395',3);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','emailaddress'),(9,'account','emailconfirmation'),(1,'accounts','customuser'),(15,'admin','logentry'),(17,'auth','group'),(16,'auth','permission'),(13,'authtoken','token'),(14,'authtoken','tokenproxy'),(18,'contenttypes','contenttype'),(6,'exchange_rate','exchange'),(5,'savings','depositoption'),(4,'savings','depositproduct'),(2,'savings','financialproduct'),(3,'savings','optionlist'),(19,'sessions','session'),(7,'sites','site'),(10,'socialaccount','socialaccount'),(11,'socialaccount','socialapp'),(12,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-18 12:47:49.198535'),(2,'contenttypes','0002_remove_content_type_name','2024-05-18 12:47:49.262827'),(3,'auth','0001_initial','2024-05-18 12:47:49.499843'),(4,'auth','0002_alter_permission_name_max_length','2024-05-18 12:47:49.564150'),(5,'auth','0003_alter_user_email_max_length','2024-05-18 12:47:49.572461'),(6,'auth','0004_alter_user_username_opts','2024-05-18 12:47:49.581572'),(7,'auth','0005_alter_user_last_login_null','2024-05-18 12:47:49.587899'),(8,'auth','0006_require_contenttypes_0002','2024-05-18 12:47:49.591906'),(9,'auth','0007_alter_validators_add_error_messages','2024-05-18 12:47:49.599174'),(10,'auth','0008_alter_user_username_max_length','2024-05-18 12:47:49.605697'),(11,'auth','0009_alter_user_last_name_max_length','2024-05-18 12:47:49.612203'),(12,'auth','0010_alter_group_name_max_length','2024-05-18 12:47:49.626258'),(13,'auth','0011_update_proxy_permissions','2024-05-18 12:47:49.633953'),(14,'auth','0012_alter_user_first_name_max_length','2024-05-18 12:47:49.639959'),(15,'accounts','0001_initial','2024-05-18 12:47:49.937651'),(16,'account','0001_initial','2024-05-18 12:47:50.100082'),(17,'account','0002_email_max_length','2024-05-18 12:47:50.119310'),(18,'account','0003_alter_emailaddress_create_unique_verified_email','2024-05-18 12:47:50.153106'),(19,'account','0004_alter_emailaddress_drop_unique_email','2024-05-18 12:47:50.190667'),(20,'account','0005_emailaddress_idx_upper_email','2024-05-18 12:47:50.214151'),(21,'admin','0001_initial','2024-05-18 12:47:50.425370'),(22,'admin','0002_logentry_remove_auto_add','2024-05-18 12:47:50.433374'),(23,'admin','0003_logentry_add_action_flag_choices','2024-05-18 12:47:50.442591'),(24,'authtoken','0001_initial','2024-05-18 12:47:50.529277'),(25,'authtoken','0002_auto_20160226_1747','2024-05-18 12:47:50.553424'),(26,'authtoken','0003_tokenproxy','2024-05-18 12:47:50.556910'),(27,'exchange_rate','0001_initial','2024-05-18 12:47:50.580831'),(28,'savings','0001_initial','2024-05-18 12:47:50.668252'),(29,'savings','0002_remove_financialproduct_dcls_end_day_and_more','2024-05-18 12:47:50.774741'),(30,'savings','0003_remove_optionlist_dcls_month','2024-05-18 12:47:50.790953'),(31,'savings','0004_depositproduct_depositoption','2024-05-18 12:47:50.875569'),(32,'sessions','0001_initial','2024-05-18 12:47:50.904039'),(33,'sites','0001_initial','2024-05-18 12:47:50.921068'),(34,'sites','0002_alter_domain_unique','2024-05-18 12:47:50.941167'),(35,'socialaccount','0001_initial','2024-05-18 12:47:51.339759'),(36,'socialaccount','0002_token_max_lengths','2024-05-18 12:47:51.390924'),(37,'socialaccount','0003_extra_data_default_dict','2024-05-18 12:47:51.400607'),(38,'socialaccount','0004_app_provider_id_settings','2024-05-18 12:47:51.552202'),(39,'socialaccount','0005_socialtoken_nullable_app','2024-05-18 12:47:51.674976'),(40,'socialaccount','0006_alter_socialaccount_extra_data','2024-05-18 12:47:51.747984');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3brwbjo3d1yuy3y05ww5ms852cgaxrnv','.eJxVjDsOwyAQBe9CHSEWFjAp0_sMaPk4OIlAMnYV5e4RkoukfTPz3szTsRd_9Lz5NbErU-zyuwWKz1wHSA-q98Zjq_u2Bj4UftLO55by63a6fweFehn15AKAcJBRGgRMiwootAQNOZDQ0aK0FqJCJTJpctIlZwTZhJMJi2WfL7aGNtY:1s8Kfj:yk2mBe_G7mNU2sal6S15875jNC_8Udk7L0wxH7KFZHA','2024-06-01 14:04:27.305738'),('5le7s7edxeocp1kz81znw4e2mm3h0ak6','.eJxVjzkOgzAQRe_iOrLwghfK9DmDNR4PwQkxEpg0Ue4ekEhB-bcn_Q8DxGktNbxpzn2mFOgFeWRdWcfxwgKsdQjrQnPIiXVMspMXAZ9U9iA9oNwnjlOpc458r_AjXfhtSjRej-4JMMAybGuBXjboKcXeK-8lWmfR2ZSk0ya1TrRaI4HyEZWKTgmhGotkpN6kcHaD_n_sbCo1I9TtDFTWCStMoxvfKm6kkU7J7w-U3lC3:1s8Kdt:hlBloF9mFDnmDlyy36WJL2LpM5OX-SIzmcfk3fHFkIM','2024-06-01 14:02:33.641455'),('600rnzgv1sxd93l5h4v321gj3862xk8g','.eJxVjEEOwiAQRe_C2pACZUCX7j0DGWBGqoYmpV0Z725JutDdz38v7y0CbmsJW6MlTFlcBIjT7xcxPal2kB9Y77NMc12XKcquyIM2eZszva6H-xco2ErPorPJuNFkBcSZB4B9xGQsGQBvBsXR6TFazspq5l1h9NoCJeXJn8XnC-jxOEs:1s8aFb:gnEaqSiCfHxStee7nEhDcOrEdCqIwdkK3tfRCnauC7s','2024-06-02 06:42:31.600153'),('6i6qavy830tyxelwfdrwg1r9umkh91he','.eJxVjEEOwiAQRe_C2hAoDHVcuu8ZyAwMtmpoUtqV8e7apAvd_vfef6lI2zrGrckSp6wuCtTpd2NKD6k7yHeqt1mnua7LxHpX9EGbHuYsz-vh_h2M1MZvLQmBS3fuibOjElKiLnjXO7AsLBnEsLeWkDy4AtYgAZpCDnuLGEC9PwkzOAQ:1s8N98:tn68-bBGQmPsCYwUYvUDh9TlcWAbL0r0sGefYTMz_i8','2024-06-01 16:42:58.369542'),('90t3xsr6fasen81nfalemv20kje83rbh','.eJxVjMEOwiAQRP-FsyGFpWXx6N1vILC7StXQpLQn47_bJj3ocea9mbeKaV1KXJvMcWR1Vladfruc6Cl1B_xI9T5pmuoyj1nvij5o09eJ5XU53L-DklrZ1oaC7SgI51uAECx59ISe2aIbuEfTO0eSIGQCyAjGQOdJBuu2aNCrzxfaLjcl:1s8Kdu:3WGRP5B_UVTr-6Y9HV5LvxUh8QLYJ40e-LfQqiE_fCo','2024-06-01 14:02:34.201447'),('99p8zpcfualpyc5i37h2i5jh1qthb3pv','.eJxVj80OwiAQhN-FsyFQ_ro9evcZyAKLRStNWurF-O62iR68zjczmXkxjHHeavNPWkoulDw9sExsqNs0nZjHrY1-W2nxJbGBGfanBYx3qgdIN6zXmce5tqUEflj4l678Mieazl_vX8GI67inKYIJuesdhqQw2xixs1o5ZWSgQMmQCFpKBNRGZSMFoAGRUYGTAPZY9ftxdFNtJWLbz2Bjg3TSCg1OWS6sBujh_QHsb1Gu:1s8MvY:cOd6qxs2Rr1iDNFchK52k3aR8PVrN2RQ1sTb_bPqd6Q','2024-06-01 16:28:56.066022'),('cz8atdgg9dvck8jrlytii5dl01wsfuek','.eJxVjEEOwiAQRe_C2hAoDHVcuu8ZyAwMtmpoUtqV8e7apAvd_vfef6lI2zrGrckSp6wuCtTpd2NKD6k7yHeqt1mnua7LxHpX9EGbHuYsz-vh_h2M1MZvLQmBS3fuibOjElKiLnjXO7AsLBnEsLeWkDy4AtYgAZpCDnuLGEC9PwkzOAQ:1s8MvY:byp2fURcnxTV7fTNLvzh-3VQ8nEhSRK8mYpRAxS26u4','2024-06-01 16:28:56.601734'),('h8b6f2j5i9lvcuw5qg92lecr06mvs06u','.eJxVjEEOwiAQRe_C2hAoDHVcuu8ZyAwMtmpoUtqV8e7apAvd_vfef6lI2zrGrckSp6wuCtTpd2NKD6k7yHeqt1mnua7LxHpX9EGbHuYsz-vh_h2M1MZvLQmBS3fuibOjElKiLnjXO7AsLBnEsLeWkDy4AtYgAZpCDnuLGEC9PwkzOAQ:1s8MxL:lPRjGDwixUxwKFEx1f7FrhYYI7G0IKDitr1RUK__56U','2024-06-01 16:30:47.967414'),('rykzfmq2h2h7lyndzi5cifwgxj5p2moe','.eJxVj8EOwiAQRP-FsyFsC2zp0bvfQBbYWrTSpKVejP-uTfTQ67yZl8xLUIzzVqp_8pKHzMnzg_Ik-rJN00l42urot5UXn5PoRSsOWaB457KDdKNynWWcS11ykHtF_ugqL3Pi6fzrHgQjreO-7lwAUA5YN1aDTkMbtDINGOBAykTUDSLEVreKyZBrXHJWESbd2TDgV_r_sbu51Bypfs9QFT0gWKVBWSvRKYto3h9jBVBw:1s8Kfi:u9ashabanOUGmhORVNaPksXUcFhPG7ZRPPa8znHMlnI','2024-06-01 14:04:26.791641'),('sija7nyg4m04l4ijgqmc7g5roz18qb5b','.eJxVjEEOwiAQRe_C2pACZUCX7j0DGWBGqoYmpV0Z725JutDdz38v7y0CbmsJW6MlTFlcBIjT7xcxPal2kB9Y77NMc12XKcquyIM2eZszva6H-xco2ErPorPJuNFkBcSZB4B9xGQsGQBvBsXR6TFazspq5l1h9NoCJeXJn8XnC-jxOEs:1s8a4U:X6U5W_PyWOMJhepxEhaKFAFjsB-OjnlMiuxxFFm78Js','2024-06-02 06:31:02.218810'),('subfackk6lbfzxnxgcsx8necgttqmzjq','.eJxVjEEOwiAQRe_C2pACZUCX7j0DGWBGqoYmpV0Z725JutDdz38v7y0CbmsJW6MlTFlcBIjT7xcxPal2kB9Y77NMc12XKcquyIM2eZszva6H-xco2ErPorPJuNFkBcSZB4B9xGQsGQBvBsXR6TFazspq5l1h9NoCJeXJn8XnC-jxOEs:1s8ahD:UoH6mN8bZISgpArv81ASZNxmangHbsMybnTU16lDg6s','2024-06-02 07:11:03.310401'),('w467shv2xpunv5pjlj92s70xrul5d2t9','.eJxVj8sOwiAURP-FtSE8ym3t0r3fQC5wsWiFpAU3xn-3TerC3WTm5CTzZuh9abnaFy0pJgqWnphmNuY2zydmsdXJtpUWmwIbGbC_zqF_UN6HcMd8K9yXXJfk-I7wY135tQSaLwf7J5hwnXYt9sbrvtNBAsUQBcAWnNeGNMCghYyuV50zMUijYtyQiIMyQF4ONJw36e_H7qZck8e6ncHKRtlLkEIokBw6ZZT-fAGGWlGb:1s8a4T:SZ5m9wet6aZ5u2qbXiIyEPcK8yRIrE1Zxri7yn-s-cA','2024-06-02 06:31:01.702170'),('zmoab6gztoep6rmdbt8k7brgyhounn6l','.eJxVjEEOwiAQRe_C2hAoDHVcuu8ZyAwMtmpoUtqV8e7apAvd_vfef6lI2zrGrckSp6wuCtTpd2NKD6k7yHeqt1mnua7LxHpX9EGbHuYsz-vh_h2M1MZvLQmBS3fuibOjElKiLnjXO7AsLBnEsLeWkDy4AtYgAZpCDnuLGEC9PwkzOAQ:1s8NbP:VjznVRb15FDXtrh1JVVNRGgDe_KeWpPPle14n833T7k','2024-06-01 17:12:11.861864');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;

--
-- Table structure for table `exchange_rate_exchange`
--

DROP TABLE IF EXISTS `exchange_rate_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchange_rate_exchange` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cur_nm` varchar(100) NOT NULL,
  `cur_unit` varchar(10) NOT NULL,
  `deal_bas_r` decimal(10,2) NOT NULL,
  `ttb` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_rate_exchange`
--

/*!40000 ALTER TABLE `exchange_rate_exchange` DISABLE KEYS */;
INSERT INTO `exchange_rate_exchange` VALUES (1,'아랍에미리트 디르함','AED',372.72,368.99),(2,'호주 달러','AUD',916.75,907.58),(3,'바레인 디나르','BHD',3631.40,3595.08),(4,'브루나이 달러','BND',1018.45,1008.26),(5,'캐나다 달러','CAD',1006.58,996.51),(6,'스위스 프랑','CHF',1518.58,1503.39),(7,'위안화','CNH',189.08,187.18),(8,'덴마아크 크로네','DKK',199.79,197.79),(9,'유로','EUR',1490.70,1475.79),(10,'영국 파운드','GBP',1736.99,1719.62),(11,'홍콩 달러','HKD',175.32,173.56),(12,'인도네시아 루피아','IDR(100)',8.54,8.45),(13,'일본 옌','JPY(100)',885.37,876.51),(14,'한국 원','KRW',1.00,0.00),(15,'쿠웨이트 디나르','KWD',4454.35,4409.80),(16,'말레이지아 링기트','MYR',290.84,287.93),(17,'노르웨이 크로네','NOK',128.40,127.11),(18,'뉴질랜드 달러','NZD',838.44,830.05),(19,'사우디 리얄','SAR',365.03,361.37),(20,'스웨덴 크로나','SEK',128.46,127.17),(21,'싱가포르 달러','SGD',1018.45,1008.26),(22,'태국 바트','THB',37.69,37.31),(23,'미국 달러','USD',1369.00,1355.31);
/*!40000 ALTER TABLE `exchange_rate_exchange` ENABLE KEYS */;

--
-- Table structure for table `savings_depositoption`
--

DROP TABLE IF EXISTS `savings_depositoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_depositoption` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dcls_month` varchar(6) NOT NULL,
  `fin_co_no` varchar(10) NOT NULL,
  `fin_prdt_cd` varchar(50) NOT NULL,
  `intr_rate_type` varchar(1) NOT NULL,
  `intr_rate_type_nm` varchar(20) NOT NULL,
  `rsrv_type` varchar(1) NOT NULL,
  `rsrv_type_nm` varchar(20) NOT NULL,
  `save_trm` varchar(3) NOT NULL,
  `intr_rate` double NOT NULL,
  `intr_rate2` double NOT NULL,
  `deposit_product_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `savings_depositoptio_deposit_product_id_39f7c255_fk_savings_d` (`deposit_product_id`),
  CONSTRAINT `savings_depositoptio_deposit_product_id_39f7c255_fk_savings_d` FOREIGN KEY (`deposit_product_id`) REFERENCES `savings_depositproduct` (`fin_prdt_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_depositoption`
--

/*!40000 ALTER TABLE `savings_depositoption` DISABLE KEYS */;
INSERT INTO `savings_depositoption` VALUES (1,'202404','0010001','WR0001B','S','단리','','','1',3,3,'WR0001B'),(2,'202404','0010001','WR0001B','S','단리','','','3',3.5,3.5,'WR0001B'),(3,'202404','0010001','WR0001B','S','단리','','','6',3.5,3.5,'WR0001B'),(4,'202404','0010001','WR0001B','S','단리','','','12',3.55,3.55,'WR0001B'),(5,'202404','0010001','WR0001B','S','단리','','','24',3,3,'WR0001B'),(6,'202404','0010001','WR0001B','S','단리','','','36',3,3,'WR0001B'),(7,'202404','0010002','00320342','S','단리','','','1',3,3.2,'00320342'),(8,'202404','0010002','00320342','S','단리','','','3',3.4,3.6,'00320342'),(9,'202404','0010002','00320342','S','단리','','','6',3.4,3.6,'00320342'),(10,'202404','0010002','00320342','S','단리','','','12',3.4,3.7,'00320342'),(11,'202404','0010016','10511008000996000','S','단리','','','6',2.46,3.11,'10511008000996000'),(12,'202404','0010016','10511008000996000','S','단리','','','12',3.2,3.85,'10511008000996000'),(13,'202404','0010016','10511008000996000','S','단리','','','24',3.22,3.87,'10511008000996000'),(14,'202404','0010016','10511008000996000','S','단리','','','36',3.24,3.89,'10511008000996000'),(15,'202404','0010016','10511008001004000','S','단리','','','3',1.92,2.37,'10511008001004000'),(16,'202404','0010016','10511008001004000','S','단리','','','6',2.42,2.87,'10511008001004000'),(17,'202404','0010016','10511008001004000','S','단리','','','12',3.16,3.61,'10511008001004000'),(18,'202404','0010016','10511008001004000','S','단리','','','24',3.18,3.63,'10511008001004000'),(19,'202404','0010016','10511008001004000','S','단리','','','36',3.2,3.65,'10511008001004000'),(20,'202404','0010016','10511008001166004','S','단리','','','12',3.35,3.8,'10511008001166004'),(21,'202404','0010016','10511008001278000','S','단리','','','1',2.2,2.25,'10511008001278000'),(22,'202404','0010016','10511008001278000','S','단리','','','3',2.4,2.45,'10511008001278000'),(23,'202404','0010016','10511008001278000','S','단리','','','6',3.25,3.5,'10511008001278000'),(24,'202404','0010016','10511008001278000','S','단리','','','12',3.4,3.65,'10511008001278000'),(25,'202404','0010016','10511008001278000','S','단리','','','24',3.2,3.45,'10511008001278000'),(26,'202404','0010016','10511008001278000','S','단리','','','36',3.2,3.45,'10511008001278000'),(27,'202404','0010017','01030500510002','S','단리','','','1',2.25,2.25,'01030500510002'),(28,'202404','0010017','01030500510002','S','단리','','','3',2.45,3.4,'01030500510002'),(29,'202404','0010017','01030500510002','S','단리','','','6',2.55,3.4,'01030500510002'),(30,'202404','0010017','01030500510002','S','단리','','','12',2.75,3.4,'01030500510002'),(31,'202404','0010017','01030500510002','S','단리','','','24',2.8,2.8,'01030500510002'),(32,'202404','0010017','01030500510002','S','단리','','','36',2.8,2.8,'01030500510002'),(33,'202404','0010017','01030500560002','S','단리','','','1',2.2,2.85,'01030500560002'),(34,'202404','0010017','01030500560002','S','단리','','','3',2.75,3.4,'01030500560002'),(35,'202404','0010017','01030500560002','S','단리','','','6',3,3.65,'01030500560002'),(36,'202404','0010017','01030500560002','S','단리','','','12',3,3.65,'01030500560002'),(37,'202404','0010017','01030500560002','S','단리','','','24',2.25,2.9,'01030500560002'),(38,'202404','0010017','01030500560002','S','단리','','','36',1.95,2.6,'01030500560002'),(39,'202404','0010019','TD11300027000','M','복리','','','12',3.41,3.61,'TD11300027000'),(40,'202404','0010019','TD11300027000','M','복리','','','24',3.41,3.61,'TD11300027000'),(41,'202404','0010019','TD11300027000','M','복리','','','36',3.36,3.56,'TD11300027000'),(42,'202404','0010019','TD11300031000','S','단리','','','1',3.08,3.18,'TD11300031000'),(43,'202404','0010019','TD11300031000','S','단리','','','3',3.17,3.27,'TD11300031000'),(44,'202404','0010019','TD11300031000','S','단리','','','6',3.23,3.33,'TD11300031000'),(45,'202404','0010019','TD11300031000','S','단리','','','12',3.31,3.51,'TD11300031000'),(46,'202404','0010019','TD11300031000','S','단리','','','24',3.31,3.51,'TD11300031000'),(47,'202404','0010019','TD11300031000','S','단리','','','36',3.26,3.46,'TD11300031000'),(48,'202404','0010019','TD11300035000','S','단리','','','12',3.21,3.71,'TD11300035000'),(49,'202404','0010019','TD11300036000','S','단리','','','3',3.4,3.4,'TD11300036000'),(50,'202404','0010019','TD11300036000','S','단리','','','6',3.45,3.45,'TD11300036000'),(51,'202404','0010019','TD11300036000','S','단리','','','12',3.45,3.45,'TD11300036000'),(52,'202404','0010020','101272000006','S','단리','','','1',2.6,2.7,'101272000006'),(53,'202404','0010020','101272000006','S','단리','','','3',2.7,2.8,'101272000006'),(54,'202404','0010020','101272000006','S','단리','','','6',2.85,2.95,'101272000006'),(55,'202404','0010020','101272000006','S','단리','','','12',3.05,3.15,'101272000006'),(56,'202404','0010020','101272000006','S','단리','','','24',3.15,3.25,'101272000006'),(57,'202404','0010020','101272000006','S','단리','','','36',3.25,3.35,'101272000006'),(58,'202404','0010020','101272000057','S','단리','','','1',2.3,3.2,'101272000057'),(59,'202404','0010020','101272000057','S','단리','','','3',2.6,3.5,'101272000057'),(60,'202404','0010020','101272000057','S','단리','','','6',3,3.7,'101272000057'),(61,'202404','0010020','101272000057','S','단리','','','12',3.1,3.75,'101272000057'),(62,'202404','0010020','101272000057','S','단리','','','24',3,3.5,'101272000057'),(63,'202404','0010020','101272000057','S','단리','','','36',3,3.5,'101272000057'),(64,'202404','0010020','101272000058','S','단리','','','3',2.6,3.35,'101272000058'),(65,'202404','0010020','101272000058','S','단리','','','6',2.75,3.5,'101272000058'),(66,'202404','0010020','101272000058','S','단리','','','12',2.95,3.7,'101272000058'),(67,'202404','0010022','10-01-20-024-0046-0000','S','단리','','','3',3.5,3.5,'10-01-20-024-0046-0000'),(68,'202404','0010022','10-01-20-024-0046-0000','S','단리','','','6',3.55,3.55,'10-01-20-024-0046-0000'),(69,'202404','0010022','10-01-20-024-0046-0000','S','단리','','','12',3.4,3.4,'10-01-20-024-0046-0000'),(70,'202404','0010022','10-01-20-024-0059-0000','S','단리','','','12',3.4,3.4,'10-01-20-024-0059-0000'),(71,'202404','0010022','10-01-20-024-0059-0000','S','단리','','','24',3.4,3.6,'10-01-20-024-0059-0000'),(72,'202404','0010022','10-01-20-024-0059-0000','S','단리','','','36',3.4,3.7,'10-01-20-024-0059-0000'),(73,'202404','0010024','21001115','S','단리','','','3',2.45,2.95,'21001115'),(74,'202404','0010024','21001115','S','단리','','','6',2.6,3.1,'21001115'),(75,'202404','0010024','21001115','S','단리','','','12',2.95,3.45,'21001115'),(76,'202404','0010024','21001115','S','단리','','','24',3.05,3.55,'21001115'),(77,'202404','0010024','21001203','S','단리','','','6',3.15,3.45,'21001203'),(78,'202404','0010024','21001203','S','단리','','','12',3.4,3.7,'21001203'),(79,'202404','0010024','21001203','S','단리','','','24',3.45,3.75,'21001203'),(80,'202404','0010024','21001265','S','단리','','','3',2.5,3.5,'21001265'),(81,'202404','0010024','21001265','S','단리','','','6',2.55,3.55,'21001265'),(82,'202404','0010024','21001265','S','단리','','','12',2.55,3.55,'21001265'),(83,'202404','0010024','21001266','S','단리','','','3',2.5,3.5,'21001266'),(84,'202404','0010024','21001266','S','단리','','','6',2.55,3.55,'21001266'),(85,'202404','0010024','21001266','S','단리','','','12',2.55,3.85,'21001266'),(86,'202404','0010026','01211310121','S','단리','','','12',3.45,3.65,'01211310121'),(87,'202404','0010026','01211310121','S','단리','','','24',3.5,3.7,'01211310121'),(88,'202404','0010026','01211310121','S','단리','','','36',3.6,3.8,'01211310121'),(89,'202404','0010026','01211310130','S','단리','','','6',3.33,3.33,'01211310130'),(90,'202404','0010026','01211310130','S','단리','','','12',3.35,3.35,'01211310130'),(91,'202404','0010026','01211310130','S','단리','','','24',3.36,3.36,'01211310130'),(92,'202404','0010026','01211310130','S','단리','','','36',3.33,3.33,'01211310130'),(93,'202404','0010030','06492','S','단리','','','1',3,3,'06492'),(94,'202404','0010030','06492','S','단리','','','3',3.1,3.1,'06492'),(95,'202404','0010030','06492','S','단리','','','6',3.4,3.4,'06492'),(96,'202404','0010030','06492','S','단리','','','12',3.6,3.6,'06492'),(97,'202404','0010030','06492','S','단리','','','24',3.35,3.35,'06492'),(98,'202404','0010030','06492','S','단리','','','36',3.35,3.35,'06492'),(99,'202404','0010927','010300100335','S','단리','','','1',1.8,3,'010300100335'),(100,'202404','0010927','010300100335','S','단리','','','3',2.2,3.45,'010300100335'),(101,'202404','0010927','010300100335','S','단리','','','6',2.3,3.45,'010300100335'),(102,'202404','0010927','010300100335','S','단리','','','12',2.6,3.5,'010300100335'),(103,'202404','0010927','010300100335','S','단리','','','24',2.7,2.8,'010300100335'),(104,'202404','0010927','010300100335','S','단리','','','36',2.8,2.8,'010300100335'),(105,'202404','0011625','200-0135-12','S','단리','','','1',2.15,3,'200-0135-12'),(106,'202404','0011625','200-0135-12','S','단리','','','3',2.45,3.45,'200-0135-12'),(107,'202404','0011625','200-0135-12','S','단리','','','6',2.75,3.5,'200-0135-12'),(108,'202404','0011625','200-0135-12','S','단리','','','12',2.9,3.5,'200-0135-12'),(109,'202404','0011625','200-0135-12','S','단리','','','24',2.95,3,'200-0135-12'),(110,'202404','0011625','200-0135-12','S','단리','','','36',3,3,'200-0135-12'),(111,'202404','0013175','10-003-1225-0001','S','단리','','','1',2.95,3.05,'10-003-1225-0001'),(112,'202404','0013175','10-003-1225-0001','S','단리','','','3',3.35,3.45,'10-003-1225-0001'),(113,'202404','0013175','10-003-1225-0001','S','단리','','','6',3.35,3.45,'10-003-1225-0001'),(114,'202404','0013175','10-003-1225-0001','S','단리','','','12',3.5,3.6,'10-003-1225-0001'),(115,'202404','0013175','10-003-1381-0001','S','단리','','','12',3.1,3.5,'10-003-1381-0001'),(116,'202404','0013175','10-003-1381-0001','S','단리','','','24',3.15,3.55,'10-003-1381-0001'),(117,'202404','0013175','10-003-1381-0001','S','단리','','','36',3.4,3.8,'10-003-1381-0001'),(118,'202404','0013175','10-003-1384-0001','S','단리','','','1',3,3,'10-003-1384-0001'),(119,'202404','0013175','10-003-1384-0001','S','단리','','','3',3.45,3.45,'10-003-1384-0001'),(120,'202404','0013175','10-003-1384-0001','S','단리','','','6',3.45,3.45,'10-003-1384-0001'),(121,'202404','0013175','10-003-1384-0001','S','단리','','','12',3.6,3.6,'10-003-1384-0001'),(122,'202404','0013175','10-003-1384-0001','S','단리','','','24',3.23,3.23,'10-003-1384-0001'),(123,'202404','0013175','10-003-1384-0001','S','단리','','','36',3.4,3.4,'10-003-1384-0001'),(124,'202404','0013175','10-003-1387-0001','S','단리','','','12',3.1,3.9,'10-003-1387-0001'),(125,'202404','0013909','4','S','단리','','','1',2,3,'4'),(126,'202404','0013909','4','S','단리','','','3',2.2,3.45,'4'),(127,'202404','0013909','4','S','단리','','','6',2.3,3.45,'4'),(128,'202404','0013909','4','S','단리','','','12',2.6,3.5,'4'),(129,'202404','0013909','4','S','단리','','','24',2.7,3,'4'),(130,'202404','0013909','4','S','단리','','','36',2.8,3,'4'),(131,'202404','0014674','01013000110000000001','S','단리','','','1',3.05,3.05,'01013000110000000001'),(132,'202404','0014674','01013000110000000001','S','단리','','','3',3.5,3.5,'01013000110000000001'),(133,'202404','0014674','01013000110000000001','S','단리','','','6',3.55,3.55,'01013000110000000001'),(134,'202404','0014674','01013000110000000001','S','단리','','','12',3.55,3.55,'01013000110000000001'),(135,'202404','0014674','01013000110000000001','S','단리','','','24',3.2,3.2,'01013000110000000001'),(136,'202404','0014674','01013000110000000001','S','단리','','','36',3.2,3.2,'01013000110000000001'),(137,'202404','0014807','10120110400011','S','단리','','','12',2.4,2.8,'10120110400011'),(138,'202404','0014807','10120114300011','S','단리','','','6',3.4,3.75,'10120114300011'),(139,'202404','0014807','10120114300011','S','단리','','','12',3.4,3.75,'10120114300011'),(140,'202404','0014807','10120114700011','S','단리','','','3',3.65,3.65,'10120114700011'),(141,'202404','0014807','10120114700011','S','단리','','','6',3.65,3.65,'10120114700011'),(142,'202404','0014807','10120114700011','S','단리','','','12',3.65,3.65,'10120114700011'),(143,'202404','0014807','10120116100011','S','단리','','','12',2.85,3.9,'10120116100011'),(144,'202404','0015130','10-01-20-388-0002','S','단리','','','1',2.7,2.7,'10-01-20-388-0002'),(145,'202404','0015130','10-01-20-388-0002','S','단리','','','3',3.2,3.2,'10-01-20-388-0002'),(146,'202404','0015130','10-01-20-388-0002','S','단리','','','6',3.3,3.3,'10-01-20-388-0002'),(147,'202404','0015130','10-01-20-388-0002','S','단리','','','12',3.3,3.3,'10-01-20-388-0002'),(148,'202404','0015130','10-01-20-388-0002','S','단리','','','24',3,3,'10-01-20-388-0002'),(149,'202404','0015130','10-01-20-388-0002','S','단리','','','36',3,3,'10-01-20-388-0002'),(150,'202404','0017801','1001202000002','S','단리','','','3',3,3,'1001202000002'),(151,'202404','0017801','1001202000002','S','단리','','','6',3,3,'1001202000002');
/*!40000 ALTER TABLE `savings_depositoption` ENABLE KEYS */;

--
-- Table structure for table `savings_depositproduct`
--

DROP TABLE IF EXISTS `savings_depositproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_depositproduct` (
  `fin_prdt_cd` varchar(50) NOT NULL,
  `dcls_month` varchar(6) NOT NULL,
  `fin_co_no` varchar(10) NOT NULL,
  `kor_co_nm` varchar(100) NOT NULL,
  `fin_prdt_nm` varchar(100) NOT NULL,
  `join_way` longtext NOT NULL,
  `mtrt_int` longtext NOT NULL,
  `spcl_cnd` longtext NOT NULL,
  `join_deny` varchar(1) NOT NULL,
  `join_member` longtext NOT NULL,
  `etc_note` longtext NOT NULL,
  `max_limit` bigint DEFAULT NULL,
  `dcls_strt_day` varchar(8) NOT NULL,
  `dcls_end_day` varchar(8) DEFAULT NULL,
  `fin_co_subm_day` varchar(14) NOT NULL,
  PRIMARY KEY (`fin_prdt_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_depositproduct`
--

/*!40000 ALTER TABLE `savings_depositproduct` DISABLE KEYS */;
INSERT INTO `savings_depositproduct` VALUES ('00320342','202404','0010002','한국스탠다드차타드은행','e-그린세이브예금','인터넷,스마트폰','만기 후 1개월: 약정이율의 50%\n만기 후 1개월 초과 1년 이내: 약정이율의 30%\n만기 후 1년 초과: 약정이율의 10%','1.SC제일은행 최초 거래 신규고객에 대하여 우대 이율을 제공함 (보너스이율0.2%)                     2.SC제일마이백통장에서 출금하여 이 예금을 신규하는경우에 보너스이율을 제공함\n(가입기간:1년제/ 보너스이율:0.1% / 만기해약하는 경우에 한해 보너스이율을 적용함)','1','개인(개인사업자 포함)','디지털채널 전용상품 (인터넷, 모바일뱅킹)',1000000000,'20240502','99991231','202405021135'),('01013000110000000001','202404','0014674','주식회사 케이뱅크','코드K 정기예금','스마트폰','만기 후 \n- 1개월 이내 : 만기시점 기본금리 X 50%\n- 1개월 초과~6개월 이내 : 만기시점 기본금리 X 30%\n- 6개월 초과 : 연 0.20%','우대조건 없음','1','만 17세 이상 실명의 개인 및 개인사업자','가입금액 : 1백만원 이상\n가입기간 : 1개월~36개월',1000000000,'20240516',NULL,'202405161421'),('010300100335','202404','0010927','국민은행','KB Star 정기예금','인터넷,스마트폰','- 1개월 이내 : 기본이율 X 50%\n- 1개월 초과  ~ 3개월 이내 : 기본이율 X 30%\n- 3개월 초과 : 0.1%','해당무','1','실명의 개인 또는 개인사업자','- 가입금액 : 1백만원 이상',NULL,'20240429',NULL,'202404290919'),('01030500510002','202404','0010017','부산은행','LIVE정기예금','영업점,인터넷','- 만기후1년내: 가입기간별 일반정기예금이율 x 50%,\n- 만기후1년초과:가입기간별 일반정기예금이율 x 20%','*우대이율\n가. 3~5개월 특판우대이율 : 0.95%\n나. 6~11개월 특판 우대이율: 0.85%\n다. 12개월 특판 우대이율 : 0.65%','1','제한없음','1. 가입금액 :\n   1천만원 이상\n2. 가입기간 : \n1개월 이상 60개월 이하(일단위)\n3. 월이자지급식/만기일시지급식',NULL,'20240422',NULL,'202404221015'),('01030500560002','202404','0010017','부산은행','더(The) 특판 정기예금','인터넷,스마트폰','- 만기후1년내: 가입기간별 일반정기예금이율 x 50%,\n- 만기후1년초과:가입기간별 일반정기예금이율 x 20%','* 우대이율 (최대 0.75%p)\n가. 모바일뱅킹 금융정보 및 혜택알림 동의 우대이율 : 0.10%p\n나. 이벤트 우대이율 : 최대 0.65%p \n1) 더(The) 특판 정기예금 신규고객 우대이율 : 0.20%p\n2) 특판 우대이율 : 0.45%p','1','실명의 개인','1. 가입금액 : 1백만원 이상 제한없음 (원단위)\n2. 가입기간 : 1개월, 3개월, 6개월, 1년, 2년, 3년\n3. 이자지급방식 : 만기일시지급식',NULL,'20240422',NULL,'202404230953'),('01211310121','202404','0010026','중소기업은행','IBK평생한가족통장(실세금리정기예금)','영업점,인터넷,스마트폰','만기일 당시 정기예금 만기후 이자율 적용 -1개월 이내: 만기일 당시 계약기간별 고시금리×50% -1월 초과 6개월 이내: 만기일 당시 계약기간별 고시금리×30% -6개월 초과: 만기일 당시 계약기간별 고시금리×20%','최고 연 0.20%p\n\n-고객별 우대 : 최고 연 0.05%p\n 1. 최초신규고객 : 연 0.05%p\n 2. 재예치고객 : 연 0.05%p\n 3. 장기거래고객 : 연 0.05%p\n\n-주거래우대 : 연 0.15%p','1','실명의 개인\n(개인사업자 제외)','계좌 수 제한 없으며, 최소 1백만원 이상 통합한도 1억원 이내 가입 가능',100000000,'20240422',NULL,'202404221035'),('01211310130','202404','0010026','중소기업은행','1석7조통장(정기예금)','인터넷,스마트폰','만기일 당시 정기예금 만기후 이자율 적용 -1개월 이내: 만기일 당시 계약기간별 고시금리×50% -1월 초과 6개월 이내: 만기일 당시 계약기간별 고시금리×30% -6개월 초과: 만기일 당시 계약기간별 고시금리×20%','없음','1','실명의 개인\n(개인사업자 제외)','계좌 수 제한 없으며, 최소 1백만원 이상 납입한도 제한 없음',NULL,'20240513',NULL,'202405130908'),('06492','202404','0010030','한국산업은행','KDB 정기예금','영업점,인터넷,스마트폰','* 만기후 1년 이내 : 만기일 현재 고시된 일반 정기예금 해당기간 기본이율의 1/2\n* 만기후 1년 초과 : 만기일 현재 고시된 보통예금 이자율','해당없음','1','제한없음','해당없음',NULL,'20240430',NULL,'202404301003'),('10-003-1225-0001','202404','0013175','농협은행주식회사','NH왈츠회전예금 II','영업점,인터넷,스마트폰','만기 후 3개월 : 기본금리의 50%\n만기 후 6개월 : 기본금리의 20%\n만기 후 6개월 초과 : 기본금리의 10%\n\n* 기본금리 : 만기시점의 일반정기예금 계약기간별 금리','1. 급여이체실적(50만원 이상)이 있는 경우 : 0.1%p\n2. 트리플 회전 우대이율 :  4회전기간부터 0.1%p','1','개인','※ 기본금리 및 최고 우대금리 항목은 가입기간이 아닌 ‘회전주기’기간별 금리를 공시\n - 회전주기는 1개월 이상 12개월 이내 월단위로 선택 가능\n※ 전월취급평균금리는 본 홈페이지에 공시되지 않는 회전기간 6개월 미만의 계좌들도 포함하여 산출하기 때문에 회전기간별로 공시된 기본금리보다 낮게 보여질 수 있음',NULL,'20240517',NULL,'202405170921'),('10-003-1381-0001','202404','0013175','농협은행주식회사','NH내가Green초록세상예금','영업점,인터넷,스마트폰','만기 후 3개월 : 기본금리의 50%\n만기 후 6개월 : 기본금리의 20%\n만기 후  6개월 초과 : 기본금리의 10%\n\n* 기본금리 : 만기시점의 일반정기예금 계약기간별 금리','※ 우대금리 최대한도 : 0.4%p(연%, 세전)\n1. 온실가스 줄이기 실천서약서 동의 : 0.1%p\n2. 통장미발급 : 0.1%p\n3. 손하나로인증 서비스 등록 : 0.1%p\n4. NH내가Green초록세상적금 동시 보유 : 0.1%p','1','개인','1. 300만원이상 가입\n2. 온실가스 줄이기 실천서약서 동의시 가입가능\n3. 신규가입 계좌당 2천원씩 녹색환경기금 적립\n※ 자세한 사항은 상품설명서 참조',NULL,'20240517',NULL,'202405170921'),('10-003-1384-0001','202404','0013175','농협은행주식회사','NH올원e예금','인터넷,스마트폰','만기 후 3개월 : 기본금리의 50%\n만기 후 6개월 : 기본금리의 20%\n만기 후  6개월 초과 : 기본금리의 10%\n\n* 기본금리 : 만기시점의 큰만족실세예금 계약기간별 금리','없음','1','개인','1. 10만원 이상 10억원 이내 가입',1000000000,'20240517',NULL,'202405170921'),('10-003-1387-0001','202404','0013175','농협은행주식회사','NH고향사랑기부예금','영업점,인터넷,스마트폰','만기 후 3개월 : 기본금리의 50%\n만기 후 6개월 : 기본금리의 20%\n만기 후  6개월 초과 : 기본금리의 10%\n\n* 기본금리 : 만기시점의 큰만족실세예금 계약기간별 금리','1. 고향사랑기부금 납부고객 우대 : 0.5%p\n\n2-1. 만65세 이상 고령자 우대 : 0.1%p\n2-2. 만 19~34세 MZ고객 우대 : 0.1%p\n\n3. NH채움카드 또는 [zgm고향으로카드] 이용실적 우대 : 0.1%p\n \n4. 고향사랑 특별금리 : 0.1%p (금리시장상황에 따라 변동 가능)\n - 고향사랑 특별금리는 상품 가입고객 모두에게 적용','1','개인','1. 100만원 이상 가입\n2. 고향사랑기부금 우대금리는 농협은행/농축협 영업점 또는 고향사랑e음 홈페이지를 통한 고향사랑기부금 납부실적이 확인되는 경우 제공\n3. 연간 판매액의 0.1% 공익기금 적립\n\n※ 우대조건 관련 자세한 사항은 상품설명서 참조',NULL,'20240517',NULL,'202405170921'),('10-01-20-024-0046-0000','202404','0010022','전북은행','JB 다이렉트예금통장\n(만기일시지급식)','인터넷,스마트폰','만기후 1개월 이하 : 만기일 현재 계약기간별 정기예금 실행이율 1/2\n만기후 1개월 초과 : 연 0.01%','우대조건\n없음','1','실명의 개인(임의단체 제외','가입금액 1계좌당 1백만원이상 10억원이하,\n1인당  총 10억원 이하,\n인터넷/스마트폰뱅킹 가입상품',1000000000,'20240422',NULL,'202404221127'),('10-01-20-024-0059-0000','202404','0010022','전북은행','JB 123 정기예금\n (만기일시지급식)','인터넷,스마트폰','만기후 1개월 이하 : 만기일 현재 계약기간별 정기예금 실행이율 1/2\n만기후 1개월 초과 : 연 0.01%','자동재예치 우대이율\n1회차 0.1%,\n2회차 0.2%,\n3회차 0.3%','1','실명의 개인 또는 개인사업자 (1인 다계좌 가입 가능함)','예금의 신규 : 인터넷뱅킹, 모바일뱅킹, 모바일웹, BDT\n예금의 해지 : 인터넷뱅킹, 모바일뱅킹, 영업점\n가입금액 최저 1백만원이상 고객별 5억원 이사 (다만 자동재예치시 이자 원가로 인한 5억원 초과는 가능), 계좌수 관계없이 가입가능',500000000,'20240422',NULL,'202404221127'),('10-01-20-388-0002','202404','0015130','주식회사 카카오뱅크','카카오뱅크 정기예금','스마트폰','- 만기 후 1개월 이내 : 가입(또는 자동연장)시점 기본금리x50%\n- 만기 후 1개월초과 3개월 이내 : 가입(또는 자동연장)시점 기본금리x30%\n- 만기 후 3개월 초과 : 0.20%','※복잡한 우대조건 없이 가입가능한 정기예금','1','만 17세 이상의 실명의 개인','1. 가입방법 : 스마트폰\n2. 가입금액 : 100만원 이상(원단위)\n3. 가입기간 : 1개월 이상 ~ 36개월 이하(월, 일단위 지정 가능)',NULL,'20240503',NULL,'202405030951'),('1001202000002','202404','0017801','토스뱅크 주식회사','토스뱅크 먼저 이자 받는 정기예금','스마트폰','· 만기 후 1개월 이내 : 만기시점 기본금리 X 50% \n· 만기 후 1개월 초과 3개월 이내 : 만기시점 기본금리 X 20% \n· 만기 후 3개월 초과 : 연 0.10%','우대조건 없음','1','토스뱅크 통장 또는 토스뱅크 서브 통장을 보유한 만 17세 이상 실명의 개인','· 계약기간 : 3개월, 6개월 \n· 가입금액 : 최소 1백만원 최대 10억원',1000000000,'20240422','99991231','202404221023'),('10120110400011','202404','0014807','수협은행','Sh평생주거래우대예금\n(만기일시지급식)','영업점','* 만기후 1년 이내\n - 만기당시 일반정기예금(월이자지급식) 계약기간별 기본금리 1/2\n* 만기후 1년 초과\n - 만기당시 보통예금 기본금리','* 최대우대금리 : 0.4%\n1. 거래고객우대금리 : 최대0.1% (신규시) \n -최초예적금고객/재예치/장기거래 각 0.05% \n2. 거래실적우대금리 : 최대0.3% (만기시)\n -급여,연금이체등/수협카드결제/공과금이체등 각0.1%\n※단위:연%p','1','실명의 개인','- 1인 1계좌\n- 최저 100만원 이상',NULL,'20240422','99991231','202404221628'),('10120114300011','202404','0014807','수협은행','Sh해양플라스틱Zero!예금\n(만기일시지급식)','영업점,인터넷,스마트폰','* 만기후 1년 이내\n - 만기당시 일반정기예금(월이자지급식) 계약기간별 기본금리 1/2\n* 만기후 1년 초과\n - 만기당시 보통예금 기본금리','* 최대우대금리:0.35%\n1. 해양플라스틱감축서약 : 0.1% (신규시) \n2. 봉사활동 또는 상품홍보 : 0.15% (만기시) \n3. 입출금통장 최초신규 : 0.1% (만기시)\n4. 자동이체 출금실적 : 0.1% (만기시)\n - 수협신용카드 / 당행 펀드 또는 적금 / 수협체크카드\n※단위:연%p','1','실명의 개인','- 1인 다계좌 가능. \n  단,  합산금액 5억원 이내 \n- 최저 100만원 이상',500000000,'20240422','99991231','202404221628'),('10120114700011','202404','0014807','수협은행','헤이(Hey)정기예금','인터넷,스마트폰','* 만기후 1년 이내\n - 만기당시 일반정기예금(월이자지급식 기준) 계약기간별 기본금리 1/2\n* 만기후 1년 초과\n - 만기당시 보통예금 기본금리','없음','1','실명의 개인','-1인 다계좌 가능.\n 단, 합산금액 최대 10억원 이내\n-최저 10만원 이상',1000000000,'20240422','99991231','202404221628'),('10120116100011','202404','0014807','수협은행','Sh첫만남우대예금','인터넷,스마트폰','* 만기후 1년 이내\n - 만기당시 일반정기예금(월이자지급식 기준) 계약기간별 기본금리 1/2\n* 만기후 1년 초과\n - 만기당시 보통예금 기본금리','* 최대우대금리:1.05%\n1. 첫거래우대 : 1.0% (신규시) \n  - 최근 1년간 수협은행 예적금 활동계좌 미보유 고객포함\n2. 마케팅전체동의 : 0.05%(신규시) \n3. 스마트폰뱅킹의 상품알리기 : 0.80%(만기시)\n※단위:연%p','1','실명의 개인','-1인 1계좌\n-최저 100만원 이상',10000000,'20240422','99991231','202404221628'),('101272000006','202404','0010020','제주은행','제주Dream\n정기예금\n(개인/만기\n지급식)','영업점,인터넷,스마트폰','- 만기후 1개월 이내 : (일반)정기예금 기본이자율의 50%\n(단, 최저금리 0.1%)\n- 만기후 1개월 초과 3개월 이내 : (일반)정기예금 기본이자율의 25%\n(단, 최저금리 0.1%)\n- 만기후 3개월 초과 : 0.1%','최고 연 0.1%p(항목별 0.1%p)\n①급여이체\n②적립식예금 잔액 10만원 이상 보유\n③탑스, 주거래 고객\n④결제계좌(가맹점) 전월 입금액 10만원 이상 \n⑤비과세종합저축 대상 고객\n⑥다자녀(3인이상 자녀)가정\n⑦탐나는 J연금통장 가입고객\n⑧국민연금안심통장 가입고객\n⑨공무원연금안심통장 가입고객','1','제한없음','가입금액 : 1백만원 이상',NULL,'20240422',NULL,'202404221029'),('101272000057','202404','0010020','제주은행','J정기예금\n(만기지급식)','영업점,인터넷,스마트폰','- 만기후 1개월 이내 : (일반)정기예금 기본이자율의 50%\n(단, 최저금리 0.1%)\n- 만기후 1개월 초과 3개월 이내 : (일반)정기예금 기본이자율의 25%\n(단, 최저금리 0.1%)\n- 만기후 3개월 초과 : 0.1%','- 아래의 우대요건 충족시 최고 0.5%p 추가 우대 \n①비대면 채널 가입시 0.3%제공(신규시제공)  \n(단, 이벤트시 디지털 채널에 고시한 우대금리를 추가 적용할 수 있음)\n②신규일로부터 만기달 제외한 계약기간의 1/2이상 매월 Jbank로그인 시 0.2%제공(만기시제공)','1','실명의 \n개인 및 \n개인사업자','가입금액 : 30만원 이상',NULL,'20240502',NULL,'202405021013'),('101272000058','202404','0010020','제주은행','스마일드림 \n정기예금\n(개인/만기\n지급식)','영업점,인터넷,스마트폰','- 만기후 1개월 이내 : (일반)정기예금 기본이자율의 50%\n(단, 최저금리 0.1%)\n- 만기후 1개월 초과 3개월 이내 : (일반)정기예금 기본이자율의 25%\n(단, 최저금리 0.1%)\n- 만기후 3개월 초과 : 0.1%','-아래의 우대요건 충족시 최고0.3% 추가우대(신규시제공)\n①김만덕나눔적금 보유 또는 김만적 나눔적금 만기 해지고객 0.2%우대(가입시제공)\n②예금가입시 탐나는전 체크카드 보유고객 0.1%우대(가입시제공)\n(단, 이벤트시 영업점,디지털채널에 고시한 우대금리를 추가 적용할 수 있음)','1','실명의\n개인 및 \n개인사업자','가입금액 : 1백만원 이상',NULL,'20240502',NULL,'202405021013'),('10511008000996000','202404','0010016','대구은행','DGB주거래우대예금(첫만남고객형)','영업점,인터넷,스마트폰','만기 후 1개월 미만 경과 : 약정이자율 x 50%\n만기 후 3개월 미만 경과 : 약정이자율 x 25% \n만기 후 3개월 이상 경과 : 약정이자율 x 10%','최고우대금리 : 연0.65%p              \n - 목돈굴리기예금 최초 가입시 : 연0.20%p\n - 상품 가입 전 최근 1개월 이내 신용(체크)카드 신규 발급 : 연0.20%p\n - 상품 가입 전 최근 1개월 이내 인터넷.폰.스마트뱅킹 가입 : 연0.20%p\n * 해당 상품을 인터넷/스마트뱅킹을 통해 가입 : 연0.05%p','1','실명의 개인','계좌당 가입 최저한도 : 100만원',NULL,'20240425',NULL,'202404250905'),('10511008001004000','202404','0010016','대구은행','DGB행복파트너예금(일반형)','영업점,인터넷,스마트폰','만기 후 1개월 미만 경과 : 약정이자율 x 50%\n만기 후 3개월 미만 경과 : 약정이자율 x 25% \n만기 후 3개월 이상 경과 : 약정이자율 x 10%','최고우대금리 : 연0.45%p\n- 지난달 대구은행 통장으로 연금 입금 실적 보유 : 연0.10%p\n- 상품 가입 전 대구은행 신용(체크)카드 보유 : 연0.10%p\n- 지난 3개월 예금 평잔 30만원 이상 : 연0.10%p\n- DGB행복파트너적금 동시 가입 및 만기 보유 : 연0.10%p\n*해당상품을 인터넷/스마트뱅킹을 통해 가입 : 연0.05%p','3','만50세 이상 개인','계좌당 가입 최저한도 : 100만원',NULL,'20240422',NULL,'202404220954'),('10511008001166004','202404','0010016','대구은행','DGB함께예금','영업점,인터넷,스마트폰','만기 후 1개월 미만 경과 : 약정이자율 x 50%\n만기 후 3개월 미만 경과 : 약정이자율 x 25% \n만기 후 3개월 이상 경과 : 약정이자율 x 10%','최고우대금리 : 연0.45%p\n-전월 총 수신 평잔실적 또는 상품 가입 전 첫만남플러스 통장 보유시 \n-대구은행 주택청약상품보유 \n-신규일 \"DGB함께적금\" 동시 가입 및 만기 보유 \n-대구은행 오픈뱅킹서비스에 다른 은행 계좌 등록시 각 연0.10%p                       \n*해당상품을 인터넷/스마트뱅킹을 통해 가입 시 : 연0.05%p','1','실명의 개인 및 개인사업자','계좌당 가입 최저한도 : 100만원',NULL,'20240425',NULL,'202404250905'),('10511008001278000','202404','0010016','대구은행','IM스마트예금','인터넷,스마트폰','만기 후 1개월 미만 경과 : 약정이자율 x 50%\n만기 후 3개월 미만 경과 : 약정이자율 x 25% \n만기 후 3개월 이상 경과 : 약정이자율 x 10%','최고우대금리 : 연0.25%p\n- 가입일(재예치일)로부터 3개월이내 아래 1가지 이상 요건 충족시\n① DGB대구은행 주택청약종합저축 보유\n② DGB대구은행 신용(체크)카드 결제실적 보유(결제금액 출금기준)\n* 해당 상품을 인터넷/스마트뱅크를 통해 가입 : 연0.05%p','1','실명의 개인','계좌당 가입 최저한도 : 100만원',NULL,'20240425',NULL,'202404250905'),('200-0135-12','202404','0011625','신한은행','쏠편한 정기예금','인터넷,스마트폰','-1개월 이하: (일반) 정기예금 기본금리 1/2\n(단, 최저금리 0.10%)\n-1개월 초과~6개월 이하: (일반) 정기예금 기본금리의 1/4\n(단, 최저금리 0.10%)\n-6개월 초과:  0.10%','해당사항없음','1','만14세이상 개인고객','1. 가입한도 :\n 1만원 이상',NULL,'20240513',NULL,'202405130921'),('21001115','202404','0010024','경남은행','BNK더조은정기예금','인터넷,스마트폰','만기 후 1개월 이내: 일반정기예금 기본이율 Ⅹ50%\n만기 후 1개월 초과: 일반정기예금 기본이율 Ⅹ20%','①가입금액 20백만원 이상인 경우 0.20%\n②이 예금 신규시 금리우대쿠폰 등록할 경우 0.20%\n③ 경남은행 오픈뱅킹 서비스에 가입되어 있는 경우(만기시까지 해당서비스 유지하는 경우) 0.10%','1','거래대상자는 제한을 두지 아니한다. 다만, 국가 및 지방자치단체는 이 예금을 거래할 수 없다.','1. 이 예금의 계약기간은 3개월 이상 2년 이내 월단위로 한다.\n2. 가입금액은 1인당 최소 100만원 이상 5억원 이하이다.',500000000,'20240422',NULL,'202404221106'),('21001203','202404','0010024','경남은행','BNK주거래우대정기예금','인터넷,스마트폰','만기 후 1개월 이내: 일반정기예금 기본이율 Ⅹ50%\n만기 후 1개월 초과: 일반정기예금 기본이율 Ⅹ20%','①급여,연금,가맹점대금 중 한 종류 입금할 경우 0.10%\n②당행 신용/체크카드 결제실적 보유할 경우 0.10%\n③가입일 기준 6개월이내 당행 정기예금 미보유 신규 고객인 경우 0.10%','1','개인 및 개인사업자','1. 이 예금의 계약기간은 6개월, 1년, 2년으로 한다.\n2. 가입좌수 제한없으며 가입금액은 최소 1백만원 이상 최고 5억원 이하이다.',500000000,'20240422',NULL,'202404221106'),('21001265','202404','0010024','경남은행','BNK MY 원픽 정기예금','영업점,인터넷,스마트폰','만기 후 1개월 이내: 일반정기예금 기본이율 Ⅹ50%\n만기 후 1개월 초과: 일반정기예금 기본이율 Ⅹ20%','①창립 54주년 기념 고객감사 0.60%\n②다음중 하나의 조건을 충족 시 0.40%\n- 정기예금 15일이내 갱신 시\n- 계약기간 1/2이상 (계약기간 3개월일 경우 2개월 이상) 급여입금/ 공과금자동이체2건이상/가맹점대금입금 중 택1 \n- 계좌신규 시 BNK위더스자유적금 보유','1','거래대상자는 제한을 두지 아니한다. 다만, 국가 및 지방자치단체는 이 예금을 거래할 수 없다.','1. 이 예금의 계약기간은 3개월, 6개월,12개월으로 한다.\n2.가입좌수 제한없으며 가입금액은 최소 1백만원 이상이다.',200000000,'20240422',NULL,'202404221106'),('21001266','202404','0010024','경남은행','The 든든 예금','인터넷,스마트폰','만기 후 1개월 이내: 일반정기예금 기본이율 Ⅹ50%\n만기 후 1개월 초과: 일반정기예금 기본이율 Ⅹ20%','①가입고객 누구나 0.80%\n②신규고객 우대(최근 12개월 신규이력·해지이력 미보유) 0.20%\n③가입금액 1억원이상시 0.10%\n④이벤트금리(비대면금리) 0.20%\n※ ②, ③ 항목은 가입기간 12개월만 적용','1','거래대상자는 제한을 두지 아니한다. 다만, 국가 및 지방자치단체는 이 예금을 거래할 수 없다.','1. 이 예금의 계약기간은 12개월로 한다.\n2. 가입금액은 1인당 최소 100만원 이상 10억원 이하이다.',1000000000,'20240422',NULL,'202404221106'),('4','202404','0013909','하나은행','하나의정기예금','스마트폰','1개월이내 : 지급당시 해당기간 일반정기예금 월이자지급식 기본금리 1/2\n1개월초과 : 지급당시 해당기간 일반정기예금 월이자지급식 기본금리 1/4','해당사항없음','1','실명의 개인 또는 개인사업자','1. 가입금액: 1백만원이상\n2. 1인 최대가입한도 : 제한 없음',NULL,'20240422',NULL,'202404221103'),('TD11300027000','202404','0010019','광주은행','미즈월복리정기예금','영업점,인터넷,스마트폰,기타','*만기후 1개월 이내: 만기일 당시 최초 가입 기간별 일반정기예금 고시금리의 1/2 \n*만기후 1개월 초과: 0.01%','▶ 최고우대금리 0.2% \n ① 요구불평잔 : 0.2% -300만원이상 0.1%, 500만원이상 0.2%\n ② 신용(체크)카드결제실적 : 0.1% -전월결제금 300만원이상 0.05%, 500만원이상 0.1%','1','만18세이상 여성으로 실명의 개인 및 개인사업자','1. 가입기간 : 1년이상 3년제\n2. 가입금액 : 5백만원이상 최고 50백만원',50000000,'20240422',NULL,'202405170853'),('TD11300031000','202404','0010019','광주은행','스마트모아Dream정기예금','인터넷,스마트폰','*만기후 1개월 이내: 만기일 당시 최초 가입 기간별 일반정기예금 고시금리의 1/2 \n*만기후 1개월 초과: 0.01%','▶ 1천만원 이상 가입시 최대 0.2%우대','1','개인 및 개인사업자','1. 가입기간 : 1개월이상 3년제\n2. 최소가입금액 : 100만원이상',NULL,'20240422',NULL,'202405170852'),('TD11300035000','202404','0010019','광주은행','굿스타트예금','스마트폰','*만기후 1개월 이내: 만기일 당시 최초 가입 기간별 일반정기예금 고시금리의 1/2 \n*만기후 1개월 초과: 0.01%','▶ 최고우대금리 0.5% \n ① 첫예금거래 : 0.4% -최근1년동안 정기예금 계좌 신규 또는 해지이력이 없는경우\n ② 개인(신용)정보 수집이용동의 : 0.1% -만기일전일까지 유지시','1','개인 및 개인사업자','1. 가입기간 : 1년제\n2. 가입금액 : 1백만원이상 최고 1억원(1인1계좌)',100000000,'20240422',NULL,'202405170853'),('TD11300036000','202404','0010019','광주은행','The플러스예금','영업점,스마트폰','*만기후 1개월 이내: 만기일 당시 최초 가입 기간별 일반정기예금 고시금리의 1/2 \n*만기후 1개월 초과: 0.01%','▶ 해당사항없음','1','개인 및 법인(단,국가 지자체 및 금융기관 제외)','1. 가입기간 : 3개월,6개월,1년제\n2. 가입금액 : 10백만원이상 고객당 10억원한도',1000000000,'20240422',NULL,'202405170853'),('WR0001B','202404','0010001','우리은행','WON플러스예금','인터넷,스마트폰,전화(텔레뱅킹)','만기 후\n- 1개월이내 : 만기시점약정이율×50%\n- 1개월초과 6개월이내: 만기시점약정이율×30%\n- 6개월초과 : 만기시점약정이율×20%\n\n※ 만기시점 약정이율 : 일반정기예금 금리','해당사항 없음','1','실명의 개인','- 가입기간: 1~36개월\n- 최소가입금액: 1만원 이상\n- 만기일을 일,월 단위로 자유롭게 선택 가능\n- 만기해지 시 신규일 당시 영업점과 인터넷 홈페이지에 고시된 계약기간별 금리 적용',NULL,'20240424',NULL,'202404240919');
/*!40000 ALTER TABLE `savings_depositproduct` ENABLE KEYS */;

--
-- Table structure for table `savings_financialproduct`
--

DROP TABLE IF EXISTS `savings_financialproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_financialproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fin_co_no` varchar(10) NOT NULL,
  `fin_prdt_cd` varchar(50) NOT NULL,
  `kor_co_nm` varchar(100) NOT NULL,
  `fin_prdt_nm` varchar(100) NOT NULL,
  `join_way` longtext NOT NULL,
  `mtrt_int` longtext NOT NULL,
  `spcl_cnd` longtext NOT NULL,
  `join_member` longtext NOT NULL,
  `etc_note` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_financialproduct`
--

/*!40000 ALTER TABLE `savings_financialproduct` DISABLE KEYS */;
INSERT INTO `savings_financialproduct` VALUES (1,'0010001','WR0001F','우리은행','우리SUPER주거래적금','영업점,인터넷,스마트폰,전화(텔레뱅킹)','만기 후\n- 1개월이내 : 만기시점약정이율×50%\n- 1개월초과 6개월이내: 만기시점약정이율×30%\n- 6개월초과 : 만기시점약정이율×20%\n\n※ 만기시점 약정이율 : 일반정기적금 금리','1. 아래 각 항(가, 나)의 조건을 충족하는 경우 합산 최대 연 1.9%p 우대\n가. 우리은행을 처음 거래하시는 고객 : 연 1.0%p\n나. 거래실적 인정기간 동안 아래 거래실적을 계약기간별 필수기간(1년 : 6개월, 2년 : 12개월, 3년 : 18개월)이상 충족하는 경우 최대 연 0.9%p','실명의 개인','1. 가입기간 : 1년, 2년, 3년\n(가입기간별 금리 차등적용)\n2. 가입금액 : 월 50만원 이내'),(2,'0010001','WR0001L','우리은행','WON적금','스마트폰,전화(텔레뱅킹)','만기 후\n- 1개월이내 : 만기시점약정이율×50%\n- 1개월초과 6개월이내: 만기시점약정이율×30%\n- 6개월초과 : 만기시점약정이율×20%\n\n※ 만기시점 약정이율 : 일반정기적금 금리','1. 아래 각 항(가, 나)의 조건을 충족하는 경우 합산 최대 연 0.2%p 우대\n가. 이 적금을 우리꿈통장, WON통장에 연결하여 가입하는 경우 : 0.1%p\n나. 우리 오픈뱅킹 서비스에 타행계좌가 등록되어 있는 경우 : 연 0.1%p','실명의 개인','1. 가입기간 : 1년\n2. 가입금액 : 월 50만원 이내'),(3,'0010002','00266451','한국스탠다드차타드은행','퍼스트가계적금','영업점,인터넷,스마트폰','만기 후 1개월: 약정이율의 50%\n만기 후 1개월 초과 1년 이내: 약정이율의 30%\n만기 후 1년 초과: 약정이율의 10%','없음','개인(개인사업자 포함)','해당없음'),(4,'0010016','10521001000846001','대구은행','내손안에 적금','스마트폰','만기 후 1개월 미만 경과: 약정이자율 x 50%\n만기 후 3개월 미만 경과: 약정이자율 x 25%\n만기 후 3개월 이상 경과: 약정이자율 x 10%','* 최고우대금리 : 연0.55%p\n -대구은행 인터넷뱅킹,스마트뱅킹을 통하여 최초로 적립식예금 가입 시 : 연0.20%p\n - 상품 가입 전 최근 3개월 이내 대구은행 인터넷,스마트 뱅킹을 통한 이체거래 3회 이상 : 연0.10%p\n- 상품 가입 전 수수료우대 통장 보유 고객 : 연0.20%p\n* 상품을 스마트뱅킹을 통해 가입 시 : 연0.05%p','실명의 개인','1.1계좌당 가입한도 : 월 100만원(최저 10만원 이상)\n2.iM뱅크 전용상품'),(5,'0010016','10527001000925000','대구은행','영플러스적금','영업점,인터넷,스마트폰','만기 후 1개월 미만 경과: 약정이자율 x 50%\n만기 후 3개월 미만 경과: 약정이자율 x 25%\n만기 후 3개월 이상 경과: 약정이자율 x 10%','* 최고우대금리 : 연0.55%p\n- 상품 가입 전 영플러스통장 보유 또는 재예치일 기준 영플러스통장 전월 평잔 10만원 이상 : 연0.10%p\n- 예금기간 중 입금횟수 10회 이상 : 연0.10%p\n- 입학 및 졸업 축하금리 : 연0.30%p\n*상품을 인터넷/스마트뱅크를 통해 가입시 우대 : 연0.05%p','만 29세 이하 개인','1계좌당 가입한도 : 월 50만원(최저 1만원 이상)'),(6,'0010016','10527001001272000','대구은행','내가만든 보너스적금','영업점,인터넷,스마트폰','만기 후 1개월 미만 경과: 약정이자율 x 50%\n만기 후 3개월 미만 경과: 약정이자율 x 25%\n만기 후 3개월 이상 경과: 약정이자율 x 10%','*최고우대금리 : 연0.80%p\n -비대면 채널로 신규 : 연0.20%p\n -상품 가입 전 마케팅활용[개인(신용)정보,수집,이용동의] 전체 동의 : 연0.20%p\n(계약기간 1년인 경우 만기일 기준)\n -대구은행 계좌로 자동이체 8회 이상 입금 : 연0.20%p\n - 원금 합계 100만원이상 : 연0.10%p 또는 원금합계 200만원이상 : 연0.20%p','실명의 개인','1계좌당 가입한도 : 월20만원\n(최저 1만원 이상)'),(7,'0010016','10527001001278000','대구은행','IM스마트적금','인터넷,스마트폰','만기 후 1개월 미만 경과: 약정이자율 x 50%\n만기 후 3개월 미만 경과: 약정이자율 x 25%\n만기 후 3개월 이상 경과: 약정이자율 x 10%','* 최고우대금리 : 연0.45%p\n- 가입일로부터 3개월 이내 1가지 이상 요건 충족시 : 연0.20%p\n① 대구은행 주택청약종합저축 보유\n② 대구은행 신용(체크)카드 결제실적 보유\n- 전체 계약월수 중 1/2이상 DGB대구은행 계좌에서 자동이체 납입 시 : 연0.20%p\n* 상품을 인터넷/스마트뱅크를 통해 가입시 우대 : 연0.05%p','실명의 개인','1.1계좌당 가입한도 : 월 100만원(최저 5만원 이상)\n2.비대면채널 전용상품'),(8,'0010017','01020400490001','부산은행','펫 적금','영업점,스마트폰','- 만기후 1년이내:가입기간별 일반정기적금 기본이율 x 50%\n- 만기후 1년초과:가입기간별 일반정기적금 기본이율 x 20%','*우대이율 6개월제 최대 0.55%, 12개월제 최대 0.90%','실명의 개인고객(1인 1계좌)','1. 가입한도: 월 1만원 이상 50만원 이하 원단위\n2. 자유적립식'),(9,'0010017','01020400490002','부산은행','펫 적금','영업점,스마트폰','- 만기후 1년이내:가입기간별 일반정기적금 기본이율 x 50%\n- 만기후 1년초과:가입기간별 일반정기적금 기본이율 x 20%','*우대이율 6개월제 최대 0.55%, 12개월제 최대 0.90%','실명의 개인고객(1인 1계좌)','1. 가입한도: 월 1만원 이상 50만원 이하 원단위\n2. 정기적립식'),(10,'0010017','01020400510001','부산은행','저탄소 실천\n적금','영업점,인터넷,스마트폰','- 만기후 1년이내:가입기간별 일반정기적금 기본이율 x 50%\n- 만기후 1년초과:가입기간별 일반정기적금 기본이율 x 20%','조건 달성여부에 따라 우대금리 적용\n*개인형 우대이율: 최대0.4%\n*기업형(개인사업자 및 법인)우대이율: 최대0.4%','제한없음','1. 가입한도: 월 1만원 이상 1천만원 이하 원단위 (월 1천만원 이하 불입 가능)\n2. 자유적립식'),(11,'0010017','01020400530001','부산은행','내맘대로 \n적금','영업점,인터넷,스마트폰','- 만기후 1년이내:가입기간별 일반정기적금 기본이율 x 50%\n- 만기후 1년초과:가입기간별 일반정기적금 기본이율 x 20%','*우대이율 최대 0.2%\n- 신규시 우대이율 0.05% 및 해지시 우대이율 최대 0.15%','제한없음','1. 가입금액 :\n   1천원 이상\n2. 가입기간 : \n6개월 이상 60개월 이하(일단위)'),(12,'0010019','TD11330029000','광주은행','해피라이프_여행스케치적금V','영업점,스마트폰','*만기후 1개월 이내: 만기일 당시 최초 가입 기간별 고시금리의 1/2 \n*만기후 1개월 초과: 0.1%','▶ 최고우대금리 1.20%p  \n①해피라이프_여행스케치외화적금V 동일자가입 0.5%p \n②해지원금 기준 500만원이상 : 최고0.2%p\n③신용(체크)카드사용실적300만원이상:최고 0.3%p\n④개인(신용)정보 동의: 0.2%p','제한없음(단,국가및지방자치단체제외)','1. 가입기간 : 6개월이상 3년제\n2. 가입금액 : 월5만원 이상 5백만원 이하 (1인1계좌)'),(13,'0010019','TD11330030000','광주은행','여행스케치_남도투어적금','영업점,스마트폰','만기후 1개월 이내: 만기일 당시 최초 가입 기간별 고시금리의 1/2 \n만기후 1개월 초과: 0.1%','▶ 최고우대금리 1.9%p \n①예금가입일~만기일전일까지 당행이선정한 전라남도 관광지 방문 인증시 : 최고 1.5%p\n②신용(체크)카드사용실적300만원이상:최고 0.3%p\n③개인(신용)정보 동의: 0.1%p','만14세이상 개인 및 개인사업자','1. 가입기간 :12개월제,18개월제\n2. 가입금액 : 월 5만원 이상 1백만원 이하 (1인1계좌)\n※ 18개월 정액식 기본금리 3.3%, 최고금리 5.2%'),(14,'0010019','TD11330031000','광주은행','VIP플러스적금','영업점,인터넷,스마트폰','*만기후 1개월 이내: 만기일 당시 최초 가입 기간별 고시금리의 1/2 \n*만기후 1개월 초과: 0.1%','▶ 최고우대금리 0.50%p  \n①이 예금가입시 VIP고객이거나 가입일 이후부터 만기일전일까지 VIP고객에 선정된 경험이 있는 경우 : 0.3%p \n②이 예금 가입일에 정기예금 500만원이상(만기 1년이상) 가입하고 만기일 전일까지 유지한 경우 : 0.2%p','실명의 개인','1. 가입기간 : 1년제\n2. 가입금액 : 월10만원 이상 5백만원 이하 (1인1계좌)'),(15,'0010019','TD11330032000','광주은행','텔레파시적금','스마트폰','만기후 1개월 이내: 만기일 당시 최초 가입 기간별 고시금리의 1/2 \n만기후 1개월 초과: 0.1%','▶ 최고우대금리 0.80%p  \n ①전전월말 기준 예적금 등 계좌 및 거래가 없는경우: 0.8%p \n ②당행 적금계좌 만기 해지일로부터 1개월 이내 이 예금으로 재가입한 고객: 0.5%p\n▶ 퀴즈이벤트금리 최고 2.00%p\n  - 최대 참여가능 횟수 20회 X 회당 우대금리 연 0.1%p','실명의 개인','1. 가입기간 : 1년제\n2. 가입금액 : 월 5만원 이상 50만원 이하 (1인1계좌)'),(16,'0010020','220002101','제주은행','jbank 저금통적금','인터넷,스마트폰','- 만기후 1개월 이내 : (일반)정기적금 기본이자율의 50%\n(단, 최저금리 0.1%)\n- 만기후 1개월 초과 3개월 이내 : (일반)정기적금 기본이자율의 25%\n(단, 최저금리 0.1%)\n- 만기후 3개월 초과 : 0.1%','* 거래조건에 따라 최고 2.1%p 우대금리 적용\n① 자투리 출금계좌 평잔 50만원 이상 유지 : 0.8%p\n② 첫거래고객 or JBANK저금통적금 1개월 내 재신규 : 0.5%p\n③ 신규가입 시점에서 적금 목표금액 최소 30만원 이상 설정하고, 적금 신규일로부터 3개월 내 잔액이 목표금액 이상인 경우 :0.5%p\n④ 추천인 우대금리 : 0.30%p','개인 및 개인사업자','월 납입한도 50만원 이하'),(17,'0010020','220002501','제주은행','MZ 플랜적금','영업점,인터넷,스마트폰','- 만기후 1개월 이내 : (일반)정기적금 기본이자율의 50%\n(단, 최저금리 0.1%)\n- 만기후 1개월 초과 3개월 이내 : (일반)정기적금 기본이자율의 25%\n(단, 최저금리 0.1%)\n- 만기후 3개월 초과 : 0.1%','①매월 1회이상 지속적 납입시:1년제: 0.50%\n② 목표 금액 달성:0.50%\n③ 신용카드,체크카드 합산 사용액 월10만원 이상 사용: 0.50%\n* 청년이니까응원합니다 이벤트 : 0.50%','개인 및 개인사업자','월 납입한도 30만원 이하'),(18,'0010020','220002701','제주은행','탐이나요적금','인터넷,스마트폰','- 만기후 1개월 이내 : (일반)정기적금 기본이자율의 50%\n(단, 최저금리 0.1%)\n- 만기후 1개월 초과 3개월 이내 : (일반)정기적금 기본이자율의 25%\n(단, 최저금리 0.1%)\n- 만기후 3개월 초과 : 0.1%','아래의 우대요건 충족시 최고 2.7%p 추가 우대(만기시 제공)\n(공통)매월 JBANK로그인 시 0.2%\n 한 가지라도 수행시 2.5% 제공\n①추천인 코드로 3명 이상 가입시 \n②탐나는전 체크카드 월30만원 이상 사용 유지 시 \n③탐나는전 선불카드 충전계좌를 당행 입출금계좌로 등록 후 평잔 50만원 이상 유지 시','개인 및 개인사업자','월 납입한도 100만원 이하'),(19,'0010022','10-01-30-031-0018-0000','전북은행','JB 다이렉트적금(자유적립식)','인터넷,스마트폰','√만기후 1개월이내 경과분 : 만기일 현재 계약기간별 정기적금(자유적립식) 실행이율의 1/2\n√만기후 1개월초과 경과분 : 연 0.1%','추가우대금리 :\n당행 계좌간 자동이체를 통해 이 예금으로 자동이체 된 금액에 0.1% 금리 우대','실명의 개인 및 개인사업자(임의단체 제외)','1. 초회불입금 1만원이상, 1인당 월별 최고 1천만원이내\n2. 만기직전 1개월간 적립합계는 이전기간 적립금액을 초과할 수 없음\n3. 인터넷뱅킹/스마트폰뱅킹 가입상품'),(20,'0010022','10-01-30-031-0036','전북은행','JB 다이렉트적금(정액적립식)','인터넷,스마트폰','√만기후 1개월이내 경과분 : 만기일 현재 계약기간별 정기적금(정액적립식) 실행이율의 1/2\n√만기후 1개월초과 경과분 : 연 0.1%','추가우대금리 :\n당행 계좌간 자동이체를 통해 6회이상 입금한 경우 \n연 0.1% 금리우대','실명의 개인 및 개인사업자(임의단체 제외)','1. 초회불입금 1만원이상, 1인당 월별 최고 5백만원이내\n2. 인터넷뱅킹/스마트폰뱅킹 가입상품'),(21,'0010022','10-01-30-031-0038-0000','전북은행','JB 골든에이지 적금','영업점,스마트폰','√만기후 1개월이내 경과분 : 만기일 현재 계약기간별 정기적금(정액적립식) 실행이율의 1/2\n√만기후 1개월초과 경과분 : 연 0.1%','우대조건 충족시 최고 연1.2% 이내(단, 우대이율은 만기해지시 제공)\n1. 6회이상 급여또는 연금이체 실적 연 0.50%\n2. JB카드 사용금액 조건을 충족한 경우 (연0.30% ~ 연0.50%)\n3. 신규시 당행 입출금 통장으로 자동해지를 신청한 경우 연 0.20%\n\n※거래실적 인정기준 세부내용은 홈페이지 참조','실명의 개인 및 개인사업자(1인 1계좌)','초회 불입금 5만원이상, 1인당 월\n최고50만원 이내'),(22,'0010022','10-01-30-031-0048-0000','전북은행','JB 최강전북 축구사랑 적금','영업점,인터넷,스마트폰','√만기후 1개월이내 경과분 : 만기일 현재 계약기간별 정기적금(정액적립식) 실행이율의 1/2\n√만기후 1개월초과 경과분 : 연 0.1%','우대조건 충족시 최고 연1.8% 이내(단, 우대이율은 만기해지시 제공)\n1. 전북현대모터스 득점골수 우대 (최고 0.40%)\n2. 전북현대모터스 우승우대(최고 1.00%우대)\n3. 전북현대 도움왕/득점왕 연 0.20%\n4. 6회이상 당행 자동이체 납부를 통해 월부금 납입시 연 0.20%\n\n※거래실적 인정기준 세부내용은 홈페이지 참조','실명의 개임 및 개인사업자(1인 1계좌)','초회 불입금 5만원이상, 1인당 월 최고 100만원 이내'),(23,'0010022','10-01-30-031-0049-0000','전북은행','3초 플레이 적금','스마트폰','√만기후 1개월이내 경과분 : 만기일 현재 계약기간별 정기적금(정액적립식) 실행이율의 1/2\n√만기후 1개월초과 경과분 : 연 0.1%','1. 만기 전전월까지 게임 50회 참여시 0.9%\n2. 3초 플레이 적금 게임에 참여하여 획득한 점수 총 합에 따라 추가 우대금리 (연0.5% ~ 연3.0%)\n3. 가입기간 내 오픈뱅킹을 통해 계좌 추가 등록/유지시 우대 0.1%\n\n※거래실적 인정기준 세부내용은 홈페이지 참조','실명의 개인 및 개인사업자(1인 1계좌)','계약기간 6개월\n월별 적립한도 5만원 이상 최고 50만원 이하 (1인 1계좌)'),(24,'0010024','21000111','경남은행','행복Dream적금','영업점,인터넷,스마트폰','만기후 1개월 이내: 일반정기예금 기본이율의 50%\n만기후 1개월 초과: 일반정기예금 기본이율의 20%','①신규일로부터 6개월전까지 당행 적금 미보유 0.2%\n②월부금이 50만원 이상인 경우 0.20%\n③이 예금을 자동이체로 납입하는 경우 0.2%\n④신용(체크)카드 최초발급 후 10만원 이내 이용 0.2%\n⑤ 전자명함을 통한 신규 시 0.2%','개인 및 개인사업자','1. 계약기간은 1년 이상 3년 이하 월단위로 한다.\n2. 적립금액은 5만원 이상, 최고금액은 제한없음'),(25,'0010024','21001116','경남은행','BNK더조은자유적금','인터넷,스마트폰','만기후 1개월 이내: 일반정기예금 기본이율의 50%\n만기후 1개월 초과: 일반정기예금 기본이율의 20%','①오픈뱅킹서비스 가입 0.20%(만기까지 유지)\n②당행 입출금통장에서 자동이체시 입금건별 0.20%\n③이 상품 신규시 금리우대쿠폰을 등록할 경우 0.30%','거래대상자는 제한을 두지 아니한다. 다만, 국가 및 지방자치단체는 이 예금을 거래할 수 없다.','1. 계약기간은 6개월 이상 2년 이내 월단위로 한다.\n2. 초입금 1만원 이상 월별 500만원 이내에서 자유롭게 저축\n3. 최대 저축횟수는 999회 이내'),(26,'0010024','21001199','경남은행','BNK 위더스(With-us)자유적금','영업점,인터넷,스마트폰,기타','만기후 1개월 이내: 일반정기예금 기본이율의 50%\n만기후 1개월 초과: 일반정기예금 기본이율의 20%','①ESG 실천 우대금리 0.50%\n②신규고객 우대금리 0.50%\n- 당행 1년 이내예적금(청약포함)신규해지 이력미보유\n③공동가입우대금리 1.50%','개인 및 개인사업자','1.계약기간은 1개월 이상 36개월 이하 월단위로 한다.\n2..1인 1계좌로 가입가능\n2.매월 최소 1만원 이상, 최고 월 100만원 이하 (천원 단위)'),(27,'0010024','21001236','경남은행','주거래프리미엄적금','영업점,인터넷,스마트폰','만기후 1개월 이내: 일반정기예금 기본이율의 50%\n만기후 1개월 초과: 일반정기예금 기본이율의 20%','①주거래우대 0.50%\n②공과금 자동이체 0.40~0.60%\n③신규고객 0.20%\n④주택청약종합저축 보유 0.10%\n⑤ 전자명함을 통한 신규 시 0.2%','개인 및 개인사업자','1.계악기간은 1년제, 2년제, 3년제로 한다.\n2. 적립금액은 매월 1만원이상, 최고금액은 제한없음'),(28,'0010024','21001259','경남은행','오늘도세이브적금','인터넷,스마트폰,기타','만기후 1개월 이내: 일반정기예금 기본이율의 50%\n만기후 1개월 초과: 일반정기예금 기본이율의 20%','①마케팅동의 0.15%\n②목돈마련 축하이율 0.30~1.00%\n③친구 추천번호 0.30~0.60%','실명의 개인 및 개인사업자','1. 계약기간은 1개월 이상 6개월 이내 월단위로 한다.\n2. 초입금 일 1천원 이상 10만원 이하 자유롭게 저축\n3. 최대 저축횟수는 999회 이내'),(29,'0010024','21001268','경남은행','터치적금','스마트폰','만기후 1개월 이내: 일반정기예금 기본이율의 50%\n만기후 1개월 초과: 일반정기예금 기본이율의 20%','①첫거래고객(적금가입 전일기준 당행 활동계좌 미보유) 2.50%\n②기간내 적금 입금일마다 0.10%씩 우대(최대2.50%)\n③마케팅동의 및 모바일메세지 수신동의 만기유지 시 0.50%','실명의 개인 및 개인사업자','1. 계약기간은 1개월로 한다.\n2. 초입금 일 1천원 이상 3만원 이하 자유롭게 저축\n3. 최대 저축횟수는 999회 이내'),(30,'0010026','01211210113','중소기업은행','IBK D-day적금(자유적립식)','스마트폰','만기일 당시 정기적금 만기후금리 적용\n- 1개월 이내: 만기일 당시 약정금리x50%\n- 1월 초과 6개월 이내: 만기일 당시 약정금리x30%\n- 6개월 초과: 만기일 당시 약정금리x20%','최고 연 1.5%p\n1. 목표달성 축하금리 : 연 1.0%p\n  - 당행 입출금식 계좌에서 이 적금으로 자동이체를 통해 3회 이상 납입하고 만기일 전일까지 목표금액(신규 시 직접 설정) 이상 납입하는 경우\n2. 최초거래고객 우대금리 : 연 0.5%p','실명의 개인\n(개인사업자 제외)','1인당 3계좌 가입 가능하며, 계좌당 20만원 이내 납입 가능'),(31,'0010026','01211210121','중소기업은행','IBK탄소제로적금(자유적립식)','스마트폰','만기일 당시 정기적금 만기후금리 적용\n- 1개월 이내: 만기일 당시 약정금리x50%\n- 1월 초과 6개월 이내: 만기일 당시 약정금리x30%\n- 6개월 초과: 만기일 당시 약정금리x20%','최고 연 4.00%p\n1. 에너지 절감 우대금리 : 최대 연 0.20%p\n2. 최초거래고객 우대금리 : 연 0.10%p\n3. 지로 또는 공과금 자동이체 우대금리 : 연 1.00%p','실명의 개인\n(개인사업자 제외)','1인당 1계좌 가입 가능하며, 계좌당 최소 1만원 이상 1백만원까지 납입 가능'),(32,'0010026','01211210122','중소기업은행','IBK중기근로자우대적금\n(자유적립식)','영업점,스마트폰','만기일 당시 정기적금 만기후금리 적용\n- 1개월 이내: 만기일 당시 약정금리x50%\n- 1월 초과 6개월 이내: 만기일 당시 약정금리x30%\n- 6개월 초과: 만기일 당시 약정금리x20%','최고 연 2.20%p\n1. 가입시점 중소기업 근로자로 확인된 경우 : 재직기간에 따라 최고 연 1.2%p\n2. 당행 급여이체 실적(월50만원 이상) 6개월 이상\n   인 경우 : 연 1.0%p','중소기업에서 근무하는\n실명의 개인\n(개인사업자 제외)','1인당 1계좌 가입 가능하며, 계좌당 100만원까지 납입 가능'),(33,'0010030','03101','한국산업은행','KDB 기업정기적금','영업점,인터넷','* 만기후 1년 이내 : 만기일 현재 고시된 일반 정기적금 해당예금기간 기본이율의 1/2\n* 만기후 1년 초과 : 만기일 현재 고시된 보통예금 이율','해당없음','개인사업자, 조합(비영리법인 포함), 법인','해당없음'),(34,'0010030','03700','한국산업은행','KDB 자유적금','영업점,인터넷,스마트폰','* 만기후 1년 이내 : 만기일 현재 고시된 일반 정기적금 해당예금기간 기본이율의 1/2\n* 만기후 1년 초과 : 만기일 현재 고시된 보통예금 이율','해당없음','개인, 개인사업자, 임의단체','해당없음'),(35,'0010927','010200100051','국민은행','KB국민프리미엄적금(정액)','영업점,인터넷,스마트폰,전화(텔레뱅킹)','- 1개월 이내 : 기본이율 X 50%\n- 1개월 초과  ~ 3개월 이내 : 기본이율 X 30%\n- 3개월 초과 : 0.1%','① 단체가입/나라사랑/쿠폰 우대이율: \n    1년: 연 0.6%p, 2년: 연 0.7%p,\n    3년: 연 0.9%p, 5년: 연 1.0%p \n   (중복적용되지 않음, 계약기간별차등적용)\n② 교차거래 우대이율: 연 0.3%p','실명의 개인','1인 1계좌'),(36,'0010927','010200100084','국민은행','KB맑은하늘적금','영업점,인터넷,스마트폰','- 1개월 이내 : 기본이율 X 50%\n- 1개월 초과  ~ 3개월 이내 : 기본이율 X 30%\n- 3개월 초과 : 0.1%','맑은하늘을 위한 미션별 제공조건을 달성하는 경우 각 미션별 우대이율 제공\n -1년제 최고 연 0.8%p, 2년제 최고 연 0.9%p, 3년제 최고 연 1.0%p\n① 종이통장 줄이기 미션: 연 0.1%p\n② 종이서식 줄이기 미션: 연 0.2%p\n③ 대중교통 미션: 1년제 연 0.4%p, 2년제 연 0.5%p, 3년제 연 0.6%p\n④ 퀴즈미션: 연 0.1%p','실명의 개인','공동명의 불가\n(1인 최대 3계좌)'),(37,'0010927','010200100092','국민은행','KB반려행복적금','스마트폰','- 1개월 이내 : 기본이율 X 50%\n- 1개월 초과  ~ 3개월 이내 : 기본이율 X 30%\n- 3개월 초과 : 0.1%','항목별 적용 조건 충족시, 최고 연 1.5%p\n① 반려동물 등록: 연 0.2%p\n② 미지(유기)입양: 연 0.2%p\n③ 반려동물애정활동: 연 0.2%p\n④ 반려동물요금제: 연 0.2%p\n⑤ KB거래감사: 연 0.2%p\n⑥ KB첫거래: 연 0.5%p','실명의 개인','공동명의 불가\n(1인 최대 3계좌)'),(38,'0010927','010200100104','국민은행','KB 특★한 적금','스마트폰','- 1개월 이내 : 기본이율 X 50%\n- 1개월 초과  ~ 3개월 이내 : 기본이율 X 30%\n- 3개월 초과 : 0.1%','항목별 적용 조건 충족시, 최고 연 4.0%p\n① 목표달성 축하 우대이율: 최고 연 1.0%p\n    50만원 이하: 연 0.5%p, 50만원 초과: 연 1.0%p \n② 별 모으기 우대이율 : 최고 연 1.0%p\n    10개: 연 0.5%p, 20개: 연 1.0%p\n③ 함께해요 우대이율: 최고 연 2.0%p','실명의 개인','개인사업자, 임의단체 및\n공동명의 가입 불가\n(1인 최대 3계좌)'),(39,'0010927','010200100109','국민은행','KB차차차 적금','스마트폰','- 1개월 이내 : 기본이율 X 50%\n- 1개월 초과  ~ 3개월 이내 : 기본이율 X 30%\n- 3개월 초과 : 0.1%','항목별 적용 조건 충족시, 최고 연 5.5%p\n① 혜택수신 우대이율: 연 1.0%p\n② KB패밀리 우대이율: 연 1.0%p\n③ KB국민인증 우대이율: 연0.5%p \n④ 내차든든 우대이율: 연 3.0%P','만19세이상 실명의 개인','- 개인사업자, 임의단체 및 공동명의 가입 불가\n(1인 1계좌) \n- KB스타뱅킹 전용상품'),(40,'0011625','230-0118-14','신한은행','한 달부터 적금\n(매주입금)','영업점,스마트폰','-1개월 이하:(일반) 정기적금 기본금리 1/2\n(단, 최저금리 0.10%)\n-1개월 초과~6개월 이하: (일반) 정기적금 기본금리의 1/4\n(단, 최저금리 0.10%)\n-6개월 초과 0.10%','※가산금리 최고 연 2.0%\n- 주 납입: 총 납입 회차의 90%이상 납입 달성','제한없음','1.가입한도:\n- 매주입금: 주 10만원이내'),(41,'0011625','230-0119-85','신한은행','신한 알.쏠 적금','영업점,스마트폰','-1개월 이하:(일반) 정기적금 기본금리 1/2\n(단, 최저금리 0.10%)\n-1개월 초과~6개월 이하: (일반) 정기적금 기본금리의 1/4\n(단, 최저금리 0.10%)\n-6개월 초과 0.10%','※가산금리 최고 연 1.30%\n- 소득이체 : 연 0.6%\n- 카드이용 : 연 0.3%\n- 오픈뱅킹 : 연 0.6%\n- 청약보유 : 연 0.3%\n- 마케팅동의 : 연 0.1%\n※ 우대금리 항목별 자세한 적용 조건은 상품설명서 참조','제한없음','1. 가입한도: \n월300만원 이하\n2. 1인 다계좌'),(42,'0013175','10-047-1360-0002','농협은행주식회사','NH올원e 미니적금','스마트폰','만기후 1년 이내 : 만기시점 계약기간별 자유로우대적금 기본금리의 1/2\n만기후 1년 초과 : 보통예금 금리','1. 자동이체 입금횟수 우대금리 : 최고 0.5%p\n - 5회이상 : 0.2%p, 10회이상 : 0.3%p, 15회이상 0.5%p\n2. 목표금액 달성 축하금리  : 0.5%p\n3. MZ세대(만 19~34세)) 우대금리 : 0.5%p\n4. 직전 1년간 당행 예적금(청약포함) 미보유 고객 : 0.2%p','개인','가입기간 1개월 이상 6개월 이하(일 단위)\n\n초입금 및 매일 1천원이상  5만원이내(천원 단위)'),(43,'0013175','10-047-1365-0001','농협은행주식회사','NH1934월복리적금','영업점,인터넷,스마트폰','만기후 1년 이내 : 만기시점 계약기간별 기본금리의 1/2\n만기후 1년 초과 : 보통예금 금리','1. 급여실적 : 1.0%p (①/② 중복 적용 불가)\n ① 급여이체 실적 : 1.0%p\n ② 개인사업자 계좌 실적 :1.0%p\n2. 비대면 채널 이체 실적 : 0.3%p\n3. 마케팅 동의 : 0.2%p\n4. 농업계고 및 청년농부사관학교 졸업자 : 2.0%p','만19세~만34세 개인 및 개인사업자','초입금 및 매회 1만원 이상, 월 50만원 이내 자유적립\n\n급여이체 실적과 개인사업자 계좌 실적 우대금리는 중복 적용 불가\n\n * 급여입금실적 인정기준\n  - 가입기간 12개월 이하 : 3개월 이상 급여이체\n  - 가입기간 24개월 이하 : 12개월 이상 급여이체'),(44,'0013175','10-047-1381-0001','농협은행주식회사','NH내가Green초록세상적금','영업점,인터넷,스마트폰','만기후 1년 이내 : 만기시점 계약기간별 기본금리의 1/2\n만기후 1년 초과 : 보통예금 금리','※ 우대금리 최대한도 : 1.0%p(연%, 세전)\n1. 온실가스 줄이기 실천서약서 동의 : 0.1%p\n2. 통장미발급 : 0.3%p\n3. 손하나로인증 서비스 등록 : 0.2%p\n4. 대중교통이용 : 0.2%p\n5. NH내가Green초록세상예금 동시 보유 : 0.2%p','개인','초입금5만원 이상 및 매회 1만원 이상, 매월50만원이내\n(단, 만기일 전 3개월 이내에는 이전 적립금 합계액을 초과하여 입금불가)\n\n※자세한 사항은 상품설명서 참조'),(45,'0013175','10-047-1387-0001','농협은행주식회사','NH고향사랑기부적금','영업점,인터넷,스마트폰','만기후 1년 이내 : 만기시점 계약기간별 기본금리의 1/2\n만기후 1년 초과 : 보통예금 금리','1. 고향사랑기부금 납부고객 우대 : 0.5%p\n\n2-1. 만 65세 이상 고령자 우대 : 0.1%p\n2-2. 만 19~34세 MZ고객 우대 : 0.3%p\n\n3. NH채움카드 또는 [zgm.고향으로 카드] 이용실적 우대 : 0.1%p\n\n4. 고향사랑특별금리 : 0.1%p(금리시장상황에 따라 변동 가능)\n - 고향사랑특별금리는 상품 가입고객 모두에게 적용','개인','1.초입금1만원 이상 및 매회 1천원 이상, 매월50만원이내\n\n2. 고향사랑기부금 우대금리는 농협은행/농축협 영업점 또는 고향사랑e음 홈페이지를 통한 고향사랑기부금 납부실적이 확인되는 경우 제공\n\n3. 연간 판매액의 0.1% 공익기금 적립\n\n※자세한 사항은 상품설명서 참조'),(46,'0013175','10-059-1264-0001','농협은행주식회사','NH직장인월복리적금','영업점,인터넷,스마트폰','만기후 3개월 이내 : 만기시점 국고채 1년물 금리\n만기후 1년 이내 : 만기시점 채움적금 계약기간별 고시금리의 50%\n만기후 1년 초과 : 만기시점 보통예금 금리','1. 급여입금실적 보유 고객 중\n - 가입기간 중 3개월 이상 급여이체시 : 0.3%p\n - 주택청약종합저축 또는 펀드가입 : 0.2%p\n - NH채움카드 결제실적 1백만원 이상 : 0.2%p\n2. 인터넷(스마트)뱅킹 또는 올원뱅크로 가입 : 0.1%p','만18세이상 개인','초입금 및 매회 입금 1만원 이상 원 단위,  1인당 분기별 3백만원 이내 적립 가능\n(단,계약기간 3/4 경과 후 적립할 수 있는 금액은 이전 적립누계액의 1/2이내)'),(47,'0013909','52','하나은행','주거래하나 월복리적금','영업점,인터넷,스마트폰','1개월 이내 : 지급당시 해당기간별 일반정기적금 기본금리 1/2\n1개월 초과 : 지급당시 해당기간별 일반정기적금 기본금리 1/4','최고 연1.0%\n- 주거래하나우대(연 0.5%) : 적금만기 전전월말기준 본인명의 당행입출금통장을 통해 계약기간 1/2이상 이체된 주거래실적 1종  - 주거래플러스우대(연 0.9%) : 주거래 하나우대와 동일요건의 거래실적 2종이상 경우 \n- 온라인.재예치우대 연 최대 0.1%','실명의 개인\n또는 개인사업자','1. 1인 1계좌만 가능\n(급여하나월복리적금,연금하나 월복리적금과 중복가입 불가)\n2. 가입금액 \n - 최저1만원~300만원이하\n3. 적립한도\n 분기당 1만원이상 300만원\n (자유적립식)'),(48,'0013909','53','하나은행','내맘적금','영업점,인터넷,스마트폰,전화(텔레뱅킹)','1개월 이내 : 지급당시 해당기간별 일반정기적금 기본금리 1/2\n1개월 초과 : 지급당시 해당기간별 일반정기적금 기본금리 1/4','하나은행 통장에서 계약기간의 1/2이상 월부금 자동이체실적 충족 시 연 0.50%','실명의 개인\n또는 개인사업자(1인 다계좌 가능)','1. 1인 다계좌 가능\n2. 가입금액\n   - 1천원 이상~1,000만원 이하(원단위)\n3. 적립한도\n    - 자유적립식 : 매월 1원 이상~1,000만원 이하(원단위)\n    - 정액적립식 : 매월 1천원 이상~1,000만원 이하(원단위)'),(49,'0014674','01012000200000000003','주식회사 케이뱅크','코드K 자유적금','스마트폰','만기 후 \n- 1개월 이내: 만기시점 기본금리 X 50% \n- 1개월 초과 ~ 6개월 이내: 만기시점 기본금리 X 30%\n- 6개월 초과: 연 0.20%','금리우대 코드를 입력하는 경우 우대금리 적용','만 17세 이상 실명의 개인 및 개인사업자','가입금액: 1만원 이상 30만원 이하\n가입기간: 6개월, 1년, 2년, 3년 \n(1인 최대 3계좌)'),(50,'0014674','01012000210000000000','주식회사 케이뱅크','주거래우대 자유적금','스마트폰','만기 후 \n- 1개월 이내: 만기시점 기본금리 X 50% \n- 1개월 초과 ~ 6개월 이내: 만기시점 기본금리 X 30%\n- 6개월 초과: 연 0.20%','급여이체 또는 통신비 자동이체, 체크카드 고객에게 우대금리 제공 (최고 연 0.6%)','만 17세 이상 실명의 개인 및 개인사업자','가입금액: 1천원 이상 300만원 이하\n가입기간: 6개월 ~ 36개월\n(1인 최대 3계좌)'),(51,'0014807','10140110400011','수협은행','Sh평생주거래우대적금','영업점','* 만기후 1년 이내\n - 만기당시 정기적금 \n계약기간별 기본금리 1/2\n* 만기후 1년 초과\n - 만기당시 보통예금 기본금리','*최대우대금리:1.2%\n신규시적용금리\n-자동이체출금3건이상:0.2%\n-최초예적금고객/재예치/장기거래각0.05%(최대0.1%)\n만기시적용금리:최대0.9%\n-급여,연금이체/수협카드결제각0.3%\n-공과금이체최대0.3%\n※단위:연%p','실명의 개인','- 1인 1계좌 \n- 월 가입한도 : 100만원'),(52,'0014807','10140114300011','수협은행','Sh해양플라스틱Zero!적금\n(정액적립식)','영업점,인터넷,스마트폰','* 만기후 1년 이내\n - 만기당시 정기적금 \n계약기간별 기본금리 1/2\n* 만기후 1년 초과\n - 만기당시 보통예금 기본금리','* 최대우대금리:0.5%\n1. 해양플라스틱감축서약 : 0.1% (신규시) \n2. 봉사활동 또는 상품홍보 : 0.2% (만기시) \n3. 입출금통장 최초신규 : 0.2% (만기시)\n4. 자동이체 출금실적 : 0.2% (만기시)\n - 수협신용카드 / 당행 펀드 / 수협체크카드\n※단위:연%p','실명의 개인','- 1인 1계좌 \n- 월 가입한도 : 100만원'),(53,'0014807','10140114700031','수협은행','헤이(Hey)적금(정액적립식)','스마트폰','* 만기후 1년 이내\n - 만기당시 정기적금 \n계약기간별 기본금리 1/2\n* 만기후 1년 초과\n - 만기당시 보통예금 기본금리','* 최대우대금리:0.9%\n1. 마케팅동의 : 0.1% (신규시) \n2. 자동이체 납입 : 0.8% (만기시) \n\n※단위:연%p','실명의 개인','*1인 1계좌\n*월 가입한도 : 100만원\n*스마트폰 전용'),(54,'0014807','10141109800021','수협은행','Sh월복리자유적금','영업점,인터넷,스마트폰','* 만기후 1년 이내\n - 만기당시 상호부금\n계약기간별 기본금리 1/2\n* 만기후 1년 초과\n - 만기당시 보통예금 기본금리','*최대우대금리:0.7%\n-첫거래고객:0.3%\n-카드거래:최대0.3%\n-복수거래:0.1%\n-요구불거래:최대0.2%\n-인터넷뱅킹고객:0.1%\n-자동이체실적:0.1%\n※단위:연%p','실명의 개인 및 개인사업자','- 1인 1계좌\n- 월 가입한도 : 100만원'),(55,'0014807','10141114300011','수협은행','Sh해양플라스틱Zero!적금\n(자유적립식)','영업점,인터넷,스마트폰','* 만기후 1년 이내\n - 만기당시 상호부금 \n계약기간별 기본금리 1/2\n* 만기후 1년 초과\n - 만기당시 보통예금 기본금리','* 최대우대금리:0.5%\n1. 해양플라스틱감축서약 : 0.1% (신규시) \n2. 봉사활동 또는 상품홍보 : 0.2% (만기시) \n3. 입출금통장 최초신규 : 0.2% (만기시)\n4. 자동이체 출금실적 : 0.2% (만기시)\n - 수협신용카드 / 당행 펀드 / 수협체크카드\n※단위:연%p','실명의 개인','- 1인 1계좌 \n- 월 가입한도 : 20만원'),(56,'0014807','10141114700031','수협은행','헤이(Hey)적금(자유적립식)','스마트폰','* 만기후 1년 이내\n - 만기당시 상호부금\n계약기간별 기본금리 1/2\n* 만기후 1년 초과\n - 만기당시 보통예금 기본금리','* 최대우대금리:0.9%\n1. 마케팅동의 : 0.1% (신규시) \n2. 자동이체 납입 : 0.8% (만기시) \n\n※단위:연%p','실명의 개인','*1인 1계좌\n*월 가입한도 : 100만원\n*스마트폰 전용'),(57,'0015130','10-01-30-355-0002','주식회사 카카오뱅크','카카오뱅크 자유적금','스마트폰','- 만기 후 1개월 이내 : 가입(또는 자동연장)시점 기본금리x50%\n- 만기 후 1개월초과 3개월 이내 : 가입(또는 자동연장)시점 기본금리x30%\n- 만기 후 3개월 초과 : 0.20%','자동이체시 우대금리 제공 : 연 0.20%p\n - 제공조건 : 전체 계약월수의 1/2이상을 자동이체로 납입하고 만기 해지하는 경우\n - 유의사항 : 만기 자동연장된 원리금은 우대금리를 제공하지 않음','만 17세 이상의 실명의 개인','1. 가입방법 : 스마트폰\n2. 가입금액 : 1천원 이상(원단위)\n3. 가입기간 : 6개월 이상 ~ 36개월 이하(월, 일단위 지정 가능)\n4. 월 적립한도 : 1천원 이상 월 300만원 이하 원단위(단, 자동연장된 원리금은 월 적립한도에 포함되지 않음)'),(58,'0015130','10-01-30-355-0005','주식회사 카카오뱅크','카카오뱅크 26주적금','스마트폰','- 만기 후 1개월 이내 : 가입시점 기본금리x50%\n- 만기 후 1개월초과 3개월 이내 : 가입시점 기본금리x30%\n- 만기 후 3개월 초과 : 0.20%','자동이체 연속 성공 우대금리 제공 : 최고 연 3.00%p\n- 제공조건\n① 7주차까지 자동이체 납입을 연속 성공하고 만기해지 하는 경우 연 1.00%p 제공\n② 26주차까지 자동이체 납입을 연속 성공하고 만기해지 하는 경우 연 2.00%p 추가 제공\n- 유의사항 : 자동이체 실패한 주차를 빈자리채우기 하여도 성공으로 인정되지 않음','만 17세 이상의 실명의 개인','1. 가입방법 : 스마트폰\n2. 가입금액 : 1천원, 2천원, 3천원, 5천원, 1만원\n3. 가입기간 : 6개월\n4. 26주적금서비스(자동이체)를 통해서 납입이 가능하며, 그 외의 입금은 모두 제한됨\n(단, 26주적금 서비스를 통한 납입 실패 시 빈자리 채우기로 납입 가능)'),(59,'0015130','10-01-30-355-0006','주식회사 카카오뱅크','카카오뱅크 한달적금','스마트폰','- 만기 후 1개월 이내 : 가입시점 기본금리x50%\n- 만기 후 1개월초과 3개월 이내 : 가입시점 기본금리x30%\n- 만기 후 3개월 초과 : 0.20%','매일/보너스 우대금리 제공 : 최고 연 5.50%p\n- 제공조건\n① 매일 우대금리 : 매 입금 시 마다 연 0.10%p 제공(최대 연 3.10%p)\n② 보너스 우대금리 : 누적하여 5/10/15/20/25/31회 입금 시 해당 우대금리 제공(최대 연 2.40%p)\n- 유의사항 : 만기 해지하는 경우에만 제공','만 17세 이상의 실명의 개인','1. 가입방법 : 스마트폰\n2. 납입금액 : 1회 100원 이상 3만원 이하(원단위)\n3. 가입기간 : 31일\n4. 직접 납입을 통해서 1일 1회만 입금 가능하며, 그 외의 입금은 모두 제한됨'),(60,'0017801','1001303001001','토스뱅크 주식회사','토스뱅크 키워봐요 적금','스마트폰','· 만기 후 1개월 이내 : 만기시점 기본금리 X 50% \n· 만기 후 1개월 초과 3개월 이내 : 만기시점 기본금리 X 20% \n· 만기 후 3개월 초과 : 연 0.10%','· 적금 가입 시 설정되는 주 단위 자동이체를 통하여 25회 이상 적립한 경우 : 연 2.00% 제공','· 토스뱅크 통장 또는 토스뱅크 서브 통장을 보유한 실명의 개인','· 1인 1계좌 (단, 이벤트 등으로 토스뱅크가 복수의 계좌개설을 허용하는 경우 추가 개설 가능)\n· 가입금액 : 0원\n· 우대금리는 우대조건을 달성하고 만기 해지하는 경우에만 제공됨'),(61,'0017801','1001303001003','토스뱅크 주식회사','토스뱅크 굴비 적금','스마트폰','· 만기 후 1개월 이내 : 만기시점 기본금리 X 50% \n· 만기 후 1개월 초과 3개월 이내 : 만기시점 기본금리 X 20% \n· 만기 후 3개월 초과 : 연 0.10%','· 만기 해지 시 : 연 2.50% 제공','· 토스뱅크 통장 또는 토스뱅크 서브 통장을 보유한 실명의 개인','· 1인 1계좌 (단, 이벤트 등으로 토스뱅크가 복수의 계좌개설을 허용하는 경우 추가 개설 가능)\n· 가입금액 : 0원\n· 우대금리는 만기 해지하는 경우에만 제공됨'),(62,'0017801','1001303001004','토스뱅크 주식회사','토스뱅크 자유 적금','스마트폰','· 만기 후 1개월 이내 : 만기시점 기본금리 X 50% \n· 만기 후 1개월 초과 3개월 이내 : 만기시점 기본금리 X 20% \n· 만기 후 3개월 초과 : 연 0.10%','· 적금 가입 시 설정되는 월 단위 자동이체를 모두 성공하는 경우 : 연 0.50% 제공','· 토스뱅크 통장 또는 토스뱅크 서브 통장을 보유한 실명의 개인','· 1인 1계좌 (단, 이벤트 등으로 토스뱅크가 복수의 계좌개설을 허용하는 경우 추가 개설 가능)\n· 가입금액 : 0원 이상 300만원 이하\n· 우대금리는 만기 해지하는 경우에만 제공됨'),(63,'0017801','1001303001005','토스뱅크 주식회사','토스뱅크 아이 적금','스마트폰','· 만기 후 1개월 이내 : 만기시점 기본금리 X 50% \n· 만기 후 1개월 초과 3개월 이내 : 만기시점 기본금리 X 20% \n· 만기 후 3개월 초과 : 연 0.10%','· 적금 가입 시 설정되는 월 단위 자동이체를 모두 성공하는 경우 : 연 2.50% 제공','· 토스뱅크 아이 통장을 보유한 15세 이하 실명의 개인','· 1인 1계좌 \n· 가입금액 : 0원\n· 우대금리는 만기 해지하는 경우에만 제공됨');
/*!40000 ALTER TABLE `savings_financialproduct` ENABLE KEYS */;

--
-- Table structure for table `savings_optionlist`
--

DROP TABLE IF EXISTS `savings_optionlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_optionlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fin_prdt_cd` varchar(50) NOT NULL,
  `intr_rate_type` varchar(1) NOT NULL,
  `intr_rate_type_nm` varchar(20) NOT NULL,
  `rsrv_type` varchar(1) NOT NULL,
  `rsrv_type_nm` varchar(20) NOT NULL,
  `save_trm` varchar(3) NOT NULL,
  `intr_rate` double NOT NULL,
  `intr_rate2` double NOT NULL,
  `financial_product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `savings_optionlist_financial_product_id_fbdfe0a2_fk_savings_f` (`financial_product_id`),
  CONSTRAINT `savings_optionlist_financial_product_id_fbdfe0a2_fk_savings_f` FOREIGN KEY (`financial_product_id`) REFERENCES `savings_financialproduct` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_optionlist`
--

/*!40000 ALTER TABLE `savings_optionlist` DISABLE KEYS */;
INSERT INTO `savings_optionlist` VALUES (1,'WR0001F','S','단리','S','정액적립식','12',2.75,4.65,1),(2,'WR0001F','S','단리','S','정액적립식','24',2.8,4.7,1),(3,'WR0001F','S','단리','S','정액적립식','36',2.85,4.75,1),(4,'WR0001F','S','단리','F','자유적립식','12',2.55,4.45,1),(5,'WR0001F','S','단리','F','자유적립식','24',2.6,4.5,1),(6,'WR0001F','S','단리','F','자유적립식','36',2.65,4.55,1),(7,'WR0001L','S','단리','S','정액적립식','12',4,4.2,2),(8,'WR0001L','S','단리','F','자유적립식','12',4,4.2,2),(9,'00266451','S','단리','F','자유적립식','36',3.45,3.45,3),(10,'00266451','S','단리','F','자유적립식','24',3.4,3.4,3),(11,'00266451','S','단리','F','자유적립식','12',3.35,3.35,3),(12,'00266451','S','단리','F','자유적립식','6',3.1,3.1,3),(13,'00266451','S','단리','S','정액적립식','36',3.6,3.6,3),(14,'00266451','S','단리','S','정액적립식','24',3.55,3.55,3),(15,'00266451','S','단리','S','정액적립식','12',3.5,3.5,3),(16,'00266451','S','단리','S','정액적립식','6',3.2,3.2,3),(17,'10521001000846001','S','단리','S','정액적립식','12',3.46,4.01,4),(18,'10521001000846001','S','단리','S','정액적립식','24',3.48,4.03,4),(19,'10521001000846001','S','단리','S','정액적립식','36',3.5,4.05,4),(20,'10527001000925000','S','단리','F','자유적립식','12',3.66,4.21,5),(21,'10527001001272000','S','단리','F','자유적립식','6',3.05,3.85,6),(22,'10527001001272000','S','단리','F','자유적립식','12',3.8,4.6,6),(23,'10527001001278000','S','단리','F','자유적립식','36',3.55,4,7),(24,'10527001001278000','S','단리','F','자유적립식','24',3.5,3.95,7),(25,'10527001001278000','S','단리','F','자유적립식','12',3.45,3.9,7),(26,'10527001001278000','S','단리','F','자유적립식','6',2.75,3.2,7),(27,'01020400490001','S','단리','F','자유적립식','6',3,3.55,8),(28,'01020400490001','S','단리','F','자유적립식','12',3.5,4.4,8),(29,'01020400490002','S','단리','S','정액적립식','6',3.1,3.65,9),(30,'01020400490002','S','단리','S','정액적립식','12',3.6,4.5,9),(31,'01020400510001','S','단리','F','자유적립식','6',3.05,3.45,10),(32,'01020400510001','S','단리','F','자유적립식','12',3.35,3.75,10),(33,'01020400510001','S','단리','F','자유적립식','24',3.05,3.45,10),(34,'01020400510001','S','단리','F','자유적립식','36',3.05,3.45,10),(35,'01020400530001','S','단리','F','자유적립식','36',2.5,2.7,11),(36,'01020400530001','S','단리','F','자유적립식','24',2.5,2.7,11),(37,'01020400530001','S','단리','F','자유적립식','12',3,3.2,11),(38,'01020400530001','S','단리','F','자유적립식','6',2.9,3.1,11),(39,'TD11330029000','S','단리','S','정액적립식','6',3.1,4.3,12),(40,'TD11330029000','S','단리','S','정액적립식','12',3.3,4.5,12),(41,'TD11330029000','S','단리','S','정액적립식','24',3.4,4.6,12),(42,'TD11330029000','S','단리','S','정액적립식','36',3.5,4.7,12),(43,'TD11330029000','S','단리','F','자유적립식','6',2.9,4.1,12),(44,'TD11330029000','S','단리','F','자유적립식','12',3.1,4.3,12),(45,'TD11330029000','S','단리','F','자유적립식','24',3.2,4.4,12),(46,'TD11330029000','S','단리','F','자유적립식','36',3.3,4.5,12),(47,'TD11330030000','S','단리','F','자유적립식','12',3,4.9,13),(48,'TD11330030000','S','단리','S','정액적립식','12',3.2,5.1,13),(49,'TD11330031000','S','단리','S','정액적립식','12',3.6,4.1,14),(50,'TD11330031000','S','단리','F','자유적립식','12',3.3,3.8,14),(51,'TD11330032000','S','단리','S','정액적립식','12',3.2,6,15),(52,'TD11330032000','S','단리','F','자유적립식','12',3,5.8,15),(53,'220002101','S','단리','F','자유적립식','6',3.15,5.25,16),(54,'220002101','S','단리','F','자유적립식','12',3.45,5.55,16),(55,'220002501','S','단리','F','자유적립식','12',3.8,5.8,17),(56,'220002501','S','단리','F','자유적립식','24',4,6,17),(57,'220002701','S','단리','F','자유적립식','12',2.5,5.2,18),(58,'220002701','S','단리','F','자유적립식','6',2.3,5,18),(59,'10-01-30-031-0018-0000','S','단리','F','자유적립식','12',3.35,3.45,19),(60,'10-01-30-031-0018-0000','S','단리','F','자유적립식','24',3.45,3.55,19),(61,'10-01-30-031-0018-0000','S','단리','F','자유적립식','36',3.45,3.55,19),(62,'10-01-30-031-0036','S','단리','S','정액적립식','12',3.45,3.55,20),(63,'10-01-30-031-0036','S','단리','S','정액적립식','24',3.55,3.65,20),(64,'10-01-30-031-0036','S','단리','S','정액적립식','36',3.55,3.65,20),(65,'10-01-30-031-0038-0000','S','단리','S','정액적립식','12',3.15,4.35,21),(66,'10-01-30-031-0048-0000','S','단리','S','정액적립식','12',3.2,5,22),(67,'10-01-30-031-0049-0000','S','단리','S','정액적립식','6',2,6,23),(68,'21000111','S','단리','S','정액적립식','36',3.8,4.8,24),(69,'21000111','S','단리','S','정액적립식','24',3.7,4.7,24),(70,'21000111','S','단리','S','정액적립식','12',3.6,4.6,24),(71,'21001116','S','단리','F','자유적립식','6',3.45,4.15,25),(72,'21001116','S','단리','F','자유적립식','12',3.75,4.45,25),(73,'21001116','S','단리','F','자유적립식','24',3.85,4.55,25),(74,'21001199','S','단리','F','자유적립식','1',2.5,5,26),(75,'21001199','S','단리','F','자유적립식','6',2.75,5.25,26),(76,'21001199','S','단리','F','자유적립식','12',3.05,5.55,26),(77,'21001199','S','단리','F','자유적립식','24',3.15,5.65,26),(78,'21001199','S','단리','F','자유적립식','36',3.25,5.75,26),(79,'21001236','S','단리','S','정액적립식','36',3.65,5.25,27),(80,'21001236','S','단리','S','정액적립식','24',3.6,5.2,27),(81,'21001236','S','단리','S','정액적립식','12',3.55,5.15,27),(82,'21001259','S','단리','F','자유적립식','1',3.45,5.2,28),(83,'21001259','S','단리','F','자유적립식','3',3.45,5.2,28),(84,'21001259','S','단리','F','자유적립식','6',3.45,5.2,28),(85,'21001268','S','단리','F','자유적립식','1',2.5,8,29),(86,'01211210113','S','단리','F','자유적립식','1',3.2,4.7,30),(87,'01211210113','S','단리','F','자유적립식','3',3.2,4.7,30),(88,'01211210113','S','단리','F','자유적립식','6',3.4,4.9,30),(89,'01211210113','S','단리','F','자유적립식','12',3.6,5.1,30),(90,'01211210121','S','단리','F','자유적립식','12',3,7,31),(91,'01211210122','S','단리','F','자유적립식','12',3.5,5.7,32),(92,'03101','S','단리','S','정액적립식','36',2.96,2.96,33),(93,'03101','S','단리','S','정액적립식','24',2.91,2.91,33),(94,'03101','S','단리','S','정액적립식','12',2.87,2.87,33),(95,'03101','S','단리','S','정액적립식','6',2.88,2.88,33),(96,'03700','S','단리','F','자유적립식','1',3.1,3.1,34),(97,'03700','S','단리','F','자유적립식','3',3.1,3.1,34),(98,'03700','S','단리','F','자유적립식','6',3.28,3.28,34),(99,'03700','S','단리','F','자유적립식','12',3.37,3.37,34),(100,'03700','S','단리','F','자유적립식','24',3.41,3.41,34),(101,'03700','S','단리','F','자유적립식','36',3.46,3.46,34),(102,'010200100051','S','단리','S','정액적립식','12',2.75,3.65,35),(103,'010200100051','S','단리','S','정액적립식','24',2.95,3.95,35),(104,'010200100051','S','단리','S','정액적립식','36',3.05,4.25,35),(105,'010200100084','S','단리','F','자유적립식','36',3.05,4.05,36),(106,'010200100084','S','단리','F','자유적립식','24',2.75,3.65,36),(107,'010200100084','S','단리','F','자유적립식','12',2.55,3.35,36),(108,'010200100092','S','단리','F','자유적립식','12',3,4.5,37),(109,'010200100092','S','단리','F','자유적립식','24',3.3,4.8,37),(110,'010200100092','S','단리','F','자유적립식','36',3.5,5,37),(111,'010200100104','S','단리','F','자유적립식','1',2,6,38),(112,'010200100104','S','단리','F','자유적립식','3',2,6,38),(113,'010200100104','S','단리','F','자유적립식','6',2,6,38),(114,'010200100109','S','단리','F','자유적립식','12',2.5,8,39),(115,'230-0118-14','S','단리','F','자유적립식','12',2.5,4.5,40),(116,'230-0118-14','S','단리','F','자유적립식','6',2.5,4.5,40),(117,'230-0118-14','S','단리','F','자유적립식','3',2.5,4.5,40),(118,'230-0118-14','S','단리','F','자유적립식','1',2.5,4.5,40),(119,'230-0119-85','S','단리','F','자유적립식','12',3,4.3,41),(120,'230-0119-85','S','단리','F','자유적립식','24',3.1,4.4,41),(121,'230-0119-85','S','단리','F','자유적립식','36',3.2,4.5,41),(122,'10-047-1360-0002','S','단리','F','자유적립식','1',2.7,4.4,42),(123,'10-047-1360-0002','S','단리','F','자유적립식','3',2.8,4.5,42),(124,'10-047-1360-0002','S','단리','F','자유적립식','6',3,4.7,42),(125,'10-047-1365-0001','M','복리','F','자유적립식','6',3,6.5,43),(126,'10-047-1365-0001','M','복리','F','자유적립식','12',3.1,6.6,43),(127,'10-047-1365-0001','M','복리','F','자유적립식','24',3.15,6.65,43),(128,'10-047-1381-0001','S','단리','F','자유적립식','36',3.4,4.4,44),(129,'10-047-1381-0001','S','단리','F','자유적립식','24',3.15,4.15,44),(130,'10-047-1381-0001','S','단리','F','자유적립식','12',3.1,4.1,44),(131,'10-047-1387-0001','S','단리','F','자유적립식','12',3.4,4.4,45),(132,'10-047-1387-0001','S','단리','F','자유적립식','24',3.45,4.45,45),(133,'10-047-1387-0001','S','단리','F','자유적립식','36',3.7,4.7,45),(134,'10-059-1264-0001','M','복리','F','자유적립식','12',3.38,4.18,46),(135,'10-059-1264-0001','M','복리','F','자유적립식','24',3.25,4.05,46),(136,'10-059-1264-0001','M','복리','F','자유적립식','36',3.42,4.22,46),(137,'52','M','복리','F','자유적립식','12',3.55,4.55,47),(138,'52','M','복리','F','자유적립식','24',3.65,4.65,47),(139,'52','M','복리','F','자유적립식','36',3.75,4.75,47),(140,'53','S','단리','F','자유적립식','36',3.45,3.95,48),(141,'53','S','단리','F','자유적립식','24',3.35,3.85,48),(142,'53','S','단리','F','자유적립식','12',3.25,3.75,48),(143,'53','S','단리','F','자유적립식','6',3.15,3.65,48),(144,'53','S','단리','S','정액적립식','36',3.55,4.05,48),(145,'53','S','단리','S','정액적립식','24',3.45,3.95,48),(146,'53','S','단리','S','정액적립식','12',3.3,3.8,48),(147,'53','S','단리','S','정액적립식','6',3.2,3.7,48),(148,'01012000200000000003','S','단리','F','자유적립식','1',3.3,3.3,49),(149,'01012000200000000003','S','단리','F','자유적립식','3',3.5,3.5,49),(150,'01012000200000000003','S','단리','F','자유적립식','6',3.6,3.6,49),(151,'01012000200000000003','S','단리','F','자유적립식','12',4.2,4.2,49),(152,'01012000200000000003','S','단리','F','자유적립식','24',4.25,4.25,49),(153,'01012000200000000003','S','단리','F','자유적립식','36',4.3,4.3,49),(154,'01012000210000000000','S','단리','F','자유적립식','36',4.2,4.8,50),(155,'01012000210000000000','S','단리','F','자유적립식','24',4.15,4.75,50),(156,'01012000210000000000','S','단리','F','자유적립식','12',4.1,4.7,50),(157,'01012000210000000000','S','단리','F','자유적립식','6',3.5,4.1,50),(158,'10140110400011','S','단리','S','정액적립식','12',2.6,3.8,51),(159,'10140110400011','S','단리','S','정액적립식','24',2.7,3.9,51),(160,'10140110400011','S','단리','S','정액적립식','36',2.8,4,51),(161,'10140114300011','S','단리','S','정액적립식','12',3.5,4,52),(162,'10140114300011','S','단리','S','정액적립식','24',3,3.5,52),(163,'10140114300011','S','단리','S','정액적립식','36',3.3,3.8,52),(164,'10140114700031','S','단리','S','정액적립식','12',3.6,4.5,53),(165,'10140114700031','S','단리','S','정액적립식','6',3.6,4.5,53),(166,'10141109800021','M','복리','F','자유적립식','12',2.2,2.9,54),(167,'10141109800021','M','복리','F','자유적립식','24',1.8,2.5,54),(168,'10141109800021','M','복리','F','자유적립식','36',1.9,2.6,54),(169,'10141114300011','S','단리','F','자유적립식','12',3.15,3.65,55),(170,'10141114300011','S','단리','F','자유적립식','24',2.35,2.85,55),(171,'10141114300011','S','단리','F','자유적립식','36',2.35,2.85,55),(172,'10141114700031','S','단리','F','자유적립식','6',3.6,4.5,56),(173,'10141114700031','S','단리','F','자유적립식','12',3.6,4.5,56),(174,'10-01-30-355-0002','S','단리','F','자유적립식','36',3.5,3.7,57),(175,'10-01-30-355-0002','S','단리','F','자유적립식','24',3.5,3.7,57),(176,'10-01-30-355-0002','S','단리','F','자유적립식','12',3.5,3.7,57),(177,'10-01-30-355-0002','S','단리','F','자유적립식','6',3.3,3.5,57),(178,'10-01-30-355-0005','S','단리','F','자유적립식','6',2.5,5.5,58),(179,'10-01-30-355-0006','S','단리','F','자유적립식','1',1.5,7,59),(180,'1001303001001','S','단리','F','자유적립식','6',2,4,60),(181,'1001303001003','S','단리','F','자유적립식','6',2,4.5,61),(182,'1001303001004','S','단리','F','자유적립식','3',1.5,2,62),(183,'1001303001004','S','단리','F','자유적립식','6',2,2.5,62),(184,'1001303001004','S','단리','F','자유적립식','12',3,3.5,62),(185,'1001303001004','S','단리','F','자유적립식','24',3,3.5,62),(186,'1001303001004','S','단리','F','자유적립식','36',3,3.5,62),(187,'1001303001005','S','단리','F','자유적립식','12',3,5.5,63);
/*!40000 ALTER TABLE `savings_optionlist` ENABLE KEYS */;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` json NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_social_user_id_8146e70c_fk_accounts_` (`user_id`),
  CONSTRAINT `socialaccount_social_user_id_8146e70c_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;

--
-- Dumping routines for database 'interesting'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 22:48:29
