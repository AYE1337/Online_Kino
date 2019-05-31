use onlinekino;
DELIMITER //

CREATE PROCEDURE `BAN` (IN ip VARCHAR(39), IN reason VARCHAR(255), IN users_id INT(11))
BEGIN
DECLARE lastid INT(11);
DECLARE ban_time FLOAT(20);
SELECT MAX(ban_id) INTO lastid FROM onlinekino.global_bans;
SET lastid = lastid + 1;
SET ban_time = NOW() + 0;
INSERT INTO onlinekino.global_bans (`ban_id`, `ip`, `reason`, `users_id`, `ban_time`) VALUES
(lastid, ip, reason, users_id, ban_time);
END //
