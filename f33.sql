-- casting

select cast("2001-02-07" as char);

select cast("Hello! Guys." as binary);
select cast(cast("Hello! Guys." as binary) as char);

select concat("Number of book: 	", cast(count(*) as char)) from book;