-- MySQL dump 10.13  Distrib 5.6.37, for Linux (x86_64)
--
-- Host: localhost    Database: tobespor_db
-- ------------------------------------------------------
-- Server version	5.6.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backup_size` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backups_name_unique` (`name`),
  UNIQUE KEY `backups_file_name_unique` (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backups`
--

LOCK TABLES `backups` WRITE;
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `color` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Administration','[]','#000',NULL,'2017-06-29 08:42:52','2017-06-29 08:42:52'),(2,'App User','[]','#23f890',NULL,'2017-07-06 15:31:03','2017-07-06 15:31:03');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `graduated` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,NULL,'2017-08-25 11:11:33','2017-08-25 11:11:33','AAA School','1993-00-00','1997-00-00',1,12);
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `designation` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dept` int(10) unsigned NOT NULL DEFAULT '1',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` date NOT NULL DEFAULT '1990-01-01',
  `date_hire` date NOT NULL,
  `date_left` date NOT NULL DEFAULT '1990-01-01',
  `salary_cur` decimal(15,3) NOT NULL DEFAULT '0.000',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  KEY `employees_dept_foreign` (`dept`),
  CONSTRAINT `employees_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'webmaster','Super Admin','Male','8888888888','','webmaster@example.com',1,'Pune','Karve nagar, Pune 411030','About user / biography','2017-06-29','2017-06-29','2017-06-29',0.000,NULL,'2017-06-29 08:43:55','2017-06-29 08:43:55');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendrequests`
--

DROP TABLE IF EXISTS `friendrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendrequests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `friend_uid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendrequests`
--

