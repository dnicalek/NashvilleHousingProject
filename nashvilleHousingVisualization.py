import pandas as pd
import numpy as np
import os
import matplotlib.pyplot as plt
import re
from sqlalchemy import create_engine

def set_custom_matplotlib_params():
    """
    Sets custom parameters for the matplotlib library.
    """
    plt.rcParams.update(
        {
            'text.usetex': False,
            'font.family': 'stixgeneral',
            'mathtext.fontset': 'stix',
        }
    )

def clean_filename(s):
    """
       Removes special characters and spaces from a string.

       Parameters:
           s (str): Input string.

       Returns:
           str: Cleaned string.
       """
    return re.sub(r'[^a-zA-Z0-9]', '_', s)

def create_connection():
    """
    Create a SQLAlchemy database connection engine.

    Returns:
        create_engine: SQLAlchemy engine for database connection.
    """

    connection_string = (
        'DRIVER={SQL Server};'
        'SERVER=server_name;'   
        'DATABASE=database_name;'
        'Trusted_Connection=yes;'
    )
    return create_engine(f"mssql+pyodbc:///?odbc_connect={connection_string}")

def save_plot(plt, filename):
    """
       Save the current plot to a file.

       Parameters:
           plt: Current matplotlib plot.
           filename (str): Name of the file to save the plot.
       """

    plt.savefig(filename)

