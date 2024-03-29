-- --------------- Trigger --------------------

drop table products;
create table products(id int primary key auto_increment, value numeric(10,2) not null);

set delimiter $$

create trigger before_products_insert before insert on products for each row
begin 	
    if new.value > 100.0 then 
		set new.value := 100;
	end if;
end$$

create trigger before_products_update before update on products for each row
begin 	
    if new.value > 100.0 then 
		set new.value := 100;
	end if;
end$$

set delimiter ;

insert into products(value) values(150.5);
update products set value=102.0 where id=1;

delete from products where id=3;

select * from products;
