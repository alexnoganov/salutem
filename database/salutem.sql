-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: salutem
-- ------------------------------------------------------
-- Server version	8.0.28

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Больница'),(2,'Лаборатория');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,2,25),(26,2,26),(27,2,27),(28,2,28),(29,2,29),(30,2,30),(31,2,31),(32,2,32),(33,2,33),(34,2,34),(35,2,35),(36,2,36),(37,2,37),(38,2,38),(39,2,39),(40,2,40),(41,2,41),(42,2,42),(43,2,43),(44,2,44),(45,2,45),(46,2,46),(47,2,47),(48,2,48),(49,2,49);
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Группа',6,'add_specialistgroup'),(22,'Can change Группа',6,'change_specialistgroup'),(23,'Can delete Группа',6,'delete_specialistgroup'),(24,'Can view Группа',6,'view_specialistgroup'),(25,'Может редактировать таблицы',6,'edit_tables'),(26,'Может добавлять занятие',6,'add_lesson'),(27,'Может добавлять отработку/отмену',6,'add_workout'),(28,'Может просматривать расписание',6,'view_schedule'),(29,'Can add specializations',7,'add_specializations'),(30,'Can change specializations',7,'change_specializations'),(31,'Can delete specializations',7,'delete_specializations'),(32,'Can view specializations',7,'view_specializations'),(33,'Can add Специалист',8,'add_specialists'),(34,'Can change Специалист',8,'change_specialists'),(35,'Can delete Специалист',8,'delete_specialists'),(36,'Can view Специалист',8,'view_specialists'),(37,'Can add analyzes type',9,'add_analyzestype'),(38,'Can change analyzes type',9,'change_analyzestype'),(39,'Can delete analyzes type',9,'delete_analyzestype'),(40,'Can view analyzes type',9,'view_analyzestype'),(41,'Can add patients',10,'add_patients'),(42,'Can change patients',10,'change_patients'),(43,'Can delete patients',10,'delete_patients'),(44,'Can view patients',10,'view_patients'),(45,'Can add analyzes',11,'add_analyzes'),(46,'Can change analyzes',11,'change_analyzes'),(47,'Can delete analyzes',11,'delete_analyzes'),(48,'Can view analyzes',11,'view_analyzes'),(49,'Может редактировать анализы',8,'edit_analyzes');
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_specialists_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_specialists_id` FOREIGN KEY (`user_id`) REFERENCES `user_specialists` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-02-22 21:22:13.035962','1','Кондратенко Виталий Русланович',2,'[{\"changed\": {\"fields\": [\"Last name\", \"First name\", \"\\u041e\\u0442\\u0447\\u0435\\u0441\\u0442\\u0432\\u043e\", \"\\u041f\\u043e\\u043b\", \"\\u0414\\u0430\\u0442\\u0430 \\u0440\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f\", \"\\u0418\\u041d\\u041d\", \"\\u0421\\u0435\\u0440\\u0438\\u044f \\u0438 \\u043d\\u043e\\u043c\\u0435\\u0440 \\u043f\\u0430\\u0441\\u043f\\u043e\\u0440\\u0442\\u0430\", \"\\u041e\\u0431\\u0440\\u0430\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435\", \"Specialization\", \"\\u041d\\u043e\\u043c\\u0435\\u0440 \\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d\\u0430\", \"Photo\"]}}]',8,1),(2,'2022-02-22 21:55:11.591445','2','  ',1,'[{\"added\": {}}]',8,1),(3,'2022-02-22 21:58:25.113757','2','asdasd asdasd asdasdasd',2,'[{\"changed\": {\"fields\": [\"Last name\", \"First name\", \"\\u041e\\u0442\\u0447\\u0435\\u0441\\u0442\\u0432\\u043e\", \"\\u041f\\u043e\\u043b\", \"\\u0414\\u0430\\u0442\\u0430 \\u0440\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f\", \"Specialization\"]}}]',8,1),(4,'2022-02-22 21:59:42.037980','1','Специалисты',1,'[{\"added\": {}}]',6,1),(5,'2022-02-22 21:59:54.387726','2','Лаборатория',1,'[{\"added\": {}}]',6,1),(6,'2022-02-22 22:03:12.744386','1','Больница',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',6,1),(7,'2022-02-22 22:47:05.671877','2','asdasd asdasd asdasdasd',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',8,1),(8,'2022-02-22 22:47:13.033843','2','asdasd asdasd asdasdasd',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',8,1),(9,'2022-02-22 22:52:21.522217','2','Лаборатория',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',6,1),(10,'2022-02-22 23:03:21.250812','2','Лаборатория',2,'[]',6,2),(11,'2022-02-22 23:03:34.423171','2','Лаборатория',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',6,2);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(11,'patients','analyzes'),(9,'patients','analyzestype'),(10,'patients','patients'),(5,'sessions','session'),(6,'user','specialistgroup'),(8,'user','specialists'),(7,'user','specializations');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-02-22 21:18:56.814660'),(2,'contenttypes','0002_remove_content_type_name','2022-02-22 21:18:56.895987'),(3,'auth','0001_initial','2022-02-22 21:18:57.179625'),(4,'auth','0002_alter_permission_name_max_length','2022-02-22 21:18:57.281531'),(5,'auth','0003_alter_user_email_max_length','2022-02-22 21:18:57.288513'),(6,'auth','0004_alter_user_username_opts','2022-02-22 21:18:57.296019'),(7,'auth','0005_alter_user_last_login_null','2022-02-22 21:18:57.301980'),(8,'auth','0006_require_contenttypes_0002','2022-02-22 21:18:57.307965'),(9,'auth','0007_alter_validators_add_error_messages','2022-02-22 21:18:57.314569'),(10,'auth','0008_alter_user_username_max_length','2022-02-22 21:18:57.321526'),(11,'auth','0009_alter_user_last_name_max_length','2022-02-22 21:18:57.328676'),(12,'auth','0010_alter_group_name_max_length','2022-02-22 21:18:57.343752'),(13,'auth','0011_update_proxy_permissions','2022-02-22 21:18:57.351755'),(14,'auth','0012_alter_user_first_name_max_length','2022-02-22 21:18:57.358050'),(15,'user','0001_initial','2022-02-22 21:18:57.839365'),(16,'admin','0001_initial','2022-02-22 21:18:57.988838'),(17,'admin','0002_logentry_remove_auto_add','2022-02-22 21:18:57.997536'),(18,'admin','0003_logentry_add_action_flag_choices','2022-02-22 21:18:58.006512'),(19,'patients','0001_initial','2022-02-22 21:18:58.262441'),(20,'sessions','0001_initial','2022-02-22 21:18:58.300756'),(21,'user','0002_alter_specialistgroup_options_and_more','2022-02-22 23:03:06.689374'),(22,'patients','0002_patients_data_joined','2022-02-23 08:19:46.481039'),(23,'patients','0003_analyzes_result','2022-02-23 12:08:48.039374'),(24,'patients','0004_remove_analyzes_patient_analyzes_patient_and_more','2022-02-23 12:21:32.442139'),(25,'patients','0005_remove_analyzes_patient_analyzes_patient_and_more','2022-02-23 12:23:08.601203'),(26,'patients','0006_alter_analyzes_test_date','2022-02-23 12:26:15.640328');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('vjk8wgd8tidojgwbe6nscnbij54v7cut','.eJxVjDsOwjAQBe_iGlmLE_8o6XMGa23v4gCypTipEHeHSCmgfTPzXiLgtpawdVrCnMVFKHH63SKmB9Ud5DvWW5Op1XWZo9wVedAup5bpeT3cv4OCvXxr9uCSpUE7JD_CgD47sB5itAZ0YmIHZ2VYGdREjMqOzhKzN-CtVijeH981N8Q:1nMe1H:6fbEe0V1JcY8TSHji7kySwmoS-r-Dv3Km-ekmyvv33s','2022-03-08 22:52:31.959709');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients_analyzes`
--

