update account set balance=800 where id=2; 
select * from account;

start transaction;
set @withdraw = 500;
set @accountID = 1;	

 
select balance from account where id=@accountID for update;

-- check that the balance is bigger than the withdrawal amount;

update account set balance = balance - @withdraw where id=@accountID;

commit;
