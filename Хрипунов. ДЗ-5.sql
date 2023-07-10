DROP DATABASE IF EXISTS lesson5;
CREATE DATABASE IF NOT EXISTS lesson5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов;
CREATE OR REPLACE VIEW v1 AS
SELECT name, cost
FROM cars
WHERE cost < 25000;

SELECT * FROM v1;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW);
ALTER VIEW v1 AS
SELECT name, cost
FROM cars
WHERE cost < 30000;

SELECT * FROM v1;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично);
CREATE OR REPLACE VIEW v2 AS
SELECT name, cost
FROM cars
WHERE name = 'Skoda' OR name = 'Audi';

SELECT * FROM v2;

-- Получить ранжированный список автомобилей по цене в порядке возрастания;
SELECT 
DENSE_RANK() OVER(ORDER BY cost) AS `dense_rank`,
name,
cost
FROM cars;

-- Получить топ-3 самых дорогих автомобилей, а также их общую стоимость;
SELECT 
`dense_rank`, name, cost, sum
FROM
(SELECT
DENSE_RANK() OVER(ORDER BY cost DESC) AS `dense_rank`,
name,
cost,
SUM(cost) OVER (ORDER BY cost DESC) AS 'sum'
FROM cars) AS rank_list
WHERE `dense_rank` <= 3;

-- Получить список автомобилей, отсортированный по возрастанию цены, и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля;
SELECT 
`dense_rank`, name, cost, lead2, (cost - lead2) AS 'dif'
FROM
(SELECT
DENSE_RANK() OVER(ORDER BY cost) AS `dense_rank`,
name,
cost,
LEAD(cost) OVER (ORDER BY cost) AS 'lead2'
FROM cars) AS rank_list;

