use onlinekino;
DELIMITER $$
CREATE FUNCTION `curtime` ()
RETURNS FLOAT(20)
deterministic
BEGIN
DECLARE ct FLOAT(20);
SET ct = NOW() + 0;
RETURN ct;
END
