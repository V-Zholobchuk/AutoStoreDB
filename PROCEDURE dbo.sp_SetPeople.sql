CREATE OR ALTER  PROCEDURE dbo.sp_SetPeople
    @PersonId INT = NULL OUTPUT,
    @FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @Phone NVARCHAR(15) = NULL,
    @Email NVARCHAR(100) = NULL
AS
BEGIN
    DECLARE @MissingParams NVARCHAR(MAX) = ''
    IF @FirstName IS NULL
        SET @MissingParams = @MissingParams + 'FirstName , '
    IF @LastName IS NULL
        SET @MissingParams = @MissingParams + 'LastName , '

    IF LEN(@MissingParams) > 0
    BEGIN
        SET @MissingParams = LEFT(@MissingParams, LEN(@MissingParams) - 2)
        
        PRINT 'Invalid value of: ' + @MissingParams
        RETURN
    END
    BEGIN TRY
        IF @PersonId IS NULL
        BEGIN
            SET @PersonId = 1 + (SELECT TOP(1) PersonId FROM dbo.People ORDER BY PersonId DESC)

            INSERT dbo.People( FirstName, LastName, Phone, Email)
            VALUES(@FirstName, @LastName, @Phone, @Email)
        END
        ELSE
            UPDATE  dbo.People
            SET FirstName = ISNULL(@FirstName, FirstName),
                LastName = ISNULL(@LastName, LastName),
                Phone = ISNULL(@Phone, Phone),
                Email = ISNULL(@Email, Email)
            WHERE PersonId = @PersonId
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
