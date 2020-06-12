-- �������� ���� ������ MyBooks �� ���������
USE [MyBooks]
GO
-- �������� �������� ��������� � ���������� ������� �������� ��� ����� ��� ��������� � ���������������� �������, ��������� � �������
UPDATE [books_���������]
SET Izd_ID = (
SELECT p.ID FROM [Publishers] AS p WHERE p.Name = Izd)
GO
UPDATE [books_���������]
SET Theme_ID = (
SELECT t.ID FROM [Themes] AS t WHERE t.Name = Themes)
GO
UPDATE [books_���������]
SET Category_ID = (
SELECT c.ID FROM [Categories] AS c WHERE c.Name = Category)
GO