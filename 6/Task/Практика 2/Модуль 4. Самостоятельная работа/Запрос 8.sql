-- выбираем базу данных MyBooks по умолчанию
USE [MyBooks]
GO
-- удаляем ненужные столбцы средствами T-SQL
ALTER TABLE [books_локальная]
DROP COLUMN [Izd],[Themes],[Category]
GO
-- изменяем название исходной таблицы средствами T-SQL
EXEC sp_rename 'books_локальная', 'Books'
GO