LOCK TABLES `friendrequests` WRITE;
/*!40000 ALTER TABLE `friendrequests` DISABLE KEYS */;
INSERT INTO `friendrequests` VALUES (2,NULL,'2017-08-30 10:41:45','2017-08-30 10:41:45',12,13);
/*!40000 ALTER TABLE `friendrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendships`
--

DROP TABLE IF EXISTS `friendships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendships` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user1_id` int(10) unsigned NOT NULL,
  `user2_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendships`
--

LOCK TABLES `friendships` WRITE;
/*!40000 ALTER TABLE `friendships` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_configs`
--

DROP TABLE IF EXISTS `la_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_configs`
--

LOCK TABLES `la_configs` WRITE;
/*!40000 ALTER TABLE `la_configs` DISABLE KEYS */;
INSERT INTO `la_configs` VALUES (1,'sitename','','Sports','2017-06-29 08:42:56','2017-07-07 03:44:58'),(2,'sitename_part1','','Sports','2017-06-29 08:42:56','2017-07-07 03:44:58'),(3,'sitename_part2','','Community','2017-06-29 08:42:56','2017-07-07 03:44:58'),(4,'sitename_short','','SC','2017-06-29 08:42:56','2017-07-07 03:44:58'),(5,'site_description','','LaraAdmin is a open-source Laravel Admin Panel for quick-start Admin based applications and boilerplate for CRM or CMS systems.','2017-06-29 08:42:56','2017-07-07 03:44:58'),(6,'sidebar_search','','0','2017-06-29 08:42:56','2017-07-07 03:44:58'),(7,'show_messages','','0','2017-06-29 08:42:56','2017-07-07 03:44:58'),(8,'show_notifications','','1','2017-06-29 08:42:56','2017-07-07 03:44:58'),(9,'show_tasks','','0','2017-06-29 08:42:56','2017-07-07 03:44:58'),(10,'show_rightsidebar','','0','2017-06-29 08:42:56','2017-07-07 03:44:58'),(11,'skin','','skin-blue','2017-06-29 08:42:56','2017-07-07 03:44:58'),(12,'layout','','fixed','2017-06-29 08:42:56','2017-07-07 03:44:58'),(13,'default_email','','test@example.com','2017-06-29 08:42:56','2017-07-07 03:44:58');
/*!40000 ALTER TABLE `la_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_menus`
--

DROP TABLE IF EXISTS `la_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'module',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `hierarchy` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_menus`
--

LOCK TABLES `la_menus` WRITE;
/*!40000 ALTER TABLE `la_menus` DISABLE KEYS */;
INSERT INTO `la_menus` VALUES (1,'Team','#','fa-group','custom',0,1,'2017-06-29 08:42:51','2017-06-29 08:42:51'),(2,'Users','users','fa-group','module',1,0,'2017-06-29 08:42:51','2017-06-29 08:42:51'),(3,'Uploads','uploads','fa-files-o','module',0,0,'2017-06-29 08:42:51','2017-06-29 08:42:51'),(4,'Departments','departments','fa-tags','module',1,0,'2017-06-29 08:42:51','2017-06-29 08:42:51'),(5,'Employees','employees','fa-group','module',1,0,'2017-06-29 08:42:52','2017-06-29 08:42:52'),(6,'Roles','roles','fa-user-plus','module',1,0,'2017-06-29 08:42:52','2017-06-29 08:42:52'),(7,'Organizations','organizations','fa-university','module',0,0,'2017-06-29 08:42:52','2017-06-29 08:42:52'),(8,'Permissions','permissions','fa-magic','module',1,0,'2017-06-29 08:42:52','2017-06-29 08:42:52'),(9,'SocialProfiles','socialprofiles','fa fa-facebook-official','module',0,0,'2017-07-06 16:35:12','2017-07-06 16:35:12'),(10,'UserActivationCodes','useractivationcodes','fa fa-cube','module',0,0,'2017-07-07 05:01:56','2017-07-07 05:01:56'),(11,'UserProfiles','userprofiles','fa fa-user-secret','module',0,0,'2017-07-07 18:04:32','2017-07-07 18:04:32'),(12,'Teams','teams','fa fa-users','module',0,0,'2017-08-09 11:19:21','2017-08-09 11:19:21'),(13,'Leagues','leagues','fa fa-soccer-ball-o','module',0,0,'2017-08-09 11:20:47','2017-08-09 11:20:47'),(14,'Photos','photos','fa fa-picture-o','module',0,0,'2017-08-14 12:00:32','2017-08-14 12:00:32'),(15,'Nodes','nodes','fa fa-object-group','module',0,0,'2017-08-14 12:06:30','2017-08-14 12:06:30'),(16,'Posts','posts','fa fa-cube','module',0,0,'2017-08-22 03:20:18','2017-08-22 03:20:18'),(17,'PostComments','postcomments','fa fa-cube','module',0,0,'2017-08-22 03:23:55','2017-08-22 03:23:55'),(18,'Education','education','fa fa-cube','module',0,0,'2017-08-24 13:30:27','2017-08-24 13:30:27'),(19,'FriendRequests','friendrequests','fa fa-cube','module',0,0,'2017-08-29 10:37:47','2017-08-29 10:37:47'),(20,'FriendShips','friendships','fa fa-cube','module',0,0,'2017-08-31 16:01:34','2017-08-31 16:01:34');
/*!40000 ALTER TABLE `la_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leagues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_05_26_050000_create_modules_table',1),('2014_05_26_055000_create_module_field_types_table',1),('2014_05_26_060000_create_module_fields_table',1),('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2014_12_01_000000_create_uploads_table',1),('2016_05_26_064006_create_departments_table',1),('2016_05_26_064007_create_employees_table',1),('2016_05_26_064446_create_roles_table',1),('2016_07_05_115343_create_role_user_table',1),('2016_07_06_140637_create_organizations_table',1),('2016_07_07_134058_create_backups_table',1),('2016_07_07_134058_create_menus_table',1),('2016_09_10_163337_create_permissions_table',1),('2016_09_10_163520_create_permission_role_table',1),('2016_09_22_105958_role_module_fields_table',1),('2016_09_22_110008_role_module_table',1),('2016_10_06_115413_create_la_configs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_field_types`
--

DROP TABLE IF EXISTS `module_field_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_field_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_field_types`
--

LOCK TABLES `module_field_types` WRITE;
/*!40000 ALTER TABLE `module_field_types` DISABLE KEYS */;
INSERT INTO `module_field_types` VALUES (1,'Address','2017-06-29 08:42:24','2017-06-29 08:42:24'),(2,'Checkbox','2017-06-29 08:42:24','2017-06-29 08:42:24'),(3,'Currency','2017-06-29 08:42:24','2017-06-29 08:42:24'),(4,'Date','2017-06-29 08:42:24','2017-06-29 08:42:24'),(5,'Datetime','2017-06-29 08:42:24','2017-06-29 08:42:24'),(6,'Decimal','2017-06-29 08:42:24','2017-06-29 08:42:24'),(7,'Dropdown','2017-06-29 08:42:24','2017-06-29 08:42:24'),(8,'Email','2017-06-29 08:42:24','2017-06-29 08:42:24'),(9,'File','2017-06-29 08:42:24','2017-06-29 08:42:24'),(10,'Float','2017-06-29 08:42:25','2017-06-29 08:42:25'),(11,'HTML','2017-06-29 08:42:25','2017-06-29 08:42:25'),(12,'Image','2017-06-29 08:42:25','2017-06-29 08:42:25'),(13,'Integer','2017-06-29 08:42:25','2017-06-29 08:42:25'),(14,'Mobile','2017-06-29 08:42:25','2017-06-29 08:42:25'),(15,'Multiselect','2017-06-29 08:42:25','2017-06-29 08:42:25'),(16,'Name','2017-06-29 08:42:25','2017-06-29 08:42:25'),(17,'Password','2017-06-29 08:42:25','2017-06-29 08:42:25'),(18,'Radio','2017-06-29 08:42:25','2017-06-29 08:42:25'),(19,'String','2017-06-29 08:42:25','2017-06-29 08:42:25'),(20,'Taginput','2017-06-29 08:42:25','2017-06-29 08:42:25'),(21,'Textarea','2017-06-29 08:42:25','2017-06-29 08:42:25'),(22,'TextField','2017-06-29 08:42:25','2017-06-29 08:42:25'),(23,'URL','2017-06-29 08:42:25','2017-06-29 08:42:25'),(24,'Files','2017-06-29 08:42:25','2017-06-29 08:42:25');
/*!40000 ALTER TABLE `module_field_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_fields`
--

DROP TABLE IF EXISTS `module_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `colname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` int(10) unsigned NOT NULL,
  `field_type` int(10) unsigned NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT '0',
  `defaultvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `popup_vals` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_fields_module_foreign` (`module`),
  KEY `module_fields_field_type_foreign` (`field_type`),
  CONSTRAINT `module_fields_field_type_foreign` FOREIGN KEY (`field_type`) REFERENCES `module_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `module_fields_module_foreign` FOREIGN KEY (`module`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_fields`
--

LOCK TABLES `module_fields` WRITE;
/*!40000 ALTER TABLE `module_fields` DISABLE KEYS */;
INSERT INTO `module_fields` VALUES (1,'name','Name',1,16,0,'',5,250,1,'',0,'2017-06-29 08:42:28','2017-06-29 08:42:28'),(2,'context_id','Context',1,13,0,'0',0,0,0,'',0,'2017-06-29 08:42:28','2017-06-29 08:42:28'),(3,'email','Email',1,8,1,'',0,250,0,'',0,'2017-06-29 08:42:28','2017-06-29 08:42:28'),(4,'password','Password',1,17,0,'',6,250,1,'',0,'2017-06-29 08:42:28','2017-06-29 08:42:28'),(5,'type','User Type',1,7,0,'Employee',0,0,0,'[\"Employee\",\"Client\"]',0,'2017-06-29 08:42:28','2017-06-29 08:42:28'),(6,'name','Name',2,16,0,'',5,250,1,'',0,'2017-06-29 08:42:30','2017-06-29 08:42:30'),(7,'path','Path',2,19,0,'',0,250,0,'',0,'2017-06-29 08:42:30','2017-06-29 08:42:30'),(8,'extension','Extension',2,19,0,'',0,20,0,'',0,'2017-06-29 08:42:30','2017-06-29 08:42:30'),(9,'caption','Caption',2,19,0,'',0,250,0,'',0,'2017-06-29 08:42:30','2017-06-29 08:42:30'),(10,'user_id','Owner',2,7,0,'1',0,0,0,'@users',0,'2017-06-29 08:42:30','2017-06-29 08:42:30'),(11,'hash','Hash',2,19,0,'',0,250,0,'',0,'2017-06-29 08:42:30','2017-06-29 08:42:30'),(12,'public','Is Public',2,2,0,'0',0,0,0,'',0,'2017-06-29 08:42:30','2017-06-29 08:42:30'),(13,'name','Name',3,16,1,'',1,250,1,'',0,'2017-06-29 08:42:31','2017-06-29 08:42:31'),(14,'tags','Tags',3,20,0,'[]',0,0,0,'',0,'2017-06-29 08:42:31','2017-06-29 08:42:31'),(15,'color','Color',3,19,0,'',0,50,1,'',0,'2017-06-29 08:42:31','2017-06-29 08:42:31'),(16,'name','Name',4,16,0,'',5,250,1,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(17,'designation','Designation',4,19,0,'',0,50,1,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(18,'gender','Gender',4,18,0,'Male',0,0,1,'[\"Male\",\"Female\"]',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(19,'mobile','Mobile',4,14,0,'',10,20,1,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(20,'mobile2','Alternative Mobile',4,14,0,'',10,20,0,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(21,'email','Email',4,8,1,'',5,250,1,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(22,'dept','Department',4,7,0,'0',0,0,1,'@departments',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(23,'city','City',4,19,0,'',0,50,0,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(24,'address','Address',4,1,0,'',0,1000,0,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(25,'about','About',4,19,0,'',0,0,0,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(26,'date_birth','Date of Birth',4,4,0,'1990-01-01',0,0,0,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(27,'date_hire','Hiring Date',4,4,0,'date(\'Y-m-d\')',0,0,0,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(28,'date_left','Resignation Date',4,4,0,'1990-01-01',0,0,0,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(29,'salary_cur','Current Salary',4,6,0,'0.0',0,2,0,'',0,'2017-06-29 08:42:32','2017-06-29 08:42:32'),(30,'name','Name',5,16,1,'',1,250,1,'',0,'2017-06-29 08:42:34','2017-06-29 08:42:34'),(31,'display_name','Display Name',5,19,0,'',0,250,1,'',0,'2017-06-29 08:42:34','2017-06-29 08:42:34'),(32,'description','Description',5,21,0,'',0,1000,0,'',0,'2017-06-29 08:42:34','2017-06-29 08:42:34'),(33,'parent','Parent Role',5,7,0,'1',0,0,0,'@roles',0,'2017-06-29 08:42:34','2017-06-29 08:42:34'),(34,'dept','Department',5,7,0,'1',0,0,0,'@departments',0,'2017-06-29 08:42:34','2017-06-29 08:42:34'),(35,'name','Name',6,16,1,'',5,250,1,'',0,'2017-06-29 08:42:39','2017-06-29 08:42:39'),(36,'email','Email',6,8,1,'',0,250,0,'',0,'2017-06-29 08:42:39','2017-06-29 08:42:39'),(37,'phone','Phone',6,14,0,'',0,20,0,'',0,'2017-06-29 08:42:39','2017-06-29 08:42:39'),(38,'website','Website',6,23,0,'http://',0,250,0,'',0,'2017-06-29 08:42:40','2017-06-29 08:42:40'),(39,'assigned_to','Assigned to',6,7,0,'0',0,0,0,'@employees',0,'2017-06-29 08:42:40','2017-06-29 08:42:40'),(40,'connect_since','Connected Since',6,4,0,'date(\'Y-m-d\')',0,0,0,'',0,'2017-06-29 08:42:40','2017-06-29 08:42:40'),(41,'address','Address',6,1,0,'',0,1000,1,'',0,'2017-06-29 08:42:40','2017-06-29 08:42:40'),(42,'city','City',6,19,0,'',0,250,1,'',0,'2017-06-29 08:42:40','2017-06-29 08:42:40'),(43,'description','Description',6,21,0,'',0,1000,0,'',0,'2017-06-29 08:42:40','2017-06-29 08:42:40'),(44,'profile_image','Profile Image',6,12,0,'',0,250,0,'',0,'2017-06-29 08:42:40','2017-06-29 08:42:40'),(45,'profile','Company Profile',6,9,0,'',0,250,0,'',0,'2017-06-29 08:42:40','2017-06-29 08:42:40'),(46,'name','Name',7,16,1,'',0,250,1,'',0,'2017-06-29 08:42:42','2017-06-29 08:42:42'),(47,'file_name','File Name',7,19,1,'',0,250,1,'',0,'2017-06-29 08:42:42','2017-06-29 08:42:42'),(48,'backup_size','File Size',7,19,0,'0',0,10,1,'',0,'2017-06-29 08:42:42','2017-06-29 08:42:42'),(49,'name','Name',8,16,1,'',1,250,1,'',0,'2017-06-29 08:42:43','2017-06-29 08:42:43'),(50,'display_name','Display Name',8,19,0,'',0,250,1,'',0,'2017-06-29 08:42:43','2017-06-29 08:42:43'),(51,'description','Description',8,21,0,'',0,1000,0,'',0,'2017-06-29 08:42:43','2017-06-29 08:42:43'),(52,'email','Email',9,8,0,'',0,250,0,'',0,'2017-07-06 16:26:34','2017-07-06 16:26:34'),(53,'provider','Provider',9,19,0,'',0,20,0,'',0,'2017-07-06 16:26:58','2017-07-06 16:26:58'),(54,'provider_id','Provider ID',9,19,0,'',0,50,0,'',0,'2017-07-06 16:27:25','2017-07-06 16:27:25'),(55,'token','Token',9,19,0,'',0,250,0,'',0,'2017-07-06 16:27:45','2017-07-06 16:28:01'),(56,'status','Status',1,7,0,'pending',0,0,0,'[\"pending\",\"active\",\"cancel\"]',0,'2017-07-07 04:38:18','2017-07-07 04:38:18'),(57,'user_id','User ID',10,13,1,'0',0,1000000000,0,'',0,'2017-07-07 05:00:46','2017-07-07 05:01:05'),(58,'code','Code',10,19,0,'',1,19,0,'',0,'2017-07-07 05:01:25','2017-07-07 05:01:25'),(59,'user_id','User ID',11,13,0,'0',1,100000000,0,'',0,'2017-07-07 18:02:03','2017-07-07 18:02:03'),(60,'date_birth','Birthday',11,4,0,'',0,0,0,'',0,'2017-07-07 18:03:58','2017-07-07 18:03:58'),(61,'gender','Gender',11,7,0,'',0,0,0,'[\"male\",\"female\"]',0,'2017-07-07 18:04:27','2017-08-11 07:36:08'),(62,'expiration','Expiration',10,13,0,'0',0,4294967295,0,'',0,'2017-07-09 16:32:41','2017-07-09 16:32:41'),(63,'avatar','Avatar',1,19,0,'default.jpg',0,256,0,'',0,'2017-08-09 10:46:02','2017-08-09 10:46:02'),(64,'name','Name',12,16,0,'',0,256,0,'',0,'2017-08-09 11:16:37','2017-08-09 11:16:37'),(66,'name','Name',13,16,0,'',0,256,0,'',0,'2017-08-09 11:20:19','2017-08-09 11:20:19'),(70,'group_nid','Group Node',15,13,0,'',0,999999999,0,'',4,'2017-08-14 12:00:27','2017-08-14 13:25:21'),(71,'object_id','Object',16,13,0,'',0,999999999,0,'',0,'2017-08-14 12:05:54','2017-08-14 12:05:54'),(72,'type','Type',16,19,0,'',0,50,0,'',0,'2017-08-14 12:06:10','2017-08-14 12:06:10'),(73,'user_id','User',16,13,0,'',0,999999999,0,'',0,'2017-08-14 12:06:26','2017-08-14 12:06:26'),(74,'cover_photo_id','Cover Photo',11,13,0,'',0,999999999,0,'',0,'2017-08-14 14:53:09','2017-08-21 08:34:05'),(75,'phone','Phone',11,19,0,'',0,50,0,'',0,'2017-08-16 22:08:32','2017-08-16 22:08:32'),(76,'address','Address',11,19,0,'',0,255,0,'',0,'2017-08-16 22:08:50','2017-08-16 22:08:50'),(77,'city','City',11,19,0,'',0,255,0,'',0,'2017-08-16 22:09:11','2017-08-16 22:09:11'),(78,'state','State',11,19,0,'',0,255,0,'',0,'2017-08-16 22:09:30','2017-08-16 22:09:30'),(79,'zip','Zip',11,19,0,'',0,50,0,'',0,'2017-08-16 22:09:47','2017-08-16 22:09:47'),(80,'used','Used',15,13,0,'1',0,7,0,'',5,'2017-08-21 08:32:45','2017-08-21 08:32:45'),(81,'width','Width',15,13,0,'0',0,1000000,0,'',2,'2017-08-21 16:04:55','2017-08-21 16:04:55'),(82,'height','Height',15,13,0,'0',0,1000000,0,'',3,'2017-08-21 16:05:10','2017-08-21 16:05:10'),(83,'text','Text',17,21,0,'',0,0,0,'',0,'2017-08-22 03:19:06','2017-08-22 03:19:06'),(84,'group_nid','Group Node',17,13,0,'',0,999999999,0,'',0,'2017-08-22 03:19:51','2017-08-22 03:19:51'),(85,'author_uid','Author',17,13,0,'',0,999999999,0,'',0,'2017-08-22 03:20:13','2017-08-22 03:20:13'),(86,'text','Text',18,21,0,'',0,0,0,'',0,'2017-08-22 03:21:23','2017-08-22 03:21:23'),(87,'post_id','Post',18,13,0,'',0,999999999,0,'',0,'2017-08-22 03:21:42','2017-08-22 03:21:42'),(88,'pid','Parent Comment',18,13,0,'0',0,999999999,0,'',0,'2017-08-22 03:22:20','2017-08-22 03:22:20'),(89,'author_uid','Author',18,13,0,'0',0,999999999,0,'',0,'2017-08-22 03:23:47','2017-08-22 03:23:47'),(90,'name','Name',19,19,0,'',0,255,0,'',0,'2017-08-24 13:28:39','2017-08-24 13:28:39'),(91,'start','Start',19,4,0,'',0,0,0,'',0,'2017-08-24 13:28:52','2017-08-24 13:28:52'),(92,'end','End',19,4,0,'',0,0,0,'',0,'2017-08-24 13:29:16','2017-08-24 13:29:16'),(93,'graduated','Graduated',19,2,0,'1',0,0,0,'',0,'2017-08-24 13:29:40','2017-08-24 13:29:40'),(94,'user_id','User',19,13,0,'',0,999999999,0,'',0,'2017-08-24 13:30:07','2017-08-24 13:30:07'),(95,'user_id','User',20,13,0,'',0,999999999,0,'',0,'2017-08-29 10:37:25','2017-08-29 10:37:25'),(96,'friend_uid','Friend',20,13,0,'',0,999999999,0,'',0,'2017-08-29 10:37:44','2017-08-29 10:37:44'),(97,'user1_id','User1',21,13,0,'',0,999999999,0,'',0,'2017-08-31 16:00:59','2017-08-31 16:00:59'),(98,'user2_id','User2',21,13,0,'',0,999999999,0,'',0,'2017-08-31 16:01:29','2017-08-31 16:01:29'),(99,'name','Name',15,19,0,'',0,1024,0,'',0,'2017-09-03 00:10:21','2017-09-03 00:10:21'),(100,'path','Path',15,19,0,'',0,1024,0,'',0,'2017-09-03 00:10:35','2017-09-03 00:10:35'),(101,'extension','Extension',15,19,0,'',0,32,0,'',0,'2017-09-03 00:10:48','2017-09-03 00:10:48'),(102,'user_id','User',15,13,0,'',0,999999999,0,'',0,'2017-09-03 00:11:11','2017-09-03 00:11:11');
/*!40000 ALTER TABLE `module_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_db` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `view_col` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fa_icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `is_gen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Users','Users','users','name','User','UsersController','fa-group',1,'2017-06-29 08:42:28','2017-06-29 08:42:56'),(2,'Uploads','Uploads','uploads','name','Upload','UploadsController','fa-files-o',1,'2017-06-29 08:42:30','2017-06-29 08:42:56'),(3,'Departments','Departments','departments','name','Department','DepartmentsController','fa-tags',1,'2017-06-29 08:42:31','2017-06-29 08:42:56'),(4,'Employees','Employees','employees','name','Employee','EmployeesController','fa-group',1,'2017-06-29 08:42:32','2017-06-29 08:42:57'),(5,'Roles','Roles','roles','name','Role','RolesController','fa-user-plus',1,'2017-06-29 08:42:34','2017-06-29 08:42:57'),(6,'Organizations','Organizations','organizations','name','Organization','OrganizationsController','fa-university',1,'2017-06-29 08:42:39','2017-06-29 08:42:57'),(7,'Backups','Backups','backups','name','Backup','BackupsController','fa-hdd-o',1,'2017-06-29 08:42:42','2017-06-29 08:42:57'),(8,'Permissions','Permissions','permissions','name','Permission','PermissionsController','fa-magic',1,'2017-06-29 08:42:43','2017-06-29 08:42:57'),(9,'SocialProfiles','SocialProfiles','socialprofiles','email','SocialProfile','SocialProfilesController','fa-facebook-official',1,'2017-07-06 16:26:06','2017-07-06 16:35:12'),(10,'UserActivationCodes','UserActivationCodes','useractivationcodes','user_id','UserActivationCode','UserActivationCodesController','fa-cube',1,'2017-07-07 04:59:44','2017-07-07 05:01:56'),(11,'UserProfiles','UserProfiles','userprofiles','user_id','UserProfile','UserProfilesController','fa-user-secret',1,'2017-07-07 18:01:32','2017-07-07 18:04:32'),(12,'Teams','Teams','teams','name','Team','TeamsController','fa-users',1,'2017-08-09 11:15:38','2017-08-09 11:19:21'),(13,'Leagues','Leagues','leagues','name','League','LeaguesController','fa-soccer-ball-o',1,'2017-08-09 11:20:05','2017-08-09 11:20:47'),(15,'Photos','Photos','photos','name','Photo','PhotosController','fa-picture-o',1,'2017-08-14 11:59:54','2017-09-03 00:11:24'),(16,'Nodes','Nodes','nodes','object_id','Node','NodesController','fa-object-group',1,'2017-08-14 12:05:29','2017-08-14 12:06:30'),(17,'Posts','Posts','posts','text','Post','PostsController','fa-cube',1,'2017-08-22 03:18:52','2017-08-22 03:20:18'),(18,'PostComments','PostComments','postcomments','text','PostComment','PostCommentsController','fa-cube',1,'2017-08-22 03:21:10','2017-08-22 03:23:55'),(19,'Education','Education','education','name','Education','EducationController','fa-cube',1,'2017-08-24 13:28:25','2017-08-24 13:30:27'),(20,'FriendRequests','FriendRequests','friendrequests','user_id','FriendRequest','FriendRequestsController','fa-cube',1,'2017-08-29 10:37:14','2017-08-29 10:37:47'),(21,'FriendShips','FriendShips','friendships','user1_id','FriendShip','FriendShipsController','fa-cube',1,'2017-08-31 16:00:17','2017-08-31 16:01:34');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` VALUES (1,NULL,'2017-08-14 15:05:18','2017-08-14 15:05:18',12,'user',12),(2,NULL,'2017-08-23 07:20:04','2017-08-23 07:20:04',13,'user',13);
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'http://',
  `assigned_to` int(10) unsigned NOT NULL DEFAULT '1',
  `connect_since` date NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` int(11) NOT NULL,
  `profile` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_name_unique` (`name`),
  UNIQUE KEY `organizations_email_unique` (`email`),
  KEY `organizations_assigned_to_foreign` (`assigned_to`),
  CONSTRAINT `organizations_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('contact@pherona.com','c54e2a7eacbb01c503d46d30526880c5ec1717063807a55a339a93a890f9c8ed','2017-08-11 07:56:43');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(2,2),(3,2),(3,3);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'ADMIN_PANEL','Admin Panel','Admin Panel Permission',NULL,'2017-06-29 08:42:56','2017-06-29 08:42:56'),(2,'WEBADMIN_PANEL','Web Administrator Panel','',NULL,'2017-07-06 15:32:22','2017-07-06 15:32:22'),(3,'APPUSER_PANEL','App User Panel','',NULL,'2017-07-06 15:32:40','2017-07-06 15:32:40');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_nid` int(10) unsigned NOT NULL,
  `used` int(10) unsigned NOT NULL DEFAULT '1',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (9,NULL,'2017-09-03 00:16:51','2017-09-03 00:16:51',1,1,1600,900,'2017-09-03-021651-_downloadfiles_wallpapers_1600_900_in_the_green_wallpaper_plants_nature_1164.jpg','photos/user/12','jpg',12);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcomments`
--

DROP TABLE IF EXISTS `postcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postcomments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `author_uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcomments`
--

LOCK TABLES `postcomments` WRITE;
/*!40000 ALTER TABLE `postcomments` DISABLE KEYS */;
INSERT INTO `postcomments` VALUES (1,NULL,'2017-08-23 07:16:00','2017-08-23 07:16:00','Congratulation.',1,0,12),(2,NULL,'2017-08-23 07:16:08','2017-08-23 07:16:08','This is good',1,1,12),(3,NULL,'2017-08-23 07:18:01','2017-08-23 07:18:01','I\'ll improve timeline with image',1,1,12),(4,NULL,'2017-08-23 22:41:23','2017-08-23 22:41:23','This is testing comment',2,0,12);
/*!40000 ALTER TABLE `postcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `group_nid` int(10) unsigned NOT NULL,
  `author_uid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,NULL,'2017-08-23 07:15:12','2017-08-23 07:15:12','This is the first Post',1,12),(2,NULL,'2017-08-23 21:01:47','2017-08-23 21:01:47','Testing',2,13);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_module`
--

DROP TABLE IF EXISTS `role_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `acc_view` tinyint(1) NOT NULL,
  `acc_create` tinyint(1) NOT NULL,
  `acc_edit` tinyint(1) NOT NULL,
  `acc_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_role_id_foreign` (`role_id`),
  KEY `role_module_module_id_foreign` (`module_id`),
  CONSTRAINT `role_module_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_module_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_module`
--

LOCK TABLES `role_module` WRITE;
/*!40000 ALTER TABLE `role_module` DISABLE KEYS */;
INSERT INTO `role_module` VALUES (1,1,1,1,1,1,1,'2017-06-29 08:42:53','2017-06-29 08:42:53'),(2,1,2,1,1,1,1,'2017-06-29 08:42:53','2017-06-29 08:42:53'),(3,1,3,1,1,1,1,'2017-06-29 08:42:53','2017-06-29 08:42:53'),(4,1,4,1,1,1,1,'2017-06-29 08:42:54','2017-06-29 08:42:54'),(5,1,5,1,1,1,1,'2017-06-29 08:42:54','2017-06-29 08:42:54'),(6,1,6,1,1,1,1,'2017-06-29 08:42:55','2017-06-29 08:42:55'),(7,1,7,1,1,1,1,'2017-06-29 08:42:55','2017-06-29 08:42:55'),(8,1,8,1,1,1,1,'2017-06-29 08:42:55','2017-06-29 08:42:55'),(9,2,1,1,0,0,0,'2017-07-06 15:30:34','2017-07-06 15:30:34'),(10,2,2,1,0,0,0,'2017-07-06 15:30:34','2017-07-06 15:30:34'),(11,2,3,1,0,0,0,'2017-07-06 15:30:34','2017-07-06 15:30:34'),(12,2,4,1,0,0,0,'2017-07-06 15:30:35','2017-07-06 15:30:35'),(13,2,5,1,0,0,0,'2017-07-06 15:30:35','2017-07-06 15:30:35'),(14,2,6,1,0,0,0,'2017-07-06 15:30:35','2017-07-06 15:30:35'),(15,2,7,1,0,0,0,'2017-07-06 15:30:36','2017-07-06 15:30:36'),(16,2,8,1,0,0,0,'2017-07-06 15:30:36','2017-07-06 15:30:36'),(17,3,1,1,0,0,0,'2017-07-06 15:31:42','2017-07-06 15:31:42'),(18,3,2,1,0,0,0,'2017-07-06 15:31:42','2017-07-06 15:31:42'),(19,3,3,1,0,0,0,'2017-07-06 15:31:43','2017-07-06 15:31:43'),(20,3,4,1,0,0,0,'2017-07-06 15:31:43','2017-07-06 15:31:43'),(21,3,5,1,0,0,0,'2017-07-06 15:31:44','2017-07-06 15:31:44'),(22,3,6,1,0,0,0,'2017-07-06 15:31:44','2017-07-06 15:31:44'),(23,3,7,1,0,0,0,'2017-07-06 15:31:44','2017-07-06 15:31:44'),(24,3,8,1,0,0,0,'2017-07-06 15:31:45','2017-07-06 15:31:45'),(25,1,9,1,1,1,1,'2017-07-06 16:35:12','2017-07-06 16:35:12'),(26,1,10,1,1,1,1,'2017-07-07 05:01:57','2017-07-07 05:01:57'),(27,1,11,1,1,1,1,'2017-07-07 18:04:32','2017-07-07 18:04:32'),(28,1,12,1,1,1,1,'2017-08-09 11:19:21','2017-08-09 11:19:21'),(29,1,13,1,1,1,1,'2017-08-09 11:20:47','2017-08-09 11:20:47'),(30,1,15,1,1,1,1,'2017-08-14 12:00:32','2017-08-14 12:00:32'),(31,1,16,1,1,1,1,'2017-08-14 12:06:30','2017-08-14 12:06:30'),(32,1,17,1,1,1,1,'2017-08-22 03:20:18','2017-08-22 03:20:18'),(33,1,18,1,1,1,1,'2017-08-22 03:23:55','2017-08-22 03:23:55'),(34,1,19,1,1,1,1,'2017-08-24 13:30:27','2017-08-24 13:30:27'),(35,1,20,1,1,1,1,'2017-08-29 10:37:47','2017-08-29 10:37:47'),(36,1,21,1,1,1,1,'2017-08-31 16:01:34','2017-08-31 16:01:34');
/*!40000 ALTER TABLE `role_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_module_fields`
--

DROP TABLE IF EXISTS `role_module_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `access` enum('invisible','readonly','write') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_fields_role_id_foreign` (`role_id`),
  KEY `role_module_fields_field_id_foreign` (`field_id`),
  CONSTRAINT `role_module_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `module_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_module_fields_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_module_fields`
--

LOCK TABLES `role_module_fields` WRITE;
/*!40000 ALTER TABLE `role_module_fields` DISABLE KEYS */;
INSERT INTO `role_module_fields` VALUES (1,1,1,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(2,1,2,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(3,1,3,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(4,1,4,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(5,1,5,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(6,1,6,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(7,1,7,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(8,1,8,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(9,1,9,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(10,1,10,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(11,1,11,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(12,1,12,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(13,1,13,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(14,1,14,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(15,1,15,'write','2017-06-29 08:42:53','2017-06-29 08:42:53'),(16,1,16,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(17,1,17,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(18,1,18,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(19,1,19,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(20,1,20,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(21,1,21,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(22,1,22,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(23,1,23,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(24,1,24,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(25,1,25,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(26,1,26,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(27,1,27,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(28,1,28,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(29,1,29,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(30,1,30,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(31,1,31,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(32,1,32,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(33,1,33,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(34,1,34,'write','2017-06-29 08:42:54','2017-06-29 08:42:54'),(35,1,35,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(36,1,36,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(37,1,37,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(38,1,38,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(39,1,39,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(40,1,40,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(41,1,41,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(42,1,42,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(43,1,43,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(44,1,44,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(45,1,45,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(46,1,46,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(47,1,47,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(48,1,48,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(49,1,49,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(50,1,50,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(51,1,51,'write','2017-06-29 08:42:55','2017-06-29 08:42:55'),(52,2,1,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(53,2,2,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(54,2,3,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(55,2,4,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(56,2,5,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(57,2,6,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(58,2,7,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(59,2,8,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(60,2,9,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(61,2,10,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(62,2,11,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(63,2,12,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(64,2,13,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(65,2,14,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(66,2,15,'readonly','2017-07-06 15:30:34','2017-07-06 15:30:34'),(67,2,16,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(68,2,17,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(69,2,18,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(70,2,19,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(71,2,20,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(72,2,21,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(73,2,22,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(74,2,23,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(75,2,24,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(76,2,25,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(77,2,26,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(78,2,27,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(79,2,28,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(80,2,29,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(81,2,30,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(82,2,31,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(83,2,32,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(84,2,33,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(85,2,34,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(86,2,35,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(87,2,36,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(88,2,37,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(89,2,38,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(90,2,39,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(91,2,40,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(92,2,41,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(93,2,42,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(94,2,43,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(95,2,44,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(96,2,45,'readonly','2017-07-06 15:30:35','2017-07-06 15:30:35'),(97,2,46,'readonly','2017-07-06 15:30:36','2017-07-06 15:30:36'),(98,2,47,'readonly','2017-07-06 15:30:36','2017-07-06 15:30:36'),(99,2,48,'readonly','2017-07-06 15:30:36','2017-07-06 15:30:36'),(100,2,49,'readonly','2017-07-06 15:30:36','2017-07-06 15:30:36'),(101,2,50,'readonly','2017-07-06 15:30:36','2017-07-06 15:30:36'),(102,2,51,'readonly','2017-07-06 15:30:36','2017-07-06 15:30:36'),(103,3,1,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(104,3,2,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(105,3,3,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(106,3,4,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(107,3,5,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(108,3,6,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(109,3,7,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(110,3,8,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(111,3,9,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(112,3,10,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(113,3,11,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(114,3,12,'readonly','2017-07-06 15:31:42','2017-07-06 15:31:42'),(115,3,13,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(116,3,14,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(117,3,15,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(118,3,16,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(119,3,17,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(120,3,18,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(121,3,19,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(122,3,20,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(123,3,21,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(124,3,22,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(125,3,23,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(126,3,24,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(127,3,25,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(128,3,26,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(129,3,27,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(130,3,28,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(131,3,29,'readonly','2017-07-06 15:31:43','2017-07-06 15:31:43'),(132,3,30,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(133,3,31,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(134,3,32,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(135,3,33,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(136,3,34,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(137,3,35,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(138,3,36,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(139,3,37,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(140,3,38,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(141,3,39,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(142,3,40,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(143,3,41,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(144,3,42,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(145,3,43,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(146,3,44,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(147,3,45,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(148,3,46,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(149,3,47,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(150,3,48,'readonly','2017-07-06 15:31:44','2017-07-06 15:31:44'),(151,3,49,'readonly','2017-07-06 15:31:45','2017-07-06 15:31:45'),(152,3,50,'readonly','2017-07-06 15:31:45','2017-07-06 15:31:45'),(153,3,51,'readonly','2017-07-06 15:31:45','2017-07-06 15:31:45'),(154,1,52,'write','2017-07-06 16:26:35','2017-07-06 16:26:35'),(155,1,53,'write','2017-07-06 16:26:59','2017-07-06 16:26:59'),(156,1,54,'write','2017-07-06 16:27:26','2017-07-06 16:27:26'),(157,1,55,'write','2017-07-06 16:27:45','2017-07-06 16:27:45'),(158,1,56,'write','2017-07-07 04:38:18','2017-07-07 04:38:18'),(159,1,57,'write','2017-07-07 05:00:47','2017-07-07 05:00:47'),(160,1,58,'write','2017-07-07 05:01:26','2017-07-07 05:01:26'),(161,1,59,'write','2017-07-07 18:02:04','2017-07-07 18:02:04'),(162,1,60,'write','2017-07-07 18:03:59','2017-07-07 18:03:59'),(163,1,61,'write','2017-07-07 18:04:28','2017-07-07 18:04:28'),(164,1,62,'write','2017-07-09 16:32:42','2017-07-09 16:32:42'),(165,1,63,'write','2017-08-09 10:46:02','2017-08-09 10:46:02'),(166,1,64,'write','2017-08-09 11:16:37','2017-08-09 11:16:37'),(168,1,66,'write','2017-08-09 11:20:19','2017-08-09 11:20:19'),(172,1,70,'write','2017-08-14 12:00:27','2017-08-14 12:00:27'),(173,1,71,'write','2017-08-14 12:05:54','2017-08-14 12:05:54'),(174,1,72,'write','2017-08-14 12:06:10','2017-08-14 12:06:10'),(175,1,73,'write','2017-08-14 12:06:26','2017-08-14 12:06:26'),(176,1,74,'write','2017-08-14 14:53:10','2017-08-14 14:53:10'),(177,1,75,'write','2017-08-16 22:08:33','2017-08-16 22:08:33'),(178,1,76,'write','2017-08-16 22:08:50','2017-08-16 22:08:50'),(179,1,77,'write','2017-08-16 22:09:11','2017-08-16 22:09:11'),(180,1,78,'write','2017-08-16 22:09:30','2017-08-16 22:09:30'),(181,1,79,'write','2017-08-16 22:09:47','2017-08-16 22:09:47'),(182,1,80,'write','2017-08-21 08:32:45','2017-08-21 08:32:45'),(183,1,81,'write','2017-08-21 16:04:55','2017-08-21 16:04:55'),(184,1,82,'write','2017-08-21 16:05:10','2017-08-21 16:05:10'),(185,1,83,'write','2017-08-22 03:19:06','2017-08-22 03:19:06'),(186,1,84,'write','2017-08-22 03:19:51','2017-08-22 03:19:51'),(187,1,85,'write','2017-08-22 03:20:13','2017-08-22 03:20:13'),(188,1,86,'write','2017-08-22 03:21:23','2017-08-22 03:21:23'),(189,1,87,'write','2017-08-22 03:21:42','2017-08-22 03:21:42'),(190,1,88,'write','2017-08-22 03:22:20','2017-08-22 03:22:20'),(191,1,89,'write','2017-08-22 03:23:47','2017-08-22 03:23:47'),(192,1,90,'write','2017-08-24 13:28:39','2017-08-24 13:28:39'),(193,1,91,'write','2017-08-24 13:28:52','2017-08-24 13:28:52'),(194,1,92,'write','2017-08-24 13:29:16','2017-08-24 13:29:16'),(195,1,93,'write','2017-08-24 13:29:40','2017-08-24 13:29:40'),(196,1,94,'write','2017-08-24 13:30:07','2017-08-24 13:30:07'),(197,1,95,'write','2017-08-29 10:37:25','2017-08-29 10:37:25'),(198,1,96,'write','2017-08-29 10:37:44','2017-08-29 10:37:44'),(199,1,97,'write','2017-08-31 16:00:59','2017-08-31 16:00:59'),(200,1,98,'write','2017-08-31 16:01:29','2017-08-31 16:01:29'),(201,1,99,'write','2017-09-03 00:10:21','2017-09-03 00:10:21'),(202,1,100,'write','2017-09-03 00:10:35','2017-09-03 00:10:35'),(203,1,101,'write','2017-09-03 00:10:48','2017-09-03 00:10:48'),(204,1,102,'write','2017-09-03 00:11:11','2017-09-03 00:11:11');
/*!40000 ALTER TABLE `role_module_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,1,NULL,NULL),(2,2,2,NULL,NULL),(10,3,10,NULL,NULL),(12,3,12,NULL,NULL),(13,3,13,NULL,NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL DEFAULT '1',
  `dept` int(10) unsigned NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  KEY `roles_parent_foreign` (`parent`),
  KEY `roles_dept_foreign` (`dept`),
  CONSTRAINT `roles_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`),
  CONSTRAINT `roles_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'SUPER_ADMIN','Super Admin','Full Access Role',1,1,NULL,'2017-06-29 08:42:52','2017-06-29 08:42:52'),(2,'WEB_ADMIN','Web Administrator','',1,1,NULL,'2017-07-06 15:30:33','2017-07-06 15:30:33'),(3,'APP_USER','Site User','',1,2,NULL,'2017-07-06 15:31:42','2017-07-06 15:31:42');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialprofiles`
--

DROP TABLE IF EXISTS `socialprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialprofiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialprofiles`
--

LOCK TABLES `socialprofiles` WRITE;
/*!40000 ALTER TABLE `socialprofiles` DISABLE KEYS */;
INSERT INTO `socialprofiles` VALUES (7,NULL,'2017-07-15 21:21:32','2017-07-15 21:21:32','daanv310@gmail.com','google','102366988202587348385','ya29.GluJBIOavfZKIg8ys2am5onSiFNNeFrNPNjkCK-oFuVhawDTAdmtQGKCXQA2fhojqD_U_PlX_yNF2VYAW0D6E98R1xYb5h2vA6H7Jhei11NsnSgbhdTKkci0rVJh'),(8,NULL,'2017-07-15 21:43:54','2017-07-15 21:43:54','daanv310@gmail.com','facebook','240933499758448','EAABeBGlZAJcABAFcNF10MnpQ6pU72cqq4eSjNXsKeCTbADaAB7jQJAH4vd4ub0jGsZCtAKKVjdZCgZCaTscY2NYxZCcbDL65OENJZBsYScJjqNjogVWPZCzmiPXG1tRVYSAHLmA9ZB4wZB9LcrjH8eL2oFyXt1NZAAyZCUBXq4nIRykUrhjfZBqy5te7');
/*!40000 ALTER TABLE `socialprofiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `caption` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `hash` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploads_user_id_foreign` (`user_id`),
  CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useractivationcodes`
--

DROP TABLE IF EXISTS `useractivationcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useractivationcodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(19) COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useractivationcodes`
--

LOCK TABLES `useractivationcodes` WRITE;
/*!40000 ALTER TABLE `useractivationcodes` DISABLE KEYS */;
INSERT INTO `useractivationcodes` VALUES (6,NULL,'2017-07-15 21:03:55','2017-07-15 21:06:36',10,'959037',1500174996);
/*!40000 ALTER TABLE `useractivationcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofiles`
--

DROP TABLE IF EXISTS `userprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userprofiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_birth` date NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `cover_photo_id` int(10) unsigned NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofiles`
--

LOCK TABLES `userprofiles` WRITE;
/*!40000 ALTER TABLE `userprofiles` DISABLE KEYS */;
INSERT INTO `userprofiles` VALUES (2,NULL,'2017-07-15 21:03:55','2017-07-15 21:03:55',10,'1995-01-25','male',0,'','','','',''),(3,NULL,'2017-07-16 20:58:43','2017-08-23 21:08:09',13,'1978-07-20','male',7,'','','','',''),(4,NULL,'2017-08-11 13:07:53','2017-09-03 00:16:51',12,'1987-04-05','male',9,'','','','','33061');
/*!40000 ALTER TABLE `userprofiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `context_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Employee',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `avatar` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'webmaster',1,'webmaster@example.com','$2y$10$aJie2jLY8/0QK7dmCU0EN.ikvFG5kDEG.id.cp6OpA8x5LRZWPY7K','Employee','QhaQJDFMCa7Fw1Sbk6w6qEeqmqYOjsDv3QQRT8qieYzJ1stvBlXjLFTlmLop',NULL,'2017-06-29 08:43:55','2017-08-16 22:28:55','active','default.jpg'),(2,'admin',1,'admin@example.com','$2y$10$U03cD5T49z02fqTtAkMzceFzcqm.l4CwEu2FlOeP1J7Ys3xBWcog6','Employee','2qXibydvCcLqhBSwIKwJssFHxevoIFGua6CfEmlJch4OZ2DOZGiUeWbgO4WT',NULL,'2017-06-29 08:43:55','2017-07-09 17:18:56','active','default.jpg'),(10,'Test User',0,'forward.morning@gmail.com','$2y$10$CA8RN4AkXACmsH8hpm92AuFF7emqqfYa11JmhjA2msCcmrbLinHrW','App User','RArEyklAZ4dJ346KvIFpINTPCmfFsm7MKVgwgKegPmv7ZJVE0ELu8FjxpKsJ',NULL,'2017-07-15 21:03:55','2017-07-15 21:21:08','pending','default.jpg'),(12,'Daan Verboom',0,'daanv310@gmail.com','$2y$10$7acqFO9NbycjOAN4JGIMqOfq74Q1gboJgfr7FAxopj4cmHkOnRoLG','App User','6CP2l0vGQ4MgS2VLKdPPFMc5JnX8A4BaRNfG0D7p8k4ROOwXsMQZZO5D8fgt',NULL,'2017-07-15 21:43:54','2017-08-24 14:24:29','active','daan_verboom1502486573.png'),(13,'Charlie',0,'contact@pherona.com','$2y$10$7BRq/owspFKHVfMw5vmAm.424S7C7T3prgg9AgfLGYKG4RxNXARgi','App User','fSO2xiQf5fytpmspW99lVp4JnbifTi3o9r2HEC7PmuxKnalRjAhasM7101Ut',NULL,'2017-07-16 20:58:43','2017-08-23 15:01:27','active','charlie1502507421.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-03  3:33:07
