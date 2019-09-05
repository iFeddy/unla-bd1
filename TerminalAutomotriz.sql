-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TerminalAutomotriz
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TerminalAutomotriz
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TerminalAutomotriz` DEFAULT CHARACTER SET utf8 ;
USE `TerminalAutomotriz` ;

-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`Concesionaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`Concesionaria` (
  `idConcesionaria` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Direccion` TEXT(45) NOT NULL,
  PRIMARY KEY (`idConcesionaria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`Pedidos` (
  `idPedidos` INT NOT NULL AUTO_INCREMENT,
  `TipoPedido` VARCHAR(45) NOT NULL,
  `Cantidad` INT NOT NULL,
  `Concesionaria_idConcesionaria` INT NOT NULL,
  PRIMARY KEY (`idPedidos`),
  INDEX `fk_Pedidos_Concesionaria1_idx` (`Concesionaria_idConcesionaria` ASC) VISIBLE,
  CONSTRAINT `fk_Pedidos_Concesionaria1`
    FOREIGN KEY (`Concesionaria_idConcesionaria`)
    REFERENCES `TerminalAutomotriz`.`Concesionaria` (`idConcesionaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`LineaMontaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`LineaMontaje` (
  `idLineaMontaje` INT NOT NULL AUTO_INCREMENT,
  `PromedioAutos` FLOAT NOT NULL,
  PRIMARY KEY (`idLineaMontaje`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`Modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`Modelo` (
  `idModelo` INT NOT NULL AUTO_INCREMENT,
  `NombreModelo` VARCHAR(45) NOT NULL,
  `NroChasis` INT NOT NULL,
  `LineaMontaje_idLineaMontaje` INT NOT NULL,
  PRIMARY KEY (`idModelo`),
  INDEX `fk_Modelo_LineaMontaje1_idx` (`LineaMontaje_idLineaMontaje` ASC) VISIBLE,
  CONSTRAINT `fk_Modelo_LineaMontaje1`
    FOREIGN KEY (`LineaMontaje_idLineaMontaje`)
    REFERENCES `TerminalAutomotriz`.`LineaMontaje` (`idLineaMontaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`DetallePedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`DetallePedido` (
  `Pedidos_idPedidos` INT NOT NULL,
  `Modelo_idModelo` INT NOT NULL,
  PRIMARY KEY (`Pedidos_idPedidos`, `Modelo_idModelo`),
  INDEX `fk_Pedidos_has_Modelo_Modelo1_idx` (`Modelo_idModelo` ASC) VISIBLE,
  INDEX `fk_Pedidos_has_Modelo_Pedidos1_idx` (`Pedidos_idPedidos` ASC) VISIBLE,
  CONSTRAINT `fk_Pedidos_has_Modelo_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos`)
    REFERENCES `TerminalAutomotriz`.`Pedidos` (`idPedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_has_Modelo_Modelo1`
    FOREIGN KEY (`Modelo_idModelo`)
    REFERENCES `TerminalAutomotriz`.`Modelo` (`idModelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`Tarea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`Tarea` (
  `idTarea` INT NOT NULL AUTO_INCREMENT,
  `Detalle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTarea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`EstacionesTrabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`EstacionesTrabajo` (
  `idEstacionesTrabajo` INT NOT NULL AUTO_INCREMENT,
  `NroOrden` INT NOT NULL,
  `LineaMontaje_idLineaMontaje` INT NOT NULL,
  `Tarea_idTarea` INT NOT NULL,
  PRIMARY KEY (`idEstacionesTrabajo`),
  INDEX `fk_EstacionesTrabajo_LineaMontaje1_idx` (`LineaMontaje_idLineaMontaje` ASC) VISIBLE,
  INDEX `fk_EstacionesTrabajo_Tarea1_idx` (`Tarea_idTarea` ASC) VISIBLE,
  CONSTRAINT `fk_EstacionesTrabajo_LineaMontaje1`
    FOREIGN KEY (`LineaMontaje_idLineaMontaje`)
    REFERENCES `TerminalAutomotriz`.`LineaMontaje` (`idLineaMontaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EstacionesTrabajo_Tarea1`
    FOREIGN KEY (`Tarea_idTarea`)
    REFERENCES `TerminalAutomotriz`.`Tarea` (`idTarea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`Automovil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`Automovil` (
  `idAutomovil` INT NOT NULL AUTO_INCREMENT,
  `FechaInicio` DATE NOT NULL,
  `FechaFin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAutomovil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`EstacionAuto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`EstacionAuto` (
  `idEstacionAuto` INT NOT NULL AUTO_INCREMENT,
  `FechaIngreso` DATE NOT NULL,
  `FechaEgreso` DATE NOT NULL,
  `EstacionesTrabajo_idEstacionesTrabajo` INT NOT NULL,
  `Automovil_idAutomovil` INT NOT NULL,
  PRIMARY KEY (`idEstacionAuto`),
  INDEX `fk_EstacionAuto_EstacionesTrabajo1_idx` (`EstacionesTrabajo_idEstacionesTrabajo` ASC) VISIBLE,
  INDEX `fk_EstacionAuto_Automovil1_idx` (`Automovil_idAutomovil` ASC) VISIBLE,
  CONSTRAINT `fk_EstacionAuto_EstacionesTrabajo1`
    FOREIGN KEY (`EstacionesTrabajo_idEstacionesTrabajo`)
    REFERENCES `TerminalAutomotriz`.`EstacionesTrabajo` (`idEstacionesTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EstacionAuto_Automovil1`
    FOREIGN KEY (`Automovil_idAutomovil`)
    REFERENCES `TerminalAutomotriz`.`Automovil` (`idAutomovil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`Insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`Insumo` (
  `idInsumo` INT NOT NULL AUTO_INCREMENT,
  `NombreInsumo` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idInsumo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`InsumoEstacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`InsumoEstacion` (
  `idInsumoEstacion` INT NOT NULL AUTO_INCREMENT,
  `Cantidad` INT NOT NULL,
  `EstacionesTrabajo_idEstacionesTrabajo` INT NOT NULL,
  `Insumo_idInsumo` INT NOT NULL,
  PRIMARY KEY (`idInsumoEstacion`),
  INDEX `fk_InsumoEstacion_EstacionesTrabajo1_idx` (`EstacionesTrabajo_idEstacionesTrabajo` ASC) VISIBLE,
  INDEX `fk_InsumoEstacion_Insumo1_idx` (`Insumo_idInsumo` ASC) VISIBLE,
  CONSTRAINT `fk_InsumoEstacion_EstacionesTrabajo1`
    FOREIGN KEY (`EstacionesTrabajo_idEstacionesTrabajo`)
    REFERENCES `TerminalAutomotriz`.`EstacionesTrabajo` (`idEstacionesTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InsumoEstacion_Insumo1`
    FOREIGN KEY (`Insumo_idInsumo`)
    REFERENCES `TerminalAutomotriz`.`Insumo` (`idInsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `RazonSocial` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TerminalAutomotriz`.`Insumo_has_Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TerminalAutomotriz`.`Insumo_has_Proveedor` (
  `Insumo_idInsumo` INT NOT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  `PrecioInsumo` FLOAT NOT NULL,
  PRIMARY KEY (`Insumo_idInsumo`, `Proveedor_idProveedor`),
  INDEX `fk_Insumo_has_Proveedor_Proveedor1_idx` (`Proveedor_idProveedor` ASC) VISIBLE,
  INDEX `fk_Insumo_has_Proveedor_Insumo1_idx` (`Insumo_idInsumo` ASC) VISIBLE,
  CONSTRAINT `fk_Insumo_has_Proveedor_Insumo1`
    FOREIGN KEY (`Insumo_idInsumo`)
    REFERENCES `TerminalAutomotriz`.`Insumo` (`idInsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Insumo_has_Proveedor_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `TerminalAutomotriz`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
