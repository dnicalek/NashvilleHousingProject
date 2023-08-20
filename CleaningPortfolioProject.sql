/*

Cleaning Data in SQL Queries

*/



Select *
From CleaningPortfolioProject.dbo.NashvilleHousing



--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format



Select SaleDateConverted, CONVERT(Date, SaleDate)
From CleaningPortfolioProject.dbo.NashvilleHousing

Update NashvilleHousing
SET SaleDate = CONVERT(Date,SaleDate)


-- If it doesn't update properly


ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
SET SaleDateConverted = CONVERT(Date,SaleDate)



 --------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data




Select *
From CleaningPortfolioProject.dbo.NashvilleHousing
--Where PropertyAddress is null
Order by ParcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
From CleaningPortfolioProject.dbo.NashvilleHousing a 
Join CleaningPortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null


Update a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
From CleaningPortfolioProject.dbo.NashvilleHousing a 
Join CleaningPortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null



--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)



Select PropertyAddress
From  CleaningPortfolioProject.dbo.NashvilleHousing
--Where PropertyAddress is null
Order by ParcelID


Select
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) as Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress)) as City
From CleaningPortfolioProject.dbo.NashvilleHousing


ALTER TABLE NashvilleHousing
Add PropertySplitAddress Nvarchar(255);

Update NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) 


ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255);

Update NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress)) 

SELECT *
From CleaningPortfolioProject.dbo.NashvilleHousing



Select OwnerAddress 
From CleaningPortfolioProject.dbo.NashvilleHousing

Select
PARSENAME(REPLACE(OwnerAddress,',','.'),3),
PARSENAME(REPLACE(OwnerAddress,',','.'),2),
PARSENAME(REPLACE(OwnerAddress,',','.'),1)
From CleaningPortfolioProject.dbo.NashvilleHousing


ALTER TABLE NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'),3) 


ALTER TABLE NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2) 

ALTER TABLE NashvilleHousing
Add OwnerSplitState Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'),1)


SELECT *
From CleaningPortfolioProject.dbo.NashvilleHousing



--------------------------------------------------------------------------------------------------------------------------

-- Change Y and N to Yes and No in "Sold as Vacant" field



Select Distinct(SoldAsVacant), Count(SoldAsVacant) AS CountOfSoldAsVacant
From CleaningPortfolioProject.dbo.NashvilleHousing
Group by SoldAsVacant
ORDER BY CountOfSoldAsVacant

Select SoldAsVacant,
CASE 
	When SoldAsVacant = 'Y' THEN 'Yes'
	When SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END AS FormattedSoldAsVacant
From CleaningPortfolioProject.dbo.NashvilleHousing

Update NashvilleHousing
SET SoldAsVacant =
CASE 
	When SoldAsVacant = 'Y' THEN 'Yes'
	When SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END 



-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates

With RowNumCTE AS(
SELECT *,
	ROW_NUMBER() OVER (Partition by ParcelID,
									PropertyAddress,
									SalePrice,
									SaleDate,
									LegalReference
									Order by
										UniqueID
										) row_num
From CleaningPortfolioProject.dbo.NashvilleHousing
)
SELECT * 
FROM RowNumCTE
Where row_num > 1
Order by PropertyAddress


SELECT *
From CleaningPortfolioProject.dbo.NashvilleHousing



---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns



SELECT *
From CleaningPortfolioProject.dbo.NashvilleHousing


ALTER Table CleaningPortfolioProject.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER Table CleaningPortfolioProject.dbo.NashvilleHousing
DROP COLUMN SaleDate










-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

--- Importing Data using OPENROWSET and BULK INSERT	


