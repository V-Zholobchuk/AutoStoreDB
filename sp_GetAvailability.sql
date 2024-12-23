CREATE OR ALTER PROCEDURE dbo.sp_GetAvailability
    @AvailabilityId INT = NULL,
    @AvailabilityStatus NVARCHAR(50) = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Availability WHERE AvailabilityId = @AvailabilityId)
    BEGIN
        PRINT 'Запису з індитифікатором не існує'
        RETURN
    END
    SELECT *
    FROM dbo.Availability
    WHERE AvailabilityId = @AvailabilityId
       OR @AvailabilityId IS NULL
      AND AvailabilityStatus LIKE @AvailabilityStatus + '%'
       OR @AvailabilityStatus IS NULL
END
