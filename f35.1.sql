use online_shop;
select * from products;

create user 'shopU'@'localhost' identified by "shop002";
grant execute on procedure online_shop.ShopCustomers to 'shopU'@'localhost';
grant select on online_shop.customers to 'shopU'@'localhost';

create user 'procuser'@'localhost' identified by "proc002";
grant execute on procedure online_shop.ShopCustomers to 'procuser'@'localhost'; 
grant select on online_shop.customers to 'procuser'@'localhost';

drop procedure ShopCustomers;

delimiter $$

-- create definer = shopU@localhost procedure ShopCustomers()
create definer = procuser@localhost procedure ShopCustomers()
sql security definer 
begin
select * from customers;
end $$

delimiter ;

call ShopCustomers();

