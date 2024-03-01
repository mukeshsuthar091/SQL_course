
-- --------------- Trigger --------------------

create table sales(id int primary key auto_increment, product varchar(30) not null, value numeric(10,2));

create table sales_update(
	id int primary key auto_increment, 
	product_id int not null, 
    changed_at timestamp,
	before_value numeric(10,2) not null, 
    after_value numeric(10,2) not null);
    
drop table sales;
    
insert into sales (product, value) values ("Cake", 0.80);

select * from sales;
select * from sales_update;

update sales set value=2.62 where id=1;



delimiter $$

create trigger before_sales_update before update on sales for each row
begin

	insert into sales_update(product_id, changed_at, before_value, after_value)
		values (old.id, now(), old.value, new.value);

end$$ 

delimiter ;