-- выбираем базу данных MyBooks по умолчанию
USE [MyBooks]
GO
-- удаляем таблицу для хранения всех издателей средствами T-SQL
IF (OBJECT_ID('Publishers') IS NOT NULL)
DROP TABLE [Publishers]
GO
-- создаем таблицу для хранения всех издателей средствами T-SQL
CREATE TABLE [Publishers] (
    [ID] INT IDENTITY(1,1) PRIMARY KEY, -- это первичный ключ
	[Name] NVARCHAR(50)
)
GO
-- выбираем все данные по издателям из исходной таблицы и импортируем их в созданную таблицу издателей средствами T-SQL
INSERT INTO [Publishers] SELECT DISTINCT [Izd] FROM [books_локальная] WHERE [Izd] IS NOT NULL
GO