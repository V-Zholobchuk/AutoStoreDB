EXEC ProcessSale 
    @ProductId = 3, 
    @ClientId = 2, 
    @EmployeeId = 1, 
    @SaleDate = '2024-12-02';
	SELECT * FROM dbo.Sales
		

	EXEC ProcessSale 
    @ProductId = 1, 
    @ClientId = NULL, 
    @EmployeeId = 1, 
    @SaleDate = '2024-12-03', 
    @FirstName = 'Іван', 
    @LastName = 'Петренко', 
    @Phone = '+380123456789', 
    @Email = 'ivan.petrenko@example.com';
		SELECT * FROM dbo.Sales
				SELECT * FROM dbo.People
