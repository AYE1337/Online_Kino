use onlinekino;
DELIMITER $$
CREATE PROCEDURE `movie_removal` (IN user_id INT(11), mov_id INT(11), user_rank INT (11))
BEGIN
DECLARE lastid INT(11);
DECLARE cur_time FLOAT(20);
DECLARE action_stamp VARCHAR(50);
IF user_rank >= 128 
THEN
delete from onlinekino.movie_full where onlinekino.movie_full.id = mov_id;
SELECT 
    MAX(action_id)
INTO lastid FROM
    onlinekino.logging;
SET lastid = lastid + 1;
SET cur_time = curtime();
SET action_stamp = 'movie_removal';
INSERT INTO onlinekino.logging (`action_id`, `performer_id`, `time`, `action_stamp`) VALUES (lastid, user_id, cur_time, action_stamp);
end if;
END
DELIMITER ;