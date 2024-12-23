CREATE OR ALTER PROCEDURE dbo.sp_GetAccessories
    @AccessoryId INT = NULL,
    @AccessoryName NVARCHAR(100) = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Accessories WHERE AccessoryId = @AccessoryId)
    BEGIN
        PRINT 'Запису з індитифікатором не існує'
        RETURN
    END
    SELECT *
    FROM dbo.Accessories
    WHERE AccessoryId = @AccessoryId
       OR @AccessoryId IS NULL
      AND AccessoryName LIKE @AccessoryName + '%'
       OR @AccessoryName IS NULL
END
