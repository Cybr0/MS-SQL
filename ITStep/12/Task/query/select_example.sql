SELECT fio, god, sum(summa) AS summa 
   FROM dbo.test_table_pivot
   GROUP BY fio, god

SELECT fio, god, sum(summa) as summa 
   FROM dbo.test_table_pivot
   GROUP BY fio, god
   ORDER BY fio, god