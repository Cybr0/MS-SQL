/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
/*SELECT	SUM(OD.UnitPrice*OD.Quantity) as [Order SUM], 
		COUNT(OD.OrderID) as [Order count], 
		COUNT(DISTINCT OD.ProductID) as [Types]
  FROM [Northwind].[dbo].[Order Details] as OD*/

SELECT 
	N'Сумма заказов:' as Name,
	SUM(OD.UnitPrice*OD.Quantity) as Value FROM [Northwind].[dbo].[Order Details] as OD
	UNION ALL
SELECT 
	N'Количество заказов:',
	COUNT(OD.OrderID) FROM [Northwind].[dbo].[Order Details] as OD
	UNION ALL
SELECT 
	N'Уникальные товары:'  as Name,
	COUNT(DISTINCT OD.ProductID) as Value FROM [Northwind].[dbo].[Order Details] as OD
	UNION 
SELECT 
	N'Уникальные товары:'  as Name,
	COUNT(DISTINCT OD.ProductID) as Value FROM [Northwind].[dbo].[Order Details] as OD;