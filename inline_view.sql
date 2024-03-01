-- -----------inline view-------------
-- this is act as a temprary table: select country, count(*) as respondents from survey group by country

select avg(respondents), min(respondents), max(respondents) from (select country, count(*) as respondents from survey group by country) as t;

