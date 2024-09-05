
#  DatabaseFiles

## Overview

The `DatabaseFiles` folder contains essential files and folders for setting up and populating the MySQL database. It is organized into three main folders for different purposes:

### Folders

1. **DataOnly**
   - Contains sql files with raw data that will be imported into the MySQL database.

2. **StructureOnly**
   - Contains SQL scripts for creating the database schema, including table structures and relationships.

3. **Data & Structure**
   - Contains both data files and SQL scripts required for setting up the database. It provides a comprehensive package for initializing and populating the database.

## Importing and Exporting Data

- For a complete explanation of the MySQL import and export process, please consult the [import & export to MySQL.pdf](https://github.com/reutlev98/CRISPR-Database-Development-Analysis-Project/blob/a194d11125ab5c2fc258dffae3afa83826a28951/DataBase/DatabaseFiles/import%20%26%20export%20to%20MySQL.pdf).

## `insertDataToMysql.py`

The `insertDataToMysql.py` script is used for importing data from Excel files into MySQL tables. Here’s a brief overview of the script:

- **Purpose**: The script connects to a MySQL database and inserts data from various Excel files into corresponding tables.

- **Functionality**:
  1. **Establish Connection**: Connects to the MySQL database using provided credentials.
  2. **Insert Data Function**: Reads data from an Excel file and inserts it into the specified table.
     - **Excel Reading**: Uses `pandas` to read the Excel file.
     - **Data Insertion**: Iterates through rows and constructs SQL `INSERT` queries to add data to the table.
     - **Commit Changes**: Commits the transaction to the database.
  3. **Processing Files**: Inserts data from several predefined Excel files into corresponding tables (e.g., `Cell.xlsx` to `cell` table).

- **Error Handling**: Includes error handling for MySQL connection issues and ensures the connection is closed after operations.
