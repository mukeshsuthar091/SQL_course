create view smokers_in_country as select country, age from survey where smoke>3;
create view country_respondents as select country, age from survey where age>45;

select * from smokers_in_country;
select * from country_respondents;

drop view smokers_in_country;
drop view country_respondents;

-- ----------------
use online_shop;

create algorithm=temptable view product_category3 as select c.name, count(*) from products p join categories c on p.category_id=c.id group by c.name;
-- create algorithm=merge view product_category3 as select c.name, count(*) from products p join categories c on p.category_id=c.id group by c.name;
-- create algorithm=undefined view product_category3 as select c.name, count(*) from products p join categories c on p.category_id=c.id group by c.name;

select * from product_category3;

drop view product_category3;