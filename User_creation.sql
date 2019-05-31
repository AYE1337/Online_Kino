CREATE PROCEDURE `user_creation` (IN us_name VARCHAR(20), IN passwd VARCHAR(64), IN email VARCHAR(255), ip VARCHAR(39), cur_time BIGINT(20))
BEGIN
DECLARE lastid, defstat, GR INT(11);
SELECT 
    MAX(id)
INTO lastid FROM
    onlinekino.users;
SET lastid = lastid + 1;
SET defstat = 0;
SET GR = 0;
INSERT INTO onlinekino.users (`id`, `name`, `password`, `status`, `global_rank`, `email`, `ip`, `time`) VALUES (lastid, us_name, passwd, defstat, GR, email, ip, cur_time);
END
