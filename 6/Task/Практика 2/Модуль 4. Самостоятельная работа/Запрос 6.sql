-- выбираем базу данных MyBooks по умолчанию
USE [MyBooks]
GO
-- изменим исходную таблицу средствами T-SQL
ALTER TABLE [books_локальная]
ADD Izd_ID INT NULL, Theme_ID INT NULL, Category_ID INT NULL
GO