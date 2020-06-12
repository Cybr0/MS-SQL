SET IDENTITY_INSERT Departments ON
INSERT Departments(ID,Name) VALUES(5,N'Маркетинг и реклама')
INSERT Departments(ID,Name) VALUES(6,N'Логистика')
SET IDENTITY_INSERT Departments OFF

SET IDENTITY_INSERT Positions ON
INSERT Positions(ID,Name) VALUES(5,N'Маркетолог')
INSERT Positions(ID,Name) VALUES(6,N'Логист')
INSERT Positions(ID,Name) VALUES(7,N'Кладовщик')
SET IDENTITY_INSERT Positions OFF

-- JOIN вернет 5 строк
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
JOIN Departments dep ON emp.DepartmentID=dep.ID

SELECT * FROM Employees
SELECT * FROM Departments

-- LEFT JOIN вернет 7 строк
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
LEFT JOIN Departments dep ON emp.DepartmentID=dep.ID

-- RIGHT JOIN вернет 8 строк
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
RIGHT JOIN Departments dep ON emp.DepartmentID=dep.ID

-- FULL JOIN вернет 10 строк
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
FULL JOIN Departments dep ON emp.DepartmentID=dep.ID

-- CROSS JOIN вернет 30 строк - (6 строк таблицы Employees) * (5 строк таблицы Departments)
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
CROSS JOIN Departments dep

--самосоединение
SELECT
  e1.ID EmpID1,
  e1.Name EmpName1,
  e2.ID EmpID2,
  e2.Name EmpName2   
FROM Employees e1
LEFT JOIN Employees e2 ON e1.ID=e2.ID+1 -- получить данные предыдущего сотрудника


CREATE TABLE LeftTable(
  LCode int,
  LDescr varchar(10)
)
GO

CREATE TABLE RightTable(
  RCode int,
  RDescr varchar(10)
)
GO

INSERT LeftTable(LCode,LDescr)VALUES
(1,'L-1'),
(2,'L-2'),
(3,'L-3'),
(5,'L-5')

INSERT RightTable(RCode,RDescr)VALUES
(2,'B-2'),
(3,'B-3'),
(4,'B-4')

SELECT * FROM LeftTable

SELECT * FROM RightTable


SELECT l.*,r.*
FROM LeftTable l
JOIN RightTable r ON l.LCode=r.RCode

--соединение трех и более таблиц
SELECT
  e.ID,
  e.Name EmployeeName,
  p.Name PositionName,
  d.Name DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID=d.ID
LEFT JOIN Positions p ON e.PositionID=p.ID

--использование условий и сортировки
SELECT
  e.ID, -- 1. идентификатор сотрудника
  e.Name EmployeeName, -- 2. имя сотрудника
  p.Name PositionName, -- 3. название должности
  d.Name DepartmentName -- 4. название отдела
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID=d.ID
LEFT JOIN Positions p ON e.PositionID=p.ID
WHERE d.ID=3 -- используем поля из поле ID из Departments
  AND p.ID=3 -- используем для фильтрации поле ID из Positions
ORDER BY e.Name -- используем для сортировки поле Name из Employees

--применение группировки
SELECT
  ISNULL(dep.Name,'Прочие') DepName,
  COUNT(DISTINCT emp.PositionID) PositionCount,
  COUNT(*) EmplCount,
  SUM(emp.Salary) SalaryAmount,
  AVG(emp.Salary) SalaryAvg -- плюс выполняем пожелание директора
FROM

    /* источник - начало */
    Employees emp
    LEFT JOIN Departments dep ON emp.DepartmentID=dep.ID
    /* источник - конец */

GROUP BY emp.DepartmentID,dep.Name
ORDER BY DepName


--CROSS JOIN
SELECT
  d.Name DepartmentName,
  p.Name PositionName,
  e.EmplCount
FROM Departments d
CROSS JOIN Positions p
LEFT JOIN
  (
    /*
      здесь я использовал подзапрос для подсчета сотрудников
      в разрезе групп (DepartmentID,PositionID)
    */
    SELECT DepartmentID,PositionID,COUNT(*) EmplCount
    FROM Employees
    GROUP BY DepartmentID,PositionID
  ) e
ON e.DepartmentID=d.ID AND e.PositionID=p.ID
ORDER BY DepartmentName,PositionName

SELECT DepartmentID,PositionID,COUNT(*) EmplCount
FROM Employees
GROUP BY DepartmentID,PositionID


--сравнение JOIN и соединения через WHERE
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
JOIN Departments dep ON emp.DepartmentID=dep.ID -- условие соединения таблиц
WHERE emp.DepartmentID=3 -- условие фильтрации данных

--сравнение JOIN и соединения через WHERE
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM
  Employees emp,
  Departments dep
WHERE emp.DepartmentID=dep.ID -- условие соединения таблиц
  AND emp.DepartmentID=3 -- условие фильтрации данных
  
--CROSS JOIN
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
CROSS JOIN Departments dep -- декартово соединение (соединение без условия)
WHERE emp.DepartmentID=3 -- условие фильтрации данных

SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM
  Employees emp,
  Departments dep
WHERE emp.DepartmentID=3 -- условие фильтрации данных
