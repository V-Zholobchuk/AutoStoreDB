-- Accessories
ALTER TABLE Accessories
ADD CONSTRAINT FK_Accessories_Availability FOREIGN KEY (AvailabilityId) REFERENCES Availability(AvailabilityId);

-- Client
ALTER TABLE Client
ADD CONSTRAINT FK_Client_People FOREIGN KEY (PersonId) REFERENCES People(PersonId);

-- Discounts
ALTER TABLE Discounts
ADD CONSTRAINT FK_Discounts_Product FOREIGN KEY (ProductId) REFERENCES Product(ProductId);

-- Employee
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_People FOREIGN KEY (PersonId) REFERENCES People(PersonId);

-- Guarantee
ALTER TABLE Guarantee
ADD CONSTRAINT FK_Guarantee_Product FOREIGN KEY (ProductId) REFERENCES Product(ProductId);

-- Prices
ALTER TABLE Prices
ADD CONSTRAINT FK_Prices_Product FOREIGN KEY (ProductId) REFERENCES Product(ProductId);

ALTER TABLE Prices
ADD CONSTRAINT FK_Prices_Accessories FOREIGN KEY (AccessoryId) REFERENCES Accessories(AccessoryId);

-- Product
ALTER TABLE Product
ADD CONSTRAINT FK_Product_Marka FOREIGN KEY (MarkaId) REFERENCES Marka(MarkaId);

ALTER TABLE Product
ADD CONSTRAINT FK_Product_Model FOREIGN KEY (ModelId) REFERENCES Model(ModelId);

ALTER TABLE Product
ADD CONSTRAINT FK_Product_CarType FOREIGN KEY (CarTypeId) REFERENCES CarTypes(CarTypeId);

ALTER TABLE Product
ADD CONSTRAINT FK_Product_Color FOREIGN KEY (ColorId) REFERENCES Color(ColorId);

ALTER TABLE Product
ADD CONSTRAINT FK_Product_EngineType FOREIGN KEY (EngineTypeId) REFERENCES EngineType(EngineTypeId);

ALTER TABLE Product
ADD CONSTRAINT FK_Product_Transmission FOREIGN KEY (TransmissionId) REFERENCES Transmissions(TransmissionId);

ALTER TABLE Product
ADD CONSTRAINT FK_Product_Availability FOREIGN KEY (AvailabilityId) REFERENCES Availability(AvailabilityId);

-- Sales
ALTER TABLE Sales
ADD CONSTRAINT FK_Sales_Product FOREIGN KEY (ProductId) REFERENCES Product(ProductId);

ALTER TABLE Sales
ADD CONSTRAINT FK_Sales_Client FOREIGN KEY (ClientId) REFERENCES Client(ClientId);

ALTER TABLE Sales
ADD CONSTRAINT FK_Sales_Employee FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId);

ALTER TABLE Sales
ADD CONSTRAINT FK_Sales_Price FOREIGN KEY (PriceId) REFERENCES Prices(PriceId);

ALTER TABLE Sales
ADD CONSTRAINT FK_Sales_Discounts FOREIGN KEY (DiscountsId) REFERENCES Discounts(DiscountsId);

ALTER TABLE Sales
ADD CONSTRAINT FK_Sales_Guarantee FOREIGN KEY (GuaranteeId) REFERENCES Guarantee(GuaranteeId);
