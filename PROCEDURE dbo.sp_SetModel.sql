CREATE OR ALTER PROCEDURE dbo.sp_SetModel
    @ModelId INT = NULL OUTPUT,
    @ModelName NVARCHAR(80) = NULL,
    @ModelYear INT = NULL,
    @Description NVARCHAR(150) = NULL
AS
BEGIN
    IF @ModelName IS NULL
    BEGIN
        PRINT 'Invalid value of: ModelName '
        RETURN
    END

    BEGIN TRY
        IF @ModelId IS NULL
        BEGIN
            INSERT INTO dbo.Model (ModelName, ModelYear, Description)
            VALUES (@ModelName, @ModelYear, @Description)

            SET @ModelId = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            UPDATE dbo.Model
            SET ModelName = ISNULL(@ModelName, ModelName),
                ModelYear = ISNULL(@ModelYear, ModelYear),
                Description = ISNULL(@Description, Description)
            WHERE ModelId = @ModelId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
