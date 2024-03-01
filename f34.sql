-- exercise

-- Q.1 
select concat("Total: ", count(*), " record", if(count(*)!=1, "s", "")) as Records from library;


-- Q.2
select @date :=date_format(applied, "%D of %M, %Y(%W)") from dates;
select @date;
select str_to_date(@date, "%D of %M, %Y(%W)");


-- Q.3
set @born = "April 28, 1906";
set @died = "January 14, 1978";

select @born, @died;
select dayname(str_to_date(@born, "%M %d, %Y"));
select dayname(str_to_date(@died, "%M %d, %Y"));

select from_days(datediff(str_to_date(@died,"%M %d, %Y"), str_to_date(@born,"%M %d, %Y"))) as Godel_Age;

select @newdied := str_to_date(@born, "%M %d, %Y") + interval 99 year + interval 6 month + interval 3 day;

select dayname(@newdied);
