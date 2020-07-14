CREATE DATABASE SchoolBD
on
(
	name = 'sbd',
	filename = 'C:\codeWar\_SQL\4\sbd.mdf',
	size = 5 mb,
	maxsize = 20 mb,
	filegrowth = 5 mb
)
log on
(
	name = 'sbdlog',
	filename = 'C:\codeWar\_SQL\4\sbd.ldf',
	size = 5 mb,
	maxsize = 10 mb,
	filegrowth = 5 mb
)

use SchoolBD


create table Student
(
	id int identity not null,
	surname varchar(20),
	[name] varchar(20),
	patronymic varchar(20),
	[group] int,
	course int
)

create table Teacher
(
	id int identity not null,
	surname varchar(20),
	[name] varchar(20),
	patronymic varchar(20),
	telephone varchar(20),
	[address] varchar(20),
	[group] int,
	maritalStatus varchar(20)
)

create table [Group]
(
	id int identity not null,
	[name] varchar(20)
)

create table StudentPerformanceData -- Данные успеваемости студентов
(
	id int identity not null,
	[data] varchar(20)
)

create table StudentAttendanceData -- Данные посещаемости студентов

(
	id int identity not null,
	[data] varchar(20)
)

INSERT INTO Student
VALUES
(
	'Surname_5',
	'Name_5',
	'Patronymic_5',
	1,
	2
),
(
	'Surname_6',
	'Name_6',
	'Patronymic_6',
	2,
	2
),
(
	'Surname_7',
	'Name_7',
	'Patronymic_7',
	1,
	2
),
(
	'Surname_8',
	'Name_8',
	'Patronymic_8',
	2,
	2
)

insert into Teacher
values
(
	'SurnameT_1',
	'NameT_1',
	'PatronymicT_1',
	'998901',
	'tashkent',
	1,
	'x'
),

(
	'SurnameT_2',
	'NameT_2',
	'PatronymicT_2',
	'998922',
	'Drugoe',
	2,
	'y'
)

insert into [Group]
values
(
	'Group_1'
),
(
	'Group_2'
),
(
	'Group_3'
),
(
	'Group_4'
)

use SchoolBD
--1
select * from Student
where [group] = 1

--2
select * from Teacher
where [group] = 1

--3
select * from Student
where [group] = (
	select [group] from Teacher
	where [group] = 1
)

--4
select * from Student
where surname like 'sur%'

--5
update Student
set [group] = 3
where [name] = 'Name_5' 
select * from Student

--6
update Teacher
set telephone = '9984567'
where [name] like '%1'
select * from [Teacher]

--7
select * from Student
delete Student
where [name] like '%10'
select * from Student

--8
insert into Teacher
values
(
	'Sfdsg',
	'TJij',
	'Pkadsfjn',
	'9989013223',
	'tashkent',
	3,
	'y'
)

--9
ALTER TABLE Student
ADD Telephone varchar(20) null
select * from Student

--10
update Student
set telephone = '123456'
select * from Student