---тут можно использовать любую бд или просто создать
;
USE SickRegistryDB

go

CREATE TABLE TestTable
(
	Fullname VARCHAR(50),
	BYear INT NULL,
	[Sum] FLOAT
)
ON [PRIMARY]
GO

INSERT INTO TestTable
VALUES
('John',2011,200),
('John',2011,500),
('John',2012,300),
('John',2012,600),
('John',2013,900),
('John',2013,300),
('John',2014,100),
('John',2014,100),
('John',2015,200),

('Pol',2011,200),
('Pol',2011,500),
('Pol',2012,300),
('Pol',2012,600),
('Pol',2013,900),
('Pol',2013,300),
('Pol',2014,100),
('Pol',2014,100),
('Pol',2015,200)


go

SELECT [Summa].Fullname, [Summa].BYear, SUM([Summa].[Sum]) FROM TestTable  AS [Summa]
GROUP BY [Summa].Fullname, [Summa].BYear


SELECT T.Fullname, T.BYear, SUM(T.[Sum]) FROM TestTable T
GROUP BY T.Fullname, T.BYear
ORDER BY T.Fullname, T.BYear

SELECT Fullname, [2011], [2012], [2013], [2014], [2015]
FROM TestTable T 
PIVOT
(
	SUM(T.[SUM]) FOR BYEAR IN ([2011],[2012],[2013],[2014],[2015])
) AS test_pivot



go



CREATE TABLE test_table_unpivot
(
	fio varchar(50),
	number1 int,
	number2 int,
	number3 int,
	number4 int,
	number5 int,
)


insert into test_table_unpivot
values
(
	'John',
	123,
	1234,
	12345,
	123456,
	1234567
)

go


select * from test_table_unpivot

select fio, column_name, number
from test_table_unpivot
unpivot
(
	number for column_name in ([number1], [number2], [number3], [number4], [number5])
) as test_unpivot


go

create table Students
(
	Id INT IDENTITY PRIMARY KEY,
	StudentName VARCHAR(50),
	Course VARCHAR(50),
	Score INT
)

GO
delete from Students
INSERT INTO Students
VALUES
('Sally', 'English', 95),
('Sally', 'History', 82),
('Edward', 'English', 45),
('Edward', 'History', 78)


go

--1
select * from Students


--2
select StudentName, [English], [History] 
from Students S
pivot
(
	sum(Score) for Course in ([English],[History])
) AS students_pivot


--3
select * from
(
	select StudentName,Course ,Score  from Students
)
as studentTable
pivot
(
	sum(Score) for Course in ([English],[History])
) as schoolPivot


go
--TRY CATCH
begin try
	select 4/0 as result
end try
begin catch
	select
	ERROR_NUMBER() as ERROR__NUMBER
	,ERROR_SEVERITY() as ERROR__SEVERITY
	,ERROR_STATE() as ERROR__STATE
	,ERROR_PROCEDURE() as ERROR__PROCEDURE
	,ERROR_LINE() as ERROR__LINE
	,ERROR_MESSAGE() as ERROR__MESSAGE
end catch

go
--1
--drop PROCEDURE DEL
go

CREATE PROCEDURE DEL
@a decimal, @b decimal
as
begin try
	select @a/@b as result
end try
begin catch
	select
	ERROR_NUMBER() as ERROR__NUMBER
	,ERROR_SEVERITY() as ERROR__SEVERITY
	,ERROR_STATE() as ERROR__STATE
	,ERROR_PROCEDURE() as ERROR__PROCEDURE
	,ERROR_LINE() as ERROR__LINE
	,ERROR_MESSAGE() as ERROR__MESSAGE
end catch
--1
exec del 4, 2.2



--2
--drop PROCEDURE DEL2
go
CREATE PROCEDURE DEL2
@a decimal, @b decimal , @c decimal out
as
begin try
	set @c = @a/@b
end try
begin catch
	select
	ERROR_NUMBER() as ERROR__NUMBER
	,ERROR_SEVERITY() as ERROR__SEVERITY
	,ERROR_STATE() as ERROR__STATE
	,ERROR_PROCEDURE() as ERROR__PROCEDURE
	,ERROR_LINE() as ERROR__LINE
	,ERROR_MESSAGE() as ERROR__MESSAGE
end catch
--2
declare @r decimal
execute DEL2 10, 2, @r output --или просто out
print @r;
select @r as result
go
