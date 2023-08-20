# NashvilleHousing Data Cleaning and Analysis Project

This project focuses on cleaning and analyzing the NashvilleHousing dataset. 
The dataset contains information about property sales in Nashville, including details such as property values, sale prices, and property characteristics.

## Dataset Description

The NashvilleHousing dataset consists of the following columns:
- UniqueID
- ParcelID
- LandUse
- SalePrice
- LegalReference
- SoldAsVacant
- OwnerName
- Acreage
- LandValue
- BuildingValue
- TotalValue
- YearBuilt
- Bedrooms
- FullBath
- HalfBath
- SaleDate
- PropertySplitAddress
- PropertySplitCity
- OwnerSplitAddress
- OwnerSplitCity
- OwnerSplitState

## Data Cleaning

The dataset required several cleaning steps to ensure accurate analysis. The cleaning process included:
- Standardizing date formats
- Populating missing property addresses
- Parsing owner addresses
- Standardizing 'SoldAsVacant' values
- Removing duplicates
- Deleting unused columns

The data cleaning scripts and their execution are explained in the `NashvilleHousingCleaning.sql` file.

## Data Analysis

The cleaned dataset was analyzed to uncover insights about Nashville's property market. The analysis included:
- Exploring property types and their distribution
- Calculating average sale prices for different property types
- Analyzing average sale prices based on the number of bedrooms or bathrooms
- Examining property sales trends over time

The data analysis scripts and their execution are explained in the `NashvilleHousingAnalysis.sql` file.

## How to Run

1. Make sure you have access to the NashvilleHousing dataset in your database.
2. Execute the data cleaning scripts from the `NashvilleHousingCleaning.sql` file to clean the dataset.
3. Execute the data analysis scripts from the `NashvilleHousingAnalysis.sql` file to perform analysis on the cleaned dataset.

## Conclusion

This project provides valuable insights into Nashville's property market through data cleaning and analysis. 
The cleaned dataset and analysis results can serve as a foundation for informed decision-making and further research.

## Author

This project was carried out by Dominik Nicałek. 
contact dominiknicalek@gmail.com
