-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: ventas
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `cli_id` int(11) NOT NULL AUTO_INCREMENT,
  `cli_nombre` varchar(50) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cli_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `empresas` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ricardo Perez',1),(2,'Gustavo Pardo',4),(3,'Rodrigo Muñoz',3),(4,'Fabian Perez',2),(5,'Pamela Pardo',4),(6,'Hugo Muñoz',3),(7,'Alejandra Pardo',1),(8,'Pamela Silva',3),(9,'Pamela Perez',4),(10,'Juan Silva',2),(11,'GustavoMuñoz',3),(12,'Alfredo Perez',1),(13,'Juan Bustamante',2),(14,'Gustavo Muñoz',2),(15,'Camilo Bahamonde',1),(16,'Hector Urrutia',4);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_nombre` varchar(50) NOT NULL,
  `emp_cantidad_tra` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Ripley',13),(2,'Falabella',15),(3,'Jumbo',8),(4,'Paris',19);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Refrigerador'),(2,'Juego Cuchillos'),(3,'Tazas'),(4,'Platos'),(5,'Tenedores'),(6,'Cucharas'),(7,'Lavadora'),(8,'Cocina a gas'),(9,'Sarten'),(10,'Juego de ollas');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajadores` (
  `tra_id` int(11) NOT NULL AUTO_INCREMENT,
  `tra_nombre` varchar(50) NOT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`tra_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `trabajadores_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `empresas` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (1,'Miguel Perez',1),(2,'Juan Arroyo',4),(3,'Camila Mancilla',2),(4,'Javier Pudeto',3),(5,'Camilo Gonzalez',1),(6,'Constanza Macias',4),(7,'Hector Perez',1),(8,'Constanza Riquelme',3),(9,'Pedro Arroyo',1),(10,'Alejandro Olave',3),(11,'Camila Macias',2),(12,'Jorge Pudeto',2),(13,'Fernando Mancilla',1),(14,'Carolina Mancilla',1),(15,'Alejandro Monsalve',4),(16,'Carolina Gutierrez',2);
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `ven_id` int(11) NOT NULL AUTO_INCREMENT,
  `cli_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `tra_id` int(11) NOT NULL,
  `ven_monto` int(11) NOT NULL,
  PRIMARY KEY (`ven_id`),
  KEY `cli_id` (`cli_id`),
  KEY `tra_id` (`tra_id`),
  KEY `pro_id` (`pro_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`tra_id`) REFERENCES `trabajadores` (`tra_id`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`pro_id`) REFERENCES `productos` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,5,3,23550),(2,2,6,8,35650),(3,4,5,3,4250),(4,1,6,1,3890),(5,11,1,3,23250),(6,1,3,3,6710),(7,9,1,9,23550),(8,1,9,3,5050),(9,2,2,12,9550),(10,1,7,2,219550);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-08 21:48:12
