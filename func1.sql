use onlinekino;
DELIMITER //

CREATE FUNCTION `total_spent` (user_id INT(11))
RETURNS FLOAT
DETERMINISTIC
READS SQL DATA
BEGIN
DECLARE total_spent FLOAT;
SELECT SUM(total) INTO 'total_spent' FROM onlinekino.payments WHERE users_id = user_id;
RETURN total_spent;
END //
