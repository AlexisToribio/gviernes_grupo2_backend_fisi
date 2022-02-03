-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: database-1.clr2narbw4gk.us-east-2.rds.amazonaws.com    Database: SGEA_MOVIL
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `tipo_coordinador` tinyint(1) NOT NULL,
  `nombre_coordinador` varchar(50) NOT NULL,
  `id_coordinador` int NOT NULL,
  `tipo_evento` varchar(4) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `duracion` tinyint NOT NULL,
  `tipo_inscripcion` tinyint(1) NOT NULL,
  `precio_inscripcion` smallint DEFAULT NULL,
  `descripcion` text NOT NULL,
  `tipo_certificado` tinyint(1) NOT NULL,
  `precio_certificado` smallint DEFAULT NULL,
  `tipo_ambiente` varchar(4) NOT NULL,
  `participantes` smallint NOT NULL,
  `logo` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_coordinador_id` (`id_coordinador`),
  KEY `fk_tipo_coordinador_id` (`tipo_coordinador`),
  KEY `fk_tipo_evento_id` (`tipo_evento`),
  KEY `fk_tipo_inscripcion_id` (`tipo_inscripcion`),
  KEY `fk_tipo_certificado_id` (`tipo_certificado`),
  KEY `fk_tipo_ambiente_id` (`tipo_ambiente`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (32,'Introduccion a la Programacion',1,'Fernando Gutierrez',1,'E001','2022-02-20','2022-02-28','10:00:00',1,1,NULL,'se enseñara los principios de la programacion',1,NULL,'A004',10,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.armadilloamarillo.com%2Fblog%2Fintroduccion-programacion%2F&psig=AOvVaw3eF6gKhBFk5yKCywhTfZSJ&ust=1643942742795000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCICi1ovC4vUCFQAAAAAdAAAAABAb'),(33,'Introduccion a la MicroServicios',1,'Cesar Aranda',1,'E002','2022-02-10','2022-02-15','11:00:00',2,2,30,'introduccion a los MicroServicios',2,5,'A004',15,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fcomunytek.com%2Fintroduccion-a-los-microservicios%2F&psig=AOvVaw3bV7n0ZsAiYUKXHc4jfGsn&ust=1643943021862000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMiTtZLD4vUCFQAAAAAdAAAAABAD'),(34,'SAP',2,'HACKANG CONSULTING',1,'E003','2022-02-05','2022-02-05','10:30:00',4,1,NULL,'introduccion a SAP',2,7,'A001',40,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fes.wikipedia.org%2Fwiki%2FSAP_SE&psig=AOvVaw3X777bi91CJYpeEoX5TQpm&ust=1643943069095000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCICJq6fD4vUCFQAAAAAdAAAAABAD'),(35,'Como Emprender',1,'Jhonny Bustamante',1,'E003','2022-02-08','2022-02-08','10:30:00',4,1,NULL,'tecnicas de emprendimiento y como empezar',3,NULL,'A002',50,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fchannel%2FUCZLR0JwA4_M2pStnP08t10A&psig=AOvVaw3yuFbIIJxW-gSJjIOTVTBd&ust=1643943129106000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKil4sPD4vUCFQAAAAAdAAAAABAu'),(36,'Big Data',1,'Roman Concha',1,'E004','2022-02-09','2022-02-16','10:00:00',3,1,NULL,'en que consiste y el impacto del big data',1,NULL,'A001',50,'https://www.google.com/url?sa=i&url=https%3A%2F%2Felordenmundial.com%2Fque-es-el-big-data%2F&psig=AOvVaw2NjoAofMyiI9DDWxAqDHfu&ust=1643943310336000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMCI3prE4vUCFQAAAAAdAAAAABAD'),(37,'Introduccion a la Computacion Visual',1,'Paco Guerte',1,'E002','2022-02-11','2022-02-11','10:00:00',5,2,30,'introduccion a la computacion visual',3,NULL,'A004',20,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DnLmLH4qHAO4&psig=AOvVaw3HyFwlDZufE5zq7YLCMa3d&ust=1643943400953000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLCbisfE4vUCFQAAAAAdAAAAABAD'),(38,'¿Que es IoT?',1,'Lucho Portuano',1,'E001','2022-02-12','2022-02-13','10:00:00',2,1,NULL,'introduccion al internet de las cosas',3,NULL,'A005',30,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdatascience.eu%2Fes%2Fwiki-es%2Funa-simple-explicacion-de-el-internet-de-las-cosas%2F&psig=AOvVaw2S2sPjcVJORs_LwUwZWRVe&ust=1643943470063000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKinlufE4vUCFQAAAAAdAAAAABA'),(39,'Arquitectura de Computadoras',1,'Renzo Contreras',1,'E001','2022-02-14','2022-02-16','10:00:00',3,1,NULL,'la importancia de los componentes de una computadora y su funcionamiento',1,NULL,'A002',40,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fx.utel.edu.mx%2Fcursos%2Fcursos%2Farquitectura-de-las-computadoras%2F&psig=AOvVaw1E5mdFFxN5HyVf4xsYOWO_&ust=1643943511297000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOj7qfrE4vUCFQAAAAAdAAAAABAZ'),(40,'Sistemas ERP',1,'Joseph Ortega',1,'E003','2022-02-17','2022-02-17','10:00:00',4,1,NULL,'la importancia e impacto de los sistemas ERP',1,NULL,'A001',50,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ntxpro.net%2Ferp%2Fimplementar-un-erp-2%2F&psig=AOvVaw2JVowcuVo11hYDcPPz9b1c&ust=1643943561129000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLD_2JHF4vUCFQAAAAAdAAAAABAN'),(41,'Ingenieria de la Informacion',1,'Piero Muchalucha',1,'E003','2022-02-18','2022-02-18','15:00:00',4,1,NULL,'la importancia de la ingenieria de informacion',1,NULL,'A001',40,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.todamateria.com%2Finformacion%2F&psig=AOvVaw2aNv6Bx9ZjEA_hZpYSphV4&ust=1643943596909000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLjttaPF4vUCFQAAAAAdAAAAABAD'),(42,'test',1,'123123',7,'E003','2022-02-11','2022-02-12','06:30:00',2,2,100,'LOREM LOREM LOREM Orem LOREM LOREM',1,0,'A004',100,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.digitallearning.es%2Fblog%2Ftest-super-community-manager%2F&psig=AOvVaw0tp3EuQOBZ1N4sgCI4MnM7&ust=1643943645730000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLjUorrF4vUCFQAAAAAdAAAAABAN');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_evento` int NOT NULL,
  `id_usuario` int NOT NULL,
  `certificado` tinyint(1) NOT NULL,
  `voucher` varchar(255) DEFAULT NULL,
  `fecha_inscripcion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_evento_id` (`id_evento`),
  KEY `fk_usuario_id` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES (2,32,1,1,'','2022-02-02 19:43:57'),(3,36,1,1,'','2022-02-02 19:46:36'),(4,39,1,1,'','2022-02-02 19:47:11'),(5,40,1,1,'','2022-02-02 19:47:14'),(6,41,1,1,'','2022-02-02 19:47:17'),(7,33,1,0,'voucher','2022-02-02 19:47:53'),(8,34,1,1,'voucher','2022-02-02 19:48:15');
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(12) NOT NULL,
  `estado` int NOT NULL,
  `id_evento` int NOT NULL,
  `fecha_envio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observaciones` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_estado_id` (`estado`),
  KEY `fk_evento_id` (`id_evento`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
INSERT INTO `solicitudes` VALUES (29,'FISI2022-32',2,32,'2022-02-02 19:09:28',NULL),(30,'FISI2022-33',2,33,'2022-02-02 19:12:29',NULL),(31,'FISI2022-34',2,34,'2022-02-02 19:16:49',NULL),(32,'FISI2022-35',3,35,'2022-02-02 19:20:18',NULL),(33,'FISI2022-36',2,36,'2022-02-02 19:22:39',NULL),(34,'FISI2022-37',3,37,'2022-02-02 19:25:29',NULL),(35,'FISI2022-38',3,38,'2022-02-02 19:28:54',NULL),(36,'FISI2022-39',2,39,'2022-02-02 19:36:02',NULL),(37,'FISI2022-40',2,40,'2022-02-02 19:39:23',NULL),(38,'FISI2022-41',2,41,'2022-02-02 19:40:58',NULL),(39,'FISI2022-42',3,42,'2022-02-03 01:56:53','de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas \"Letraset\", las cuales contenian pasaje');
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_ambiente`
--

