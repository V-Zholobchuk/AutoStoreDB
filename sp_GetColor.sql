CREATE OR ALTER PROCEDURE dbo.sp_GetColor
    @ColorId INT = NULL,
    @NameColor NVARCHAR(70) = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Color WHERE ColorId = @ColorId)
    BEGIN
        PRINT 'Запису з індитифікатором не існує'
        RETURN
    END
    SELECT *
    FROM dbo.Color
    WHERE ColorId = @ColorId
       OR @ColorId IS NULL
      AND NameColor LIKE @NameColor + '%'
       OR @NameColor IS NULL
END
