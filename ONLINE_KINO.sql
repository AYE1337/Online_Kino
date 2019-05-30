CREATE SCHEMA `onlinekino`;
use onlinekino;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sanch`
--

-- --------------------------------------------------------
--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS onlinekino.users (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `global_rank` INT(11) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `profile` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `ip` VARCHAR(39) NOT NULL,
  `time` BIGINT(20) NOT NULL,
  `name_dedupe` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC),
  UNIQUE INDEX `name_dedupe` (`name_dedupe` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;

--
-- Дамп данных таблицы `users`
--
INSERT INTO onlinekino.users (`id`, `name`, `password`, `global_rank`, `email`, `profile`, `ip`, `time`, `name_dedupe`) VALUES
(1, 'farlake', '$2b$10$GD7dLvd9R.cjwS4qECSjEO3holJrvxvqu0z30UqepA7l5KG5W1KV6', 255, 'anklimov@gmail.com', '', '192.168.88.1', 1535657485746, 'far1ake'),
(2, 'Sanch-KK', '$2b$10$EbmV9Wesk0tNNJ80CZGlyemNbndShbivpzZKgPJiCEfpc9mAhW332', 64, '', '', '192.168.88.1', 1535658206460, 'Sanch_KK'),
(3, 'Alexoid', '$2b$10$HZ28CAKrwFaBSk1pqaJinufespLegMGkHfuio0th61pMfF.BBcHha', 1, '', '', '217.118.86.100', 1536068750125, 'A1ex01d'),
(4, 'Alexoid2', '$2b$10$eB/s5fEQVVtKSpPNWfbIcuOduH/g/0oMuI6VdKZpwwsxy/c/7J7R.', 1, '', '', '217.118.86.100', 1536068801123, 'A1ex01d2'),
(5, 'irina', '$2b$10$kfzLSaKCJAGnopWcGz6gBezeEz9fQumFqoYn7MghKZr9cqqmT9l1C', 1, 'ia-donna@yandex.ru', '', '93.159.238.133', 1538203777177, '1r1na'),
(6, 'Sklerozz', '$2b$10$6YL2t5HBXCiGh2iKdhycAOE0dKgv3Y1Q2mPEAs./vhc3u4ieqE3QS', 1, 'x13@mail.ru', '', '217.118.85.87', 1539114658487, 'Sk1er0zz'),
(7, 'Remofag', '$2b$10$Z6KCFe7w7O8w/PQuHigaU.BnTuKsCLWgy5k4cxrxmE0if.GC/DyEC', 1, 'olegnatenko80@gmail.com', '', '37.78.206.169', 1542457734410, 'Rem0fag'),
(8, 'LasqaCat', '$2b$10$meHx6LGachmXcbdRpeRnNOKeqEHjleoqsiutExdjJF4hh1B6TWIGu', 1, 'antonkotebot@gmail.com', '', '94.28.241.94', 1542483488209, '1asqaCat'),
(9, 'Daan', '$2b$10$A67nbe.wQsXLPAhHDARu8OHaB9Xxdxo/Z8.TdO0Ax0yKzPzTL0d5S', 1, 'asyagutierrez@gmail.com', '', '5.105.60.163', 1543752812568, 'Daan'),
(10, 'shorkhh', '$2b$10$vuasfZi4pqQ559uuJQ6t4OM.m3EbmsklSwsGD0UuO4pOYHafMMEYW', 1, 'aisharahm2101@gmail.com', '', '31.13.144.102', 1544101332526, 'sh0rkhh'),
(11, 'test789', '$2b$10$HAbd9KXL1ROAxcQpFCpGW.00JKnvz0XfwrdJi6fBd4aac8eNWnzpS', 1, '', '', '185.216.192.251', 1544401354449, 'test789');

-- --------------------------------------------------------
--
-- Структура таблицы `channels`
--

CREATE TABLE IF NOT EXISTS onlinekino.channels (
  `channel_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `time` BIGINT(20) NOT NULL,
  `rank` INT(11) NOT NULL,
  `last_visited` TIMESTAMP NULL DEFAULT NULL,
  `owner_last_seen` TIMESTAMP NULL DEFAULT NULL,
  `private` TINYINT(1) NULL DEFAULT '0',
  `password` VARCHAR(99) NOT NULL,
  `users_id` INT(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `users_id`),
  UNIQUE INDEX `name` (`name` ASC),
  INDEX `fk_channels_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_channels_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `onlinekino`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1433
DEFAULT CHARACTER SET = utf8;

--
-- Дамп данных таблицы `channels`
--
INSERT INTO `channels` (`channel_id`, `name`, `time`, `rank`, `last_visited`, `owner_last_seen`, `private`, `password`, `users_id`) VALUES
(1, 'music',  1535657729491, 0, '2009-12-31 21:00:00', '2009-12-31 21:00:00', 0, '', 7),
(2, 'sanch',  1535658628501, 0, '2009-12-31 21:00:00', '2009-12-31 21:00:00', 0, '', 8),
(3, 'movie', 1535665039199, 0, '2009-12-31 21:00:00', '2009-12-31 21:00:00', 0, '', 9),
(4, 'REEEEEE', 1536075020185, 0, '2009-12-31 21:00:00', '2009-12-31 21:00:00', 0, '', 10),
(6, 'othermusic', 1536956041195, 0, '2009-12-31 21:00:00', '2009-12-31 21:00:00', 0, '', 11);


-- --------------------------------------------------------

--
-- Структура таблицы `channel_libraries`
--

CREATE TABLE IF NOT EXISTS onlinekino.channel_libraries (
  `id` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `seconds` INT(11) NOT NULL,
  `type` VARCHAR(2) NOT NULL,
  `meta` TEXT NOT NULL,
  `channels_channel_id` INT(11) NOT NULL,
  `channels_users_id` INT(11) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

--
-- Дамп данных таблицы `channel_libraries`
--

INSERT INTO onlinekino.channel_libraries (`id`, `title`, `seconds`, `type`, `meta`, `channels_channel_id`) VALUES
('-kmcRWhE0Rw', 'That\'s some good bird seed right there', 10, 'yt', '{}', 1),
('-m2fVWj99x4', 'Stepping on the M83', 23, 'yt', '{}', 1),
('07DBz9ZUGcA', 'Madonna - Like A Virgin [Confessions Tour DVD]', 249, 'yt', '{}', 1),
('0bHffWdKOz8', 'Лучшие новые трейлеры фильмов 2018 (21-я неделя) | В Рейтинге', 1368, 'yt', '{}', 1),
('0H-jLOoz-YY', 'Whitney Houston - I\'m Your Baby Tonight (European Version)', 254, 'yt', '{}', 1),
('0I647GU3Jsc', 'Imagine Dragons - Natural', 190, 'yt', '{}', 1),
('0t0uCWjQ6Og', 'Heavy Rain Glitch', 338, 'yt', '{}', 1),
('1f4Dxr-zvmQ', 'DOWNSUKI', 23, 'yt', '{}', 1),
('1Kz_CxOhWxE', 'Snoop Dog', 10, 'yt', '{}', 1),
('1lkkG7_B4nE', 'Brett', 56, 'yt', '{}', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `global_bans`
--

CREATE TABLE IF NOT EXISTS onlinekino.global_bans (
  `ban_id` INT(11) NOT NULL,
  `ip` VARCHAR(39) NOT NULL,
  `reason` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `users_id` INT(11) NOT NULL,
  INDEX `fk_global_bans_users1_idx` (`users_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO onlinekino.global_bans (`ban_id`, `ip`, `reason`, `users_id`) VALUES
