CREATE OR ALTER PROCEDURE dbo.sp_SetClient
    @ClientId INT = NULL OUTPUT,
    @PersonId INT = NULL
AS
BEGIN
    IF @ClientId IS NULL
    BEGIN
        IF @PersonId IS NULL
        BEGIN
            PRINT 'Invalid value of PersonId'
            RETURN
        END
    END
	IF @PersonId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.People
        WHERE PersonId = @PersonId
    )
    BEGIN
        PRINT 'Invalid PersonId'
        RETURN
    END
    BEGIN TRY
        IF @ClientId IS NULL
        BEGIN
            INSERT INTO dbo.Client (PersonId)
            VALUES (@PersonId)
            SET @ClientId = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            UPDATE dbo.Client
            SET PersonId = ISNULL(@PersonId, PersonId)
            WHERE ClientId = @ClientId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
