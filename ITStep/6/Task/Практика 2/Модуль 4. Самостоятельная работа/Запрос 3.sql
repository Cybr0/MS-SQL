-- выбираем базу данных MyBooks по умолчанию
USE [MyBooks]
GO
-- удаляем таблицу для хранения всех категорий средствами T-SQL
IF (OBJECT_ID('Categories') IS NOT NULL)
DROP TABLE [Categories]
GO
-- создаем таблицу для хранения всех категорий средствами T-SQL
CREATE TABLE [Categories] (
    [ID] INT IDENTITY(1,1) PRIMARY KEY, -- это первичный ключ
	[Name] NVARCHAR(50)
)
GO
-- выбираем все данные по издателям из исходной таблицы и импортируем их в созданную таблицу категорий средствами T-SQL
INSERT INTO [Categories] SELECT DISTINCT [Category] FROM [books_локальная] WHERE [Category] IS NOT NULL
GO