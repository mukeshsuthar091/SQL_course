-- ------------ Exercise module 15 --------------
-- Q.1 

create table words(id int primary key auto_increment, noun varchar(20) not null, adjective varchar(20) not null);

select * from words;

insert into words(noun, adjective) values ('beautiful','hand');

delimiter $$

create procedure create_lists(out nouns text, out adjectives text)
begin

	declare the_noun varchar(20);
    declare the_adjective varchar(20);
	declare finished boolean default false;
    declare curl cursor for select noun, adjective from words; 
    
    declare continue handler for not found set finished = true;
		
	set nouns := "";
    set adjectives := "";

    open curl;
    
		the_loop : loop
			
            fetch curl into the_noun, the_adjective;
            
            if finished then
				leave the_loop;
			end if;
            
			set nouns := concat(nouns, the_noun, ", ");
            set adjectives := concat(adjectives, the_adjective, ", ");
            
		end loop;
	
    close curl;
    
end$$

delimiter ;

drop procedure create_lists;

call create_lists(@nouns_list, @adjectives_list);

select @nouns_list, @adjectives_list;