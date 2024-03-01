-- passing parameters

use tutorial2;
select * from book;

delimiter $$

create procedure ShowBooks(in maxID int, in title varchar(50))
begin
select * from book where id < maxID and name=title;
end$$

delimiter ;

call ShowBooks(12, 'The revenge');

drop procedure ShowBooks;