DROP TABLE IF EXISTS `tipos_ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_ambiente` (
  `id` varchar(4) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_ambiente`
--

LOCK TABLES `tipos_ambiente` WRITE;
/*!40000 ALTER TABLE `tipos_ambiente` DISABLE KEYS */;
INSERT INTO `tipos_ambiente` VALUES ('A001','AUDITORIO'),('A002','AULA MAGNA'),('A003','AULA'),('A004','LABORATORIO'),('A005','EXTERIORES');
/*!40000 ALTER TABLE `tipos_ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_certificado`
--

DROP TABLE IF EXISTS `tipos_certificado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_certificado` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_certificado`
--

LOCK TABLES `tipos_certificado` WRITE;
/*!40000 ALTER TABLE `tipos_certificado` DISABLE KEYS */;
INSERT INTO `tipos_certificado` VALUES (1,'GRATUITO'),(2,'PAGO'),(3,'NO APLICA');
/*!40000 ALTER TABLE `tipos_certificado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_coordinador`
--

DROP TABLE IF EXISTS `tipos_coordinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_coordinador` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_coordinador`
--

LOCK TABLES `tipos_coordinador` WRITE;
/*!40000 ALTER TABLE `tipos_coordinador` DISABLE KEYS */;
INSERT INTO `tipos_coordinador` VALUES (1,'INDIVIDUAL'),(2,'GRUPAL');
/*!40000 ALTER TABLE `tipos_coordinador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_estado`
--

DROP TABLE IF EXISTS `tipos_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_estado`
--

LOCK TABLES `tipos_estado` WRITE;
/*!40000 ALTER TABLE `tipos_estado` DISABLE KEYS */;
INSERT INTO `tipos_estado` VALUES (1,'CANCELADO'),(2,'APROBADO'),(3,'PENDIENTE'),(4,'COMPLETO');
/*!40000 ALTER TABLE `tipos_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_evento`
--

DROP TABLE IF EXISTS `tipos_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_evento` (
  `id` varchar(4) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_evento`
--

LOCK TABLES `tipos_evento` WRITE;
/*!40000 ALTER TABLE `tipos_evento` DISABLE KEYS */;
INSERT INTO `tipos_evento` VALUES ('E001','TALLER'),('E002','CURSO'),('E003','CONFERENCIA'),('E004','CONGRESO'),('E005','SEMINARIO');
/*!40000 ALTER TABLE `tipos_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_inscripcion`
--

DROP TABLE IF EXISTS `tipos_inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_inscripcion` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_inscripcion`
--

LOCK TABLES `tipos_inscripcion` WRITE;
/*!40000 ALTER TABLE `tipos_inscripcion` DISABLE KEYS */;
INSERT INTO `tipos_inscripcion` VALUES (1,'GRATUITO'),(2,'PAGO');
/*!40000 ALTER TABLE `tipos_inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `edad` tinyint DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `sexo` varchar(9) DEFAULT NULL,
  `ocupacion` varchar(30) DEFAULT NULL,
  `tipo_usuario` varchar(1) NOT NULL DEFAULT 'N',
  `foto` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Joaquin','Torres Ortega','joaquin.torres@unmsm.edu.pe','$2b$10$j0FtL5c5rBwn7bPZ7761XuhRoQbllzEQTOUKPbi2d/kA90yFFgZUu',22,'945816293','MASCULINO','estudiante','N','foto'),(2,'Cesar','Cacho Leon','cesar.cacho@unmsm.edu.pe','$2b$10$ryzkEboKgrnpRvxmvOpPQOgy4T8SR8Pnc009vQD/GSD0DlfYWLQOC',22,'987456321','MASCULINO','estudiante','S','foto'),(3,'cesar','Cacho','cesitar1022@gmail.com','$2b$10$v300HhT9c4.hkLyq8DbvzObmC4v6qdPThO9.5JfkpZDsJEzVgGTVO',20,'999999999','MASCULINO','estudiante','N','foto'),(4,'Fernando','Altamirano','fer@gmail.com','$2b$10$s3.TNWtrDnK/UmVqD.cgj.Zh3gXU76ohRyFanyGrPvlmw4k7pgLhm',NULL,NULL,NULL,NULL,'N','foto'),(8,'Fernando','Altamirano','admin@gmail.com','$2b$10$hgSeVbCL8kW3Goz5j3LvAelIJFhb1K8JpjvlmkX4LE1sp83fib8Rm',21,'986175271','M',NULL,'S','https://fernandoimages.imgix.net/prueba/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg?auto=compress&cs=tinysrgb&dpr=2&h=400&w=400'),(6,'test1','test1','test1@hotmail.com','$2b$10$AxBW.EoSTnusLxFiMSaGTek4pQBdAXxxZdu4osnrEVNrQ9sSa3HCG',25,'123456789','Masculino','Ing. de Software','N',''),(7,'test10','test10','test10@gmail.com','$2b$10$tphO7DzbzePiGf5Io7y7v.q3/VnL8swzzIddPAim.amuSDcHz1hp2',21,'25888','Masculino','frontend fulltack','N','');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-02 22:05:33
