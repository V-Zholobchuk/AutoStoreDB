CREATE OR ALTER PROCEDURE dbo.sp_SetMarka
    @MarkaId INT = NULL OUTPUT,             
    @MarkaName NVARCHAR(50) = NULL,         
    @Description NVARCHAR(150) = NULL     
AS
BEGIN
    IF @MarkaId IS NULL
    BEGIN
        IF @MarkaName IS NULL
        BEGIN
            PRINT 'Invalid value of: MarkaName ';
            RETURN;
        END
    END

    BEGIN TRY
        
        IF @MarkaId IS NULL
        BEGIN
            INSERT INTO dbo.Marka (MarkaName, [Description])
            VALUES (@MarkaName, @Description);

            SET @MarkaId = SCOPE_IDENTITY();
           
        END
       
        ELSE
        BEGIN
            UPDATE dbo.Marka
            SET MarkaName = ISNULL(@MarkaName, MarkaName),
                [Description] = ISNULL(@Description, [Description])
            WHERE MarkaId = @MarkaId;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;
