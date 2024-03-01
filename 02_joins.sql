select p.id as id, 
	   p.name as name, 
       a.street as street, 
       r.name as region  
from person p  
join address a on p.address_id=a.id 
join region r on a.region_id=r.id;

select * from person;

