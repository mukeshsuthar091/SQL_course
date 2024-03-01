use tutorial2;

select * from users;

set sql_safe_updates = 0;
delete from leads;

delimiter $$

create procedure cursortest()
begin
	
    declare the_email varchar(50);
    declare finished boolean default false;
    
    declare curl cursor for select email from users where active = true and registerd > date(now()) - interval 1 year; 
    
    declare continue handler for not found set finished = true;
    
    delete from leads;
    
    open curl;

		the_loop : loop
			
			fetch curl into the_email;
			
			if finished then
				leave the_loop;
			end if;
            
            insert into leads (email) values (the_email);
	end loop the_loop;
    
    close curl;
    
end$$

delimiter ;

create table leads(id int auto_increment primary key, email varchar(40) not null);

drop procedure cursortest;

call cursortest();

select count(*) from leads;