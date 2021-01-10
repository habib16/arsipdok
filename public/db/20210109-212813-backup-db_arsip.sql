-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: db_arsip
-- ------------------------------------------------------
-- Server version 	5.5.5-10.4.14-MariaDB
-- Date: Sat, 09 Jan 2021 21:28:13 +0700

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
-- Table structure for table `auth_activation_attempts`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_activation_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_activation_attempts`
--

LOCK TABLES `auth_activation_attempts` WRITE;
/*!40000 ALTER TABLE `auth_activation_attempts` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `auth_activation_attempts` VALUES (1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0','10fb8a058babe09665ea25190a693731','2021-01-08 15:24:13');
/*!40000 ALTER TABLE `auth_activation_attempts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `auth_activation_attempts` with 1 row(s)
--

--
-- Table structure for table `auth_groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_groups`
--

LOCK TABLES `auth_groups` WRITE;
/*!40000 ALTER TABLE `auth_groups` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `auth_groups` VALUES (1,'admin','manage all menu'),(2,'staff','menu staff');
/*!40000 ALTER TABLE `auth_groups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `auth_groups` with 2 row(s)
--

--
-- Table structure for table `auth_groups_permissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`),
  CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_groups_permissions`
--

LOCK TABLES `auth_groups_permissions` WRITE;
/*!40000 ALTER TABLE `auth_groups_permissions` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `auth_groups_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `auth_groups_permissions` with 0 row(s)
--

--
-- Table structure for table `auth_groups_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_groups_users` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  KEY `group_id_user_id` (`group_id`,`user_id`),
  CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_groups_users`
--

LOCK TABLES `auth_groups_users` WRITE;
/*!40000 ALTER TABLE `auth_groups_users` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `auth_groups_users` VALUES (1,2),(2,3);
/*!40000 ALTER TABLE `auth_groups_users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `auth_groups_users` with 2 row(s)
--

--
-- Table structure for table `auth_logins`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_logins`
--

LOCK TABLES `auth_logins` WRITE;
/*!40000 ALTER TABLE `auth_logins` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `auth_logins` VALUES (1,'::1','a@gmail.com',1,'2020-12-10 13:51:30',1),(2,'::1','habib',NULL,'2020-12-18 07:08:46',0),(3,'::1','habib',NULL,'2020-12-18 07:09:57',0),(4,'::1','habib',NULL,'2020-12-18 07:12:31',0),(5,'::1','admin@admin.com',2,'2020-12-18 07:14:39',1),(6,'::1','admin@admin.com',2,'2020-12-18 08:03:26',1),(7,'::1','admin',NULL,'2020-12-18 09:19:08',0),(8,'::1','admin@admin.com',2,'2020-12-18 09:19:24',1),(9,'::1','admin@admin.com',2,'2020-12-18 20:40:35',1),(10,'::1','admin@admin.com',2,'2020-12-19 03:01:12',1),(11,'::1','admin@admin.com',2,'2020-12-19 08:55:44',1),(12,'::1','admin@admin.com',2,'2020-12-21 09:13:22',1),(13,'::1','admin@admin.com',2,'2020-12-21 11:00:59',1),(14,'::1','admin@admin.com',2,'2020-12-22 09:05:08',1),(15,'::1','admin@admin.com',2,'2020-12-24 09:06:02',1),(16,'::1','admin@admin.com',2,'2020-12-25 07:36:43',1),(17,'::1','admin@admin.com',2,'2020-12-25 23:27:41',1),(18,'::1','admin@admin.com',2,'2020-12-26 21:08:06',1),(19,'::1','admin@admin.com',2,'2020-12-26 21:24:33',1),(20,'::1','admin@admin.com',2,'2020-12-27 00:25:25',1),(21,'::1','admin@admin.com',2,'2020-12-27 04:26:27',1),(22,'::1','admin',NULL,'2020-12-27 07:14:48',0),(23,'::1','admin@admin.com',2,'2020-12-27 07:17:22',1),(24,'::1','admin@admin.com',2,'2020-12-27 19:49:26',1),(25,'::1','admin@admin.com',2,'2020-12-28 06:16:10',1),(26,'::1','admin@admin.com',2,'2020-12-29 07:04:35',1),(27,'::1','admin@admin.com',2,'2020-12-29 18:57:34',1),(28,'::1','admin@admin.com',2,'2020-12-30 05:10:01',1),(29,'::1','admin@admin.com',2,'2021-01-02 02:50:34',1),(30,'::1','admin@admin.com',2,'2021-01-03 07:08:31',1),(31,'::1','admin@admin.com',2,'2021-01-03 10:16:59',1),(32,'::1','admin@admin.com',2,'2021-01-04 02:59:24',1),(33,'::1','admin',NULL,'2021-01-04 08:37:52',0),(34,'::1','admin@admin.com',2,'2021-01-04 08:38:00',1),(35,'::1','admin@admin.com',2,'2021-01-06 00:30:38',1),(36,'::1','admin@admin.com',2,'2021-01-07 11:00:55',1),(37,'::1','admin@admin.com',2,'2021-01-07 13:01:51',1),(38,'::1','admin@admin.com',2,'2021-01-08 10:39:47',1),(39,'::1','staff@mail.com',3,'2021-01-08 11:33:52',1),(40,'::1','admin@admin.com',2,'2021-01-08 11:38:51',1),(41,'::1','admin@admin.com',2,'2021-01-08 15:02:42',1),(42,'::1','admin@admin.com',2,'2021-01-08 15:14:37',1),(43,'::1','adminn',15,'2021-01-08 15:17:42',0),(44,'::1','adminn',15,'2021-01-08 15:18:53',0),(45,'::1','admin@admin.com',2,'2021-01-08 15:19:09',1),(46,'::1','staff2@mail.com',4,'2021-01-08 15:19:38',1),(47,'::1','admin@admin.com',2,'2021-01-08 15:20:33',1),(48,'::1','adminn',15,'2021-01-08 15:20:55',0),(49,'::1','adminn',15,'2021-01-08 15:22:10',0),(50,'::1','admin@admin.com',2,'2021-01-08 15:22:41',1),(51,'::1','zesss',NULL,'2021-01-08 15:24:56',0),(52,'::1','zesss',NULL,'2021-01-08 15:25:13',0),(53,'::1','zesss',NULL,'2021-01-08 15:25:23',0),(54,'::1','evbdo07@gmail.com',17,'2021-01-08 15:25:53',1),(55,'::1','evbdo07@gmail.com',17,'2021-01-08 15:27:45',1),(56,'::1','admin@admin.com',2,'2021-01-08 15:50:07',1),(57,'::1','admin@admin.com',2,'2021-01-09 00:32:59',1),(58,'::1','admin@admin.com',2,'2021-01-09 07:16:58',1);
/*!40000 ALTER TABLE `auth_logins` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `auth_logins` with 58 row(s)
--

--
-- Table structure for table `auth_permissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permissions`
--

LOCK TABLES `auth_permissions` WRITE;
/*!40000 ALTER TABLE `auth_permissions` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `auth_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `auth_permissions` with 0 row(s)
--

--
-- Table structure for table `auth_reset_attempts`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_reset_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_reset_attempts`
--

LOCK TABLES `auth_reset_attempts` WRITE;
/*!40000 ALTER TABLE `auth_reset_attempts` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `auth_reset_attempts` VALUES (1,'akunbaruhabib16@gmail.com','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0','405f7c69700d1adb5c992a3d939e7364','2021-01-08 15:17:28'),(2,'akunbaruhabib16@gmail.com','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0','405f7c69700d1adb5c992a3d939e7364','2021-01-08 15:20:15'),(3,'evbdo07@gmail.com','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0','cf557e32eacaa3a1094281b5c44459ef','2021-01-08 15:27:10'),(4,'evbdo07@gmail.com','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0','cf557e32eacaa3a1094281b5c44459ef','2021-01-08 15:27:29');
/*!40000 ALTER TABLE `auth_reset_attempts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `auth_reset_attempts` with 4 row(s)
--

--
-- Table structure for table `auth_tokens`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_tokens_user_id_foreign` (`user_id`),
  KEY `selector` (`selector`),
  CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tokens`
--

LOCK TABLES `auth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `auth_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `auth_tokens` with 0 row(s)
--

--
-- Table structure for table `auth_users_permissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  KEY `user_id_permission_id` (`user_id`,`permission_id`),
  CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_users_permissions`
--

LOCK TABLES `auth_users_permissions` WRITE;
/*!40000 ALTER TABLE `auth_users_permissions` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `auth_users_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `auth_users_permissions` with 0 row(s)
--

--
-- Table structure for table `dokumen`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dokumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_surat` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `tgl_pembuatan` date NOT NULL,
  `no_filling_kabinet` varchar(50) NOT NULL,
  `nama_folder` varchar(50) NOT NULL,
  `file_surat` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokumen`
--

LOCK TABLES `dokumen` WRITE;
/*!40000 ALTER TABLE `dokumen` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `dokumen` VALUES (40,'16/DIR-4/0218','Kenaikan Imbal Jasa Pemotongan Kredit Pensiun Mitra Regional','kenaikan-imbal-jasa-pemotongan-kredit-pensiun-mitra-regional','','2018-02-15','F01','Kenaikan Imbal Jasa','161 Kenaikan Imbal Jasa Potongan Kredit Pensiun Mitra Regional_6.pdf','2021-01-09 01:14:35','2021-01-09 01:14:35'),(41,'307/Jaskug/PDKP/0319','Undangan','undangan','','2019-03-12','F02','Undangan','307_Undangan Mandiri.pdf','2021-01-09 01:16:22','2021-01-09 01:16:22'),(42,'311/PDKP/Jaskug/0319','Kepala Regional 4 dan 5','kepala-regional-4-dan-5','','2019-01-13','','','311_Permintaan Data BPK Reg 4 dan Reg 5.pdf','2021-01-09 01:17:11','2021-01-09 01:17:11'),(43,'372/PDKP/Jaskug/0319','Permintaan Data BPK','permintaan-data-bpk','','2021-03-26','','','372_Permintaan Data BPK Reg 6 dan 7.pdf','2021-01-09 02:15:53','2021-01-09 02:15:53'),(44,'383/Jaskug/PDKP/0319','Sosialisasi Otentikasi by Smarthphone','sosialisasi-otentikasi-by-smarthphone','','2019-01-28','F03','','383_Sosialisasi Otentikasi by Smartphone.pdf','2021-01-09 02:17:04','2021-01-09 02:17:04'),(45,'397/Div.LPU/0919','Permintaan Data Transaksi','permintaan-data-transaksi','','2019-09-24','','','397 Permintaan data produksi_000380-pdkp-tw 3.pdf','2021-01-09 02:18:32','2021-01-09 02:18:32'),(46,'424/PDKP/Jaskug/0419','Permintaan Pengembangan Menu Monitoring ePotpens','permintaan-pengembangan-menu-monitoring-epotpens','','2019-04-08','','','424_Permintaan Pengembangan Menu Monitoring ePotpens (SKB).pdf','2021-01-09 02:19:46','2021-01-09 02:19:46'),(47,'517/Jaskug/PDKP/030','Mekanisme Otentikasi dan Bebas Otentikasi Pensiun Taspen/Asabri Dapem April 2020','mekanisme-otentikasi-dan-bebas-otentikasi-pensiun-taspenasabri-dapem-april-2020','','2020-03-30','F02','Mekanisme','517_Mekanisme_Otentikas_dan_Bebas_Otentikasi_Pensiun_TaspenAsabri.pdf','2021-01-09 02:20:52','2021-01-09 02:20:52'),(48,'612/Jaskug/PDKP/0718','Penghentian Pemotongan Kredit Pensiun Taspen Secara Manual','penghentian-pemotongan-kredit-pensiun-taspen-secara-manual','','2018-07-05','','','612 Surat VP PDKP Penghentian Kresun Manual Taspen-1.pdf','2021-01-09 02:22:06','2021-01-09 02:22:06'),(49,'677/Jaskug/PDKP/0619','Permohonan Revisi Berita Acara Potongan Tagihan Kredit Pensiunan Bulan April - Mei 2019','permohonan-revisi-berita-acara-potongan-tagihan-kredit-pensiunan-bulan-april-mei-2019','','2019-07-26','','','677_Permohonan Revisi BA Mandiri.pdf','2021-01-09 02:23:28','2021-01-09 02:23:28'),(50,'1154/Jaskug/PDKP/0919','Undangan','undangan','','2019-09-16','','','1154_Undangan New E Dapem.pdf','2021-01-09 02:24:16','2021-01-09 18:17:12'),(51,'S.119/RLBSRM/X/2020','Konfirmasi Hasil Rekon Bersama BTPN - POS atas transaksi Host to Host 2020','konfirmasi-hasil-rekon-bersama-btpn-pos-atas-transaksi-host-to-host-2020','','2020-10-12','','','S119 RLBSRM X 2020 ke POS penyelesaian per 07 Oktober 2020.pdf','2021-01-09 02:25:39','2021-01-09 02:25:39'),(52,'S.129/RLBSRM/XI/2020','Konfirmasi Hasil Rekon Bersama BTPN - POS atas transaksi Host to Host 2020','konfirmasi-hasil-rekon-bersama-btpn-pos-atas-transaksi-host-to-host-2020','','2020-11-18','F05','Rekon','S129 RLBSRM XI 2020 Konfirmasi Hasil Rekon Bersama BTPN – POS 18 nov 2020 .pdf','2021-01-09 02:27:44','2021-01-09 02:27:44');
/*!40000 ALTER TABLE `dokumen` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `dokumen` with 13 row(s)
--

--
-- Table structure for table `migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` text NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `migrations` VALUES (1,'2017-11-20-223112','Myth\\Auth\\Database\\Migrations\\CreateAuthTables','default','Myth\\Auth',1607628437,1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `migrations` with 1 row(s)
--

--
-- Table structure for table `riwayat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_dokumen` int(11) NOT NULL,
  `no_surat` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `waktu` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat`
--

LOCK TABLES `riwayat` WRITE;
/*!40000 ALTER TABLE `riwayat` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `riwayat` VALUES (14,2,26,'001','Surat Keputusan Presiden','Ditambahkan','2020-12-22 00:21:20'),(15,2,27,'003','Surat AB','Ditambahkan','2020-12-22 00:26:57'),(16,2,30,'0011','Surat Y','Ditambahkan','2020-12-22 00:30:20'),(17,2,30,'0011','Surat Y','Diubah (Perihal)','2020-12-22 00:32:37'),(18,2,27,'003','Surat AB','Berkas Fisik Diambil','2020-12-22 00:32:46'),(19,2,0,'0023','Surat LK','Ditambahkan','2020-12-22 00:33:22'),(20,2,0,'0023','Surat LK','Dihapus','2020-12-22 00:33:45'),(21,2,30,'0011','Surat Y','Ditambahkan','2020-12-23 01:22:40'),(22,2,32,'900','Surat Z','Ditambahkan','2020-12-23 01:23:24'),(23,2,32,'900','Surat Z','Dihapus','2020-12-23 01:24:34'),(24,2,32,'900','Surat Z','Ditambahkan','2020-12-23 01:25:11'),(25,2,26,'001','Surat Keputusan Presiden','Diubah (No Surat)','2020-12-23 01:33:32'),(26,2,26,'003','Surat Keputusan Presiden','Diubah (File Surat)','2020-12-23 01:33:57'),(27,2,26,'003','Surat Keputusan Presiden','Diubah (File Surat)','2020-12-23 01:34:26'),(28,2,32,'900','Surat Z','Diubah (Nomor Filling Kabinet)','2020-12-23 01:44:15'),(29,2,30,'0011','Surat Y','Diubah (Nomor Filling Kabinet)','2020-12-23 01:45:05'),(30,2,30,'0011','Surat Y','File keluar (Download)','2020-12-23 02:06:26'),(31,2,32,'900','Surat Z','File keluar (Download)','2020-12-23 02:07:13'),(32,2,26,'003','Surat Keputusan Presiden','File keluar (Download)','2020-12-24 23:07:47'),(33,2,27,'003','Surat AB','Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)','2020-12-28 10:20:55'),(34,2,27,'003','Surat AB','Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)','2020-12-28 10:33:54'),(35,2,33,'0988123','Surat Pemberitahuan','Ditambahkan','2020-12-28 10:40:23'),(36,2,33,'0988123','Surat Pemberitahuan','Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)','2020-12-28 10:42:06'),(37,2,33,'0988123','Surat Pemberitahuan','Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)','2020-12-28 10:43:47'),(38,2,33,'0988123','Surat Pemberitahuan','Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)','2020-12-28 10:46:09'),(39,2,33,'0988123','Surat Pemberitahuan','Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)','2020-12-28 10:46:29'),(40,2,33,'0988123','Surat Pemberitahuan','Diubah (Perihal, Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)','2020-12-28 10:48:21'),(41,2,33,'0988123','Surat Pemberitahuan','Diubah (Perihal, Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)','2020-12-28 10:49:41'),(42,2,33,'0988123','Surat Pemberitahuan','Diubah (Nama Folder, Tanggal Pembuatan)','2020-12-28 10:50:49'),(43,2,30,'0011','Surat Y','Diubah (Tanggal Pembuatan)','2020-12-28 10:52:36'),(44,2,33,'0988123','Surat Pemberitahuan','Diubah (Nama Folder, Tanggal Pembuatan)','2020-12-28 10:54:12'),(45,2,33,'0988123','Surat Pemberitahuan','Diubah (Tanggal Pembuatan)','2020-12-28 10:54:38'),(46,2,33,'0988123','Surat Pemberitahuan','Diubah (Nama Folder, Tanggal Pembuatan)','2020-12-28 10:55:05'),(47,2,33,'0988123','Surat Pemberitahuan','Diubah (Tanggal Pembuatan)','2020-12-28 10:56:12'),(48,2,33,'0988123','Surat Pemberitahuan','Diubah (Tanggal Pembuatan)','2020-12-28 10:57:51'),(49,2,33,'0988123','Surat Pemberitahuan','Diubah (Tanggal Pembuatan)','2020-12-28 10:58:51'),(50,2,33,'0988123','Surat Pemberitahuan','Diubah (Tanggal Pembuatan)','2020-12-28 11:02:21'),(51,2,33,'0988123','Surat Pemberitahuan','Diubah (Tanggal Pembuatan)','2020-12-28 11:05:22'),(52,2,33,'0988123','Surat Pemberitahuan','Diubah (Nama Folder)','2020-12-28 11:05:54'),(53,2,27,'003','Surat AB','Berkas Fisik Diambil (Kantor Sebelah)','2020-12-28 20:48:22'),(54,2,27,'003','Surat AB','Berkas Fisik Dikembalikan (Kabinet 122)','2020-12-29 21:59:14'),(55,2,27,'003','Surat AB','Berkas Fisik Diambil (Kantor Sebelah)','2020-12-29 21:59:35'),(56,2,27,'003','Surat AB','Berkas Fisik Dikembalikan (Kabinet 98)','2020-12-29 21:59:54'),(57,2,27,'003','Surat AB','Berkas Fisik Diambil (Kantor A)','2020-12-29 22:12:56'),(58,2,27,'003','Surat AB','Berkas Fisik Dikembalikan (Folder 12B)','2020-12-29 22:13:14'),(59,2,27,'003','Surat AB','Berkas Fisik Diambil (Kantor P)','2020-12-29 22:13:31'),(60,2,27,'003','Surat AB','Berkas Fisik Dikembalikan (Kabinet 12P/Folder 3F)','2020-12-29 22:14:05'),(61,2,26,'003','Surat Keputusan Presiden','File keluar (Download)','2021-01-03 21:11:33'),(62,2,32,'900','Surat Z','Dihapus','2021-01-09 02:58:34'),(63,2,39,'123131','asdasdad','Ditambahkan','2021-01-09 14:12:02'),(64,2,40,'16/DIR-4/0218','Kenaikan Imbal Jasa Pemotongan Kredit Pensiun Mitra Regional','Ditambahkan','2021-01-09 14:14:35'),(65,2,34,'161/DIR-4/0218','Kenaikan Imbal Jasa Pemotongan Kredit Pensiun Mitra Regional','Dihapus','2021-01-09 14:14:57'),(66,2,36,'2344','aaaaaddds','Dihapus','2021-01-09 14:15:02'),(67,2,35,'161/DIR-4/0218','Kenaikan Imbal Jasa Pemotongan Kredit Pensiun Mitra Regional','Dihapus','2021-01-09 14:15:05'),(68,2,39,'123131','asdasdad','Dihapus','2021-01-09 14:15:09'),(69,2,38,'12312313','sasdada','Dihapus','2021-01-09 14:15:13'),(70,2,37,'11113333','aasdad','Dihapus','2021-01-09 14:15:18'),(71,2,41,'307/Jaskug/PDKP/0319','Undangan','Ditambahkan','2021-01-09 14:16:22'),(72,2,42,'311/PDKP/Jaskug/0319','Kepala Regional 4 dan 5','Ditambahkan','2021-01-09 14:17:11'),(73,2,43,'372/PDKP/Jaskug/0319','Permintaan Data BPK','Ditambahkan','2021-01-09 15:15:53'),(74,2,44,'383/Jaskug/PDKP/0319','Sosialisasi Otentikasi by Smarthphone','Ditambahkan','2021-01-09 15:17:04'),(75,2,45,'397/Div.LPU/0919','Permintaan Data Transaksi','Ditambahkan','2021-01-09 15:18:32'),(76,2,46,'424/PDKP/Jaskug/0419','Permintaan Pengembangan Menu Monitoring ePotpens','Ditambahkan','2021-01-09 15:19:46'),(77,2,47,'517/Jaskug/PDKP/030','Mekanisme Otentikasi dan Bebas Otentikasi Pensiun Taspen/Asabri Dapem April 2020','Ditambahkan','2021-01-09 15:20:52'),(78,2,48,'612/Jaskug/PDKP/0718','Penghentian Pemotongan Kredit Pensiun Taspen Secara Manual','Ditambahkan','2021-01-09 15:22:06'),(79,2,49,'677/Jaskug/PDKP/0619','Permohonan Revisi Berita Acara Potongan Tagihan Kredit Pensiunan Bulan April - Mei 2019','Ditambahkan','2021-01-09 15:23:28'),(80,2,50,'1154/Jaskug/PDKP/0919','Undangan','Ditambahkan','2021-01-09 15:24:16'),(81,2,51,'S.119/RLBSRM/X/2020','Konfirmasi Hasil Rekon Bersama BTPN - POS atas transaksi Host to Host 2020','Ditambahkan','2021-01-09 15:25:39'),(82,2,52,'S.129/RLBSRM/XI/2020','Konfirmasi Hasil Rekon Bersama BTPN - POS atas transaksi Host to Host 2020','Ditambahkan','2021-01-09 15:27:44'),(83,2,26,'003','Surat Keputusan Presiden','Dihapus','2021-01-09 15:27:58'),(84,2,27,'003','Surat AB','Dihapus','2021-01-09 15:28:01'),(85,2,28,'0011','Surat Luar','Dihapus','2021-01-09 15:28:04'),(86,2,30,'0011','Surat Y','Dihapus','2021-01-09 15:28:06'),(87,2,33,'0988123','Surat Pemberitahuan','Dihapus','2021-01-09 15:28:09'),(88,2,50,'1154/Jaskug/PDKP/0919','Undangan','Diubah (Perihal, Nomor Filling Kabinet)','2021-01-09 15:30:07'),(89,2,50,'1154/Jaskug/PDKP/0919','Undangan Baru','Diubah (Perihal, Nomor Filling Kabinet)','2021-01-09 15:30:16'),(90,2,40,'16/DIR-4/0218','Kenaikan Imbal Jasa Pemotongan Kredit Pensiun Mitra Regional','File keluar (Download)','2021-01-09 15:30:22'),(91,2,50,'1154/Jaskug/PDKP/0919','Undangan','Diubah (Perihal, Nomor Filling Kabinet)','2021-01-09 17:54:13'),(92,2,50,'1154/Jaskug/PDKP/0919','Undangan Baru','Diubah (Perihal, Nomor Filling Kabinet)','2021-01-09 17:59:11'),(93,2,50,'1154/Jaskug/PDKP/0919','Undagan Baru','Diubah (Perihal, Nomor Filling Kabinet)','2021-01-09 18:01:41'),(94,2,50,'1154/Jaskug/PDKP/0919','UndaganBaru','Diubah (Perihal, Nomor Filling Kabinet)','2021-01-09 18:10:38'),(95,2,50,'1154/Jaskug/PDKP/0919','Undagan','Diubah (Perihal, Nomor Filling Kabinet)','2021-01-09 18:17:12');
/*!40000 ALTER TABLE `riwayat` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `riwayat` with 82 row(s)
--

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `users` VALUES (1,'a@gmail.com','habib','$2y$10$Q6ZQ4AAHtK/9JmCjXc1qZ.C/6vBgwkPCJ/oFat.UNfENRVlfyXLvm',NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2020-12-10 13:51:19','2020-12-10 13:51:19',NULL),(2,'admin@admin.com','admin','$2y$10$kRhRY5rSVVQs3S1jFnA3x.zB1Gr/VykdnDhlfK472FX6rwwPIq/aO',NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2020-12-18 07:14:32','2020-12-18 07:14:32',NULL),(3,'staff@mail.com','staff','$2y$10$eyZpbk6E8X/IH/UKWfDb7.Ta3UXXuD9q3TaxGgAfhzrqsAjGzUtHC',NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2021-01-08 11:33:41','2021-01-08 11:33:41',NULL),(4,'staff2@mail.com','staff2','$2y$10$FbK4Nu5UbOwvnZ8i3qikquBDMScBYrL2S6.DUZIKa43p.5h5OgwA.',NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2021-01-08 12:54:54','2021-01-08 12:54:54',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `users` with 4 row(s)
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Sat, 09 Jan 2021 21:28:13 +0700
