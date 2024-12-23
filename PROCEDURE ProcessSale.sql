CREATE OR ALTER PROCEDURE ProcessSale
    @ProductId INT,
    @EmployeeId INT,
    @SaleDate DATETIME,
    @FirstName NVARCHAR(50) = NULL, 
    @LastName NVARCHAR(50) = NULL,  
    @Phone NVARCHAR(15) = NULL,     
    @Email NVARCHAR(100) = NULL ,  
	@ClientId INT = NULL
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        IF @ClientId IS NULL
        BEGIN
            DECLARE @PersonId INT;
			SET @PersonId = (SELECT TOP(1)PersonId FROM dbo.People WHERE Email = @Email)

			IF @PersonId IS NOT NULL 
			SET @ClientId = (SELECT TOP(1)ClientId FROM dbo.Client WHERE PersonId = @PersonId)

			IF @ClientId IS NULL
			BEGIN
            EXEC dbo.sp_SetPeople
                @PersonId = @PersonId OUTPUT,
                @FirstName = @FirstName,
                @LastName = @LastName,
                @Phone = @Phone,
                @Email = @Email;
            IF @PersonId IS NULL
            BEGIN
                THROW 50005, 'Не вдалося створити запис у таблиці People.', 1;
            END

            EXEC dbo.sp_SetClient
                @ClientId = @ClientId OUTPUT,
                @PersonId = @PersonId;

            IF @ClientId IS NULL
            BEGIN
                THROW 50006, 'Не вдалося створити запис у таблиці Client.', 1;
            END
        END
		END

        IF NOT EXISTS (SELECT 1 FROM Product WHERE ProductId = @ProductId)
        BEGIN
            THROW 50002, 'Продукт з вказаним ID не знайдений.', 1;
        END

        IF NOT EXISTS (SELECT 1 FROM Employee WHERE EmployeeId = @EmployeeId)
        BEGIN
            THROW 50003, 'Співробітник з вказаним ID не знайдений.', 1;
        END

        DECLARE @PriceId INT;
        SELECT TOP 1 @PriceId = PriceId
        FROM dbo.Prices
        WHERE ProductId = @ProductId
          AND @SaleDate BETWEEN StartDate AND ISNULL(EndDate, @SaleDate)
        ORDER BY StartDate DESC;

        IF @PriceId IS NULL
        BEGIN
            THROW 50007, 'Не знайдено актуальної ціни для продукту на вказану дату.', 1;
        END

        DECLARE @SaleId INT;
        EXEC dbo.sp_SetSales
            @SaleId = @SaleId OUTPUT,
            @ProductId = @ProductId,
            @ClientId = @ClientId,
            @EmployeeId = @EmployeeId,
            @SaleDate = @SaleDate,
            @PriceId = @PriceId;

        IF @SaleId IS NULL
        BEGIN
            THROW 50008, 'Не вдалося створити або оновити запис у таблиці Sales.', 1;
        END
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
