CREATE OR ALTER PROCEDURE dbo.sp_SetEngineTypee
    @EngineTypeId INT = NULL OUTPUT,
    @EngineTypeName NVARCHAR(50) = NULL,
    @EngineVolume DECIMAL(5, 2) = NULL,
    @Description NVARCHAR(200) = NULL
AS
BEGIN
    IF @EngineTypeId IS NULL
    BEGIN
        DECLARE @MissingParams NVARCHAR(MAX) = '';
        IF @EngineTypeName IS NULL
            SET @MissingParams = @MissingParams + 'EngineTypeName, ';
        IF @EngineVolume IS NULL
            SET @MissingParams = @MissingParams + 'EngineVolume, ';

        IF LEN(@MissingParams) > 0
        BEGIN
            SET @MissingParams = LEFT(@MissingParams, LEN(@MissingParams) - 2);
            PRINT 'Invalid value of: ' + @MissingParams;
            RETURN;
        END
    END

    BEGIN TRY
        IF @EngineTypeId IS NULL
        BEGIN
            INSERT INTO dbo.EngineType (EngineTypeName, EngineVolume, [Description])
            VALUES (@EngineTypeName, @EngineVolume, @Description);

            SET @EngineTypeId = SCOPE_IDENTITY();
        END
      
        ELSE
        BEGIN
            UPDATE dbo.EngineType
            SET EngineTypeName = ISNULL(@EngineTypeName, EngineTypeName),
                EngineVolume = ISNULL(@EngineVolume, EngineVolume),
                [Description] = ISNULL(@Description, [Description])
            WHERE EngineTypeId = @EngineTypeId;
        END
    END TRY
    BEGIN CATCH
       
        PRINT ERROR_MESSAGE();
    END CATCH
END