def create_visualization(df, query_number, output_folder):
    """
        Create specific visualizations based on query results.

        Parameters:
            df_list (list): List of data frames containing query results.
            output_folder (str): Path to the folder for saving plots.
    """

    if query_number == 0:  # Unique values from LandUse
        set_custom_matplotlib_params()

        plt.figure(figsize=(12, 6))
        bar_plot = plt.bar(df['LandUse'], df['Count'])
        plt.xlabel('Land Use')
        plt.ylabel('Number of Occurrences')
        plt.title('Unique Values from LandUse Column')
        plt.xticks(rotation=45, ha='right')
        plt.tight_layout()

    elif query_number == 1:  # Average Sale Price by Land Use
        set_custom_matplotlib_params()

        plt.figure(figsize=(12, 6))
        plt.bar(df['LandUse'], df['AvgSalePrice'])
        plt.xlabel('Land Use')
        plt.ylabel('Average Sale Price')
        plt.title('Average Sale Price by Land Use')
        plt.xticks(rotation=45, ha='right')
        plt.tight_layout()

    elif query_number == 2:  # Average Sale Price of Single Family Houses by Bedrooms
        set_custom_matplotlib_params()

        plt.figure(figsize=(12, 6))
        plt.bar(df['Bedrooms'], df['AvgSalePrice'])
        plt.xlabel('Bedrooms')
        plt.ylabel('Average Sale Price')
        plt.title('Average Sale Price of Single Family Houses by Bedrooms')
        plt.tight_layout()
        plt.xticks(range(len(df['LandUse'])), range(len(df['LandUse'])))

    elif query_number == 3:  # Distribution of Number of Bedrooms
        set_custom_matplotlib_params()
        plt.figure(figsize=(12, 6))
        plt.bar(df['Bedrooms'], df['Count'])
        plt.xlabel('Bedrooms')
        plt.ylabel('Count')
        plt.title('Distribution of Number of Bedrooms')
        plt.xticks(range(len(df['Bedrooms'])), range(len(df['Bedrooms'])))

    elif query_number == 4:  # Average Selling Price Depending on the Number of Bathrooms
        set_custom_matplotlib_params()

        plt.figure(figsize=(12, 6))
        # plt.plot(np.arange(len(df['Bathrooms'])), df['AverageSalePrice'], marker='o')
        plt.plot(df['Bathrooms'], df['AverageSalePrice'], marker='o')
        plt.xticks(df['Bathrooms'])
        plt.xlabel('Number of Bathrooms')
        plt.ylabel('Average Sale Price')
        plt.title('Average Selling Price Depending on the Number of Bathrooms')


    elif query_number == 5:  # Top 5 Properties with the Highest Total Value
        set_custom_matplotlib_params()

        plt.figure(figsize=(12, 6))
        plt.bar(df['PropertySplitAddress'], df['TotalValue'])
        plt.xlabel('Property Address')
        plt.ylabel('Total Value')
        plt.title('Top 5 Properties with the Highest Total Value')
        plt.xticks(rotation=45)

    elif query_number == 6:  # Most Common Years of Construction by Land Use
        set_custom_matplotlib_params()

        plt.figure(figsize=(12, 6))
        top_years = df['YearBuilt'].head(5)
        plt.bar(top_years, df['Count'])
        plt.xlabel('Year of Construction')
        plt.ylabel('Count')
        plt.title('Most Common Years of Construction by Land Use')
        plt.xticks(top_years)
        plt.tight_layout()

    elif query_number == 7:  # Real Estate Sales Statistics by Years of Construction
        set_custom_matplotlib_params()

        plt.figure(figsize=(12, 6))

        plt.plot(df['YearBuilt'], df['AvgSalePrice'], label='Avg Sale Price', color='blue')
        plt.plot(df['YearBuilt'], df['MinSalePrice'], label='Min Sale Price', color='green')
        plt.plot(df['YearBuilt'], df['MaxSalePrice'], label='Max Sale Price', color='red')

        plt.xlabel('Year of Construction')
        plt.ylabel('Price')
        plt.title('Real Estate Sales Statistics by Years of Construction')

        plt.legend(loc='upper left', fontsize='small')
        plt.yscale('log')
        plt.grid(True, which='both', linestyle='--', linewidth=0.5)
        plt.tight_layout()


    elif query_number == 8:  # Average Sale Price for Various Combinations of Bedrooms and Land Use
        set_custom_matplotlib_params()

        unique_land_uses = df['LandUse'].unique()
        color_map = plt.get_cmap('tab10', len(unique_land_uses))

        plt.figure(figsize=(12, 6))
        for idx, land_use in enumerate(unique_land_uses):
            subset_df = df[df['LandUse'] == land_use]
            plt.scatter(subset_df['Bedrooms'], subset_df['AvgSalePrice'], label=land_use, color=color_map(idx))

        plt.xlabel('Bedrooms')
        plt.ylabel('Average Sale Price')
        plt.title('Average Sale Price for Various Combinations of Bedrooms and Land Use')

        num_columns = 3
        num_labels = len(unique_land_uses)
        num_rows = (num_labels + num_columns - 1) // num_columns
        handles, labels = plt.gca().get_legend_handles_labels()
        plt.legend(handles, labels, loc='upper center', ncol=num_columns, bbox_to_anchor=(0.5, -0.15))
        plt.tight_layout()


    elif query_number == 9:  # Number of Properties Sold in Different Price Ranges by Year of Construction
        set_custom_matplotlib_params()
        df_pivot = df.pivot(index='YearBuilt', columns='PriceRange', values='SalesCount')
        df_pivot.plot(kind='bar', stacked=True)
        plt.xlabel('Year of Construction')
        plt.ylabel('Number of Properties Sold')
        plt.title('Number of Properties Sold in Different Price Ranges by Year of Construction')
        plt.legend(title='Price Range')
        plt.xticks(rotation=45)
        plt.tight_layout()

def generate_plots(data_frames, output_folder):
    """
        Generate and save visualizations based on query results.

        Parameters:
            data_frames (list): List of data frames containing query results.
            output_folder (str): Path to the folder for saving plots.
        """

    for query_number, df in enumerate(data_frames):
        create_visualization(df, query_number, output_folder)
        plot_name = clean_filename(f"plot_query_{query_number + 1}")
        plot_path = os.path.join(output_folder, f"{plot_name}.png")
        save_plot(plt, plot_path)

