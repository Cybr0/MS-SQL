---------------------------------------------------------------------------------------------------------------------------------------------
CREATE DATABASE TimurYusupovTask;
go

---------------------------------------------------------------------------------------------------------------------------------------------
USE TimurYusupovTask;
go

----Creating Tables, schema 
---------------------------------------------------------------------------------------------------------------------------------------------
CREATE SCHEMA School;
go

----DROP TABLE School.Student
CREATE TABLE School.Student
(
	Id int identity primary key,
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) not null,
	PhoneNumber nvarchar(15) not null,
	Email nvarchar(50) CHECK (Email like '%@%'),
	Birthdate date not null,
	studentRegNumber int,
	CONSTRAINT CHK_PhoneNumber CHECK (PhoneNumber like '+9989%' and PhoneNumber not like ('%[^0-9+]%'))
);
go

----DROP TABLE School.Teacher
CREATE TABLE School.Teacher
(
	Id int identity primary key,
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) not null,
	PhoneNumber nvarchar(15) not null,
	Email nvarchar(50) CHECK (Email like '%@%'),
	Birthdate date not null,
	CONSTRAINT CHK_Teacher_PhoneNumber CHECK (PhoneNumber like '+9989%' and PhoneNumber not like ('%[^0-9+]%'))
);
go

----DROP TABLE School.Subject
CREATE TABLE School.Subject
(
	Id int identity primary key,
	[Name] nvarchar(30) not null
);
go


----DROP TABLE School.StudentSubject
CREATE TABLE School.StudentSubject
(
	Id int identity primary key,
	IdStudent int,
	IdSubject int,
	Mark int,
	FOREIGN KEY (IdStudent) References School.Student(Id),
	FOREIGN KEY (IdSubject) References School.Subject(Id)
);
go


----DROP TABLE School.TeacherSubject
CREATE TABLE School.TeacherSubject
(
	Id int identity primary key,
	IdTeacher int,
	IdSubject int,
	FOREIGN KEY (IdTeacher) References School.Teacher(Id),
	FOREIGN KEY (IdSubject) References School.Subject(Id)
);
go


----Insert into Tables values
---------------------------------------------------------------------------------------------------------------------------------------------
----Table Student
insert into School.Student
values
('Timur', 'Timurov', '+998901220531', '1timur@mail.com', '03-12-1990', 1212),
('Rashid', 'Rashidov', '+998971220532', 'asfashidr@mail.com', '25-09-2009', 1313),
('Ululbek', 'Ululbekov', '+998971220533', 'ululbek@mail.com', '12-08-1992', 1414),
('Sabrhon', 'Sabrhonov', '+998971220534', '1sabrhonovr@mail.com', '30-03-1990', 1515),
('Dilshod', 'Dilshodov', '+998981220535', 'd222s@mail.com', '17-07-2003', 1616),
('Rasul', 'Rasulov', '+998931220536', 'rasulr@mail.com', '15-09-1990', 1717),
('Rustam', 'Rustamov', '+998911220537', 'rustamov@mail.com', '31-12-2004', 1818),
('Shavkat', 'Shavkatovich', '+998911220538', 'shav@mail.com', '07-05-1989', 1919),
('Sardor', 'Azizov', '+998911220538', 'azsa@mail.com', '07-05-1989', 2020),
('Akram', 'Akramov', '+998911220538', 'akram@mail.com', '07-05-1989', 2121);
go
--delete from School.Student
--select * from School.Student


----Table Teacher
insert into School.Teacher
values
('Timur', 'Timurovich', '+998951222231', 'tt@mail.com', '03-12-1958'),
('Maria', 'Ivanovna', '+998901225684', 'maiv@mail.com', '25-09-1970'),
('Botir', 'Ahmedov', '+998911229543', 'ba@mail.com', '12-11-1985'),
('Sergey', 'Sabrhonov', '+998941226453', 'sesa@mail.com', '30-03-1985'),
('Larisa', 'Viktorovna', '+998961229995', 'lavi@mail.com', '17-07-1960');
go
--delete from School.Teacher
--select * from School.Teacher


----Table Subject
insert into School.Subject
values
('C++'),
('C#'),
('Networks'),
('Math'),
('History'),
('Physics');
go
--delete from School.Subject
--select * from School.Subject



