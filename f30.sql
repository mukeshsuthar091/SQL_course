select concat("Title: ",name) as book_titles from book;

select ucase(name) as book_titles from book;
select lcase(name) as book_titles from book;
select concat("Title length: ",length(name)) as book_titles from book;
select reverse(name) as book_titles from book;
select replace(name, "The", "A") as book_titles from book;
select left(name, 5) from book;
select trim("   fox   ");
select substring(name, 1, 2) as book_titles from book;