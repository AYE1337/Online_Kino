use onlinekino;
DELIMITER //

CREATE PROCEDURE `BAN` (IN ip VARCHAR(39), IN reason VARCHAR(255), IN users_id INT(11), IN perf_id INT(11))
BEGIN
DECLARE lastid INT(11);
DECLARE ban_time FLOAT(20);
DECLARE action_stamp VARCHAR(50);
DECLARE lastact_id INT(11);

SELECT 
    MAX(ban_id)
INTO lastid FROM
    onlinekino.global_bans;
SET lastid = lastid + 1;

SELECT 
    MAX(action_id)
INTO lastid FROM
    onlinekino.logging;
SET lastact_id = lastact_id + 1;

SET ban_time = curtime();
SET action_stamp = 'ban';

INSERT INTO onlinekino.global_bans (`ban_id`, `ip`, `reason`, `users_id`, `ban_time`) VALUES
(lastid, ip, reason, users_id, ban_time);

INSERT INTO onlinekino.logging (`action_id`, `performer_id`, `time`, `action_stamp`) VALUES (lastact_id, perf_id, ban_time, action_stamp);

END //
DELIMITER ;