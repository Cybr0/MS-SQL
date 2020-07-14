--CREATE DATABASE CellularServiceSystem  --система обслуживания  сотовой связи.

use CellularServiceSystem
-- Creating BD - надо раскоментировать -- ИЛИ -- выделить создание БД и Таблиц, затем нажать F5(Execute).
/*
drop table SubsInfo
drop table [Subscriber's Handling]
drop table TechnicalSupportStaff

CREATE TABLE TechnicalSupportStaff
(
	StaffId int identity not null,
	[Name] varchar(20),
	Surname varchar(20),
	Patronymic varchar(20)
)

CREATE TABLE [Subscriber's Handling]
(
	StaffId int not null,
	SubId int not null,
	DateOfAppeal smalldatetime,  -- Дата обращения
	ReasonForHandling varchar(50), -- Причина обращения
	ProblemSolving varchar(50),  -- Решение проблемы
	DateOfSolvingTheProblem smalldatetime 
)

CREATE TABLE SubsInfo
(
	SubId int identity not null,
	[Name] varchar(20),
	Surname varchar(20),
	Patronymic varchar(20),
	tel varchar(15)
)
*/
go
-- INSERT INTO BD - надо раскоментировать -- ИЛИ -- выделить и нажать F5(Execute).
/*
INSERT INTO TechnicalSupportStaff
VALUES
('James', 'Hoog', 'New York'),
('Nail', 'Knite', 'Paris'),
('Mc', 'Lyon', 'Paris'),
('Pit', 'Alex', 'London'),
('Paul', 'Adam', 'Rome'),
('Lauson', 'Hen', 'San Jose')

INSERT INTO SubsInfo
VALUES
('Nick', 'Rimando', 'New York', '156235001'),
('Brad', 'Davis', 'New York', '606269002'),
('Graham', 'Zusi', 'California', '776235003'),
('Julian', 'Green', 'London', '506235004'),
('Fabian', 'Johnson', 'Paris', '896235005'),
('Geoff', 'Cameron', 'Berlin', '226235006'),
('Jozy', 'Altidor', 'Moscow', '116235007'),
('Brad', 'Guzan', 'London', '366235008')

DELETE FROM [Subscriber's Handling]
INSERT INTO [Subscriber's Handling]
VALUES
(1,3,'2020-02-10 16:00','Не работают звонки','Пополнить счет','2020-02-10 16:04'),
(1,3,'2020-02-02 08:00','Не работает связь','Проверка связи','2020-02-02 12:00'),
(1,5,'2020-02-02 15:00','Не работает интернет на телефоне','Перезагрузить телефон','2020-02-02 16:00'),
(1,4,'2020-02-04 16:00','Не работает интернет на телефоне','Перезагрузить телефон','2020-02-04 16:04'),
(2,7,'2020-02-01 16:00','Не работает интернет на телефоне','Перезагрузить телефон','2020-02-01 16:09'),
(3,4,'2020-02-05 16:00','Не работает интернет на телефоне','Перезагрузить телефон','2020-02-05 17:04'),
(3,2,'2020-02-01 16:00','Не работает связь','Пополнить счет','2020-02-01 16:15'),
(4,6,'2020-02-01 16:00','Не работает интернет на телефоне','Перезагрузить телефон','2020-02-01 16:04'),
(4,7,'2020-02-06 16:00','Не работает интернет на телефоне','Перезагрузить телефон','2020-02-06 16:05'),
(5,7,'2020-03-01 16:00','Не работает интернет на телефоне','Перезагрузить телефон','2020-03-01 16:02'),
(5,5,'2020-02-07 16:00','Не работает интернет на телефоне','Перезагрузить телефон','2020-02-07 16:08'),
(6,1,'2020-04-01 14:00','Не работает связь','Проверка связи','2020-04-01 15:07')

*/

go