(1, '192.168.23.2', 'shitposting', 13),
(2, '192.168.23.3', 'multiaccounting', 14);

--
-- Структура таблицы `providers`
--

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

INSERT INTO `providers` (`id`, `name`, `rank`, `date_joined`, `total_movies`) VALUES
(1, 'mediagroup', 1, '', 3),
(2, 'REEEEEfilms', 255, '', 2),
(3, 'Bad_provider', 1, '', 0);
-- --------------------------------------------------------
--
-- Структура таблицы `movie_full`
--

CREATE TABLE IF NOT EXISTS `onlinekino`.`movie_full` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(999) CHARACTER SET 'ascii' COLLATE 'ascii_bin' NOT NULL,
  `date_added` TIMESTAMP NULL DEFAULT NULL,
  `date_released` TIMESTAMP NULL DEFAULT NULL,
  `length` INT NOT NULL,
  `cost` INT(11) NOT NULL,
  `providers_id` INT(11) NOT NULL,
  INDEX `name` (`name` ASC),
  INDEX `fk_movie_full_providers1_idx` (`providers_id` ASC),
  CONSTRAINT `fk_movie_full_providers1`
    FOREIGN KEY (`providers_id`)
    REFERENCES `onlinekino`.`providers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

INSERT INTO `movie_full` (`id`, `name`, `date_added`, `date_released`, `length`, `cost`, `providers_id`) VALUES
(1, 'Italian Pizza', '', '', 234252, 1337, 2),
(2, 'Hateful Eight', '', '', 187342, 999, 2),
(3, 'First Film Ever', '', '', 123456, 1, 1),
(4, 'VACCINATION IS BAD', '', '', 87363, 666, 1),
(5, 'Lego Star Wars', '', '', 478953, 299, 1);
-- --------------------------------------------------------

--
-- Структура таблицы `password_reset`
--

CREATE TABLE `password_reset` (
  `ip` varchar(39) NOT NULL,
  `name` varchar(20) NOT NULL,
  `hash` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `expire_time` timestamp NULL DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE IF NOT EXISTS `onlinekino`.`payments` (
  `id` INT(11) NOT NULL,
  `license_level` INT(11) NOT NULL,
  `total` FLOAT NULL DEFAULT NULL,
  `time` TIMESTAMP NULL DEFAULT NULL,
  `users_id` INT(11) NOT NULL,
  `movie_full_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `users_id`, `movie_full_id`),
  INDEX `fk_payments_users_idx` (`users_id` ASC) ,
  INDEX `fk_payments_movie_full1_idx` (`movie_full_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

INSERT INTO `payments` (`id`, `license_level`, `total`, `time`, `users_id`, `movie_full_id`) VALUES
(1, 255, 299, '', 1, 5),
(2, 255, 1337, '', 1, 1),
(3, 255, 299, '', 2, 5),
(4, 255, 1, '', 1, 3),
(5, 255, 666, '', 1, 4),
(6, 255, 299, '', 2, 4),
(7, 64, 299, '', 3, 5),
(8, 255, 299, '', 4, 5),
(9, 255, 299, '', 5, 5),
(10, 255, 1, '', 6, 5),
(11, 255, 299, '', 2, 1),
(12, 1, 299, '', 10, 5),
(13, 255, 299, '', 9, 1),
(14, 255, 299, '', 11, 5),
(15, 255, 299, '', 12, 2),
(16, 255, 666, '', 1, 2);
-- --------------------------------------------------------

--
-- Структура таблицы `user_playlists`
--

CREATE TABLE IF NOT EXISTS `onlinekino`.`user_playlists` (
  `playlist_name` INT(11) NOT NULL,
  `link` MEDIUMTEXT NOT NULL,
  `count` INT(11) NOT NULL,
  `duration` INT(11) NOT NULL,
  `users_id` INT(11) NOT NULL,
  INDEX `playlist_name` (`playlist_name` ASC),
  PRIMARY KEY (`users_id`),
  CONSTRAINT `fk_user_playlists_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `onlinekino`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `visits`
--

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
    REFERENCES `onlinekino`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2054
DEFAULT CHARACTER SET = latin1;

--
-- Дамп данных таблицы `visits`
--

INSERT INTO `visits` (`visit_id`, `ip`, `time`, `users_id`) VALUES
(2035, '37.78.206.169', 1542457806141, 7),
(2037, '94.28.241.94', 1542483588776, 8),
(2044, '94.198.131.165', 1542538488761, 1),
(2045, '62.183.125.104', 1542558450012, 7),
(2046, '192.168.88.1', 1543163234186, 1),
(2047, '94.28.238.115', 1543522200720, 8),
(2052, '31.13.144.102', 1544184101727, 10),
(2053, '185.216.192.251', 1544401401970, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `wishlists`
--

CREATE TABLE IF NOT EXISTS `onlinekino`.`wishlists` (
  `movie_id` INT(11) NOT NULL,
  `date_added` TIMESTAMP NULL DEFAULT NULL,
  `users_id` INT(11) NOT NULL,
  INDEX `movie_id` (`movie_id` ASC),
  PRIMARY KEY (`users_id`),
  CONSTRAINT `fk_wishlists_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `onlinekino`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

--
-- AUTO_INCREMENT для таблицы `channels`
--
ALTER TABLE `channels`
  MODIFY `channel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1433;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `visits`
--
ALTER TABLE `visits`
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2054;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
