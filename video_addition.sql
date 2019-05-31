use onlinekino;
DELIMITER $$
CREATE PROCEDURE `add_content_to_channel` (IN id VARCHAR(255), IN title VARCHAR(255), IN seconds INT(11), IN meta TEXT, IN media_type VARCHAR(2), channels_channel_id INT(11), channels_users_id INT(11))
BEGIN
INSERT INTO onlinekino.channel_libraries (`id`, `title`, `seconds`, `type`, `meta`, `channels_channel_id`, `channels_users_id`) VALUES (id, title, seconds, meta, media_type, channels_channel_id, channels_users_id);
END
