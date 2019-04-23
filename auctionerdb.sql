CREATE DATABASE  IF NOT EXISTS `auctionerdb` CHARACTER SET utf8 COLLATE utf8_general_ci/*!40100 DEFAULT CHARACTER SET utf8 */;
USE `auctionerdb`;
UNLOCK TABLES;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: auctionerdb
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `auction_bidding`
--

DROP TABLE IF EXISTS `auction_bidding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction_bidding` (
  `auctionid` int(11) NOT NULL,
  `bidder_userid` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`auctionid`,`bidder_userid`,`amount`),
  KEY `fk_auction_bidding_users1_idx` (`bidder_userid`),
  CONSTRAINT `fk_auction_bidding_auctions1` FOREIGN KEY (`auctionid`) REFERENCES `auctions` (`auctionid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_auction_bidding_users1` FOREIGN KEY (`bidder_userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auction_categories`
--

DROP TABLE IF EXISTS `auction_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction_categories` (
  `auction_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`auction_id`,`category_id`),
  KEY `auction_categories_categoryid_fk_idx` (`category_id`),
  CONSTRAINT `auction_categories_auctionid_fk` FOREIGN KEY (`auction_id`) REFERENCES `auctions` (`auctionid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `auction_categories_categoryid_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auction_pictures`
--

DROP TABLE IF EXISTS `auction_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction_pictures` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `auction_id` int(11) NOT NULL,
  `auction_picturescol` longblob NOT NULL,
  PRIMARY KEY (`pic_id`),
  KEY `auction_pic_fk_idx` (`auction_id`),
  CONSTRAINT `auction_pic_fk` FOREIGN KEY (`auction_id`) REFERENCES `auctions` (`auctionid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `auction_more_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction_more_info` (

  `auctionid` int(11) NOT NULL,
  `power_steering` varchar(45),                       -- Усилитель руля
  `climate_control` varchar(45),                      -- Управление климатом
  `control_on_wheel` tinyint(4) NOT NULL DEFAULT '0', -- Мультируль
  `leather_wheel` tinyint(4) NOT NULL DEFAULT '0',    -- Отделка руля и рукоятки кпп кожей
  `heated_wheel` tinyint(4) NOT NULL DEFAULT '0',     -- Подогрев руля
  `heated_seats` varchar(45),                         -- Обогрев сидений
  `heated_mirrors` tinyint(4) NOT NULL DEFAULT '0',   -- Электро обогрев и электро настройка зеркал
  `power_windows` varchar(45),                           -- Электростеклоподъемники
  `power_seats_front` tinyint(4) NOT NULL DEFAULT '0',   -- Электропривод передних сидений
  `light_sensor` tinyint(4) NOT NULL DEFAULT '0',        -- Датчики света
  `rain_sensor` tinyint(4) NOT NULL DEFAULT '0',         -- Датчики дождя
  `front_parking_sensors` tinyint(4) NOT NULL DEFAULT '0',  -- Датчики парковки передний
  `rear_parking_sensors` tinyint(4) NOT NULL DEFAULT '0',   -- Датчики парковки задний
  `cruise_control` varchar(45),                             -- Круиз-контроль
  `on_board_computer` tinyint(4) NOT NULL DEFAULT '0',      -- Бортовой компьютер
  `alarm` varchar(45),                                      -- Сигнализация
  `airbags` tinyint(4) NOT NULL DEFAULT '0',                -- Подушки безопасности
  `abs` tinyint(4) NOT NULL DEFAULT '0',                    -- Антиблокировочная система тормозов ABS
  `directional_stability` tinyint(4) NOT NULL DEFAULT '0',  -- Система курсовой устойчивости ESP
  `anti_slip` tinyint(4) NOT NULL DEFAULT '0',              -- Противобуксовочная система TCS
  `car_stereo`  varchar(45),                                -- Магнитола
  `audioSystem`  varchar(45),                               -- Аудиоколонки
  `back_camera` tinyint(4) NOT NULL DEFAULT '0',            -- Камера заднего вида
  `headlights` varchar(45),                                 -- Головная оптика
  `wheels` varchar(45),                                     -- Размер колес
  `winter_tires` tinyint(4) NOT NULL DEFAULT '0',           -- Зимние шины
  `vehicle_log_book` tinyint(4) NOT NULL DEFAULT '0',       -- Сервисная книжка
  `warranty_on` tinyint(4) NOT NULL DEFAULT '0',            -- Заводская гарантия

  CONSTRAINT `fk_auctions` FOREIGN KEY (`auctionid`) REFERENCES `auctions` (`auctionid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `auctions`
--

DROP TABLE IF EXISTS `auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auctions` (
  `seller_userid` int(11) NOT NULL,
  `auctionid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45),
  `description` mediumtext,

  `brand` varchar(45),
  `model` varchar(45),
  `released` varchar(45),
  `run` varchar(45),
  `engine_type` varchar(45),
  `power` varchar(45),
  `engine_capacity` varchar(45),
  `transmission` varchar(45),
  `body` varchar(45),
  `drive` varchar(45),
  `color` varchar(45),
  `doors` varchar(45),
  `body_state` mediumtext,
  `owners` varchar(45),
  `vin` varchar(45),
  `gibdd` varchar(45),
  `youtube` varchar(200),
  `fssp` varchar(45),
  `damaged_elements` varchar(45),
  `city` varchar(45),
  `additional_info` mediumtext,
  `drive_state` mediumtext,
  `engine_state` mediumtext,
  `damagedElements`  varchar(250),
  `owners_db` varchar(45),
  `numberAccidents_db` varchar(45),
  `wanted_db` tinyint(4) NOT NULL DEFAULT '0',
  `taxi_db` tinyint(4) NOT NULL DEFAULT '0',
  `mileage_db` varchar(45),
  `restrictions_db` tinyint(4) NOT NULL DEFAULT '0',


  `first_bid` decimal(15,2) NOT NULL,
  `buy_price` decimal(15,2) DEFAULT NULL,
  `currently` decimal(15,2) NOT NULL,
  `number_of_bids` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `started` datetime NOT NULL,
  `ends` datetime NOT NULL,
  `isBought` tinyint(4) NOT NULL DEFAULT '0',
  `buyer_id` int(11) DEFAULT NULL,
  `buyer_notified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`auctionid`),
  KEY `fk_auctions_users1_idx` (`seller_userid`),
  KEY `fk_auctions_location1_idx` (`location_id`),
  KEY `fk_buyer_id_idx` (`buyer_id`),
  CONSTRAINT `fk_auctions_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_auctions_users1` FOREIGN KEY (`seller_userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3601 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `userid` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`,`role`),
  KEY `user_id_idx` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bidder_rating`
--

DROP TABLE IF EXISTS `bidder_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bidder_rating` (
  `rated_bidder_id` int(11) NOT NULL,
  `rater_bidder_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rated_bidder_id`,`rater_bidder_id`),
  KEY `rater_bidder_id_fk_idx` (`rater_bidder_id`),
  CONSTRAINT `rated_bidder_id_fk` FOREIGN KEY (`rated_bidder_id`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rater_bidder_id_fk` FOREIGN KEY (`rater_bidder_id`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `parent_id_fk_idx` (`parent_id`),
  CONSTRAINT `parent_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=728 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `global_messages`
--

DROP TABLE IF EXISTS `global_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_messages` (
  `g_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_message` mediumtext,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`g_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` mediumtext,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sender_username` varchar(45) NOT NULL,
  `receiver_username` varchar(45) NOT NULL,
  `sender_delete` tinyint(1) NOT NULL DEFAULT '0',
  `receiver_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_id`),
  KEY `receiver_id_fk_idx` (`receiver_id`),
  KEY `sender_id_fk_idx` (`sender_id`),
  CONSTRAINT `receiver_id_fk` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sender_id_fk` FOREIGN KEY (`sender_id`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommendations` (
  `user_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `prediction` double NOT NULL,
  PRIMARY KEY (`user_id`,`auction_id`),
  KEY `auction_rec_fk_idx` (`auction_id`),
  CONSTRAINT `auction_rec_fk` FOREIGN KEY (`auction_id`) REFERENCES `auctions` (`auctionid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_rec_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seller_rating`
--

DROP TABLE IF EXISTS `seller_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_rating` (
  `rated_seller_id` int(11) NOT NULL,
  `rater_seller_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rated_seller_id`,`rater_seller_id`),
  KEY `rater_seller_id_fk_idx` (`rater_seller_id`),
  CONSTRAINT `rated_seller_id_fk` FOREIGN KEY (`rated_seller_id`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rater_seller_id_fk` FOREIGN KEY (`rater_seller_id`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `similar`
--

DROP TABLE IF EXISTS `similar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `similar` (
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `similarity` double NOT NULL,
  PRIMARY KEY (`user1_id`,`user2_id`),
  KEY `user2_id_fk_idx` (`user2_id`),
  CONSTRAINT `user1_id_fk` FOREIGN KEY (`user1_id`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user2_id_fk` FOREIGN KEY (`user2_id`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_pictures`
--

DROP TABLE IF EXISTS `user_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_pictures` (
  `user_pictures_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` longblob NOT NULL,
  PRIMARY KEY (`user_pictures_id`),
  KEY `user_pics_fk_idx` (`user_id`),
  CONSTRAINT `user_pics_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45),
  `email` varchar(55) NOT NULL,
  `password` varchar(60) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `city` varchar(100) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `approved` tinyint(4) NOT NULL,
  `email_approved` tinyint(4) DEFAULT '0',
  `change_password` tinyint(4) DEFAULT '0',
  `bidder_rating` float DEFAULT NULL,
  `seller_rating` float DEFAULT NULL,
  `number_of_bidder_ratings` int(11) DEFAULT NULL,
  `number_of_seller_ratings` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3936 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-05  1:06:49

--
-- Dumping data for table `users`
--
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3936,'admin','Алексей','Жумаев','alexey221284@mail.ru','$2a$10$.e5ao7BXP/eZ2E2ybw7lNuwysIMHJgis4XL1Scupg2FhR7KecQPgO','+7-967-80-44-111','Саратов',NULL,NULL,1,1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `authorities`
--
LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (3936,'ROLE_ADMIN');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categories`
--
LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'cars',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `suggestions`;

CREATE TABLE `suggestions` (
  `suggestionid` int(11) NOT NULL AUTO_INCREMENT,
  `suggestion_date` datetime NOT NULL,
  `brand_and_model` varchar(45) NOT NULL DEFAULT '-',
  `release_date` varchar(45) NOT NULL DEFAULT '-',
  `name` varchar(45) NOT NULL DEFAULT '-',
  `phone_number` varchar(15) NOT NULL DEFAULT '-',
  `description` mediumtext,
  `sent_to_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (suggestionid)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

