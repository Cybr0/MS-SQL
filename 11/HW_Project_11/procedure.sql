use MySchool
go

create proc GetStudentsWithHighestMarks
as
begin
	select S.[Name],S.Surname, A.Mark from Students S
	join StudentsOnAssessments A
	on S.ID = A.StudentID
	WHERE A.Mark > 10
end

EXEC GetStudentsWithHighestMarks