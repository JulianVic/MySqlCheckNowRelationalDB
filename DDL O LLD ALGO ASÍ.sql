-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema check-now
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema check-now
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `check-now` DEFAULT CHARACTER SET utf8 ;
USE `check-now` ;

-- -----------------------------------------------------
-- Table `check-now`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `check-now`.`Empresa` (
  `id_empresa` VARCHAR(45) NOT NULL,
  `id_creador` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `razon_social` VARCHAR(45) NULL,
  `identificacion_tributaria` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(10) NULL,
  `industria` VARCHAR(45) NULL,
  `id_plazas` VARCHAR(45) NULL,
  PRIMARY KEY (`id_empresa`),
  INDEX `empresa_id_creador_idx` (`id_creador` ASC) VISIBLE,
  CONSTRAINT `empresa_id_creador`
    FOREIGN KEY (`id_creador`)
    REFERENCES `check-now`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `check-now`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `check-now`.`Usuario` (
  `id_usuario` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido_paterno` VARCHAR(45) NULL,
  `apellido_materno` VARCHAR(45) NULL,
  `telefono` VARCHAR(10) NULL,
  `direccion` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `token` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  `verified` VARCHAR(45) NULL,
  `id_empresa` VARCHAR(45) NULL,
  `createdAt` VARCHAR(45) NULL,
  `updatedAt` VARCHAR(45) NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `usuario_id_empresa_idx` (`id_empresa` ASC) VISIBLE,
  CONSTRAINT `usuario_id_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `check-now`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `check-now`.`InfoPersonal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `check-now`.`InfoPersonal` (
  `id_info_personal` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NULL,
  `genero` VARCHAR(45) NULL,
  `estado_civil` VARCHAR(45) NULL,
  `numero_seguro_social` VARCHAR(45) NULL,
  `curp` VARCHAR(45) NULL,
  `rfc` VARCHAR(45) NULL,
  PRIMARY KEY (`id_info_personal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `check-now`.`Plaza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `check-now`.`Plaza` (
  `id_plaza` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `departamento` VARCHAR(45) NULL,
  `descrpcion` VARCHAR(45) NULL,
  `supervisor` VARCHAR(45) NULL,
  `salario` INT NULL,
  `habilidades` VARCHAR(45) NULL,
  `horario_entrada` DATE NULL,
  `horario_salida` DATE NULL,
  `estado` VARCHAR(45) NULL,
  `id_empleado` VARCHAR(45) NULL,
  `id_empresa` VARCHAR(45) NULL,
  `createdAt` DATE NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`id_plaza`),
  INDEX `plaza_id_empleado_idx` (`id_empleado` ASC) VISIBLE,
  INDEX `plaza_id_empresa_idx` (`id_empresa` ASC) VISIBLE,
  CONSTRAINT `plaza_id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `check-now`.`Empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `plaza_id_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `check-now`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `check-now`.`Entrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `check-now`.`Entrada` (
  `id_entrada` VARCHAR(45) NOT NULL,
  `id_empresa` VARCHAR(45) NULL,
  `id_empleado` VARCHAR(45) NULL,
  `fecha_entrada` DATE NULL,
  `comentarios` VARCHAR(45) NULL,
  PRIMARY KEY (`id_entrada`),
  INDEX `entrada_id_empleado_idx` (`id_empleado` ASC) VISIBLE,
  INDEX `entrada_id_empresa_idx` (`id_empresa` ASC) VISIBLE,
  CONSTRAINT `entrada_id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `check-now`.`Empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `entrada_id_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `check-now`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `check-now`.`Salida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `check-now`.`Salida` (
  `id_salida` VARCHAR(45) NOT NULL,
  `id_empresa` VARCHAR(45) NULL,
  `id_empleado` VARCHAR(45) NULL,
  `fecha_salida` DATE NULL,
  PRIMARY KEY (`id_salida`),
  INDEX `salida_id_empresa_idx` (`id_empresa` ASC) VISIBLE,
  INDEX `salida_id_empleado_idx` (`id_empleado` ASC) VISIBLE,
  CONSTRAINT `salida_id_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `check-now`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `salida_id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `check-now`.`Empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `check-now`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `check-now`.`Empleado` (
  `id_empleado` VARCHAR(45) NOT NULL,
  `id_usuario` VARCHAR(45) NULL,
  `informacion_personal_id` VARCHAR(45) NULL,
  `id_empresa` VARCHAR(45) NULL,
  `id_plazas` VARCHAR(45) NULL,
  `id_entradas` VARCHAR(45) NULL,
  `id_salidas` VARCHAR(45) NULL,
  `createdAt` DATE NULL,
  `updatedAt` DATE NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `empleado_id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `informacion_personal_idx` (`informacion_personal_id` ASC) VISIBLE,
  INDEX `empleado_id_empresa_idx` (`id_empresa` ASC) VISIBLE,
  INDEX `empleado_id_plaza_idx` (`id_plazas` ASC) VISIBLE,
  INDEX `entradas_idx` (`id_entradas` ASC) VISIBLE,
  INDEX `salidas_idx` (`id_salidas` ASC) VISIBLE,
  CONSTRAINT `empleado_id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `check-now`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `informacion_personal`
    FOREIGN KEY (`informacion_personal_id`)
    REFERENCES `check-now`.`InfoPersonal` (`id_info_personal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `empleado_id_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `check-now`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `empleado_id_plaza`
    FOREIGN KEY (`id_plazas`)
    REFERENCES `check-now`.`Plaza` (`id_plaza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `entradas`
    FOREIGN KEY (`id_entradas`)
    REFERENCES `check-now`.`Entrada` (`id_entrada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `salidas`
    FOREIGN KEY (`id_salidas`)
    REFERENCES `check-now`.`Salida` (`id_salida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `check-now`.`Nomina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `check-now`.`Nomina` (
  `id_nomina` VARCHAR(45) NOT NULL,
  `id_empleado` VARCHAR(45) NULL,
  `percepciones` VARCHAR(45) NULL,
  `descuentos` VARCHAR(45) NULL,
  `sueldo_neto` INT NULL,
  `extra` INT NULL,
  `id_empresa` VARCHAR(45) NULL,
  `fecha_emision` DATE NULL,
  `updatedAt` DATE NULL,
  `createdAt` DATE NULL,
  PRIMARY KEY (`id_nomina`),
  INDEX `nomina_id_empleado_idx` (`id_empleado` ASC) VISIBLE,
  INDEX `nomina_id_empresa_idx` (`id_empresa` ASC) VISIBLE,
  CONSTRAINT `nomina_id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `check-now`.`Empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nomina_id_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `check-now`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
