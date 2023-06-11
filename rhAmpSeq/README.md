# CRISPResso2_script.sh
This Bash script is designed to automate CRISPR analysis using CRISPRessoPooled on multiple experiments and amplicons listed in a CSV file.
defining variables:
1. File: the name of the input CSV file
2. log_file: the name of the log file to be generated
3. GENOME: the path to the genome reference file

The input CSV file (dataFileForMainScript.csv) should contain one experiment per row with the following columns:

1. Experiment name (e.g., "exp1")
2. Path to the forward read file in gzipped FASTQ format (e.g., "exp1_1.fastq.gz")
3. Path to the reverse read file in gzipped FASTQ format (e.g., "exp1_2.fastq.gz")
4. Path to the amplicon sequence file in FASTA format (e.g., "amplicons.fasta")
5.Name of the amplicon being analyzed (e.g., "amplicon1")

The output of the script is automatically saved in the current working directory with a filename based on the experiment name and amplicon name. The log file (crispector_log) is also generated in the current working directory.

# crispector_script.sh
This Bash script processes data for CRISPR-Cas9 gene editing experiments using the "crispector" tool. It reads input data from a CSV file and runs the "crispector" command on each row of the file, producing output files and logging messages.

- Input data file in CSV format with the following columns:
1. Experiment name (string)
2. Mock sample name (string)
3. Configuration file name (string)
-Input data files in FASTQ format with the following naming conventions:
1. Experiment read 1: {experiment_name}_R1.fq.gz
2. Experiment read 2: {experiment_name}_R2.fq.gz
3. Mock read 1: {mock_name}_R1.fq.gz
4. Mock read 2: {mock_name}_R2.fq.gz

The script produces a log file with the name specified in the log_file variable. The crispector tool produces output files in the same directory as the script, with names based on the experiment name and configuration file name

# convert_CSV_to_txt.sh
A script that converts CSV files to a TXT file.

# convert_crispector_config_to_crispresso2.sh
A script that converts crispector config files to CRISPResso2 config files.
defining variables:
1. readFolder - refers to the directory where the crispector config files are stored.
2. newFolder - name of the directory where the CRISPResso2 configuration files will be stored
