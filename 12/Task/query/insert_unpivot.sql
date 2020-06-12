USE [Sales]
GO

INSERT INTO [dbo].[test_table_unpivot]
           ([fio]
           ,[number1]
           ,[number2]
           ,[number3]
           ,[number4]
           ,[number5])
     VALUES
           ('John'
           ,123
           ,1234
           ,12345
           ,123456
           ,1234567)
GO


