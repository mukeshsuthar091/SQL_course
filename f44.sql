-- id
-- email: user1@caveofprogramming.com, user2@caveofprogramming.com, ...
-- random date
-- enabled (random boolean)

drop tables if exists users;

create table users(id int primary key auto_increment, email varchar(50) not null, registerd date not null, active boolean default false);
 
select round(rand());
select date(now()) - interval floor(10000*rand()) day

delimiter $$

create procedure testdata()
begin
	
    declare NUMROWS int default 10000;
    declare count int default 1;
    
    declare registerd_value date default null;
    declare email_value varchar(40) default null;
    declare active_value boolean default false;
    
    drop table if exists users;
    
    create table users(id int primary key auto_increment, email varchar(50) not null, registerd date not null, active boolean default false);
    
	while count <= NUMROWS do
		set registerd_value := date(now()) - interval floor(10000*rand()) day;
		set email_value := concat('user',count,'@caveofprogramming.com');
        set active_value := round(rand());
        
        insert into users(email, registerd, active) values (email_value, registerd_value, active_value);
        
        set count := count+1;
	end while;
    
end$$

delimiter ;

drop procedure testdata;

call testdata();

select count(*) from users;