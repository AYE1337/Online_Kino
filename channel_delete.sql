use onlinekino;
DELIMITER $$
CREATE PROCEDURE `channel_delete` (IN user_id INT(11), creator_id INT(11), user_rank INT(11), channels_id INT(11))
BEGIN
IF user_id = creator_id OR user_rank >= 128 
THEN
delete from onlinekino.channels where onlinekino.channels.channel_id = channels_id;
END IF;
END