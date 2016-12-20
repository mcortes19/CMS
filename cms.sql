-- MySQL Script generated by MySQL Workbench
-- 12/20/16 10:03:19
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cms
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cms
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cms` DEFAULT CHARACTER SET utf8 ;
USE `cms` ;

-- -----------------------------------------------------
-- Table `cms`.`semester`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`semester` (
  `semesterId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NOT NULL,
  `description` MEDIUMTEXT NULL,
  PRIMARY KEY (`semesterId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`course` (
  `courseId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NOT NULL,
  `teacher` VARCHAR(50) NULL,
  `code` VARCHAR(45) NULL,
  `schedule` TIMESTAMP NULL,
  `semesterId` INT NOT NULL,
  PRIMARY KEY (`courseId`),
  INDEX `fk_course_semester_idx` (`semesterId` ASC),
  CONSTRAINT `fk_course_semester`
    FOREIGN KEY (`semesterId`)
    REFERENCES `cms`.`semester` (`semesterId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`project` (
  `projectId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NOT NULL,
  `summary` TEXT NULL,
  `description` MEDIUMTEXT NULL,
  `projectType` VARCHAR(50) NULL,
  `metodology` VARCHAR(50) NULL,
  `usedTech` TEXT NULL,
  `courseId` INT NOT NULL,
  PRIMARY KEY (`projectId`),
  INDEX `fk_project_course1_idx` (`courseId` ASC),
  CONSTRAINT `fk_project_course1`
    FOREIGN KEY (`courseId`)
    REFERENCES `cms`.`course` (`courseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`interests` (
  `interestId` INT NOT NULL AUTO_INCREMENT,
  `description` MEDIUMTEXT NULL,
  PRIMARY KEY (`interestId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`training`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`training` (
  `trainingId` INT NOT NULL AUTO_INCREMENT,
  `description` MEDIUMTEXT NULL,
  PRIMARY KEY (`trainingId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms`.`contactMe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`contactMe` (
  `contactMeId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `email` VARCHAR(100) NULL,
  `message` TEXT NULL,
  `telephone` VARCHAR(20) NULL,
  `date` TIMESTAMP NULL,
  PRIMARY KEY (`contactMeId`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
