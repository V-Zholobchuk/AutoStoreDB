CREATE OR ALTER PROCEDURE dbo.sp_SetAccessories
    @AccessoryId INT = NULL OUTPUT,
    @AccessoryName NVARCHAR(100) = NULL,
    @Description NVARCHAR(1000) = NULL,
    @AvailabilityId INT = NULL
AS
BEGIN
    IF @AccessoryId IS NULL
    BEGIN
        IF @AccessoryName IS NULL OR @AvailabilityId IS NULL
        BEGIN
            PRINT 'Invalid value of AccessoryName or AvailabilityId'
            RETURN
        END
    END
	 IF @AvailabilityId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.Availability
        WHERE AvailabilityId = @AvailabilityId
    )
    BEGIN
        PRINT 'Invalid AvailabilityId'
        RETURN
    END
    BEGIN TRY
        IF @AccessoryId IS NULL
        BEGIN
            INSERT INTO dbo.Accessories (AccessoryName, Description, AvailabilityId)
            VALUES (@AccessoryName, @Description, @AvailabilityId)
            SET @AccessoryId = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            UPDATE dbo.Accessories
            SET AccessoryName = ISNULL(@AccessoryName, AccessoryName),
                Description = ISNULL(@Description, Description),
                AvailabilityId = ISNULL(@AvailabilityId, AvailabilityId)
            WHERE AccessoryId = @AccessoryId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
