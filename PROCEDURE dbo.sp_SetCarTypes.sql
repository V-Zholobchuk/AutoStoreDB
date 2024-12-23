CREATE OR ALTER PROCEDURE dbo.sp_SetCarTypes
    @CarTypeId INT = NULL OUTPUT,
    @TypeName NVARCHAR(50) = NULL,
    @Description NVARCHAR(150) = NULL
AS
BEGIN
    IF @CarTypeId IS NULL
    BEGIN
        IF @TypeName IS NULL
        BEGIN
            PRINT 'Invalid value of TypeName'
            RETURN
        END
    END

    BEGIN TRY
        IF @CarTypeId IS NULL
        BEGIN
            INSERT INTO dbo.CarTypes (TypeName, Description)
            VALUES (@TypeName, @Description)
            SET @CarTypeId = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            UPDATE dbo.CarTypes
            SET TypeName = ISNULL(@TypeName, TypeName),
                Description = ISNULL(@Description, Description)
            WHERE CarTypeId = @CarTypeId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
