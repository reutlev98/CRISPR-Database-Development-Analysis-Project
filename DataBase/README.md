

# README: Database Creation and Management

## Overview

This guide provides instructions for setting up, managing, and utilizing the MySQL database for GUIDE-seq experimental data.

## Database Design

To build the database optimally:

- **3NF Algorithm**: We applied the Third Normal Form (3NF) algorithm to structure the tables. This ensures effective data updating—any additions or changes do not require updates to multiple tables or columns, and it prevents redundant information.
- **Simplicity**: We maintained a straightforward design to facilitate easy querying and maintenance by laboratory personnel.

The database consists of approximately 8 tables. The central table is **guide_seq_data**, which contains the results of the experiments. This table is linked to other tables providing details about the analysis, the wet experiment, and links to raw information.

## Database Schema

![schema](https://github.com/user-attachments/assets/8fe8f3a4-6f52-47e7-bbff-2eee86b13b29)



**Tables:**

1. **CELL**: Contains information about cell types used in experiments.
2. **Experiment**: Stores names of experiments in the format `GUIDE_NAME-REPLICATE`.
3. **RawData**: Links experiments and cell types to raw data files.
4. **GUIDE**: Information about GUIDE sequences.
5. **experiment_parameter**: Details including experiment type, cell, guide, and additional information.
6. **Identified**: Links to files with identified results.
7. **Analysis_parameter**: Parameters related to analysis such as package version and Python version.
8. **GUIDE-Seq data**: Results from GUIDE-seq experiments.

For detailed schema information, refer to the [Schema Documentation](DataBase/DATABASE schema - explanation.pdf).

## Database Files

In the **DatabaseFiles** folder, you will find SQL files for creating tables and loading information into the database via MySQL.

For more information, see the [DatabaseFiles folder]([DataBase/DatabaseFiles](https://github.com/reutlev98/CRISPR-Database-Development-Analysis-Project/tree/76b52a76c1bea5a325ede3f49a596893d0e462c1/DataBase/DatabaseFiles)).

## Queries

The **Queries** folder contains SQL queries designed for analyzing the data in the database.

For more information, see the [Queries folder](DataBase/Queries).

## Uploading New Data

The **UploadNewData** tool facilitates the uploading of new data into the database. The web interface allows users to input parameters and upload files.

For more information, see the [Upload New Data folder](DataBase/UploadNewData).

## Additional Resources

- [DataBase/MySQL Installation Guide.pdf](https://github.com/reutlev98/CRISPR-Database-Development-Analysis-Project/blob/2a1eaffd1f653a77e0de611345c2f7eb63fe2336/DataBase/MySQL%20Installation%20Guide.pdf): Instructions for installing MySQL.
- [DataBase/MySQL connection via VPN.pdf](https://github.com/reutlev98/CRISPR-Database-Development-Analysis-Project/blob/87f5b59c79c95233cc9028d04211385c088d33f2/DataBase/MySQL%20connection%20via%20VPN.pdf): Guide for connecting to MySQL via VPN.


