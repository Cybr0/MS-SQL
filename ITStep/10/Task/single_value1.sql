create function get_max
(
	@a int, @b int
)
returns int
as
begin
	if(@a > @b)
	begin
		return @a
	end
	return @b
end

--select dbo.get_max(5,6);