-- -----------------------------------------------------
-- Schema onlinekino
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `onlinekino` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `onlinekino` ;

-- -----------------------------------------------------
-- Table `onlinekino`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinekino`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `status` INT(11) NOT NULL,
  `global_rank` INT(11) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `ip` VARCHAR(39) NOT NULL,
  `time` FLOAT(20) NOT NULL,
  `name_dedupe` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `onlinekino`.`channels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinekino`.`channels` (
  `channel_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `time` BIGINT(20) NOT NULL,
  `ch_rank` INT(11) NOT NULL,
  `last_visited` TIMESTAMP NULL DEFAULT NULL,
  `owner_last_seen` TIMESTAMP NULL DEFAULT NULL,
  `private` TINYINT(1) NULL DEFAULT '0',
  `password` VARCHAR(99),
  `users_id` INT(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `users_id`),
  UNIQUE INDEX `name` (`name` ASC),
  INDEX `fk_channels_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_channels_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `onlinekino`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1433
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `onlinekino`.`channel_libraries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinekino`.`channel_libraries` (
  `id` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `seconds` INT(11) NOT NULL,
  `type` VARCHAR(2) NOT NULL,
  `meta` TEXT NOT NULL,
  `channels_channel_id` INT(11) NOT NULL,
  `channels_users_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_channel_libraries_channels`
    FOREIGN KEY (`channels_channel_id` , `channels_users_id`)
    REFERENCES `onlinekino`.`channels` (`channel_id` , `users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `onlinekino`.`global_bans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinekino`.`global_bans` (
  `ban_id` INT(11) NOT NULL,
  `ip` VARCHAR(39) NOT NULL,
  `reason` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `users_id` INT(11) NOT NULL,
  `ban_time` FLOAT(20) NOT NULL,
  PRIMARY KEY (`ban_id`),
  UNIQUE KEY (`users_id`),
  INDEX `fk_global_bans_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_global_bans_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `onlinekino`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `onlinekino`.`providers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinekino`.`providers` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(999) NOT NULL,
  `rank` INT(11) NOT NULL,
  `date_joined` TIMESTAMP NULL DEFAULT NULL,
  `total_movies` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `onlinekino`.`movie_full`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinekino`.`movie_full` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(999) CHARACTER SET 'ascii' COLLATE 'ascii_bin' NOT NULL,
  `date_added` FLOAT(20) DEFAULT NULL,
  `date_released` TIMESTAMP NULL DEFAULT NULL,
  `length` INT(11) NOT NULL,
  `cost` INT(11) NOT NULL,
  `providers_id` INT(11) NOT NULL,
  INDEX `name` (`name` ASC),
  INDEX `fk_movie_full_providers1_idx` (`providers_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_movie_full_providers1`
    FOREIGN KEY (`providers_id`)
    REFERENCES `onlinekino`.`providers` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `onlinekino`.`password_reset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinekino`.`password_reset` (
  `ip` VARCHAR(39) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `hash` VARCHAR(64) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `expire_time` TIMESTAMP NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `onlinekino`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinekino`.`payments` (
  `id` INT(11) NOT NULL,
  `license_level` INT(11) NOT NULL,
  `total` FLOAT NULL DEFAULT NULL,
  `time` FLOAT(20) DEFAULT NULL,
  `users_id` INT(11) NOT NULL,
  `movie_full_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_payments_users_idx` (`users_id` ASC),
  INDEX `fk_payments_movie_full1_idx` (`movie_full_id` ASC),
  CONSTRAINT `fk_payments_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `onlinekino`.`users` (`id`),
  CONSTRAINT `fk_payments_movie_full1`
    FOREIGN KEY (`movie_full_id`)
    REFERENCES `onlinekino`.`movie_full` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `onlinekino`.`user_playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinekino`.`user_playlists` (
  `playlist_name` INT(11) NOT NULL,
  `link` MEDIUMTEXT NOT NULL,
  `count` INT(11) NOT NULL,
  `duration` INT(11) NOT NULL,
  `users_id` INT(11) NOT NULL,
  PRIMARY KEY (`users_id`),
  INDEX `playlist_name` (`playlist_name` ASC),
  CONSTRAINT `fk_user_playlists_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `onlinekino`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `onlinekino`.`visits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinekino`.`visits` (
  `visit_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ip` VARCHAR(39) NOT NULL,
  `time` BIGINT(20) NOT NULL,
  `users_id` INT(11) NOT NULL,
  PRIMARY KEY (`visit_id`),
  INDEX `ip` (`ip` ASC),
  INDEX `fk_visits_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_visits_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `onlinekino`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2054
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `onlinekino`.`wishlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinekino`.`wishlists` (
  `movie_id` INT(11) NOT NULL,
  `date_added` TIMESTAMP NULL DEFAULT NULL,
  `users_id` INT(11) NOT NULL,
  PRIMARY KEY (`users_id`),
  INDEX `movie_id` (`movie_id` ASC),
  UNIQUE INDEX `movie_id_UNIQUE` (`movie_id` ASC),
  CONSTRAINT `fk_wishlists_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `onlinekino`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



CREATE TABLE IF NOT EXISTS `onlinekino`.`logging` (
`action_id` INT(11) NOT NULL,
`performer_id` INT(11) NOT NULL,
`time` FLOAT(20) NOT NULL,
`action_stamp` VARCHAR(50) NOT NULL,
PRIMARY KEY (`action_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;