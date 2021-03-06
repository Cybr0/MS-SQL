/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT ct.[ID] AS "Номер",
	   [Name] AS [Имя], ct.[CountryCode],
	   [District],[Population]
  FROM [mydb].[dbo].[City] AS ct
  WHERE NOT (CountryCode = 'NLD')
  ORDER BY Name DESC;
  