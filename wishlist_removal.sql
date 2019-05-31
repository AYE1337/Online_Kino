CREATE DEFINER=`root`@`localhost` PROCEDURE `wishlist_removal`(IN user_id INT(11), perf_id INT(11), perf_rank INT (11), movie_id INT(11))
BEGIN
IF user_id = perf_id OR perf_rank >= 128
THEN
delete FROM onlinekino.wishlists WHERE onlinekino.wishlists.movie_id = movie_id AND onlinekino.wishlists.users_id = user_id;
end if;
END