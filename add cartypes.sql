USE [AutoStoreDB]
GO

INSERT INTO [dbo].[CarTypes] 
           ([TypeName], 
            [Description])
VALUES 
           ('Sedan', 'Four-door car with a separate trunk'),
           ('SUV', 'Sport Utility Vehicle, larger body style'),
           ('Hatchback', 'Small car with a rear door that swings upward'),
           ('Convertible', 'Car with a roof that can be removed');
GO
