-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`dados_pessoais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dados_pessoais` (
  `id` INT NOT NULL,
  `cpf` VARCHAR(255) NOT NULL,
  `rg` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`departamento` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `media_salarial` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paises` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionarios` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `posicao` VARCHAR(255) NOT NULL,
  `salario` INT NOT NULL,
  `dados_pessoais_id` INT NOT NULL,
  `departamento_id` INT NOT NULL,
  `paises_id` INT NOT NULL,
  PRIMARY KEY (`id`, `dados_pessoais_id`, `departamento_id`),
  INDEX `fk_funcionarios_dados_pessoais_idx` (`dados_pessoais_id` ASC) ,
  INDEX `fk_funcionarios_departamento1_idx` (`departamento_id` ASC) ,
  INDEX `fk_funcionarios_paises1_idx` (`paises_id` ASC) ,
  CONSTRAINT `fk_funcionarios_dados_pessoais`
    FOREIGN KEY (`dados_pessoais_id`)
    REFERENCES `mydb`.`dados_pessoais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionarios_departamento1`
    FOREIGN KEY (`departamento_id`)
    REFERENCES `mydb`.`departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionarios_paises1`
    FOREIGN KEY (`paises_id`)
    REFERENCES `mydb`.`paises` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`filhos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`filhos` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`funcionarios_filhos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionarios_filhos` (
  `funcionarios_id` INT NOT NULL,
  `filhos_id` INT NOT NULL,
  PRIMARY KEY (`funcionarios_id`, `filhos_id`),
  INDEX `fk_funcionarios_has_filhos_filhos1_idx` (`filhos_id` ASC) ,
  INDEX `fk_funcionarios_has_filhos_funcionarios1_idx` (`funcionarios_id` ASC) ,
  CONSTRAINT `fk_funcionarios_has_filhos_funcionarios1`
    FOREIGN KEY (`funcionarios_id`)
    REFERENCES `mydb`.`funcionarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionarios_has_filhos_filhos1`
    FOREIGN KEY (`filhos_id`)
    REFERENCES `mydb`.`filhos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`conjuge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`conjuge` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`funcionarios_conjuge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionarios_conjuge` (
  `funcionarios_id` INT NOT NULL,
  `conjuge_id` INT NOT NULL,
  PRIMARY KEY (`funcionarios_id`, `conjuge_id`),
  INDEX `fk_funcionarios_has_conjuge_conjuge1_idx` (`conjuge_id` ASC) ,
  INDEX `fk_funcionarios_has_conjuge_funcionarios1_idx` (`funcionarios_id` ASC) ,
  CONSTRAINT `fk_funcionarios_has_conjuge_funcionarios1`
    FOREIGN KEY (`funcionarios_id`)
    REFERENCES `mydb`.`funcionarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionarios_has_conjuge_conjuge1`
    FOREIGN KEY (`conjuge_id`)
    REFERENCES `mydb`.`conjuge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
