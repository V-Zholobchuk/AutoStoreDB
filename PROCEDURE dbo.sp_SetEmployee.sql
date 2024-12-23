CREATE OR ALTER PROCEDURE dbo.sp_SetEmployee
    @EmployeeId INT = NULL OUTPUT,    
    @PersonId INT = NULL,             
    @Position NVARCHAR(50) = NULL,   
    @HireDate DATE = NULL            
AS
BEGIN
    IF @EmployeeId IS NULL
    BEGIN
        DECLARE @MissingParams NVARCHAR(MAX) = '';
        IF @PersonId IS NULL
            SET @MissingParams = @MissingParams + 'PersonId, ';
        IF @Position IS NULL
            SET @MissingParams = @MissingParams + 'Position, ';
        IF @HireDate IS NULL
            SET @MissingParams = @MissingParams + 'HireDate, ';

        IF LEN(@MissingParams) > 0
        BEGIN
            SET @MissingParams = LEFT(@MissingParams, LEN(@MissingParams) - 2);
            PRINT 'Invalid value of: ' + @MissingParams;
            RETURN;
        END
    END

    IF @PersonId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.People
        WHERE PersonId = @PersonId
    )
    BEGIN
        PRINT 'Invalid PersonId';
        RETURN;
    END

    BEGIN TRY
        IF @EmployeeId IS NULL
        BEGIN
            INSERT INTO dbo.Employee (PersonId, Position, HireDate)
            VALUES (@PersonId, @Position, @HireDate);

            SET @EmployeeId = SCOPE_IDENTITY();
        END
        ELSE
        BEGIN
            UPDATE dbo.Employee
            SET PersonId = ISNULL(@PersonId, PersonId),
                Position = ISNULL(@Position, Position),
                HireDate = ISNULL(@HireDate, HireDate)
            WHERE EmployeeId = @EmployeeId;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;
