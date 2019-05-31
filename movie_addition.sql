use onlinekino;
DELIMITER $$
CREATE PROCEDURE `movie_addition` (IN mov_name VARCHAR(999), IN length INT(11), cost INT(11), providers_id INT(11))
BEGIN
DECLARE lastid INT(11);
DECLARE cur_time FLOAT(20);
SET cur_time = curtime();
SELECT 
    MAX(id)
INTO lastid FROM
    onlinekino.movie_full;
SET lastid = lastid + 1;
INSERT INTO onlinekino.movie_full (`id`, `name`, `date_added`, `date_released`, `length`, `cost`, `providers_id`) VALUES (lastid, mov_name, cur_time, date_released, length, cost, providers_id);
END
