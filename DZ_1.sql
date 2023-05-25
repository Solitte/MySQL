create database dz;
use dz;
create table dz1(
Id int primary key auto_increment not null,
ProductName varchar(20) not null,
Manufacturer varchar(20) not null,
ProductCount SMALLINT UNSIGNED not null,
Price numeric not null
);
insert dz1 (ProductName, Manufacturer, ProductCount, Price)
values
("iPhone X", "Apple", 3, 76000),
("iPhone 8", "Apple", 2, 51000),
("Galaxy S9", "Samsung", 2, 56000),
("Galaxy S8", "Samsung", 1, 41000),
("P20Pro", "Huawei", 5, 36000); #Задание 1
select * from dz1;
select ProductName, Price FROM dz1
WHERE ProductCount > 2; #Задание 2
select * from dz1
WHERE Manufacturer like "Samsung"; #Задание 3
select * from dz1
WHERE ProductName like "%iPhone%"; #Задание 4.1
select * from dz1
WHERE Manufacturer like "%Samsung%"; #Задание 4.2
select * from dz1
WHERE ProductName like "%8%"; #Задание 4.3