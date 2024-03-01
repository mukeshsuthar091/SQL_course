use tutorial2;

delimiter $$

create procedure loopdemo()
begin 
	
    declare count int default 0;
    declare numbers varchar(30) default "";
    
    the_loop : loop
    
		if count=10 then
			leave the_loop;
		end if;
        
        set numbers := concat(numbers, count, if(count!=9, ",", ""));
		set count := count+1;
	end loop;
    
    select numbers;

end$$

delimiter ;

drop procedure loopdemo;

call loopdemo();

