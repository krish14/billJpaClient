-- MySQL dump 10.13  Distrib 5.1.65, for Win32 (ia32)
--
-- Host: localhost    Database: bill
-- ------------------------------------------------------
-- Server version	5.1.65-community

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
-- Table structure for table `basedata_medicine`
--

DROP TABLE IF EXISTS `basedata_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basedata_medicine` (
  `product_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `product_type` varchar(50) NOT NULL,
  `product_group` varchar(50) NOT NULL,
  `product_measurement_id` int(10) NOT NULL,
  `product_measurement` int(10) NOT NULL,
  `product_units` varchar(50) NOT NULL,
  `manufacturer_id` int(5) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `measurement_table_product_measurement_id` int(10) NOT NULL,
  `manufacturer_details_manufacturer_id` int(5) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_basedata_medicine_measurement_table1_idx` (`measurement_table_product_measurement_id`),
  KEY `fk_basedata_medicine_manufacturer_details1_idx` (`manufacturer_details_manufacturer_id`),
  KEY `FKC005EBFEB5E63C58` (`product_measurement_id`),
  KEY `FKC005EBFE640D7D62` (`manufacturer_id`),
  CONSTRAINT `FKC005EBFE640D7D62` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer_details` (`manufacturer_id`),
  CONSTRAINT `FKC005EBFEB5E63C58` FOREIGN KEY (`product_measurement_id`) REFERENCES `measurement_table` (`product_measurement_id`),
  CONSTRAINT `fk_basedata_medicine_manufacturer_details1` FOREIGN KEY (`manufacturer_details_manufacturer_id`) REFERENCES `manufacturer_details` (`manufacturer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_basedata_medicine_measurement_table1` FOREIGN KEY (`measurement_table_product_measurement_id`) REFERENCES `measurement_table` (`product_measurement_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='basedata_medicine ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basedata_medicine`
--

LOCK TABLES `basedata_medicine` WRITE;
/*!40000 ALTER TABLE `basedata_medicine` DISABLE KEYS */;
/*!40000 ALTER TABLE `basedata_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_details`
--

DROP TABLE IF EXISTS `batch_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_details` (
  `product_batch` varchar(50) NOT NULL DEFAULT '',
  `product_id` int(10) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_batch`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='batch num details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_details`
--

LOCK TABLES `batch_details` WRITE;
/*!40000 ALTER TABLE `batch_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_details`
--

DROP TABLE IF EXISTS `bill_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_details` (
  `bill_id` int(100) NOT NULL AUTO_INCREMENT,
  `bill_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_name` varchar(100) NOT NULL,
  `doctor_id` int(5) NOT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_details`
--

LOCK TABLES `bill_details` WRITE;
/*!40000 ALTER TABLE `bill_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_details`
--

DROP TABLE IF EXISTS `date_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_details` (
  `product_date_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_batch` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `mfg_date` date NOT NULL,
  `exp_date` date NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `batch_details_product_batch` varchar(50) NOT NULL,
  `basedata_medicine_product_id` int(10) NOT NULL,
  PRIMARY KEY (`product_date_id`),
  KEY `fk_date_details_batch_details1_idx` (`batch_details_product_batch`),
  KEY `fk_date_details_basedata_medicine1_idx` (`basedata_medicine_product_id`),
  KEY `FK85BBFAB1FB88ED7E` (`product_id`),
  KEY `FK85BBFAB1C1C506AA` (`product_batch`),
  CONSTRAINT `FK85BBFAB1C1C506AA` FOREIGN KEY (`product_batch`) REFERENCES `batch_details` (`product_batch`),
  CONSTRAINT `FK85BBFAB1FB88ED7E` FOREIGN KEY (`product_id`) REFERENCES `basedata_medicine` (`product_id`),
  CONSTRAINT `fk_date_details_basedata_medicine1` FOREIGN KEY (`basedata_medicine_product_id`) REFERENCES `basedata_medicine` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_date_details_batch_details1` FOREIGN KEY (`batch_details_product_batch`) REFERENCES `batch_details` (`product_batch`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Date details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_details`
--

LOCK TABLES `date_details` WRITE;
/*!40000 ALTER TABLE `date_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `date_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_details`
--

DROP TABLE IF EXISTS `doctor_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_details` (
  `doctor_id` int(5) NOT NULL,
  `doctor_name` varchar(50) NOT NULL,
  `hospital_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_details`
--

LOCK TABLES `doctor_details` WRITE;
/*!40000 ALTER TABLE `doctor_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer_details`
--

DROP TABLE IF EXISTS `manufacturer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer_details` (
  `manufacturer_id` int(5) NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(500) NOT NULL,
  `manufacturer_short_name` varchar(5) NOT NULL,
  `manufacturer_sort_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer_details`
--

LOCK TABLES `manufacturer_details` WRITE;
/*!40000 ALTER TABLE `manufacturer_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement_table`
--

DROP TABLE IF EXISTS `measurement_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_table` (
  `product_measurement_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_measurement` int(10) NOT NULL,
  `product_unit` varchar(50) NOT NULL,
  PRIMARY KEY (`product_measurement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement_table`
--

LOCK TABLES `measurement_table` WRITE;
/*!40000 ALTER TABLE `measurement_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `measurement_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_qnt`
--

DROP TABLE IF EXISTS `product_qnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_qnt` (
  `product_qnt_id` int(50) NOT NULL AUTO_INCREMENT,
  `product_batch` varchar(50) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_qnt` int(10) NOT NULL,
  `basedata_medicine_product_id` int(10) NOT NULL,
  `batch_details_product_batch` varchar(50) NOT NULL,
  `product_qnt_it` int(11) NOT NULL,
  PRIMARY KEY (`product_qnt_id`),
  KEY `fk_product_qnt_basedata_medicine1_idx` (`basedata_medicine_product_id`),
  KEY `fk_product_qnt_batch_details1_idx` (`batch_details_product_batch`),
  KEY `FKA71CA2A7FB88ED7E` (`product_id`),
  KEY `FKA71CA2A7C1C506AA` (`product_batch`),
  CONSTRAINT `FKA71CA2A7C1C506AA` FOREIGN KEY (`product_batch`) REFERENCES `batch_details` (`product_batch`),
  CONSTRAINT `FKA71CA2A7FB88ED7E` FOREIGN KEY (`product_id`) REFERENCES `basedata_medicine` (`product_id`),
  CONSTRAINT `fk_product_qnt_basedata_medicine1` FOREIGN KEY (`basedata_medicine_product_id`) REFERENCES `basedata_medicine` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_qnt_batch_details1` FOREIGN KEY (`batch_details_product_batch`) REFERENCES `batch_details` (`product_batch`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_qnt`
--

LOCK TABLES `product_qnt` WRITE;
/*!40000 ALTER TABLE `product_qnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_qnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pruchase_details`
--

DROP TABLE IF EXISTS `pruchase_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pruchase_details` (
  `purchase_id` int(10) NOT NULL AUTO_INCREMENT,
  `bill_id` int(100) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_quantatiy` int(10) NOT NULL,
  `product_batch` varchar(50) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_rate_id` int(10) NOT NULL,
  `product_data_id` int(10) NOT NULL,
  `batch_details_product_batch` varchar(50) NOT NULL,
  `basedata_medicine_product_id` int(10) NOT NULL,
  `bill_details_bill_id` int(100) NOT NULL,
  `rate_details_product_rate_id` int(10) NOT NULL,
  `date_details_product_date_id` int(10) NOT NULL,
  PRIMARY KEY (`purchase_id`,`product_batch`),
  KEY `fk_pruchase_details_batch_details1_idx` (`batch_details_product_batch`),
  KEY `fk_pruchase_details_basedata_medicine1_idx` (`basedata_medicine_product_id`),
  KEY `fk_pruchase_details_bill_details1_idx` (`bill_details_bill_id`),
  KEY `fk_pruchase_details_rate_details1_idx` (`rate_details_product_rate_id`),
  KEY `fk_pruchase_details_date_details1_idx` (`date_details_product_date_id`),
  CONSTRAINT `fk_pruchase_details_basedata_medicine1` FOREIGN KEY (`basedata_medicine_product_id`) REFERENCES `basedata_medicine` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pruchase_details_batch_details1` FOREIGN KEY (`batch_details_product_batch`) REFERENCES `batch_details` (`product_batch`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pruchase_details_bill_details1` FOREIGN KEY (`bill_details_bill_id`) REFERENCES `bill_details` (`bill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pruchase_details_date_details1` FOREIGN KEY (`date_details_product_date_id`) REFERENCES `date_details` (`product_date_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pruchase_details_rate_details1` FOREIGN KEY (`rate_details_product_rate_id`) REFERENCES `rate_details` (`product_rate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pruchase_details`
--

LOCK TABLES `pruchase_details` WRITE;
/*!40000 ALTER TABLE `pruchase_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `pruchase_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_details` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_quantatiy` int(11) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `product_batch` varchar(255) DEFAULT NULL,
  `product_date_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_rate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `FK42C10D048A8C34AF` (`product_rate_id`),
  KEY `FK42C10D0420FD5698` (`product_date_id`),
  KEY `FK42C10D04FB88ED7E` (`product_id`),
  KEY `FK42C10D0440F1C271` (`bill_id`),
  CONSTRAINT `FK42C10D0440F1C271` FOREIGN KEY (`bill_id`) REFERENCES `bill_details` (`bill_id`),
  CONSTRAINT `FK42C10D0420FD5698` FOREIGN KEY (`product_date_id`) REFERENCES `date_details` (`product_date_id`),
  CONSTRAINT `FK42C10D048A8C34AF` FOREIGN KEY (`product_rate_id`) REFERENCES `rate_details` (`product_rate_id`),
  CONSTRAINT `FK42C10D04FB88ED7E` FOREIGN KEY (`product_id`) REFERENCES `basedata_medicine` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_details`
--

LOCK TABLES `purchase_details` WRITE;
/*!40000 ALTER TABLE `purchase_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_details`
--

DROP TABLE IF EXISTS `rate_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_details` (
  `product_rate_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_batch` varchar(50) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `cost_individual_rate` int(10) NOT NULL,
  `selling_individual_rate` int(10) NOT NULL,
  `rate_details` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `batch_details_product_batch` varchar(50) NOT NULL,
  `basedata_medicine_product_id` int(10) NOT NULL,
  `ratedetails` datetime DEFAULT NULL,
  PRIMARY KEY (`product_rate_id`),
  KEY `fk_rate_details_batch_details1_idx` (`batch_details_product_batch`),
  KEY `fk_rate_details_basedata_medicine1_idx` (`basedata_medicine_product_id`),
  KEY `FKF17305E3FB88ED7E` (`product_id`),
  KEY `FKF17305E3C1C506AA` (`product_batch`),
  CONSTRAINT `FKF17305E3C1C506AA` FOREIGN KEY (`product_batch`) REFERENCES `batch_details` (`product_batch`),
  CONSTRAINT `FKF17305E3FB88ED7E` FOREIGN KEY (`product_id`) REFERENCES `basedata_medicine` (`product_id`),
  CONSTRAINT `fk_rate_details_basedata_medicine1` FOREIGN KEY (`basedata_medicine_product_id`) REFERENCES `basedata_medicine` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rate_details_batch_details1` FOREIGN KEY (`batch_details_product_batch`) REFERENCES `batch_details` (`product_batch`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_details`
--

LOCK TABLES `rate_details` WRITE;
/*!40000 ALTER TABLE `rate_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_setup_details`
--

DROP TABLE IF EXISTS `tax_setup_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_setup_details` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(50) NOT NULL,
  `tax_desc` text NOT NULL,
  `tax_percentage` tinyint(5) NOT NULL,
  `tax_flag` tinyint(1) NOT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_setup_details`
--

LOCK TABLES `tax_setup_details` WRITE;
/*!40000 ALTER TABLE `tax_setup_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_setup_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authentication`
--

DROP TABLE IF EXISTS `user_authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authentication` (
  `USER_ID` int(11) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `ENABLED` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authentication`
--

LOCK TABLES `user_authentication` WRITE;
/*!40000 ALTER TABLE `user_authentication` DISABLE KEYS */;
INSERT INTO `user_authentication` VALUES (1,'alpha','pass1',1),(2,'mohan','esolve123',1),(4,'mohan','esolve123',1);
/*!40000 ALTER TABLE `user_authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authorization`
--

DROP TABLE IF EXISTS `user_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authorization` (
  `USER_ROLE_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ROLE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authorization`
--

LOCK TABLES `user_authorization` WRITE;
/*!40000 ALTER TABLE `user_authorization` DISABLE KEYS */;
INSERT INTO `user_authorization` VALUES (1,1,'ROLE_ADMIN'),(1,2,'ROLE_ADMIN'),(1,4,'ROLE_ADMIN');
/*!40000 ALTER TABLE `user_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_action_mapper`
--

DROP TABLE IF EXISTS `user_role_action_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_action_mapper` (
  `id` int(11) DEFAULT NULL,
  `USER_ROLE` int(11) DEFAULT NULL,
  `ACTIONS` int(11) DEFAULT NULL,
  `FLAG` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_action_mapper`
--

LOCK TABLES `user_role_action_mapper` WRITE;
/*!40000 ALTER TABLE `user_role_action_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role_action_mapper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-21 15:14:07