DROP TABLE IF EXISTS `patients_analyzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients_analyzes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `test_date` datetime(6) NOT NULL,
  `date_of_change` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `type_id` bigint NOT NULL,
  `result` longtext,
  `patient_id` bigint NOT NULL,
  `specialist_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patients_analyzes_patient_id_3276294a_fk_patients_patients_id` (`patient_id`),
  KEY `patients_analyzes_specialist_id_9af08899_fk_user_specialists_id` (`specialist_id`),
  KEY `patients_analyzes_type_id_6d1de88d` (`type_id`),
  CONSTRAINT `patients_analyzes_patient_id_3276294a_fk_patients_patients_id` FOREIGN KEY (`patient_id`) REFERENCES `patients_patients` (`id`),
  CONSTRAINT `patients_analyzes_specialist_id_9af08899_fk_user_specialists_id` FOREIGN KEY (`specialist_id`) REFERENCES `user_specialists` (`id`),
  CONSTRAINT `patients_analyzes_type_id_6d1de88d_fk_patients_analyzestype_id` FOREIGN KEY (`type_id`) REFERENCES `patients_analyzestype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_analyzes`
--

LOCK TABLES `patients_analyzes` WRITE;
/*!40000 ALTER TABLE `patients_analyzes` DISABLE KEYS */;
INSERT INTO `patients_analyzes` VALUES (1,'2022-02-22 21:48:00.000000','2022-02-22 21:48:06.973367','Новый',235,'',1,1),(4,'2022-02-23 12:27:00.000000','2022-02-23 12:23:33.146773','Новый',62,NULL,1,2),(5,'2022-02-23 12:27:00.000000','2022-02-23 12:23:56.237993','Новый',62,NULL,1,2),(6,'2022-02-23 12:27:00.000000','2022-02-23 12:24:27.758304','Новый',184,NULL,1,2),(7,'2022-02-23 12:27:00.000000','2022-02-23 12:26:05.927275','Новый',382,NULL,1,2);
/*!40000 ALTER TABLE `patients_analyzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients_analyzestype`
--

DROP TABLE IF EXISTS `patients_analyzestype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients_analyzestype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(240) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_analyzestype`
--

LOCK TABLES `patients_analyzestype` WRITE;
/*!40000 ALTER TABLE `patients_analyzestype` DISABLE KEYS */;
INSERT INTO `patients_analyzestype` VALUES (22,'Coronavirus COVID-19 (РНК реал-тайм ПЦР)'),(23,'25-OH витамин D, суммарный (кальциферол)'),(24,'Взятие мазка из урогенитального тракта'),(26,'Взятие мазка на энтеробиоз'),(27,'Плановый выезд процедурной бригады к пациенту (город)'),(28,'СОЭ'),(29,'Клинический анализ крови без лейкоцитарной формулы'),(30,'Клинический анализ крови с лейкоцитарной формулой (5DIFF)'),(31,'Ретикулоциты'),(32,'Группа крови + Резус-фактор'),(34,'Антитела по системе AB0'),(35,'Определение Kell антигена (K)'),(36,'Определение наличия антигенов эритроцитов C, c, E, e, CW, K и k'),(37,'Фибриноген'),(38,'Протромбин (время, по Квику, МНО)'),(39,'Тромбиновое время'),(40,'АЧТВ'),(41,'Антитромбин III'),(42,'Волчаночный антикоагулянт (скрининг)'),(43,'Д-димер'),(44,'Протеин С'),(45,'Протеин C Global'),(46,'Протеин S'),(47,'Билирубин общий'),(48,'Билирубин прямой'),(50,'Аланинаминотрансфераза (АЛТ)'),(51,'Аспартатаминотрансфераза (АСТ)'),(52,'Щелочная фосфатаза'),(53,'Кислая фосфатаза'),(54,'Гамма-глутамилтрансфераза (ГГТ )'),(55,'Лактатдегидрогеназа (ЛДГ)'),(56,'Лактатдегидрогеназа (ЛДГ) 1, 2 фракции'),(57,'Холинэстераза'),(58,'Альфа-амилаза'),(59,'Липаза'),(60,'Креатинкиназа (КФК)'),(61,'Креатинкиназа-МВ'),(62,'Альбумин'),(63,'Общий белок'),(65,'Креатинин'),(66,'Мочевина'),(67,'Мочевая кислота'),(68,'Миоглобин'),(69,'Тропонин I'),(70,'С-реактивный белок'),(71,'С-реактивный белок ультрачувствительный'),(82,'Анализ крови на аминокислоты 48 показателей'),(83,'РНК норовирусов (Norovirus) I и II типов'),(85,'Забор венозной крови'),(86,'Забор капиллярной крови'),(87,'Антитела к антигену Scl-70 (Анти-Scl-70)'),(88,'Мозговой натрийуретический пептид B (BNP)'),(89,'Гаптоглобин'),(90,'Альфа1-антитрипсин'),(91,'Кислый альфа1-гликопротеин (орозомукоид)'),(92,'Церулоплазмин'),(93,'Эозинофильный катионный белок'),(94,'Ревматоидный фактор'),(95,'Антистрептолизин-О'),(96,'Глюкоза'),(97,'Гликированный гемоглобин А1с'),(98,'Фруктозамин'),(99,'Молочная кислота (лактат)'),(101,'Холестерин общий'),(102,'Холестерин липопротеидов высокой плотности (ЛПВП, HDL)'),(103,'Холестерин липопротеидов низкой плотности (ЛПНП, LDL)'),(104,'Холестерин липопротеидов очень низкой плотности (ЛПОНП)'),(105,'Аполипопротеин А1'),(106,'Аполипопротеин В'),(107,'Липопротеин (а)'),(108,'Гомоцистеин'),(109,'Лептин'),(110,'Натрий, калий, хлор (Na/K/Cl)'),(111,'Кальций общий'),(112,'Кальций ионизированный'),(113,'Магний'),(114,'Фосфор неорганический'),(115,'Цинк'),(116,'Медь'),(117,'Железо'),(118,'Трансферрин'),(120,'Ферритин'),(121,'Эритропоэтин'),(124,'Альфа-амилаза мочи (диастаза)'),(125,'Глюкоза мочи'),(126,'Микроальбумин в разовой порции мочи'),(127,'Бета-2-микроглобулин мочи'),(128,'Дезоксипиридинолин (DPD) мочи'),(129,'Глюкоза мочи'),(130,'Общий белок мочи'),(131,'Микроальбумин мочи'),(132,'Креатинин мочи'),(133,'Проба Реберга'),(134,'Мочевина мочи'),(135,'Мочевая кислота мочи'),(136,'Кальций общий мочи'),(137,'Оксалаты в моче'),(138,'Фосфор неорганический мочи'),(139,'Магний мочи'),(140,'Натрий, калий, хлор мочи (Na/K/Cl)'),(141,'Тиреотропный гормон (ТТГ)'),(142,'Тироксин свободный (Т4 свободный)'),(143,'Трийодтиронин свободный (Т3 свободный)'),(144,'Тироксин общий (Т4 общий)'),(145,'Трийодтиронин общий (Т3 общий)'),(146,'Антитела к тиреоглобулину (Анти-ТГ)'),(147,'Антитела к микросомальной тиреопероксидазе (Анти-ТПО)'),(148,'Антитела к рецепторам тиреотропного гормона (АТ рТТГ)'),(149,'Тиреоглобулин'),(150,'Фолликулостимулирующий гормон (ФСГ)'),(151,'Лютеинизирующий гормон (ЛГ)'),(152,'Пролактин'),(153,'Макропролактин (включает определение пролактина)'),(154,'Эстрадиол (Е2)'),(155,'Прогестерон'),(156,'Гидроксипрогестерон (17-OH-прогестерон)'),(157,'Андростендион'),(158,'Андростендиол глюкуронид'),(159,'Дегидроэпиандростерон сульфат (ДГЭА-сульфат)'),(160,'Тестостерон общий'),(162,'Дигидротестостерон'),(163,'Глобулин, связывающий половые гормоны (ГСПГ, SHBG)'),(164,'Ингибин В'),(165,'Антимюллеров гормон (АМГ, АМН, MiS)'),(166,'Ассоциированный с беременностью протеин А (PAPP-A)'),(167,'Эстриол свободный'),(168,'Общий бета-ХГЧ (диагностика беременности, онкомаркер)'),(169,'Свободная субъединица бета-ХГЧ (пренатальный скрининг)'),(170,'Альфа-фетопротеин (АФП)'),(171,'Плацентарный лактоген'),(172,'Трофобластический бета-1-гликопротеин'),(175,'Паратгормон'),(176,'Кальцитонин'),(177,'Остеокальцин'),(178,'С-концевые телопептиды коллагена I типа (Beta-Cross laps)'),(179,'Инсулин'),(180,'C-пептид'),(181,'Гастрин'),(182,'Соотношение концентраций пепсиногена I и пепсиногена II'),(183,'Ренин'),(184,'Альдостерон'),(185,'Адренокортикотропный гормон (АКТГ)'),(186,'Кортизол'),(187,'Соматотропный гормон роста (СТГ)'),(188,'Соматомедин С (ИФР-I)'),(191,'Кортизол мочи'),(193,'Общие метанефрины и норметанефрины'),(194,'Свободные метанефрины и норметанефрины'),(198,'Раково-эмбриональный антиген (РЭА)'),(199,'Антиген CA 19-9'),(200,'Антиген СА 72-4'),(201,'Антиген СА 242'),(202,'Антиген СА 125'),(203,'Опухолевый маркер НЕ 4'),(205,'Антиген CA 15-3'),(206,'Простатоспецифический антиген (ПСА) общий'),(207,'Простатоспецифический антиген (ПСА) свободный'),(208,'Индекс здоровья простаты (PHI)'),(209,'Антиген плоскоклеточной карциномы (SCCA)'),(210,'Фрагмент цитокератина 19 (Cyfra 21-1)'),(211,'Нейрон-специфическая енолаза (NSE)'),(212,'Бета2-микроглобулин'),(213,'Белок S-100'),(214,'*Специфический антиген рака мочевого пузыря (UBC) в моче'),(215,'Опухолевая пируваткиназа Тu M2 (в кале)'),(217,'РНК вируса гепатита А'),(218,'ДНК вируса гепатита B'),(219,'ДНК вируса гепатита B, количественно'),(220,'РНК вируса гепатита C'),(221,'РНК вируса гепатита C, количественно'),(222,'РНК вируса гепатита C, генотипирование'),(223,'РНК вируса гепатита D'),(224,'РНК вируса гепатита G'),(225,'ДНК вируса простого герпеса I, II типа (Herpes simplex virus I, II)'),(226,'ДНК вируса герпеса VI типа (Human Herpes virus VI)'),(227,'ДНК цитомегаловируса (Citomegalovirus)'),(228,'ДНК цитомегаловируса (Citomegalovirus), количественно'),(229,'ДНК вируса Эпштейна-Барр (Epstein-Barr virus)'),(230,'ДНК вируса Эпштейна-Барр (Epstein-Barr virus), количественно'),(231,'ДНК вируса Варицелла-Зостер (Varicella-Zoster virus)'),(232,'ДНК листерии (Listeria monocytogenes)'),(233,'ДНК пиогенного стрептококка (Streptococcus pyogenes)'),(234,'ДНК токсоплазмы (Toxoplasma gondii)'),(235,'*РНК ВИЧ'),(236,'*РНК ВИЧ, количественно'),(238,'ДНК хламидии (Chlamydia trachomatis)'),(239,'ДНК микоплазмы (Mycoplasma hominis)'),(240,'ДНК микоплазмы (Mycoplasma hominis), количественно'),(241,'ДНК микоплазмы (Mycoplasma genitalium)'),(242,'ДНК микоплазмы (Mycoplasma genitalium), количественно'),(244,'ДНК уреаплазмы (Ureaplasma urealyticum)'),(245,'ДНК уреаплазмы (Ureaplasma urealyticum), количественно'),(246,'ДНК уреаплазмы (Ureaplasma parvum)'),(247,'ДНК уреаплазмы (Ureaplasma parvum), количественно'),(248,'ДНК уреаплазмы (Ureaplasma species)'),(249,'ДНК уреаплазмы (Ureaplasma species), количественно'),(250,'ДНК гарднереллы (Gardnerella vaginalis)'),(251,'ДНК гарднереллы (Gardnerella vaginalis), количественно'),(252,'ДНК гонококка (Neisseria gonorrhoeae)'),(253,'ДНК гонококка (Neisseria gonorrhoeae), количественно'),(254,'ДНК бледной трепонемы (Treponema pallidum)'),(255,'ДНК микобактерии туберкулеза (Mycobacterium tuberculosis)'),(256,'ДНК пиогенного стрептококка (Streptococcus pyogenes)'),(257,'ДНК стрептококков (Streptococcus species)'),(258,'ДНК листерии (Listeria monocytogenes)'),(259,'ДНК кандиды (Candida albicans)'),(260,'ДНК кандиды (Сandida albicans), количественно'),(263,'ДНК токсоплазмы (Toxoplasma gondii)'),(264,'ДНК токсоплазмы (Toxoplasma gondii), количественно'),(265,'ДНК трихомонады (Trichomonas vaginalis)'),(266,'ДНК трихомонады (Trichomonas vaginalis), количественно'),(267,'ДНК цитомегаловируса (Cytomegalovirus, CMV)'),(268,'ДНК цитомегаловируса (Cytomegalovirus, CMV), количественно'),(269,'ДНК вируса простого герпеса I типа (Herpes simplex virus I)'),(275,'ДНК вируса герпеса VI типа (Human Herpes virus VI), количественно'),(276,'ДНК вируса Эпштейна-Барр (Epstein-Barr virus)'),(277,'ДНК вируса Эпштейна-Барр (Epstein-Barr virus), количественно'),(278,'ДНК вируса Варицелла-Зостер (Varicella-Zoster virus)'),(282,'ДНК папилломавируса (Human Papillomavirus, ВПЧ) 16 типа'),(283,'ДНК папилломавируса (Human Papillomavirus, ВПЧ) 18 типа'),(289,'ДНК хеликобактера (Helicobacter pylori)'),(290,'ДНК сальмонелл (Salmonella species)'),(293,'РНК энтеровируса (Enterovirus)'),(294,'РНК ротавирусов (Rotavirus) A и C'),(295,'Антитела к вирусу гепатита А, IgM (Anti-HAV IgM)'),(296,'Антитела к вирусу гепатита А, IgG (Anti-HAV IgG)'),(299,'Антитела к поверхностному антигену вируса гепатита В (Anti-HBs)'),(302,'Антиген HBе вируса гепатита В (HbеAg)'),(303,'Антитела к HBе-антигену вируса гепатита B, суммарные (Anti-HBе)'),(304,'Антитела к вирусу гепатита С, суммарные (Anti-HCV)'),(305,'Антитела к вирусу гепатита C, IgM (Anti-HCV IgM)'),(306,'Антитела к вирусу гепатита D, суммарные (Anti-HDV)'),(307,'Антитела к вирусу гепатита D, IgM (Anti-HDV IgM)'),(308,'Антитела к вирусу гепатита E, IgM (Anti-HEV IgM)'),(309,'Антитела к вирусу гепатита E, IgG (Anti-HEV IgG)'),(310,'ВИЧ (антитела и антигены)'),(311,'Микрореакция на сифилис качественно (RPR)'),(312,'Микрореакция на сифилис, полуколичественно (RPR)'),(315,'Антитела к бледной трепонеме (Treponema pallidum), суммарные'),(316,'Антитела к бледной трепонеме (Treponema pallidum), IgM'),(317,'Антитела к антигенам Т-лимфотропных вирусов (HTLV) 1 и 2 типов'),(328,'Антитела к вирусу герпеса VI типа (Human herpes virus VI), IgG'),(329,'Антитела к вирусу Варицелла-Зостер (Varicella-Zoster), IgM'),(330,'Антитела к вирусу Варицелла-Зостер (Varicella-Zoster), IgA'),(331,'Антитела к вирусу Варицелла-Зостер (Varicella-Zoster), IgG'),(338,'Антитела к вирусу Эпштейна-Барр (Epstein-Barr virus), IgG (иммуноблот)'),(339,'Антитела к цитомегаловирусу (Cytomegalovirus), IgM'),(340,'Антитела к цитомегаловирусу (Cytomegalovirus), IgA'),(341,'Антитела к цитомегаловирусу (Cytomegalovirus), IgG'),(343,'Антитела к цитомегаловирусу (Cytomegalovirus), IgG (иммуноблот)'),(344,'Антитела к вирусу краснухи, IgM'),(345,'Антитела к вирусу краснухи, IgG'),(347,'Антитела к вирусу краснухи, IgG (иммуноблот)'),(348,'Антитела к токсоплазме (Toxoplasma gondii), IgM'),(349,'Антитела к токсоплазме (Toxoplasma gondii), IgA'),(350,'Антитела к токсоплазме (Toxoplasma gondii), IgG'),(352,'Антитела к парвовирусу (Parvovirus) B19, IgM'),(353,'Антитела к парвовирусу (Parvovirus) B19, IgG'),(354,'Антитела к вирусу кори, IgG'),(355,'Антитела к вирусу эпидемического паротита, IgМ'),(356,'Антитела к вирусу эпидемического паротита, IgG'),(357,'Антитела к коклюшному токсину, IgА'),(358,'Антитела к коклюшному токсину, IgG'),(360,'Антитела к Аденовирусу (Adenoviridae), IgM'),(361,'Антитела к Аденовирусу (Adenoviridae), IgA'),(362,'Антитела к Аденовирусу (Adenoviridae), IgG'),(363,'Антитела к возбудителю дифтерии (Corynebacterium diphtheriae)'),(364,'Антитела к возбудителю столбняка (Clostridium tetani)'),(365,'Антитела к хламидии (Chlamydia trachomatis), IgM'),(366,'Антитела к хламидии (Chlamydia trachomatis), IgA'),(367,'Антитела к хламидии (Chlamydia trachomatis), IgG'),(368,'Антитела к хламидофиле (Chlamydophila pneumoniae), IgM'),(369,'Антитела к хламидофиле (Chlamydophila pneumoniae), IgА'),(370,'Антитела к хламидофиле (Chlamydophila pneumoniae), IgG'),(371,'Антитела к микоплазме (Mycoplasma hominis), IgM'),(372,'Антитела к микоплазме (Mycoplasma hominis), IgА'),(373,'Антитела к микоплазме (Mycoplasma hominis), IgG'),(374,'Антитела к микоплазме (Mycoplasma pneumoniae), IgM'),(375,'Антитела к микоплазме (Mycoplasma pneumoniae), IgА'),(376,'Антитела к микоплазме (Mycoplasma pneumoniae), IgG'),(377,'Антитела к уреаплазме (Ureaplasma urealyticum), IgМ'),(378,'Антитела к уреаплазме (Ureaplasma urealyticum), IgА'),(379,'Антитела к уреаплазме (Ureaplasma urealyticum), IgG'),(380,'Антитела к трихомонаде (Trichomonas vaginalis), IgG.'),(381,'Антитела к кандиде (Candida albicans), IgM'),(382,'Антитела к кандиде (Candida albicans), IgA'),(383,'Антитела к кандиде (Candida albicans), IgG'),(384,'Антитела к грибам (Aspergillus fumigatus), IgG'),(385,'Антитела к гарднерелле (Gardnerella vaginalis), IgM'),(386,'Антитела к гарднерелле (Gardnerella vaginalis), IgG'),(388,'Антитела к легионеллам (Legionella pneumophila), суммарные'),(389,'Антитела к пневмоцисте (Pneumocystis carinii), IgМ'),(390,'Антитела к пневмоцисте (Pneumocуstis carinii), IgG'),(391,'Антитела к бруцелле (Brucella), IgА'),(392,'Антитела к бруцелле (Brucella ), IgG'),(393,'Антитела к вирусу клещевого энцефалита, IgM'),(394,'Антитела к вирусу клещевого энцефалита, IgG'),(395,'Антитела к боррелиям (Borrelia burgdorferi), IgM'),(396,'Антитела к боррелиям (Borrelia burgdorferi), IgG'),(397,'Антитела к описторхисам (Opisthorchis felineus), IgM'),(398,'Антитела к описторхисам (Opisthorchis felineus), IgG'),(399,'Антитела к эхинококкам (Echinococcus granulosus), IgG'),(400,'Антитела к токсокарам (Toxocara canis), IgG'),(401,'Антитела к трихинеллам (Trichinella spiralis), IgG'),(402,'Антитела к шистосомам (Schistosoma mansoni), IgG'),(403,'Антитела к угрицам кишечным (Strongyloides stercoralis), IgG'),(404,'Антитела к цистицеркам свиного цепня (Taenia solium), IgG'),(405,'Антитела к печеночным сосальщикам (Fasciola hepatica), IgG'),(406,'Антитела к аскаридам (Ascaris lumbricoides), IgG'),(407,'Антитела к лямблиям (Lamblia intestinalis), суммарные'),(408,'Антитела к лямблиям (Lamblia intestinalis), IgM'),(409,'Антитела к амебе дизентерийной (Entamoeba histolytica), IgG'),(410,'Антитела к лейшмании (Leishmania infantum), суммарные'),(411,'Антитела к хеликобактеру (Helicobacter pylori), IgМ'),(412,'Антитела к хеликобактеру (Helicobacter pylori), IgA'),(413,'Антитела к хеликобактеру (Helicobacter pylori), IgG'),(414,'Антитела к листерии (Listeria monocytogenes)'),(415,'Антитела к шигеллам (Shigella flexneri 1-V, V1, Shigella sonnei)'),(417,'Антитела к сальмонеллам (Salmonella) A, B, C1, C2, D, E'),(418,'Антитела к Vi-aнтигену вобудителя брюшного тифа (Salmonella typhi)'),(419,'Антитела к вирусу Коксаки (Coxsackievirus), IgM'),(420,'Антитела к менингококку (Neisseria meningitidis)'),(439,'Определение онкомаркера p16ink4a'),(443,'Пункционная биопсия мультифокальная'),(445,'Гистологическое исследование пайпель-биопсии эндометрия'),(446,'Иммуногистохимическое исследование (1 антитело)'),(449,'Иммуногистохимическое исследование сложное (11-14 антител)'),(450,'Консультация готового препарата перед ИГХ'),(451,'С3 компонент комплемента'),(452,'С4 компонент комплемента'),(453,'Иммуноглобулин А (IgA)'),(454,'Иммуноглобулин М (IgM)'),(455,'Иммуноглобулин G (IgG)'),(456,'Иммуноглобулин Е (IgE)'),(457,'Фактор некроза опухоли (ФНО-альфа)'),(458,'Криоглобулины, 37°C'),(459,'Циркулирующие иммунные комплексы'),(461,'Фаготест'),(462,'Бактерицидная активность крови'),(464,'Чувствительность к Ингарону'),(465,'Чувствительность к Интрону'),(466,'Чувствительность к Реальдирону'),(467,'Чувствительность к Реаферону'),(468,'Чувствительность к Роферону'),(469,'Чувствительность к Амиксину'),(470,'Чувствительность к Кагоцелу'),(471,'Чувствительность к Неовиру'),(472,'Чувствительность к Ридостину'),(473,'Чувствительность к Циклоферону'),(474,'Чувствительность к Галавиту'),(475,'Чувствительность к Гепону'),(476,'Чувствительность к Иммуналу'),(477,'Чувствительность к Иммунофану'),(478,'Чувствительность к Иммуномаксу'),(479,'Чувствительность к Иммунориксу'),(480,'Чувствительность к Ликопиду'),(481,'Чувствительность к Полиоксидонию'),(482,'Чувствительность к Тактивину'),(483,'Чувствительность к Тимогену'),(484,'Нейтрализующие антитела к Ингарону'),(485,'Нейтрализующие антитела к Интрону'),(486,'Нейтрализующие антитела к Реальдирону'),(487,'Нейтрализующие антитела к Реаферону'),(488,'Нейтрализующие антитела к Роферону'),(491,'Антинуклеарный фактор на клеточной линии HEp-2 (АНФ)'),(492,'Антитела к экстрагируемому нуклеарному АГ (ЭНА/ENA-скрин)'),(493,'Антитела к ядерным антигенам (ANA)'),(494,'Антитела к двуспиральной ДНК (нативной, a-dsDNA)'),(495,'Антитела к односпиральной ДНК (a-ssDNА)');
/*!40000 ALTER TABLE `patients_analyzestype` ENABLE KEYS */;
UNLOCK TABLES;

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
  `photo` varchar(210) DEFAULT NULL,
  `data_joined` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_patients`
