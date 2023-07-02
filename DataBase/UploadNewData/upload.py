import http

from flask import Flask, render_template, request, jsonify
from flask_cors import CORS
import pandas as pd
import mysql.connector

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# MySQL connection configuration
config = {
    'user': 'root',
    'password': '1234554321',
    'host': 'localhost',
    'database': 'try',
}


# Create a dictionary of column names and values for the row
def getDict(row, identified_id, analysis_parameters_id, experiment_parameters_id):
    data = {
        '`BED_Chromosome`': row['#BED_Chromosome'] if row['#BED_Chromosome'] else None,
        '`BED_Min.Position`': row['BED_Min.Position'] if row['BED_Min.Position'] else None,
        '`BED_Max.Position`': row['BED_Max.Position'] if row['BED_Max.Position'] else None,
        '`BED_Name`': row['BED_Name'] if row['BED_Name'] else None,
        '`Filename`': row['Filename'] if row['Filename'] else None,
        '`WindowIndex`': row['WindowIndex'] if row['WindowIndex'] else None,
        '`WindowChromosome`': row['WindowChromosome'] if row['WindowChromosome'] else None,
        '`Position`': row['Position'] if row['Position'] else None,
        '`WindowSequence`': row['WindowSequence'] if row['WindowSequence'] else None,
        '`+.mi`': row['+.mi'] if row['+.mi'] else None,
        '`-.mi`': row['-.mi'] if row['-.mi'] else None,
        '`bi.sum.mi`': row['bi.sum.mi'] if row['bi.sum.mi'] else None,
        '`bi.geometric_mean.mi`': row['bi.geometric_mean.mi'] if row['bi.geometric_mean.mi'] else None,
        '`+.total`': row['+.total'] if row['+.total'] else None,
        '`-.total`': row['-.total'] if row['-.total'] else None,
        '`total.sum`': row['total.sum'] if row['total.sum'] else None,
        '`total.geometric_mean`': row['total.geometric_mean'] if row['total.geometric_mean'] else None,
        '`primer1.mi`': row['primer1.mi'] if row['primer1.mi'] else None,
        '`primer2.mi`': row['primer2.mi'] if row['primer2.mi'] else None,
        '`primer.geometric_mean`': row['primer.geometric_mean'] if row['primer.geometric_mean'] else None,
        '`position.stdev`': row['position.stdev'] if row['position.stdev'] else None,
        '`BED_Site_Name`': row['BED_Site_Name'] if row['BED_Site_Name'] else None,
        '`BED_Score`': row['BED_Score'] if row['BED_Score'] else None,
        '`BED_Site_Chromosome`': row['BED_Site_Chromosome'] if row['BED_Site_Chromosome'] else None,
        '`Site_SubstitutionsOnly.Sequence`': row['Site_SubstitutionsOnly.Sequence'] if row[
            'Site_SubstitutionsOnly.Sequence'] else None,
        '`Site_SubstitutionsOnly.NumSubstitutions`': row['Site_SubstitutionsOnly.NumSubstitutions'] if row[
            'Site_SubstitutionsOnly.NumSubstitutions'] else None,
        '`Site_SubstitutionsOnly.Strand`': row['Site_SubstitutionsOnly.Strand'] if row[
            'Site_SubstitutionsOnly.Strand'] else None,
        '`Site_SubstitutionsOnly.Start`': row['Site_SubstitutionsOnly.Start'] if row[
            'Site_SubstitutionsOnly.Start'] else None,
        '`Site_SubstitutionsOnly.End`': row['Site_SubstitutionsOnly.End'] if row[
            'Site_SubstitutionsOnly.End'] else None,
        '`Site_GapsAllowed.Sequence`': row['Site_GapsAllowed.Sequence'] if row['Site_GapsAllowed.Sequence'] else None,
        '`Site_GapsAllowed.Length`': row['Site_GapsAllowed.Length'] if row['Site_GapsAllowed.Length'] else None,
        '`Site_GapsAllowed.Score`': row['Site_GapsAllowed.Score'] if row['Site_GapsAllowed.Score'] else None,
        '`Site_GapsAllowed.Substitutions`': row['Site_GapsAllowed.Substitutions'] if row[
            'Site_GapsAllowed.Substitutions'] else None,
        '`Site_GapsAllowed.Insertions`': row['Site_GapsAllowed.Insertions'] if row[
            'Site_GapsAllowed.Insertions'] else '',
        '`Site_GapsAllowed.Deletions`': row['Site_GapsAllowed.Deletions'] if row[
            'Site_GapsAllowed.Deletions'] else None,
        '`Site_GapsAllowed.Strand`': row['Site_GapsAllowed.Strand'] if row['Site_GapsAllowed.Strand'] else None,
        '`Site_GapsAllowed.Start`': row['Site_GapsAllowed.Start'] if row['Site_GapsAllowed.Start'] else None,
        '`Site_GapsAllowed.End`': row['Site_GapsAllowed.End'] if row['Site_GapsAllowed.End'] else None,
        '`Cell`': row['Cell'] if row['Cell'] else None,
        '`Targetsite`': row['Targetsite'] if row['Targetsite'] else None,
        '`TargetSequence`': row['TargetSequence'] if row['TargetSequence'] else None,
        '`RealignedTargetSequence`': row['RealignedTargetSequence'] if row['RealignedTargetSequence'] else None,
        '`IdentifyID`': identified_id,
        '`AnalysisParametersId`': analysis_parameters_id,
        '`experiment_parametersId`': experiment_parameters_id
        # Add more columns as needed
    }
    return data


