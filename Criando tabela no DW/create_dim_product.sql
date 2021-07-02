
-- Cria tabela
CREATE TABLE DimProduct
    (
      ProductKey INT NOT NULL,
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
      Status NVARCHAR(7) NULL 
    );

-- Verifica o estilo de distribuição
select relname as table_name,
       case when reldiststyle = 0 then 'EVEN'
            when reldiststyle = 1 then 'KEY'
            when reldiststyle = 8 then 'ALL' end as dist_style
from pg_class
where relname = 'dimproduct';

-- Remove a tabela
drop table DimProduct;

-- Recria a tabela com key distribution
CREATE TABLE DimProduct
    (
      ProductKey INT NOT NULL distkey,
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
      Status NVARCHAR(7) NULL 
    );    