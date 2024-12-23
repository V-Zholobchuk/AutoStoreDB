CREATE OR ALTER PROCEDURE dbo.sp_GetCarTypes
    @CarTypeId INT = NULL,
    @TypeName NVARCHAR(50) = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.CarTypes WHERE CarTypeId = @CarTypeId)
    BEGIN
        PRINT 'Запису з індитифікатором не існує'
        RETURN
    END
    SELECT *
    FROM dbo.CarTypes
    WHERE CarTypeId = @CarTypeId
       OR @CarTypeId IS NULL
      AND TypeName LIKE @TypeName + '%'
       OR @TypeName IS NULL
END
