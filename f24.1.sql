select @@session.transaction_isolation;

set session transaction isolation level serializable; 

set @@sql_safe_updates=0;

alter table person add index idx_name(name);

show index in person;

start transaction;

select * from person where name="Roger";

commit;