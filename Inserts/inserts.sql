-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: terminal_automotriz
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `autos_insumos`
--

DROP TABLE IF EXISTS `autos_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autos_insumos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modeloId` int(11) DEFAULT NULL,
  `insumoId` int(11) DEFAULT NULL,
  `cant` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_autos_modelos_idx` (`modeloId`),
  KEY `fk_insumos_idx` (`insumoId`),
  CONSTRAINT `fk_autos_modelos_2` FOREIGN KEY (`modeloId`) REFERENCES `autos_modelos` (`id`),
  CONSTRAINT `fk_insumos` FOREIGN KEY (`insumoId`) REFERENCES `insumos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autos_modelos`
--

DROP TABLE IF EXISTS `autos_modelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autos_modelos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `concesionarias`
--

DROP TABLE IF EXISTS `concesionarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concesionarias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `eliminado` tinyint(4) DEFAULT NULL,
  `eliminadoFecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `concesionarias_ventas`
--

DROP TABLE IF EXISTS `concesionarias_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concesionarias_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concesionariaId` int(11) DEFAULT NULL,
  `modeloId` int(11) DEFAULT NULL,
  `entregado` tinyint(4) DEFAULT NULL,
  `fechaEntrega` datetime DEFAULT NULL,
  `fechaEntregaAprox` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_concesionaria_idx` (`concesionariaId`),
  CONSTRAINT `fk_concesionaria` FOREIGN KEY (`concesionariaId`) REFERENCES `concesionarias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1075895 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insumos_detalle`
--

DROP TABLE IF EXISTS `insumos_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insumosId` int(11) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `proveedorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_insumos_idx` (`insumosId`),
  KEY `fk_proveedor_idx` (`proveedorId`),
  CONSTRAINT `fk_insumos_2` FOREIGN KEY (`insumosId`) REFERENCES `insumos` (`id`),
  CONSTRAINT `fk_proveedor` FOREIGN KEY (`proveedorId`) REFERENCES `terminal_proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insumos_pedidos`
--

DROP TABLE IF EXISTS `insumos_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insumoId` int(11) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `proveedorId` int(11) DEFAULT NULL,
  `pedidoNro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_Insumo_idx` (`insumoId`),
  KEY `fk_pedido_proveedor_idx` (`proveedorId`),
  CONSTRAINT `fk_pedido_Insumo` FOREIGN KEY (`insumoId`) REFERENCES `insumos` (`id`),
  CONSTRAINT `fk_pedido_proveedor` FOREIGN KEY (`proveedorId`) REFERENCES `terminal_proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terminal_estaciones`
--

DROP TABLE IF EXISTS `terminal_estaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_estaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `montajeId` int(11) DEFAULT NULL,
  `tareasId` int(11) DEFAULT NULL,
  `disponible` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tareas_idx` (`tareasId`),
  KEY `fk_montaje_idx` (`montajeId`),
  CONSTRAINT `fk_montaje` FOREIGN KEY (`montajeId`) REFERENCES `terminal_montaje` (`id`),
  CONSTRAINT `fk_tareas` FOREIGN KEY (`tareasId`) REFERENCES `terminal_tareas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terminal_montaje`
--

DROP TABLE IF EXISTS `terminal_montaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_montaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` int(11) DEFAULT NULL,
  `promAutosMes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_autos_modelos_idx` (`modelo`),
  CONSTRAINT `fk_autos_modelos` FOREIGN KEY (`modelo`) REFERENCES `autos_modelos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terminal_produccion`
--

DROP TABLE IF EXISTS `terminal_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_produccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modeloId` int(11) DEFAULT NULL,
  `patente` varchar(45) DEFAULT NULL COMMENT 'ID de Montaje Asignada',
  `pedidoNro` int(11) DEFAULT NULL,
  `montajeId` int(11) DEFAULT '0',
  `fechaIngreso` datetime DEFAULT NULL,
  `fechaEgreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patente_UNIQUE` (`patente`),
  KEY `fk_autos_modelos_idx` (`modeloId`),
  KEY `fk_autos_modelos_asignada_idx` (`montajeId`),
  CONSTRAINT `fk_autos_modelos_3` FOREIGN KEY (`modeloId`) REFERENCES `autos_modelos` (`id`),
  CONSTRAINT `fk_autos_modelos_asignada` FOREIGN KEY (`montajeId`) REFERENCES `terminal_montaje` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terminal_produccion_etapa`
