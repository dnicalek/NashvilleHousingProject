# Nashville Housing Data Analysis and Visualization
This project focuses on analyzing and visualizing the Nashville housing dataset using SQL queries and Python scripts. The dataset, named NashvilleHousing, contains information about various properties in Nashville, including their sale prices, characteristics, and other relevant details. The project involves data cleaning, analysis, visualization, and the storage of generated visualizations.

## Table of Contents
- Introduction
- Dataset Description
- Technologies Used
- Project Structure
- Getting Started
- Data Cleaning
- Data Analysis
- Generating Visualizations
- Configuration
- Results and Visualizations
- License

## Introduction
The Nashville Housing Data Analysis and Visualization project aims to provide insights into the NashvilleHousing dataset. It involves the following stages: data cleaning using SQL queries in the NashvilleHousingCleaning.sql script, data analysis using SQL queries in the NashvilleHousingAnalysis.sql script, visualization generation using the nashvilleHousingVisualization.py Python script, and the storage of generated visualizations in the Visualization/ folder.

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

## Technologies Used
- SQL
- Python
- Pandas
- Matplotlib
- SQLAlchemy

## Project Structure
The project consists of the following components:

- NashvilleHousingCleaning.sql: SQL script for cleaning the NashvilleHousing dataset.
- NashvilleHousingAnalysis.sql: SQL script for data analysis on the cleaned dataset.
- nashvilleHousingVisualization.py: Python script for generating visualizations based on analysis results.
- Visualization/: Folder to store the generated visualization plots.
- README.md: This documentation file explaining the project.

## Getting Started
To get started with the project, follow these steps:

1. Ensure you have access to the NashvilleHousing dataset stored in a SQL Server database.
2. Make sure you have Python installed on your machine.
3. Install the required Python libraries using pip install requirements.txt .

## Data Cleaning
The dataset required several cleaning steps to ensure accurate analysis. The cleaning process included:
- Standardizing date formats
- Populating missing property addresses
- Parsing owner addresses
- Standardizing 'SoldAsVacant' values
- Removing duplicates
- Deleting unused columns
The NashvilleHousingCleaning.sql script performs data cleaning tasks on the NashvilleHousing dataset. Execute this script in your SQL Server environment to prepare the data for analysis.

## Data Analysis
The cleaned dataset was analyzed to uncover insights about Nashville's property market. The analysis included:
- Exploring property types and their distribution
- Calculating average sale prices for different property types
- Analyzing average sale prices based on the number of bedrooms or bathrooms
- Examining property sales trends over time
Run the NashvilleHousingAnalysis.sql script in your SQL Server environment to perform data analysis on the cleaned dataset. This step generates insights that will be visualized later.

## Generating Visualizations
Execute the nashvilleHousingVisualization.py Python script to generate visualizations based on the analysis results. The script will create visualizations illustrating various aspects of the dataset.

## Configuration
Before running the nashvilleHousingVisualization.py script, ensure to configure the database connection. Open the script and locate the create_connection() function. Replace the placeholders in the connection_string with your actual database connection details.

## Results and Visualizations
The project generates a variety of visualizations that provide insights into the NashvilleHousing dataset. The visualizations include:

- Unique values and occurrences from the LandUse column.
- Average sale price by land use.
- Average sale price of single-family houses by the number of bedrooms.
- Distribution of the number of bedrooms for single-family houses.
- Average selling price depending on the number of bathrooms.
- Top 5 properties with the highest total value after 2008.
- Most common years of construction by land use.
- Real estate sales statistics broken down by years of construction.
- Average sale price for various combinations of bedrooms and land use.
- Number of properties sold in different price ranges by the year of construction.
- Generated plots are saved in the Visualization/ folder.


License
This project is licensed under the MIT License.
