start transaction;

update book set name="The Old Man version 2" where id=19;

select * from book;
commit;