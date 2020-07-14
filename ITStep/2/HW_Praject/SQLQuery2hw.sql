--use master
--create database SchoolLibrary
--on
--(
--	name = 'slbd',
--	filename = 'C:\codeWar\_SQL\itvdn\slbd.mdf',
--	size = 10mb,
--	maxsize = 50 mb,
--	filegrowth = 10mb
--)

--log on
--(
--	name = 'logslbd',
--	filename = 'C:\codeWar\_SQL\itvdn\lsbd.ldf',
--	size = 5 mb,
--	maxsize = 25mb,
--	filegrowth = 5 mb
--)

--use schoolLibrary
--go

--create table classifier
--(
--	id int identity not null,
--	section varchar(15),
--	[name] varchar(20),

--)

--create table PublishingHouse
--(
--	id int identity not null,
--	publisherCode varchar(15),
--	[name] varchar(25)
--)
--go

--create table Book
--(
--	id int identity not null,
--	bookCode varchar(15) null,
--	[name] varchar(25) null,
--	[publisherCode] varchar(15) null,
--	publishingYear date null,
--	classifierSection varchar(15) null
--)

--create table Author
--(
--	id int identity not null,
--	bookCode varchar(15),
--	authorCode varchar(15)
--)

--create table AuthorFullname
--(
--	id int identity not null,
--	authorCode varchar(15),
--	[name] varchar(20),
--	surname varchar(20),
--	patronymic varchar(20)
--)

--create table [Availability]
--(
--	id int identity not null,
--	bookCode varchar(15),
--	collateralValue money, --залогова€ стоимость
--	totalNumberOfCopies int, --общее количество экземпл€ров
--	numberOfAvailableInstances int --количество доступных экземпл€ров
--)

--create table Class
--(
--	id int identity not null,
--	classCode varchar(15),
--	className varchar(20),
--	[nameClassroomTeacher] varchar(20),
--	surnameClassroomTeacher varchar(20),
--	patronymicClassroomTeacher varchar(20)
--)

--create table Student
--(
--	id int identity not null,
--	classCode varchar(15),
--	[name] varchar(20),
--	surname varchar(20),
--	patronymic varchar(20),
--	collateralForBooks money
--)

--create table LibraryMovement
--(
--	id int identity not null,
--	bookCode varchar(15),
--	studentCode varchar(15),
--	dateOfIssue date,
--	HowManyDaysWasTheBookIssued int,
--	returnDate date,
--	librarianCode varchar(15)
--)

--create table Librarian
--(
--	id int identity not null,
--	librarianCode varchar(15),
--	[name] varchar(20),
--	surname varchar(20),
--	patronymic varchar(20)
--)


--create table Director
--(
--	id int identity not null,
--	directorCode [dbo].[Code],   --varchar(15)
--	name Code,
--	surname Code,
--	patronymic Code
--)
--go