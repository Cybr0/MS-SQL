-- �������� ���� ������ MyBooks �� ���������
USE [MyBooks]
GO
-- ������� ������� ��� �������� ���� ��������� ���������� T-SQL
IF (OBJECT_ID('Categories') IS NOT NULL)
DROP TABLE [Categories]
GO
-- ������� ������� ��� �������� ���� ��������� ���������� T-SQL
CREATE TABLE [Categories] (
    [ID] INT IDENTITY(1,1) PRIMARY KEY, -- ��� ��������� ����
	[Name] NVARCHAR(50)
)
GO
-- �������� ��� ������ �� ��������� �� �������� ������� � ����������� �� � ��������� ������� ��������� ���������� T-SQL
INSERT INTO [Categories] SELECT DISTINCT [Category] FROM [books_���������] WHERE [Category] IS NOT NULL
GO