def main():
    """
     Main function to execute the data analysis and visualization process.
     """

    # Creating a SQLAlchemy connection
    engine = create_connection()

    # SQL queries
    queries = [
        "SELECT LandUse, COUNT(*) AS Count FROM CleaningPortfolioProject.dbo.NashvilleHousing GROUP BY LandUse ORDER BY Count DESC",
        "SELECT LandUse, AVG(SalePrice) AS AvgSalePrice FROM CleaningPortfolioProject.dbo.NashvilleHousing GROUP BY LandUse ORDER BY AvgSalePrice DESC",
        "SELECT LandUse, Bedrooms, AVG(SalePrice) AS AvgSalePrice FROM CleaningPortfolioProject.dbo.NashvilleHousing WHERE LandUse = 'Single Family' AND Bedrooms IS NOT NULL GROUP BY LandUse, Bedrooms ORDER BY AvgSalePrice DESC",
        "SELECT LandUse, Bedrooms, COUNT(*) AS Count FROM CleaningPortfolioProject.dbo.NashvilleHousing WHERE LandUse = 'Single Family' AND Bedrooms IS NOT NULL GROUP BY LandUse, Bedrooms ORDER BY LandUse, Bedrooms",
        "SELECT FullBath, HalfBath, Bathrooms, AVG(SalePrice) AS AverageSalePrice FROM CleaningPortfolioProject.dbo.NashvilleHousing WHERE FullBath is not null and HalfBath is not null GROUP BY Bathrooms, FullBath, HalfBath ORDER BY Bathrooms ASC;",
        "SELECT DISTINCT TOP 5 YearBuilt,LandUse,PropertySplitAddress,PropertySplitCity,OwnerName,(LandValue + BuildingValue) AS TotalValue FROM CleaningPortfolioProject.dbo.NashvilleHousing WHERE YEAR(SaleDateConverted) > 2008 ORDER BY TotalValue DESC;",
        "SELECT TOP 5 YearBuilt, COUNT(*) AS Count, LandUse FROM CleaningPortfolioProject.dbo.NashvilleHousing WHERE YearBuilt IS NOT NULL GROUP BY YearBuilt, LandUse ORDER BY Count DESC;",
        "SELECT YearBuilt,COUNT(*) AS TotalSales,AVG(SalePrice) AS AvgSalePrice,MIN(SalePrice) AS MinSalePrice,MAX(SalePrice) AS MaxSalePrice FROM NashvilleHousing GROUP BY YearBuilt ORDER BY YearBuilt;",
        "SELECT LandUse, Bedrooms, AVG(SalePrice) AS AvgSalePrice FROM CleaningPortfolioProject.dbo.NashvilleHousing GROUP BY LandUse, Bedrooms ORDER BY LandUse, Bedrooms;",
        "SELECT YearBuilt, PriceRange, COUNT(*) AS SalesCount FROM( SELECT YearBuilt, CASE WHEN SalePrice < 50000 THEN '0-50k' WHEN SalePrice >= 50000 AND SalePrice < 100000 THEN '50k-100K' WHEN SalePrice >= 100000 AND SalePrice < 200000 THEN '100k-200k' WHEN SalePrice >= 200000 AND SalePrice < 300000 THEN '200k-300k' WHEN SalePrice >= 300000 AND SalePrice < 400000 THEN '300k-400k' WHEN SalePrice >= 400000 AND SalePrice < 500000 THEN '400k-500k' ELSE '500k+' END AS PriceRange FROM CleaningPortfolioProject.dbo.NashvilleHousing WHERE YearBuilt > 2008 ) AS PriceRanges GROUP BY YearBuilt, PriceRange ORDER BY YearBuilt, PriceRange;"
    ]

    # Fetch query results into a pandas dataframe
    data_frames = [pd.read_sql(query, engine) for query in queries]

    # Close the connection połączenie
    engine.dispose()

    # Folder for saving graphs
    output_folder = "Visualisation"
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    generate_plots(data_frames, output_folder)

if __name__ == "__main__":
    main()
