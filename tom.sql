-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: vuexTommify
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.2

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(8,2) NOT NULL DEFAULT '0.00',
  `artist_id` bigint unsigned NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `albums_artist_id_foreign` (`artist_id`),
  CONSTRAINT `albums_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Primo Album',10.00,51,NULL,'2023-05-14 10:59:43',NULL),(2,'Secondo Album',14.00,51,NULL,'2023-05-14 10:59:43',NULL),(3,'Terzo Album',11.00,51,NULL,'2023-05-14 10:59:43',NULL),(4,'Alba Chiara',13.00,52,NULL,'2023-05-14 10:59:43',NULL),(5,'Waka Waka',12.00,53,NULL,'2023-05-14 10:59:43',NULL);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albumsale_users`
--

DROP TABLE IF EXISTS `albumsale_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albumsale_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `albumsale_users_album_id_user_id_unique` (`album_id`,`user_id`),
  KEY `albumsale_users_user_id_foreign` (`user_id`),
  CONSTRAINT `albumsale_users_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE,
  CONSTRAINT `albumsale_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albumsale_users`
--

LOCK TABLES `albumsale_users` WRITE;
/*!40000 ALTER TABLE `albumsale_users` DISABLE KEYS */;
INSERT INTO `albumsale_users` VALUES (1,1,2,NULL,NULL),(2,2,2,NULL,NULL),(3,3,2,NULL,NULL),(4,4,2,NULL,NULL),(5,2,3,NULL,NULL),(6,4,3,NULL,NULL),(7,2,4,NULL,NULL),(8,4,4,NULL,NULL);
/*!40000 ALTER TABLE `albumsale_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artists_user_id_foreign` (`user_id`),
  CONSTRAINT `artists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,58,'Maurine Witting',44.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(2,59,'Trystan Pfeffer DVM',44.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(3,60,'Prof. Elyse Blanda Sr.',6.00,'rock',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(4,61,'Darion Lebsack',66.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(5,62,'Jo Kris',66.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(6,63,'Reynold Skiles',44.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(7,64,'Alexandra Rau III',23.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(8,65,'Gayle Kihn',78.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(9,66,'Sebastian Blanda Sr.',66.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(10,67,'Karen Vandervort',6.00,'rock',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(11,68,'Mr. Jesus Cassin',3.00,'classic',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(12,69,'Mariah Bosco',78.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(13,70,'Afton Bashirian',23.00,'rock',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(14,71,'Axel Gibson MD',3.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(15,72,'Sophie Simonis',23.00,'classic',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(16,73,'Rebekah Hettinger',23.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(17,74,'Haven Rice Jr.',66.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(18,75,'Annetta Cremin',3.00,'rock',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(19,76,'Matteo Keeling',44.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(20,77,'Trevor Emard',78.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(21,78,'Haskell Hodkiewicz',6.00,'classic',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(22,79,'Reggie Leffler',44.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(23,80,'Baylee Hettinger',66.00,'classic',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(24,81,'Adela Schaden',44.00,'classic',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(25,82,'Luciano Ebert',43.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(26,83,'Alfonzo Koepp',23.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(27,84,'Prof. Cory Maggio IV',78.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(28,85,'Prof. Bernie Kshlerin',6.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(29,86,'Mr. Emery Hoppe',43.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(30,87,'Mr. Pietro Hane II',23.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(31,88,'Cecile Schowalter DDS',43.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(32,89,'Garett Greenholt',78.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(33,90,'Mr. Frankie Fahey',78.00,'rock',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(34,91,'Maribel Okuneva',3.00,'classic',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(35,92,'Davonte Schmidt',44.00,'rock',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(36,93,'Florencio Wolff',6.00,'classic',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(37,94,'Abbigail Stiedemann V',78.00,'classic',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(38,95,'Tia Stehr I',44.00,'classic',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(39,96,'Annetta Grady',44.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(40,97,'Lenny Bins',78.00,'rock',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(41,98,'Chris Schmeler',3.00,'rock',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(42,99,'Alexandra Sauer',23.00,'rock',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(43,100,'Osbaldo Koelpin',6.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(44,101,'Miracle Cronin II',3.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(45,102,'Monserrat Bayer',6.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(46,103,'Renee Boehm',43.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(47,104,'Anthony Schinner',44.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(48,105,'Anika Koepp V',44.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(49,106,'Mr. Linwood Quigley',23.00,'heavy metal',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(50,107,'Evert Sawayn',23.00,'pop',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43'),(51,6,'Tommaso Vitali',120.00,'Havy Metal',NULL,NULL,NULL),(52,5,'Vasco Rossi',100.00,'Pop',NULL,NULL,NULL),(53,7,'Shakira',80.00,'Pop',NULL,NULL,NULL);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistsale_users`
--

DROP TABLE IF EXISTS `artistsale_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistsale_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `artist_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `artistsale_users_artist_id_user_id_unique` (`artist_id`,`user_id`),
  KEY `artistsale_users_user_id_foreign` (`user_id`),
  CONSTRAINT `artistsale_users_artist_id_foreign` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `artistsale_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistsale_users`
--

LOCK TABLES `artistsale_users` WRITE;
/*!40000 ALTER TABLE `artistsale_users` DISABLE KEYS */;
INSERT INTO `artistsale_users` VALUES (1,1,2,NULL,NULL),(2,2,2,NULL,NULL);
/*!40000 ALTER TABLE `artistsale_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_05_03_000001_create_customer_columns',1),(4,'2019_05_03_000002_create_subscriptions_table',1),(5,'2019_05_03_000003_create_subscription_items_table',1),(6,'2019_08_19_000000_create_failed_jobs_table',1),(7,'2019_12_14_000001_create_personal_access_tokens_table',1),(8,'2022_06_25_202156_create_artists_table',1),(9,'2022_06_26_180216_create_albums_table',1),(10,'2022_06_26_180250_create_songs_table',1),(11,'2022_07_02_164356_create_preferites_users_table',1),(12,'2022_07_02_164359_create_albumsale_users_table',1),(13,'2022_07_02_164360_create_songsale_users_table',1),(14,'2022_07_06_184537_create_artistsale_users_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (2,'App\\Models\\User',1,'API TOKEN','be6dd78662bc17b249be799215cc574c8d85f316e72a73936bd1f7f9989366a8','[\"*\"]',NULL,'2023-05-14 20:10:23','2023-05-14 20:10:23'),(3,'App\\Models\\User',1,'API TOKEN','3f096aa45d969bab9875a235e674ccda18aa55dcf8b266d38337fb1b4487d4cd','[\"*\"]',NULL,'2023-05-17 17:32:11','2023-05-17 17:32:11');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferites_users`
--

DROP TABLE IF EXISTS `preferites_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferites_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `song_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `preferites_users_song_id_user_id_unique` (`song_id`,`user_id`),
  KEY `preferites_users_user_id_foreign` (`user_id`),
  CONSTRAINT `preferites_users_song_id_foreign` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `preferites_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferites_users`
--

LOCK TABLES `preferites_users` WRITE;
/*!40000 ALTER TABLE `preferites_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferites_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(8,2) NOT NULL DEFAULT '0.00',
  `album_id` bigint unsigned NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `songs_album_id_foreign` (`album_id`),
  CONSTRAINT `songs_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'Monkey Dance',3.00,1,NULL,NULL,NULL),(2,'Shape of You',2.00,1,NULL,NULL,NULL),(3,'Lose Yourself',1.00,2,NULL,NULL,NULL),(4,'On The Floor',3.00,2,NULL,NULL,NULL),(5,'Beggin',3.00,3,NULL,NULL,NULL),(6,'Siamo Solo Noi',2.00,4,NULL,NULL,NULL),(7,'Bollicine',3.00,4,NULL,NULL,NULL),(8,'Te felicito',3.00,5,NULL,NULL,NULL),(9,'Dont You Worry',4.00,5,NULL,NULL,NULL);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songsale_users`
--

DROP TABLE IF EXISTS `songsale_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songsale_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `song_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `songsale_users_song_id_user_id_unique` (`song_id`,`user_id`),
  KEY `songsale_users_user_id_foreign` (`user_id`),
  CONSTRAINT `songsale_users_song_id_foreign` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `songsale_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songsale_users`
--

LOCK TABLES `songsale_users` WRITE;
/*!40000 ALTER TABLE `songsale_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `songsale_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_items`
--

LOCK TABLES `subscription_items` WRITE;
/*!40000 ALTER TABLE `subscription_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin@admin.it',NULL,'$2y$10$naEj.FyhELXfVjPbDnv0Feuj45aAdcrLACUAR8OdLwjXwv/za320e',NULL,'2023-05-14 10:59:42','2023-05-14 10:59:42',NULL,NULL,NULL,NULL),(2,'cacao','user','cacao@cacao.it',NULL,'$2y$10$EQ1YUYG.Zh2qmrJD032O7OFvxgqjUjJ9oO0XpGWkB/ofxqWRBpIva',NULL,'2023-05-14 10:59:42','2023-05-14 10:59:42',NULL,NULL,NULL,NULL),(3,'pippo','user','pippo@pippo.it',NULL,'$2y$10$x0JdLHsP7sdN3NWHkIngc.VwSi41356JCZBbHrno13tkV7hxu8kSO',NULL,'2023-05-14 10:59:42','2023-05-14 10:59:42',NULL,NULL,NULL,NULL),(4,'cacao3','user','cacao3@cacao3.it',NULL,'$2y$10$9Kzl8k4HphV4HzsqISitEeitapmfE7W/VhCbp1iKut28FNpf9SCdW',NULL,'2023-05-14 10:59:42','2023-05-14 10:59:42',NULL,NULL,NULL,NULL),(5,'Vasco Rossi','artist','vasco@vasco.it',NULL,'$2y$10$Jkk3BjTFHhODaJAEFwDnQe0Hqxs5XqTm4N2E3.wrxy/4vusZp2dua',NULL,'2023-05-14 10:59:42','2023-05-14 10:59:42',NULL,NULL,NULL,NULL),(6,'Tommaso Vitali','artist','vitali@vitali.it',NULL,'$2y$10$Z84RJaol/ONrHwoS3S84euxP3.YkVMWnZJ6ZqgWWF.U1iux9X45ce',NULL,'2023-05-14 10:59:42','2023-05-14 10:59:42',NULL,NULL,NULL,NULL),(7,'Shakira','artist','shakira@shakira.it',NULL,'$2y$10$dIbShkx7ZqVRoFZQy7D0FeJOAHHzFiwPjPMdP3ZzfjnGECo4bVxhO',NULL,'2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(8,'Kacie Terry','user','kenyon04@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','vYD1vEdvyZ','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(9,'Elissa Zulauf Sr.','user','antwon68@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','cElFWnViF4','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(10,'Elfrieda Goodwin','user','ratke.dallas@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','3H2DBcBIR7','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(11,'Mariam Ebert','user','jillian04@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mGEbquWVZf','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(12,'Mr. Alexie O\'Keefe PhD','user','efrain29@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Q0i3VkobUM','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(13,'Eloy Larkin PhD','user','toy.jerome@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','oEISfIOGoY','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(14,'Keara Grady','user','herzog.joey@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','aQvUMD6k2O','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(15,'Wilhelm Stoltenberg','user','joel57@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ecvOugB2WJ','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(16,'Mattie Kunze','user','sawayn.mathew@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','VTHVMwpkDz','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(17,'Rosetta Turner MD','user','daniel.libby@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','jCnMzR6Gz4','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(18,'Karolann Donnelly','user','nweber@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','0itMxYIYOE','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(19,'Lenna Marquardt','user','doug34@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fMZ4q5PnP9','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(20,'Lauretta O\'Hara PhD','user','ymosciski@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','i9DvvyZ9qM','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(21,'Carlee Goldner','user','katelin.gusikowski@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','pUnbuP3EdQ','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(22,'Edward Streich','user','bryana91@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','z8UVrAeeFO','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(23,'Daryl Little','user','fadel.louie@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','XtZwTtydUG','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(24,'Dr. Edwardo Hammes','user','connelly.michele@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','nuApYZ0RjP','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(25,'Miss Viva Gottlieb','user','irolfson@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','hv1xWjRmY4','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(26,'Lewis Hessel','user','nella.gibson@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qO1yMpqCpY','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(27,'Abel Harvey','user','mgibson@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','GW2aWD7Kda','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(28,'Sandrine Langosh','user','bprohaska@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qqH6gdyv9T','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(29,'Sadie Braun','user','gisselle.balistreri@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','QjTYOk7sqU','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(30,'Franco Hoeger','user','aryanna.glover@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','yhCHP7JCE8','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(31,'Mr. Jerod Baumbach','user','greenholt.chance@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','39ezRtT075','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(32,'Domenic Lebsack MD','user','stephania.gerlach@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','xrTCPnxkip','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(33,'Donald Connelly','user','jalon.blick@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','iBW7C6sNLO','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(34,'Sigrid Jaskolski','user','jacobi.ismael@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bKu6F4fcEv','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(35,'Dr. Eino Braun V','user','mellie56@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','8ave26pa4L','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(36,'Brittany Keebler','user','vwaters@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','jg2cfR5gm6','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(37,'Chasity Hayes','user','caitlyn.stark@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','pZbSWWHYcq','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(38,'Monserrat Bernier','user','cormier.lavada@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fXfcXDFnCg','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(39,'Mrs. Elvera Pollich IV','user','dgraham@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','IGO4V2JtFg','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(40,'Prof. Saul Becker DDS','user','schaden.birdie@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','tzjhbx7rCB','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(41,'Vicente Kassulke','user','jast.ola@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2MftJJ2z49','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(42,'Marcia Schaden V','user','estehr@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','IVzgx70h7M','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(43,'Mrs. Hilma Heathcote','user','royce.runolfsdottir@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','g1EnSXtn9U','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(44,'Mr. Carter Nolan MD','user','cortney.frami@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','KYOhybVbMh','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(45,'Phoebe Harris','user','roderick.mertz@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','3SABVJI8Ws','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(46,'Alicia Ankunding','user','kub.hiram@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','GVQsFOyDgz','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(47,'Caleigh Gusikowski','user','lkuphal@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','8ahLw1sUhJ','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(48,'Ariel Marquardt MD','user','wwunsch@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2GbzhdIWqz','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(49,'Prof. Chaz Casper','user','fadel.litzy@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','TbZs332fvK','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(50,'Nathanial Osinski','user','garland.zulauf@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','UZennYxkdu','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(51,'Dr. Peggie Cronin','user','nolan.arlene@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','1qF1dTgQqJ','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(52,'Dr. Nolan Purdy','user','pacocha.tessie@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','UbwND7In2J','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(53,'Dominic Pacocha III','user','jacklyn.luettgen@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','3azJ662F6i','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(54,'Gregoria Kohler','user','megane.hilpert@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','auNroklRi4','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(55,'Waylon Bergnaum','user','reilly.shaniya@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','0N3GTnw690','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(56,'Marie Kertzmann','user','mgibson@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','f77Wl77iEC','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(57,'Layla Kunze III','user','rozella.legros@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Et3wflk9I9','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(58,'Maurine Witting','artist','ottilie31@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2C1BXb7Ry0','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(59,'Trystan Pfeffer DVM','artist','weissnat.adrienne@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','kaah4JHHQN','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(60,'Prof. Elyse Blanda Sr.','artist','williamson.gordon@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9BG2Iyps2Y','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(61,'Darion Lebsack','artist','barton.isai@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','iiIhZVV19N','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(62,'Jo Kris','artist','haley.wilmer@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Qc17O3voyI','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(63,'Reynold Skiles','artist','iwalsh@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ZkaSrXoGkN','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(64,'Alexandra Rau III','artist','oran01@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6JGmfEIbh3','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(65,'Gayle Kihn','artist','champlin.dario@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','STCDHOjsgk','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(66,'Sebastian Blanda Sr.','artist','lkrajcik@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fMpEdsSd27','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(67,'Karen Vandervort','artist','nicolas.wuckert@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','AvhnVlksgu','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(68,'Mr. Jesus Cassin','artist','sthiel@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PaFY7WlABX','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(69,'Mariah Bosco','artist','noelia18@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fgXtaXjcZP','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(70,'Afton Bashirian','artist','mclaughlin.calista@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PulBR50rLC','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(71,'Axel Gibson MD','artist','otto09@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','NSweBCQRvc','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(72,'Sophie Simonis','artist','ahauck@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4oJ3ruw5R6','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(73,'Rebekah Hettinger','artist','sigmund.raynor@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Ab3znkVCFe','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(74,'Haven Rice Jr.','artist','russ.yundt@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ObUWegUGJa','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(75,'Annetta Cremin','artist','kessler.jevon@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9WFWWS16GY','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(76,'Matteo Keeling','artist','demard@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','LX0Ad2S56X','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(77,'Trevor Emard','artist','thora91@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9QLlWhJXDz','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(78,'Haskell Hodkiewicz','artist','zelma29@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2Fshxetc3F','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(79,'Reggie Leffler','artist','gaylord.lonie@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','sUhpetkGha','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(80,'Baylee Hettinger','artist','witting.florida@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','EGfEKKVRxI','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(81,'Adela Schaden','artist','whauck@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','thJF4DjlHQ','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(82,'Luciano Ebert','artist','laurie20@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ZJ0YF9dc4p','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(83,'Alfonzo Koepp','artist','jermaine75@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','HfShQl6uWp','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(84,'Prof. Cory Maggio IV','artist','kerluke.christine@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mkEIVevOam','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(85,'Prof. Bernie Kshlerin','artist','hilario.ryan@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9VJjLr7EAB','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(86,'Mr. Emery Hoppe','artist','alexandra47@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','oziSgkswAb','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(87,'Mr. Pietro Hane II','artist','cyost@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rLrOcEp1ho','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(88,'Cecile Schowalter DDS','artist','franco84@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','IRbyZvZI26','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(89,'Garett Greenholt','artist','grobel@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','vxhINlTAAE','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(90,'Mr. Frankie Fahey','artist','fbogan@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','zr9t8wIfEc','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(91,'Maribel Okuneva','artist','jennifer59@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rjJwtA5kls','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(92,'Davonte Schmidt','artist','obergnaum@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fV6Hd8p4O4','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(93,'Florencio Wolff','artist','rafael72@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','LZFRiBbuQj','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(94,'Abbigail Stiedemann V','artist','towne.ramona@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','LEnU1dF7vv','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(95,'Tia Stehr I','artist','kosinski@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','TMVJ7g3uEC','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(96,'Annetta Grady','artist','morar.skyla@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6IFkd1TENH','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(97,'Lenny Bins','artist','turner.kassandra@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','oZOFU2wh4B','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(98,'Chris Schmeler','artist','gerry.smith@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','tfuBss8jvz','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(99,'Alexandra Sauer','artist','liza31@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ag7DtVnESb','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(100,'Osbaldo Koelpin','artist','wilkinson.millie@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lK2wgkI9aG','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(101,'Miracle Cronin II','artist','rozella.robel@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Cog44enx89','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(102,'Monserrat Bayer','artist','terrance.nicolas@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9tD4YQIo29','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(103,'Renee Boehm','artist','sigmund.hamill@example.com','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','gY64jzoNdP','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(104,'Anthony Schinner','artist','pkautzer@example.org','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','OMm24UnLyy','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(105,'Anika Koepp V','artist','bernier.terrance@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qBnb4SQGec','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(106,'Mr. Linwood Quigley','artist','esperanza.lynch@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','h9FYhGWrUy','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL),(107,'Evert Sawayn','artist','dawson.blanda@example.net','2023-05-14 10:59:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','yI4VkCsKOB','2023-05-14 10:59:43','2023-05-14 10:59:43',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2023-05-17 22:10:53
