ALTER TABLE [dbo].[Product] 
ADD CONSTRAINT FKProductMarka
FOREIGN KEY (MarkaId)
REFERENCES dbo.Marka (MarkaId)