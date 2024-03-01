-- local variable;

select * from account;

-- ------------defined procedure----------------
delimiter //

create procedure withdraw(in account_id int, in amount numeric(7,2), out success bool)
begin
	
    declare current_balance numeric(7,2) default 0.0;
    
    -- ------------handling errors----------------
    declare exit handler for sqlexception
    begin 
		show errors;
	end;
    
    declare exit handler for sqlwarning
    begin
		show warnings;
	end;
    
    -- ------------transaction start----------------
    start transaction;
		
		select balance into current_balance from account where id = account_id for update;
        
		-- check the current balance of the account
		if current_balance>= amount then
			-- if balance is big enough, do withdrawal 
			update account set balance = balance-amount where id=account_id;
			select "Withdraw successfull" as message;
			set success=true;
		else
			select "Withdraw failed, not enough amount" as message;
			set success=false;
		end if;
    
    commit;
end//

delimiter ;

    -- ------------calling procedure----------------
call withdraw(1, 50, @success);

select @success;
select * from account;

drop procedure withdraw;

-- -------------------------------------------------
-- update account set balance = 800 where id=2;
-- alter table account add index idx_balance(balance);
-- show indexes in account; 

