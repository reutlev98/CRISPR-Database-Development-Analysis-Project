import pandas as pd
import pymysql
import openpyxl

# MySQL's connection details
host = '127.0.0.1'
user = 'root'
password = 'Reut0412'
database = 'project'

try:
    # Establishing connection to MySQL
    connection = pymysql.connect(host=host, user=user, password=password, database=database)


    # Function to insert data into a table
    def insert_data(excel_file, table_name):
        # Read Excel file
        excel_data = pd.read_excel(excel_file)

        # Create a cursor object
        cursor = connection.cursor()

        # Iterate through the rows and insert data into the table
        for index, row in excel_data.iterrows():
            values = "','".join(map(str, row.values))
            sql_query = f"INSERT INTO {table_name} VALUES ('{values}')"
            cursor.execute(sql_query)

        # Commit the changes
        connection.commit()

        # Close the cursor
        cursor.close()




    # Insert data from cell Excel file into cell table
    excel_file = 'Cell.xlsx'
    table_name = 'cell'
    insert_data(excel_file, table_name)
    print("done:", table_name)


    # Insert data from parameters Excel file into parameters table
    excel_file = 'parameters.xlsx'
    table_name = 'parameters'
    insert_data(excel_file, table_name)
    print("done:", table_name)

    # Insert data from Guide Excel file into Guide table
    excel_file = 'Guide.xlsx'
    table_name = 'guide'
    insert_data(excel_file, table_name)
    print("done:", table_name)

    # Insert data from identify Excel file into identify table
    excel_file = 'identify.xlsx'
    table_name = 'identify'
    insert_data(excel_file, table_name)
    print("done:", table_name)

    # Insert data from Experiment Excel file into Experiment table
    excel_file = 'Experiment.xlsx'
    table_name = 'experiment'
    insert_data(excel_file, table_name)
    print("done:", table_name)

    # Insert data from analysis parameter Excel file into analysis parameter table
    excel_file = 'analysis parameter.xlsx'
    table_name = 'analysis_parameters'
    insert_data(excel_file, table_name)
    print("done:", table_name)

    # Insert data from experiment_parameter Excel file into experiment_parameter table
    excel_file = 'experiment_parameter.xlsx'
    table_name = 'experiment_parameters'
    insert_data(excel_file, table_name)
    print("done:", table_name)

    # Insert data from RawData Excel file into RawData table
    excel_file = 'Rawdata.xlsx'
    table_name = 'rawdata'
    insert_data(excel_file, table_name)
    print("done:", table_name)

    # Insert data from guide_seq_data Excel file into guide_seq_data table
    # excel_file = 'guide_seq_data.xlsx'
    # table_name = 'guide_seq_data'
    # insert_data(excel_file, table_name)
    # print("done:", table_name)

except pymysql.Error as e:
    print(f"MySQL Error: {e}")

finally:
    # Close the connection
    if connection:
        connection.close()
