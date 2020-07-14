-- выбираем базу данных MyBooks по умолчанию
USE [MyBooks]
GO
-- удаляем таблицу для хранения всех тематик средствами T-SQL
IF (OBJECT_ID('Themes') IS NOT NULL)
DROP TABLE [Themes]
GO
-- создаем таблицу для хранения всех тематик средствами T-SQL
CREATE TABLE [Themes] (
    [ID] INT IDENTITY(1,1) PRIMARY KEY, -- это первичный ключ
	[Name] NVARCHAR(50)
)
GO
-- выбираем все данные по издателям из исходной таблицы и импортируем их в созданную таблицу тематик средствами T-SQL
INSERT INTO [Themes] SELECT DISTINCT [Themes] FROM [books_локальная] WHERE [Themes] IS NOT NULL
GO