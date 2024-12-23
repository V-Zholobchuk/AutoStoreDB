EXEC dbo.sp_SetMarka
@MarkaName = 'Audi',
@Description = 'Audi is a German automobile manufacturer that designs, engineers, produces, markets, and distributes luxury vehicles. Known for advanced technology, performance, and high-quality craftsmanship.';
SELECT * FROM dbo.Marka

EXEC dbo.sp_SetMarka
@MarkaId = 6,
@Description = 'Luxury German car brand.'
SELECT * FROM dbo.Marka

