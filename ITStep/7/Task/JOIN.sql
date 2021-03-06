/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
/*SELECT O.[ShipName],O.[ShipAddress],O.[ShipCity],
      C.CompanyName, SH.CompanyName, E.FirstName+' '+E.LastName,
	  OD.Quantity, OD.UnitPrice, P.ProductName, CAT.CategoryName
  FROM [Northwind].[dbo].[Orders] as O
  INNER JOIN [Northwind].[dbo].Customers C ON C.CustomerID=O.CustomerID
  INNER JOIN [Northwind].[dbo].Shippers SH ON SH.ShipperID=O.ShipVia
  INNER JOIN [Northwind].[dbo].Employees E ON E.EmployeeID=O.EmployeeID
  INNER JOIN [Northwind].[dbo].[Order Details] OD ON OD.OrderID=O.OrderID
  INNER JOIN [Northwind].[dbo].Products P ON P.ProductID=OD.ProductID
  INNER JOIN [Northwind].[dbo].Categories CAT ON CAT.CategoryID=P.CategoryID
  WHERE (OD.Quantity*OD.UnitPrice)>500.00;*/

  SELECT O.[ShipName],O.[ShipAddress],O.[ShipCity],
      C.CompanyName, SH.CompanyName, E.FirstName+' '+E.LastName,
	  OD.Quantity, OD.UnitPrice, P.ProductName, CAT.CategoryName
  FROM	[Northwind].[dbo].[Orders] as O,
		[Northwind].[dbo].Customers as C,
		[Northwind].[dbo].Shippers as SH, 
		[Northwind].[dbo].Employees as E,
		[Northwind].[dbo].[Order Details] as OD ,
		[Northwind].[dbo].Products as P, 
		[Northwind].[dbo].Categories as CAT
  WHERE (C.CustomerID=O.CustomerID) AND (SH.ShipperID=O.ShipVia) AND
		(E.EmployeeID=O.EmployeeID) AND (OD.OrderID=O.OrderID) AND
		(P.ProductID=OD.ProductID) AND (CAT.CategoryID=P.CategoryID) AND
		(OD.Quantity*OD.UnitPrice)>500.00;