def find_execl_parameter(df, sample, min_frequency, min_quality):
    print(min_frequency, min_quality, type(min_frequency))
    result = df[(df['Sample'] == sample)]
    filtered_df = result[(result['Min_quality'] == int(min_quality)) & (result['Min_frequency'] == float(min_frequency))]

    return filtered_df


# Handle file upload and database insertion
@app.route('/upload', methods=['POST'])
def upload():
    # Get the form data
    """experiment = request.form['experiment']
    cell = request.form['cell']
    target_sequence = request.form['target_sequence']
    ver_package = request.form['VerPackage']
    ver_python = request.form['VerPython']
    ident_path = request.form['identPath']
    excel_file = request.files['fileInput']
    row_data = request.form['row_data']"""

    ver_package = request.form['VerPackage']
    ver_python = request.form['VerPython']

    min_frequency = request.form['min_frequency']
    min_quality = request.form['min_quality']

    # excel_file = request.files['fileInput']
    excel_file = request.files.getlist('fileInput')
    excel_parameter_file = request.files['fileInputParam']

    if excel_file:
        # Establish a connection with the MySQL database
        connection = mysql.connector.connect(**config)
        df1 = pd.read_excel(excel_parameter_file)

        for file in excel_file:

            # Load the Excel file using a library like 'pandas' or 'openpyxl'

            df = pd.read_csv(file, sep='\t')

            df_param = find_execl_parameter(df1, df['Cell'][0], min_frequency, min_quality)

            print(df_param.columns)
            print(df_param)

            experiment = str(df_param['Cells'].values[0])
            cell = str(df_param['Sample'].values[0])
            target_sequence = str(df_param['Guide'].values[0])
            min_frequency = str(df_param['Min_frequency'].values[0])
            min_quality = str(df_param['Min_quality'].values[0])
            ident_path = str(df_param['Path_to_guideseq_results_identified'].values[0])
            row_data = str(df_param['Path_to_raw_data'].values[0])

            experiment_parameters_id = get_experiment_parameters_id(connection, cell, target_sequence, experiment,
                                                                    row_data)

            analysis_parameters_id = get_analysis_parameters_id(connection, min_quality, min_frequency, ver_python,
                                                                ver_package)
            identified_id = get_identified_id(connection, ident_path)

            # Process each row of the extracted GUIDE-Seq data
            for _, row in df.iterrows():
                # Fetch dependent parameters from related tables
                data = getDict(row, identified_id, analysis_parameters_id, experiment_parameters_id)
                # Insert the row into the database
                data = {key: value if not pd.isna(value) else None for key, value in data.items()}
                cursor = connection.cursor()
                query = f"INSERT INTO `guide_seq_data` ({', '.join(data.keys())}) VALUES ({', '.join(['%s'] * len(data.keys()))})"
                cursor.execute(query, tuple(data.values()))

                connection.commit()

        # Close the database connection
        connection.close()

        # Return a success response
        response = jsonify(message='Upload successful', success=True)
        return response

    # Return a success response
    response = jsonify(message='Upload not successful')
    return response


@app.route('/')
def index():
    return render_template('upload.html')


