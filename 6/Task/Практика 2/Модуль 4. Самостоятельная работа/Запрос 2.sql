-- �������� ���� ������ MyBooks �� ���������
USE [MyBooks]
GO
-- ������� ������� ��� �������� ���� ��������� ���������� T-SQL
IF (OBJECT_ID('Publishers') IS NOT NULL)
DROP TABLE [Publishers]
GO
-- ������� ������� ��� �������� ���� ��������� ���������� T-SQL
CREATE TABLE [Publishers] (
    [ID] INT IDENTITY(1,1) PRIMARY KEY, -- ��� ��������� ����
	[Name] NVARCHAR(50)
)
GO
-- �������� ��� ������ �� ��������� �� �������� ������� � ����������� �� � ��������� ������� ��������� ���������� T-SQL
INSERT INTO [Publishers] SELECT DISTINCT [Izd] FROM [books_���������] WHERE [Izd] IS NOT NULL
GO