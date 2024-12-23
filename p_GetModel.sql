CREATE OR ALTER PROCEDURE dbo.sp_GetModel
    @ModelId INT = NULL,
    @ModelName NVARCHAR(80) = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Model WHERE ModelId = @ModelId)
    BEGIN
        PRINT 'Запису з індитифікатором не існує'
        RETURN
    END
    SELECT *
    FROM dbo.Model
    WHERE ModelId = @ModelId
       OR @ModelId IS NULL
      AND ModelName LIKE @ModelName + '%'
       OR @ModelName IS NULL
END
