DROP DATABASE IF EXISTS dz2;
CREATE DATABASE IF NOT EXISTS dz2;
USE dz2;
DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product int default 0);
insert into sales (order_date, count_product)
values
("2022-01-01", 156),
("2022-01-02", 180),
("2022-01-03", 21),
("2022-01-04", 124),
("2022-01-05", 341);
select * from sales;
select *,
CASE 
WHEN count_product < 100 THEN "Маленький заказ"
WHEN count_product >= 100 AND count_product < 300 THEN "Средний заказ"
ELSE "Большой заказ"
END AS "Тип заказа"
from sales;
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(id INT PRIMARY KEY AUTO_INCREMENT,
employee_id varchar(20) NOT NULL,
amount float(2) NOT NULL,
order_status varchar(20) NOT NULL
);
insert into orders (employee_id, amount, order_status)
values
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED");
select * from orders;
select *,
CASE 
WHEN order_status = "OPEN" THEN "Order is in open state"
WHEN order_status = "CLOSED" THEN "Order is closed"
ELSE "Order is cancelled"
END AS "full_order_status"
from orders;
/* 4. Чем 0 отличается от NULL?
0 - это число или символ, а
NULL - это отсутствие значения
*/