--

DROP TABLE IF EXISTS `terminal_produccion_etapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_produccion_etapa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patente` varchar(45) DEFAULT NULL,
  `estacion` int(11) DEFAULT NULL,
  `fechaIngreso` datetime DEFAULT NULL,
  `fechaEgreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terminal_proveedores`
--

DROP TABLE IF EXISTS `terminal_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `eliminado` tinyint(4) DEFAULT NULL,
  `eliminadoFecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terminal_tareas`
--

DROP TABLE IF EXISTS `terminal_tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal_tareas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'terminal_automotriz'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_concesionarias_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_concesionarias_alta`(
	in 	cNombre varchar(45),
    out cID int,
    out cMensaje varchar(255),
    out nResultado int
)
BEGIN
	if exists(select nombre, id from concesionarias where nombre = cNombre) then
		set cMensaje= 'La Concesionaria ya Existe en la Base de Datos';
		set cID = (select id from concesionarias where nombre = cNombre);
        set nResultado = -1;
    else
		insert into concesionarias(nombre) values(cNombre);
		set cMensaje= 'Ingreso Exitoso';
        set cID = (select id from concesionarias where nombre = cNombre);
        set nResultado = 0;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_concesionarias_eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_concesionarias_eliminar`(
	in cId int,
    out cMensaje varchar(255),
    out nResultado int
)
BEGIN
	update concesionarias set eliminado = 1, eliminadoFecha = now() where id = cId;
    IF (SELECT row_count() > 0) THEN
		set cMensaje = "Concesionaria dada de Baja Correctamente";
        set nResultado = 0;
	ELSE 
		set cMensaje = "ID de Concesionaria no Encontrado";
        set nResultado = -1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_concesionarias_modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_concesionarias_modificar`(
	in cID int,
	in cNuevoNombre varchar(45),
    out cMensaje VARCHAR(255),
    out nResultado INT
)
BEGIN
	update concesionarias set nombre = cNuevoNombre where id = cID;
    IF( row_count() > 0 ) THEN
		set cMensaje = "Concesionaria Modificada Correctamente";
        set nResultado = 0;
    ELSE
		set cMensaje = "No se Encontro la Concesionaria";
        set nResultado = -1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insumo_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insumo_alta`(
	in CodigoInsumo INT,
	in NombreInsumo VARCHAR(45),
    in DescInsumo VARCHAR(45),
    in StockInicial INT,
    out nResultado INT,
    out cMensaje VARCHAR(45)
)
BEGIN
	IF(EXISTS(SELECT * FROM insumos WHERE id = CodigoInsumo)) THEN
		set cMensaje = "Ya esta cargado el Insumo";
        set nResultado = -1;
    ELSE
		INSERT INTO insumos (id, nombre, descripcion, stock) VALUES (CodigoInsumo, NombreInsumo, DescInsumo, StockInicial);
		set cMensaje = "Insumo Cargado Exitosamente";
        set nResultado = 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insumo_detalles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insumo_detalles`(
	in CodigoProducto INT,
    in Precio FLOAT,
    in ProveedorID INT,
    out cMensaje VARCHAR(255),
    out nResultado INT
)
BEGIN
	/*ver porque con un segundo proveedor no entra en el primer else*/
	IF(EXISTS(SELECT * FROM insumos_detalle WHERE insumosId = CodigoProducto AND proveedorId = ProveedorID)) THEN
		IF(EXISTS(SELECT * FROM terminal_proveedores where id = ProveedorID)) THEN
			UPDATE insumos_detalle SET precio = Precio WHERE insumosId = CodigoProducto AND proveedorId = ProveedorID; 
			set cMensaje = "Detalle de Precio Actualizado";
			set nResultado = -1;
		ELSE
			set cMensaje = "No se Encontro el Proveedor";
            set nResultado = -3;
        END IF;
    ELSE
		IF(EXISTS(SELECT * FROM insumos WHERE id = CodigoProducto)) THEN
			IF(EXISTS(SELECT * FROM terminal_proveedores where id = ProveedorID)) THEN
				INSERT INTO insumos_detalle (insumosId, precio, proveedorId) VALUES (CodigoProducto, Precio, ProveedorID);
				set cMensaje = "Detalle de Insumo Cargado Exitosamente";
				set nResultado = 0;
			ELSE
            	set cMensaje = "No se Encontro el Proveedor";
				set nResultado = -3;
            END IF;
		ELSE
			set cMensaje = "No se encontro el Insumo";
            set nResultado = -2;
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modelos_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modelos_alta`(
	in ModeloNombre VARCHAR(45),
    out nResultado INT
)
BEGIN
	set nResultado = -1;
	INSERT INTO autos_modelos (nombre) VALUES (ModeloNombre);
    IF( row_count() > 0 ) THEN
		set nResultado = 0;
    END IF;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modelos_insumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modelos_insumos`(
	in ModeloID VARCHAR(45),
    in InsumoID INT,
    in Cantidad FLOAT,
    out nResultado INT
)
BEGIN
	set nResultado = -1;
	INSERT INTO autos_insumos (modeloId, insumoId, cant) VALUES (ModeloID, InsumoID, Cantidad);
    IF( row_count() > 0 ) THEN
		set nResultado = 0;
    END IF;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pedido_automotor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_automotor`(
	in ConcesionariaID INT,
    in ModeloPedido INT,
    out nPatente VARCHAR(8),
    out nResultado INT,
    out cMensaje VARCHAR(255)
)
BEGIN
	DECLARE cur_termino INT DEFAULT 0;
    DECLARE cur_insumo_id INT;
    DECLARE cur_insumo_cant INT;
    DECLARE cur_insumos CURSOR FOR SELECT insumoId, cant FROM autos_insumos WHERE modeloId = ModeloPedido;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET cur_termino = 1;
    
	IF(EXISTS(SELECT * FROM concesionarias WHERE id = ConcesionariaID)) THEN
		IF(EXISTS(SELECT * FROM autos_modelos WHERE id = ModeloPedido)) THEN
				set nResultado = 0;
                /*Buscar la cantidad de autos que hay en produccion para sacar la fecha de entrega aprox*/
                INSERT INTO concesionarias_ventas (concesionariaId, modeloId, fechaEntregaAprox) VALUES (ConcesionariaID, ModeloPedido, NOW() + INTERVAL 7 DAY);
				SET @PedidoNro = (SELECT id FROM concesionarias_ventas ORDER BY id DESC LIMIT 1);
                /*Ingresa el Auto a Produccion y si no tiene los insumos pide a los proveedores*/
                OPEN cur_insumos;
                REPEAT
                FETCH cur_insumos INTO cur_insumo_id, cur_insumo_cant;
                IF((SELECT stock FROM insumos WHERE id = cur_insumo_id LIMIT 1) < cur_insumo_cant) THEN
					INSERT INTO insumos_pedidos (insumoId, cantidad, proveedorId, pedidoNro) VALUES
                    (cur_insumo_id, cur_insumo_cant - (SELECT stock FROM insumos WHERE id = cur_insumo_id LIMIT 1), 
                    (SELECT proveedorId FROM insumos_detalle WHERE insumosId = cur_insumo_id ORDER BY precio DESC LIMIT 1), @PedidoNro);
                END IF;
                UNTIL cur_termino END REPEAT;
                CLOSE cur_insumos;
                /*Ahora Ingresa el Auto a Produccion VER ERROR de PATENTE DUPLICADA*/
                SELECT @iPatente := UPPER(SUBSTRING(MD5(RAND()) FROM 1 FOR 6));

                INSERT INTO terminal_produccion (modeloId, patente, pedidoNro, fechaIngreso) VALUES (ModeloPedido, @iPatente, @PedidoNro, NOW());
				
                UPDATE terminal_produccion SET montajeId = (SELECT id FROM terminal_montaje WHERE modelo = ModeloPedido) ORDER BY id DESC LIMIT 1;

                IF( row_count() < 1 ) THEN
					set cMensaje = "Error Patente Duplicada";
					set nResultado = -2;
				END IF;
                /*El Auto Ingresa a Montaje*/
                IF(EXISTS(SELECT * FROM terminal_montaje where modelo = ModeloPedido)) THEN
					UPDATE terminal_montaje SET PromAutosMes = (SELECT CONCAT((SELECT COUNT(*) FROM terminal_produccion WHERE MONTH(fechaIngreso) = MONTH(CURRENT_DATE())) * 100 / COUNT(*), "%") as Prom FROM terminal_produccion WHERE modeloId = ModeloPedido) WHERE modelo = ModeloPedido;
                ELSE
					INSERT INTO terminal_montaje (modelo, promAutosMes) VALUES (ModeloPedido, (SELECT CONCAT((SELECT COUNT(*) FROM terminal_produccion WHERE MONTH(fechaIngreso) = MONTH(CURRENT_DATE())) * 100 / COUNT(*), "%") as Prom FROM terminal_produccion));
				END IF;
                set nPatente = @iPatente;
                set cMensaje = "El Auto Fue Derivado a Produccion correctamente";
                set nResultado = 0;
            ELSE
				set cMensaje = "No Existe el Modelo de Auto";
                set nResultado = -1;
        END IF;
        ELSE
			set cMensaje = "No Existe la Concesionaria";
            set nResultado = -1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pedido_etapa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_etapa`(
	in iPatente VARCHAR(8),
    out cMensaje VARCHAR(255),
    out nResultado INT
)
BEGIN
	IF(EXISTS(SELECT * FROM terminal_produccion_etapa WHERE patente = iPatente ORDER BY id ASC LIMIT 1)) THEN
		/*Necesito saber en que estacion esta*/
        SET @iEstacion = (SELECT estacion FROM terminal_produccion_etapa WHERE patente = iPatente ORDER BY id DESC LIMIT 1);
        SET @iTareaActual = (SELECT tareasId FROM terminal_produccion_etapa INNER JOIN terminal_estaciones on terminal_estaciones.id = terminal_produccion_etapa.estacion LIMIT 1);
        SET @iMontajeID = (SELECT montajeId FROM terminal_produccion_etapa INNER JOIN terminal_estaciones on terminal_estaciones.id = terminal_produccion_etapa.estacion LIMIT 1);
        SET @iProxEstacion = (SELECT id FROM terminal_estaciones WHERE montajeId = @iMontajeID and tareasId > @iTareaActual ORDER BY id ASC LIMIT 1);
        SET @iPedidoNro = (SELECT pedidoNro FROM terminal_produccion WHERE patente = iPatente ORDER BY id DESC LIMIT 1);
        /*Actualizo que termino la tarea*/
        IF(IFNULL(@iProxEstacion, 1) = 1) THEN
			UPDATE terminal_estaciones SET disponible = 0 WHERE id = @iEstacion;
			UPDATE terminal_produccion SET fechaEgreso = NOW() WHERE patente = iPatente ORDER BY id DESC LIMIT 1;
			UPDATE terminal_produccion_etapa SET fechaEgreso = NOW() WHERE patente = iPatente ORDER BY id DESC LIMIT 1;
            UPDATE concesionarias_ventas SET entregado = 1, fechaEntrega = NOW() WHERE id = @iPedidoNro;
			set cMensaje = "Termino la produccion llego al final";			
		ELSE
			UPDATE terminal_produccion_etapa SET fechaEgreso = NOW() WHERE patente = iPatente ORDER BY id DESC LIMIT 1;
			INSERT INTO terminal_produccion_etapa (patente, estacion, fechaIngreso) VALUES (iPatente, @iProxEstacion, NOW());
			set nResultado = 0;
			set cMensaje = "Se actualizo la estacion y etapa";
        END IF;
    ELSE
		set nResultado = -1;
		set cMensaje = "";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pedido_produccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_produccion`(
	in iPatente VARCHAR(8),
    out nResultado INT,
    out cMensaje VARCHAR(255)
)
BEGIN
	/* Ver si esta disponible la estacion para iniciar la primer tarea */
	IF(EXISTS(SELECT * FROM terminal_estaciones WHERE montajeId = (SELECT montajeId FROM terminal_produccion WHERE patente = iPatente LIMIT 1) ORDER by tareasId ASC LIMIT 1)) THEN
		/*Primera Tarea */
        SET @iID = (SELECT id FROM terminal_estaciones WHERE montajeId = (SELECT montajeId FROM terminal_produccion WHERE patente = iPatente LIMIT 1) ORDER by tareasId ASC LIMIT 1);
		IF(EXISTS(SELECT * FROM terminal_estaciones where id = @iID AND disponible = 0)) THEN
			/*Estacion Disponible*/
			UPDATE terminal_estaciones SET disponible = 1 WHERE id = @iID;
            INSERT INTO terminal_produccion_etapa (patente, estacion, fechaIngreso) VALUES (iPatente, @iID, NOW());
            set cMensaje = "Estacion Disponible - Asignada a la Patente Ingresada";
			set nResultado = 0;
		ELSE
			set nResultado = -1;
			set cMensaje = "La estacion se encuentra ocupada";
        END IF;
    ELSE
		set nResultado = -2;
        set cMensaje = "No Se Encontraron Estaciones con Tareas";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_proveedor_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_proveedor_alta`(
	in 	pRazonSocial varchar(45),
    out pID int,
    out pMensaje varchar(255),
    out nResultado INT
)
BEGIN
	if exists(select nombre, id from terminal_proveedores where nombre = pRazonSocial) then
		set pMensaje= 'La Razon Social ya Existe en la Base de Datos';
		set pID = (select id from terminal_proveedores where nombre = pRazonSocial);
        set nResultado = -1;
    else
		insert into terminal_proveedores(nombre) values(pRazonSocial);
		set pMensaje= 'Ingreso Exitoso';
        set pID = (select id from terminal_proveedores where nombre = pRazonSocial);
        set nResultado = 0;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_proveedor_eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_proveedor_eliminar`(
	in pID int,
    out pMensaje varchar(255),
    out nResultado INT
)
BEGIN
	update terminal_proveedores set eliminado = 1, eliminadoFecha = now() where id = pID;
    IF (SELECT row_count() > 0) THEN
		set pMensaje = "Proveedor dada de Baja Correctamente";
        set nResultado = 0;
	ELSE 
		set pMensaje = "ID de Proveedor no Encontrado";
        set nResultado = -1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_proveedor_modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_proveedor_modificar`(
	in pID int,
	in pNuevoNombre varchar(45),
    out pMensaje VARCHAR(255),
    out nResultado INT
)
BEGIN
	update terminal_proveedores set nombre = pNuevoNombre where id = pID;
    IF( row_count() > 0 ) THEN
		set pMensaje = "Proveedor Modificado Correctamente";
        set nResultado = 0;
    ELSE
		set pMensaje = "No se Encontro el Proveedor";
        set nResultado = -1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_mostrar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_report_mostrar_estado`(
	in iPedidoNro INT
)
BEGIN

	DECLARE iPatente VARCHAR(255);
    DECLARE iFechaEntregado DATETIME;
    DECLARE iEntregado VARCHAR(45);
    DECLARE iEstacion INT;
    DECLARE iTarea VARCHAR(255);
    
    DROP TABLE IF EXISTS tempReporteVehiculo;
    
	CREATE TEMPORARY TABLE tempReporteVehiculo
	(
		NumeroPedido INT not null,
		NumeroPatente VARCHAR(8),
        Terminado VARCHAR(45) not null,
        FechaEntregado datetime,
        Estacion INT,
        Tarea VARCHAR(255)
	);
    
    SELECT 
		terminal_produccion.patente,
		terminal_produccion.fechaEgreso,
		terminal_produccion_etapa.estacion,
		terminal_tareas.nombre
	INTO
		iPatente, iFechaEntregado, iEstacion, iTarea
	FROM
		terminal_produccion
			INNER JOIN
		terminal_produccion_etapa ON terminal_produccion.patente = terminal_produccion_etapa.patente
			INNER JOIN
		terminal_estaciones ON terminal_produccion_etapa.estacion = terminal_estaciones.id
			INNER JOIN
		terminal_tareas ON terminal_tareas.id = terminal_estaciones.tareasId
	WHERE
		pedidoNro = iPedidoNro
	ORDER BY estacion DESC
	LIMIT 1;
    

    IF(IFNULL(iFechaEntregado, 1) = 1) THEN
		set iEntregado = "No";
	ELSE
		set iEntregado = "Si";
        set iEstacion = 0;
        set iTarea = "-";
	END IF;

	INSERT INTO tempReporteVehiculo VALUES (iPedidoNro, iPatente, iEntregado, iFechaEntregado, iEstacion, iTarea);
    SELECT * FROM tempReporteVehiculo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tareas_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tareas_alta`(
	in NombreTarea VARCHAR(45),
    out nResultado INT,
    out cMensaje VARCHAR(255)
)
BEGIN
	INSERT INTO terminal_tareas (nombre) VALUES (NombreTarea);
    set nResultado = 0;
    set cMensaje = "Tarea Agregada Correctamente";
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

-- Dump completed on 2019-10-31 12:08:00
