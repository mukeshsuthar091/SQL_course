start transaction;

select * from book;

update book set name="The Amazing Universe" where id=1;

rollback;

commit;