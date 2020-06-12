-- выбираем базу данных MyBooks по умолчанию
USE [MyBooks]
GO
-- измен€ем значение созданных в предыдущем запросе столбцов так чтобы они совпадали с идентификаторами изданий, категорий и тематик
UPDATE [books_локальна€]
SET Izd_ID = (
SELECT p.ID FROM [Publishers] AS p WHERE p.Name = Izd)
GO
UPDATE [books_локальна€]
SET Theme_ID = (
SELECT t.ID FROM [Themes] AS t WHERE t.Name = Themes)
GO
UPDATE [books_локальна€]
SET Category_ID = (
SELECT c.ID FROM [Categories] AS c WHERE c.Name = Category)
GO