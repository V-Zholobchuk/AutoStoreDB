EXEC dbo.sp_SetClient
@PersonId = 12
SELECT * FROM dbo.Client

EXEC dbo.sp_SetClient
    @ClientId = 3,
    @PersonId = 13;
	SELECT * FROM dbo.Client