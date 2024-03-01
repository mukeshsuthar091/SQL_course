-- Stored Procedure
use tutorial2;

delimiter $$
create procedure HelloWorld()
begin
select "Good Morning.";
select "Hello World!!";
end $$
delimiter ;

call HelloWorld();

drop procedure HelloWorld;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `HelloWorld`()
begin
select "Good Morning.";
end$$
DELIMITER ;
