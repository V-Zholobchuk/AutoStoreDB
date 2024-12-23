USE [AutoStoreDB]
GO

INSERT INTO [dbo].[Discounts] 
           ([ProductId], 
            [DiscountsPercentage], 
            [DiscountsStart], 
            [DiscountsEnd])
VALUES 
           (1, 10.00, '2024-01-01', '2024-12-31'), 
           (2, 15.00, '2024-01-01', '2024-06-30'),  
           (3, 5.00, '2024-01-01', '2024-03-31'),  
           (4, 20.00, '2024-01-01', '2025-01-01');  
GO
