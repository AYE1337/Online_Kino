use onlinekino;
DELIMITER $$
CREATE PROCEDURE `visit_log` (IN user_id INT(11), IN login_time BIGINT(20), IN ip INT(11))
BEGIN
DECLARE cur_time FLOAT(20);
DECLARE lastid INT(11);
SET cur_time = curtime();
SELECT 
    MAX(visit_id)
INTO lastid FROM
    onlinekino.visits;
SET lastid = lastid + 1;
INSERT INTO onlinekino.visits (`visit_id`, `ip`, `time`, `time_logout`, `users_id`) VALUES (lastid, ip, login_time, cur_time, user_id);
END
