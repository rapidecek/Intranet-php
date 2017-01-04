-- MySQL Script generated by MySQL Workbench
-- 01/03/17 23:17:06
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema zkouska
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zkouska
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zkouska` DEFAULT CHARACTER SET utf8 ;
USE `zkouska` ;

-- -----------------------------------------------------
-- Table `zkouska`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zkouska`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `table1col1_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zkouska`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zkouska`.`post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content` MEDIUMTEXT NOT NULL,
  `date` DATE NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `zkouska`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zkouska`.`user_has_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zkouska`.`user_has_post` (
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `post_id`),
  INDEX `fk_user_has_post_post1_idx` (`post_id` ASC),
  INDEX `fk_user_has_post_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_post_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `zkouska`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_post_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `zkouska`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zkouska`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zkouska`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content` MEDIUMTEXT NOT NULL,
  `date` DATE NULL,
  `commentcol` VARCHAR(45) NULL,
  `post_id` INT NOT NULL,
  `post_user_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `post_id`, `post_user_id`, `user_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_comment_post1_idx` (`post_id` ASC, `post_user_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id` , `post_user_id`)
    REFERENCES `zkouska`.`post` (`id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `zkouska`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zkouska`.`user_has_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zkouska`.`user_has_comment` (
  `user_id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `comment_id`),
  INDEX `fk_user_has_comment_comment1_idx` (`comment_id` ASC),
  INDEX `fk_user_has_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `zkouska`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_comment_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `zkouska`.`comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;