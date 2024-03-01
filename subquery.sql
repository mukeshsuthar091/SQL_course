-- -------SubQuery---------

select * from person where id in (select id from person where id%2!=0);