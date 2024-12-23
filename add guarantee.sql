USE [AutoStoreDB]
GO

INSERT INTO [dbo].[Guarantee] 
           ([ProductId], 
            [GuaranteePeriod], 
            [GuaranteeDetails])
VALUES 
           (1, 36, '3 years or 100,000 km warranty.'),
           (2, 48, '4 years or 80,000 km warranty.'),
           (3, 60, '5 years or 150,000 km warranty.'),
           (4, 24, '2 years or 50,000 km warranty.');
GO
