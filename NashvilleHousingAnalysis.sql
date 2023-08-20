SELECT *
From CleaningPortfolioProject.dbo.NashvilleHousing


-- SHOW NAME OF EVERY COLUMN

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_CATALOG = 'CleaningPortfolioProject'
	AND TABLE_SCHEMA = 'dbo'
	AND TABLE_NAME = 'NashvilleHousing';



-- SHOW UNIQUE VALUES ??FROM THE LandUse COLUMN WITH THEIR CORRESPONDING NUMBER OF OCCURENCES 

SELECT LandUse, COUNT(*) AS Count
FROM CleaningPortfolioProject.dbo.NashvilleHousing
GROUP BY LandUse
ORDER BY Count DESC;



-- AVERAGE SALE PRICE DEPENDING ON THE TYPE OF USE OF THE PROPERTY 

SELECT LandUse, AVG(SalePrice) AS AvgSalePrice
FROM CleaningPortfolioProject.dbo.NashvilleHousing
GROUP BY LandUse
ORDER BY AvgSalePrice DESC;



-- AVERAGE SALE PRICE OF SINGLE FAMILY HOUSE DEPENDING ON NUMBER OF BEDROOMS

SELECT LandUse, Bedrooms, AVG(SalePrice) AS AvgSalePrice
FROM CleaningPortfolioProject.dbo.NashvilleHousing
WHERE LandUse = 'Single Family'
	and Bedrooms is not null
GROUP BY LandUse, Bedrooms
ORDER BY AvgSalePrice DESC;



-- DISTRIBUTION OF THE NUMBER OF BEDROOMS

SELECT LandUse, Bedrooms, COUNT(*) AS Count
FROM CleaningPortfolioProject.dbo.NashvilleHousing
WHERE LandUse = 'Single Family'
	and Bedrooms is not null
GROUP BY LandUse, Bedrooms
ORDER BY LandUse, Bedrooms;



-- CREATE A BATHROOMS COLUMN

ALTER TABLE CleaningPortfolioProject.dbo.NashvilleHousing
ADD Bathrooms INT;

UPDATE CleaningPortfolioProject.dbo.NashvilleHousing
SET Bathrooms = ISNULL(FullBath, 0) + ISNULL(HalfBath, 0);



-- AVERAGE SELLING PRICE DEPENDING ON THE NUMBER OF BATHROOMS

SELECT FullBath, HalfBath, Bathrooms, AVG(SalePrice) AS AverageSalePrice
FROM CleaningPortfolioProject.dbo.NashvilleHousing
WHERE FullBath is not null
	and HalfBath is not null
GROUP BY Bathrooms, FullBath, HalfBath
ORDER BY Bathrooms ASC;



-- TOP 5 PROPERTIES WITH THE HIGHEST SUM OF VALUES IN THE YEAR OF CONSTRUCTION FOR THE YEAR OF SALE AFTER 2008 

SELECT TOP 5
    YearBuilt,
    LandUse,
    PropertySplitAddress,
    PropertySplitCity,
    OwnerName,
    (LandValue + BuildingValue) AS TotalValue
FROM CleaningPortfolioProject.dbo.NashvilleHousing
WHERE YEAR(SaleDateConverted) > 2008
ORDER BY TotalValue DESC;



-- THE MOST COMMON YEARS OF CONSTRUCTION OF REAL ESTATE FOR VARIOUS TYPES OF LANDUSE

SELECT TOP 5 YearBuilt, COUNT(*) AS Count, LandUse
FROM CleaningPortfolioProject.dbo.NashvilleHousing
WHERE YearBuilt IS NOT NULL
GROUP BY YearBuilt, LandUse
ORDER BY Count DESC;



-- REAL ESTATE SALES STATISTICS BROKEN DOWN BY YEARS OF CONSTRUCTION

SELECT YearBuilt,
       COUNT(*) AS TotalSales,
       AVG(SalePrice) AS AvgSalePrice,
       MIN(SalePrice) AS MinSalePrice,
       MAX(SalePrice) AS MaxSalePrice
FROM NashvilleHousing
GROUP BY YearBuilt
ORDER BY YearBuilt;



-- AVERAGE SALE PRICE FOR VARIOUS COMBINATIONS OF NUMBER OF BEDROOMS AND PROPERTY TYPE

SELECT LandUse, Bedrooms, AVG(SalePrice) AS AvgSalePrice
FROM CleaningPortfolioProject.dbo.NashvilleHousing
GROUP BY LandUse, Bedrooms
ORDER BY LandUse, Bedrooms;



-- NUMBER OF PROPERTIES SOLD IN DIFFERENT PRICE RANGES FOR A SPECIFIC YEAR OF CONSTRUCTION

SELECT YearBuilt, PriceRange, COUNT(*) AS SalesCount
FROM (
    SELECT YearBuilt,
           CASE
               WHEN SalePrice < 50000 THEN '0-50k'
			   WHEN SalePrice >= 50000 AND SalePrice < 100000 THEN '50k-100K'
               WHEN SalePrice >= 100000 AND SalePrice < 200000 THEN '100k-200k'
               WHEN SalePrice >= 200000 AND SalePrice < 300000 THEN '200k-300k'
			   WHEN SalePrice >= 300000 AND SalePrice < 400000 THEN '300k-400k'
			   WHEN SalePrice >= 400000 AND SalePrice < 500000 THEN '400k-500k'
               ELSE '500k+'
           END AS PriceRange
FROM CleaningPortfolioProject.dbo.NashvilleHousing
	WHERE YearBuilt > 2008
) AS PriceRanges
GROUP BY YearBuilt, PriceRange
ORDER BY YearBuilt, PriceRange;




