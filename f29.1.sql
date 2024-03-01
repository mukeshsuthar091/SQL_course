start transaction;

select id from library where name = "Cardiff Church Road" lock in share mode;

insert into book(name, library) values ("Painting for Beginners", 2);

commit;

select * from book;