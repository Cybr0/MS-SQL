alter function get_data()
returns @ret_table table(name nvarchar(50), cnt int)
as
begin
	insert @ret_table select 'Some val' as name, 23 as cnt
	insert @ret_table select s.CompanyName, s.ShipperID from [Shippers] s where s.ShipperID < 2
	
	return
end

--select * from dbo.get_data();