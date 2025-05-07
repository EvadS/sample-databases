-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `movies` ;

-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movies` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;



SHOW WARNINGS;
USE `movies` ;

-- -----------------------------------------------------
-- Table `movies`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`country` ;


CREATE TABLE IF NOT EXISTS `movies`.`country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country_iso_code` VARCHAR(10) NULL DEFAULT NULL,
  `country_name` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `movies`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`department` ;


CREATE TABLE IF NOT EXISTS `movies`.`department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `movies`.`gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`gender` ;


CREATE TABLE IF NOT EXISTS `movies`.`gender` (
  `id` INT NOT NULL,
  `gender` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `movies`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`genre` ;


CREATE TABLE IF NOT EXISTS `movies`.`genre` (
  `id` INT NOT NULL,
  `genre_name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `movies`.`keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`keyword` ;


CREATE TABLE IF NOT EXISTS `movies`.`keyword` (
  `id` INT NOT NULL,
  `keyword_name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `movies`.`language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`language` ;


CREATE TABLE IF NOT EXISTS `movies`.`language` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `language_code` VARCHAR(10) NULL DEFAULT NULL,
  `language_name` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `movies`.`language_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`language_role` ;

CREATE TABLE IF NOT EXISTS `movies`.`language_role` (
  `id` INT NOT NULL,
  `language_role` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `movies`.`movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie` ;

CREATE TABLE IF NOT EXISTS `movies`.`movie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(1000) NULL DEFAULT NULL,
  `budget` INT NULL DEFAULT NULL,
  `homepage` VARCHAR(1000) NULL DEFAULT NULL,
  `overview` VARCHAR(1000) NULL DEFAULT NULL,
  `popularity` DECIMAL(12,6) NULL DEFAULT NULL,
  `release_date` DATE NULL DEFAULT NULL,
  `revenue` BIGINT NULL DEFAULT NULL,
  `runtime` INT NULL DEFAULT NULL,
  `movie_status` VARCHAR(50) NULL DEFAULT NULL,
  `tagline` VARCHAR(1000) NULL DEFAULT NULL,
  `vote_average` DECIMAL(4,2) NULL DEFAULT NULL,
  `vote_count` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `movies`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`person` ;

CREATE TABLE IF NOT EXISTS `movies`.`person` (
  `id` INT NOT NULL,
  `person_name` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `movies`.`movie_cast`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie_cast` ;

CREATE TABLE IF NOT EXISTS `movies`.`movie_cast` (
  `movie_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `character_name` VARCHAR(400) NULL DEFAULT NULL,
  `gender_id` INT NOT NULL,
  `cast_order` INT NULL DEFAULT NULL,
  PRIMARY KEY (`movie_id`, `person_id`, `gender_id`),
  INDEX `fk_mca_gender` (`gender_id` ASC) VISIBLE,
  INDEX `fk_mca_per` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_mca_gender`
    FOREIGN KEY (`gender_id`)
    REFERENCES `movies`.`gender` (`id`),
  CONSTRAINT `fk_mca_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies`.`movie` (`id`),
  CONSTRAINT `fk_mca_per`
    FOREIGN KEY (`person_id`)
    REFERENCES `movies`.`person` (`id`));

-- -----------------------------------------------------
-- Table `movies`.`production_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`production_company` ;

CREATE TABLE IF NOT EXISTS `movies`.`production_company` (
  `id` INT NOT NULL,
  `company_name` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `movies`.`movie_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie_company` ;

CREATE TABLE IF NOT EXISTS `movies`.`movie_company` (
  `movie_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `company_id`),
  INDEX `fk_mc_comp` (`company_id` ASC) VISIBLE,
  CONSTRAINT `fk_mc_comp`
    FOREIGN KEY (`company_id`)
    REFERENCES `movies`.`production_company` (`id`),
  CONSTRAINT `fk_mc_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies`.`movie` (`id`));


-- -----------------------------------------------------
-- Table `movies`.`movie_crew`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie_crew` ;


CREATE TABLE IF NOT EXISTS `movies`.`movie_crew` (
  `movie_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  `job` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`movie_id`, `person_id`, `department_id`),
  INDEX `fk_mcr_dept` (`department_id` ASC) VISIBLE,
  INDEX `fk_mcr_per` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_mcr_dept`
    FOREIGN KEY (`department_id`)
    REFERENCES `movies`.`department` (`id`),
  CONSTRAINT `fk_mcr_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies`.`movie` (`id`),
  CONSTRAINT `fk_mcr_per`
    FOREIGN KEY (`person_id`)
    REFERENCES `movies`.`person` (`id`));

-- -----------------------------------------------------
-- Table `movies`.`movie_genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie_genres` ;

CREATE TABLE IF NOT EXISTS `movies`.`movie_genres` (
  `movie_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `genre_id`),
  INDEX `fk_mg_genre` (`genre_id` ASC) VISIBLE,
  CONSTRAINT `fk_mg_genre`
    FOREIGN KEY (`genre_id`)
    REFERENCES `movies`.`genre` (`id`),
  CONSTRAINT `fk_mg_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies`.`movie` (`id`));

-- -----------------------------------------------------
-- Table `movies`.`movie_keywords`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie_keywords` ;


CREATE TABLE IF NOT EXISTS `movies`.`movie_keywords` (
  `movie_id` INT NOT NULL,
  `keyword_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `keyword_id`),
  INDEX `fk_mk_keyword` (`keyword_id` ASC) VISIBLE,
  CONSTRAINT `fk_mk_keyword`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `movies`.`keyword` (`id`),
  CONSTRAINT `fk_mk_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies`.`movie` (`id`));

-- -----------------------------------------------------
-- Table `movies`.`movie_languages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie_languages` ;

CREATE TABLE IF NOT EXISTS `movies`.`movie_languages` (
  `movie_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  `language_role_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `language_id`, `language_role_id`),
  INDEX `fk_ml_lang` (`language_id` ASC) VISIBLE,
  INDEX `fk_ml_role` (`language_role_id` ASC) VISIBLE,
  CONSTRAINT `fk_ml_lang`
    FOREIGN KEY (`language_id`)
    REFERENCES `movies`.`language` (`id`),
  CONSTRAINT `fk_ml_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies`.`movie` (`id`),
  CONSTRAINT `fk_ml_role`
    FOREIGN KEY (`language_role_id`)
    REFERENCES `movies`.`language_role` (`id`));

-- -----------------------------------------------------
-- Table `movies`.`production_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`production_country` ;


CREATE TABLE IF NOT EXISTS `movies`.`production_country` (
  `movie_id` INT NOT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `country_id`),
  INDEX `fk_pc_country` (`country_id` ASC) VISIBLE,
  CONSTRAINT `fk_pc_country`
    FOREIGN KEY (`country_id`)
    REFERENCES `movies`.`country` (`id`),
  CONSTRAINT `fk_pc_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies`.`movie` (`id`));
    
    