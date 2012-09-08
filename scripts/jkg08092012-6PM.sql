-- MySQL dump 10.13  Distrib 5.1.63, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: jkg_db
-- ------------------------------------------------------
-- Server version	5.1.63-0ubuntu0.11.10.1

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
-- Table structure for table `inv_article_m`
--

DROP TABLE IF EXISTS `inv_article_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_article_m` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_code` varchar(50) NOT NULL,
  `article_desc` varchar(200) NOT NULL,
  `article_currency` varchar(20) NOT NULL,
  `article_price` float NOT NULL,
  PRIMARY KEY (`article_code`),
  UNIQUE KEY `article_id` (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_article_m`
--

LOCK TABLES `inv_article_m` WRITE;
/*!40000 ALTER TABLE `inv_article_m` DISABLE KEYS */;
INSERT INTO `inv_article_m` VALUES (88,'CLB-202','adgvas','USD',245),(90,'CLB-203','testDesc','USD',1.2e+08),(99,'DBSC-001','Dry Bath','USD',2338),(37,'DOB-150','Liter','USD',3190),(49,'DVR-120','TESTING','USD',1200),(47,'SX-500','Single Phase 220V 50Hz','YEN',882000),(87,'AR41L2','Arabidopsis Growth Chamber','USD',19134),(75,'H1','pan type humidifier with electronic RH  sensor','USD',1972),(73,'QWE','TESTING','USD',100),(89,'AG123','AGAINTESDESC','USD',5000),(106,'CHC-051F','Ductless Fume Hood','USD',6500),(98,'301-1-111107','Block 12X 15ml falcon','USD',248),(100,'Block -1-111103','Parameter 35x1.5ml','USD',202),(101,'301-1-111109','103*67*30mm water bath block','USD',248);
/*!40000 ALTER TABLE `inv_article_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_article_spec_m`
--

DROP TABLE IF EXISTS `inv_article_spec_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_article_spec_m` (
  `ARTICLE_ID` int(11) DEFAULT NULL,
  `article_total_lines` int(11) DEFAULT NULL,
  `article_lineNo` int(11) DEFAULT NULL,
  `article_spec` varchar(200) DEFAULT NULL,
  `article_spec_desc` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_article_spec_m`
--

LOCK TABLES `inv_article_spec_m` WRITE;
/*!40000 ALTER TABLE `inv_article_spec_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_article_spec_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_articletech_desc_m`
--

DROP TABLE IF EXISTS `inv_articletech_desc_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_articletech_desc_m` (
  `ARTICLE_ID` int(11) DEFAULT NULL,
  `article_total_lines` int(11) DEFAULT NULL,
  `article_lineNo` int(11) DEFAULT NULL,
  `articletech_desc` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_articletech_desc_m`
--

LOCK TABLES `inv_articletech_desc_m` WRITE;
/*!40000 ALTER TABLE `inv_articletech_desc_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_articletech_desc_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sal_contactdetails_t`
--

DROP TABLE IF EXISTS `sal_contactdetails_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sal_contactdetails_t` (
  `contactId` int(11) NOT NULL AUTO_INCREMENT,
  `ContactName` varchar(20) NOT NULL,
  `ContactAddress` varchar(200) NOT NULL,
  PRIMARY KEY (`contactId`)
) ENGINE=MyISAM AUTO_INCREMENT=344 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sal_contactdetails_t`
--

LOCK TABLES `sal_contactdetails_t` WRITE;
/*!40000 ALTER TABLE `sal_contactdetails_t` DISABLE KEYS */;
INSERT INTO `sal_contactdetails_t` VALUES (221,'RAm','C-6'),(220,'RAm','C-6'),(219,'RAm','C-6'),(333,'DIRECTOR','Institute of Himalayan Bioresource Technology<AnujTestingJKG>'),(343,'Dr Alok Sinha','National Institute for Plant Genomic Research<AnujTestingJKG>JNU Campus, PO Box 10531<AnujTestingJKG>New Delhi 110 067<AnujTestingJKG>'),(317,'THE DIRECTOR','NBPGR<AnujTestingJKG>IARI Campus <AnujTestingJKG>New Delhi-12<AnujTestingJKG>'),(288,'Prof. H.N.Mishra','Department of Agriculture and Food Engineering<AnujTestingJKG>Indian Institute of Technology, Kharagpur<AnujTestingJKG>Kharagpur-721 302 (India)<AnujTestingJKG>');
/*!40000 ALTER TABLE `sal_contactdetails_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sal_countrydetails_t`
--

DROP TABLE IF EXISTS `sal_countrydetails_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sal_countrydetails_t` (
  `SNo` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` text NOT NULL,
  `CountryAddress` text NOT NULL,
  `CountryAddressValue` text NOT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=MyISAM AUTO_INCREMENT=309 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sal_countrydetails_t`
--

LOCK TABLES `sal_countrydetails_t` WRITE;
/*!40000 ALTER TABLE `sal_countrydetails_t` DISABLE KEYS */;
INSERT INTO `sal_countrydetails_t` VALUES (285,'CHC','Country of Origin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Korea<AnujTestingJKG>Address of Manufacturer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHC Lab Co. Ltd<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Daeduck Techno Valley, 520-1 Youngsan Dong, Yusung-gu, <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Daejeon Korea.<AnujTestingJKG>Port of Shipment	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Any Korean Port<AnujTestingJKG>Price in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; US Dollars Currency<AnujTestingJKG>Validity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 months from the date of offer<AnujTestingJKG>Mode of Payment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thru SWIFT Transfer<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Advance or LC.<AnujTestingJKG>Custom Clearance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To be done by the customer only<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; All charges towards clearance, octroi, Custom duty etc as&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; applicable will be to your Account.<AnujTestingJKG>Order&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Should be placed directly to our principle <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; With a copy to us.<AnujTestingJKG>Custom Duty&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As Applicable to your account.<AnujTestingJKG>Delivery&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4-8 weeks after receipt of L/C or draft Installation	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Installation will be done by JKG Bio Science at your site, free of <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cost.<AnujTestingJKG>Warranty&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; One year from the date of installation.<AnujTestingJKG>',' '),(286,'CHC','Country of Origin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Korea<AnujTestingJKG>Address of Manufacturer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHC Lab Co. Ltd<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Daeduck Techno Valley, 520-1 Youngsan Dong, Yusung-gu, <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Daejeon Korea.<AnujTestingJKG>Port of Shipment	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Any Korean Port<AnujTestingJKG>Price in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; US Dollars Currency<AnujTestingJKG>Validity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 months from the date of offer<AnujTestingJKG>Mode of Payment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thru SWIFT Transfer<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Advance or LC.<AnujTestingJKG>Custom Clearance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To be done by the customer only<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; All charges towards clearance, octroi, Custom duty etc as&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; applicable will be to your Account.<AnujTestingJKG>Order&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Should be placed directly to our principle <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; With a copy to us.<AnujTestingJKG>Custom Duty&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As Applicable to your account.<AnujTestingJKG>Delivery&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4-8 weeks after receipt of L/C or draft Installation	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Installation will be done by JKG Bio Science at your site, free of <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cost.<AnujTestingJKG>Warranty&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; One year from the date of installation.<AnujTestingJKG>',' '),(264,'DAEWOOD','TESTING<AnujTestingJKG>',' '),(265,'DAEWOOD','TESTING<AnujTestingJKG>',' '),(266,'DAEWOOD','TESTING<AnujTestingJKG>',' '),(287,'CHC','Country of Origin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Korea<AnujTestingJKG>Address of Manufacturer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHC Lab Co. Ltd<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Daeduck Techno Valley, 520-1 Youngsan Dong, Yusung-gu, <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Daejeon Korea.<AnujTestingJKG>Port of Shipment	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Any Korean Port<AnujTestingJKG>Price in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; US Dollars Currency<AnujTestingJKG>Validity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 months from the date of offer<AnujTestingJKG>Mode of Payment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thru SWIFT Transfer<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Advance or LC.<AnujTestingJKG>Custom Clearance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To be done by the customer only<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; All charges towards clearance, octroi, Custom duty etc as&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; applicable will be to your Account.<AnujTestingJKG>Order&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Should be placed directly to our principle <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; With a copy to us.<AnujTestingJKG>Custom Duty&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As Applicable to your account.<AnujTestingJKG>Delivery&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4-8 weeks after receipt of L/C or draft Installation	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Installation will be done by JKG Bio Science at your site, free of <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cost.<AnujTestingJKG>Warranty&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; One year from the date of installation.<AnujTestingJKG>',' '),(291,'MRC','<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Country of Origin				Israel<AnujTestingJKG>Address of Manufacturer			MRC Ltd, Haistadrut 84 Holon<AnujTestingJKG>Israel 58393<AnujTestingJKG>Port of Shipment				Israel<AnujTestingJKG>Price in 					US Dollars Currency<AnujTestingJKG>Validity					90 days from the due date of offer<AnujTestingJKG>Mode of Payment				within 30 days of shipment thru SWIFT <AnujTestingJKG>						Transfer<AnujTestingJKG>Custom Clearance				To be done by the customer only<AnujTestingJKG>All charges towards clearance, octroi, Custom duty etc as applicable will be to your Account.<AnujTestingJKG>Order						Should be placed directly to our principle <AnujTestingJKG>With a copy to us.<AnujTestingJKG>Custom Duty					As Applicable to your account.<AnujTestingJKG>Delivery					4-8 weeks after receipt of confirmed order<AnujTestingJKG>Installation					Installation will be done by JKG Bio <AnujTestingJKG>Science at your site.<AnujTestingJKG>Warranty					One year from the date of installation. <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <AnujTestingJKG>',' '),(292,'MRC','<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Country of Origin				Israel<AnujTestingJKG>Address of Manufacturer			MRC Ltd, Haistadrut 84 Holon<AnujTestingJKG>Israel 58393<AnujTestingJKG>Port of Shipment				Israel<AnujTestingJKG>Price in 					US Dollars Currency<AnujTestingJKG>Validity					90 days from the due date of offer<AnujTestingJKG>Mode of Payment				within 30 days of shipment thru SWIFT <AnujTestingJKG>						Transfer<AnujTestingJKG>Custom Clearance				To be done by the customer only<AnujTestingJKG>All charges towards clearance, octroi, Custom duty etc as applicable will be to your Account.<AnujTestingJKG>Order						Should be placed directly to our principle <AnujTestingJKG>With a copy to us.<AnujTestingJKG>Custom Duty					As Applicable to your account.<AnujTestingJKG>Delivery					4-8 weeks after receipt of confirmed order<AnujTestingJKG>Installation					Installation will be done by JKG Bio <AnujTestingJKG>Science at your site.<AnujTestingJKG>Warranty					One year from the date of installation. <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <AnujTestingJKG>',' '),(293,'MRC','<AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Country of Origin				Israel<AnujTestingJKG>Address of Manufacturer			MRC Ltd, Haistadrut 84 Holon<AnujTestingJKG>Israel 58393<AnujTestingJKG>Port of Shipment				Israel<AnujTestingJKG>Price in 					US Dollars Currency<AnujTestingJKG>Validity					90 days from the due date of offer<AnujTestingJKG>Mode of Payment				within 30 days of shipment thru SWIFT <AnujTestingJKG>						Transfer<AnujTestingJKG>Custom Clearance				To be done by the customer only<AnujTestingJKG>All charges towards clearance, octroi, Custom duty etc as applicable will be to your Account.<AnujTestingJKG>Order						Should be placed directly to our principle <AnujTestingJKG>With a copy to us.<AnujTestingJKG>Custom Duty					As Applicable to your account.<AnujTestingJKG>Delivery					4-8 weeks after receipt of confirmed order<AnujTestingJKG>Installation					Installation will be done by JKG Bio <AnujTestingJKG>Science at your site.<AnujTestingJKG>Warranty					One year from the date of installation. <AnujTestingJKG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <AnujTestingJKG>',' '),(306,'Tomy','	<p>Test&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span&nbsp;class=\"caps\">TEST</span></p>\n\n	<p>1.&nbsp;Validity:&nbsp;60&nbsp;days&nbsp;from&nbsp;the&nbsp;date&nbsp;of&nbsp;offer.<br>\n2.&nbsp;<span&nbsp;class=\"caps\">VAT&nbsp;</span>@&nbsp;12.5%.<br>\n3.&nbsp;Delivery:&nbsp;Ex-stock&nbsp;or&nbsp;within&nbsp;4&#8211;8&nbsp;weeks&nbsp;after&nbsp;receipt&nbsp;of&nbsp;order.<br>\n4.&nbsp;Warranty:&nbsp;One&nbsp;year&nbsp;from&nbsp;the&nbsp;date&nbsp;of&nbsp;Delivery/&nbsp;installation.<br>\n5.&nbsp;Payment:&nbsp;Against&nbsp;delivery/&nbsp;Installation.&nbsp;In&nbsp;case&nbsp;of&nbsp;delay,&nbsp;interest&nbsp;@&nbsp;24%&nbsp;pa&nbsp;shall&nbsp;be&nbsp;charged.</p>',' '),(307,'Tomy','	<p>Test&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span&nbsp;class=\"caps\">TEST</span></p>\n\n	<p>1.&nbsp;Validity:&nbsp;60&nbsp;days&nbsp;from&nbsp;the&nbsp;date&nbsp;of&nbsp;offer.<br>\n2.&nbsp;<span&nbsp;class=\"caps\">VAT&nbsp;</span>@&nbsp;12.5%.<br>\n3.&nbsp;Delivery:&nbsp;Ex-stock&nbsp;or&nbsp;within&nbsp;4&#8211;8&nbsp;weeks&nbsp;after&nbsp;receipt&nbsp;of&nbsp;order.<br>\n4.&nbsp;Warranty:&nbsp;One&nbsp;year&nbsp;from&nbsp;the&nbsp;date&nbsp;of&nbsp;Delivery/&nbsp;installation.<br>\n5.&nbsp;Payment:&nbsp;Against&nbsp;delivery/&nbsp;Installation.&nbsp;In&nbsp;case&nbsp;of&nbsp;delay,&nbsp;interest&nbsp;@&nbsp;24%&nbsp;pa&nbsp;shall&nbsp;be&nbsp;charged.</p>',' '),(308,'Tomy','	<p>Test&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span&nbsp;class=\"caps\">TEST</span></p>\n\n	<p>1.&nbsp;Validity:&nbsp;60&nbsp;days&nbsp;from&nbsp;the&nbsp;date&nbsp;of&nbsp;offer.<br>\n2.&nbsp;<span&nbsp;class=\"caps\">VAT&nbsp;</span>@&nbsp;12.5%.<br>\n3.&nbsp;Delivery:&nbsp;Ex-stock&nbsp;or&nbsp;within&nbsp;4&#8211;8&nbsp;weeks&nbsp;after&nbsp;receipt&nbsp;of&nbsp;order.<br>\n4.&nbsp;Warranty:&nbsp;One&nbsp;year&nbsp;from&nbsp;the&nbsp;date&nbsp;of&nbsp;Delivery/&nbsp;installation.<br>\n5.&nbsp;Payment:&nbsp;Against&nbsp;delivery/&nbsp;Installation.&nbsp;In&nbsp;case&nbsp;of&nbsp;delay,&nbsp;interest&nbsp;@&nbsp;24%&nbsp;pa&nbsp;shall&nbsp;be&nbsp;charged.</p>',' ');
/*!40000 ALTER TABLE `sal_countrydetails_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sal_optiondetails_t`
--

DROP TABLE IF EXISTS `sal_optiondetails_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sal_optiondetails_t` (
  `SNo` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` varchar(20) NOT NULL,
  `itemCode` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `unitPrice` varchar(20) NOT NULL,
  `currency` varchar(10) NOT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=MyISAM AUTO_INCREMENT=582 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sal_optiondetails_t`
--

LOCK TABLES `sal_optiondetails_t` WRITE;
/*!40000 ALTER TABLE `sal_optiondetails_t` DISABLE KEYS */;
INSERT INTO `sal_optiondetails_t` VALUES (513,'AG123','','','','USD'),(512,'AG123','','','','USD'),(511,'AG123','','','','USD'),(510,'AG123','','','','USD'),(509,'AG123','','','','USD'),(508,'AG123','','','','USD'),(507,'AG123','','','','USD'),(506,'AG123','g-34','tresty','400','USD'),(505,'AG123','','','','USD'),(504,'CLB-202','C9','Intellus web server','1369','USD'),(482,'SX-500','ACA 315K','Stainless Basket','29200','USD'),(481,'SX-500','ACA-315B','Stainless Basket','29200','USD'),(514,'AG123','Q-123','TEST','1000','USD'),(515,'CLB-203','H1','dasifkasbg dasufhawsugf fhwa weuhfig qeuiohfwdashgf wehfwhs gohgfoqhawogh weohfquoe hgqwoehf wqfsg','200','USD'),(516,'CLB-203','H2','dasifkasbg dasufhawsugf fhwa weuhfig qeuiohfwdashgf wehfwhs gohgfoqhawogh weohfquoe hgqwoehf wqfsg','200','USD');
/*!40000 ALTER TABLE `sal_optiondetails_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sal_quotation_t`
--

DROP TABLE IF EXISTS `sal_quotation_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sal_quotation_t` (
  `QuotationId` int(11) NOT NULL AUTO_INCREMENT,
  `ClientName` varchar(50) NOT NULL,
  `QuotDate` date NOT NULL,
  `TotalAmt` varchar(10) NOT NULL,
  `Subject` varchar(200) NOT NULL,
  `Reference` varchar(20) NOT NULL,
  `loginId` varchar(20) NOT NULL,
  `CompanyName` varchar(50) NOT NULL,
  PRIMARY KEY (`QuotationId`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sal_quotation_t`
--

LOCK TABLES `sal_quotation_t` WRITE;
/*!40000 ALTER TABLE `sal_quotation_t` DISABLE KEYS */;
INSERT INTO `sal_quotation_t` VALUES (1,'RAm','0000-00-00','10996','TEST','JKG/11-12/','admin','Percival'),(2,'RAm','2012-05-16','15776','TESTING','JKG/11-12/','admin','Percival'),(3,'RAm','2012-05-16','9300','TESTING','JKG/11-12/','admin','Percival'),(4,'RAm','2012-05-17','9300','TESTING','JKG/11-12/','admin','Percival'),(5,'RAM','2012-05-17','10738','Test','JKG/11-12/','admin','Percival'),(6,'Director','2012-05-17','','Quotation for Purchase of Walk in Type Plant Growth Chamber from M/s Percival Scientific, USA ','JKG/11-12/','admin',''),(7,'Dr Alok Sinha','2012-05-19','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(8,'Dr Alok Sinha','2012-05-19','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(9,'Dr Alok Sinha','2012-05-19','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(10,'Dr Alok Sinha','2012-05-19','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(11,'Dr Alok Sinha','2012-05-19','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(12,'Dr Alok Sinha','2012-05-19','10176','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(13,'Dr Alok Sinha','2012-05-19','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(14,'Dr Alok Sinha','2012-05-19','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(15,'Dr Alok Sinha','2012-05-19','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(16,'Dr Alok Sinha','2012-05-19','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(17,'Dr Alok Sinha','2012-05-19','10176','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(18,'RAm','2012-05-19','7458','TESTING','JKG/11-12/','admin','Percival'),(19,'Dr Alok Sinha','2012-05-19','10176','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(20,'Dr Alok Sinha','2012-05-19','10176','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(21,'Dr Alok Sinha','2012-05-19','10176','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(22,'Dr Alok Sinha','2012-05-19','10176','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(23,'Dr Alok Sinha','2012-05-19','10176','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(24,'Dr Alok Sinha','2012-05-20','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(25,'Dr Alok Sinha','2012-05-20','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(26,'Dr Alok Sinha','2012-05-20','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(27,'Dr Alok Sinha','2012-05-21','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(28,'Dr Alok Sinha','2012-05-21','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(29,'Dr Alok Sinha','2012-05-21','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(30,'Dr Alok Sinha','2012-05-21','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(31,'Dr Alok Sinha','2012-05-21','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(32,'Dr Alok Sinha','2012-05-21','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(33,'Dr Alok Sinha','2012-05-21','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(34,'Dr Alok Sinha','2012-05-21','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(35,'Dr Alok Sinha','2012-05-21','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(36,'Dr Alok Sinha','2012-05-21','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(37,'Dr Alok Sinha','2012-05-21','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(38,'Prof. H.N.Mishra','2012-05-23','7838','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(39,'Prof. H.N.Mishra','2012-05-23','2638','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(40,'THE DIRECTOR','2012-05-25','8690','Quotation for B.O.D Incubator from M/s MRC Israel','JKG/11-12/','admin','Percival'),(41,'THE DIRECTOR','2012-05-25','3990','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(42,'THE DIRECTOR','2012-05-25','8690','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(43,'THE DIRECTOR','2012-05-25','3190','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(44,'Dr Alok Sinha','2012-05-25','3890','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(45,'Dr Alok Sinha','2012-05-25','6700','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(46,'Dr Alok Sinha','2012-05-25','6700','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(47,'Prof. H.N.Mishra','2012-05-26','8358','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(48,'The Director','2012-05-26','982000','Quotation for Autoclave from M/s. Tomy Digital Biology.','JKG/11-12/','admin','Tomy'),(49,'The Director','2012-05-26','982000','Quotation for Autoclave from M/s. Tomy Digital Biology.','JKG/11-12/','admin','Tomy'),(50,'The Director','2012-05-26','982000','Quotation for Autoclave from M/s. Tomy Digital Biology.','JKG/11-12/','admin','Tomy'),(51,'Dr Alok Sinha','2012-05-26','982000','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Tomy'),(52,'Dr Alok Sinha','2012-05-26','982000','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Tomy'),(53,'Dr Alok Sinha','2012-05-26','982000','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Tomy'),(54,'Dr Alok Sinha','2012-05-26','982000','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Tomy'),(55,'Dr Alok Sinha','2012-05-26','7638','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(56,'Dr Alok Sinha','2012-05-26','6500','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(57,'Dr Alok Sinha','2012-05-27','2338','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Tomy'),(58,'Dr Alok Sinha','2012-05-27','2238','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(59,'Dr Alok Sinha','2012-05-27','2238','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(60,'Dr Alok Sinha','2012-05-27','2138','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(61,'Dr Alok Sinha','2012-05-27','2338','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(62,'Dr Alok Sinha','2012-05-27','2338','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(63,'Dr Alok Sinha','2012-05-27','2238','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(64,'Dr Alok Sinha','2012-05-27','2138','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(65,'Dr Alok Sinha','2012-05-27','2238','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(66,'Dr Alok Sinha','2012-05-27','2238','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(67,'Dr Alok Sinha','2012-05-27','9876','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(68,'Dr Alok Sinha','2012-05-27','2238','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(69,'Dr Alok Sinha','2012-05-27','2238','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(70,'Dr Alok Sinha','2012-05-27','2238','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(71,'Dr Alok Sinha','2012-05-27','2238','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(72,'Dr Alok Sinha','2012-05-27','2238','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(73,'THE DIRECTOR','2012-05-28','19024','Quotation for Arabidopsis Growth Chamber from M/s. Percival Scientific USA','JKG/11-12/','admin','Percival'),(74,'THE DIRECTOR','2012-05-30','','Quotation for Arabidopsis Growth Chamber from M/s. Percival Scientific USA','JKG/11-12/','admin','Percival'),(75,'THE DIRECTOR','2012-06-01','24134','Quotation for Arabidopsis Growth Chamber from M/s. Percival Scientific USA','JKG/11-12/','admin','Percival'),(76,'THE DIRECTOR','2012-06-02','','Quotation for Arabidopsis Growth Chamber from M/s. Percival Scientific USA','JKG/11-12/','admin','Percival'),(77,'Dr Alok Sinha','2012-06-02','','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin',''),(78,'Dr Alok Sinha','2012-06-02','','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(79,'Dr Alok Sinha','2012-06-02','','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','Percival'),(80,'Dr Alok Sinha','2012-06-04','26506','Quotation for Arabidopsis Growth Chamber from M/s. Percival Scientific USA','JKG/11-12/','admin','Percival'),(81,'DIRECTOR','2012-07-27','145','TESTING','JKG/11-12/','admin','Percival'),(82,'DIRECTOR','2012-07-27','119','TESTING','JKG/11-12/','admin','DAEWOOD'),(83,'DIRECTOR','2012-07-27','119','TESTING','JKG/11-12/','admin',''),(84,'DIRECTOR','2012-07-28','119','TESTING','JKG/11-12/','admin','DAEWOOD'),(85,'DIRECTOR','2012-07-28','119','TESTING','JKG/11-12/','admin','DAEWOOD'),(86,'DIRECTOR','2012-07-28','119','TESTING','JKG/11-12/','admin','DAEWOOD'),(87,'DIRECTOR','2012-07-28','119','TESTING','JKG/11-12/','admin','DAEWOOD'),(88,'DIRECTOR','2012-07-28','119','TESTING','JKG/11-12/','admin','DAEWOOD'),(89,'DIRECTOR','2012-07-28','145','TESTING','JKG/11-12/','admin','Tomy'),(90,'DIRECTOR','2012-07-30','119','TESTING','JKG/11-12/','admin','Tomy'),(91,'DIRECTOR','2012-08-01','119','TESTING','JKG/11-12/','admin','Tomy'),(92,'DIRECTOR','2012-08-04','119898879','TESTING','JKG/11-12/','admin','Tomy'),(93,'Dr Alok Sinha','2012-08-27','7500','Quotation for Ductless Fume Hood, Heating-Cooling Block and Blotting apparatus. ','JKG/11-12/','admin','CHC'),(94,'Dr Alok Sinha','2012-09-02','7500','Quotation for Ductless Fume Hood from M/s CHC Lab.','JKG/11-12/','admin','CHC '),(95,'Dr Alok Sinha','2012-09-05','7700','Quotation for Ductless Fume Hood from M/s CHC Lab.','JKG/11-12/','admin','CHC'),(96,'Dr Alok Sinha','2012-09-05','3336','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','MRC'),(97,'Dr Alok Sinha','2012-09-05','3336','Quotation for Heating/Cooling Bath from M/s. MRC.','JKG/11-12/','admin','MRC'),(98,'Dr Alok Sinha','2012-09-06','7500','Quotation for Ductless Fume Hood from M/s CHC Lab.','JKG/11-12/','admin','Tomy'),(99,'Dr Alok Sinha','2012-09-06','7500','Quotation for Ductless Fume Hood from M/s CHC Lab.','JKG/11-12/','admin','Tomy'),(100,'Dr Alok Sinha','2012-09-07','6500','Quotation for Semi Dry Blotter from M/s. Wealtec Corporation','JKG/11-12/','admin','Tomy'),(101,'Dr Alok Sinha','2012-09-07','6500','Quotation for Semi Dry Blotter from M/s. Wealtec Corporation','JKG/11-12/','admin','Tomy'),(102,'Dr Alok Sinha','2012-09-07','6500','fghjkl','JKG/11-12/','admin','Tomy');
/*!40000 ALTER TABLE `sal_quotation_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sal_quotationarticledesc_t`
--

DROP TABLE IF EXISTS `sal_quotationarticledesc_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sal_quotationarticledesc_t` (
  `SNo` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` varchar(20) NOT NULL,
  `articleDesc` varchar(20) NOT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sal_quotationarticledesc_t`
--

LOCK TABLES `sal_quotationarticledesc_t` WRITE;
/*!40000 ALTER TABLE `sal_quotationarticledesc_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sal_quotationarticledesc_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sal_quotationarticlespec_t`
--

DROP TABLE IF EXISTS `sal_quotationarticlespec_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sal_quotationarticlespec_t` (
  `SNo` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` varchar(20) NOT NULL,
  `articleSpec` varchar(200) NOT NULL,
  `article_spec` varchar(200) NOT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sal_quotationarticlespec_t`
--

LOCK TABLES `sal_quotationarticlespec_t` WRITE;
/*!40000 ALTER TABLE `sal_quotationarticlespec_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sal_quotationarticlespec_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sal_quotationdetails_t`
--

DROP TABLE IF EXISTS `sal_quotationdetails_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sal_quotationdetails_t` (
  `Quotation_Id` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` varchar(20) NOT NULL,
  `ArticleDesc` varchar(200) NOT NULL,
  `ArticleTechDesc` text NOT NULL,
  `articleQty` varchar(10) NOT NULL,
  `articleCurr` varchar(10) NOT NULL,
  `articlePrice` varchar(20) NOT NULL,
  PRIMARY KEY (`Quotation_Id`),
  UNIQUE KEY `articleId` (`articleId`,`articleQty`,`articlePrice`)
) ENGINE=MyISAM AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sal_quotationdetails_t`
--

LOCK TABLES `sal_quotationdetails_t` WRITE;
/*!40000 ALTER TABLE `sal_quotationdetails_t` DISABLE KEYS */;
INSERT INTO `sal_quotationdetails_t` VALUES (139,'CLB-203','testDesc','TESTSPEC<AnujTestingJKG>','1','USD','120000000'),(48,'PGW-40','Walk in','','1','USD','70134'),(148,'DBSC-001','Dry Bath','Heat/Cool Dry bath for Microtube (without Bock)<AnujTestingJKG>Heat/ Cool shaker for Microtube<AnujTestingJKG>Temp.Setting range: 0&deg;C - 100&deg;C<AnujTestingJKG>Timing Range:up to 100hrs<AnujTestingJKG>Mixing speed:up to 1500rpm<AnujTestingJKG>Mixing Orbit :2mm<AnujTestingJKG>Dimensions (mm):L300xW220xH170<AnujTestingJKG>Net Weight	: 8.5kg<AnujTestingJKG>(Please refer to catalog for more details)<AnujTestingJKG>','1','USD','2338.00'),(149,'Block -1-111103','Parameter 35x1.5ml','-<AnujTestingJKG>','1','USD','202.00'),(150,'301-1-111109','103*67*30mm water bath block','-<AnujTestingJKG>','1','USD','248.00'),(86,'DOB-150','Liter','System	Forced Air Convection<AnujTestingJKG>Temp.range	-10C - + 60C<AnujTestingJKG>Temp. Constancy	ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â±0.1C<AnujTestingJKG>Temp.Uniformity	1 C (at 37C)<AnujTestingJKG>Inside Material	SUS-304<AnujTestingJKG>Temp.Control	PID<AnujTestingJKG>Temp.Sensor	PT-100ÃƒÆ’Ã†â€™Ãƒâ€¦Ã‚Â½ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â©<AnujTestingJKG>Temp.heat up rate	25C  - 60C(Within 15 minutes)<AnujTestingJKG>Temp.cool-down rate	25C - 0C (within 15min)<AnujTestingJKG>Heater :Incubator	500W<AnujTestingJKG>Refrigerator	1/5HP<AnujTestingJKG>Safety devices	Short circuit breaker, overheat protector refrigerator overload protector, sensor abnormality, over low protector<AnujTestingJKG>Inside dimensions(mm)	W600XD500 X H500<AnujTestingJKG>Outside dimensions (mm)	W680XD760XH890<AnujTestingJKG>Volume (liters)	150<AnujTestingJKG>Shelf	2<AnujTestingJKG>Power supply	110/220v(8A)<AnujTestingJKG>Weight	77 kg<AnujTestingJKG>','1','USD','3190.00'),(98,'DVR-120','TESTING','System	Forced Air Convection<AnujTestingJKG>Temp.range	-10Ã‹Å¡C - + 60Ã‹Å¡C<AnujTestingJKG>Temp. Constancy	Ã‚Â±0.1Ã‹Å¡C<AnujTestingJKG>Temp.Uniformity	1 Ã‹Å¡C (at 37Ã‹Å¡C)<AnujTestingJKG>Inside Material	SUS-304<AnujTestingJKG>Temp.Control	PID<AnujTestingJKG>Temp.Sensor	PT-100ÃŽÂ©<AnujTestingJKG>Temp.heat up rate	25Ã‹Å¡C  - 60Ã‹Å¡C(Within 15 minutes)<AnujTestingJKG>Temp.cool-down rate	25Ã‹Å¡C - 0Ã‹Å¡C (within 15min)<AnujTestingJKG>Heater :Incubator	500W<AnujTestingJKG>Refrigerator	1/5HP<AnujTestingJKG>Safety devices	Short circuit breaker, overheat protector refrigerator overload protector, sensor abnormality, over low protector<AnujTestingJKG>Inside dimensions(mm)	W600XD500 X H500<AnujTestingJKG>Outside dimensions (mm)	W680XD760XH890<AnujTestingJKG>Volume (liters)	150<AnujTestingJKG>Shelf	2<AnujTestingJKG>Power supply	110/220v(8A)<AnujTestingJKG>Weight	77 kg<AnujTestingJKG>','1','USD','1200.00'),(96,'SX-500','Single Phase 220V 50Hz','Operating temperature range   Sterilizing	: 105~135ÂºC (0.019MPa~0.212MPa<AnujTestingJKG>				 Heating	: 45~104ÂºC (0~0.015MPa)<AnujTestingJKG>				Warming	: 45~95ÂºC<AnujTestingJKG>Maximum operating pressure			: 0.263MPa<AnujTestingJKG>Temperature Display				: Digital<AnujTestingJKG>Pressure Gauge/Display Range			: Analog/0~0.4MPa<AnujTestingJKG>Heat source					: 2.0 Kwan electric heater<AnujTestingJKG>Safety Device					: Water level sensor/Current leakage breaker/Lid interlock/Over heat prevention/Over pressure prevention/Open temperature sensor detection/safety value<AnujTestingJKG>Time Display					: 1to99hours, 1 to 999 minutes<AnujTestingJKG>                       					  (variable0:01 to 9:59/10 to 99)<AnujTestingJKG>                    	                                                       Variable: 1 to 99 hours/fixed to 4 hours<AnujTestingJKG>Chamber dimension				: Ã˜325x733mm<AnujTestingJKG>Chamber capacity				: Effective internal volume: 50L<AnujTestingJKG>                                                         		  Internal volume of the chamber: 58L<AnujTestingJKG>Chamber material				: SUS304<AnujTestingJKG>Dimensions (mm)				: 410W, 477D, 970H (With projection: 574D)<AnujTestingJKG>Weight						: 72kg<AnujTestingJKG>Rated voltage					: 230V AC<AnujTestingJKG>Required Power supply				: Single phase120V AC (50/60Hz) 20A or    more<AnujTestingJKG>						  Single phase 230VAC (50/60Hz) 15A or more<AnujTestingJKG>Power consumption (calorific power)		: 2kw (25801720kcal/h) <AnujTestingJKG>                                                                                 Stainless basket (Ã˜300x182mm) 2<AnujTestingJKG>Accessories	: Chamber bottom plate 1, <AnujTestingJKG>  Caster stoppers4, Operation manual 1, Clear 	folder      (for storing the operation manual) 1, screw (for attaching the clear folder) 1, warranty card1, customer card1, inspection sheet 1<AnujTestingJKG>','1','YEN','882000.00'),(136,'AR41L2','Arabidopsis Growth Chamber','1 Each:&nbsp; Percival Scientific Multi-Purpose Growth Chamber Model AR-41L2 with: INTELLUS&reg; Ultra Control System for temperature and photoperiod.<AnujTestingJKG>Single board solid state design<AnujTestingJKG>10 key membrane keypad with LED indicators and vacuum fluorescent display<AnujTestingJKG>Real time or circadian (countdown) programming<AnujTestingJKG>Programs can be run in ramping or non-ramping modes<AnujTestingJKG>Multiple programs may be linked to simulate natural conditions<AnujTestingJKG>auge interior and 18-gauge exterior electro-zinc plated steel construction. all seams and joints on the outer and inner shells are welded<AnujTestingJKG>Finish interior and Exterior is painted with highly reflective, environmentally friendly; high temperature baked white powder coating. <AnujTestingJKG>Temperature range: 4Â° to 44Â° C (&plusmn; 0.5Â° C) lights OFF, 7Â° to 44Â° C (&plusmn; 0.5Â° C) lights ON.<AnujTestingJKG>Cool white fluorescent lamps and incandescent lamps over each tier; <AnujTestingJKG>With light intensity up to 370 micromoles/m2/s. <AnujTestingJKG>Interior space 37.6 cubic feet (1.06 m3) with a work area 13.8 ft2 (1.3 m2) provided on two shelves. <AnujTestingJKG>Shelving two tiers of white epoxy coated steel wire shelving each shelf is 27&#226;?? D x 36 Â¼&#226;?? W (68.58 cm x 92.07 cm). Shelves are vertically adjustable in Â½&#226;?? increments. The maximum growing height is 22&#226;?? (55.88 cm) per tier.<AnujTestingJKG>Electrical requirement: Standard chamber is 220VAC/1/50 Insulation woodless construction using CFC free insulation. Overall wall thickness is 2&#226;?? (5.1 cm) and includes ample insulation for maintenance of stated temperature range.<AnujTestingJKG>','1','USD','19134.00'),(137,'CLB-202','adgvas','dasvgasf<AnujTestingJKG>','1','USD','245.00'),(124,'H1','pan type humidifier with electronic RH  sensor','-<AnujTestingJKG>','1','USD','1972.00'),(122,'QWE','TESTING','&#8486;<AnujTestingJKG>','1','USD','100.00'),(138,'AG123','AGAINTESDESC','SPEC<AnujTestingJKG>','1','USD','5000'),(155,'CHC-051F','Ductless Fume Hood','Exterior 1200x825x212 (WxDxH)<AnujTestingJKG>Interior&nbsp;&nbsp; 1180x620x730 (WxDxH)<AnujTestingJKG>Filter Type: according to chemicals<AnujTestingJKG>Blower: Centrifugal blower<AnujTestingJKG>Volume of air treated: 320 m2/hr<AnujTestingJKG>Voltage: 220-230 volts, 50/60 Hz<AnujTestingJKG>Wattage: 200w, Sound level: 52dB<AnujTestingJKG>','1','USD','6500.00'),(147,'301-1-111107','Block 12X 15ml falcon','-<AnujTestingJKG>','1','USD','248.00');
/*!40000 ALTER TABLE `sal_quotationdetails_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sal_quotationotherdetails_t`
--

DROP TABLE IF EXISTS `sal_quotationotherdetails_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sal_quotationotherdetails_t` (
  `qID` int(11) NOT NULL DEFAULT '0',
  `Quot_Date` date DEFAULT NULL,
  `Quot_ID` int(11) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  PRIMARY KEY (`qID`),
  KEY `Quot_ID` (`Quot_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sal_quotationotherdetails_t`
--

LOCK TABLES `sal_quotationotherdetails_t` WRITE;
/*!40000 ALTER TABLE `sal_quotationotherdetails_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sal_quotationotherdetails_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq`
--

DROP TABLE IF EXISTS `seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq`
--

LOCK TABLES `seq` WRITE;
/*!40000 ALTER TABLE `seq` DISABLE KEYS */;
INSERT INTO `seq` VALUES (1,'2012-08-04'),(2,'2012-08-27'),(3,'2012-09-02'),(4,'2012-09-05'),(5,'2012-09-05'),(6,'2012-09-05'),(7,'2012-09-06'),(8,'2012-09-06'),(9,'2012-09-07'),(10,'2012-09-07'),(11,'2012-09-07');
/*!40000 ALTER TABLE `seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_appaccess_t`
--

DROP TABLE IF EXISTS `t_appaccess_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_appaccess_t` (
  `appId` int(11) NOT NULL,
  `roleId` varchar(50) NOT NULL,
  `menuName` varchar(50) NOT NULL,
  `href` varchar(50) NOT NULL,
  PRIMARY KEY (`appId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_appaccess_t`
--

LOCK TABLES `t_appaccess_t` WRITE;
/*!40000 ALTER TABLE `t_appaccess_t` DISABLE KEYS */;
INSERT INTO `t_appaccess_t` VALUES (1,'adm','SALES','sales.jsp'),(2,'adm','ACCOUNTS','accounts.jsp'),(5,'smng','SALES','sales.jsp'),(3,'adm','INVENTORY','inventory.jsp'),(4,'adm','REPORTS','reports.jsp'),(6,'smng','ACCOUNTS','accounts.jsp');
/*!40000 ALTER TABLE `t_appaccess_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_login_t`
--

DROP TABLE IF EXISTS `t_login_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_login_t` (
  `role_id` varchar(10) DEFAULT NULL,
  `login_id` int(11) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_login_t`
--

LOCK TABLES `t_login_t` WRITE;
/*!40000 ALTER TABLE `t_login_t` DISABLE KEYS */;
INSERT INTO `t_login_t` VALUES ('adm',NULL,'admin','adminadmin');
/*!40000 ALTER TABLE `t_login_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rolemapping_t`
--

DROP TABLE IF EXISTS `t_rolemapping_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_rolemapping_t` (
  `ROLE_ID` varchar(10) DEFAULT NULL,
  `UserName` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rolemapping_t`
--

LOCK TABLES `t_rolemapping_t` WRITE;
/*!40000 ALTER TABLE `t_rolemapping_t` DISABLE KEYS */;
INSERT INTO `t_rolemapping_t` VALUES ('adm','admin'),('smng','admin');
/*!40000 ALTER TABLE `t_rolemapping_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_roles_t`
--

DROP TABLE IF EXISTS `t_roles_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_roles_t` (
  `roleid` varchar(10) NOT NULL,
  `roleName` varchar(20) NOT NULL,
  UNIQUE KEY `roleid` (`roleid`,`roleName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_roles_t`
--

LOCK TABLES `t_roles_t` WRITE;
/*!40000 ALTER TABLE `t_roles_t` DISABLE KEYS */;
INSERT INTO `t_roles_t` VALUES ('adm','administrator'),('smng','SalesManager');
/*!40000 ALTER TABLE `t_roles_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_submenu_t`
--

DROP TABLE IF EXISTS `t_submenu_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_submenu_t` (
  `submenuId` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `roleId` varchar(20) DEFAULT NULL,
  `subMenuName` varchar(50) DEFAULT NULL,
  `href` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`submenuId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_submenu_t`
--

LOCK TABLES `t_submenu_t` WRITE;
/*!40000 ALTER TABLE `t_submenu_t` DISABLE KEYS */;
INSERT INTO `t_submenu_t` VALUES (1,1,'adm','Quotation','FinalQuot.jsp'),(2,2,'adm','TrialBalance','trialBalance.jsp'),(3,1,'adm','CRM','crm.jsp'),(4,1,'adm','EditQuotation','editQuotation.jsp');
/*!40000 ALTER TABLE `t_submenu_t` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-08 17:50:08