--

LOCK TABLES `patients_patients` WRITE;
/*!40000 ALTER TABLE `patients_patients` DISABLE KEYS */;
INSERT INTO `patients_patients` VALUES (1,'Мужчина','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com','photos/patient/02/22/Screenshot_1.png','2022-02-24'),(2,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(3,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(4,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(5,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(6,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(7,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(8,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(9,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(10,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(11,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(12,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(13,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(14,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(15,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23'),(16,'Мужской','Артемий','Леонтев','Алексеевич','2022-02-24','г. Одесса, ул Пушкина 4, кв. 16','II+','380732151156','santa2344@gmail.com',NULL,'2022-02-23');
/*!40000 ALTER TABLE `patients_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_specialistgroup`
--

DROP TABLE IF EXISTS `user_specialistgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_specialistgroup` (
  `group_ptr_id` int NOT NULL,
  PRIMARY KEY (`group_ptr_id`),
  CONSTRAINT `user_specialistgroup_group_ptr_id_857b7999_fk_auth_group_id` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_specialistgroup`
--

LOCK TABLES `user_specialistgroup` WRITE;
/*!40000 ALTER TABLE `user_specialistgroup` DISABLE KEYS */;
INSERT INTO `user_specialistgroup` VALUES (1),(2);
/*!40000 ALTER TABLE `user_specialistgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_specialists`
--

DROP TABLE IF EXISTS `user_specialists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_specialists` (
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
  `patronymic` varchar(100) NOT NULL,
  `photo` varchar(210) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `education` longtext NOT NULL,
  `passport_num` varchar(20) NOT NULL,
  `inn` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `specialization_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `specialization_id` (`specialization_id`),
  CONSTRAINT `user_specialists_specialization_id_71b6f263_fk_user_spec` FOREIGN KEY (`specialization_id`) REFERENCES `user_specializations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_specialists`
--

LOCK TABLES `user_specialists` WRITE;
/*!40000 ALTER TABLE `user_specialists` DISABLE KEYS */;
INSERT INTO `user_specialists` VALUES (1,'pbkdf2_sha256$320000$bfUNgnwJMZPzzMhhWfFLBc$B3M/zTPGZ3Gy+4Wvxz1I9zYEyi4fGGYaMhG5Y1fKeys=','2022-02-22 22:52:00.606721',1,'admin','Виталий','Кондратенко','santa2344@gmail.com',1,1,'2022-02-22 21:20:14.392571','Русланович','photos/specialists/Screenshot_1_OxepLub.png','07325151165','Мужской','Младший специалист','КН939393','1238761627883671','2002-08-07',230),(2,'pbkdf2_sha256$320000$N8OF4bRREVuPTJ9SFMF2Um$pwlz32bd9nYIM8okwVsB+vCj8MzUiBziSabJWI+qdZ4=','2022-02-22 22:52:31.956796',0,'laborant','asdasd','asdasd','asdasd@gmail.com',1,1,'2022-02-22 21:55:11.434011','asdasdasd','','','Мужской','','','','2022-02-22',229);
/*!40000 ALTER TABLE `user_specialists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_specialists_groups`
--

DROP TABLE IF EXISTS `user_specialists_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_specialists_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `specialists_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_specialists_groups_specialists_id_group_id_308cac88_uniq` (`specialists_id`,`group_id`),
  KEY `user_specialists_groups_group_id_7be97558_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_specialists_gro_specialists_id_985a802f_fk_user_spec` FOREIGN KEY (`specialists_id`) REFERENCES `user_specialists` (`id`),
  CONSTRAINT `user_specialists_groups_group_id_7be97558_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_specialists_groups`
--

LOCK TABLES `user_specialists_groups` WRITE;
/*!40000 ALTER TABLE `user_specialists_groups` DISABLE KEYS */;
INSERT INTO `user_specialists_groups` VALUES (1,2,2);
/*!40000 ALTER TABLE `user_specialists_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_specialists_user_permissions`
--

DROP TABLE IF EXISTS `user_specialists_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_specialists_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `specialists_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_specialists_user_pe_specialists_id_permissio_00edfab4_uniq` (`specialists_id`,`permission_id`),
  KEY `user_specialists_use_permission_id_536ecc98_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_specialists_use_permission_id_536ecc98_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_specialists_use_specialists_id_1828460b_fk_user_spec` FOREIGN KEY (`specialists_id`) REFERENCES `user_specialists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_specialists_user_permissions`
--

LOCK TABLES `user_specialists_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_specialists_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_specialists_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_specializations`
--

DROP TABLE IF EXISTS `user_specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_specializations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_specializations`
--

LOCK TABLES `user_specializations` WRITE;
/*!40000 ALTER TABLE `user_specializations` DISABLE KEYS */;
INSERT INTO `user_specializations` VALUES (115,'врач по авиационной и космичес'),(116,'врач-акушер-гинеколог;'),(117,'врач-акушер-гинеколог цехового'),(118,'врач-аллерголог-иммунолог;'),(119,'врач-анестезиолог-реаниматолог'),(120,'врач-бактериолог;'),(121,'врач-вирусолог;'),(122,'врач-гастроэнтеролог;'),(123,'врач-гематолог;'),(124,'врач-генетик;'),(125,'врач-гериатр;'),(126,'врач-дезинфектолог;'),(127,'врач-дерматовенеролог;'),(128,'врач-детский кардиолог;'),(129,'врач-детский онколог;'),(130,'врач-детский уролог-андролог;'),(131,'врач-детский хирург;'),(132,'врач-детский эндокринолог;'),(133,'врач-диабетолог;'),(134,'врач-диетолог;'),(135,'врач здравпункта;'),(136,'врач-инфекционист;'),(137,'врач-кардиолог;'),(138,'врач клинической лабораторной '),(139,'врач-клинический миколог;'),(140,'врач-клинический фармаколог;'),(141,'врач-колопроктолог;'),(142,'врач-косметолог;'),(143,'врач-лаборант;*'),(144,'врач-лабораторный генетик;'),(145,'врач-лабораторный миколог;'),(146,'врач мануальной терапии;'),(147,'врач-методист;'),(148,'врач-невролог;'),(149,'врач-нейрохирург;'),(150,'врач-неонатолог;'),(151,'врач-нефролог;'),(152,'врач общей практики (семейный '),(153,'врач-онколог;'),(154,'врач-ортодонт;'),(155,'врач-оториноларинголог;'),(156,'врач-офтальмолог;'),(157,'врач-офтальмолог-протезист;'),(158,'врач-паразитолог;'),(159,'врач-патологоанатом;'),(160,'врач-педиатр;'),(161,'врач-педиатр городской (районн'),(162,'врач-педиатр участковый;'),(163,'врач-пластический хирург;'),(164,'врач по водолазной медицине;'),(165,'врач по восстановительной меди'),(166,'врач по гигиене детей и подрос'),(167,'врач по гигиене питания;'),(168,'врач по гигиене труда;'),(169,'врач по гигиеническому воспита'),(170,'врач по коммунальной гигиене;'),(171,'врач по лечебной физкультуре;'),(172,'врач по медико-социальной эксп'),(173,'врач по общей гигиене;'),(174,'врач по радиационной гигиене;'),(175,'врач по рентгенэндоваскулярным'),(176,'врач по санитарно-гигиенически'),(177,'врач по спортивной медицине;'),(178,'врач приемного отделения;'),(179,'врач-профпатолог;'),(180,'врач-психиатр;'),(181,'врач-психиатр участковый;'),(182,'врач-психиатр детский;'),(183,'врач-психиатр детский участков'),(184,'врач-психиатр подростковый;'),(185,'врач-психиатр подростковый уча'),(186,'врач-психиатр-нарколог;'),(187,'врач-психиатр-нарколог участко'),(188,'врач-психотерапевт;'),(189,'врач-пульмонолог;'),(190,'врач-радиолог;'),(191,'врач-радиотерапевт;'),(192,'врач-ревматолог;'),(193,'врач-рентгенолог;'),(194,'врач-рефлексотерапевт;'),(195,'врач-сексолог;'),(196,'врач-сердечно-сосудистый хирур'),(197,'врач скорой медицинской помощи'),(198,'врач-статистик;'),(199,'врач-стоматолог;'),(200,'врач-стоматолог детский;'),(201,'врач-стоматолог-ортопед;'),(202,'врач-стоматолог-терапевт;'),(203,'врач-стоматолог-хирург;'),(204,'врач-судебно-медицинский экспе'),(205,'врач-судебно-психиатрический э'),(206,'врач-сурдолог-оториноларинголо'),(207,'врач-сурдолог-протезист;'),(208,'врач-терапевт;'),(209,'врач-терапевт подростковый;'),(210,'врач-терапевт участковый;'),(211,'врач-терапевт участковый цехов'),(212,'врач-токсиколог;'),(213,'врач-торакальный хирург;'),(214,'врач-травматолог-ортопед;'),(215,'врач-трансфузиолог;'),(216,'врач ультразвуковой диагностик'),(217,'врач-уролог;'),(218,'врач-физиотерапевт;'),(219,'врач-фтизиатр;'),(220,'врач-фтизиатр участковый;'),(221,'врач функциональной диагностик'),(222,'врач-хирург;'),(223,'врач-челюстно-лицевой хирург;'),(224,'врач-эндокринолог;'),(225,'врач-эндоскопист;'),(226,'врач-эпидемиолог;'),(227,'старший врач станции (отделени'),(228,'старший врач станции (отделени'),(229,'врач клинической лабораторной диагностики'),(230,'глав-врач');
/*!40000 ALTER TABLE `user_specializations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-23 14:37:09
