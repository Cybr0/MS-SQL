create function get_co_list2()
returns table
as
return(
	select c.CompanyName, c.Address
	from dbo.Customers c
)

select * from dbo.get_co_list2() where CompanyName like 'A%'