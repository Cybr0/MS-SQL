-- �������� ���� ������ MyBooks �� ���������
USE [MyBooks]
GO
-- ������� ������� ��� �������� ���� ������� ���������� T-SQL
IF (OBJECT_ID('Themes') IS NOT NULL)
DROP TABLE [Themes]
GO
-- ������� ������� ��� �������� ���� ������� ���������� T-SQL
CREATE TABLE [Themes] (
    [ID] INT IDENTITY(1,1) PRIMARY KEY, -- ��� ��������� ����
	[Name] NVARCHAR(50)
)
GO
-- �������� ��� ������ �� ��������� �� �������� ������� � ����������� �� � ��������� ������� ������� ���������� T-SQL
INSERT INTO [Themes] SELECT DISTINCT [Themes] FROM [books_���������] WHERE [Themes] IS NOT NULL
GO