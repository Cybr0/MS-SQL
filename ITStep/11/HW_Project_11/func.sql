USE MySchool
GO

              ----    creating faunctions     ----    
----1
--create function CalculateAge
--(
--	@bday datetime
--)
--returns int
--as
--begin
--	declare @age int = year(getdate()) - year(@bday)

--	return @age
--end
select S.DateOfBirth, dbo.CalculateAge(S.DateOfBirth) from Students S
go



----2
--create function CalculateStatus
--(
--	@mark int
--)
--returns nvarchar(5)
--as
--begin
--	declare @resp nvarchar(5) = 'None'
--	if(@mark > 0 and @mark < 40)
--	begin
--		set @resp = 'Fail'
--	end
--	if(@mark > 39 and @mark < 101)
--	begin
--		set @resp = 'Pass'
--	end
--	return @resp
--end

select S.[Name], S.Surname,a.Mark, dbo.CalculateStatus(A.Mark) from Students S
join StudentsOnAssessments A
on S.ID = A.StudentID

go





----3
--create function CalculateRank
--(
--	@mark int
--)
--returns nvarchar(5)
--as
--begin
--	declare @rank nvarchar(5) = 'None'
--	if(@mark > 0 and @mark < 40)
--	begin
--		set @rank = 'E/F'
--	end
--	if(@mark > 39 and @mark < 60)
--	begin
--		set @rank = 'D'
--	end
--	if(@mark > 59 and @mark < 75)
--	begin
--		set @rank = 'C'
--	end
--	if(@mark > 74 and @mark < 90)
--	begin
--		set @rank = 'B'
--	end
--	if(@mark > 89 and @mark < 100)
--	begin
--		set @rank = 'A'
--	end
--	if(@mark > 99)
--	begin
--		set @rank = 'A+'
--	end
--	return @rank
--end

select S.[Name], S.Surname,a.Mark, dbo.CalculateRank(A.Mark) AS[CalculateRank] from Students S
join StudentsOnAssessments A
on S.ID = A.StudentID

go

