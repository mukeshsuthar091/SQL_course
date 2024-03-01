create table book (id int primary key auto_increment, name varchar(50), library int);
create table library(id int auto_increment primary key, name varchar(50));

insert into library (name) values ('Cardiff Church Road'), ('Nottingham Orchard Way');
insert into book (name, library) values ('The 39 Steps', 10);

-- Alter (manipulate) table column
alter table book add constraint fk_library foreign key (library) references library(id);
alter table book drop constraint fk_library;

desc book