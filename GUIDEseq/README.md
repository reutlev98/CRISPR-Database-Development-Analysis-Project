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


# to_bed_format.sh
defining variables:

1. readFolder - A folder with GUIDEseq analysis result files (identifiedOfftargets)
2. newFolder - Defining a name for a new folder where the OUTPUT files will be

the script:
This script goes through the GUIDEseq analysis results (identifiedOfftargets) and exports specific columns to create a file in BED format. 
- BED_Chromosome
- BED_Min.Position
- BED_Max.Position
- BED_Name
- Site_SubstitutionsOnly.Strand
- Site_GapsAllowed.Strand
- Site_SubstitutionsOnly.Sequence
- Site_GapsAllowed.Sequence
- Cell
- TargetSequence
