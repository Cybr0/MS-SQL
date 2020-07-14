SELECT fio, [2011], [2012], [2013], [2014], [2015]
   FROM dbo.test_table_pivot
   PIVOT (
		SUM(summa)for god in ([2011],[2012],[2013],[2014],[2015])
   ) AS test_pivot