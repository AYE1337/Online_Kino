use onlinekino;
DELIMITER $$
CREATE PROCEDURE `wishlist_addition` (IN movie_id INT(11), user_id INT(11))
BEGIN
DECLARE cur_time INT(11);
SET cur_time = curtime();
INSERT INTO onlinekino.wishlists (`movie_id`, `time_added`, `users_id`) VALUES (movie_id, cur_time, user_id);
END
