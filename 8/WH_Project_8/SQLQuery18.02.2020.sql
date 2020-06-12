--create database Agency
--use master
--drop table Tours
--drop table Countries
--drop table Tours_Countries
--drop table Clients
use Agency
CREATE TABLE Tours
(
	TourCode int identity not null,
	[Name] nvarchar(50) NOT NULL,
	Price money NOT NULL,
	Duration int NOT NULL,
	PRIMARY KEY (TourCode)
)

CREATE TABLE Countries
(
	CountrCode int identity not null,
	[Name] nvarchar(50) NOT NULL UNIQUE,
	PRIMARY KEY (CountrCode)
)

CREATE TABLE Tours_Countries
(
	CountrCode int not null,
	TourCode int not null
)

alter table Tours_Countries
ADD constraint FK_Tours_Countries_CountrCode foreign key (CountrCode) REFERENCES Countries(CountrCode)

alter table Tours_Countries
ADD constraint FK_Tours_Countries_TourCode foreign key (TourCode) REFERENCES Tours(TourCode)

CREATE TABLE Clients
(
	ClientCode int identity not null,
	FullName NVARCHAR(50) DEFAULT 'Full Name',
	Adress NVARCHAR(50) DEFAULT 'Adress',
	Phone NVARCHAR(11) CHECK(Phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Gender NVARCHAR(6),
	Birthday DATE not null,--DEFAULT CAST(GETDATE() AS DATE),
	Passport NVARCHAR(30) NOT NULL,
	DateOfIssue Date not null
	PRIMARY KEY(ClientCode)
)

CREATE TABLE Staff
(
	StaffCode int identity not null,
	FullName NVARCHAR(50) DEFAULT 'Full Name',
	PRIMARY KEY(StaffCode)
)

CREATE TABLE CashBox
(
	StaffCode int not null,
	ClientCode int not null,
	Amount MONEY NOT NULL,
	[Date] Date DEFAULT CAST(GETDATE() AS DATE),
	TourCode int not null
)

CREATE TABLE [Services]
(
	ServiceCode int PRIMARY KEY IDENTITY NOT NULL,
	[Name] nvarchar(50)
)

CREATE TABLE Contracts
(
	ContractCode int PRIMARY KEY IDENTITY NOT NULL,
	ClientCode int not null,
	StaffCode int not null,
	TourCode int not null,
	DateOfTourBegin DATE NOT NULL,
	DateOfTourEnd DATE NOT NULL
)

CREATE TABLE Contract_Service
(
	ContractCode int NOT NULL,
	ServiceCode int NOT NULL
)


