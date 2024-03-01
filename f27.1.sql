start transaction;

select * from book;

savepoint test1;

update book set name="The Amazing Universe" where id=1;

select * from book;

rollback to test1;

rollback;

commit;