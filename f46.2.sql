-- ------------ Exercise module 15 --------------
-- Q.2

select * from words;

delimiter $$

create procedure create_names()
begin

	declare the_noun varchar(20);
    declare the_adjective varchar(20);
	declare finished boolean default false;
	
    declare nouns_cursor cursor for select noun from words order by rand();
    declare adjectives_cursor cursor for select adjective from words order by rand();
    
    declare continue handler for not found set finished = true;
	
    
    open nouns_cursor;
    open adjectives_cursor;
    
		the_loop : loop
		
			fetch nouns_cursor into the_noun;
			fetch adjectives_cursor into the_adjective;
			
			-- Uppercase first letters
			set the_adjective = concat(ucase(left(the_adjective, 1)), substring(the_adjective, 2));
			set the_noun = concat(ucase(left(the_noun, 1)), substring(the_noun, 2));
            
            insert into stars(name) values (concat(the_adjective," ",the_noun));
			
			if finished then 
				leave the_loop;
			end if;
			
		end loop;

	close nouns_cursor;
    close adjectives_cursor;
    
end$$

delimiter ;

create table stars (id int primary key auto_increment, name text);

drop procedure create_names;
call create_names();

set sql_safe_updates=0;
delete from stars;

select * from stars;