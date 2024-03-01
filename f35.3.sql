use tutorial2;

select * from person;

grant execute on procedure tutorial2.PersonName to mukesh@localhost;
grant select on tutorial2.person to mukesh@localhost;


delimiter $$

create procedure PersonName()
sql security invoker
begin 
select * from person where id=4; 
end$$

delimiter ;

call PersonName();

drop procedure PersonName;
