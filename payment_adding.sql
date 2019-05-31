use onlinekino;
DELIMITER $$
CREATE PROCEDURE `payment_adding` (IN license_level INT(11), IN total FLOAT, IN users_id INT(11), IN movie_full_id INT(11))
BEGIN
DECLARE cur_time FLOAT(20);
DECLARE lastid INT(11);
SET cur_time = curtime();
SELECT 
    MAX(id)
INTO lastid FROM
    onlinekino.payments;
SET lastid = lastid + 1;
INSERT INTO onlinekino.payments (`id`, `license_level`, `total`, `time`, `users_id`, `movie_full_id`) VALUES (lastid, license_level, total, users_id, movie_full_id);
END
