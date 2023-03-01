# genomProject
third year project

# guideseqScriptByFile.sh
defining variables:

1. File is the name of a CSV file containing information about the samples (Folder, Duplicate, and target)
2. superFolfder is the name of the directory containing the FASTQ files
3. pythonScript is the path to the guideseq.py Python script used for processing the data
4. genom is the path to the reference genome used for alignment
5. outfolder is the name of the output directory where the results will be saved
6. min_quality is the minimum quality score allowed for a base to be considered in the analysis
7. min_frequency is the minimum frequency of a mutation to be considered in the analysis
8. log_file is the name of a file where the logs will be written
The script then reads each line of the CSV file using a while loop, where each line contains information about a sample (Folder, Duplicate, and target). For each sample, the script performs the following steps:

the script:
- Extracts the Folder, Duplicate, and target information from the CSV file
- Uses the guideseq.py script to process the FASTQ files for the sample
- Performs UMI tagging, consolidation, alignment, identification of off-target sites, and visualization of the results using the guideseq.py script.
- Writes the log output to the log_file

# CRISPResso.sh
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

# crispector.sh
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


