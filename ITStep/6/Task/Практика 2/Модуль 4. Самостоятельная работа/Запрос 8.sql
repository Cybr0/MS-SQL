-- �������� ���� ������ MyBooks �� ���������
USE [MyBooks]
GO
-- ������� �������� ������� ���������� T-SQL
ALTER TABLE [books_���������]
DROP COLUMN [Izd],[Themes],[Category]
GO
-- �������� �������� �������� ������� ���������� T-SQL
EXEC sp_rename 'books_���������', 'Books'
GO