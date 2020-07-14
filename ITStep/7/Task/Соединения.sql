SET IDENTITY_INSERT Departments ON
INSERT Departments(ID,Name) VALUES(5,N'��������� � �������')
INSERT Departments(ID,Name) VALUES(6,N'���������')
SET IDENTITY_INSERT Departments OFF

SET IDENTITY_INSERT Positions ON
INSERT Positions(ID,Name) VALUES(5,N'����������')
INSERT Positions(ID,Name) VALUES(6,N'������')
INSERT Positions(ID,Name) VALUES(7,N'���������')
SET IDENTITY_INSERT Positions OFF

-- JOIN ������ 5 �����
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
JOIN Departments dep ON emp.DepartmentID=dep.ID

SELECT * FROM Employees
SELECT * FROM Departments

-- LEFT JOIN ������ 7 �����
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
LEFT JOIN Departments dep ON emp.DepartmentID=dep.ID

-- RIGHT JOIN ������ 8 �����
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
RIGHT JOIN Departments dep ON emp.DepartmentID=dep.ID

-- FULL JOIN ������ 10 �����
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
FULL JOIN Departments dep ON emp.DepartmentID=dep.ID

-- CROSS JOIN ������ 30 ����� - (6 ����� ������� Employees) * (5 ����� ������� Departments)
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
CROSS JOIN Departments dep

--��������������
SELECT
  e1.ID EmpID1,
  e1.Name EmpName1,
  e2.ID EmpID2,
  e2.Name EmpName2   
FROM Employees e1
LEFT JOIN Employees e2 ON e1.ID=e2.ID+1 -- �������� ������ ����������� ����������


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

--���������� ���� � ����� ������
SELECT
  e.ID,
  e.Name EmployeeName,
  p.Name PositionName,
  d.Name DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID=d.ID
LEFT JOIN Positions p ON e.PositionID=p.ID

--������������� ������� � ����������
SELECT
  e.ID, -- 1. ������������� ����������
  e.Name EmployeeName, -- 2. ��� ����������
  p.Name PositionName, -- 3. �������� ���������
  d.Name DepartmentName -- 4. �������� ������
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID=d.ID
LEFT JOIN Positions p ON e.PositionID=p.ID
WHERE d.ID=3 -- ���������� ���� �� ���� ID �� Departments
  AND p.ID=3 -- ���������� ��� ���������� ���� ID �� Positions
ORDER BY e.Name -- ���������� ��� ���������� ���� Name �� Employees

--���������� �����������
SELECT
  ISNULL(dep.Name,'������') DepName,
  COUNT(DISTINCT emp.PositionID) PositionCount,
  COUNT(*) EmplCount,
  SUM(emp.Salary) SalaryAmount,
  AVG(emp.Salary) SalaryAvg -- ���� ��������� ��������� ���������
FROM

    /* �������� - ������ */
    Employees emp
    LEFT JOIN Departments dep ON emp.DepartmentID=dep.ID
    /* �������� - ����� */

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
      ����� � ����������� ��������� ��� �������� �����������
      � ������� ����� (DepartmentID,PositionID)
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


--��������� JOIN � ���������� ����� WHERE
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
JOIN Departments dep ON emp.DepartmentID=dep.ID -- ������� ���������� ������
WHERE emp.DepartmentID=3 -- ������� ���������� ������

--��������� JOIN � ���������� ����� WHERE
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM
  Employees emp,
  Departments dep
WHERE emp.DepartmentID=dep.ID -- ������� ���������� ������
  AND emp.DepartmentID=3 -- ������� ���������� ������
  
--CROSS JOIN
SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM Employees emp
CROSS JOIN Departments dep -- ��������� ���������� (���������� ��� �������)
WHERE emp.DepartmentID=3 -- ������� ���������� ������

SELECT emp.ID,emp.Name,emp.DepartmentID,dep.ID,dep.Name
FROM
  Employees emp,
  Departments dep
WHERE emp.DepartmentID=3 -- ������� ���������� ������
