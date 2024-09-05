

# MySQL-Based Biological Data Analysis with GUIDE-seq and rhAmpSeq

## Overview

This project focuses on the development of a MySQL database to manage and analyze biological data. The dataset was gathered using GUIDE-seq and rhAmpSeq, two advanced techniques for genome editing and genetic analysis. The database enables the comparison of results from experimental runs with different parameters and facilitates the analysis of biological sequences.

The project consists of the following major phases:
1. **Data Gathering**: Using GUIDE-seq and rhAmpSeq for collecting raw genetic data.
2. **Database Design**: Planning an Entity-Relationship Diagram (ERD) and creating a robust MySQL database.
3. **Data Loading**: Inputting the data into the MySQL database for efficient querying.
4. **Analysis**: Writing SQL queries to draw meaningful insights from the experimental data, comparing different runs, and understanding the outcomes of genome editing experiments.

## Technologies Used
- **MySQL**: For creating and managing the database.
- **GUIDE-seq**: A genome-editing tool used for mapping off-target effects of CRISPR-Cas systems.
- **rhAmpSeq**: Another technology used for high-throughput genotyping and genetic sequencing.
- **SQL**: Structured Query Language for querying and analyzing data.
- **Python** : Used for additional scripting, data manipulation, or automation.

## Folder Structure
- **DataBase**: Contains the MySQL database scripts, ERD, and data files. [click here to learn more about the DataBase](DataBase).
- **GUIDEseq**: Scripts and results related to the GUIDE-seq technique. [click here to learn more about data gathering using GUIDE-seq](GUIDEseq).
- **rhAmpSeq**: Scripts and results related to the rhAmpSeq analysis. [click here to learn more about data gathering using rhAmpSeq](rhAmpSeq).

## Biological Background 
- **CRISPR-Cas9**: CRISPR (Clustered Regularly Interspaced Short Palindromic Repeats) is a revolutionary genome-editing technology that allows scientists to precisely alter DNA sequences and modify gene function. It relies on a protein called Cas9, which acts like molecular scissors to cut the DNA at a specific location. This technology has vast applications in research, medicine, and biotechnology, including gene therapy, agricultural improvements, and studying gene function.
  
- **GUIDE-seq** (Genome-wide Unbiased Identification of DSBs Evaluated by Sequencing): GUIDE-seq is a method used in combination with CRISPR-Cas9 to identify both on-target and off-target DNA double-strand breaks (DSBs). The main purpose of GUIDE-seq is to evaluate the specificity and safety of genome editing by detecting unintended off-target effects, which can be critical for ensuring the accuracy and reliability of CRISPR-based gene editing experiments.

- **rhAmpSeq**: rhAmpSeq is a genotyping platform designed for high-throughput and highly accurate sequencing of genetic variants. It is particularly useful for large-scale genetic analysis, offering a robust method for identifying single nucleotide polymorphisms (SNPs) and other genetic variations across different samples. In this project, rhAmpSeq was used to analyze the outcomes of various experimental conditions to compare genetic modifications.


