DROP DATABASE IF EXISTS dz3;
CREATE DATABASE IF NOT EXISTS dz3;
USE dz3;

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff`
(`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT
);

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
SELECT * from staff;

# 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
SELECT * from staff
order by salary desc;
SELECT * from staff
order by salary;
# 2. Выведите 5 максимальных заработных плат (salary)
select * from staff
order by salary desc
limit 5;
# 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
select post, sum(salary) as "Суммарная зарплата"
from staff
GROUP BY post;
# 4. Найдите кол-во сотрудников со специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
select count(*) as "Количество Рабочих"
from (select * from staff
where post = "Рабочий" and age between 24 and 49) as list;
# 5. Найдите количество специальностей.
select count(DISTINCT post) as "Количество специальностей"
from staff;
# 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
select post, avg(age)  as "Средний возраст" from staff
GROUP BY post
HAVING avg(age) < 30; -- Минимальный средний возраст равен 30







