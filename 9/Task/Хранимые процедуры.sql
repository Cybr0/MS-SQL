--�������� �������� ��������� � ��������� ��������� 
Create Procedure Books_By_Theme
@Name varchar(25)
As
	Select books.name, themes.name
	from books,themes
	where books.id_theme=themes.id and 
	themes.name like @Name


--����� �������� ��������� � ��������� ������������� ���������
execute Books_By_Theme '[�-�]%'

--��������� �������� ���������, ����������� ����������� ��������� ������� ��� �������� �������� ���������
Execute sp_helptext Books_By_Theme


