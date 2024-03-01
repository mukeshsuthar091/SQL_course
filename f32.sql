-- Control flow function

select if(true, "Hello", "Goodbye");

create table parts(id int primary key auto_increment, part_id varchar(20) default null, catalog_id varchar(20) not null);

insert into parts(part_id, catalog_id) values (null, "ABC150");

select * from parts;

select if(part_id is not null, part_id, catalog_id) as identifier from parts;

select if(part_id is not null, part_id, catalog_id) as identifier from parts 
where if(part_id is not null, part_id, catalog_id) = "ABC150";

select ifnull(part_id, catalog_id) from parts;