-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: post-office-web-database.mysql.database.azure.com    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `AdminID` varchar(20) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Minit` varchar(1) DEFAULT NULL,
  `Lname` varchar(50) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `AdminUser` varchar(255) NOT NULL,
  `AdminPass` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `AdminID_UNIQUE` (`AdminID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Phone_UNIQUE` (`Phone`),
  UNIQUE KEY `AdminUser_UNIQUE` (`AdminUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('816c9893-1','John','D','Doe','johndoe@example.com','1234567890','johndoe_admin','password123','123 Main Street');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `CartItemID` varchar(20) NOT NULL,
  `CartID` varchar(20) NOT NULL,
  `StoreItemID` int DEFAULT NULL,
  `PackageID` varchar(20) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`CartItemID`),
  KEY `StoreItemID` (`StoreItemID`),
  KEY `PackageID` (`PackageID`),
  KEY `test_idx` (`CartID`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`StoreItemID`) REFERENCES `storeitem` (`ItemID`),
  CONSTRAINT `cart_items_ibfk_3` FOREIGN KEY (`PackageID`) REFERENCES `package` (`PackageID`),
  CONSTRAINT `test` FOREIGN KEY (`CartID`) REFERENCES `customer_user` (`CartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user`
--

DROP TABLE IF EXISTS `customer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_user` (
  `UserID` varchar(10) NOT NULL,
  `CustomerUser` varchar(255) NOT NULL,
  `CustomerPass` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `dateSignedUp` datetime NOT NULL,
  `role` enum('Service Clerk','Driver','Manager','User','Admin') NOT NULL,
  `CartID` varchar(20) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`),
  UNIQUE KEY `CustomerUser_UNIQUE` (`CustomerUser`),
  KEY `CartID_UNIQUE` (`CartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user`
--

LOCK TABLES `customer_user` WRITE;
/*!40000 ALTER TABLE `customer_user` DISABLE KEYS */;
INSERT INTO `customer_user` VALUES ('2ae968fc-a','Quagmire123','26Dosis!234','bejosedaa@gmail.com','Glenn','Quagmire','1234 Houston St','1234567890','2024-03-27 21:34:37','User','de7b929f-e079-4cd8-8'),('311bf267-f','ycherrer','pass','ycherrer@cougarnet.com','yla','herrera','4361 Cougar Village Dr, Houston, TX 77204','2816029220','2024-04-11 03:32:51','Driver','1b0f06ad-2ac0-4ffc-a'),('40cb7f4e-2','afina','afina','afapayeva5@gmail.com','afina','apayeva','Cougar Village 1','38129382','2024-03-27 23:12:03','Service Clerk','e2df2e2a-5ece-4a83-8'),('595b8a0b-c','mustafa','123','mustafa.sahin03@outlook.com','Mustafa','Sahin','8181 Fannin St','8325370746','2024-03-27 22:31:23','User','55c6e84f-6c3b-4ab5-9'),('666b8f7d-d','rmrahman','password','rayyanmrahman@gmail.com','Rayyan','Rahman','1903 Blossomcrown Dr','6159713333','2024-03-28 21:41:47','User','2c0e4d46-17ec-4e49-a'),('6c58f30a-e','afsana','pomcy1-befWiq-sysqyn','am@gmail.com','afsana','mammadova','main street','132413156','2024-04-07 23:01:22','Driver','a3ae3f2d-aeb1-4e37-b'),('73eb4af9-a','jade','jade123','js@gmail.com','Jade','Smith','main street123','12345678','2024-04-11 21:07:14','Driver','c7877f76-4b01-4a1b-8'),('816c9893-1','johndoe_admin','password123','johndoe@example.com','John','Doe','123 Main Street','1234567890','2024-02-28 20:47:32','Admin','62h8e84f-6p3g-8ab5-3'),('8b03799c-3','okibik','icardi1905','sahinyusufokan@gmail.com','Yusuf','Sahin','18702 Tupper Creek Ct.','8325370747','2024-04-11 15:16:50','User','cb8231d7-c1a1-48cf-9'),('92d24e79-9','bob','bob1234','bg@gmail.com','Bob','George','4616 Cullen BLvd Houston','1234567891','2024-04-11 22:33:38','Driver','0915e3f3-cb72-4e95-b'),('f6b8c06d-8','guillermo','password','guillermomartinez1998@gmail.com','Guillermo','Martinez','11734 Arrow Ridge Drive','8328794849','2024-03-28 20:47:32','User','ec45345e-b6f5-40f9-9');
/*!40000 ALTER TABLE `customer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deparments`
--

DROP TABLE IF EXISTS `deparments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deparments` (
  `DeparmentsID` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `OperatingHours` varchar(50) NOT NULL,
  PRIMARY KEY (`DeparmentsID`),
  UNIQUE KEY `DeparmentsID_UNIQUE` (`DeparmentsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deparments`
--

LOCK TABLES `deparments` WRITE;
/*!40000 ALTER TABLE `deparments` DISABLE KEYS */;
INSERT INTO `deparments` VALUES ('1','111 main street','1');
/*!40000 ALTER TABLE `deparments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` varchar(10) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Minit` varchar(1) DEFAULT NULL,
  `Lname` varchar(50) NOT NULL,
  `Ssn` varchar(9) DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  `Phone` varchar(10) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `role` enum('Service Clerk','Driver','Manager') DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Schedule` varchar(10) DEFAULT NULL,
  `DepartmentID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeeID_UNIQUE` (`EmployeeID`),
  UNIQUE KEY `Ssn_UNIQUE` (`Ssn`) /*!80000 INVISIBLE */,
  KEY `fk_Employee_Deparments_idx` (`DepartmentID`),
  CONSTRAINT `fk_Employee_Deparments` FOREIGN KEY (`DepartmentID`) REFERENCES `deparments` (`DeparmentsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('0780c669-1','y','g','m','293843849','2024-04-20','','','','',13,'Service Clerk','2024-04-19',NULL,NULL),('1','Jane','A','Doe','123456789','2000-01-01','1234567890','janedoe@gmail.com','123 main street','F',1,'Manager','2020-01-01','1','1'),('1234567890','Female','F','Her','123456798','2005-01-19','2816029330','ylaherrera','mainstreet','Female',8,'Service Clerk','2004-04-11','1','1'),('311bf267-f','yla',NULL,'herrera',NULL,NULL,'2816029220','ycherrer@cougarnet.com','4361 Cougar Village Dr, Houston, TX 77204',NULL,NULL,'Driver',NULL,NULL,NULL),('3172d661-3','Afatsum','E','Nihas','628495387','2003-07-14','1111111111','ms@gmail.com','111 street','M',5,'Driver','2024-04-14',NULL,NULL),('382e7594-1','Athena','A','Armeniz','123123124','2003-08-08','9999999999','athenaarmeniz@gmail.com','4361 Cougar Village Dr, Houston, TX 77204','F',NULL,'Driver','2024-04-12',NULL,NULL),('40cb7f4e-2','afina',NULL,'apayeva',NULL,NULL,'38129382','afapayeva5@gmail.com','Cougar Village 1',NULL,NULL,'Service Clerk',NULL,NULL,NULL),('61a01f65-3','Guillermoy','G','Gomeriz','768901234','2003-01-14','2816029228','gomerizy@gmail.com','4361 Cougar Village Dr, Houston, TX 77204','M',20,'Driver','2024-04-12',NULL,NULL),('6c58f30a-e','afsana',NULL,'mammadova',NULL,NULL,'132413156','am@gmail.com','main street',NULL,NULL,'Driver',NULL,NULL,NULL),('73eb4af9-a','Jade',NULL,'Smith',NULL,NULL,'12345678','js@gmail.com','main street123',NULL,NULL,'Driver',NULL,NULL,NULL),('8894f98c-1','Zahra','Z','Zammy','987654321','1999-09-09','8789543268','zahrazammy@gmail.com','4361 Cougar Village Dr, Houston, TX 77204','',NULL,'Service Clerk','2024-04-12',NULL,NULL),('8974545e-4','Bobby','F','Georgia','978978789','2024-04-10','9847689890','bobby@gmail.com','bobby address','O',34,'Service Clerk','2024-04-19',NULL,NULL),('92d24e79-9','Bob',NULL,'George',NULL,NULL,'1234567891','bg@gmail.com','4616 Cullen BLvd Houston',NULL,NULL,'Driver',NULL,NULL,NULL),('99a1474e-8','Timmy','z','Turner','928983928','2024-04-18','123212323','timmyturner@gmail.com','Address','M',16,'Driver','2024-04-19',NULL,NULL),('a1c821b6-9','Joshy','J','James','987654322','2000-01-13','1234512345','joshykk@gmail.com','4361 Cougar Village Dr, Houston, TX 77204','M',NULL,'Driver','2024-04-12',NULL,NULL),('e2e878b0-e','Guil','G','Gomez','766894567','1999-07-07','7777777777','guilggomez@gmail.com','4361 Cougar Village Dr, Houston, TX 77204','M',13,'Driver','2024-04-12',NULL,NULL),('e74fb7a5-b','Bobby','F','Georgia','111111111','2003-01-11','2816029229','herrerayla@gmail.com','4361 Cougar Village Dr, Houston, TX 77204','',NULL,'Driver','2024-04-12',NULL,NULL),('e9f1867e-7','Fusuy','N','Nihas','684952387','2005-01-25','8325917485','ys@gmail.com','65487 Street','M',60000,'Driver','2024-04-14',NULL,NULL),('f0a68afe-1','Benjamin','F','Frankin','333333333','1999-09-06','8976546799','benjaminFranking@gmail.com','4571 Poe Road Houston, Texas, 77027','M',16,'Service Clerk','2024-04-12',NULL,NULL),('f6b8c06d-8','Guillermo',NULL,'Martinez',NULL,NULL,'8328794849','guillermomartinez1998@gmail.com','11734 Arrow Ridge Drive',NULL,NULL,'Driver',NULL,NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` varchar(20) NOT NULL,
  `userID` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `fk_userID` (`userID`),
  CONSTRAINT `fk_userID` FOREIGN KEY (`userID`) REFERENCES `customer_user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('041bf107-f849-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-11 21:18:18'),('09eaaa65-fed2-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-20 04:54:15'),('09f4fd6b-f84e-11ee-8','816c9893-1','Item Supplies has low inventory, please restock.','2024-04-11 21:54:15'),('09f82634-f84e-11ee-8','595b8a0b-c','Your package with tracking number 09f825d2f84e11ee has been accepted.','2024-04-11 21:54:15'),('0b04c629-fecc-11ee-8','595b8a0b-c','Your package with tracking number 0b04c58afecc11ee has been accepted.','2024-04-20 04:11:20'),('0e0fe991-f525-11ee-8','666b8f7d-d','Your package has been delivered.','2024-04-07 21:23:19'),('0fc72c5d-f854-11ee-8','816c9893-1','Item Supplies has low inventory, please restock.','2024-04-11 22:37:22'),('0fca53f9-f854-11ee-8','595b8a0b-c','Your package with tracking number 0fca53bbf85411ee has been accepted.','2024-04-11 22:37:22'),('1','f6b8c06d-8','Package has been delivered','2024-03-29 03:33:33'),('1272c7d4-fee8-11ee-8','595b8a0b-c','Your package with tracking number 782359fcfee711ee is now in transit.','2024-04-20 07:31:59'),('14c4c86c-fee8-11ee-8','595b8a0b-c','Your package with tracking number 782359fcfee711ee has been cancelled.','2024-04-20 07:32:02'),('191e5967-fe75-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-19 17:48:58'),('1a4c46f0-fea1-11ee-8','595b8a0b-c','Your package with tracking number 1a4c466afea111ee has been accepted.','2024-04-19 23:03:57'),('1d2ca7bc-fe75-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-19 17:49:04'),('1fca3bb3-fee1-11ee-8','595b8a0b-c','Your package with tracking number 1fca36e4fee111ee has been accepted.','2024-04-20 06:42:14'),('218f62c1-fe75-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-19 17:49:12'),('255b2e1f-fe98-11ee-8','595b8a0b-c','Your package with tracking number 255b2dbdfe9811ee has been accepted.','2024-04-19 21:59:51'),('2561714d-fe80-11ee-8','816c9893-1','Item Supplies has low inventory, please restock.','2024-04-19 19:08:03'),('25619088-fe80-11ee-8','40cb7f4e-2','Item Supplies has low inventory, please restock.','2024-04-19 19:08:03'),('25701080-f765-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-10 18:07:08'),('26137a3a-f844-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-11 20:43:27'),('27a578f1-f765-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-10 18:07:12'),('27b839bd-fe83-11ee-8','595b8a0b-c','Your package with tracking number 27b83952fe8311ee has been accepted.','2024-04-19 19:29:35'),('29673abc-f5fe-11ee-8','666b8f7d-d','Your package with tracking number 29673a53f5fe11ee has been accepted.','2024-04-08 23:17:26'),('2a33323b-fee3-11ee-8','595b8a0b-c','Your package with tracking number 6e08e89ffee211ee has been delivered.','2024-04-20 06:56:51'),('2d9a4b37-fee4-11ee-8','595b8a0b-c','Your package with tracking number 67f78813fee311ee has been accepted.','2024-04-20 07:04:06'),('308c817f-fee6-11ee-8','595b8a0b-c','Your package with tracking number 308c7d8bfee611ee has been accepted.','2024-04-20 07:18:30'),('31ecc848-fee8-11ee-8','595b8a0b-c','Your package with tracking number 782359fcfee711ee has been delivered.','2024-04-20 07:32:51'),('36a44634-fe7f-11ee-8','816c9893-1','Item Supplies has low inventory, please restock.','2024-04-19 19:01:22'),('36a47ae6-fe7f-11ee-8','40cb7f4e-2','Item Supplies has low inventory, please restock.','2024-04-19 19:01:22'),('3b539114-fcf9-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-17 20:29:46'),('3b9dcd67-f886-11ee-8','2ae968fc-a','Your package has been delivered.','2024-04-12 04:36:30'),('3c6a2d97-f898-11ee-8','311bf267-f','Your package with tracking number 3c6a2d45f89811ee has been accepted.','2024-04-12 06:45:22'),('3c715be5-f83b-11ee-8','6c58f30a-e','Your package with tracking number 3c715b8cf83b11ee has been accepted.','2024-04-11 19:39:39'),('3d29bee8-f898-11ee-8','311bf267-f','Your package with tracking number 3d29be99f89811ee has been accepted.','2024-04-12 06:45:23'),('3db821ef-fbc7-11ee-8','595b8a0b-c','Your package with tracking number 3db8216ffbc711ee has been accepted.','2024-04-16 07:59:24'),('3ec8bcac-f898-11ee-8','311bf267-f','Your package with tracking number 3ec8bc5cf89811ee has been accepted.','2024-04-12 06:45:26'),('3edcdb81-f848-11ee-8','595b8a0b-c','Your package with tracking number 3edcdb31f84811ee has been accepted.','2024-04-11 21:12:47'),('3f4075df-f530-11ee-8','595b8a0b-c','Your package with tracking number 3f40756af53011ee has been accepted.','2024-04-07 22:43:26'),('43b09836-f898-11ee-8','595b8a0b-c','Your package with tracking number 43b097eef89811ee has been accepted.','2024-04-12 06:45:34'),('4613ed62-fea1-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-19 23:05:11'),('481d6923-fee4-11ee-8','595b8a0b-c','Your package with tracking number 67f78813fee311ee has been delivered.','2024-04-20 07:04:51'),('495cee94-fee1-11ee-8','595b8a0b-c','Your package with tracking number 1fca36e4fee111ee has been accepted.','2024-04-20 06:43:24'),('4aae067a-fef2-11ee-8','595b8a0b-c','Your package 7895f51b-772b-4cc9-8 has been reported as lost.','2024-04-20 08:45:08'),('4c6ab364-fe96-11ee-8','595b8a0b-c','Your package with tracking number 4c6ab2f5fe9611ee has been accepted.','2024-04-19 21:46:37'),('52ee74bb-f530-11ee-8','666b8f7d-d','Your package has been delivered.','2024-04-07 22:43:59'),('592a3dfa-fecc-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-20 04:13:31'),('5c459bf3-fea5-11ee-8','595b8a0b-c','Your package with tracking number 5c459b49fea511ee has been accepted.','2024-04-19 23:34:26'),('603888e6-fe98-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-19 22:01:29'),('651b7f90-f5e3-11ee-8','666b8f7d-d','Your package with tracking number 651b7f11f5e311ee has been accepted.','2024-04-08 20:05:49'),('66a1dd49-fc1c-11ee-8','595b8a0b-c','Your package with tracking number 66a1dcd8fc1c11ee has been accepted.','2024-04-16 18:09:00'),('67f7906e-fee3-11ee-8','595b8a0b-c','Your package with tracking number 67f78813fee311ee has been accepted.','2024-04-20 06:58:35'),('69cea6c0-f5e3-11ee-8','666b8f7d-d','Your package with tracking number 69cea643f5e311ee has been accepted.','2024-04-08 20:05:57'),('6a481cbf-f6ed-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-10 03:50:04'),('6a925c0b-fea1-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-19 23:06:12'),('6d325965-fee6-11ee-8','595b8a0b-c','Your package with tracking number 308c7d8bfee611ee is now in transit.','2024-04-20 07:20:12'),('6d396ef8-f7de-11ee-8','6c58f30a-e','Your package has been delivered.','2024-04-11 08:35:18'),('6e08ecea-fee2-11ee-8','595b8a0b-c','Your package with tracking number 6e08e89ffee211ee has been accepted.','2024-04-20 06:51:35'),('75a20438-f84e-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-11 21:57:15'),('7774f411-fee1-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-20 06:44:42'),('7823608f-fee7-11ee-8','595b8a0b-c','Your package with tracking number 782359fcfee711ee has been accepted.','2024-04-20 07:27:40'),('7d950238-f824-11ee-8','6c58f30a-e','Your package has been delivered.','2024-04-11 16:56:50'),('7fd8cd61-f534-11ee-8','666b8f7d-d','Your package with tracking number 7fd8ccfef53411ee has been accepted.','2024-04-07 23:13:52'),('7fe2f540-fe8c-11ee-8','595b8a0b-c','Your package with tracking number has been delivered.','2024-04-19 20:36:28'),('8522e2c6-fee5-11ee-8','595b8a0b-c','Your package with tracking number 8522dc23fee511ee has been accepted.','2024-04-20 07:13:42'),('85f6ba8e-f893-11ee-8','311bf267-f','Your package with tracking number 85f6ba47f89311ee has been accepted.','2024-04-12 06:11:38'),('866aa866-fc12-11ee-8','595b8a0b-c','Your package with tracking number 866aa7f8fc1211ee has been accepted.','2024-04-16 16:58:18'),('87e7a0b3-fee8-11ee-8','595b8a0b-c','Your package with tracking number 87e79911fee811ee has been accepted.','2024-04-20 07:35:16'),('8bcc7f15-fedd-11ee-8','595b8a0b-c','Your package with tracking number 8bcc7ec2fedd11ee has been accepted.','2024-04-20 06:16:38'),('8fc84f9f-fed1-11ee-8','595b8a0b-c','Your package with tracking number 8fc84f31fed111ee has been accepted.','2024-04-20 04:50:50'),('93bdfe30-fe95-11ee-8','595b8a0b-c','Your package with tracking number 93bdfdd2fe9511ee has been accepted.','2024-04-19 21:41:27'),('9437b150-fe80-11ee-8','816c9893-1','Item Supplies has low inventory, please restock.','2024-04-19 19:11:09'),('9437d2d1-fe80-11ee-8','40cb7f4e-2','Item Supplies has low inventory, please restock.','2024-04-19 19:11:09'),('94698849-ff71-11ee-8','595b8a0b-c','Your package with tracking number 946983cbff7111ee has been accepted.','2024-04-20 23:56:18'),('971e63f8-fc3c-11ee-8','595b8a0b-c','Your package with tracking number 971e636dfc3c11ee has been accepted.','2024-04-16 21:59:25'),('971ed841-fee2-11ee-8','595b8a0b-c','Your package with tracking number 6e08e89ffee211ee has been accepted.','2024-04-20 06:52:44'),('98320459-f897-11ee-8','6c58f30a-e','Your package with tracking number 983203b5f89711ee has been accepted.','2024-04-12 06:40:47'),('988cdbb4-fc36-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-16 21:16:31'),('989ca50e-f5e4-11ee-8','666b8f7d-d','Your package has been delivered.','2024-04-08 20:14:25'),('9c035a55-fee8-11ee-8','595b8a0b-c','Your package with tracking number 87e79911fee811ee is now in transit.','2024-04-20 07:35:49'),('9e19460e-fee8-11ee-8','595b8a0b-c','Your package with tracking number 87e79911fee811ee has been cancelled.','2024-04-20 07:35:53'),('a73fb3fa-fecb-11ee-8','595b8a0b-c','Your package with tracking number a73fb306fecb11ee has been accepted.','2024-04-20 04:08:33'),('a7f93b77-feed-11ee-8','595b8a0b-c','Your package with tracking number 5c459b49fea511ee has been delivered.','2024-04-20 08:11:57'),('ac0c24d5-fee6-11ee-8','595b8a0b-c','Your package with tracking number 308c7d8bfee611ee has been delivered.','2024-04-20 07:21:57'),('ac69b01e-ff71-11ee-8','595b8a0b-c','Your package with tracking number 946983cbff7111ee is now in transit.','2024-04-20 23:56:58'),('ae4259bf-ff71-11ee-8','595b8a0b-c','Your package with tracking number 946983cbff7111ee has been reported as lost.','2024-04-20 23:57:01'),('b0bf6fee-fc3c-11ee-8','595b8a0b-c','Your package with tracking number b0bf6f7cfc3c11ee has been accepted.','2024-04-16 22:00:08'),('b24a396e-fc3c-11ee-8','595b8a0b-c','Your package with tracking number b24a3928fc3c11ee has been accepted.','2024-04-16 22:00:11'),('b279b35c-f5ea-11ee-8','666b8f7d-d','Your package with tracking number b279b30df5ea11ee has been accepted.','2024-04-08 20:58:06'),('b45ea6c0-f534-11ee-8','666b8f7d-d','Your package has been delivered.','2024-04-07 23:15:20'),('bac7b12f-fe8c-11ee-8','595b8a0b-c','Your package with tracking number bac7b0cefe8c11ee has been accepted.','2024-04-19 20:38:07'),('bb1ac635-f52f-11ee-8','595b8a0b-c','Your package with tracking number bb1ac5c6f52f11ee has been accepted.','2024-04-07 22:39:44'),('c200dd39-f6b8-11ee-8','2ae968fc-a','Your package has been delivered.','2024-04-09 21:33:08'),('c38d40b1-fb4a-11ee-8','311bf267-f','Your package has been delivered.','2024-04-15 17:08:22'),('c3a7f135-fed1-11ee-8','595b8a0b-c','Your package with tracking number c3a7f0c9fed111ee has been accepted.','2024-04-20 04:52:17'),('c5beed72-f823-11ee-8','6c58f30a-e','Your package with tracking number c5beecfdf82311ee has been accepted.','2024-04-11 16:51:42'),('ca6b994d-fedd-11ee-8','595b8a0b-c','Your package with tracking number ca6b98f7fedd11ee has been accepted.','2024-04-20 06:18:23'),('cbc1c1a5-f5e9-11ee-8','666b8f7d-d','Your package with tracking number cbc1c13ef5e911ee has been accepted.','2024-04-08 20:51:38'),('cbe33370-f534-11ee-8','816c9893-1','Item Supplies has low inventory, please restock.','2024-04-07 23:16:00'),('cbe65714-f534-11ee-8','666b8f7d-d','Your package with tracking number cbe656a8f53411ee has been accepted.','2024-04-07 23:16:00'),('ccd74691-f5e9-11ee-8','595b8a0b-c','Your package with tracking number ccd7463cf5e911ee has been accepted.','2024-04-08 20:51:40'),('cf8f566f-fe9a-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-19 22:18:55'),('cfc54759-f7a1-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-11 01:21:24'),('d3431298-f893-11ee-8','816c9893-1','Item Supplies has low inventory, please restock.','2024-04-12 06:13:48'),('d343df98-fb9d-11ee-8','595b8a0b-c','Your package with tracking number d343df3bfb9d11ee has been accepted.','2024-04-16 03:02:56'),('d4eb0cc5-fc21-11ee-8','595b8a0b-c','Your package with tracking number d4eb0c4cfc2111ee has been accepted.','2024-04-16 18:47:53'),('d6915477-f86e-11ee-8','595b8a0b-c','Your package with tracking number d69153d8f86e11ee has been accepted.','2024-04-12 01:49:02'),('d77d0189-f5fc-11ee-8','666b8f7d-d','Your package with tracking number d77d010bf5fc11ee has been accepted.','2024-04-08 23:07:59'),('d950e836-f86e-11ee-8','595b8a0b-c','Your package with tracking number d950e7d4f86e11ee has been accepted.','2024-04-12 01:49:07'),('da757758-f848-11ee-8','816c9893-1','Item Supplies has low inventory, please restock.','2024-04-11 21:17:08'),('dc62271e-f86e-11ee-8','595b8a0b-c','Your package with tracking number dc6226bdf86e11ee has been accepted.','2024-04-12 01:49:12'),('dd4e13ea-fee5-11ee-8','595b8a0b-c','Your package with tracking number 8522dc23fee511ee has been delivered.','2024-04-20 07:16:10'),('de2256fb-f86e-11ee-8','595b8a0b-c','Your package with tracking number de225691f86e11ee has been accepted.','2024-04-12 01:49:15'),('df445be0-fe7b-11ee-8','595b8a0b-c','Your package with tracking number df445b6cfe7b11ee has been accepted.','2024-04-19 18:37:27'),('dfa2f8ed-f5ec-11ee-8','666b8f7d-d','Your package with tracking number dfa2f8a1f5ec11ee has been accepted.','2024-04-08 21:13:40'),('e31e8f19-f844-11ee-8','816c9893-1','Item Supplies has low inventory, please restock.','2024-04-11 20:48:44'),('e5c92d5e-fe98-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-19 22:05:13'),('e87ca044-fedd-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-20 06:19:13'),('ea5222a4-f4cd-11ee-8','666b8f7d-d','Your package with tracking number ea52223ef4cd11ee has been accepted.','2024-04-07 10:59:33'),('eff0a01e-fe7f-11ee-8','816c9893-1','Item Supplies has low inventory, please restock.','2024-04-19 19:06:33'),('eff0bbf9-fe7f-11ee-8','40cb7f4e-2','Item Supplies has low inventory, please restock.','2024-04-19 19:06:33'),('f260d269-fe98-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-19 22:05:34'),('f36c24f4-f854-11ee-8','595b8a0b-c','Your package has been delivered.','2024-04-11 22:43:43'),('f3ae6505-f843-11ee-8','595b8a0b-c','Your package with tracking number f3ae649ff84311ee has been accepted.','2024-04-11 20:42:02'),('f3b17d85-f843-11ee-8','595b8a0b-c','Your package with tracking number f3b17d35f84311ee has been accepted.','2024-04-11 20:42:03'),('f3f71780-fea1-11ee-8','595b8a0b-c','Your package with tracking number f3f716dbfea111ee has been accepted.','2024-04-19 23:10:03'),('f66a2fb7-f7de-11ee-8','6c58f30a-e','Your package with tracking number f66a2f52f7de11ee has been accepted.','2024-04-11 08:39:08'),('f71982a7-fea0-11ee-8','595b8a0b-c','Your package with tracking number f719823ffea011ee has been accepted.','2024-04-19 23:02:58'),('fe93993d-fc21-11ee-8','595b8a0b-c','Your package with tracking number fe9398d3fc2111ee has been accepted.','2024-04-16 18:49:03');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `PackageID` varchar(20) NOT NULL,
  `SenderID` varchar(10) NOT NULL,
  `Weight` decimal(10,4) NOT NULL,
  `Dimensions` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Status` enum('Pending','Accepted','In Transit','Delivered','Lost','Cancelled') DEFAULT NULL,
  `DateSent` datetime NOT NULL,
  `VehicleID` varchar(10) DEFAULT NULL,
  `destination` varchar(255) NOT NULL,
  `expeditedShipping` tinyint(1) NOT NULL,
  `recipientFirstName` varchar(100) NOT NULL,
  `recipientLastName` varchar(100) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`PackageID`),
  UNIQUE KEY `PackageID_UNIQUE` (`PackageID`),
  KEY `fk_Package_Vehicles1_idx` (`VehicleID`),
  KEY `foreign key _idx` (`SenderID`),
  CONSTRAINT `fk_Package_CustomerUsers` FOREIGN KEY (`SenderID`) REFERENCES `customer_user` (`UserID`),
  CONSTRAINT `fk_Package_Vehicles1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicles` (`VehicleID`),
  CONSTRAINT `chk_status` CHECK ((`Status` in (_utf8mb3'Accepted',_utf8mb3'Pending',_utf8mb3'In Transit',_utf8mb3'Delivered',_utf8mb3'Cancelled',_utf8mb3'Lost')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES ('01590b38-3751-4b13-9','595b8a0b-c',5.0000,'1 x 2 x 3','envelope','Lost','2024-04-20 23:55:58','9be326de-a','street 123',1,'name','last',8.00),('164fbcbe-2','2ae968fc-a',5.0000,'5 x 5 x 5','envelope','Delivered','2024-04-08 23:17:05','c643f534-8','a',0,'a','a',11.00),('23e9208d-1e1d-441a-b','595b8a0b-c',1.0000,'1 x 1 x 1','parcel','Delivered','2024-04-19 21:46:14','5775d561-d','Any street ',0,'Delya','Imv',7.00),('2718731a-65d3-4c15-b','595b8a0b-c',23.0000,'9 x 9 x 9','oversized','Delivered','2024-04-20 04:08:07','9be326de-a','miami',1,'tijen','sahin',43.00),('27820452-c4f5-4b7c-b','595b8a0b-c',23.0000,'2 x 5 x 1','envelope','Cancelled','2024-04-20 07:34:51','5775d561-d','bcm',0,'uma','ramamurthy',26.00),('282373c8-05c8-46fa-a','595b8a0b-c',32.0000,'5 x 8 x 6','envelope','Delivered','2024-04-20 06:51:02','5775d561-d','ev',0,'ayse','sahin',38.00),('2be25e53-7e61-41dd-9','595b8a0b-c',1.0000,'1 x 1 x 1','envelope','Delivered','2024-04-08 21:57:29','c643f534-8','111 main street',0,'jane','watson',3.00),('2d3d2e93-ad56-4247-b','595b8a0b-c',15.0000,'5 x 6 x 7','envelope','Delivered','2024-04-20 04:50:14','e2e3ca66-b','Cadde',0,'Inanc','Ayas',21.00),('30b650bc-943e-4ed7-8','595b8a0b-c',23.0000,'7 x 8 x 9','envelope','Delivered','2024-04-19 23:02:23','5775d561-d','buraya',1,'muzaffer','sahin',32.00),('453ae051-5d76-4a58-a','595b8a0b-c',25.0000,'6 x 9 x 4','oversized','Delivered','2024-04-20 06:15:56','9be326de-a','spring cypress road',1,'muzaffer','sahin',42.00),('475e0d78-8b55-44be-a','595b8a0b-c',1.0000,'1 x 1 x 1','envelope','Delivered','2024-04-08 20:51:40','c643f534-8','121 main avenue',0,'bob','thebuilder',3.00),('4e4d0dcf-5afd-4840-8','595b8a0b-c',15.0000,'3 x 4 x 5','envelope','Delivered','2024-04-19 18:26:21','5775d561-d','18703 tupper',1,'mehmet','arbatli',20.00),('53fe8693-db93-46da-8','595b8a0b-c',15.0000,'7 x 5 x 3','envelope','Delivered','2024-04-20 06:41:53','c643f534-8','rize',0,'mustafa','sahin',23.00),('5d8b4140-8d85-433d-9','595b8a0b-c',23.0000,'3 x 6 x 9','parcel','Delivered','2024-04-20 06:58:10','9be326de-a','cadde 3',1,'hanife','sahin',32.00),('6679ad7b-2beb-4cdf-9','595b8a0b-c',1.0000,'1 x 1 x 1','parcel','In Transit','2024-04-16 18:08:47','5775d561-d','smth',0,'smth','smth',7.00),('73e8a567-1f44-4d27-8','595b8a0b-c',1.0000,'1 x 1 x 1','parcel','Delivered','2024-04-19 21:41:07','9be326de-a','Kerby street',0,'Dilara','Imamverdiyeva',7.00),('7895f51b-772b-4cc9-8','595b8a0b-c',1.0000,'1 x 1 x 1','parcel','Lost','2024-04-19 23:09:48','5775d561-d','Cougar Grounds',0,'Amina','Shabanova',7.00),('96298bd6-fafd-424a-8','595b8a0b-c',1.0000,'3 x 2 x 5','envelope','Delivered','2024-04-11 21:11:57','5775d561-d','main street 1234',0,'Jade','Smith',5.00),('987c52e9-ba80-4fbe-9','595b8a0b-c',1.0000,'4 x 2 x 4','envelope','Delivered','2024-04-11 21:53:14','e2e3ca66-b','4373 Cougar Village ',1,'Bob','George',7.00),('a3edc2d4-5844-40c0-8','595b8a0b-c',15.0000,'1 x 2 x 3','oversized','Delivered','2024-04-20 07:27:19','5775d561-d','234 street',0,'uma','ramamurthy',26.00),('a736c8bd-b8b3-4a65-a','6c58f30a-e',1.0000,'1 x 1 x 1','envelope','Accepted','2024-04-11 16:51:21','9be326de-a','CV1',0,'Jade','Smith',3.00),('a79eab24-0506-426a-b','595b8a0b-c',2.0000,'3 x 5 x 6','envelope','Delivered','2024-04-11 22:36:21','5775d561-d','4373 Ciugar Village Dr',0,'Mustafa','Sahin',6.00),('bf7e8476-6cf3-4745-a','595b8a0b-c',12.0000,'2 x 6 x 4','envelope','Delivered','2024-04-20 07:13:22','9be326de-a','cadde 53',0,'hatice','sahin',15.00),('dfb1ca46-3f31-418c-a','595b8a0b-c',5.0000,'1 x 3 x 2','envelope','Delivered','2024-04-11 20:41:11',NULL,'Main street 123',0,'Jade','Smith',7.00),('e2610377-9ee2-4b0b-8','595b8a0b-c',15.0000,'5 x 6 x 4','envelope','Delivered','2024-04-19 19:29:07',NULL,'street',1,'okan','sahin',22.00),('ec43d9a5-a599-4e73-8','666b8f7d-d',2.0000,'2 x 2 x 2','parcel','Delivered','2024-04-08 20:14:25','e2e3ca66-b','3903 south mason road, katy, TX',1,'bob','jackson',10.00),('f1d78be6-00f3-45f3-9','595b8a0b-c',12.0000,'1 x 2 x 3','oversized','Delivered','2024-04-20 07:18:07','e2e3ca66-b','ankara',1,'tuna','tunay',24.00),('fe79643e-9d52-4c46-9','311bf267-f',-1.0000,'2 x 2 x 2','envelope','In Transit','2024-04-12 06:10:31','5775d561-d','4361 Cougar Village Dr, Houston, TX 77204',1,'yla','herrera',3.00);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeitem`
--

DROP TABLE IF EXISTS `storeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storeitem` (
  `ItemID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Cost` decimal(5,2) NOT NULL,
  `Inventory` int NOT NULL,
  `PostOfficeID` varchar(10) NOT NULL,
  `productImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  UNIQUE KEY `ItemID_UNIQUE` (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeitem`
--

LOCK TABLES `storeitem` WRITE;
/*!40000 ALTER TABLE `storeitem` DISABLE KEYS */;
INSERT INTO `storeitem` VALUES (1,'Stamp',1.00,967,'1','https://postofficedatabase.blob.core.windows.net/postofficeimg/1.png'),(2,'Supplies',0.99,840,'1','https://postofficedatabase.blob.core.windows.net/postofficeimg/2.png'),(3,'Cards & Envelope',5.00,978,'1','https://postofficedatabase.blob.core.windows.net/postofficeimg/3.png');
/*!40000 ALTER TABLE `storeitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackinghistory`
--

DROP TABLE IF EXISTS `trackinghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trackinghistory` (
  `TrackingID` varchar(30) NOT NULL,
  `PackageID` varchar(20) NOT NULL,
  `Timestamp` timestamp NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Status` enum('Shipped to Office','Out for Delivery','Pending Shipment','Accepted','Pending','In Transit','Delivered','Cancelled','Lost') DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `EstimatedDeliveryTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TrackingID`,`Timestamp`),
  KEY `fk_trackinghistory_package` (`PackageID`),
  CONSTRAINT `fk_trackinghistory_package` FOREIGN KEY (`PackageID`) REFERENCES `package` (`PackageID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackinghistory`
--

LOCK TABLES `trackinghistory` WRITE;
/*!40000 ALTER TABLE `trackinghistory` DISABLE KEYS */;
INSERT INTO `trackinghistory` VALUES ('09f825d2f84e11ee','987c52e9-ba80-4fbe-9','2024-04-11 21:54:15','Houston, Texas','Pending Shipment','11 April 2024','21 April 2024'),('0b04c58afecc11ee','2718731a-65d3-4c15-b','2024-04-20 04:11:20','Houston, Texas','Pending Shipment','oversized','30 April 2024'),('0b04c58afecc11ee','2718731a-65d3-4c15-b','2024-04-20 04:11:24','Houston','In Transit','oversized','25 April 2024'),('0b04c58afecc11ee','2718731a-65d3-4c15-b','2024-04-20 04:13:31','Houston','Delivered','oversized','25 April 2024'),('0fca53bbf85411ee','a79eab24-0506-426a-b','2024-04-11 22:37:22','Houston, Texas','In Transit','11 April 2024','17 April 2024'),('0fca53bbf85411ee','a79eab24-0506-426a-b','2024-04-19 17:48:58','Texas','Delivered','envelope','24 April 2024'),('1a4c466afea111ee','30b650bc-943e-4ed7-8','2024-04-19 23:03:57','Houston, Texas','Pending Shipment','envelope','29 April 2024'),('1a4c466afea111ee','30b650bc-943e-4ed7-8','2024-04-19 23:04:03','Texas','In Transit','envelope','24 April 2024'),('1a4c466afea111ee','30b650bc-943e-4ed7-8','2024-04-19 23:05:11','Texas','Delivered','envelope','24 April 2024'),('1fca36e4fee111ee','53fe8693-db93-46da-8','2024-04-20 06:42:14','Houston, Texas','Pending Shipment','envelope','30 April 2024'),('1fca36e4fee111ee','53fe8693-db93-46da-8','2024-04-20 06:43:27','Utah','In Transit','envelope','25 April 2024'),('1fca36e4fee111ee','53fe8693-db93-46da-8','2024-04-20 06:44:42','Utah','Delivered','envelope','25 April 2024'),('255b2dbdfe9811ee','23e9208d-1e1d-441a-b','2024-04-19 21:59:51','Houston, Texas','Pending Shipment','parcel','29 April 2024'),('255b2dbdfe9811ee','23e9208d-1e1d-441a-b','2024-04-19 22:01:22','Texas','In Transit','parcel','24 April 2024'),('255b2dbdfe9811ee','23e9208d-1e1d-441a-b','2024-04-19 22:01:29','Texas','Delivered','parcel','24 April 2024'),('27b83952fe8311ee','e2610377-9ee2-4b0b-8','2024-04-19 19:29:35','Houston, Texas','Pending Shipment','envelope','29 April 2024'),('308c7d8bfee611ee','f1d78be6-00f3-45f3-9','2024-04-20 07:18:30','Houston, Texas','Pending Shipment','oversized','30 April 2024'),('308c7d8bfee611ee','f1d78be6-00f3-45f3-9','2024-04-20 07:20:12','Texas','In Transit','oversized','25 April 2024'),('308c7d8bfee611ee','f1d78be6-00f3-45f3-9','2024-04-20 07:21:57','Texas','Delivered','oversized','25 April 2024'),('3c6a2d45f89811ee','fe79643e-9d52-4c46-9','2024-04-12 06:45:22','Houston, Texas','Delivered','12 April 2024','20 April 2024'),('3c715b8cf83b11ee','a736c8bd-b8b3-4a65-a','2024-04-11 19:39:39','Houston, Texas','Pending Shipment','11 April 2024','21 April 2024'),('3d29be99f89811ee','fe79643e-9d52-4c46-9','2024-04-12 06:45:23','Houston, Texas','Delivered','12 April 2024','20 April 2024'),('3ec8bc5cf89811ee','fe79643e-9d52-4c46-9','2024-04-12 06:45:26','Houston, Texas','Delivered','12 April 2024','20 April 2024'),('3ec8bc5cf89811ee','fe79643e-9d52-4c46-9','2024-04-19 07:04:54','Texas','In Transit','envelope','24 April 2024'),('3edcdb31f84811ee','96298bd6-fafd-424a-8','2024-04-11 21:12:47','Houston, Texas','In Transit','11 April 2024','17 April 2024'),('3edcdb31f84811ee','96298bd6-fafd-424a-8','2024-04-19 22:18:55','Texas','Delivered','envelope','24 April 2024'),('3f40756af53011ee','475e0d78-8b55-44be-a','2024-04-10 22:38:53','Houston, Texas','Delivered','','16 April 2024'),('41a2163ff4cd11ee','ec43d9a5-a599-4e73-8','2024-04-07 10:54:50','Houston, Texas','Pending Shipment','',NULL),('43b097eef89811ee','987c52e9-ba80-4fbe-9','2024-04-12 06:45:34','Houston, Texas','Pending Shipment','12 April 2024','22 April 2024'),('43b097eef89811ee','987c52e9-ba80-4fbe-9','2024-04-19 17:49:04','Texas','Delivered','envelope','24 April 2024'),('4c6ab2f5fe9611ee','23e9208d-1e1d-441a-b','2024-04-19 21:46:37','Houston, Texas','Pending Shipment','parcel','29 April 2024'),('5c459b49fea511ee','7895f51b-772b-4cc9-8','2024-04-19 23:34:26','Houston, Texas','Pending Shipment','parcel','29 April 2024'),('5c459b49fea511ee','7895f51b-772b-4cc9-8','2024-04-19 23:34:55','Houston','In Transit','parcel','24 April 2024'),('5c459b49fea511ee','7895f51b-772b-4cc9-8','2024-04-20 08:11:57','Texas','Delivered','parcel','25 April 2024'),('5c459b49fea511ee','7895f51b-772b-4cc9-8','2024-04-20 08:43:03','Texas','Lost','parcel','25 April 2024'),('66a1dcd8fc1c11ee','6679ad7b-2beb-4cdf-9','2024-04-16 18:09:00','Houston, Texas','Pending Shipment','parcel','26 April 2024'),('66a1dcd8fc1c11ee','6679ad7b-2beb-4cdf-9','2024-04-16 21:16:31','Texas','Delivered','parcel','21 April 2024'),('66a1dcd8fc1c11ee','6679ad7b-2beb-4cdf-9','2024-04-19 20:31:16','Texas','In Transit','parcel','24 April 2024'),('67f78813fee311ee','5d8b4140-8d85-433d-9','2024-04-20 06:58:35','Houston, Texas','Pending Shipment','parcel','30 April 2024'),('67f78813fee311ee','5d8b4140-8d85-433d-9','2024-04-20 07:04:11','Houston','In Transit','parcel','25 April 2024'),('67f78813fee311ee','5d8b4140-8d85-433d-9','2024-04-20 07:04:51','Houston','Delivered','parcel','25 April 2024'),('6e08e89ffee211ee','282373c8-05c8-46fa-a','2024-04-20 06:51:35','Houston, Texas','Pending Shipment','envelope','30 April 2024'),('6e08e89ffee211ee','282373c8-05c8-46fa-a','2024-04-20 06:52:47','Texas','In Transit','envelope','25 April 2024'),('6e08e89ffee211ee','282373c8-05c8-46fa-a','2024-04-20 06:56:51','Texas','Delivered','envelope','25 April 2024'),('782359fcfee711ee','a3edc2d4-5844-40c0-8','2024-04-20 07:27:40','Houston, Texas','Pending Shipment','oversized','30 April 2024'),('782359fcfee711ee','a3edc2d4-5844-40c0-8','2024-04-20 07:27:59','Texas','Cancelled','oversized','25 April 2024'),('782359fcfee711ee','a3edc2d4-5844-40c0-8','2024-04-20 07:28:36','Texas','Pending','oversized','25 April 2024'),('782359fcfee711ee','a3edc2d4-5844-40c0-8','2024-04-20 07:30:18','Texas','Cancelled','oversized','25 April 2024'),('782359fcfee711ee','a3edc2d4-5844-40c0-8','2024-04-20 07:31:29','Texas','Pending','oversized','25 April 2024'),('782359fcfee711ee','a3edc2d4-5844-40c0-8','2024-04-20 07:31:59','Texas','In Transit','oversized','25 April 2024'),('782359fcfee711ee','a3edc2d4-5844-40c0-8','2024-04-20 07:32:02','Texas','Cancelled','oversized','25 April 2024'),('782359fcfee711ee','a3edc2d4-5844-40c0-8','2024-04-20 07:32:51','Texas','Delivered','oversized','25 April 2024'),('8522dc23fee511ee','bf7e8476-6cf3-4745-a','2024-04-20 07:13:42','Houston, Texas','Pending Shipment','envelope','30 April 2024'),('8522dc23fee511ee','bf7e8476-6cf3-4745-a','2024-04-20 07:14:50','Houston','In Transit','envelope','25 April 2024'),('8522dc23fee511ee','bf7e8476-6cf3-4745-a','2024-04-20 07:16:10','Houston','Delivered','envelope','25 April 2024'),('85f6ba47f89311ee','fe79643e-9d52-4c46-9','2024-04-12 06:11:38','Houston, Texas','Delivered','12 April 2024','20 April 2024'),('87e79911fee811ee','27820452-c4f5-4b7c-b','2024-04-20 07:35:16','Houston, Texas','Pending Shipment','envelope','30 April 2024'),('87e79911fee811ee','27820452-c4f5-4b7c-b','2024-04-20 07:35:49','Texas','In Transit','envelope','25 April 2024'),('87e79911fee811ee','27820452-c4f5-4b7c-b','2024-04-20 07:35:53','Texas','Cancelled','envelope','25 April 2024'),('8bcc7ec2fedd11ee','453ae051-5d76-4a58-a','2024-04-20 06:16:38','Houston, Texas','Pending Shipment','oversized','30 April 2024'),('8fc84f31fed111ee','2d3d2e93-ad56-4247-b','2024-04-20 04:50:50','Houston, Texas','Pending Shipment','envelope','30 April 2024'),('93bdfdd2fe9511ee','73e8a567-1f44-4d27-8','2024-04-19 21:41:27','Houston, Texas','Pending Shipment','parcel','29 April 2024'),('946983cbff7111ee','01590b38-3751-4b13-9','2024-04-20 23:56:18','Houston, Texas','Pending Shipment','envelope','30 April 2024'),('946983cbff7111ee','01590b38-3751-4b13-9','2024-04-20 23:56:58','Houston','In Transit','envelope','25 April 2024'),('946983cbff7111ee','01590b38-3751-4b13-9','2024-04-20 23:57:01','Houston','Lost','envelope','25 April 2024'),('983203b5f89711ee','a736c8bd-b8b3-4a65-a','2024-04-12 06:40:47','Houston, Texas','Pending Shipment','12 April 2024','22 April 2024'),('a45460b1f4cd11ee','ec43d9a5-a599-4e73-8','2024-04-07 10:57:35','Houston, Texas','Pending Shipment','',NULL),('a73fb306fecb11ee','2718731a-65d3-4c15-b','2024-04-20 04:08:33','Houston, Texas','Pending Shipment','oversized','30 April 2024'),('bb1ac5c6f52f11ee','475e0d78-8b55-44be-a','2024-04-10 22:38:53','Houston, Texas','Delivered','','16 April 2024'),('c3a7f0c9fed111ee','2d3d2e93-ad56-4247-b','2024-04-20 04:52:17','Houston, Texas','Pending Shipment','envelope','30 April 2024'),('c3a7f0c9fed111ee','2d3d2e93-ad56-4247-b','2024-04-20 04:52:39','Texas','In Transit','envelope','25 April 2024'),('c3a7f0c9fed111ee','2d3d2e93-ad56-4247-b','2024-04-20 04:54:15','Texas','Delivered','envelope','25 April 2024'),('c5beecfdf82311ee','a736c8bd-b8b3-4a65-a','2024-04-11 16:51:42','Houston, Texas','Accepted','11 April 2024','16 April 2024'),('ca6b98f7fedd11ee','453ae051-5d76-4a58-a','2024-04-20 06:18:23','Houston, Texas','Pending Shipment','oversized','30 April 2024'),('ca6b98f7fedd11ee','453ae051-5d76-4a58-a','2024-04-20 06:18:31','Houston','In Transit','oversized','25 April 2024'),('ca6b98f7fedd11ee','453ae051-5d76-4a58-a','2024-04-20 06:19:13','Houston','Delivered','oversized','25 April 2024'),('ccd7463cf5e911ee','475e0d78-8b55-44be-a','2024-04-10 22:38:53','Houston, Texas','Delivered','','16 April 2024'),('d69153d8f86e11ee','987c52e9-ba80-4fbe-9','2024-04-12 01:49:02','Houston, Texas','Pending Shipment','12 April 2024','22 April 2024'),('d950e7d4f86e11ee','987c52e9-ba80-4fbe-9','2024-04-12 01:49:07','Houston, Texas','Pending Shipment','12 April 2024','22 April 2024'),('dc6226bdf86e11ee','987c52e9-ba80-4fbe-9','2024-04-12 01:49:12','Houston, Texas','Pending Shipment','12 April 2024','22 April 2024'),('de225691f86e11ee','987c52e9-ba80-4fbe-9','2024-04-12 01:49:15','Houston, Texas','Pending Shipment','12 April 2024','22 April 2024'),('df445b6cfe7b11ee','4e4d0dcf-5afd-4840-8','2024-04-19 18:37:27','Houston, Texas','Pending Shipment','envelope','29 April 2024'),('df445b6cfe7b11ee','4e4d0dcf-5afd-4840-8','2024-04-19 23:06:12','Texas','Delivered','envelope','24 April 2024'),('ea52223ef4cd11ee','ec43d9a5-a599-4e73-8','2024-04-07 10:59:33','Houston, Texas','Pending Shipment','',NULL),('f3ae649ff84311ee','dfb1ca46-3f31-418c-a','2024-04-11 20:42:02','Houston, Texas','Delivered','11 April 2024','16 April 2024'),('f3b17d35f84311ee','2be25e53-7e61-41dd-9','2024-04-11 20:42:03','Houston, Texas','Pending Shipment','11 April 2024','21 April 2024'),('f3b17d35f84311ee','2be25e53-7e61-41dd-9','2024-04-19 17:49:12','Utah','Delivered','envelope','24 April 2024'),('f3f716dbfea111ee','7895f51b-772b-4cc9-8','2024-04-19 23:10:03','Houston, Texas','Pending Shipment','parcel','29 April 2024'),('f719823ffea011ee','30b650bc-943e-4ed7-8','2024-04-19 23:02:58','Houston, Texas','Pending Shipment','envelope','29 April 2024');
/*!40000 ALTER TABLE `trackinghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `TransactionID` varchar(20) NOT NULL,
  `CartID` varchar(20) NOT NULL,
  `TransactionDate` datetime NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `TransactionType` varchar(20) NOT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `transaction_ibfk_1_idx` (`CartID`),
  CONSTRAINT `transaction_cart_fk` FOREIGN KEY (`CartID`) REFERENCES `customer_user` (`CartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES ('067050c6-f','e2df2e2a-5ece-4a83-8','2024-04-03 05:45:58',2.97,'Payment'),('0dec55f5-e798-4961-b','55c6e84f-6c3b-4ab5-9','2024-04-19 23:10:03',7.00,'Payment'),('0e3fcf59-0099-4d83-8','55c6e84f-6c3b-4ab5-9','2024-04-20 06:58:33',33.98,'Payment'),('166a0e56-5ff3-4e86-b','55c6e84f-6c3b-4ab5-9','2024-04-11 22:37:22',7.98,'Payment'),('1c0a855f-f62d-4ccd-8','2c0e4d46-17ec-4e49-a','2024-04-07 23:13:52',8.00,'Payment'),('21917f73-746c-425c-8','55c6e84f-6c3b-4ab5-9','2024-04-16 03:51:08',3.00,'Payment'),('236ec681-8090-4672-a','55c6e84f-6c3b-4ab5-9','2024-04-20 04:08:32',43.99,'Payment'),('2c35b72b-c230-45ca-a','55c6e84f-6c3b-4ab5-9','2024-04-16 18:09:00',7.00,'Payment'),('2cf532da-b695-4332-9','55c6e84f-6c3b-4ab5-9','2024-04-20 07:18:29',35.00,'Payment'),('2f6754f6-8ba5-4cec-a','55c6e84f-6c3b-4ab5-9','2024-04-11 20:42:02',7.00,'Payment'),('3474c85a-a163-43d1-a','55c6e84f-6c3b-4ab5-9','2024-04-19 20:38:07',9.98,'Payment'),('3ad1a1be-8c81-4a2d-a','55c6e84f-6c3b-4ab5-9','2024-04-11 21:12:47',5.00,'Payment'),('441ecbcc-3562-4ff2-8','55c6e84f-6c3b-4ab5-9','2024-04-16 17:51:02',7.00,'Payment'),('457ab646-86fd-4591-a','55c6e84f-6c3b-4ab5-9','2024-04-20 06:51:34',45.00,'Payment'),('46efccd5-993b-4531-9','55c6e84f-6c3b-4ab5-9','2024-04-20 23:56:18',14.00,'Payment'),('4c54c28a-2759-44ff-a','55c6e84f-6c3b-4ab5-9','2024-04-11 21:17:08',0.99,'Payment'),('5943c969-2387-4282-b','a3ae3f2d-aeb1-4e37-b','2024-04-11 16:39:51',3.00,'Payment'),('62b209c0-cf88-4bfd-b','2c0e4d46-17ec-4e49-a','2024-04-07 23:16:00',5.94,'Payment'),('64103129-8881-4985-a','a3ae3f2d-aeb1-4e37-b','2024-04-11 16:51:41',3.00,'Payment'),('6670f3ef-13d7-4445-a','55c6e84f-6c3b-4ab5-9','2024-04-20 07:27:38',26.00,'Payment'),('6764f661-5134-4d73-b','a3ae3f2d-aeb1-4e37-b','2024-04-08 04:08:09',3.00,'Payment'),('6b53ed77-0a64-457d-b','55c6e84f-6c3b-4ab5-9','2024-04-11 21:54:15',8.98,'Payment'),('6f748bfa-8138-4395-a','2c0e4d46-17ec-4e49-a','2024-04-07 10:57:35',6.99,'Payment'),('7659eba4-4dbd-49c9-9','a3ae3f2d-aeb1-4e37-b','2024-04-11 08:02:07',3.00,'Payment'),('770554a8-020c-4cc8-b','55c6e84f-6c3b-4ab5-9','2024-04-12 06:13:48',2.97,'Payment'),('7a33bde2-2f6e-4d89-8','a3ae3f2d-aeb1-4e37-b','2024-04-11 08:16:34',3.00,'Payment'),('7da7fb0b-b109-48d7-b','a3ae3f2d-aeb1-4e37-b','2024-04-10 20:43:48',4.00,'Payment'),('7f566fb5-26d4-472d-a','55c6e84f-6c3b-4ab5-9','2024-04-19 21:46:37',8.00,'Payment'),('841719ef-9974-40d7-b','55c6e84f-6c3b-4ab5-9','2024-04-16 21:59:25',7.00,'Payment'),('8928d9bf-6092-4880-9','55c6e84f-6c3b-4ab5-9','2024-04-16 16:55:21',7.00,'Payment'),('8c9e8bb0-9ff1-4ba2-8','55c6e84f-6c3b-4ab5-9','2024-04-19 19:27:26',34.99,'Payment'),('a896b40e-12de-499c-a','55c6e84f-6c3b-4ab5-9','2024-04-19 21:41:27',7.00,'Payment'),('aa15d76f-4a5e-4468-a','55c6e84f-6c3b-4ab5-9','2024-04-20 07:13:41',15.00,'Payment'),('ad8ba688-934c-4a9e-9','55c6e84f-6c3b-4ab5-9','2024-04-20 06:42:13',23.00,'Payment'),('b6419529-d600-4a14-b','55c6e84f-6c3b-4ab5-9','2024-04-16 17:39:09',3.00,'Payment'),('b93fca79-0fef-4549-b','55c6e84f-6c3b-4ab5-9','2024-04-19 23:02:58',32.99,'Payment'),('ba99b4d0-7056-4a5a-8','55c6e84f-6c3b-4ab5-9','2024-04-20 06:16:37',43.99,'Payment'),('bb50301a-e8af-4c51-9','55c6e84f-6c3b-4ab5-9','2024-04-16 17:28:08',7.00,'Payment'),('bc834828-ac12-4ea7-8','a3ae3f2d-aeb1-4e37-b','2024-04-11 08:39:08',3.00,'Payment'),('bcc7cf50-7512-4a1b-a','55c6e84f-6c3b-4ab5-9','2024-04-16 03:34:21',3.00,'Payment'),('c029f431-c22c-4c34-b','55c6e84f-6c3b-4ab5-9','2024-04-07 22:39:44',3.00,'Payment'),('c2af1c81-57c9-46e5-9','55c6e84f-6c3b-4ab5-9','2024-04-20 04:50:49',26.00,'Payment'),('c5545eb3-be31-4e3e-b','1b0f06ad-2ac0-4ffc-a','2024-04-12 06:11:38',3.00,'Payment'),('c65f6794-9f57-4476-a','2c0e4d46-17ec-4e49-a','2024-04-07 21:14:38',5.94,'Payment'),('c84376ee-a904-4f22-8','55c6e84f-6c3b-4ab5-9','2024-04-16 04:10:33',3.00,'Payment'),('ce76af12-4fa4-4317-b','55c6e84f-6c3b-4ab5-9','2024-04-19 18:37:27',20.99,'Payment'),('cffbe951-b194-4e0e-8','a3ae3f2d-aeb1-4e37-b','2024-04-11 05:54:11',8.00,'Payment'),('d3ff22dd-5781-4f47-a','55c6e84f-6c3b-4ab5-9','2024-04-16 16:58:18',3.00,'Payment'),('da04d020-f5ef-407e-a','2c0e4d46-17ec-4e49-a','2024-04-07 10:59:33',6.99,'Payment'),('dbca8c81-f0ca-4fb8-a','55c6e84f-6c3b-4ab5-9','2024-04-16 03:02:56',4.00,'Payment'),('dff31f49-d598-4a5d-a','55c6e84f-6c3b-4ab5-9','2024-04-16 08:05:32',7.00,'Payment'),('e0effd8f-db82-4b1a-8','55c6e84f-6c3b-4ab5-9','2024-04-07 22:37:42',20.00,'Payment'),('e13aa8b9-212d-47b1-a','a3ae3f2d-aeb1-4e37-b','2024-04-11 06:09:10',4.00,'Payment'),('e1b2c270-dc16-4ecf-b','55c6e84f-6c3b-4ab5-9','2024-04-19 19:29:35',22.00,'Payment'),('ed38921c-b39b-4af7-a','55c6e84f-6c3b-4ab5-9','2024-04-11 20:48:44',2.97,'Payment'),('ed42d161-82cf-446f-b','ec45345e-b6f5-40f9-9','2024-04-09 01:18:47',3.00,'Payment'),('f555a49d-f034-479a-b','2c0e4d46-17ec-4e49-a','2024-04-07 20:09:47',6.99,'Payment'),('f82a8a83-94cc-4f3a-a','55c6e84f-6c3b-4ab5-9','2024-04-20 07:35:14',27.98,'Payment'),('f92f5e20-b445-4788-a','2c0e4d46-17ec-4e49-a','2024-04-07 10:54:50',16.99,'Payment');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `VehicleID` varchar(10) NOT NULL,
  `Timestamp` datetime NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Unit` varchar(50) NOT NULL,
  `EmployeeID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`VehicleID`),
  UNIQUE KEY `VehicleID_UNIQUE` (`VehicleID`),
  KEY `fk_Vehicles_Employee1_idx` (`EmployeeID`),
  CONSTRAINT `fk_Vehicles_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES ('289f639c-a','2024-04-19 17:17:27','Location','Status','Type','1',NULL),('5775d561-d','2024-04-12 01:47:35','Texas','at station','18-wheeler','6','6c58f30a-e'),('9be326de-a','2024-04-11 05:39:52','Houston','At station','Van','7','92d24e79-9'),('c643f534-8','2024-04-11 22:41:42','Utah','under maintainance','18-wheeler','5','f6b8c06d-8'),('cd8ea0ab-4','2024-04-17 04:24:23','Texas','in transit','boxtruck','10',NULL),('e2e3ca66-b','2024-04-11 20:38:27','Texas','at station','boxtruck','3','311bf267-f');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-20 19:12:37
