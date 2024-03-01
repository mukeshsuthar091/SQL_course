select * from book;

delimiter $$

create procedure ShowBooks(in theId int, out outId int, out outTitle varchar(50))
begin
select id, name into outId, outTitle from book where id=theId;
end$$

delimiter ;

call ShowBooks(22, @id, @title);

select @id, @title;

drop procedure ShowBooks;