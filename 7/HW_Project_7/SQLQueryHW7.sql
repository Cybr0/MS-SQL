USE Northwind
--1.0)
SELECT C.ContactName, OD.OrderID, SUM(OD.UnitPrice * OD.Quantity *(1 - OD.Discount)) AS [Total price] FROM Customers C
JOIN
Orders O
ON C.CustomerID = O.CustomerID
JOIN 
[Order Details] OD
ON O.OrderID = OD.OrderID
WHERE C.ContactName LIKE 'HORST K%'
GROUP BY OD.OrderID, C.ContactName

--1.1)
SELECT *FROM Customers C
JOIN
Orders O
ON C.CustomerID = O.CustomerID
JOIN 
[Order Details] OD
ON O.OrderID = OD.OrderID
WHERE C.ContactName LIKE 'HORST K%'

--2.0)
SELECT E.EmployeeID, E.FirstName, E.LastName, SUM(ODE.ExtendedPrice) [Total] FROM Employees E
LEFT JOIN Orders O
ON E.EmployeeID = O.EmployeeID
LEFT JOIN [Order Details Extended] ODE
ON O.OrderID = ODE.OrderID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY Total DESC

--3.0)
SELECT * FROM [Orders] O
WHERE O.ShippedDate BETWEEN '01/08/1996' AND '31/08/1996'

--3.1)
SELECT 'Count of "Shipped" from 01/08/1996 to 31/08/1996:' as [Order],COUNT(*)[Count] FROM [Orders] O
WHERE O.ShippedDate BETWEEN '01/08/1996' AND '31/08/1996'

--4.0)
SELECT P.ProductID, P.ProductName, SUM(OD.Quantity) [Quantity], SUM(OD.ExtendedPrice) [Total Price]
FROM Products P
LEFT OUTER JOIN
[Order Details Extended] OD
ON P.ProductID = OD.ProductID
LEFT OUTER JOIN
[Orders] O
ON OD.OrderID = O.OrderID
where O.ShippedDate BETWEEN '01.05.1998' AND '31.05.1998'
GROUP BY P.ProductID, P.ProductName
order by [Total Price] desc

--4.1)
SELECT P.ProductID, P.ProductName, O.ShippedDate, OD.Quantity [Quantity], OD.ExtendedPrice [Total Price]
FROM Products P
LEFT OUTER JOIN
[Order Details Extended] OD
ON P.ProductID = OD.ProductID
LEFT OUTER JOIN
[Orders] O
ON OD.OrderID = O.OrderID
where O.ShippedDate BETWEEN '01.05.1998' AND '31.05.1998'
order by [Total Price] desc

--5.0)
SELECT TOP 3 
E.EmployeeID,E.FirstName, E.LastName, COUNT(DISTINCT C.CustomerID) [Count of customers]
FROM Employees E
LEFT OUTER JOIN Orders O
ON E.EmployeeID = O.EmployeeID
LEFT OUTER JOIN Customers C
ON O.CustomerID = C.CustomerID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY [Count of customers] DESC

----5.0.2) œ–Œ¬≈– ¿
--SELECT E.EmployeeID, C.CustomerID 
--FROM Employees E
--LEFT OUTER JOIN Orders O
--ON E.EmployeeID = O.EmployeeID
--LEFT OUTER JOIN Customers C
--ON O.CustomerID = C.CustomerID
--ORDER BY E.EmployeeID, C.CustomerID
