select @@session.transaction_isolation;

set session transaction isolation level repeatable read; 
-- set session transaction isolation level read committed; 
-- set session transaction isolation level read uncommitted; 

set @@sql_safe_updates=0;

-- alter table person add index idx_name(name);

show index in person;

start transaction;

select * from person;

commit;