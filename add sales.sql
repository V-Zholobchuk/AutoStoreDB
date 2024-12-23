USE [AutoStoreDB]
GO

INSERT INTO [dbo].[Sales] 
           ([ProductId], 
            [ClientId], 
            [EmployeeId], 
            [SaleDate], 
            [PriceId], 
            [DiscountsId], 
            [GuaranteeId])
VALUES 
           (1, 1, 1, '2024-01-15', 1, NULL, 1),
           (2, 2, 1, '2024-01-20', 2, NULL, 2),
           (3, 1, 2, '2024-01-22', 3, 6, 3),
           (4, 1, 2, '2024-01-25', 4, NULL, 4);
GO
