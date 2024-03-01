select @@session.transaction_isolation;

show index in person;

set session transaction isolation level serializable; 

set @@sql_safe_updates=0;

start transaction;

update person set name="Flash" where name="Roni";

select * from person;

commit;