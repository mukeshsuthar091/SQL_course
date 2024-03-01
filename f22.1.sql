
set autocommit=0;
 
insert into book(name) values ("Rich Man");

delete from book where id=17;

update book set name="The Old Man version 2"  where id=18;

select * from book;

commit;