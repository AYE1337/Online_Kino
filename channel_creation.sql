CREATE PROCEDURE `add_channel` (IN ch_name VARCHAR(30), IN ch_rank INT(11), IN users_id INT(11), private TINYINT(1), passwd VARCHAR(99), cur_time BIGINT(20))
BEGIN
DECLARE lastid INT(11);
SELECT 
    MAX(channel_id)
INTO lastid FROM
    onlinekino.channels;
SET lastid = lastid + 1;
INSERT INTO onlinekino.channels(`channel_id`, `name`, `time`, `ch_rank`, `private`, `password`, `users_id`) VALUES (lastid, ch_name, cur_time, ch_rank, private, passwd, users_id);
END
