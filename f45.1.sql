select * from users;

delimiter $$

create procedure cursortest()
begin
	
    declare the_email varchar(50);
    
    declare curl cursor for select email from users order by id;
    
    open curl;
    
    fetch curl into the_email;
    
    close curl;
    
    select the_email;
    
end$$

delimiter ;

drop procedure cursortest;

call cursortest();