--Select * FROM TechnicalSupportStaff
--Select * FROM SubsInfo
--select * from [Subscriber's Handling]
GO

-------------------------- 1.1 ---------------------------------
SELECT SI.[Name], SI.Surname, SH.DateOfAppeal  FROM SubsInfo SI 
LEFT OUTER JOIN
[Subscriber's Handling] SH
ON SI.SubId = SH.SubId 
WHERE month(SH.DateOfAppeal) in 
	(
	SELECT MONTH(DateOfAppeal) FROM [Subscriber's Handling] SHH
	WHERE SHH.DateOfAppeal BETWEEN '01.01.2019' AND '03.03.2020'
	) 
order by(SI.Name)

-------------------------- 1.2 ---------------------------------
-- ТУТ СМОТРЕЛ ВОЗМОЖНОСТИ РАСШЕРЕНИЯ ТАБЛИЦЫ
--select '.Обращения за период:',('01.01.2019  -  03.03.2020'), null
--union 
SELECT SI.[Name] [Имя], SI.Surname AS [Фамилия], COUNT(SI.[Name]) AS [Кол. обращений]  FROM SubsInfo SI 
LEFT OUTER JOIN
[Subscriber's Handling] SH
ON SI.SubId = SH.SubId 
WHERE month(SH.DateOfAppeal) in 
	(
	SELECT MONTH(DateOfAppeal) FROM [Subscriber's Handling] SHH
	WHERE SHH.DateOfAppeal BETWEEN '01.01.2019' AND '03.03.2020'
	) 
GROUP BY SI.SubId, SI.[Name], SI.Surname
order by COUNT(SI.[Name]) DESC;

/* -- ТУТ ПРОВЕРЯЛ ДАТУ
SELECT * FROM SubsInfo SI
LEFT OUTER JOIN
[Subscriber's Handling] SH
ON SI.SubId = SH.SubId
order by(SH.DateOfAppeal)
--WHERE month(SH.DateOfAppeal) = 7
*/
go

-------------------------- 2 ---------------------------------
SELECT T.[Name], T.Surname, COUNT(T.StaffId) AS [Handling Count] FROM TechnicalSupportStaff T
INNER JOIN
[Subscriber's Handling] S
ON T.StaffId = S.StaffId
GROUP BY T.StaffId, T.Name, T.Surname
HAVING COUNT(T.StaffId) > 3
ORDER BY COUNT(T.StaffId) DESC

/*
SELECT * FROM TechnicalSupportStaff T
SELECT T.[Name], T.Surname, S.DateOfAppeal FROM TechnicalSupportStaff T
INNER JOIN
[Subscriber's Handling] S
ON T.StaffId = S.StaffId
*/
GO
-------------------------- 3.1 ---------------------------------
SELECT SI.Name, SI.Surname, SH.ReasonForHandling, COUNT(SI.SubId) [Count] FROM SubsInfo SI
INNER JOIN
[Subscriber's Handling] SH
ON SI.SubId = SH.SubId
GROUP BY SI.Name, SI.Surname, SH.ReasonForHandling
HAVING SH.ReasonForHandling = 'Не работает связь'
ORDER BY [Count]

-------------------------- 3.2 ---------------------------------
SELECT SI.Name, SI.Surname, SH.ReasonForHandling FROM SubsInfo SI
INNER JOIN
[Subscriber's Handling] SH
ON SI.SubId = SH.SubId
where SH.ReasonForHandling = 'Не работает связь'


-------------------------- 4 ---------------------------------

SELECT SI.Name, datepart(HOUR,(DateOfSolvingTheProblem - DateOfAppeal)) as [Hour], datepart(MINUTE,(DateOfSolvingTheProblem - DateOfAppeal)) as [Minute] FROM SubsInfo SI
INNER JOIN
[Subscriber's Handling] SH
ON SI.SubId = SH.SubId
where not cast((SH.DateOfSolvingTheProblem - SH.DateOfAppeal) as time) < '00:30'

-------------------------- 5.1 ---------------------------------
select   count(*) [Count], 
'Среднее время:' as [01.02.2020 - 31.02.2020],
sum(datepart(HOUR,  (DateOfSolvingTheProblem - DateOfAppeal))) / COUNT(*) [Hour], 
sum(datepart(MINUTE,(DateOfSolvingTheProblem - DateOfAppeal))) / COUNT(*) [Minute] 
from [Subscriber's Handling] SH
WHERE MONTH(SH.DateOfAppeal) = 2 

-------------------------- 5.2 ---------------------------------
select   count(*) [Count], 
sum(datepart(HOUR,  (DateOfSolvingTheProblem - DateOfAppeal))) / COUNT(*) [Hour], 
sum(datepart(MINUTE,(DateOfSolvingTheProblem - DateOfAppeal))) / COUNT(*) [Minute] 
from [Subscriber's Handling] SH
WHERE DateOfAppeal IN
	(
		SELECT DateOfAppeal FROM [Subscriber's Handling] SH
		WHERE MONTH(SH.DateOfAppeal) = 2 
	)

-------------------------- 6 ---------------------------------
/* -- проверка
SELECT * FROM [Subscriber's Handling]
WHERE MONTH(DateOfAppeal) = 2 
select  datepart(HOUR,(DateOfSolvingTheProblem - DateOfAppeal)),
datepart(MINUTE,(DateOfSolvingTheProblem - DateOfAppeal))
from [Subscriber's Handling] SH
WHERE MONTH(SH.DateOfAppeal) = 2 
*/

select   count(*) [Count], 
'   Общее время:' as [01.02.20 - 31.02.20],
sum(datepart(HOUR,  (DateOfSolvingTheProblem - DateOfAppeal)))  [Hour], 
sum(datepart(MINUTE,(DateOfSolvingTheProblem - DateOfAppeal)))  [Minute] 
from [Subscriber's Handling] SH
WHERE MONTH(SH.DateOfAppeal) = 2 

-------------------------- 7 ---------------------------------
SELECT T.StaffId, T.Name, count(T.StaffId) AS [Count] FROM TechnicalSupportStaff T
LEFT OUTER JOIN [Subscriber's Handling] S
ON T.StaffId = S.StaffId
GROUP BY T.StaffId, T.Name, S.DateOfAppeal
HAVING MONTH(S.DateOfAppeal) = 1
ORDER BY [Count] desc

-- Проверка
/*
SELECT s.StaffId, T.Name, s.SubId FROM TechnicalSupportStaff T
LEFT OUTER JOIN [Subscriber's Handling] S
ON T.StaffId = S.StaffId
where MONTH(S.DateOfAppeal) = 1
ORDER BY s.StaffId desc
*/