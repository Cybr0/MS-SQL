--создание хранимой процедуры с передачей параметра 
Create Procedure Books_By_Theme
@Name varchar(25)
As
	Select books.name, themes.name
	from books,themes
	where books.id_theme=themes.id and 
	themes.name like @Name


--вызов хранимой процедуры с указанием передаваемого параметра
execute Books_By_Theme '[Г-М]%'

--служебная хранимая процедура, позволяющая просмотреть синтаксис запроса для создания хранимой процедуры
Execute sp_helptext Books_By_Theme


