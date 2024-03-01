-- Date, Interval and Queries
use tutorial2;

create table dates(id int primary key auto_increment, applied date not null);

select curdate();
select curtime();

insert into dates(applied) values (curdate() - interval 5 year);
select * from dates;

select curdate() - interval 30 day;
select curdate() + interval 30 day;

select date_sub("2023-06-12", interval 5 month);
select date_add("2023-06-12", interval 5 month);

select * from dates where applied = '2022-02-18';

select id, year(applied), month(applied), day(applied), dayname(applied) from dates where applied = '2022-02-18';

set @born = '2001-02-07';

select dayname(@born);

select datediff(curdate(), @born)/365;
select from_days(datediff(curdate(), @born));


select str_to_date("07/02/2001", "%d/%m/%Y") + interval 30 day;

select date_format("2001-02-07", "%a %D %M %Y") 