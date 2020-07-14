--USE master
--CREATE DATABASE MySchool
--GO
--USE MySchool
--CREATE TABLE Students 
--(
--	ID INT IDENTITY NOT NULL,
--	Name NVARCHAR(50) NOT NULL,
--	Surname NVARCHAR(50) NOT NULL,
--	MiddleName NVARCHAR(50),
--	DateOfBirth DATETIME NOT NULL,
--	Email NVARCHAR(50) NOT NULL,
--	Gender NVARCHAR(10) NOT NULL CHECK (Gender  = 'Male' or Gender = 'Female'),
--	PhoneNumber NVARCHAR(20) NOT NULL,
--	HomePhoneNumber NVARCHAR(20) NOT NULL,
--	PRIMARY KEY (ID)   
--) 

--CREATE TABLE Teachers
--(
--	ID INT IDENTITY NOT NULL,
--	Name NVARCHAR(50) NOT NULL,
--	Surname NVARCHAR(50) NOT NULL,
--	MiddleName NVARCHAR(50),
--	Email NVARCHAR(50) NOT NULL,
--	Title NVARCHAR(10) NOT NULL Check (Title IN ('Mr', 'Mrs', 'Ms', 'Miss', 'Dr', 'Sir', 'Madam')),
--	PhoneNumber NVARCHAR(20) NOT NULL,
--	HomePhoneNumber NVARCHAR(20) NOT NULL,
--	DateOfHiring DATETIME NOT NULL,
--	PRIMARY KEY (ID)
--)

--CREATE TABLE Subjects
--(
--	ID INT IDENTITY NOT NULL PRIMARY KEY,
--	Name NVARCHAR(50) NOT NULL,
--	Comments NVARCHAR(50) NOT NULL
--)

--CREATE TABLE Assessments --Компоненты для предметов
--(
--	ID int not null PRIMARY KEY,
--	Name nvarchar(50) not null,
--	ShortName nvarchar(20) not null,
--	Comments nvarchar(50),
--	Weighting int not null check (Weighting between 0 and 100),
--	ThresholdPassMark int not null check (ThresholdPassMark between 1 and 12),
--	AllowedAttempts int not null check (AllowedAttempts between 1 and 3)
--)

--GO
--CREATE TABLE StudentsOnSubjects
--(
--	StudentID int not null,
--	SubjectID int not null FOREIGN KEY(SubjectID) REFERENCES Subjects(ID),
--	CONSTRAINT FK_StudentOnSubjects_StudentID FOREIGN KEY(StudentID) REFERENCES Students(ID)
--)

--CREATE TABLE TeachersOnSubjects 
--(
--	TeacherID  int not null,
--	SubjectID int not null FOREIGN KEY(SubjectID) REFERENCES Subjects(ID),
--	CONSTRAINT FK_TeachersOnSubjects_TeacherID FOREIGN KEY(TeacherID) REFERENCES Teachers(ID)
--)


--CREATE TABLE AssessmentsOnSubjects  
--(
--	AssessmentID   int not null,
--	SubjectID int not null FOREIGN KEY(SubjectID) REFERENCES Subjects(ID),
--	CONSTRAINT FK_AssessmentsOnSubjects_AssessmentID FOREIGN KEY(AssessmentID) REFERENCES Assessments(ID)
--)

--CREATE TABLE StudentsOnAssessments   
--(
--	AssessmentID   int not null FOREIGN KEY(AssessmentID) REFERENCES Assessments(ID),
--	StudentID  int not null FOREIGN KEY(StudentID) REFERENCES Students(ID),
--	Mark int CHECK( Mark between 1 and 12),
--	[Status] NVARCHAR(5),
--	[Rank] NVARCHAR(3),
--	Attempt int not null CHECK( Attempt between 1 and 3),
--	Comments NVARCHAR(50)
--)

--CREATE TABLE StudentProgression    
--(
--	SubjectID  int not null FOREIGN KEY(SubjectID) REFERENCES Subjects(ID),
--	StudentID  int not null FOREIGN KEY(StudentID) REFERENCES Students(ID),
--	Mark int,
--	[Status] NVARCHAR(5),
--	[Rank] NVARCHAR(3),
--	Attempt int not null ,
--	Comments NVARCHAR(50)
--)




go

--INSERT INTO Students
--(ID,	Name,	Surname,	MiddleName,	DateOfBirth,	Email,	Gender,	PhoneNumber,	HomePhoneNumber,)
--VALUES
--(

--(1,	'Jack',	'Caskey',	'31.07.1996',	'j.caskey@contoso.com',	'Male',	'10 171 515 303',	'18 171 515 303'),
--(2,	'Melanie',	'Jadd',	'24.12.1998',	'm.jadd@constoso.com',	'Female',	'10 179 144 919',	'18 179 144 919'),
--(3,	'Emmy',	'Jadd'	'01.05.1998'	'e.jadd@contoso.com'	'Female'	'10 606 900 707'	'18 606 900 707'),
--(4,	'Cheap'	'Todds'	'28.02.1994'	'c.todds@contoso.com'	'Male'	'10 600 881 406'	'18 600 881 406'),
--(5,	'Fred'	'Calkin'	'18.06.1994'	'f.calkin@contoso.com'	'Male'	'10 892 711 911'	'18 892 711 911'),
--(6,	'Eva'	'Queens'	'01.01.1992'	'e.queens@contoso.com'	'Female'	'10 175 008 709'	'18 175 008 709'),
--(7,	'Johnny'	'Gannt'	'08.10.1996'	'j.gannt@contoso.com'	'Male'	'10 171 571 200'	'18 171 571 200'),
--(8,	'Mark'	'Rutergen'	'28.10.1996'	'm.rutergen@contoso.com'	'Male'	'10 179 142 300'	'18 179 142 300'),
--(9,	'Antony'	'Stamps'	'14.08.1990'	'a.stamps@contoso.com'	'Male'	'10 898 100 993'	'18 898 100 993'),
--(10	,'Mary'	'Evans'	'30.11.1990'	'm.evans@contoso.com'	'Female'	'10 173 300 505'	'18 173 300 505')

--)