----Table StudentSubject
insert into School.StudentSubject
values
(1,1, 100),(1,2, 99),(1,3, 80),(1,4, 45),(1,5, 45),
(2,1, 100),(2,2, 98),(2,3, 80),(2,4, 45),(2,5, 45),
(3,1, 100),(3,2, 99),(3,3, 80),(3,4, 45),(3,5, 45),
(4,1, 100),(4,2, 99),(4,3, 80),(4,4, 45),(4,5, 45),
(5,1, 100),(5,2, 99),(5,3, 80),(5,4, 45),(5,5, 45),
(6,1, 100),(6,2, 99),(6,3, 80),(6,4, 45),(6,5, 45),
(7,1, 100),(7,2, 99),(7,3, 80),(7,4, 45),(7,5, 45),
(8,1, 100),(8,2, 99),(8,3, 80),(8,4, 45),(8,5, 45),
(9,1, 100),(9,2, 99),(9,3, 80),(9,4, 45),(9,5, 45),
(10,1, 100),(10,2, 99),(10,3, 80),(10,4, 45),(10,5, 45);
go
--delete from School.StudentSubject
--select * from School.StudentSubject


----Table TeacherSubject
insert into School.TeacherSubject
values
(3,1),
(1,2),
(2,3),
(4,4),
(5,5);
go
--delete from School.TeacherSubject
--select * from School.TeacherSubject





----Selects
---------------------------------------------------------------------------------------------------------------------------------------------

--1)
select * from School.Student as st
where YEAR(GETDATE()) - YEAR(st.Birthdate) < 20;
go

--2)
select * from School.Student as st
where (MONTH(st.Birthdate) = 8 and DAY(st.Birthdate) >= 12) or 
(MONTH(st.Birthdate) = 9 and DAY(st.Birthdate) <= 18);
go

--3)
select * from School.Teacher as tea
where YEAR(GETDATE()) - YEAR(tea.Birthdate) > 55;
go

--4)
select Id, FirstName, LastName, PhoneNumber, Email, Birthdate
from School.Student as st
where PhoneNumber like '+99890%' or PhoneNumber like '+99891%'
Union all
select Id, FirstName, LastName, PhoneNumber, Email, Birthdate 
from School.Teacher as te
where PhoneNumber like '+99890%' or PhoneNumber like '+99891%';
go


--5)
select * from School.Student as st
where st.FirstName like '%RA%' or st.LastName like '%RA%';
go


--6)
select * from School.Subject as s
where s.Id = 
(
	select top 1 ss.IdSubject from School.StudentSubject as ss
	where ss.IdStudent = 
		(
			select st.Id from School.Student as st
			where st.FirstName like '%timur%'
		)
	order by ss.Mark desc
);
go


--7) todo
select t.*, s.Name, avg(ss.Mark) as AVGMark, COUNT(*) as Students from School.Teacher as t
join School.TeacherSubject as ts on t.Id = ts.IdTeacher
join School.Subject as s on ts.IdSubject = s.Id
join School.StudentSubject as ss on ss.IdSubject = s.Id
where t.FirstName like '%tim%' and ss.Mark > 80
group by t.Id, t.FirstName, t.LastName, t.Birthdate, t.Email, t.PhoneNumber, s.Name
having count(*) >= 10 ;
go


--8)
select DISTINCT t.*, s.Name, avg(ss.Mark) as AVGMark from School.Teacher as t
join School.TeacherSubject as ts on t.Id = ts.IdTeacher
join School.Subject as s on ts.IdSubject = s.Id
join School.StudentSubject as ss on ss.IdSubject = s.Id
where ss.Mark > 97
group by t.Id, t.FirstName, t.LastName, t.Birthdate, t.Email, t.PhoneNumber, s.Name;
go


--9)
select top 1 s.Id, s.Name, avg(ss.Mark) as Average from School.Teacher as t
join School.TeacherSubject as ts on t.Id = ts.IdTeacher
join School.Subject as s on ts.IdSubject = s.Id
join School.StudentSubject as ss on ss.IdSubject = s.Id
GROUP BY s.Id, s.Name;


