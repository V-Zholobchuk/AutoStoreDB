CREATE OR ALTER PROCEDURE dbo.sp_SetAvailability
    @AvailabilityId INT = NULL OUTPUT,
    @AvailabilityStatus NVARCHAR(50) = NULL
AS
BEGIN
    IF @AvailabilityId IS NULL
    BEGIN
        IF @AvailabilityStatus IS NULL
        BEGIN
            PRINT 'Invalid value of AvailabilityStatus'
            RETURN
        END
    END

    BEGIN TRY
        IF @AvailabilityId IS NULL
        BEGIN
            INSERT INTO dbo.Availability (AvailabilityStatus)
            VALUES (@AvailabilityStatus)
            SET @AvailabilityId = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            UPDATE dbo.Availability
            SET AvailabilityStatus = ISNULL(@AvailabilityStatus, AvailabilityStatus)
            WHERE AvailabilityId = @AvailabilityId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
