SELECT
  'Администрация' Info,
  COUNT(DISTINCT PositionID) PositionCount,
  COUNT(*) EmplCount,
  SUM(Salary) SalaryAmount
FROM Employees
WHERE DepartmentID=1 -- данные по Администрации

SELECT
  'Бухгалтерия' Info,
  COUNT(DISTINCT PositionID) PositionCount,
  COUNT(*) EmplCount,
  SUM(Salary) SalaryAmount
FROM Employees
WHERE DepartmentID=2 -- данные по Бухгалтерии

SELECT
  'ИТ' Info,
  COUNT(DISTINCT PositionID) PositionCount,
  COUNT(*) EmplCount,
  SUM(Salary) SalaryAmount
FROM Employees
WHERE DepartmentID=3 -- данные по ИТ отделу

SELECT
  'Прочие' Info,
  COUNT(DISTINCT PositionID) PositionCount,
  COUNT(*) EmplCount,
  SUM(Salary) SalaryAmount
FROM Employees
WHERE DepartmentID IS NULL -- и еще не забываем данные по внештатникам


--применение UNION ALL
SELECT
  'Администрация' Info,
  COUNT(DISTINCT PositionID) PositionCount,
  COUNT(*) EmplCount,
  SUM(Salary) SalaryAmount
FROM Employees
WHERE DepartmentID=1 -- данные по Администрации
UNION ALL
SELECT
  'Бухгалтерия' Info,
  COUNT(DISTINCT PositionID) PositionCount,
  COUNT(*) EmplCount,
  SUM(Salary) SalaryAmount
FROM Employees
WHERE DepartmentID=2 -- данные по Бухгалтерии
UNION ALL
SELECT
  'ИТ' Info,
  COUNT(DISTINCT PositionID) PositionCount,
  COUNT(*) EmplCount,
  SUM(Salary) SalaryAmount
FROM Employees
WHERE DepartmentID=3 -- данные по ИТ отделу
UNION ALL
SELECT
  'Прочие' Info,
  COUNT(DISTINCT PositionID) PositionCount,
  COUNT(*) EmplCount,
  SUM(Salary) SalaryAmount
FROM Employees
WHERE DepartmentID IS NULL -- и еще не забываем данные по внештатникам

CREATE TABLE TopTable(
  T1 int,
  T2 varchar(10)
)
GO

CREATE TABLE BottomTable(
  B1 int,
  B2 varchar(10)
)
GO

INSERT TopTable(T1,T2)VALUES
(1,'Text 1'),
(1,'Text 1'),
(2,'Text 2'),
(3,'Text 3'),
(4,'Text 4'),
(5,'Text 5')

INSERT BottomTable(B1,B2)VALUES
(2,'Text 2'),
(3,'Text 3'),
(6,'Text 6'),
(6,'Text 6')

SELECT *
FROM TopTable

SELECT *
FROM BottomTable

--UNION ALL
SELECT T1 x,T2 y
FROM TopTable
UNION ALL
SELECT B1,B2
FROM BottomTable

--UNION
SELECT T1 x,T2 y
FROM TopTable
UNION
SELECT B1,B2
FROM BottomTable

--EXCEPT
SELECT T1 x,T2 y
FROM TopTable
EXCEPT
SELECT B1,B2
FROM BottomTable

--INTERSECT
SELECT T1 x,T2 y
FROM TopTable
INTERSECT
SELECT B1,B2
FROM BottomTable

CREATE TABLE NextTable(
  N1 int,
  N2 varchar(10)
)
GO

INSERT NextTable(N1,N2)VALUES
(1,'Text 1'),
(4,'Text 4'),
(6,'Text 6')

--приоритеты операций
SELECT T1 x,T2 y
FROM TopTable
EXCEPT
SELECT B1,B2
FROM BottomTable
INTERSECT
SELECT N1,N2
FROM NextTable

--переопределение приоритетов операций
(
  SELECT T1 x,T2 y
  FROM TopTable
  EXCEPT
  SELECT B1,B2
  FROM BottomTable
)
INTERSECT
SELECT N1,N2
FROM NextTable


--
SELECT x,y
FROM
  (
    SELECT T1 x,T2 y
    FROM TopTable
	EXCEPT
	SELECT B1,B2
    FROM BottomTable
  ) q

INTERSECT

SELECT N1,N2
FROM NextTable

SELECT T1 x,T2 y
FROM TopTable
UNION ALL
SELECT B1,B2
FROM BottomTable  
UNION ALL
SELECT B1,B2
FROM BottomTable  
ORDER BY x DESC
