-- выбираем базу данных MyBooks по умолчанию
USE [MyBooks]
GO
-- добавляем информацию по внешним ключам переименованной таблицы средствами T-SQL
ALTER TABLE [Books]
ADD
CONSTRAINT FK_Books_Publishers FOREIGN KEY (Izd_ID)
REFERENCES [Publishers] (ID)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT FK_Books_Categories FOREIGN KEY (Category_ID)
REFERENCES [Categories] (ID)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT FK_Books_Themes FOREIGN KEY (Theme_ID)
REFERENCES [Themes] (ID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO