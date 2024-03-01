-- creating variables

set @user = 'mukesh';
set @value = 100;

select @user, @value;

set @minValue = 8.99;

select * from sales where transaction_value >= @minValue;


-- setting variable and select
select @total := sum(transaction_value), @min_value := min(transaction_value), @max_value := max(transaction_value) from sales;

select @total, @min_value, @max_value;