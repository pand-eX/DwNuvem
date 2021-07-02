
CREATE TABLE DimCurrency
    (
      CurrencyKey INT NOT NULL ,
      CurrencyAlternateKey NCHAR(3) NOT NULL ,
      CurrencyName NVARCHAR(50) NOT NULL ,
      CONSTRAINT PK_DimCurrency_CurrencyKey PRIMARY KEY ( CurrencyKey )
    );  

CREATE TABLE DimCustomer
    (
      CustomerKey INT NOT NULL sortkey distkey,
      GeographyKey INT NULL ,
      CustomerAlternateKey NVARCHAR(15) NOT NULL ,
      Title NVARCHAR(8) NULL ,
      FirstName NVARCHAR(50) NULL ,
      MiddleName NVARCHAR(50) NULL ,
      LastName NVARCHAR(50) NULL ,
      NameStyle bool NULL ,
      BirthDate DATE NULL ,
      MaritalStatus NCHAR(1) NULL ,
      Suffix NVARCHAR(10) NULL ,
      Gender NVARCHAR(1) NULL ,
      EmailAddress NVARCHAR(50) NULL ,
      YearlyIncome NUMERIC(15, 2) NULL ,
      Education NVARCHAR(40) NULL ,
      Occupation NVARCHAR(100) NULL ,
      AddressLine1 NVARCHAR(120) NULL ,
      AddressLine2 NVARCHAR(120) NULL ,
      Phone NVARCHAR(20) NULL ,
      DateFirstPurchase DATE NULL ,
      CONSTRAINT PK_DimCustomer_CustomerKey PRIMARY KEY ( CustomerKey )
    );  
 
CREATE TABLE DimDate
    (
      datekey INT NOT NULL ,
      alternatedatekey DATE NOT NULL sortkey,
      dayofweek INT NOT NULL ,
      dayofmonth INT NOT NULL ,
      weekofyear INT NOT NULL ,
      monthofyear INT NOT NULL ,
      quarter INT NOT NULL ,
      CONSTRAINT PK_DimDate_DateKey PRIMARY KEY ( DateKey )
    ) DISTSTYLE ALL;  

CREATE TABLE DimGeography
    (
      GeographyKey INT NOT NULL sortkey distkey,
      City NVARCHAR(30) NULL ,
      StateProvinceCode NVARCHAR(3) NULL ,
      StateProvinceName NVARCHAR(50) NULL ,
      CountryRegionCode NVARCHAR(3) NULL ,
      CountryRegionName NVARCHAR(50) NULL ,
      PostalCode NVARCHAR(15) NULL ,
      SalesTerritoryKey INT NULL ,
      IpAddressLocator NVARCHAR(15) NULL ,
      CONSTRAINT PK_DimGeography_GeographyKey PRIMARY KEY ( GeographyKey )
    );  
 
CREATE TABLE DimProduct
    (
      ProductKey INT NOT NULL sortkey distkey,
      ProductAlternateKey NVARCHAR(25) NULL ,
      ProductSubcategoryKey INT NULL ,
      WeightUnitMeasureCode NCHAR(3) NULL ,
      SizeUnitMeasureCode NCHAR(3) NULL ,
      ProductName NVARCHAR(50) NOT NULL ,
      StandardCost NUMERIC(15, 2) NULL ,
      FinishedGoodsFlag bool NOT NULL ,
      Color NVARCHAR(15) NOT NULL ,
      SafetyStockLevel INT NULL ,
      ReorderPoint INT NULL ,
      ListPrice NUMERIC(15, 2) NULL ,
      Size NVARCHAR(50) NULL ,
      SizeRange NVARCHAR(50) NULL ,
      Weight FLOAT NULL ,
      DaysToManufacture INT NULL ,
      ProductLine NCHAR(2) NULL ,
      DealerPrice NUMERIC(15, 2) NULL ,
      Class NCHAR(2) NULL ,
      Style NCHAR(2) NULL ,
      ModelName NVARCHAR(50) NULL ,
      Description NVARCHAR(400) NULL ,
      StartDate DATETIME NULL ,
      EndDate DATETIME NULL ,
      Status NVARCHAR(7) NULL ,
      CONSTRAINT PK_DimProduct_ProductKey PRIMARY KEY ( ProductKey )
    );  
  
