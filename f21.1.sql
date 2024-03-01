
lock tables sales read, sales_history write;
select @total_value := sum(transaction_value), now() from sales;
insert into sales_history (recorded, total) values (now(), @total_value);
unlock table;

select * from sales_history;