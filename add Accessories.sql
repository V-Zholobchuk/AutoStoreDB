USE [VIP AVTO]
GO

INSERT INTO [dbo].[Accessories] 
           ([AccessoryName], 
            [Description], 
            [AvailabilityId])
VALUES 
           ('Car Cover', 'Protective cover for cars', 1),
           ('Floor Mats', 'Rubber mats for car interior', 1),
           ('Sunroof', 'Additional sunroof for more light', 2),
           ('GPS Navigation', 'Built-in GPS system', 1);
GO
