-- strings
/* 
CONCAT
LENGTH
UPPER
LOWER
TRIM
LEFT
RIGHT
*/

system clear;

SELECT CONCAT(name , ' ', last_name) AS full_name FROM authors;

SELECT * FROM authors WHERE LENGTH(name) > 7;

SELECT UPPER(name), LOWER(name) FROM authors;

SELECT TRIM('      hello    ') AS trim_;

SELECT LEFT('hello world', 5) AS substring_left,
	RIGHT('hello world', 5) AS substring_right;

-- numbers
/* 
ROUND
RAND
TRUNCATE
POWER
*/

SELECT ROUND(RAND()*10 + 5); -- 4 to 15

SELECT TRUNCATE(1.12345, 2); -- 1.12

SELECT POWER(2, 3); -- 8

-- date
/* 
NOW
*/

SET @now = NOW(); -- asi se crean variables
SELECT MINUTE(@now),
			 HOUR(@now),
			 MONTH(@now),
			 YEAR(@now);

SELECT DAYOFWEEK(@now),
			 DAYOFMONTH(@now),
			 DAYOFYEAR(@now);

SELECT @now, DATE(@now); -- para pasar de DATETIME a DATE

SELECT @now + INTERVAL 30 DAY; -- para sumar 30 dias a la fecha actual


-- condicionales
SELECT IF(-1 > 0, "es positivo", "es negativo"); 

SELECT IFNULL(pseudonym, "El autor no tiene sdeudonimo") FROM authors;


DELIMITER /

CREATE FUNCTION add_days(date_ DATE, days_ INT)
RETURNS DATE
BEGIN
	RETURN date_ + INTERVAL days_ DAY;
END/

DELIMITER ;

SELECT add_days(DATE(@now), 30);

-- Listar funciones

SELECT name FROM mysql.proc WHERE db = database() AND type = "FUNCTION";
DROP FUNCTION add_days;


