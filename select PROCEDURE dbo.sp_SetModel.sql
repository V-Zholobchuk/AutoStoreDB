EXEC dbo.sp_SetModel 
    @ModelName = 'A6', 
    @ModelYear = 2024, 
    @Description = 'Luxury sedan with advanced features.'
SELECT * FROM dbo.Model

EXEC dbo.sp_SetModel 
    @ModelId = 5,           
    @ModelName = 'A8',  
    @Description = 'Flagship luxury sedan.'
	SELECT * FROM dbo.Model
