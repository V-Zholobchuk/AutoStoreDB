EXEC dbo.sp_SetCarTypes
@TypeName = 'Sports car'

SELECT * FROM dbo.CarTypes


EXEC dbo.sp_SetCarTypes
    @CarTypeId = 5,
    @Description = 'A fast, stylish car built for performance, agility, and driving excitement.';

	SELECT * FROM dbo.CarTypes