CREATE TABLE DimProductCategory
    (
      ProductCategoryKey INT NOT NULL distkey sortkey,
      ProductCategoryAlternateKey INT NULL ,
      ProductCategoryName NVARCHAR(50) NOT NULL ,
      CONSTRAINT PK_DimProductCategory_ProductCategoryKey PRIMARY KEY
        ( ProductCategoryKey )
    );  

CREATE TABLE DimProductSubcategory
    (
      ProductSubcategoryKey INT NOT NULL ,
      ProductSubcategoyAlternateKey INT NULL ,
      ProductSubcategoryName NVARCHAR(50) NOT NULL ,
      ProductCategoryKey INT NULL sortkey distkey,
      CONSTRAINT PK_DimProductSubcategory_ProductSubcategoryKey PRIMARY KEY
        ( ProductSubcategoryKey )
    );  
 
 
CREATE TABLE DimReseller
    (
      ResellerKey INT NOT NULL ,
      GeographyKey INT NULL distkey sortkey,
      ResellerAlternateKey NVARCHAR(15) NULL ,
      Phone NVARCHAR(25) NULL ,
      BusinessType VARCHAR(20) NOT NULL ,
      ResellerName NVARCHAR(50) NOT NULL ,
      NumberEmployees INT NULL ,
      OrderFrequency CHAR(1) NULL ,
      OrderMonth INT NULL ,
      FirstOrderYear INT NULL ,
      LastOrderYear INT NULL ,
      ProductLine NVARCHAR(50) NULL ,
      AddressLine1 NVARCHAR(60) NULL ,
      AddressLine2 NVARCHAR(60) NULL ,
      AnnualSales NUMERIC(15, 2) NULL ,
      BankName NVARCHAR(50) NULL ,
      MinPaymentType INT NULL ,
      MinPaymentAmount NUMERIC(15, 2) NULL ,
      AnnualRevenue NUMERIC(15, 2) NULL ,
      YearOpened INT NULL ,
      CONSTRAINT PK_DimReseller_ResellerKey PRIMARY KEY ( ResellerKey )
    );  


CREATE TABLE FactProductInventory
    (
      ProductKey INT NOT NULL ,
      DateKey INT NOT NULL distkey sortkey,
      MovementDate DATE NOT NULL ,
      UnitCost NUMERIC(15, 2) NOT NULL ,
      UnitsIn INT NOT NULL ,
      UnitsOut INT NOT NULL ,
      UnitsBalance INT NOT NULL ,
      CONSTRAINT PK_FactProductInventory PRIMARY KEY ( ProductKey, DateKey )
    );
 
CREATE TABLE FactRate
    (
      CurrencyKey INT NOT NULL ,
      DateKey INT NOT NULL distkey sortkey,
      AverageRate FLOAT NOT NULL ,
      EndOfDayRate FLOAT NOT NULL ,
      Date DATETIME NULL ,
      CONSTRAINT PK_FactCurrencyRate_CurrencyKey_DateKey PRIMARY KEY
        ( CurrencyKey, DateKey )
    ); 
 
