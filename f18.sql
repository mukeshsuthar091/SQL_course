-- on connection one

lock tables categories read;
unlock tables;

select * from categories; 
select * from customers;
select * from products;

insert into products (name, price, category_id, quantity_available) values ('The revenge', 10.99, 1, 350);
insert into categories (name) values (Game);

-- on connection two

lock tables products read;
unlock tables;

select * from categories;
select * from customers;
select * from products;