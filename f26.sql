select @@session.transaction_isolation;
select * from book;

start transaction;

insert into book (name) values ("The Horror");

select * from book;

delete from book where id=23;

savepoint test1;

update book set name="The Forest" where id=1;

rollback to test1;

rollback;

commit;