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





#Nashville Housing Data Analysis and Visualization
This project focuses on analyzing and visualizing the Nashville housing dataset using SQL queries and Python scripts. The dataset, named NashvilleHousing, contains information about various properties in Nashville, including their sale prices, characteristics, and other relevant details. The project involves data cleaning, analysis, visualization, and the storage of generated visualizations.

##Table of Contents
-Introduction
-Technologies Used
-Project Structure
-Getting Started
-Data Cleaning
-Data Analysis
-Generating Visualizations
-Configuration
-Results and Visualizations
-License

##Introduction
The Nashville Housing Data Analysis and Visualization project aims to provide insights into the NashvilleHousing dataset. It involves the following stages: data cleaning using SQL queries in the NashvilleHousingCleaning.sql script, data analysis using SQL queries in the NashvilleHousingAnalysis.sql script, visualization generation using the nashvilleHousingVisualization.py Python script, and the storage of generated visualizations in the Visualization/ folder.

##Technologies Used
SQL
Python
Pandas
Matplotlib
SQLAlchemy

##Project Structure
The project consists of the following components:

-NashvilleHousingCleaning.sql: SQL script for cleaning the NashvilleHousing dataset.
-NashvilleHousingAnalysis.sql: SQL script for data analysis on the cleaned dataset.
-nashvilleHousingVisualization.py: Python script for generating visualizations based on analysis results.
-Visualization/: Folder to store the generated visualization plots.
-README.md: This documentation file explaining the project.

##Getting Started
To get started with the project, follow these steps:

1. Ensure you have access to the NashvilleHousing dataset stored in a SQL Server database.
2. Make sure you have Python installed on your machine.
3. Install the required Python libraries using pip install requirements.txt .

##Data Cleaning
The NashvilleHousingCleaning.sql script performs data cleaning tasks on the NashvilleHousing dataset. Execute this script in your SQL Server environment to prepare the data for analysis.

##Data Analysis
Run the NashvilleHousingAnalysis.sql script in your SQL Server environment to perform data analysis on the cleaned dataset. This step generates insights that will be visualized later.

##Generating Visualizations
Execute the nashvilleHousingVisualization.py Python script to generate visualizations based on the analysis results. The script will create visualizations illustrating various aspects of the dataset.

##Configuration
Before running the nashvilleHousingVisualization.py script, ensure to configure the database connection. Open the script and locate the create_connection() function. Replace the placeholders in the connection_string with your actual database connection details.

##Results and Visualizations
The project generates a variety of visualizations that provide insights into the NashvilleHousing dataset. The visualizations include:

-Unique values and occurrences from the LandUse column.
-Average sale price by land use.
-Average sale price of single-family houses by the number of bedrooms.
-Distribution of the number of bedrooms for single-family houses.
-Average selling price depending on the number of bathrooms.
-Top 5 properties with the highest total value after 2008.
-Most common years of construction by land use.
-Real estate sales statistics broken down by years of construction.
-Average sale price for various combinations of bedrooms and land use.
-Number of properties sold in different price ranges by the year of construction.
-Generated plots are saved in the Visualization/ folder.


License
This project is licensed under the MIT License.
