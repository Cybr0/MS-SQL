CREATE TABLE Customer(
	IdCust int IDENTITY(1,1) NOT NULL,
	FName nvarchar(20) NOT NULL,
	LName nvarchar(20) NOT NULL,
	IdCity int NOT NULL,
	Address nvarchar(50) NOT NULL,
	Zip nchar(5) NOT NULL,
	Phone dbo.phone NOT NULL
);
GO
CREATE TABLE City(
   IdCity int IDENTITY(1,1) NOT NULL,
   CityName nvarchar(20) NOT NULL
);
GO
CREATE TABLE Product(
	IdProd int IDENTITY(1,1) NOT NULL,
	pDescription nvarchar(100) NOT NULL,
	InStock int NOT NULL,
);
GO
CREATE TABLE tOrder(
	IdOrd int IDENTITY(1,1) NOT NULL,
	IdCust int NOT NULL,
	OrdDate smalldatetime NOT NULL
);
GO
CREATE TABLE OrdItem(
	IdOrd int NOT NULL,
	IdProd int NOT NULL,
	Qty int NOT NULL,
	Price money NOT NULL
);