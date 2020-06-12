/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT * FROM [mydb].[dbo].[Country]
--where (Population > 100000) AND (Population < 1000000);
--where Population BETWEEN 100000 AND 1000000;
where Code in (
	select DISTINCT CountryCode 
	FROM [mydb].[dbo].[CountryLanguage]
	WHERE (Language ='English') AND (isOfficial='1')
);

