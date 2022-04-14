-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "auth_group" -----------------------------------
CREATE TABLE `auth_group`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `name` UNIQUE( `name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "auth_group_permissions" -----------------------
CREATE TABLE `auth_group_permissions`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`group_id` Int( 0 ) NOT NULL,
	`permission_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` UNIQUE( `group_id`, `permission_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "auth_permission" ------------------------------
CREATE TABLE `auth_permission`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`content_type_id` Int( 0 ) NOT NULL,
	`codename` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_permission_content_type_id_codename_01ab375a_uniq` UNIQUE( `content_type_id`, `codename` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 62;
-- -------------------------------------------------------------


-- CREATE TABLE "django_admin_log" -----------------------------
CREATE TABLE `django_admin_log`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`action_time` DateTime NOT NULL,
	`object_id` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`object_repr` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`action_flag` SmallInt( 0 ) UNSIGNED NOT NULL,
	`change_message` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`content_type_id` Int( 0 ) NULL DEFAULT NULL,
	`user_id` BigInt( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "django_content_type" --------------------------
CREATE TABLE `django_content_type`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`app_label` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`model` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `django_content_type_app_label_model_76bd3d3b_uniq` UNIQUE( `app_label`, `model` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 16;
-- -------------------------------------------------------------


-- CREATE TABLE "django_migrations" ----------------------------
CREATE TABLE `django_migrations`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`app` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`applied` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 28;
-- -------------------------------------------------------------


-- CREATE TABLE "django_session" -------------------------------
CREATE TABLE `django_session`( 
	`session_key` VarChar( 40 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`session_data` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`expire_date` DateTime NOT NULL,
	PRIMARY KEY ( `session_key` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "medicalcard_medicalcard" ----------------------
CREATE TABLE `medicalcard_medicalcard`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`purpose` VarChar( 300 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`symptoms` VarChar( 300 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`treatment` VarChar( 500 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`date` DateTime NOT NULL,
	`patient_id` BigInt( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "patients_analyzes" ----------------------------
CREATE TABLE `patients_analyzes`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`date` DateTime NOT NULL,
	`date_of_change` DateTime NOT NULL,
	`result` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`status` VarChar( 20 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`show` TinyInt( 1 ) NOT NULL,
	`patient_id` BigInt( 0 ) NOT NULL,
	`specialist_id` BigInt( 0 ) NOT NULL,
	`type_id` BigInt( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "patients_analyzestype" ------------------------
CREATE TABLE `patients_analyzestype`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`title` VarChar( 240 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 496;
-- -------------------------------------------------------------


-- CREATE TABLE "patients_patients" ----------------------------
CREATE TABLE `patients_patients`( 
	`data_joined` Date NOT NULL,
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`Sex` VarChar( 20 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Name` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Surname` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Patronymic` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Date_of_birth` Date NOT NULL,
	`Place_of_residence` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Blood_type` VarChar( 10 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Telephone` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`Email` VarChar( 30 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`photo` VarChar( 210 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "sicklist_sicklist" ----------------------------
CREATE TABLE `sicklist_sicklist`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`dateIssue` DateTime NOT NULL,
	`md_organization` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`address_of_md_organization` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`orgn` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`disability_code` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`disability_code_addit` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`place_of_work` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`based` TinyInt( 1 ) NOT NULL,
	`currently` TinyInt( 1 ) NOT NULL,
	`number_work` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`public_organizations` TinyInt( 1 ) NOT NULL,
	`from_what_date` DateTime NOT NULL,
	`by_what_number` DateTime NOT NULL,
	`patient_id` BigInt( 0 ) NOT NULL,
	`specialist_id` BigInt( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "timetable_timetable" --------------------------
CREATE TABLE `timetable_timetable`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`date` DateTime NOT NULL,
	`patient_id` BigInt( 0 ) NOT NULL,
	`specialist_id` BigInt( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "user_specialistgroup" -------------------------
CREATE TABLE `user_specialistgroup`( 
	`group_ptr_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `group_ptr_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "user_specialists" -----------------------------
CREATE TABLE `user_specialists`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`password` VarChar( 128 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`last_login` DateTime NULL DEFAULT NULL,
	`is_superuser` TinyInt( 1 ) NOT NULL,
	`username` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`is_staff` TinyInt( 1 ) NOT NULL,
	`is_active` TinyInt( 1 ) NOT NULL,
	`date_joined` DateTime NOT NULL,
	`first_name` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`last_name` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`email` VarChar( 254 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`patronymic` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`photo` VarChar( 210 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`phone` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`sex` VarChar( 20 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`place_of_residence` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`education` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`passport_num` VarChar( 20 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`inn` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`date_of_birth` Date NULL DEFAULT NULL,
	`last_activity` DateTime NULL DEFAULT NULL,
	`specialization_id` BigInt( 0 ) NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `username` UNIQUE( `username` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------


-- CREATE TABLE "user_specialists_groups" ----------------------
CREATE TABLE `user_specialists_groups`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`specialists_id` BigInt( 0 ) NOT NULL,
	`group_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `user_specialists_groups_specialists_id_group_id_308cac88_uniq` UNIQUE( `specialists_id`, `group_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "user_specialists_user_permissions" ------------
CREATE TABLE `user_specialists_user_permissions`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`specialists_id` BigInt( 0 ) NOT NULL,
	`permission_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `user_specialists_user_pe_specialists_id_permissio_00edfab4_uniq` UNIQUE( `specialists_id`, `permission_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "user_specialistsactivity" ---------------------
CREATE TABLE `user_specialistsactivity`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`date` Date NOT NULL,
	`start_time` Time NULL DEFAULT NULL,
	`end_time` Time NULL DEFAULT NULL,
	`specialist_id` BigInt( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "user_specializations" -------------------------
CREATE TABLE `user_specializations`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`title` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 231;
-- -------------------------------------------------------------


-- Dump data of "auth_group" -------------------------------
BEGIN;

INSERT INTO `auth_group`(`id`,`name`) VALUES 
( '1', 'Лаборатория' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "auth_group_permissions" -------------------
BEGIN;

INSERT INTO `auth_group_permissions`(`id`,`group_id`,`permission_id`) VALUES 
( '1', '1', '25' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "auth_permission" --------------------------
BEGIN;

INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES 
( '1', 'Can add log entry', '1', 'add_logentry' ),
( '2', 'Can change log entry', '1', 'change_logentry' ),
( '3', 'Can delete log entry', '1', 'delete_logentry' ),
( '4', 'Can view log entry', '1', 'view_logentry' ),
( '5', 'Can add permission', '2', 'add_permission' ),
( '6', 'Can change permission', '2', 'change_permission' ),
( '7', 'Can delete permission', '2', 'delete_permission' ),
( '8', 'Can view permission', '2', 'view_permission' ),
( '9', 'Can add group', '3', 'add_group' ),
( '10', 'Can change group', '3', 'change_group' ),
( '11', 'Can delete group', '3', 'delete_group' ),
( '12', 'Can view group', '3', 'view_group' ),
( '13', 'Can add content type', '4', 'add_contenttype' ),
( '14', 'Can change content type', '4', 'change_contenttype' ),
( '15', 'Can delete content type', '4', 'delete_contenttype' ),
( '16', 'Can view content type', '4', 'view_contenttype' ),
( '17', 'Can add session', '5', 'add_session' ),
( '18', 'Can change session', '5', 'change_session' ),
( '19', 'Can delete session', '5', 'delete_session' ),
( '20', 'Can view session', '5', 'view_session' ),
( '21', 'Can add Специалист', '6', 'add_specialists' ),
( '22', 'Can change Специалист', '6', 'change_specialists' ),
( '23', 'Can delete Специалист', '6', 'delete_specialists' ),
( '24', 'Can view Специалист', '6', 'view_specialists' ),
( '25', 'Может редактировать анализы', '6', 'edit_analyzes' ),
( '26', 'Can add Группа', '7', 'add_specialistgroup' ),
( '27', 'Can change Группа', '7', 'change_specialistgroup' ),
( '28', 'Can delete Группа', '7', 'delete_specialistgroup' ),
( '29', 'Can view Группа', '7', 'view_specialistgroup' ),
( '30', 'Can add specializations', '8', 'add_specializations' ),
( '31', 'Can change specializations', '8', 'change_specializations' ),
( '32', 'Can delete specializations', '8', 'delete_specializations' ),
( '33', 'Can view specializations', '8', 'view_specializations' ),
( '34', 'Can add specialists activity', '9', 'add_specialistsactivity' ),
( '35', 'Can change specialists activity', '9', 'change_specialistsactivity' ),
( '36', 'Can delete specialists activity', '9', 'delete_specialistsactivity' ),
( '37', 'Can view specialists activity', '9', 'view_specialistsactivity' ),
( '38', 'Can add analyzes type', '10', 'add_analyzestype' ),
( '39', 'Can change analyzes type', '10', 'change_analyzestype' ),
( '40', 'Can delete analyzes type', '10', 'delete_analyzestype' ),
( '41', 'Can view analyzes type', '10', 'view_analyzestype' ),
( '42', 'Can add patients', '11', 'add_patients' ),
( '43', 'Can change patients', '11', 'change_patients' ),
( '44', 'Can delete patients', '11', 'delete_patients' ),
( '45', 'Can view patients', '11', 'view_patients' ),
( '46', 'Can add analyzes', '12', 'add_analyzes' ),
( '47', 'Can change analyzes', '12', 'change_analyzes' ),
( '48', 'Can delete analyzes', '12', 'delete_analyzes' ),
( '49', 'Can view analyzes', '12', 'view_analyzes' ),
( '50', 'Can add medical card', '13', 'add_medicalcard' ),
( '51', 'Can change medical card', '13', 'change_medicalcard' ),
( '52', 'Can delete medical card', '13', 'delete_medicalcard' ),
( '53', 'Can view medical card', '13', 'view_medicalcard' ),
( '54', 'Can add time table', '14', 'add_timetable' ),
( '55', 'Can change time table', '14', 'change_timetable' ),
( '56', 'Can delete time table', '14', 'delete_timetable' ),
( '57', 'Can view time table', '14', 'view_timetable' ),
( '58', 'Can add sick list', '15', 'add_sicklist' ),
( '59', 'Can change sick list', '15', 'change_sicklist' ),
( '60', 'Can delete sick list', '15', 'delete_sicklist' ),
( '61', 'Can view sick list', '15', 'view_sicklist' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "django_admin_log" -------------------------
BEGIN;

INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES 
( '1', '2022-04-14 17:59:54.089388', '1', 'Лаборатория', '1', '[{"added": {}}]', '7', '2' ),
( '2', '2022-04-14 18:00:11.778175', '7', 'test test test (Врач-уролог)', '2', '[{"changed": {"fields": ["Groups"]}}]', '6', '2' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "django_content_type" ----------------------
BEGIN;

INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES 
( '1', 'admin', 'logentry' ),
( '3', 'auth', 'group' ),
( '2', 'auth', 'permission' ),
( '4', 'contenttypes', 'contenttype' ),
( '13', 'medicalCard', 'medicalcard' ),
( '12', 'patients', 'analyzes' ),
( '10', 'patients', 'analyzestype' ),
( '11', 'patients', 'patients' ),
( '5', 'sessions', 'session' ),
( '15', 'sicklist', 'sicklist' ),
( '14', 'timetable', 'timetable' ),
( '7', 'user', 'specialistgroup' ),
( '6', 'user', 'specialists' ),
( '9', 'user', 'specialistsactivity' ),
( '8', 'user', 'specializations' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "django_migrations" ------------------------
BEGIN;

INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES 
( '1', 'contenttypes', '0001_initial', '2022-04-14 16:45:25.875655' ),
( '2', 'contenttypes', '0002_remove_content_type_name', '2022-04-14 16:45:26.014321' ),
( '3', 'auth', '0001_initial', '2022-04-14 16:45:26.348621' ),
( '4', 'auth', '0002_alter_permission_name_max_length', '2022-04-14 16:45:26.424603' ),
( '5', 'auth', '0003_alter_user_email_max_length', '2022-04-14 16:45:26.431584' ),
( '6', 'auth', '0004_alter_user_username_opts', '2022-04-14 16:45:26.440561' ),
( '7', 'auth', '0005_alter_user_last_login_null', '2022-04-14 16:45:26.448539' ),
( '8', 'auth', '0006_require_contenttypes_0002', '2022-04-14 16:45:26.452529' ),
( '9', 'auth', '0007_alter_validators_add_error_messages', '2022-04-14 16:45:26.459510' ),
( '10', 'auth', '0008_alter_user_username_max_length', '2022-04-14 16:45:26.468487' ),
( '11', 'auth', '0009_alter_user_last_name_max_length', '2022-04-14 16:45:26.475468' ),
( '12', 'auth', '0010_alter_group_name_max_length', '2022-04-14 16:45:26.491771' ),
( '13', 'auth', '0011_update_proxy_permissions', '2022-04-14 16:45:26.499752' ),
( '14', 'auth', '0012_alter_user_first_name_max_length', '2022-04-14 16:45:26.506733' ),
( '15', 'user', '0001_initial', '2022-04-14 16:45:27.271248' ),
( '16', 'admin', '0001_initial', '2022-04-14 16:45:27.449466' ),
( '17', 'admin', '0002_logentry_remove_auto_add', '2022-04-14 16:45:27.460436' ),
( '18', 'admin', '0003_logentry_add_action_flag_choices', '2022-04-14 16:45:27.469412' ),
( '19', 'patients', '0001_initial', '2022-04-14 16:45:27.618394' ),
( '20', 'medicalCard', '0001_initial', '2022-04-14 16:45:27.651814' ),
( '21', 'medicalCard', '0002_initial', '2022-04-14 16:45:27.740655' ),
( '22', 'patients', '0002_initial', '2022-04-14 16:45:27.890411' ),
( '23', 'sessions', '0001_initial', '2022-04-14 16:45:27.939312' ),
( '24', 'sicklist', '0001_initial', '2022-04-14 16:45:28.050786' ),
( '25', 'sicklist', '0002_initial', '2022-04-14 16:45:28.138695' ),
( '26', 'timetable', '0001_initial', '2022-04-14 16:45:28.244423' ),
( '27', 'timetable', '0002_initial', '2022-04-14 16:45:28.318226' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "django_session" ---------------------------
BEGIN;

INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES 
( 'km4x7mtb5d6gn5sl1z7lyhh5clfcbe0x', '.eJxVjEEOgjAQRe_StWlKmeLUpXvOQGY6g0VNSSisjHdXEha6_e-9_zIDbWsetqrLMIm5GG9OvxtTemjZgdyp3Gab5rIuE9tdsQettp9Fn9fD_TvIVPO3BiUM4qPTiKARmojOBxg7bWMTxPnzSCyMqImjUisdJ2BgQsBmFGfeH9xKOEM:1nf11U:fOJTF9OTcU3J3LJBKtp01L32IN_jrjWGpOdKhRbJwL4', '2022-04-28 18:04:40.704691' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "medicalcard_medicalcard" ------------------
BEGIN;

INSERT INTO `medicalcard_medicalcard`(`id`,`purpose`,`symptoms`,`treatment`,`date`,`patient_id`) VALUES 
( '1', 'Проверка горла', 'Кашель', '', '2022-04-14 16:56:24.706036', '1' ),
( '2', '123312', '123!123!123!123', '', '2022-04-14 17:57:24.182476', '1' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "patients_analyzes" ------------------------
BEGIN;

INSERT INTO `patients_analyzes`(`id`,`date`,`date_of_change`,`result`,`status`,`show`,`patient_id`,`specialist_id`,`type_id`) VALUES 
( '1', '2022-04-14 19:56:00.000000', '2022-04-14 18:01:22.804721', 'Заболеваний не найдено. Вы здоровы.', 'Завершен', '1', '1', '2', '235' ),
( '2', '2022-04-24 17:55:00.000000', '2022-04-14 17:56:01.205820', NULL, 'Новый', '1', '1', '2', '408' ),
( '3', '2022-04-26 17:55:00.000000', '2022-04-14 18:00:53.610966', '', 'В процессе', '1', '1', '2', '386' ),
( '4', '2022-05-05 17:55:00.000000', '2022-04-14 18:00:57.800057', '', 'В процессе', '1', '1', '2', '411' ),
( '5', '2022-04-23 18:06:00.000000', '2022-04-14 18:06:28.396758', NULL, 'Новый', '1', '7', '2', '22' ),
( '6', '2022-04-21 18:06:00.000000', '2022-04-14 18:06:33.507724', NULL, 'Новый', '1', '7', '2', '184' ),
( '7', '2022-04-21 20:06:00.000000', '2022-04-14 18:06:41.612708', NULL, 'Новый', '1', '7', '2', '62' ),
( '8', '2022-04-21 00:06:00.000000', '2022-04-14 18:06:47.446912', NULL, 'Новый', '1', '7', '2', '307' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "patients_analyzestype" --------------------
BEGIN;

INSERT INTO `patients_analyzestype`(`id`,`title`) VALUES 
( '22', 'Coronavirus COVID-19 (РНК реал-тайм ПЦР)' ),
( '23', '25-OH витамин D, суммарный (кальциферол)' ),
( '24', 'Взятие мазка из урогенитального тракта' ),
( '26', 'Взятие мазка на энтеробиоз' ),
( '27', 'Плановый выезд процедурной бригады к пациенту (город)' ),
( '28', 'СОЭ' ),
( '29', 'Клинический анализ крови без лейкоцитарной формулы' ),
( '30', 'Клинический анализ крови с лейкоцитарной формулой (5DIFF)' ),
( '31', 'Ретикулоциты' ),
( '32', 'Группа крови + Резус-фактор' ),
( '34', 'Антитела по системе AB0' ),
( '35', 'Определение Kell антигена (K)' ),
( '36', 'Определение наличия антигенов эритроцитов C, c, E, e, CW, K и k' ),
( '37', 'Фибриноген' ),
( '38', 'Протромбин (время, по Квику, МНО)' ),
( '39', 'Тромбиновое время' ),
( '40', 'АЧТВ' ),
( '41', 'Антитромбин III' ),
( '42', 'Волчаночный антикоагулянт (скрининг)' ),
( '43', 'Д-димер' ),
( '44', 'Протеин С' ),
( '45', 'Протеин C Global' ),
( '46', 'Протеин S' ),
( '47', 'Билирубин общий' ),
( '48', 'Билирубин прямой' ),
( '50', 'Аланинаминотрансфераза (АЛТ)' ),
( '51', 'Аспартатаминотрансфераза (АСТ)' ),
( '52', 'Щелочная фосфатаза' ),
( '53', 'Кислая фосфатаза' ),
( '54', 'Гамма-глутамилтрансфераза (ГГТ )' ),
( '55', 'Лактатдегидрогеназа (ЛДГ)' ),
( '56', 'Лактатдегидрогеназа (ЛДГ) 1, 2 фракции' ),
( '57', 'Холинэстераза' ),
( '58', 'Альфа-амилаза' ),
( '59', 'Липаза' ),
( '60', 'Креатинкиназа (КФК)' ),
( '61', 'Креатинкиназа-МВ' ),
( '62', 'Альбумин' ),
( '63', 'Общий белок' ),
( '65', 'Креатинин' ),
( '66', 'Мочевина' ),
( '67', 'Мочевая кислота' ),
( '68', 'Миоглобин' ),
( '69', 'Тропонин I' ),
( '70', 'С-реактивный белок' ),
( '71', 'С-реактивный белок ультрачувствительный' ),
( '82', 'Анализ крови на аминокислоты 48 показателей' ),
( '83', 'РНК норовирусов (Norovirus) I и II типов' ),
( '85', 'Забор венозной крови' ),
( '86', 'Забор капиллярной крови' ),
( '87', 'Антитела к антигену Scl-70 (Анти-Scl-70)' ),
( '88', 'Мозговой натрийуретический пептид B (BNP)' ),
( '89', 'Гаптоглобин' ),
( '90', 'Альфа1-антитрипсин' ),
( '91', 'Кислый альфа1-гликопротеин (орозомукоид)' ),
( '92', 'Церулоплазмин' ),
( '93', 'Эозинофильный катионный белок' ),
( '94', 'Ревматоидный фактор' ),
( '95', 'Антистрептолизин-О' ),
( '96', 'Глюкоза' ),
( '97', 'Гликированный гемоглобин А1с' ),
( '98', 'Фруктозамин' ),
( '99', 'Молочная кислота (лактат)' ),
( '101', 'Холестерин общий' ),
( '102', 'Холестерин липопротеидов высокой плотности (ЛПВП, HDL)' ),
( '103', 'Холестерин липопротеидов низкой плотности (ЛПНП, LDL)' ),
( '104', 'Холестерин липопротеидов очень низкой плотности (ЛПОНП)' ),
( '105', 'Аполипопротеин А1' ),
( '106', 'Аполипопротеин В' ),
( '107', 'Липопротеин (а)' ),
( '108', 'Гомоцистеин' ),
( '109', 'Лептин' ),
( '110', 'Натрий, калий, хлор (Na/K/Cl)' ),
( '111', 'Кальций общий' ),
( '112', 'Кальций ионизированный' ),
( '113', 'Магний' ),
( '114', 'Фосфор неорганический' ),
( '115', 'Цинк' ),
( '116', 'Медь' ),
( '117', 'Железо' ),
( '118', 'Трансферрин' ),
( '120', 'Ферритин' ),
( '121', 'Эритропоэтин' ),
( '124', 'Альфа-амилаза мочи (диастаза)' ),
( '125', 'Глюкоза мочи' ),
( '126', 'Микроальбумин в разовой порции мочи' ),
( '127', 'Бета-2-микроглобулин мочи' ),
( '128', 'Дезоксипиридинолин (DPD) мочи' ),
( '129', 'Глюкоза мочи' ),
( '130', 'Общий белок мочи' ),
( '131', 'Микроальбумин мочи' ),
( '132', 'Креатинин мочи' ),
( '133', 'Проба Реберга' ),
( '134', 'Мочевина мочи' ),
( '135', 'Мочевая кислота мочи' ),
( '136', 'Кальций общий мочи' ),
( '137', 'Оксалаты в моче' ),
( '138', 'Фосфор неорганический мочи' ),
( '139', 'Магний мочи' ),
( '140', 'Натрий, калий, хлор мочи (Na/K/Cl)' ),
( '141', 'Тиреотропный гормон (ТТГ)' ),
( '142', 'Тироксин свободный (Т4 свободный)' ),
( '143', 'Трийодтиронин свободный (Т3 свободный)' ),
( '144', 'Тироксин общий (Т4 общий)' ),
( '145', 'Трийодтиронин общий (Т3 общий)' ),
( '146', 'Антитела к тиреоглобулину (Анти-ТГ)' ),
( '147', 'Антитела к микросомальной тиреопероксидазе (Анти-ТПО)' ),
( '148', 'Антитела к рецепторам тиреотропного гормона (АТ рТТГ)' ),
( '149', 'Тиреоглобулин' ),
( '150', 'Фолликулостимулирующий гормон (ФСГ)' ),
( '151', 'Лютеинизирующий гормон (ЛГ)' ),
( '152', 'Пролактин' ),
( '153', 'Макропролактин (включает определение пролактина)' ),
( '154', 'Эстрадиол (Е2)' ),
( '155', 'Прогестерон' ),
( '156', 'Гидроксипрогестерон (17-OH-прогестерон)' ),
( '157', 'Андростендион' ),
( '158', 'Андростендиол глюкуронид' ),
( '159', 'Дегидроэпиандростерон сульфат (ДГЭА-сульфат)' ),
( '160', 'Тестостерон общий' ),
( '162', 'Дигидротестостерон' ),
( '163', 'Глобулин, связывающий половые гормоны (ГСПГ, SHBG)' ),
( '164', 'Ингибин В' ),
( '165', 'Антимюллеров гормон (АМГ, АМН, MiS)' ),
( '166', 'Ассоциированный с беременностью протеин А (PAPP-A)' ),
( '167', 'Эстриол свободный' ),
( '168', 'Общий бета-ХГЧ (диагностика беременности, онкомаркер)' ),
( '169', 'Свободная субъединица бета-ХГЧ (пренатальный скрининг)' ),
( '170', 'Альфа-фетопротеин (АФП)' ),
( '171', 'Плацентарный лактоген' ),
( '172', 'Трофобластический бета-1-гликопротеин' ),
( '175', 'Паратгормон' ),
( '176', 'Кальцитонин' ),
( '177', 'Остеокальцин' ),
( '178', 'С-концевые телопептиды коллагена I типа (Beta-Cross laps)' ),
( '179', 'Инсулин' ),
( '180', 'C-пептид' ),
( '181', 'Гастрин' ),
( '182', 'Соотношение концентраций пепсиногена I и пепсиногена II' ),
( '183', 'Ренин' ),
( '184', 'Альдостерон' ),
( '185', 'Адренокортикотропный гормон (АКТГ)' ),
( '186', 'Кортизол' ),
( '187', 'Соматотропный гормон роста (СТГ)' ),
( '188', 'Соматомедин С (ИФР-I)' ),
( '191', 'Кортизол мочи' ),
( '193', 'Общие метанефрины и норметанефрины' ),
( '194', 'Свободные метанефрины и норметанефрины' ),
( '198', 'Раково-эмбриональный антиген (РЭА)' ),
( '199', 'Антиген CA 19-9' ),
( '200', 'Антиген СА 72-4' ),
( '201', 'Антиген СА 242' ),
( '202', 'Антиген СА 125' ),
( '203', 'Опухолевый маркер НЕ 4' ),
( '205', 'Антиген CA 15-3' ),
( '206', 'Простатоспецифический антиген (ПСА) общий' ),
( '207', 'Простатоспецифический антиген (ПСА) свободный' ),
( '208', 'Индекс здоровья простаты (PHI)' ),
( '209', 'Антиген плоскоклеточной карциномы (SCCA)' ),
( '210', 'Фрагмент цитокератина 19 (Cyfra 21-1)' ),
( '211', 'Нейрон-специфическая енолаза (NSE)' ),
( '212', 'Бета2-микроглобулин' ),
( '213', 'Белок S-100' ),
( '214', '*Специфический антиген рака мочевого пузыря (UBC) в моче' ),
( '215', 'Опухолевая пируваткиназа Тu M2 (в кале)' ),
( '217', 'РНК вируса гепатита А' ),
( '218', 'ДНК вируса гепатита B' ),
( '219', 'ДНК вируса гепатита B, количественно' ),
( '220', 'РНК вируса гепатита C' ),
( '221', 'РНК вируса гепатита C, количественно' ),
( '222', 'РНК вируса гепатита C, генотипирование' ),
( '223', 'РНК вируса гепатита D' ),
( '224', 'РНК вируса гепатита G' ),
( '225', 'ДНК вируса простого герпеса I, II типа (Herpes simplex virus I, II)' ),
( '226', 'ДНК вируса герпеса VI типа (Human Herpes virus VI)' ),
( '227', 'ДНК цитомегаловируса (Citomegalovirus)' ),
( '228', 'ДНК цитомегаловируса (Citomegalovirus), количественно' ),
( '229', 'ДНК вируса Эпштейна-Барр (Epstein-Barr virus)' ),
( '230', 'ДНК вируса Эпштейна-Барр (Epstein-Barr virus), количественно' ),
( '231', 'ДНК вируса Варицелла-Зостер (Varicella-Zoster virus)' ),
( '232', 'ДНК листерии (Listeria monocytogenes)' ),
( '233', 'ДНК пиогенного стрептококка (Streptococcus pyogenes)' ),
( '234', 'ДНК токсоплазмы (Toxoplasma gondii)' ),
( '235', '*РНК ВИЧ' ),
( '236', '*РНК ВИЧ, количественно' ),
( '238', 'ДНК хламидии (Chlamydia trachomatis)' ),
( '239', 'ДНК микоплазмы (Mycoplasma hominis)' ),
( '240', 'ДНК микоплазмы (Mycoplasma hominis), количественно' ),
( '241', 'ДНК микоплазмы (Mycoplasma genitalium)' ),
( '242', 'ДНК микоплазмы (Mycoplasma genitalium), количественно' ),
( '244', 'ДНК уреаплазмы (Ureaplasma urealyticum)' ),
( '245', 'ДНК уреаплазмы (Ureaplasma urealyticum), количественно' ),
( '246', 'ДНК уреаплазмы (Ureaplasma parvum)' ),
( '247', 'ДНК уреаплазмы (Ureaplasma parvum), количественно' ),
( '248', 'ДНК уреаплазмы (Ureaplasma species)' ),
( '249', 'ДНК уреаплазмы (Ureaplasma species), количественно' ),
( '250', 'ДНК гарднереллы (Gardnerella vaginalis)' ),
( '251', 'ДНК гарднереллы (Gardnerella vaginalis), количественно' ),
( '252', 'ДНК гонококка (Neisseria gonorrhoeae)' ),
( '253', 'ДНК гонококка (Neisseria gonorrhoeae), количественно' ),
( '254', 'ДНК бледной трепонемы (Treponema pallidum)' ),
( '255', 'ДНК микобактерии туберкулеза (Mycobacterium tuberculosis)' ),
( '256', 'ДНК пиогенного стрептококка (Streptococcus pyogenes)' ),
( '257', 'ДНК стрептококков (Streptococcus species)' ),
( '258', 'ДНК листерии (Listeria monocytogenes)' ),
( '259', 'ДНК кандиды (Candida albicans)' ),
( '260', 'ДНК кандиды (Сandida albicans), количественно' ),
( '263', 'ДНК токсоплазмы (Toxoplasma gondii)' ),
( '264', 'ДНК токсоплазмы (Toxoplasma gondii), количественно' ),
( '265', 'ДНК трихомонады (Trichomonas vaginalis)' ),
( '266', 'ДНК трихомонады (Trichomonas vaginalis), количественно' ),
( '267', 'ДНК цитомегаловируса (Cytomegalovirus, CMV)' ),
( '268', 'ДНК цитомегаловируса (Cytomegalovirus, CMV), количественно' ),
( '269', 'ДНК вируса простого герпеса I типа (Herpes simplex virus I)' ),
( '275', 'ДНК вируса герпеса VI типа (Human Herpes virus VI), количественно' ),
( '276', 'ДНК вируса Эпштейна-Барр (Epstein-Barr virus)' ),
( '277', 'ДНК вируса Эпштейна-Барр (Epstein-Barr virus), количественно' ),
( '278', 'ДНК вируса Варицелла-Зостер (Varicella-Zoster virus)' ),
( '282', 'ДНК папилломавируса (Human Papillomavirus, ВПЧ) 16 типа' ),
( '283', 'ДНК папилломавируса (Human Papillomavirus, ВПЧ) 18 типа' ),
( '289', 'ДНК хеликобактера (Helicobacter pylori)' ),
( '290', 'ДНК сальмонелл (Salmonella species)' ),
( '293', 'РНК энтеровируса (Enterovirus)' ),
( '294', 'РНК ротавирусов (Rotavirus) A и C' ),
( '295', 'Антитела к вирусу гепатита А, IgM (Anti-HAV IgM)' ),
( '296', 'Антитела к вирусу гепатита А, IgG (Anti-HAV IgG)' ),
( '299', 'Антитела к поверхностному антигену вируса гепатита В (Anti-HBs)' ),
( '302', 'Антиген HBе вируса гепатита В (HbеAg)' ),
( '303', 'Антитела к HBе-антигену вируса гепатита B, суммарные (Anti-HBе)' ),
( '304', 'Антитела к вирусу гепатита С, суммарные (Anti-HCV)' ),
( '305', 'Антитела к вирусу гепатита C, IgM (Anti-HCV IgM)' ),
( '306', 'Антитела к вирусу гепатита D, суммарные (Anti-HDV)' ),
( '307', 'Антитела к вирусу гепатита D, IgM (Anti-HDV IgM)' ),
( '308', 'Антитела к вирусу гепатита E, IgM (Anti-HEV IgM)' ),
( '309', 'Антитела к вирусу гепатита E, IgG (Anti-HEV IgG)' ),
( '310', 'ВИЧ (антитела и антигены)' ),
( '311', 'Микрореакция на сифилис качественно (RPR)' ),
( '312', 'Микрореакция на сифилис, полуколичественно (RPR)' ),
( '315', 'Антитела к бледной трепонеме (Treponema pallidum), суммарные' ),
( '316', 'Антитела к бледной трепонеме (Treponema pallidum), IgM' ),
( '317', 'Антитела к антигенам Т-лимфотропных вирусов (HTLV) 1 и 2 типов' ),
( '328', 'Антитела к вирусу герпеса VI типа (Human herpes virus VI), IgG' ),
( '329', 'Антитела к вирусу Варицелла-Зостер (Varicella-Zoster), IgM' ),
( '330', 'Антитела к вирусу Варицелла-Зостер (Varicella-Zoster), IgA' ),
( '331', 'Антитела к вирусу Варицелла-Зостер (Varicella-Zoster), IgG' ),
( '338', 'Антитела к вирусу Эпштейна-Барр (Epstein-Barr virus), IgG (иммуноблот)' ),
( '339', 'Антитела к цитомегаловирусу (Cytomegalovirus), IgM' ),
( '340', 'Антитела к цитомегаловирусу (Cytomegalovirus), IgA' ),
( '341', 'Антитела к цитомегаловирусу (Cytomegalovirus), IgG' ),
( '343', 'Антитела к цитомегаловирусу (Cytomegalovirus), IgG (иммуноблот)' );

INSERT INTO `patients_analyzestype`(`id`,`title`) VALUES 
( '344', 'Антитела к вирусу краснухи, IgM' ),
( '345', 'Антитела к вирусу краснухи, IgG' ),
( '347', 'Антитела к вирусу краснухи, IgG (иммуноблот)' ),
( '348', 'Антитела к токсоплазме (Toxoplasma gondii), IgM' ),
( '349', 'Антитела к токсоплазме (Toxoplasma gondii), IgA' ),
( '350', 'Антитела к токсоплазме (Toxoplasma gondii), IgG' ),
( '352', 'Антитела к парвовирусу (Parvovirus) B19, IgM' ),
( '353', 'Антитела к парвовирусу (Parvovirus) B19, IgG' ),
( '354', 'Антитела к вирусу кори, IgG' ),
( '355', 'Антитела к вирусу эпидемического паротита, IgМ' ),
( '356', 'Антитела к вирусу эпидемического паротита, IgG' ),
( '357', 'Антитела к коклюшному токсину, IgА' ),
( '358', 'Антитела к коклюшному токсину, IgG' ),
( '360', 'Антитела к Аденовирусу (Adenoviridae), IgM' ),
( '361', 'Антитела к Аденовирусу (Adenoviridae), IgA' ),
( '362', 'Антитела к Аденовирусу (Adenoviridae), IgG' ),
( '363', 'Антитела к возбудителю дифтерии (Corynebacterium diphtheriae)' ),
( '364', 'Антитела к возбудителю столбняка (Clostridium tetani)' ),
( '365', 'Антитела к хламидии (Chlamydia trachomatis), IgM' ),
( '366', 'Антитела к хламидии (Chlamydia trachomatis), IgA' ),
( '367', 'Антитела к хламидии (Chlamydia trachomatis), IgG' ),
( '368', 'Антитела к хламидофиле (Chlamydophila pneumoniae), IgM' ),
( '369', 'Антитела к хламидофиле (Chlamydophila pneumoniae), IgА' ),
( '370', 'Антитела к хламидофиле (Chlamydophila pneumoniae), IgG' ),
( '371', 'Антитела к микоплазме (Mycoplasma hominis), IgM' ),
( '372', 'Антитела к микоплазме (Mycoplasma hominis), IgА' ),
( '373', 'Антитела к микоплазме (Mycoplasma hominis), IgG' ),
( '374', 'Антитела к микоплазме (Mycoplasma pneumoniae), IgM' ),
( '375', 'Антитела к микоплазме (Mycoplasma pneumoniae), IgА' ),
( '376', 'Антитела к микоплазме (Mycoplasma pneumoniae), IgG' ),
( '377', 'Антитела к уреаплазме (Ureaplasma urealyticum), IgМ' ),
( '378', 'Антитела к уреаплазме (Ureaplasma urealyticum), IgА' ),
( '379', 'Антитела к уреаплазме (Ureaplasma urealyticum), IgG' ),
( '380', 'Антитела к трихомонаде (Trichomonas vaginalis), IgG.' ),
( '381', 'Антитела к кандиде (Candida albicans), IgM' ),
( '382', 'Антитела к кандиде (Candida albicans), IgA' ),
( '383', 'Антитела к кандиде (Candida albicans), IgG' ),
( '384', 'Антитела к грибам (Aspergillus fumigatus), IgG' ),
( '385', 'Антитела к гарднерелле (Gardnerella vaginalis), IgM' ),
( '386', 'Антитела к гарднерелле (Gardnerella vaginalis), IgG' ),
( '388', 'Антитела к легионеллам (Legionella pneumophila), суммарные' ),
( '389', 'Антитела к пневмоцисте (Pneumocystis carinii), IgМ' ),
( '390', 'Антитела к пневмоцисте (Pneumocуstis carinii), IgG' ),
( '391', 'Антитела к бруцелле (Brucella), IgА' ),
( '392', 'Антитела к бруцелле (Brucella ), IgG' ),
( '393', 'Антитела к вирусу клещевого энцефалита, IgM' ),
( '394', 'Антитела к вирусу клещевого энцефалита, IgG' ),
( '395', 'Антитела к боррелиям (Borrelia burgdorferi), IgM' ),
( '396', 'Антитела к боррелиям (Borrelia burgdorferi), IgG' ),
( '397', 'Антитела к описторхисам (Opisthorchis felineus), IgM' ),
( '398', 'Антитела к описторхисам (Opisthorchis felineus), IgG' ),
( '399', 'Антитела к эхинококкам (Echinococcus granulosus), IgG' ),
( '400', 'Антитела к токсокарам (Toxocara canis), IgG' ),
( '401', 'Антитела к трихинеллам (Trichinella spiralis), IgG' ),
( '402', 'Антитела к шистосомам (Schistosoma mansoni), IgG' ),
( '403', 'Антитела к угрицам кишечным (Strongyloides stercoralis), IgG' ),
( '404', 'Антитела к цистицеркам свиного цепня (Taenia solium), IgG' ),
( '405', 'Антитела к печеночным сосальщикам (Fasciola hepatica), IgG' ),
( '406', 'Антитела к аскаридам (Ascaris lumbricoides), IgG' ),
( '407', 'Антитела к лямблиям (Lamblia intestinalis), суммарные' ),
( '408', 'Антитела к лямблиям (Lamblia intestinalis), IgM' ),
( '409', 'Антитела к амебе дизентерийной (Entamoeba histolytica), IgG' ),
( '410', 'Антитела к лейшмании (Leishmania infantum), суммарные' ),
( '411', 'Антитела к хеликобактеру (Helicobacter pylori), IgМ' ),
( '412', 'Антитела к хеликобактеру (Helicobacter pylori), IgA' ),
( '413', 'Антитела к хеликобактеру (Helicobacter pylori), IgG' ),
( '414', 'Антитела к листерии (Listeria monocytogenes)' ),
( '415', 'Антитела к шигеллам (Shigella flexneri 1-V, V1, Shigella sonnei)' ),
( '417', 'Антитела к сальмонеллам (Salmonella) A, B, C1, C2, D, E' ),
( '418', 'Антитела к Vi-aнтигену вобудителя брюшного тифа (Salmonella typhi)' ),
( '419', 'Антитела к вирусу Коксаки (Coxsackievirus), IgM' ),
( '420', 'Антитела к менингококку (Neisseria meningitidis)' ),
( '439', 'Определение онкомаркера p16ink4a' ),
( '443', 'Пункционная биопсия мультифокальная' ),
( '445', 'Гистологическое исследование пайпель-биопсии эндометрия' ),
( '446', 'Иммуногистохимическое исследование (1 антитело)' ),
( '449', 'Иммуногистохимическое исследование сложное (11-14 антител)' ),
( '450', 'Консультация готового препарата перед ИГХ' ),
( '451', 'С3 компонент комплемента' ),
( '452', 'С4 компонент комплемента' ),
( '453', 'Иммуноглобулин А (IgA)' ),
( '454', 'Иммуноглобулин М (IgM)' ),
( '455', 'Иммуноглобулин G (IgG)' ),
( '456', 'Иммуноглобулин Е (IgE)' ),
( '457', 'Фактор некроза опухоли (ФНО-альфа)' ),
( '458', 'Криоглобулины, 37°C' ),
( '459', 'Циркулирующие иммунные комплексы' ),
( '461', 'Фаготест' ),
( '462', 'Бактерицидная активность крови' ),
( '464', 'Чувствительность к Ингарону' ),
( '465', 'Чувствительность к Интрону' ),
( '466', 'Чувствительность к Реальдирону' ),
( '467', 'Чувствительность к Реаферону' ),
( '468', 'Чувствительность к Роферону' ),
( '469', 'Чувствительность к Амиксину' ),
( '470', 'Чувствительность к Кагоцелу' ),
( '471', 'Чувствительность к Неовиру' ),
( '472', 'Чувствительность к Ридостину' ),
( '473', 'Чувствительность к Циклоферону' ),
( '474', 'Чувствительность к Галавиту' ),
( '475', 'Чувствительность к Гепону' ),
( '476', 'Чувствительность к Иммуналу' ),
( '477', 'Чувствительность к Иммунофану' ),
( '478', 'Чувствительность к Иммуномаксу' ),
( '479', 'Чувствительность к Иммунориксу' ),
( '480', 'Чувствительность к Ликопиду' ),
( '481', 'Чувствительность к Полиоксидонию' ),
( '482', 'Чувствительность к Тактивину' ),
( '483', 'Чувствительность к Тимогену' ),
( '484', 'Нейтрализующие антитела к Ингарону' ),
( '485', 'Нейтрализующие антитела к Интрону' ),
( '486', 'Нейтрализующие антитела к Реальдирону' ),
( '487', 'Нейтрализующие антитела к Реаферону' ),
( '488', 'Нейтрализующие антитела к Роферону' ),
( '491', 'Антинуклеарный фактор на клеточной линии HEp-2 (АНФ)' ),
( '492', 'Антитела к экстрагируемому нуклеарному АГ (ЭНА/ENA-скрин)' ),
( '493', 'Антитела к ядерным антигенам (ANA)' ),
( '494', 'Антитела к двуспиральной ДНК (нативной, a-dsDNA)' ),
( '495', 'Антитела к односпиральной ДНК (a-ssDNА)' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "patients_patients" ------------------------
BEGIN;

INSERT INTO `patients_patients`(`data_joined`,`id`,`Sex`,`Name`,`Surname`,`Patronymic`,`Date_of_birth`,`Place_of_residence`,`Blood_type`,`Telephone`,`Email`,`photo`) VALUES 
( '2022-04-14', '1', 'Мужчина', 'Вольдемар', 'Тетерин', 'Вольдемар ', '1980-10-01', '', '', '123231123123', 'teterin@gmail.com', 'photos/unnamed.jpg' ),
( '2022-04-14', '2', 'Женщина', 'Екатерина ', 'Комарова ', 'Максимовна', '1990-03-12', 'город Раменское, спуск Ленина, 13', 'III-', '123123321123', 'aleksej66@piftir.com', 'photos/unnamed.jpg' ),
( '2022-04-14', '3', 'Женщина', 'Маргарита ', 'Горшкова', 'Максимовна ', '1985-04-15', '', 'III-', '70546-93', 'emma.miheev@nugastore.com', 'photos/unnamed.jpg' ),
( '2022-04-14', '4', 'Мужчина', 'Август ', 'Дмитриевич', 'Князев ', '2022-04-15', '', 'II-', '85961-62', 'nmerkusev@shareflix.xyz', 'photos/unnamed.jpg' ),
( '2022-04-14', '5', 'Мужчина', 'Роман ', 'Марков ', 'Алексеевич', '2022-04-10', '', 'I+', '7715034', 'nelli77@singmails.com', 'photos/unnamed.jpg' ),
( '2022-04-14', '6', 'Мужчина', 'Валерий ', 'Трофимов ', 'Фёдорович', '2022-04-17', '', 'III-', '647117', 'kirillov.anna@hasevo.com', 'photos/unnamed.jpg' ),
( '2022-04-14', '7', 'Женщина', 'Дан ', 'Туров', 'Максимович ', '2022-04-04', '', 'IV-', '42127-46', 'milan.komarov@mymailcr.com', 'photos/patient/04/14/a01eb920157d569f0c214bc48ef1dec4.jpg' ),
( '2022-04-14', '8', 'Мужчина', 'Людмила ', 'Медведева ', 'Сергеевна', '2022-04-04', '', 'II+', '9208480', 'grisin.ananij@uhpanel.com', 'photos/unnamed.jpg' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "sicklist_sicklist" ------------------------
-- ---------------------------------------------------------


-- Dump data of "timetable_timetable" ----------------------
BEGIN;

INSERT INTO `timetable_timetable`(`id`,`date`,`patient_id`,`specialist_id`) VALUES 
( '1', '2022-04-22 17:56:00.000000', '1', '4' ),
( '2', '2022-04-29 17:56:00.000000', '1', '2' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "user_specialistgroup" ---------------------
BEGIN;

INSERT INTO `user_specialistgroup`(`group_ptr_id`) VALUES 
( '1' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "user_specialists" -------------------------
BEGIN;

INSERT INTO `user_specialists`(`id`,`password`,`last_login`,`is_superuser`,`username`,`is_staff`,`is_active`,`date_joined`,`first_name`,`last_name`,`email`,`patronymic`,`photo`,`phone`,`sex`,`place_of_residence`,`education`,`passport_num`,`inn`,`date_of_birth`,`last_activity`,`specialization_id`) VALUES 
( '2', 'pbkdf2_sha256$320000$D8ozFfUKEiHuhxlpQq2akc$sN7gVkOUsWOTalf0P+pZvFN8m6hrSSd7n0ASstgY0Dk=', '2022-04-14 18:04:40.698792', '1', 'admin', '1', '1', '2022-04-14 16:47:32.393524', 'Исак', 'Андреев', 'santa2344@gmail.com', 'Викторович', 'photos/specialists/04/14/image_2022-03-30_21-04-42.png', '0732651232', 'Мужчина', '', '', 'КН111111', '1238761627883671', '1990-11-11', '2022-04-14 18:08:38.207375', '230' ),
( '3', 'pbkdf2_sha256$320000$TjHDNlFpGg9XQUnnn0JSGG$8Btofi8nX71rgJfJ4am0HXxNitzU2TI6vsDHr3pnbck=', NULL, '0', 'petrenko_nina', '0', '1', '2022-04-14 17:10:57.688520', 'Эльвира ', 'Горшкова', 'petrenko.nina@aletar.com', 'Александровна ', 'photos/unnamed.jpg', '380995726780', 'Женщина', 'petrenko.nina@aletar.ga', '', 'КН11111', '1238761627883671', '1979-08-20', NULL, '121' ),
( '4', 'pbkdf2_sha256$320000$vOz1cexw6YTLR0yu3g3kvu$H4PgwzBzM/nOjmdKTvFEKJusHLCSwEe6/lPOtxi9Q6Q=', NULL, '0', 'valeria26', '0', '1', '2022-04-14 17:12:10.514659', 'Ксения ', 'Голубева', 'valeria26@esearb.com', 'Алексеевна', 'photos/unnamed.jpg', '495 4633664', '', '', '', 'КН939393', '', '1967-12-24', NULL, '217' ),
( '5', 'pbkdf2_sha256$320000$hWH03P5ISiU3I3z0sbhdym$6GFZET8QwDHa960hV+Z0OdeNljSljwBvEfSKiKYGTdA=', NULL, '0', 'marat_sidorov', '0', '1', '2022-04-14 17:13:44.412926', 'Даниил ', 'Лаврентьев ', 'marat.sidorov@gmailvn.net', 'Иванович', 'photos/unnamed.jpg', '495 6535045', 'Мужчина', '', '', 'КН939393', '1238761627883671', '2001-10-12', NULL, '132' ),
( '6', 'pbkdf2_sha256$320000$hDt1tjdXuaCCvEeUzhS1US$qCkTuPHHo9gqQ27tbyhazvJdtyPQJ3yelm49yeyJwNs=', NULL, '0', 'zoa_kolesnikov', '0', '1', '2022-04-14 17:15:06.194817', 'Люся ', 'Морозова ', 'zoa.kolesnikov@goldinbox.net', 'Владимировна', 'photos/unnamed.jpg', '812 97462-63', 'Женщина', 'м. Донецьк, пров. Шота Руставелі, 91', '', 'КН939393', '1238761627883671', '1972-06-01', NULL, '212' ),
( '7', 'pbkdf2_sha256$320000$Nn88aEbVmVYlOMbhx1FrqO$fVoip7xXbUMkK+QRISUZsHPdrCaDAUiVonxoO22H4N8=', '2022-04-14 18:02:36.103038', '0', 'laborant', '0', '1', '2022-04-14 17:58:50.473658', 'test', 'test', 'santa2344@gmail.com', 'test', 'photos/unnamed.jpg', '123123', '', '', '', 'КН939393', '1238761627883671', '2022-04-21', '2022-04-14 18:04:40.375512', '217' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "user_specialists_groups" ------------------
BEGIN;

INSERT INTO `user_specialists_groups`(`id`,`specialists_id`,`group_id`) VALUES 
( '1', '7', '1' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "user_specialists_user_permissions" --------
-- ---------------------------------------------------------


-- Dump data of "user_specialistsactivity" -----------------
BEGIN;

INSERT INTO `user_specialistsactivity`(`id`,`date`,`start_time`,`end_time`,`specialist_id`) VALUES 
( '1', '2022-04-14', '16:47:46.492367', '18:07:29.427385', '2' ),
( '2', '2022-04-14', '18:00:35.781016', '18:07:28.750362', '7' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "user_specializations" ---------------------
BEGIN;

INSERT INTO `user_specializations`(`id`,`title`) VALUES 
( '115', 'Врач по авиационной и космичес' ),
( '116', 'Врач-акушер-гинеколог' ),
( '117', 'Врач-акушер-гинеколог цехового' ),
( '118', 'Врач-аллерголог-иммунолог' ),
( '119', 'Врач-анестезиолог-реаниматолог' ),
( '120', 'Врач-бактериолог' ),
( '121', 'Врач-вирусолог' ),
( '122', 'Врач-гастроэнтеролог' ),
( '123', 'Врач-гематолог' ),
( '124', 'Врач-генетик' ),
( '125', 'Врач-гериатр' ),
( '126', 'Врач-дезинфектолог' ),
( '127', 'Врач-дерматовенеролог' ),
( '128', 'Врач-детский кардиолог' ),
( '129', 'Врач-детский онколог' ),
( '130', 'Врач-детский уролог-андролог' ),
( '131', 'Врач-детский хирург' ),
( '132', 'Врач-детский эндокринолог' ),
( '133', 'Врач-диабетолог' ),
( '134', 'Врач-диетолог' ),
( '135', 'Врач здравпункта' ),
( '136', 'Врач-инфекционист' ),
( '137', 'Врач-кардиолог' ),
( '138', 'Врач клинической лабораторной ' ),
( '139', 'Врач-клинический миколог' ),
( '140', 'Врач-клинический фармаколог' ),
( '141', 'Врач-колопроктолог' ),
( '142', 'Врач-косметолог' ),
( '143', 'Врач-лаборант' ),
( '144', 'Врач-лабораторный генетик' ),
( '145', 'Врач-лабораторный миколог' ),
( '146', 'Врач мануальной терапии' ),
( '147', 'Врач-методист' ),
( '148', 'Врач-невролог' ),
( '149', 'Врач-нейрохирург' ),
( '150', 'Врач-неонатолог' ),
( '151', 'Врач-нефролог' ),
( '152', 'Врач общей практики (семейный)' ),
( '153', 'Врач-онколог' ),
( '154', 'Врач-ортодонт' ),
( '155', 'Врач-оториноларинголог' ),
( '156', 'Врач-офтальмолог' ),
( '157', 'Врач-офтальмолог-протезист' ),
( '158', 'Врач-паразитолог' ),
( '159', 'Врач-патологоанатом' ),
( '160', 'Врач-педиатр' ),
( '162', 'Врач-педиатр участковый' ),
( '177', 'Врач по спортивной медицине' ),
( '178', 'Врач приемного отделения' ),
( '179', 'Врач-профпатолог' ),
( '180', 'Врач-психиатр' ),
( '186', 'Врач-психиатр-нарколог' ),
( '188', 'Врач-психотерапевт' ),
( '189', 'Врач-пульмонолог' ),
( '190', 'Врач-радиолог' ),
( '191', 'Врач-радиотерапевт' ),
( '192', 'Врач-ревматолог' ),
( '193', 'Врач-рентгенолог' ),
( '194', 'Врач-рефлексотерапевт' ),
( '195', 'Врач-сексолог' ),
( '199', 'Врач-стоматолог;' ),
( '200', 'Врач-стоматолог детский' ),
( '201', 'Врач-стоматолог-ортопед' ),
( '202', 'Врач-стоматолог-терапевт' ),
( '203', 'Врач-стоматолог-хирург' ),
( '207', 'Врач-сурдолог-протезист;' ),
( '208', 'Врач-терапевт' ),
( '212', 'Врач-токсиколог' ),
( '213', 'Врач-торакальный хирург' ),
( '214', 'Врач-травматолог-ортопед' ),
( '215', 'Врач-трансфузиолог' ),
( '217', 'Врач-уролог' ),
( '218', 'Врач-физиотерапевт' ),
( '219', 'Врач-фтизиатр' ),
( '220', 'Врач-фтизиатр участковый' ),
( '222', 'Врач-хирург' ),
( '223', 'Врач-челюстно-лицевой хирург' ),
( '224', 'Врач-эндокринолог' ),
( '225', 'Врач-эндоскопист' ),
( '226', 'Врач-эпидемиолог' ),
( '229', 'Врач клинической лабораторной диагностики' ),
( '230', 'Глав-врач' );
COMMIT;
-- ---------------------------------------------------------


-- CREATE INDEX "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" 
CREATE INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` USING BTREE ON `auth_group_permissions`( `permission_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "django_admin_log_content_type_id_c4bce8eb_fk_django_co" 
CREATE INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` USING BTREE ON `django_admin_log`( `content_type_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "django_admin_log_user_id_c564eba6_fk_user_specialists_id" 
CREATE INDEX `django_admin_log_user_id_c564eba6_fk_user_specialists_id` USING BTREE ON `django_admin_log`( `user_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "django_session_expire_date_a5c62663" ----------
CREATE INDEX `django_session_expire_date_a5c62663` USING BTREE ON `django_session`( `expire_date` );
-- -------------------------------------------------------------


-- CREATE INDEX "medicalCard_medicalc_patient_id_52a5cccd_fk_patients_" 
CREATE INDEX `medicalCard_medicalc_patient_id_52a5cccd_fk_patients_` USING BTREE ON `medicalcard_medicalcard`( `patient_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "patients_analyzes_patient_id_3276294a_fk_patients_patients_id" 
CREATE INDEX `patients_analyzes_patient_id_3276294a_fk_patients_patients_id` USING BTREE ON `patients_analyzes`( `patient_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "patients_analyzes_specialist_id_9af08899_fk_user_specialists_id" 
CREATE INDEX `patients_analyzes_specialist_id_9af08899_fk_user_specialists_id` USING BTREE ON `patients_analyzes`( `specialist_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "patients_analyzes_type_id_6d1de88d_fk_patients_analyzestype_id" 
CREATE INDEX `patients_analyzes_type_id_6d1de88d_fk_patients_analyzestype_id` USING BTREE ON `patients_analyzes`( `type_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "sicklist_sicklist_patient_id_99e218f1_fk_patients_patients_id" 
CREATE INDEX `sicklist_sicklist_patient_id_99e218f1_fk_patients_patients_id` USING BTREE ON `sicklist_sicklist`( `patient_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "sicklist_sicklist_specialist_id_01987ffc_fk_user_specialists_id" 
CREATE INDEX `sicklist_sicklist_specialist_id_01987ffc_fk_user_specialists_id` USING BTREE ON `sicklist_sicklist`( `specialist_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "timetable_timetable_patient_id_55d7c52b_fk_patients_patients_id" 
CREATE INDEX `timetable_timetable_patient_id_55d7c52b_fk_patients_patients_id` USING BTREE ON `timetable_timetable`( `patient_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "timetable_timetable_specialist_id_065c490d_fk_user_spec" 
CREATE INDEX `timetable_timetable_specialist_id_065c490d_fk_user_spec` USING BTREE ON `timetable_timetable`( `specialist_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "user_specialists_specialization_id_71b6f263_fk_user_spec" 
CREATE INDEX `user_specialists_specialization_id_71b6f263_fk_user_spec` USING BTREE ON `user_specialists`( `specialization_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "user_specialists_groups_group_id_7be97558_fk_auth_group_id" 
CREATE INDEX `user_specialists_groups_group_id_7be97558_fk_auth_group_id` USING BTREE ON `user_specialists_groups`( `group_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "user_specialists_use_permission_id_536ecc98_fk_auth_perm" 
CREATE INDEX `user_specialists_use_permission_id_536ecc98_fk_auth_perm` USING BTREE ON `user_specialists_user_permissions`( `permission_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "user_specialistsacti_specialist_id_154865ad_fk_user_spec" 
CREATE INDEX `user_specialistsacti_specialist_id_154865ad_fk_user_spec` USING BTREE ON `user_specialistsactivity`( `specialist_id` );
-- -------------------------------------------------------------


-- CREATE LINK "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" 
ALTER TABLE `auth_group_permissions`
	ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" 
ALTER TABLE `auth_group_permissions`
	ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY ( `permission_id` )
	REFERENCES `auth_permission`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "auth_permission_content_type_id_2f476e4b_fk_django_co" 
ALTER TABLE `auth_permission`
	ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY ( `content_type_id` )
	REFERENCES `django_content_type`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "django_admin_log_content_type_id_c4bce8eb_fk_django_co" 
ALTER TABLE `django_admin_log`
	ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY ( `content_type_id` )
	REFERENCES `django_content_type`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "django_admin_log_user_id_c564eba6_fk_user_specialists_id" 
ALTER TABLE `django_admin_log`
	ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_specialists_id` FOREIGN KEY ( `user_id` )
	REFERENCES `user_specialists`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "medicalCard_medicalc_patient_id_52a5cccd_fk_patients_" 
ALTER TABLE `medicalcard_medicalcard`
	ADD CONSTRAINT `medicalCard_medicalc_patient_id_52a5cccd_fk_patients_` FOREIGN KEY ( `patient_id` )
	REFERENCES `patients_patients`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "patients_analyzes_patient_id_3276294a_fk_patients_patients_id" 
ALTER TABLE `patients_analyzes`
	ADD CONSTRAINT `patients_analyzes_patient_id_3276294a_fk_patients_patients_id` FOREIGN KEY ( `patient_id` )
	REFERENCES `patients_patients`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "patients_analyzes_specialist_id_9af08899_fk_user_specialists_id" 
ALTER TABLE `patients_analyzes`
	ADD CONSTRAINT `patients_analyzes_specialist_id_9af08899_fk_user_specialists_id` FOREIGN KEY ( `specialist_id` )
	REFERENCES `user_specialists`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "patients_analyzes_type_id_6d1de88d_fk_patients_analyzestype_id" 
ALTER TABLE `patients_analyzes`
	ADD CONSTRAINT `patients_analyzes_type_id_6d1de88d_fk_patients_analyzestype_id` FOREIGN KEY ( `type_id` )
	REFERENCES `patients_analyzestype`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "sicklist_sicklist_patient_id_99e218f1_fk_patients_patients_id" 
ALTER TABLE `sicklist_sicklist`
	ADD CONSTRAINT `sicklist_sicklist_patient_id_99e218f1_fk_patients_patients_id` FOREIGN KEY ( `patient_id` )
	REFERENCES `patients_patients`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "sicklist_sicklist_specialist_id_01987ffc_fk_user_specialists_id" 
ALTER TABLE `sicklist_sicklist`
	ADD CONSTRAINT `sicklist_sicklist_specialist_id_01987ffc_fk_user_specialists_id` FOREIGN KEY ( `specialist_id` )
	REFERENCES `user_specialists`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "timetable_timetable_patient_id_55d7c52b_fk_patients_patients_id" 
ALTER TABLE `timetable_timetable`
	ADD CONSTRAINT `timetable_timetable_patient_id_55d7c52b_fk_patients_patients_id` FOREIGN KEY ( `patient_id` )
	REFERENCES `patients_patients`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "timetable_timetable_specialist_id_065c490d_fk_user_spec" 
ALTER TABLE `timetable_timetable`
	ADD CONSTRAINT `timetable_timetable_specialist_id_065c490d_fk_user_spec` FOREIGN KEY ( `specialist_id` )
	REFERENCES `user_specialists`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "user_specialistgroup_group_ptr_id_857b7999_fk_auth_group_id" 
ALTER TABLE `user_specialistgroup`
	ADD CONSTRAINT `user_specialistgroup_group_ptr_id_857b7999_fk_auth_group_id` FOREIGN KEY ( `group_ptr_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "user_specialistsacti_specialist_id_154865ad_fk_user_spec" 
ALTER TABLE `user_specialistsactivity`
	ADD CONSTRAINT `user_specialistsacti_specialist_id_154865ad_fk_user_spec` FOREIGN KEY ( `specialist_id` )
	REFERENCES `user_specialists`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "user_specialists_groups_group_id_7be97558_fk_auth_group_id" 
ALTER TABLE `user_specialists_groups`
	ADD CONSTRAINT `user_specialists_groups_group_id_7be97558_fk_auth_group_id` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "user_specialists_gro_specialists_id_985a802f_fk_user_spec" 
ALTER TABLE `user_specialists_groups`
	ADD CONSTRAINT `user_specialists_gro_specialists_id_985a802f_fk_user_spec` FOREIGN KEY ( `specialists_id` )
	REFERENCES `user_specialists`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "user_specialists_specialization_id_71b6f263_fk_user_spec" 
ALTER TABLE `user_specialists`
	ADD CONSTRAINT `user_specialists_specialization_id_71b6f263_fk_user_spec` FOREIGN KEY ( `specialization_id` )
	REFERENCES `user_specializations`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "user_specialists_use_permission_id_536ecc98_fk_auth_perm" 
ALTER TABLE `user_specialists_user_permissions`
	ADD CONSTRAINT `user_specialists_use_permission_id_536ecc98_fk_auth_perm` FOREIGN KEY ( `permission_id` )
	REFERENCES `auth_permission`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "user_specialists_use_specialists_id_1828460b_fk_user_spec" 
ALTER TABLE `user_specialists_user_permissions`
	ADD CONSTRAINT `user_specialists_use_specialists_id_1828460b_fk_user_spec` FOREIGN KEY ( `specialists_id` )
	REFERENCES `user_specialists`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


