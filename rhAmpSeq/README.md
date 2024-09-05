

# rhAmpSeq CRISPR Analysis

## Overview

This project automates the analysis of CRISPR-Cas9 gene editing data using **CRISPResso2** and **Crispector**, two powerful tools for quantifying and visualizing the results of genome-editing experiments. The Bash scripts provided streamline the processing of high-throughput sequencing data, converting configurations and analyzing multiple experiments in an efficient, automated manner.

### Tools Used

- **CRISPResso2**: A comprehensive suite designed for analyzing the outcomes of CRISPR-Cas9 gene editing experiments. It detects insertions, deletions (indels), and single nucleotide variations in sequencing data and generates visual and quantitative reports.
  
- **Crispector**: A tool designed to assess the off-target effects of CRISPR-Cas9 experiments, particularly useful for evaluating the specificity of edits and determining off-target activities in comparison to control (mock) samples.

For more information and access to the tools, visit their respective GitHub repositories:
- [CRISPResso2 GitHub](https://github.com/pinellolab/CRISPResso2)
- [Crispector GitHub](https://github.com/nadavbra/crispector)

---

## Scripts Overview

### `CRISPResso2_script.sh`

This Bash script automates the processing of CRISPR-Cas9 data using **CRISPRessoPooled** on multiple experiments. Each experiment is defined in a CSV file that lists the experimental parameters, such as the read files and amplicon sequences. The script iterates through the experiments and runs CRISPResso2 on each one, generating detailed reports.

#### Key Variables:
1. **File**: The name of the input CSV file (e.g., `dataFileForMainScript.csv`) that lists the experiments.
2. **log_file**: The name of the log file to record the progress of each run.
3. **GENOME**: Path to the reference genome file for alignment.

#### Input CSV Structure:
The input CSV should include:
1. **Experiment name**: Unique name for each experiment.
2. **Path to forward read file**: Gzipped FASTQ file for the forward reads.
3. **Path to reverse read file**: Gzipped FASTQ file for the reverse reads.
4. **Amplicon sequence file**: FASTA file containing the amplicon sequences for each experiment.
5. **Amplicon name**: The name of the specific amplicon being analyzed.

#### Output:
- Results are saved in the current directory with filenames based on the experiment and amplicon names.
- A log file (`crispector_log`) records the progress and any issues encountered during processing.

#### Usage Example of **CRISPResso2 Analysis**:
   - Prepare your CSV file listing all experiments.
   - Run the `CRISPResso2_script.sh` to automate the analysis:
     ```bash
     bash CRISPResso2_script.sh
     ```
   - Results will be saved in the current directory, with a log file to track the progress.


### `crispector_script.sh`

This script processes CRISPR-Cas9 data using **Crispector**, which analyzes off-target editing events by comparing CRISPR-edited samples to control (mock) samples.

#### Key Variables:
1. **CSV file**: Contains experiment details such as experiment name, mock sample name, and configuration file.
2. **FASTQ input files**: The script processes paired-end reads (R1 and R2) from both the experiment and mock samples.

#### Input CSV Structure:
1. **Experiment name**: Name of the experiment.
2. **Mock sample name**: Name of the control sample.
3. **Configuration file**: Crispector configuration file.

#### Output:
- Crispector generates detailed output files based on the experiment name and configuration file, logging the analysis progress into the specified log file.

#### Usage Example of **Crispector Analysis**:
   - Use `crispector_script.sh` to process your experiments:
     ```bash
     bash crispector_script.sh
     ```

### `convert_CSV_to_txt.sh`

This simple Bash script converts CSV files into TXT format for downstream processing. It reads the specified CSV file and outputs a plain-text version, useful for situations where TXT format is required for further analysis or input into other tools.

#### Key Variables:
1. **CSV file**: The input CSV file to be converted.

#### Output:
- The converted file is saved in TXT format in the same directory.

#### Usage Example 
- Use `convert_CSV_to_txt.sh` for simple CSV to TXT conversions:
     ```bash
     bash convert_CSV_to_txt.sh
     ```

### `convert_crispector_config_to_crispresso2.sh`

This script automates the conversion of **Crispector** configuration files into the format required by **CRISPResso2**, enabling easy transfer of experimental settings between the two tools.

#### Key Variables:
1. **readFolder**: Directory containing the Crispector configuration files.
2. **newFolder**: Directory where the converted CRISPResso2 configuration files will be saved.

#### Usage Example 
- Use `convert_crispector_config_to_crispresso2.sh` to convert configuration files:
     ```bash
     bash convert_crispector_config_to_crispresso2.sh
     ```

