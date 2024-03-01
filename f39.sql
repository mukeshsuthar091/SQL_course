-- if statement

select * from account;

delimiter //

create procedure withdraw(in flag bool)
begin
	if flag=true then
		select "Hello";
	else
		select "Goodbye";
	end if;
end//

delimiter ;

call withdraw(false);

drop procedure withdraw;