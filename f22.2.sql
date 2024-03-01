
set autocommit=0;
 
insert into book(name) values ("Silent sea");

delete from book where id=16;

update book set name="Dragon on the Mounten version 2"  where id=18;

select * from book;

rollback;
commit;