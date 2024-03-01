create view bookView1 as select * from book where id<10;
insert into bookView1 (id, name) values (15, 'Anabella') ;

create view bookView2 as select * from book where id<10 with check option;
insert into bookView2 (id, name) values (9, 'BloodyHell') ;

select * from bookView2;
select * from book;

drop view bookView1;
