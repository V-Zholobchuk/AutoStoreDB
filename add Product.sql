USE [AutoStoreDB]
GO

INSERT INTO [dbo].[Product] 
           ([MarkaId], 
            [ModelId], 
            [CarTypeId], 
            [ColorId], 
            [EngineTypeId], 
            [TransmissionId], 
            [GuaranteeId], 
            [AvailabilityId], 
            [ProductName])
VALUES 
           (1, 1, 1, 1, 1, 1, 1, 1, 'Toyota Camry 2023'),
           (2, 2, 1, 2, 2, 1, 1, 1, 'BMW X5 2022'),
           (3, 3, 2, 1, 1, 2, 1, 1, 'Ford F-150 2024'),
           (4, 4, 1, 3, 3, 1, 1, 1, 'Volkswagen Golf 2021');
GO