CREATE TABLE FactSales
    (
      ProductKey INT NOT NULL ,
      OrderDateKey INT NOT NULL distkey sortkey,
      DueDateKey INT NOT NULL ,
      ShipDateKey INT NOT NULL ,
      ControlKey INT NOT NULL ,
      CustomerKey INT NOT NULL ,
      CurrencyKey INT NOT NULL ,
      SalesTerritoryKey INT NOT NULL ,
      SalesOrderNumber NVARCHAR(20) NOT NULL ,
      SalesOrderLineNumber NVARCHAR(20) NOT NULL ,
      RevisionNumber INT NOT NULL ,
      OrderQuantity INT NOT NULL ,
      UnitPrice NUMERIC(15, 2) NOT NULL ,
      ExtendedAmount NUMERIC(15, 2) NOT NULL ,
      UnitPriceDiscountPct FLOAT NOT NULL ,
      DiscountAmount FLOAT NOT NULL ,
      ProductStandardCost NUMERIC(15, 2) NOT NULL ,
      TotalProductCost NUMERIC(15, 2) NOT NULL ,
      SalesAmount NUMERIC(15, 2) NOT NULL ,
      TaxAmt NUMERIC(15, 2) NOT NULL ,
      Freight NUMERIC(15, 2) NOT NULL ,
      CarrierTrackingNumber NVARCHAR(25) NULL ,
      CustomerPONumber NVARCHAR(25) NULL ,
      OrderDate NVARCHAR(50) NULL ,
      DueDate DATETIME NULL ,
      ShipDate DATETIME NULL ,
      CONSTRAINT PK_FactSales_SalesOrderNumber_SalesOrderLineNumber PRIMARY KEY
        ( SalesOrderNumber, SalesOrderLineNumber )
    ); 
 


ALTER TABLE   DimCustomer     ADD  CONSTRAINT  FK_DimCustomer_DimGeography  FOREIGN KEY( GeographyKey )
REFERENCES   DimGeography  ( GeographyKey );
 

ALTER TABLE   DimProduct     ADD  CONSTRAINT  FK_DimProduct_DimProductSubcategory  FOREIGN KEY( ProductSubcategoryKey )
REFERENCES   DimProductSubcategory  ( ProductSubcategoryKey );
 
 
ALTER TABLE   DimProductSubcategory     ADD  CONSTRAINT  FK_DimProductSubcategory_DimProductCategory  FOREIGN KEY( ProductCategoryKey )
REFERENCES   DimProductCategory  ( ProductCategoryKey );
 
 
ALTER TABLE   DimReseller     ADD  CONSTRAINT  FK_DimReseller_DimGeography  FOREIGN KEY( GeographyKey )
REFERENCES   DimGeography  ( GeographyKey );
 
 
ALTER TABLE   FactProductInventory     ADD  CONSTRAINT  FK_FactProductInventory_DimDate  FOREIGN KEY( DateKey )
REFERENCES   DimDate  ( DateKey );
 
 
ALTER TABLE   FactProductInventory     ADD  CONSTRAINT  FK_FactProductInventory_DimProduct  FOREIGN KEY( ProductKey )
REFERENCES   DimProduct  ( ProductKey );
 
 
ALTER TABLE   FactRate     ADD  CONSTRAINT  FK_FactCurrencyRate_DimCurrency  FOREIGN KEY( CurrencyKey )
REFERENCES   DimCurrency  ( CurrencyKey );
 
 
ALTER TABLE   FactRate     ADD  CONSTRAINT  FK_FactCurrencyRate_DimDate  FOREIGN KEY( DateKey )
REFERENCES   DimDate  ( DateKey );
 
 
ALTER TABLE   FactSales     ADD  CONSTRAINT  FK_FactSales_DimCurrency  FOREIGN KEY( CurrencyKey )
REFERENCES   DimCurrency  ( CurrencyKey );
 
 
ALTER TABLE   FactSales     ADD  CONSTRAINT  FK_FactSales_DimCustomer  FOREIGN KEY( CustomerKey )
REFERENCES   DimCustomer  ( CustomerKey );
 
 
ALTER TABLE   FactSales     ADD  CONSTRAINT  FK_FactSales_DimDate  FOREIGN KEY( OrderDateKey )
REFERENCES   DimDate  ( DateKey );
 
 
ALTER TABLE   FactSales     ADD  CONSTRAINT  FK_FactSales_DimDate1  FOREIGN KEY( DueDateKey )
REFERENCES   DimDate  ( DateKey );
 
 
ALTER TABLE   FactSales     ADD  CONSTRAINT  FK_FactSales_DimDate2  FOREIGN KEY( ShipDateKey )
REFERENCES   DimDate  ( DateKey );
 
 
ALTER TABLE   FactSales     ADD  CONSTRAINT  FK_FactSales_DimProduct  FOREIGN KEY( ProductKey )
REFERENCES   DimProduct  ( ProductKey );

