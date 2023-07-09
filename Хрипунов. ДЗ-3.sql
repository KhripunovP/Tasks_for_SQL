DROP DATABASE IF EXISTS lesson3;
CREATE DATABASE IF NOT EXISTS lesson3;

USE lesson3;

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff`
(`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания;
SELECT * FROM staff
ORDER BY salary DESC;

-- Отсортируйте данные по полю заработная плата (salary) в порядке возрастания;
SELECT * FROM staff
ORDER BY salary;

-- Выведите 5 максимальных заработных плат (salary);
SELECT post, salary FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst);
SELECT post,
AVG(salary) AS 'Средняя зарплата по должности'
FROM staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно;
SELECT * FROM staff
WHERE post = 'Рабочий' AND age >= 24 AND age <= 49;

-- Найдите количество специальностей;
SELECT COUNT(DISTINCT post) FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно;
SELECT post
FROM staff
GROUP BY post
HAVING AVG(age) <= 30


