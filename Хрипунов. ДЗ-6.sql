-- Создайте процедуру, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds ';

DROP DATABASE IF EXISTS lesson6;
CREATE DATABASE IF NOT EXISTS lesson6;

USE lesson6;

delimiter &&
CREATE PROCEDURE proc1(num INT)
BEGIN
	DECLARE days INT ;
	DECLARE hours INT;
	DECLARE minutes INT;
	DECLARE seconds INT;
	SET days = num / 86400;
	SET hours = num % 86400 / 3600;
	SET minutes = num % 86400 % 3600 / 60;
	SET seconds = num % 60;
	SELECT CONCAT(days, " days ", hours, " hours ", minutes, " minutes ", seconds, " seconds!!") AS `time`;
END &&
delimiter ;

CALL proc1(123456);

-- Создайте функцию, которая  выводит только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)

delimiter $$a
CREATE FUNCTION fun1(num INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
DECLARE result VARCHAR(50) DEFAULT 0;
	WHILE num <= 10 DO
		IF num % 2 = 0 THEN
		SET result = CONCAT(result, ' ', num);
		END IF;
	SET num = num + 1;
    END WHILE;
RETURN result;
END $$a

delimiter ;

SELECT fun1(1);

