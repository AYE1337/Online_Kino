use onlinekino;
DELIMITER //
CREATE FUNCTION `provider_revenue` (id INT)
RETURNS INTEGER
deterministic
BEGIN
DECLARE raw_revenue FLOAT;
CREATE TABLE movies_provided;
CREATE TABLE needed_payments;
INSERT INTO movies_provided SELECT * FROM movie_full WHERE providers_id = id;
INSERT INTO needed_payments SELECT * FROM movies_provided INNER JOIN onlinekino.payments WHERE movie_full_id = movies_provided.id;
SELECT SUM(total) INTO raw_revenue FROM needed_payments;
DROP TABLE movies_provided;
DROP TABLE needed_payments;
RETURN raw_revenue*0.5;
END //
