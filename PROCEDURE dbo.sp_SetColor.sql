CREATE OR ALTER PROCEDURE dbo.sp_SetColor
    @ColorId INT = NULL OUTPUT,
    @NameColor NVARCHAR(70) = NULL,
    @Description NVARCHAR(150) = NULL
AS
BEGIN
    IF @ColorId IS NULL
    BEGIN
        IF @NameColor IS NULL
        BEGIN
            PRINT 'Invalid value of NameColor'
            RETURN
        END
    END

    BEGIN TRY
        IF @ColorId IS NULL
        BEGIN
            INSERT INTO dbo.Color (NameColor, Description)
            VALUES (@NameColor, @Description)
            SET @ColorId = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            UPDATE dbo.Color
            SET NameColor = ISNULL(@NameColor, NameColor),
                Description = ISNULL(@Description, Description)
            WHERE ColorId = @ColorId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
