USE [AutoStoreDB]
GO

INSERT INTO [dbo].[EngineType] 
           ([EngineTypeName], 
            [Enginevolume], 
            [Description])
VALUES 
           ('Petrol', 2.00, 'Internal combustion engine that runs on petrol.'),
           ('Diesel', 2.50, 'Internal combustion engine that runs on diesel fuel.'),
           ('Electric', 0.00, 'Electric engine powered by batteries.'),
           ('Hybrid', 1.50, 'Combination of petrol engine and electric motor.');
GO
