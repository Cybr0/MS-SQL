Create function UsersNum ()
returns int
as
begin
Declare @c int
Select @c=count(Distinct(loginame)) from sysprocesses
return @c
end

select dbo.UsersNum();