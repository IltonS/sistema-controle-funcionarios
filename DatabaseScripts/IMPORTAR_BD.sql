CREATE DATABASE  IF NOT EXISTS `db_scf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_scf`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: db_scf
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `tb_cargos`
--

DROP TABLE IF EXISTS `tb_cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cargos` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nome_cargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cargos`
--

LOCK TABLES `tb_cargos` WRITE;
/*!40000 ALTER TABLE `tb_cargos` DISABLE KEYS */;
INSERT INTO `tb_cargos` VALUES (1,'Analista Jr.'),(3,'Analista Pl.'),(4,'Analista Sr.'),(6,'Assistente I'),(7,'Assistente II');
/*!40000 ALTER TABLE `tb_cargos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_cargos_validacao_I` BEFORE INSERT ON `tb_cargos` FOR EACH ROW BEGIN
	DECLARE NOME_CARGO_COUNT INT;
    
	IF NEW.nome_cargo = '' OR NEW.nome_cargo IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Cargo não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_CARGO_COUNT FROM tb_cargos WHERE nome_cargo=NEW.nome_cargo;
    
    IF NOME_CARGO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Cargo já está cadastrado.';
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_cargos_validacao_A` BEFORE UPDATE ON `tb_cargos` FOR EACH ROW BEGIN
	DECLARE NOME_CARGO_COUNT INT;
    
	IF NEW.nome_cargo = '' OR NEW.nome_cargo IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Cargo não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_CARGO_COUNT FROM tb_cargos WHERE nome_cargo=NEW.nome_cargo AND id_cargo<>NEW.id_cargo;
    
    IF NOME_CARGO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Cargo já está cadastrado.';
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_funcionarios`
--

DROP TABLE IF EXISTS `tb_funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_funcionarios` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome_funcionario` varchar(45) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` varchar(1) NOT NULL DEFAULT 'M',
  `logradouro` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `id_uf` int DEFAULT NULL,
  `id_cargo` int DEFAULT NULL,
  `salario` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `FK_uf_idx` (`id_uf`),
  KEY `FK_cargo_idx` (`id_cargo`),
  CONSTRAINT `FK_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `tb_cargos` (`id_cargo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_uf` FOREIGN KEY (`id_uf`) REFERENCES `tb_uf` (`id_uf`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionarios`
--

LOCK TABLES `tb_funcionarios` WRITE;
/*!40000 ALTER TABLE `tb_funcionarios` DISABLE KEYS */;
INSERT INTO `tb_funcionarios` VALUES (8,'Pedro Silva','12345678900','1992-06-25','M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'João Silva','12345678911','1980-06-07','M','Avenida abc','5436',NULL,'Tijuca','Rio de Janeiro',13,NULL,NULL),(10,'Amanda Silva','12345678922','1982-06-15','F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'Natalia Silva','12345678933','1985-05-08','F','Rua Xyz','45','N/A','Penha','Rio de Janeiro',13,3,4000.00),(12,'Mateus Silva','12345678944','1989-10-04','F','Rua ijk','32','aptº 103','Ramos','Rio de Janeiro',13,1,2300.58),(13,'José Silva','78945612300','1985-12-18','M','Avenida xwz','741',NULL,'Olaria','Rio de Janeiro',13,1,2500.48);
/*!40000 ALTER TABLE `tb_funcionarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_funcionarios_validacao_I` BEFORE INSERT ON `tb_funcionarios` FOR EACH ROW BEGIN
	DECLARE NOME_FUNCIONARIO_COUNT INT;
    DECLARE CPF_COUNT INT;
    DECLARE DATA_NASCIMENTO_COUNT INT;
    
	IF NEW.nome_funcionario = '' OR NEW.nome_funcionario IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Funcionário não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_FUNCIONARIO_COUNT FROM tb_funcionarios WHERE nome_funcionario=NEW.nome_funcionario;
    
    IF NOME_FUNCIONARIO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Funcionário já está cadastrado.';
    END IF;
    
    IF NOT REGEXP_LIKE(NEW.cpf,'\\d{11}')  OR NEW.cpf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'CPF Inválido';
	END IF;
    
    SELECT COUNT(*) INTO CPF_COUNT FROM tb_funcionarios WHERE cpf = NEW.cpf;
    
    IF CPF_COUNT > 0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este CPF já está cadastrado';
    END IF;
    
    IF NEW.data_nascimento IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'O campo Data de Nascimento não pode ser vazio.';
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_funcionarios_validacao_A` BEFORE UPDATE ON `tb_funcionarios` FOR EACH ROW BEGIN
	DECLARE NOME_FUNCIONARIO_COUNT INT;
    DECLARE CPF_COUNT INT;
    DECLARE DATA_NASCIMENTO_COUNT INT;
    
	IF NEW.nome_funcionario = '' OR NEW.nome_funcionario IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Funcionário não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_FUNCIONARIO_COUNT FROM tb_funcionarios WHERE nome_funcionario=NEW.nome_funcionario AND id_funcionario<>NEW.id_funcionario;
    
    IF NOME_FUNCIONARIO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Funcionário já está cadastrado.';
    END IF;
    
    IF NOT REGEXP_LIKE(NEW.cpf,'\\d{11}')  OR NEW.cpf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'CPF Inválido';
	END IF;
    
    SELECT COUNT(*) INTO CPF_COUNT FROM tb_funcionarios WHERE cpf = NEW.cpf AND id_funcionario<>NEW.id_funcionario;
    
    IF CPF_COUNT > 0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este CPF já está cadastrado';
    END IF;
    
    IF NEW.data_nascimento IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'O campo Data de Nascimento não pode ser vazio.';
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_perfis`
--

DROP TABLE IF EXISTS `tb_perfis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_perfis` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `nome_perfil` varchar(45) DEFAULT NULL,
  `tb_uf` tinyint NOT NULL DEFAULT '0',
  `tb_uf_I` tinyint NOT NULL DEFAULT '0',
  `tb_uf_A` tinyint NOT NULL DEFAULT '0',
  `tb_uf_E` tinyint NOT NULL DEFAULT '0',
  `tb_cargos` tinyint NOT NULL DEFAULT '0',
  `tb_cargos_I` tinyint NOT NULL DEFAULT '0',
  `tb_cargos_A` tinyint NOT NULL DEFAULT '0',
  `tb_cargos_E` tinyint NOT NULL DEFAULT '0',
  `tb_funcionarios` tinyint NOT NULL DEFAULT '0',
  `tb_funcionarios_I` tinyint NOT NULL DEFAULT '0',
  `tb_funcionarios_A` tinyint NOT NULL DEFAULT '0',
  `tb_funcionarios_E` tinyint NOT NULL DEFAULT '0',
  `tb_usuarios` tinyint NOT NULL DEFAULT '0',
  `tb_usuarios_I` tinyint NOT NULL DEFAULT '0',
  `tb_usuarios_A` tinyint NOT NULL DEFAULT '0',
  `tb_usuarios_E` tinyint NOT NULL DEFAULT '0',
  `tb_perfis` tinyint NOT NULL DEFAULT '0',
  `tb_perfis_I` tinyint NOT NULL DEFAULT '0',
  `tb_perfis_A` tinyint NOT NULL DEFAULT '0',
  `tb_perfis_E` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_perfis`
--

LOCK TABLES `tb_perfis` WRITE;
/*!40000 ALTER TABLE `tb_perfis` DISABLE KEYS */;
INSERT INTO `tb_perfis` VALUES (1,'Administrador',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(2,'Leitura N2',1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0),(3,'Leitura N1',1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0),(5,'Bloqueado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `tb_perfis` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_perfis_validacao_I` BEFORE INSERT ON `tb_perfis` FOR EACH ROW BEGIN
	DECLARE NOME_PERFIL_COUNT INT;
    
	IF NEW.nome_perfil = '' OR NEW.nome_perfil IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Perfil não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_PERFIL_COUNT FROM tb_perfis WHERE nome_perfil=NEW.nome_perfil;
    
    IF NOME_PERFIL_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Perfil já está cadastrado.';
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_perfis_validacao_A` BEFORE UPDATE ON `tb_perfis` FOR EACH ROW BEGIN
	DECLARE NOME_PERFIL_COUNT INT;
    
	IF NEW.nome_perfil = '' OR NEW.nome_perfil IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Perfil não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_PERFIL_COUNT FROM tb_perfis WHERE nome_perfil=NEW.nome_perfil AND id_perfil<>NEW.id_perfil;
    
    IF NOME_PERFIL_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Perfil já está cadastrado.';
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_uf`
--

DROP TABLE IF EXISTS `tb_uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_uf` (
  `id_uf` int NOT NULL AUTO_INCREMENT,
  `uf` varchar(2) DEFAULT NULL,
  `nome_estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_uf`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_uf`
--

LOCK TABLES `tb_uf` WRITE;
/*!40000 ALTER TABLE `tb_uf` DISABLE KEYS */;
INSERT INTO `tb_uf` VALUES (13,'RJ','Rio de Janeiro'),(14,'SP','São Paulo'),(15,'MG','Minas Gerais'),(16,'ES','Espírito Santo'),(33,'DF','Distrito Federal');
/*!40000 ALTER TABLE `tb_uf` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_uf_validacao_I` BEFORE INSERT ON `tb_uf` FOR EACH ROW BEGIN
	DECLARE UF_COUNT INT;
    DECLARE NOME_ESTADO_COUNT INT;
    
    IF NEW.uf = '' OR NEW.uf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo UF não pode ser vazio.';
	ELSEIF NEW.nome_estado = '' OR NEW.nome_estado IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Estado não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO UF_COUNT FROM tb_uf WHERE uf=NEW.uf;
    
    IF UF_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Esta UF já está cadastrada';
    END IF;
    
    SELECT COUNT(*) INTO NOME_ESTADO_COUNT FROM tb_uf WHERE nome_estado=NEW.nome_estado;
    
    IF NOME_ESTADO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome de Estado já está cadastrado';
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_uf_validacao_A` BEFORE UPDATE ON `tb_uf` FOR EACH ROW BEGIN
	DECLARE UF_COUNT INT;
    DECLARE NOME_ESTADO_COUNT INT;
    
	IF NEW.uf = '' OR NEW.uf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo UF não pode ser vazio.';
	ELSEIF NEW.nome_estado = ''  OR NEW.nome_estado IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Estado não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO UF_COUNT FROM tb_uf WHERE uf=NEW.uf AND id_uf<>NEW.id_uf;
    
    IF UF_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Esta UF já está cadastrada';
    END IF;
    
    SELECT COUNT(*) INTO NOME_ESTADO_COUNT FROM tb_uf WHERE nome_estado=NEW.nome_estado AND id_uf<>NEW.id_uf;
    
    IF NOME_ESTADO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome de Estado já está cadastrado';
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `id_perfil` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `FK_id_perfil_idx` (`id_perfil`),
  CONSTRAINT `FK_id_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `tb_perfis` (`id_perfil`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
INSERT INTO `tb_usuarios` VALUES (1,'master','master',1),(2,'visitante','visitante',2),(6,'visitante2','visitante2',5);
/*!40000 ALTER TABLE `tb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_usuarios_validacao_I` BEFORE INSERT ON `tb_usuarios` FOR EACH ROW BEGIN
	DECLARE LOGIN_COUNT INT;
    
	IF NEW.login = '' OR NEW.login IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Login não pode ser vazio.';
	END IF;
    
    IF NEW.senha = '' OR NEW.senha IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Senha não pode ser vazio.';
	END IF;
    
    IF NEW.id_perfil = '' OR NEW.id_perfil IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Perfil não pode ser vazio.';
	END IF;
    
	SELECT COUNT(*) INTO LOGIN_COUNT FROM tb_usuarios WHERE login=NEW.login;
    
    IF LOGIN_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Login já está cadastrado.';
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_usuarios_validacao_A` BEFORE UPDATE ON `tb_usuarios` FOR EACH ROW BEGIN
	DECLARE LOGIN_COUNT INT;
    
	IF NEW.login = '' OR NEW.login IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Login não pode ser vazio.';
	END IF;
    
    IF NEW.senha = '' OR NEW.senha IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Senha não pode ser vazio.';
	END IF;
    
    IF NEW.id_perfil = '' OR NEW.id_perfil IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Perfil não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO LOGIN_COUNT FROM tb_usuarios WHERE login=NEW.login AND id_usuario<>NEW.id_usuario;
    
    IF LOGIN_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Login já está cadastrado.';
    END IF;
    
END */;;
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

-- Dump completed on 2021-06-25 18:25:48
