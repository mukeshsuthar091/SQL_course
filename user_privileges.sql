-- --------created user--------
create user 'mukesh'@'localhost' identified by 'mukesh001';

-- --------given permission--------
grant all privileges on *.* to 'mukesh'@'localhost'; 


flush privileges;