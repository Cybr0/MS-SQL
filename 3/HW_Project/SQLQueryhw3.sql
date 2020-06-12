use booksSQL

--1
select * from books as b
where (b.Izd not like '%bhv%') and (Pressrun > 3000)

--2
select * from books as b
where (b.New = 1) and (b.Price < 30)

--3
select * from books as b
where b.Name like '% % % %' 

--4
select * from books as b
where (b.Name like '%Microsoft%') and (b.Name not like '%Windows%') 

--5 ----
select * from books
where 
(Price /Pages) > 10

--6
delete from books
where Name like '%7%' or Name like '%7%'
--проверка
select * from books as b
where Name like '%7%' or Name like '%7%'

--7
select Name,Price from books as b
where New > 0

--8
update books
set Date = dateadd(YYYY,4,Date)
select Date from books as b
order by date DESC 

--9 тут тоже
select * from books
where year([Date]) = 2056 and (Price > 30)

--10
update books
set New = 0
select * from books as b

--11
INSERT INTO books(new, [name], izd)
VALUES (1, 'book1', 'toshkent');
INSERT INTO books(new, [name], izd)
VALUES (1, 'book2', 'toshkent');

select * from books as b
where Izd like 'toshkent'


