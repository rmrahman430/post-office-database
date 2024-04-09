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
  `AdminID` varchar(10) NOT NULL,
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
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `BranchesID` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `ManagerID` varchar(10) NOT NULL,
  `OperatingHours` varchar(50) NOT NULL,
  `Schedule` varchar(50) NOT NULL,
  PRIMARY KEY (`BranchesID`,`Address`),
  UNIQUE KEY `BranchesID_UNIQUE` (`BranchesID`),
  KEY `fk_Branches_Employee1_idx` (`ManagerID`),
  CONSTRAINT `fk_Branches_Employee1` FOREIGN KEY (`ManagerID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  KEY `CartID_UNIQUE` (`CartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Salary` decimal(10,8) DEFAULT NULL,
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
  `Status` enum('Pending','In Route','Delivered','Lost','Accepted') NOT NULL DEFAULT 'Pending',
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
  CONSTRAINT `chk_status` CHECK ((`Status` in (_utf8mb3'Pending',_utf8mb3'Delivered',_utf8mb3'Accepted',_utf8mb3'In Transit',_utf8mb3'Lost')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Status` enum('Shipped to Office','In Transit','Out for Delivery','Pending Shipment') DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `EstimatedDeliveryTime` datetime DEFAULT NULL,
  PRIMARY KEY (`TrackingID`),
  UNIQUE KEY `TrackingID_UNIQUE` (`TrackingID`),
  KEY `fk_trackinghistory_package` (`PackageID`),
  CONSTRAINT `fk_trackinghistory_package` FOREIGN KEY (`PackageID`) REFERENCES `package` (`PackageID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `EmployeeID` varchar(10) NOT NULL,
  PRIMARY KEY (`VehicleID`),
  UNIQUE KEY `VehicleID_UNIQUE` (`VehicleID`),
  KEY `fk_Vehicles_Employee1_idx` (`EmployeeID`),
  CONSTRAINT `fk_Vehicles_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-05 23:18:02
