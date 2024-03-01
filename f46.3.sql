alter table stars add column born date;
alter table starts add column died date;

delimiter $$

create procedure create_stars_with_dates()
not deterministic
begin

	declare the_noun varchar(20);
    declare the_adjective varchar(20);
	declare born_date date;
    declare died_date date;
    declare min_died date;
    declare max_died date;
    declare days_lifespan int;

    declare finished boolean default false;

	declare nouns_cursor cursor for select noun from words order by rand();
    declare adjectives_cursor cursor for select adjective from words order by rand();

    declare continue handler for not found set finished := true;

    open nouns_cursor;
    open adjectives_cursor;

    the_loop: loop

		fetch nouns_cursor into the_noun;
        fetch adjectives_cursor into the_adjective;

        if finished then
			leave the_loop;
		end if;

        -- Uppercase first letters
        set the_adjective = concat(ucase(left(the_adjective, 1)), substring(the_adjective, 2));
        set the_noun = concat(ucase(left(the_noun, 1)), substring(the_noun, 2));

        -- Figure out birth date; at least 20 years ago, and not more than 60 years before
		-- that (80 years total maximum)
		select date(now()) - interval 20 year - interval 365*60*rand() day into born_date;

		-- When was the earliest they could have died? At least 19 years after being born.
		select born_date + interval 19 year into min_died;

        set died_date := null;

        if rand() <= 0.4 then

			-- When was the latest they could have died? (Today)
			select date(now()) into max_died;

			-- Calculate a random fraction of the interval between the birth date
			-- and maximum death date.
			select datediff(max_died, min_died)*rand() into days_lifespan;

			-- Add this number of days to when they were born to get the death date.
			select born_date + interval 19 year + interval days_lifespan day into died_date;

        end if;

        insert into stars (name, born, died) values (concat(the_adjective, " ", the_noun), born_date, died_date);

    end loop;

    close nouns_cursor;
    close adjectives_cursor;

end$$

delimiter ;

delete from stars;

call create_stars_with_dates();
drop procedure create_stars_with_dates;

select from_days(datediff(died, born)) from stars where died is not null;


select * from stars;
