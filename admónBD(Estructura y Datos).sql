CREATE DATABASE  IF NOT EXISTS `administracionescolar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `administracionescolar`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: administracionescolar
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `idActividad` int NOT NULL AUTO_INCREMENT,
  `idDocente` int DEFAULT NULL,
  `idMateria` int DEFAULT NULL,
  `Nombre_Actividad` varchar(45) DEFAULT NULL,
  `Porcentaje` decimal(4,2) DEFAULT NULL,
  `Fecha_Entrega` date DEFAULT NULL,
  `Estado_Actividad` varchar(45) DEFAULT NULL,
  `Ultima_Modificacion` date DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`idActividad`),
  KEY `FK_idDocente2_idx` (`idDocente`),
  KEY `Fk_idMaterias4_idx` (`idMateria`),
  KEY `Fk_idMateria5_idx` (`idMateria`),
  CONSTRAINT `FK_idDocente3` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`idDocente`),
  CONSTRAINT `Fk_idMateria5` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividades_estudiantes`
--

DROP TABLE IF EXISTS `actividades_estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades_estudiantes` (
  `idActividadEstudiante` int NOT NULL AUTO_INCREMENT,
  `idEstudiante` int DEFAULT NULL,
  `idActividad` int DEFAULT NULL,
  `idMateria` int DEFAULT NULL,
  `Nota_Obtenida` decimal(4,2) DEFAULT NULL,
  `Archivo` varchar(200) DEFAULT NULL,
  `Estado_Actividad` varchar(45) DEFAULT NULL,
  `Ultima_Modificacion` date DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`idActividadEstudiante`),
  KEY `FK_idEstudiante_idx` (`idEstudiante`),
  KEY `FK_idActividad_idx` (`idActividad`),
  KEY `FK_idMateria_idx` (`idMateria`),
  CONSTRAINT `FK_idActividad` FOREIGN KEY (`idActividad`) REFERENCES `actividades` (`idActividad`),
  CONSTRAINT `FK_idEstudiante` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiantes` (`idEstudiante`),
  CONSTRAINT `FK_idMateria` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades_estudiantes`
--

