CREATE OR ALTER PROCEDURE dbo.sp_GetEngineType
    @EngineTypeId INT = NULL,
    @EngineTypeName NVARCHAR(50) = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.EngineType WHERE EngineTypeId = @EngineTypeId)
    BEGIN
        PRINT 'Запису з індитифікатором не існує'
        RETURN
    END
    SELECT *
    FROM dbo.EngineType
    WHERE EngineTypeId = @EngineTypeId
       OR @EngineTypeId IS NULL
      AND EngineTypeName LIKE @EngineTypeName + '%'
       OR @EngineTypeName IS NULL
END
