use onlinekino;
DELIMITER $$
CREATE PROCEDURE `movie_cost_change` (IN mov_id INT(11), IN new_cost INT(11))
BEGIN
UPDATE onlinekino.movie_full SET cost = new_cost WHERE id = mov_id;
END
