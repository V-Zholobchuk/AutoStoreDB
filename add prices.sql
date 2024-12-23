USE [AutoStoreDB]
GO

INSERT INTO [dbo].[Prices] 
           ([ProductId], 
            [AccessoryId], 
            [Price], 
            [StartDate], 
            [EndDate])
VALUES 
           (1, NULL, 25000.00, '2024-01-01', NULL),
           (2, NULL, 60000.00, '2024-01-01', NULL),
           (3, NULL, 35000.00, '2024-01-01', NULL),
           (4, NULL, 22000.00, '2024-01-01', NULL),
           (NULL, 1, 150.00, '2024-01-01', '2024-12-31'), 
           (NULL, 2, 200.00, '2024-01-01', '2024-12-31');
GO
