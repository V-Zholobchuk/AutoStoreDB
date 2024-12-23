EXEC  dbo.sp_SetColor
@NameColor = 'Brawn'

SELECT * FROM dbo.Color

EXEC dbo.sp_SetColor
@ColorId = 9,
@Description = 'A bold, warm shade of brown, embodying strength, reliability, and timeless elegance.'
SELECT * FROM dbo.Color
