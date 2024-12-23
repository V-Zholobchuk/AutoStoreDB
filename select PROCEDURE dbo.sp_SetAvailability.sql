
EXEC dbo.sp_SetAvailability
    @AvailabilityStatus = 'Available soon';
	SELECT * FROM dbo.Availability
