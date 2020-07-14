USE MySchool
GO
select * from StudentProgression

select* from Assessments
select * from AssessmentsOnSubjects
select * from StudentsOnAssessments
              ----    creating triggers     ----    
GO
CREATE TRIGGER StudentProgressionOnInsert
ON StudentProgression
FOR INSERT
AS
	