select @total_value := sum(transaction_value), now() from sales;
insert into sales_history (recorded, total) values (now(), @total_value);

select * from sales_history;
select * from sales;

insert into sales_history (recorded, total) values (now(), (select sum(transaction_value) from sales));

