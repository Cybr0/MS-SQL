Create Trigger Show_Upd_Amm
On Books
For Update
As 
	raiserror('���� �������� %d �������',0,1,@@rowcount)


Update books
Set books.Price=books.Price+5
From press
Where books.id_press=press.id
and press.name like '%BHV%'
