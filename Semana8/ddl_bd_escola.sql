-- MySQL Script generated by MySQL Workbench
-- Mon Apr  3 23:39:01 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema escola
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema escola
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8 ;
USE `escola` ;

-- -----------------------------------------------------
-- Table `escola`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`turma` (
  `codigo` VARCHAR(10) NOT NULL,
  `professor` VARCHAR(60) NOT NULL,
  `ano` YEAR(4) NULL,
  `semestre` INT NULL,
  `numero_disciplina` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`aluno` (
  `prontuario` VARCHAR(10) NOT NULL,
  `nome` VARCHAR(150) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `genero` VARCHAR(2) NOT NULL,
  `altura` FLOAT NULL,
  `peso` FLOAT NULL,
  `etnia` VARCHAR(45) NULL,
  `turma_codigo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`prontuario`),

  CONSTRAINT `fk_aluno_turma1`
    FOREIGN KEY (`turma_codigo`)
    REFERENCES `escola`.`turma` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`disciplina` (
  `codigo` VARCHAR(10) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `area` VARCHAR(45) NULL,
  `aulas_semanais` TINYINT(2) NULL,
  `carga_horaria` INT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`pre_requisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`pre_requisito` (
  `numero_pre_requisito` VARCHAR(10) NOT NULL,
  `disciplina_codigo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`numero_pre_requisito`, `disciplina_codigo`),
 
  CONSTRAINT `fk_pre_requisito_disciplina1`
    FOREIGN KEY (`disciplina_codigo`)
    REFERENCES `escola`.`disciplina` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`aluno_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`aluno_disciplina` (
  `aluno_prontuario` VARCHAR(10) NOT NULL,
  `disciplina_codigo` VARCHAR(10) NOT NULL,
  `nota` FLOAT NULL,
  PRIMARY KEY (`aluno_prontuario`, `disciplina_codigo`),
 
  CONSTRAINT `fk_aluno_has_disciplina_aluno1`
    FOREIGN KEY (`aluno_prontuario`)
    REFERENCES `escola`.`aluno` (`prontuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_codigo`)
    REFERENCES `escola`.`disciplina` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`notas` (
  `id` INT NOT NULL,
  `nota` FLOAT NOT NULL DEFAULT 0,
  `aluno_prontuario` VARCHAR(10) NOT NULL,
  `disciplina_codigo` VARCHAR(10) NOT NULL,
  `turma_codigo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  
  CONSTRAINT `fk_notas_aluno1`
    FOREIGN KEY (`aluno_prontuario`)
    REFERENCES `escola`.`aluno` (`prontuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notas_disciplina1`
    FOREIGN KEY (`disciplina_codigo`)
    REFERENCES `escola`.`disciplina` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notas_turma1`
    FOREIGN KEY (`turma_codigo`)
    REFERENCES `escola`.`turma` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

