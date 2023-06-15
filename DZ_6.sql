DROP DATABASE IF EXISTS dz6;
CREATE DATABASE IF NOT EXISTS dz6;
USE dz6;

# 1. Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP PROCEDURE IF EXISTS data;
DELIMITER //
CREATE PROCEDURE date(sec INT)
	BEGIN
		DECLARE min INT DEFAULT 0; 
		DECLARE hours INT DEFAULT 0;
		DECLARE days INT DEFAULT 0;
        set min = sec DIV 60;
        set hours = min DIV  60;
        set days = hours DIV 24;
        set sec = sec MOD 60;
        set min = min MOD 60;
        set hours = hours MOD 24;
        SELECT CONCAT(days,' дней ', hours, ' часов ', min, ' минут ', sec, ' секунд') as date;        
	END //
    DELIMITER ;
    CALL date(123456);
    
	# 2. Создайте функцию, которая выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10 
    DROP PROCEDURE IF EXISTS chet;    
    DELIMITER //
    CREATE FUNCTION chet(num INT)
    RETURNS VARCHAR(45)
    DETERMINISTIC
    BEGIN
    DECLARE result VARCHAR(45) DEFAULT '';
    IF (num MOD 2) != 0 THEN SET num = num - 1;
    END IF; 
    WHILE num >= 2
    DO
		SET result = CONCAT(result,' ', num);
		SET num = num - 2;
    END WHILE;
    RETURN result;     
    END //
    delimiter ;
     
     SELECT chet(11) AS 'Четные числа';
    