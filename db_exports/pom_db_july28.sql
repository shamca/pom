# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     pom
# Server version:               5.1.48-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2010-07-28 16:50:35
# --------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for pom
DROP DATABASE IF EXISTS `pom`;
CREATE DATABASE IF NOT EXISTS `pom` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pom`;


# Dumping structure for table pom.poheader
DROP TABLE IF EXISTS `poheader`;
CREATE TABLE IF NOT EXISTS `poheader` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `version` longtext NOT NULL,
  `fiscalYear` date DEFAULT NULL,
  `vendor` varchar(100) DEFAULT NULL,
  `poNumber_id` bigint(100) NOT NULL,
  `justification` varchar(250) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `fiscal_year` datetime DEFAULT NULL,
  `po_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table pom.poheader: 0 rows
/*!40000 ALTER TABLE `poheader` DISABLE KEYS */;
/*!40000 ALTER TABLE `poheader` ENABLE KEYS */;


# Dumping structure for table pom.poitem
DROP TABLE IF EXISTS `poitem`;
CREATE TABLE IF NOT EXISTS `poitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `version` longtext,
  `POHeader_id` bigint(10) NOT NULL,
  `POItemDescription` varchar(200) DEFAULT NULL,
  `Qty` int(9) DEFAULT NULL,
  `CostPerUnit` float DEFAULT NULL,
  `ExtendedCost` float DEFAULT NULL,
  `Recipient` varchar(100) DEFAULT NULL COMMENT 'Who will ultimately receive the item?',
  `poitem_description` varchar(255) DEFAULT NULL,
  `cost_per_unit` float DEFAULT NULL,
  `extended_cost` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_poitem_poheader` (`POHeader_id`),
  KEY `FKC56C7192178AC364` (`POHeader_id`),
  CONSTRAINT `FKC56C7192178AC364` FOREIGN KEY (`POHeader_id`) REFERENCES `poheader` (`id`),
  CONSTRAINT `FK_poitem_poheader` FOREIGN KEY (`POHeader_id`) REFERENCES `poheader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table pom.poitem: 0 rows
/*!40000 ALTER TABLE `poitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `poitem` ENABLE KEYS */;


# Dumping structure for table pom.pouser
DROP TABLE IF EXISTS `pouser`;
CREATE TABLE IF NOT EXISTS `pouser` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `version` longtext,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` varchar(50) DEFAULT NULL,
  `userPw` varchar(50) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `user_pw` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `user_first_name` varchar(255) DEFAULT NULL,
  `user_last_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

# Dumping data for table pom.pouser: 2 rows
/*!40000 ALTER TABLE `pouser` DISABLE KEYS */;
INSERT INTO `pouser` (`id`, `version`, `modified`, `userId`, `userPw`, `user_id`, `user_pw`, `userName`, `user_first_name`, `user_last_name`, `first_name`, `last_name`, `user_name`) VALUES (3, '0', '2010-07-28 14:50:04', NULL, NULL, 'shaun', 'shaun', NULL, NULL, NULL, 'shaun', 'shaun', 'shaun'), (4, NULL, '2010-07-28 14:54:26', NULL, NULL, 'tom', 'tom', NULL, NULL, NULL, 'tom', 'tom', 'tom');
/*!40000 ALTER TABLE `pouser` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
