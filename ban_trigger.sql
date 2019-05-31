DELIMITER $$
CREATE TRIGGER `banned_profile_status_update`
BEFORE UPDATE ON onlinekino.global_bans 
FOR EACH ROW 
BEGIN
DECLARE last_ban_id INT;
SET last_ban_id = (SELECT onlinekino.global_bans.users_id FROM onlinekino.global_bans WHERE ban_id = MAX(ban_id));
END$$