LOCK TABLES `actividades_estudiantes` WRITE;
/*!40000 ALTER TABLE `actividades_estudiantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividades_estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `idAdministrador` int NOT NULL AUTO_INCREMENT,
  `idPersona` int DEFAULT NULL,
  `Correo_Electronico` varchar(45) DEFAULT NULL,
  `Pass` varchar(600) DEFAULT NULL,
  `Ultima_Modificacion` varchar(45) DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`idAdministrador`),
  KEY `FK_idPersonaA_idx` (`idPersona`),
  CONSTRAINT `FK_idPersonaA` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,1,'co0428032019@admin.com','ff682b76deb22764d78932e6cf2c137b851bae700d25a5b332ff633fb20e4087bf11ce22271dea0c6641c2a3a34bc70f4b80c6af3076df6000c87f9578ead11c','2021-05-31',1),(2,2,'cc0285032019@admin.com','f9b5428d703b91abfd1e21cd8172ebcacf77b443c058591cfd6b3224b858e5e0daf74e5d681815997ec93c75ce7d4d7f9da262ae399a8035809a08c33f92e150','2021-05-31',1),(3,3,'gg0210032019@admin.com','08ceddf76967e1046774a4bcd1f5db39a5f2edab345a7bec2ac56b09127d47455f7ec40486e74e4cc437bec3dbd74e40205a98b8870ad2131c60e0ed2d551ba4','2021-05-31',1),(4,4,'os0020032018@admin.com','bf90b564fd54c51f9490058df2f874562fae2a1209b3fefcc412ffe9233c8f357902145f698d67c20468d5b95f2de941ceef517f7e56d1b81f08f8333f354c1e','2021-05-31',1),(5,5,'mm0014032019@admin.com','b14347c40d2d779b44b2b44b878a4e866ae6cb861a2ee3482b66c90d673dddb7b58f86ad7616736ad664d80b4822cbd7160429fbd9238d16869e086684fc3dec','2021-05-31',1);
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `idDocente` int NOT NULL AUTO_INCREMENT,
  `idPersona` int DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `Pass` varchar(600) DEFAULT NULL,
  `Especialidad` varchar(45) DEFAULT NULL,
  `Ultima_Modificacion` date DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`idDocente`),
  KEY `FK_idPersona_idx` (`idPersona`),
  CONSTRAINT `FK_idPersona` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,1,'andreseduardo.cordova@unab.edu.sv','ff682b76deb22764d78932e6cf2c137b851bae700d25a5b332ff633fb20e4087bf11ce22271dea0c6641c2a3a34bc70f4b80c6af3076df6000c87f9578ead11c','Ingeniero en Sistemas','2021-05-31',1),(2,2,'fatimamarlene.cruz@unab.edu.sv','f9b5428d703b91abfd1e21cd8172ebcacf77b443c058591cfd6b3224b858e5e0daf74e5d681815997ec93c75ce7d4d7f9da262ae399a8035809a08c33f92e150','Ingeniera en Sistemas','2021-05-31',1),(3,3,'joshuaalexander.galdamez@unab.edu.sv','08ceddf76967e1046774a4bcd1f5db39a5f2edab345a7bec2ac56b09127d47455f7ec40486e74e4cc437bec3dbd74e40205a98b8870ad2131c60e0ed2d551ba4','Ingeniero en Sistemas','2021-05-31',1),(4,4,'enmanuelenrique.orellana@unab.edu.sv','bf90b564fd54c51f9490058df2f874562fae2a1209b3fefcc412ffe9233c8f357902145f698d67c20468d5b95f2de941ceef517f7e56d1b81f08f8333f354c1e','Ingeniero en Sistemas','2021-05-31',1),(5,5,'marcosantonio.mejia@unab.edu.sv','b14347c40d2d779b44b2b44b878a4e866ae6cb861a2ee3482b66c90d673dddb7b58f86ad7616736ad664d80b4822cbd7160429fbd9238d16869e086684fc3dec','Ingeniero en Sistemas','2021-05-31',1);
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `idEstudiante` int NOT NULL AUTO_INCREMENT,
  `idPersona` int DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `Pass` varchar(600) DEFAULT NULL,
  `idGradoAcademico` int DEFAULT NULL,
  `Ultima_Modificacion` date DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `FK_idPersona1_idx` (`idPersona`),
  KEY `FK_idGradoAcademico_idx` (`idGradoAcademico`),
  CONSTRAINT `FK_idGradoAcademico` FOREIGN KEY (`idGradoAcademico`) REFERENCES `grados_academicos` (`idGradoAcademico`),
  CONSTRAINT `FK_idPersona1` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,1,'co0428032019@unab.edu.sv','ff682b76deb22764d78932e6cf2c137b851bae700d25a5b332ff633fb20e4087bf11ce22271dea0c6641c2a3a34bc70f4b80c6af3076df6000c87f9578ead11c',1,'2021-05-31',1),(2,2,'cc0285032019@unab.edu.sv','f9b5428d703b91abfd1e21cd8172ebcacf77b443c058591cfd6b3224b858e5e0daf74e5d681815997ec93c75ce7d4d7f9da262ae399a8035809a08c33f92e150',1,'2021-05-31',1),(3,3,'gg0210032019@unab.edu.sv','08ceddf76967e1046774a4bcd1f5db39a5f2edab345a7bec2ac56b09127d47455f7ec40486e74e4cc437bec3dbd74e40205a98b8870ad2131c60e0ed2d551ba4',1,'2021-05-31',1),(4,4,'os0020032018@unab.edu.sv','bf90b564fd54c51f9490058df2f874562fae2a1209b3fefcc412ffe9233c8f357902145f698d67c20468d5b95f2de941ceef517f7e56d1b81f08f8333f354c1e',1,'2021-05-31',1),(5,5,'mm0014032019@unab.edu.sv','b14347c40d2d779b44b2b44b878a4e866ae6cb861a2ee3482b66c90d673dddb7b58f86ad7616736ad664d80b4822cbd7160429fbd9238d16869e086684fc3dec',1,'2021-05-31',1);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grados_academicos`
--

DROP TABLE IF EXISTS `grados_academicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grados_academicos` (
  `idGradoAcademico` int NOT NULL AUTO_INCREMENT,
  `Nombre_GradoAcad` varchar(50) DEFAULT NULL,
  `Ultima_Modificacion` date DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`idGradoAcademico`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grados_academicos`
--

LOCK TABLES `grados_academicos` WRITE;
/*!40000 ALTER TABLE `grados_academicos` DISABLE KEYS */;
INSERT INTO `grados_academicos` VALUES (1,'Ingeniería en Sistemas y Computación','2021-05-31',1),(2,'Licenciatura en Administración de Empresas','2021-05-31',1),(3,'Licenciatura en Computación','2021-05-31',1),(4,'Licenciatura en Contaduría pública','2021-05-31',1),(5,'Licenciatura en Mercadeo','2021-05-31',1),(6,'Licenciatura en Relaciones Públicas','2021-05-31',1),(7,'Licenciatura en Turismo','2021-05-31',1),(8,'Licenciatura en Enfermería','2021-05-31',1),(9,'Licenciatura en Nutrición','2021-05-31',1),(10,'Licenciatura en Trabajo Social','2021-05-31',1),(11,'Licenciatura en Ciencias Juridicas','2021-05-31',1),(12,'Técnico en Computación','2021-05-31',1),(13,'Técnico en Contabilidad','2021-05-31',1),(14,'Técnico en Diseño Gráfico','2021-05-31',1),(15,'Técnico en Mantenimiento de Computadoras','2021-05-31',1),(16,'Técnico en Mercadeo','2021-05-31',1),(17,'Técnico en Redes Informáticas','2021-05-31',1),(18,'Técnico en Turismo','2021-05-31',1),(19,'Técnico en Enfermería','2021-05-31',1),(20,'Técnico en En Idioma Inglés','2021-05-31',1);
/*!40000 ALTER TABLE `grados_academicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `idMateria` int NOT NULL AUTO_INCREMENT,
  `idGradoAcademico` int DEFAULT NULL,
  `Nombre_Materia` varchar(45) DEFAULT NULL,
  `Ultima_Modificacion` date DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`idMateria`),
  KEY `fk_idMateria_idx` (`idMateria`),
  KEY `FK_idGradoAcademico4_idx` (`idGradoAcademico`),
  CONSTRAINT `FK_idGradoAcademico4` FOREIGN KEY (`idGradoAcademico`) REFERENCES `grados_academicos` (`idGradoAcademico`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,1,'ALGEBRA LINEAL','2021-05-31',1),(2,1,'CALCULO DIFERENCIAL','2021-05-31',1),(3,1,'FUNDAMENTOS DE PROGRAMACIÓN','2021-05-31',1),(4,1,'INGENIERÍA DE SOFTWARE I','2021-05-31',1),(5,1,'TEORIA DE LA COMPUTACIÓN','2021-05-31',1),(6,8,'MICROBIOLOGÍA','2021-05-31',1),(7,8,'ANATOMÍA Y FISIOLOGÍA','2021-05-31',1),(8,8,'ENFERMERÍA DE SALUD PÚBLICA II','2021-05-31',1),(9,8,'ENFERMERÍA ESPECIALIZADA','2021-05-31',1),(10,8,'METODOLOGÍA DE LA INVESTIGACIÓN ','2021-05-31',1),(11,19,'CICLO VITAL Y VIDA SALUDABLE','2021-05-31',1),(12,19,'SALUD MENTAL','2021-05-31',1),(13,19,'PRÁCTICA DE ENFERMERÍA','2021-05-31',1),(14,19,'SALUD DEL ADULTO MAYOR','2021-05-31',1),(15,19,'ENFERMERÍA EN ESPECIALIDADES','2021-05-31',1);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias_docentes`
--

DROP TABLE IF EXISTS `materias_docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias_docentes` (
  `idMateria_Docente` int NOT NULL AUTO_INCREMENT,
  `idDocente` int DEFAULT NULL,
  `idMateria` int DEFAULT NULL,
  `Ultima_Modificacion` date DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`idMateria_Docente`),
  KEY `FK_idDocente_idx` (`idDocente`),
  KEY `FK_idMateria4_idx` (`idMateria`),
  CONSTRAINT `FK_idDocente` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`idDocente`),
  CONSTRAINT `FK_idMateria4` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias_docentes`
--

LOCK TABLES `materias_docentes` WRITE;
/*!40000 ALTER TABLE `materias_docentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `materias_docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `idNota` int NOT NULL AUTO_INCREMENT,
  `idEstudiante` int DEFAULT NULL,
  `idMateria` int DEFAULT NULL,
  `Periodo1` decimal(4,2) DEFAULT NULL,
  `Periodo2` decimal(4,2) DEFAULT NULL,
  `Periodo3` decimal(4,2) DEFAULT NULL,
  `Nota_Final` decimal(4,2) DEFAULT NULL,
  `Recuperacion` decimal(4,2) DEFAULT NULL,
  `Ultima_Modificacion` date DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`idNota`),
  KEY `FK_idEstudiante1_idx` (`idEstudiante`),
  KEY `FK_idMateria_idx` (`idMateria`),
  CONSTRAINT `FK_idEstudiante2` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiantes` (`idEstudiante`),
  CONSTRAINT `FK_idMateria3` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `idPersona` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Sexo` varchar(45) DEFAULT NULL,
  `Dui` varchar(45) DEFAULT NULL,
  `Nit` varchar(45) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Ultima_Modificacion` date DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Andrés Eduardo','Córdova Orellana','M','06568975-1','0407-060301-010-1','2001-03-06','2021-05-31',1),(2,'Fatima Marlene','Cruz Calles','F','59781293-9','0705-060589-758-9','2001-07-24','2021-05-31',1),(3,'Joshua Alexander','Galdámez García','M','26897512-7','0708-569871-223-1','2001-03-11','2021-05-31',1),(4,'Enmanuel Enrique','Orellana Serrano','M','08569345-8','4562-963258-121-5','2001-04-03','2021-05-31',1),(5,'Marcos Antonio ','Mejía Miranda','M','56987412-5','5236-521478-235-1','2000-01-28','2021-05-31',1);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'administracionescolar'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_ABRIR_PDF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ABRIR_PDF`(PidActividadEst int)
BEGIN
SELECT Archivo FROM administracionescolar.actividades_estudiantes where idActividadEstudiante =PidActividadEst;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ANULAR_ENVIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ANULAR_ENVIO`(PidActividadEst int, PidEstudiante int)
BEGIN
Update actividades_estudiantes set Estado_Actividad = 'Pendiente' where idActividadEstudiante=PidActividadEst and idEstudiante=PidEstudiante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_ACTIVIDAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_ACTIVIDAD`(PidActividad int)
BEGIN
Update actividades set Estado=0 where idActividad=PidActividad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_DOCENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_DOCENTES`(
PidDocente int (11))
BEGIN
Update docentes set Estado=0 where idDocente = PidDocente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_ESTUDIANTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_ESTUDIANTES`(
PidEstudiante int(11))
BEGIN
Update estudiantes set Estado=0 where idEstudiante = PidEstudiante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_GRADOS_ACADEMICOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_GRADOS_ACADEMICOS`(
PIdGradoAcademico int(11)
)
BEGIN
Update grados_academicos set Estado=0 where idGradoAcademico = PIdGradoAcademico;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_MATERIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_MATERIAS`(
PidMateria int (12)
)
BEGIN
Update materias set Estado=0 where idMateria = PidMateria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_MATERIAS_ALUMNOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_MATERIAS_ALUMNOS`(
PIdMateriaAlumno int (11)
)
BEGIN
delete from materias_alumnos where idMateriaAlumno = PIdMateriaAlumno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_MATERIAS_DOCENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_MATERIAS_DOCENTES`(
PIdMateriaDocente int (11)
)
BEGIN
delete from materias_docentes where idMateriaDocente = PIdMateriaDocente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_NOTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_NOTAS`(
PIdNota int(11)
)
BEGIN
delete from notas where idNota = PIdNota;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_PERSONAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_PERSONAS`(
PidPersona int(11))
BEGIN
Update personas set Estado=0 where idPersona = PidPersona;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_ACTIVIDAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_ACTIVIDAD`(PidDocente int, PidMateria int, PNombre_Actividad varchar(45), PPorcentaje decimal(4,2), PFecha_Entrega date, PEstado_Actividad varchar(45), PUltima_Modificacion date, PEstado int)
BEGIN
Insert into actividades(idDocente, idMateria, Nombre_Actividad, Porcentaje, Fecha_Entrega, Estado_Actividad, Ultima_Modificacion, Estado) values(PidDocente, PidMateria, PNombre_Actividad, PPorcentaje, PFecha_Entrega, PEstado_Actividad, PUltima_Modificacion, PEstado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_ACTIVIDADES_ESTUDIANTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_ACTIVIDADES_ESTUDIANTES`(PidEstudiante int, PidActividad int, PidMateria int, 
PNota decimal(4,2), PArchivo varchar(200), PEstado_Act varchar(45), PUltima_Modificacion date, PEstado int)
BEGIN
Insert into actividades_estudiantes(idEstudiante, idActividad, idMateria, Nota_Obtenida, Archivo, Estado_Actividad, Ultima_Modificacion, Estado)
values(PidEstudiante, PidActividad, PidMateria, PNota, PArchivo, PEstado_Act, PUltima_Modificacion, PEstado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_ADMINISTRADORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_ADMINISTRADORES`(
PidPersona int,
PCorreo_Electronico varchar(50),
PPass varchar(600),
PUltima_Modificacion date
)
BEGIN
Insert into administradores(idPersona, Correo_Electronico, Pass, Ultima_Modificacion, Estado)
values (PidPersona, PCorreo_Electronico, sha2(PPass, 512), PUltima_Modificacion, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_DOCENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_DOCENTES`(
PidPersona int(11),
PCorreo_Electronico varchar(45),
PPass varchar (600), 
PEspecialidad varchar(45),
PUltima_Modificacion date,
PEstado int(11))
BEGIN
INSERT INTO docentes ( idPersona, Correo_Electronico, Pass, Especialidad,  Ultima_Modificacion, Estado) 
values ( PidPersona, PCorreo_Electronico,sha2(PPass,512), PEspecialidad, PUltima_Modificacion, PEstado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_ESTUDIANTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_ESTUDIANTES`(
PidPersona int(11),
PCorreo_Electronico varchar(75),
PPass varchar (600), 
PidGradoAcademico int,
PUltima_Modificacion date,
PEstado int(11))
BEGIN
INSERT INTO estudiantes (idPersona, Correo_Electronico, Pass, idGradoAcademico, Ultima_Modificacion, Estado) 
values (PidPersona, Pcorreo_Electronico, sha2(PPass,512), PidGradoAcademico, PUltima_Modificacion, PEstado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_GRADOS_ACADEMICOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_GRADOS_ACADEMICOS`(
PNombre_GradoAcad varchar(50),
PUltima_Modificacion date,
PEstado int(11)
)
BEGIN
insert into grados_academicos (Nombre_GradoAcad,Ultima_Modificacion,Estado) values (PNombre_GradoAcad,PUltima_Modificacion,PEstado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_MATERIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_MATERIAS`(
PidGradoAcademico int(11),
PNombre_Materia Varchar (45),
PUltima_Modificacion date,
PEstado int(11)
)
BEGIN
insert into materias (idGradoAcademico, Nombre_Materia,Ultima_Modificacion,Estado)
 values (PidGradoAcademico, PNombre_Materia,PUltima_Modificacion,PEstado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_MATERIAS_ALUMNOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_MATERIAS_ALUMNOS`(
PidEstudiante int(11),
PidMateria int(11),
PUltima_Modificacion date,
PEstado int(11)
)
BEGIN
insert into materias_alumnos(idEstudiante, idMateria, Ultima_Modificacion, Estado) 
values(PidEstudiante, PidMateria, PUltima_Modificacion, PEstado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_MATERIAS_DOCENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_MATERIAS_DOCENTES`(
PidDocente int(11),
PidMateria int(11),
PUltima_Modificacion varchar (45),
PEstado int(11)
)
BEGIN
insert into materias_docentes(idDocente, idMateria, Ultima_Modificacion, Estado) 
values(PidDocente, PidMateria, PUltima_Modificacion, PEstado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_NOTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_NOTAS`(
PidEstudiante int(11),
PidMateria int(11),
PPeriodo1 decimal(4,2),
PPeriodo2 decimal(4,2),
PPeriodo3 decimal(4,2),
PNota_Final decimal(4,2),
PRecuperacion decimal(4,2),
PUltima_Modificacion date,
PEstado int(11)
)
BEGIN
insert into notas(idEstudiante,idMateria,Periodo1,Periodo2,Periodo3,Nota_Final, Recuperacion, Ultima_Modificacion,Estado)
values (PidEstudiante,PidMateria,PPeriodo1, PPeriodo2, PPeriodo3, PNota_Final, PRecuperacion, PUltima_Modificacion,PEstado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_I_PERSONAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_I_PERSONAS`(
PNombre varchar (45), 
PApellido varchar (45), 
PSexo varchar(45),
PDui varchar(45),
PNit varchar(45),
PFecha_Nacimiento date,
PUltima_Modificacion date,
PEstado int(11))
BEGIN
INSERT INTO personas (Nombre, Apellido, Sexo, Dui, Nit, Fecha_Nacimiento, Ultima_Modificacion, Estado) 
value (PNombre, PApellido, PSexo, PDui, PNit, PFecha_Nacimiento, PUltima_Modificacion, PEstado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_ACTIVS_ALUMNOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_ACTIVS_ALUMNOS`(PidMateria int, PidActividad int)
BEGIN
SELECT a.idActividadEstudiante, a.idEstudiante, b.Correo_Electronico,c.Nombre_Actividad, a.Archivo,c.Porcentaje,a.Nota_Obtenida, a.Estado_Actividad FROM administracionescolar.actividades_estudiantes as a
inner join estudiantes as b on a.idEstudiante=b.idEstudiante
inner join actividades as c on a.idActividad=c.idActividad
where a.idMateria=PidMateria and a.idActividad=PidActividad and a.Estado_Actividad='Entregada';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_ALL_MATERIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_ALL_MATERIAS`()
BEGIN
SELECT * FROM administracionescolar.materias;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_APELLIDOSNOMBRES_A` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_APELLIDOSNOMBRES_A`(PCorreo varchar (50), Ppass varchar(600))
BEGIN
Select concat_ws(' ', p.Nombre, p.Apellido) As Nombres_Completos, d.idAdministrador from administradores d
inner join personas p on d.idPersona = p.idPersona
where d.Correo_Electronico = PCorreo and d.Pass = sha2(Ppass, 512);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_APELLIDOSNOMBRES_D` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_APELLIDOSNOMBRES_D`(PCorreo varchar (50), Ppass varchar(600))
BEGIN
Select concat_ws(', ', p.Apellido, p.Nombre) As Nombres_Completos, d.idDocente from docentes d
inner join personas p on d.idPersona = p.idPersona
where d.Correo_Electronico = PCorreo and d.Pass = sha2(Ppass, 512);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_APELLIDOSNOMBRES_E` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_APELLIDOSNOMBRES_E`(PCorreo varchar (50), Ppass varchar(600))
BEGIN
Select concat_ws(', ', p.Apellido, p.Nombre) As Nombres_Completos, e.idGradoAcademico, e.idEstudiante from estudiantes e
inner join personas p on e.idPersona = p.idPersona
where e.Correo_Electronico = PCorreo and e.Pass = sha2(Ppass, 512);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_CRIP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_CRIP`(
PCripPass varchar(600)
)
BEGIN
Select sha2(PCripPass, 512) as crip;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_DOCENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_DOCENTES`()
BEGIN
SELECT * FROM administracionescolar.docentes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_ESTUDIANTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_ESTUDIANTES`()
BEGIN
SELECT * FROM administracionescolar.estudiantes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_GRADOS_ACADEMICOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_GRADOS_ACADEMICOS`()
BEGIN
SELECT * FROM administracionescolar.grados_academicos where Estado=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_JOINDOCENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_JOINDOCENTES`()
BEGIN
SELECT d.idDocente, d.idPersona, p.Nombre, p.Apellido, p.Sexo, p.Dui, p.Nit, p.Fecha_Nacimiento, d.Correo_Electronico,d.Pass,
d.Especialidad, d.Ultima_Modificacion, d.Estado FROM docentes as d
inner join personas as p on d.idPersona = p.idPersona where d.Estado=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_JOINESTUDIANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_JOINESTUDIANTE`()
BEGIN
Select e.idEstudiante,p.idPersona, p.Nombre, p.Apellido, e.Correo_Electronico, e.Pass, p.Sexo, 
p.DUI, p.NIT, p.Fecha_Nacimiento, e.idGradoAcademico, g.Nombre_GradoAcad,
e.Ultima_Modificacion, e.Estado from estudiantes as e
inner join personas as p on e.idPersona = p.idPersona
inner join grados_academicos as g on e.idGradoAcademico = g.idGradoAcademico where e.Estado=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_JOINESTUDIANTEPERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_JOINESTUDIANTEPERSONA`(
PidEstudiante int(11))
BEGIN
select p.Nombre, p.Apellido, p.Sexo, p.Nit, p.Dui, ga.Nombre_GradoAcad, e.Correo_Electronico
from estudiantes as e
	inner join personas as p on e.idPersona = p.idPersona
    inner join grados_academicos as ga on e.idGradoAcademico = ga.idGradoAcademico
    where e.idEstudiante = PidEstudiante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_JOIN_DOCENTEPERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_JOIN_DOCENTEPERSONA`(PidDocente int(11))
BEGIN
select p.Nombre, p.Apellido, p.Sexo,p.Dui, p.Nit, d.Especialidad,d.Correo_Electronico from docentes as d
inner join personas as p on d.idPersona = p.idPersona
where d.idDocente = PidDocente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_LOGUIN_ADMINISTRADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_LOGUIN_ADMINISTRADOR`(
PCorreo_Electronico varchar (100), 
Ppass varchar(600)
)
BEGIN
select * from administradores
 where Correo_Electronico = PCorreo_Electronico 
 and Pass = sha2(Ppass,512) and Estado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_LOGUIN_DOCENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_LOGUIN_DOCENTES`(
PCorreo_Electronico varchar(100), 
PPass varchar (600))
BEGIN
select * from docentes 
where Correo_Electronico = PCorreo_Electronico
 and Pass = sha2(PPass,512) and Estado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_LOGUIN_ESTUDIANTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_LOGUIN_ESTUDIANTES`(
PCorreo_Electronico varchar (100), 
Ppass varchar(600)
)
BEGIN
select * from estudiantes
 where Correo_Electronico = PCorreo_Electronico 
 and Pass = sha2(Ppass,512) and Estado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_MATERIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_MATERIAS`(PidGrado_Academico int)
BEGIN
SELECT * FROM administracionescolar.materias where idGradoAcademico = PidGrado_Academico
and Estado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_MATERIASDOCENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_MATERIASDOCENTE`(PidDocente int)
BEGIN
SELECT 
    md.idMateria, m.Nombre_Materia
FROM
    administracionescolar.materias_docentes as md
INNER JOIN materias m on md.idMateria = m.idMateria where md.idDocente = PidDocente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_MATERIAS_ALL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_MATERIAS_ALL`()
BEGIN
select m.idMateria, m.idGradoAcademico, g.Nombre_GradoAcad, m.Nombre_Materia, m.Ultima_Modificacion, m.Estado from materias as m
inner join grados_academicos as g on m.idGradoAcademico = g.idGradoAcademico and m.Estado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_MATERIAS_ALUMNOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_MATERIAS_ALUMNOS`()
BEGIN
SELECT * FROM administracionescolar.materias_alumnos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_MATERIAS_DOCENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_MATERIAS_DOCENTES`()
BEGIN
SELECT * FROM administracionescolar.materias_docentes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_MOSTRAR_ACTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_MOSTRAR_ACTS`()
BEGIN
Select a.idActividad, a.idMateria, m.Nombre_Materia, a.Nombre_Actividad, a.Porcentaje, a.Fecha_Entrega from actividades as a
inner join materias as m on a.idMateria = m.idMateria where a.Estado=1 order by a.Fecha_Entrega ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_MOSTRAR_TAREAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_MOSTRAR_TAREAS`(PidMateria int)
BEGIN
Select idActividad, Nombre_Actividad, Porcentaje, Fecha_Entrega, Estado_Actividad from actividades as a
where Estado_Actividad='Pendiente' and idMateria = PidMateria and Estado=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_NOTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_NOTAS`()
BEGIN
SELECT * FROM administracionescolar.notas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_NOTAS_ALUMNO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_NOTAS_ALUMNO`(PidEstudiante int)
BEGIN
SELECT n.idMateria ,m.Nombre_Materia, n.Periodo1, n.Periodo2, n.Periodo3, n.Nota_Final, 
n.Recuperacion FROM administracionescolar.notas as n
inner join materias as m on n.idMateria = m.idMateria where n.idEstudiante = PidEstudiante
and m.Estado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_PERSONAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_PERSONAS`()
BEGIN
SELECT * FROM administracionescolar.personas where Estado=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_PUBLICAR_NOTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_PUBLICAR_NOTAS`(PidMateria int)
BEGIN
Select n.idNota, n.idEstudiante, e.Correo_Electronico, n.Periodo1, n.Periodo2, n.Periodo3, n.Nota_Final, n.Recuperacion from notas as n
inner join estudiantes as e on n.idEstudiante = e.idEstudiante where n.idMateria=PidMateria order by e.Correo_Electronico ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_REENVIAR_ACTIVIDAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_REENVIAR_ACTIVIDAD`(PidActEstudent int, PidEstudiante int, PArchivo varchar(200), PUltima_Modificacion date)
BEGIN
Update actividades_estudiantes set Archivo = PArchivo, Estado_Actividad = 'Entregada', Ultima_Modificacion = PUltima_Modificacion 
where idActividadEstudiante = PidActEstudent and idEstudiante =  PidEstudiante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_ULTIMAPERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_ULTIMAPERSONA`()
BEGIN
Select idPersona from personas order by idPersona desc limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_VALIDAR_ENTREGA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_VALIDAR_ENTREGA`(PidEstudiante int, PidActividad int)
BEGIN
Select * from actividades_estudiantes where idEstudiante = PidEstudiante AND idActividad = PidActividad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_VARIFICAR_MATERIAS_DOCENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_VARIFICAR_MATERIAS_DOCENTE`(PidDocente int)
BEGIN
Select * from materias_docentes where idDocente = PidDocente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_VERIFICAR_MATERIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_VERIFICAR_MATERIAS`(PidEstudiante int)
BEGIN
Select * from notas where idEstudiante = PidEstudiante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_VER_ACTIVIDADES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_VER_ACTIVIDADES`(PidEstudiante int)
BEGIN
SELECT a.idActividadEstudiante, a.idEstudiante ,c.Nombre_Materia, b.Nombre_Actividad, b.Porcentaje, a.Nota_Obtenida, a.Estado_Actividad, a.Archivo FROM administracionescolar.actividades_estudiantes as a
inner join actividades as b on a.idActividad=b.idActividad
inner join materias as c on a.idMateria=c.idMateria
where a.idEstudiante = PidEstudiante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_ACTIVIDAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_ACTIVIDAD`(PidActividad int, PidDocente int, PidMateria int, PNombre_Actividad varchar(45), PPorcentaje decimal(4,2), PFecha_Entrega date,PUltima_Modificacion date, PEstado int)
BEGIN
UPDATE actividades set  idDocente=PidDocente, idMateria=PidMateria, Nombre_Actividad=PNombre_Actividad, Porcentaje=PPorcentaje,
Fecha_Entrega=PFecha_Entrega, Ultima_Modificacion=PUltima_Modificacion, Estado=PEstado where idActividad=PidActividad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_ACTIVIDADES_ESTUDIANTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_ACTIVIDADES_ESTUDIANTES`(PidActividadEst int, PidEstudiante int, PNotaFinal decimal(4,2), PUltima_Modificacion date)
BEGIN
Update actividades_estudiantes set Nota_Obtenida=PNotaFinal, Estado_Actividad='Calificada', Ultima_Modificacion=PUltima_Modificacion
where idActividadEstudiante=PidActividadEst and idEstudiante=PidEstudiante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_DOCENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_DOCENTES`(
PidDocente int(11),
PidPersona int(11),
PCorreo_Electronico varchar(100),
PPass varchar (600), 
PEspecialidad varchar(45),
PUltima_Modificacion date,
PEstado int(11))
BEGIN
update docentes set idPersona = PidPersona,  Correo_Electronico = PCorreo_Electronico, Pass = sha2(PPass,512), 
Especialidad = PEspecialidad, Ultima_Modificacion = PUltima_Modificacion, Estado = PEstado
where idDocente = PidDocente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_ESTUDIANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_ESTUDIANTE`(
PidEstudiante int(11),
PidPersona int(11),
PCorreo_Electronico varchar(100),
PPass varchar (600), 
PidGradoAcademico int,
PUltima_Modificacion date,
PEstado int (11) )
BEGIN
update estudiantes set idPersona = PidPersona, 
 Correo_Electronico = PCorreo_Electronico, Pass = sha2(PPass,512), 
 idGradoAcademico = PidGradoAcademico, Ultima_Modificacion = PUltima_Modificacion, 
 Estado = PEstado
 where idEstudiante = PidEstudiante; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_GRADOS_ACADEMICOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_GRADOS_ACADEMICOS`(
PidGradoAcademico int(11),
PNombre_GradoAcad varchar(50),
PUltima_Modificacion date,
PEstado int(11)
)
BEGIN
update grados_academicos set Nombre_GradoAcad = PNombre_GradoAcad, 
Ultima_Modificacion = PUltima_Modificacion, Estado = PEstado 
where idGradoAcademico = PIdGradoAcademico;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_MATERIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_MATERIAS`(
PidMateria int (11),
PidGradoAcademico int(11),
PNombre_Materia varchar (45),
PUltima_Modificacion date,
PEstado int(11)
)
BEGIN
update materias set idGradoAcademico = PidGradoAcademico, Nombre_Materia = PNombre_Materia,
 Ultima_Modificacion = PUltima_Modificacion, Estado = PEstado 
where idMateria = PidMateria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_MATERIAS_ALUMNOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_MATERIAS_ALUMNOS`(
PidMateriaAlumno int (11),
PidEstudiante int (11),
PidMateria int (11),
PUltima_Modificacion date,
PEstado int (11)
)
BEGIN
update materias_alumnos set idEstudiante = PidEstudiante, idMateria = PidMateria, 
Ultima_Modificacion = PUltima_Modificacion, Estado = PEstado 
where idMateriaAlumno = PidMateriaAlumno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_MATERIAS_DOCENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_MATERIAS_DOCENTES`(
PidMateriaDocente int (11),
PidDocente int (11),
PidMateria int (11),
PUltima_Modificacion date,
PEstado int (11)
)
BEGIN
update materias_docentes set idDocente = PidDocente, idMateria = PidMateria,
 Ultima_Modificacion = PUltima_Modificacion, Estado = PEstado 
where idMateriaDocente = PidMateriaDocente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_NOTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_NOTAS`(
PidNota int (11),
PidEstudiante int (11),
PidMateria int (11),
PPeriodo1 decimal(4,2),
PPeriodo2 decimal(4,2),
PPeriodo3 decimal(4,2),
PNota_Final decimal(4,2),
PRecuperacion decimal(4,2),
PUltima_Modificacion date,
PEstado int(11)
)
BEGIN
update notas set idEstudiante = PidEstudiante, idMateria = PidMateria, 
Periodo1=PPeriodo1, Periodo2=PPeriodo2, Periodo3=PPeriodo3, 
Nota_Final = PNotaF_inal, Recuperacion = PRecuperacion, 
Ultima_Modificacion = PUltima_Modificacion, Estado = PEstado
 where idNota = PidNota;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_NOTA_ALUMNO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_NOTA_ALUMNO`(PidNota int,PP1 decimal(4,2), PP2 decimal(4,2), PP3 decimal(4,2), PFinal decimal(4,2), PRepo decimal(4,2), PUltima_Modificacion date)
BEGIN
Update notas set Periodo1=PP1, Periodo2=PP2, Periodo3=PP3, Nota_Final=PFinal, Recuperacion=PRepo, Ultima_Modificacion=PUltima_Modificacion where idNota=PidNota;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_PERSONAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_PERSONAS`(
PidPersona int(11),
PNombre varchar (45), 
PApellido varchar (45), 
PSexo varchar(45),
PDui varchar(45),
PNit varchar(45),
PFecha_Nacimiento date,
PUltima_Modificacion date,
PEstado int(11))
BEGIN
update personas set Nombre = PNombre, Apellido = PApellido, Sexo = PSexo, Dui=PDui,
 Nit=PNit, Fecha_Nacimiento = PFecha_Nacimiento, Ultima_Modificacion = PUltima_Modificacion, 
Estado = PEstado
where idPersona = PidPersona; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VALIDAREMAILDOCENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VALIDAREMAILDOCENTE`(email varchar(100))
BEGIN
select * from docentes where Correo_Electronico = email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VALIDAREMAILESTUDIANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VALIDAREMAILESTUDIANTE`(email varchar(100))
BEGIN
select * from estudiantes where Correo_Electronico = email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-10 12:12:10
