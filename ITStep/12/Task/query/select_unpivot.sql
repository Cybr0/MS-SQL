SELECT fio, column_name, number
   FROM dbo.test_table_unpivot
   UNPIVOT(
          number for column_name in 
					([number1],[number2],[number3],[number4],[number5])
          )AS test_unpivot