create database ecommerce;
use ecommerce;

create table products(
id int primary key auto_increment,
name varchar(60),
category enum('Baked Goods', 'Fruit and Veg', 'Dairy'),
sell_by_date date,
sold bool,
moment_of_sale timestamp,
quantity int,
weight_kg numeric(6,3)
);
select * from products;
 
insert into products(name, category, sell_by_date, sold, moment_of_sale, quantity, weight_kg) values 
("Sack of Potatoes", "Fruit and Veg", "2016-10-14", true, "2015-11-01 10:23:45", 30, 10);

 
create table personal(
id int primary key auto_increment,
given_name varchar(60),
family_name varchar(60),
gender enum('MALE', 'FEMALE'),
telephone_number varchar(100),
married bool,
salary int,
age tinyint,
position enum('Developer', 'Manager', 'CEO'),
date_started date
);
select * from personal;

insert into personal(given_name, family_name, gender, telephone_number, married, salary, age, position, date_started) values
("Arnold", "Brown", "MALE", "01348908340", true,34000, 34, 'developer', "2014-05-06");


create table address(
id int primary key auto_increment,
first_line varchar(60),
second_line varchar(60),
city varchar(60),
region varchar(60),
zip_code char(6),
two_letter_country_code char(2)
);
select * from address;

insert into address(first_line, second_line, city, region, zip_code, two_letter_country_code) values 
("The Badger Inn", "23 Church Lane", "Badgerton", "East Badgering", "BA4DER", "UK");

