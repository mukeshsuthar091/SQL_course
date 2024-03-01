select * from book;

delimiter $$

create procedure ShowBooks(inout theId int)
begin
select theId;
select count(*) into theId from book;
end$$

delimiter ;

set @id = 4;
call ShowBooks(@id);

select @id;

drop procedure ShowBooks;