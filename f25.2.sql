select @@session.transaction_isolation;

show index in person;

set session transaction isolation level repeatable read; 
-- set session transaction isolation level read committed; 
-- set session transaction isolation level read uncommitted; 

set @@sql_safe_updates=0;

start transaction;

insert into person(id, name) values (6,"Riya");

select * from person;

commit;