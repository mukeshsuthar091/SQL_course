-- define variables

select * from book;

-- select @theID := id, @title := name from book where id = 1;

-- Another way is using (into)
select id, name into @theID, @theTitle from book where id = 4;
 
select @theID, @theTitle;