# GUIDE-Seq Data Uploader
This Flask web application allows users to upload GUIDE-Seq data into a MySQL database. It processes experimental results and relevant parameters from uploaded files and inserts the data into the database for further analysis and retrieval.

## Fill in the required information:
- Version Of Package: Enter the version of the GUIDE-Seq package used (e.g. "guide-seq 1.0.2").
- Version Of Python: Enter the version of Python used (e.g. "Python 3").
- Min Frequency: Enter the minimum frequency value (numeric, e.g. "0.9").
- Min Quality: Enter the minimum quality value (numeric, e.g. "15").
- File: Upload one or more files with experimental results (in TSV format) by clicking on the "Choose File" button.
- File Parameters: Upload a file with additional experiment parameters (in Excel format) by clicking on the "Choose File" button.
The file is in the lab's Dropbox and is called "summative_excel_scheme" The format is:
![image](https://github.com/reutlev98/genomProject/assets/118205078/b0e4a4ce-5cd4-46ae-93fc-9492c31f5ec0)



Click the "Upload" button to start the data uploading process.

After successful upload, you will see an alert indicating the success of the upload process.

## Database Configuration

The application uses a MySQL database to store the uploaded data.
Update the `user`, `password`, `host`, and `database` fields according to your MySQL configuration.

## Additional Information

- The application parses the uploaded files and retrieves relevant information such as experiment parameters, cell information, target sequences, etc.
- The uploaded data is processed and inserted into the MySQL database using the provided `getDict()` function.
- The application supports multiple file uploads to process and insert data from different experiments.
- CORS (Cross-Origin Resource Sharing) is enabled for all routes, allowing data uploads from different domains.
