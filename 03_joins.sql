-- create table product (id int primary key auto_increment, name varchar(50));

-- insert into product (name) values ('Electric cat groomer'), ('Automatic dog chaser'), ('Egg warmer');

-- select * from product;

-- create table person_product (person_id int not null, product_id int not null, foreign key(person_id) references person(id), foreign key(product_id) references product(id));

-- insert into person_product (person_id, product_id) values (1,3),(2,3),(1,1),(5,2),(3,1),(2,1),(1,2),(2,3);

select ps.name as name,
	   pd.name as product
from person_product pp
join person ps on pp.person_id=ps.id
join product pd on pp.product_id=pd.id;