def get_experiment_parameters_id(connection, cell, TargetSequence, experiment, row_data):
    try:
        rowData = False
        cursor = connection.cursor()

        # Get the cell_id from the CELL table or create a new entry
        cell_query = "SELECT idCell FROM cell WHERE cellName = %s"

        cursor.execute(cell_query, (cell,))
        cell_result = cursor.fetchone()
        idCell = cell_result[0] if cell_result else None

        if not idCell:
            # If the cell entry does not exist, create a new entry and retrieve the generated cell_id
            insert_cell_query = "INSERT INTO cell (cellName) VALUES (%s)"
            cursor.execute(insert_cell_query, (cell,))
            connection.commit()
            idCell = cursor.lastrowid
            rowData = True

        # Get the experiment_id from the experiment table or create a new entry
        experiment_query = "SELECT idExperiment FROM experiment WHERE ExperimentName = %s"
        cursor.execute(experiment_query, (experiment,))
        experiment_result = cursor.fetchone()
        experiment_id = experiment_result[0] if experiment_result else None

        if not experiment_id:
            # If the experiment entry does not exist, create a new entry and retrieve the generated experiment_id
            insert_experiment_query = "INSERT INTO experiment (ExperimentName) VALUES (%s)"
            cursor.execute(insert_experiment_query, (experiment,))
            connection.commit()
            experiment_id = cursor.lastrowid
            rowData = True

        if rowData:
            insert_experiment_query = """INSERT INTO Raw_Data (path, experimentID, CellID)
                    VALUES (%s, %s, %s)"""

            cursor.execute(insert_experiment_query, (row_data, experiment_id, idCell))
            connection.commit()

        # Get the target_id from the target table
        target_query = "SELECT idGuide FROM guide WHERE guide = %s"
        cursor.execute(target_query, (TargetSequence,))
        target_result = cursor.fetchone()
        target_id = target_result[0] if target_result else None

        if not target_id:
            # If the experiment entry does not exist, create a new entry and retrieve the generated experiment_id
            insert_experiment_query = "INSERT INTO guide (guide) VALUES (%s)"
            cursor.execute(insert_experiment_query, (TargetSequence,))
            connection.commit()
            target_id = cursor.lastrowid

        if idCell and target_id and experiment_id:
            # Prepare the SELECT query to check if the entry already exists
            select_query = "SELECT ID_experiment_parameters FROM experiment_parameters WHERE cellID = %s AND guideID = %s AND experimentID = %s"
            cursor.execute(select_query, (idCell, target_id, experiment_id))

            # Fetch the result
            result = cursor.fetchone()

            if result:
                # If the entry already exists, return the existing mech_id
                return result[0]
            else:
                # If the entry does not exist, create a new entry and retrieve the generated mech_id
                insert_query = "INSERT INTO experiment_parameters (cellID, guideID, experimentID) VALUES (%s, %s, %s)"
                cursor.execute(insert_query, (idCell, target_id, experiment_id))
                connection.commit()

                # Retrieve the generated mech_id
                mech_id = cursor.lastrowid
                return mech_id

        else:
            print("Error: Invalid cell, target, or experiment.")
            return None

    except mysql.connector.Error as error:
        print("Error executing MySQL query:", error)
        return None


def get_analysis_parameters_id(connection, min_quality, min_frequency, ver_python, ver_package):
    try:
        cursor = connection.cursor()

        # Prepare the SELECT query to check if the entry already exists
        select_query = "SELECT IDanalysis_parameters FROM analysis_parameters WHERE min_quality = %s AND min_frequency = %s AND version_of_python = %s AND version_of_package = %s"
        cursor.execute(select_query, (min_quality, min_frequency, ver_python, ver_package))

        # Fetch the result
        result = cursor.fetchone()

        if result:
            # If the entry already exists, return the existing analysis_parameters_id
            return result[0]
        else:
            # If the entry does not exist, create a new entry and retrieve the generated analysis_parameters_id
            insert_query = "INSERT INTO analysis_parameters (min_quality, min_frequency, version_of_python, version_of_package) VALUES (%s, %s, %s, %s)"
            cursor.execute(insert_query, (min_quality, min_frequency, ver_python, ver_package))
            connection.commit()

            # Retrieve the generated analysis_parameters_id
            analysis_parameters_id = cursor.lastrowid
            return analysis_parameters_id

    except mysql.connector.Error as error:
        print("Error executing MySQL query:", error)
        return None


# Fetch the analysis parameters ID based on external parameters
# Return the obtained ID

def get_identified_id(connection, ident_path):
    try:
        cursor = connection.cursor()

        # Prepare the SELECT query to check if the entry already exists
        select_query = "SELECT IDidentified FROM identified WHERE path = %s"
        cursor.execute(select_query, (ident_path,))

        # Fetch the result
        result = cursor.fetchone()

        if result:
            # If the entry already exists, return the existing identified_id
            return result[0]
        else:
            # If the entry does not exist, create a new entry and retrieve the generated identified_id
            insert_query = "INSERT INTO identified (path) VALUES (%s)"
            cursor.execute(insert_query, (ident_path,))
            connection.commit()

            # Retrieve the generated identified_id
            identified_id = cursor.lastrowid
            return identified_id

    except mysql.connector.Error as error:
        print("Error executing MySQL query:", error)
        return None


# Fetch the identified ID based on external parameters
# Return the obtained ID

if __name__ == '__main__':
    app.run()
