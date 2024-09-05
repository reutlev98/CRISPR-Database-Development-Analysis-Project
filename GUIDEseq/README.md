
# GUIDE-seq Overview and Script Explanation

**GUIDE-seq** (Genome-wide Unbiased Identification of DSBs Evaluated by Sequencing) is a genome-editing analysis tool used to detect both on-target and off-target double-strand breaks (DSBs) induced by CRISPR-Cas9. By incorporating a short double-stranded oligonucleotide (dsODN) into DSB sites, GUIDE-seq identifies unintended edits across the genome, making it a critical tool for ensuring the precision and safety of genome-editing experiments.

The **GUIDE-seq tool** processes raw sequencing data (in FASTQ format) to pinpoint off-target sites and includes the following core features:
- **Demultiplexing**: Separates sequences by barcode to differentiate samples.
- **UMI Tagging**: Uses Unique Molecular Identifiers (UMIs) to eliminate PCR duplicates, ensuring more accurate results.
- **Alignment**: Aligns reads to the reference genome to identify precise edit locations.
- **Off-target Identification**: Detects candidate off-target sites using algorithms like **Smith-Waterman**.
- **Visualization**: Graphically presents off-target sites compared to on-target sequences.

You can explore the GUIDE-seq tool further through its [GitHub repository](https://github.com/tsailabSJ/guideseq), where you’ll find installation guidelines and detailed documentation.

### GUIDE-seq Processing Script: `guideseqScriptByFile.sh`

The script `guideseqScriptByFile.sh` is a bash script designed to automate the processing of GUIDE-seq data, which is used for detecting genome editing off-target effects. It integrates with a Python-based tool (`guideseq.py`) and a reference genome for aligning and analyzing sequencing data.

#### Key Variables Defined:
- **File**: Refers to a CSV file containing metadata about the samples, such as:
  - **Folder**: Directory where the sample's raw sequencing data (FASTQ files) are stored.
  - **Duplicate**: Replicate information of the sample.
  - **Target**: Genetic target that the sample is intended to edit or analyze.
- **superFolder**: Directory where all the raw FASTQ files reside.
- **pythonScript**: Path to the `guideseq.py` script responsible for running GUIDE-seq analysis.
- **genome**: Path to the reference genome file used for aligning the sequencing reads.
- **outFolder**: Output directory where the processed data will be saved.
- **min_quality**: Minimum quality score threshold for considering a sequencing base valid during analysis.
- **min_frequency**: Minimum frequency threshold for including a mutation in the final analysis.
- **log_file**: File to log the process and analysis details for each sample.

#### Execution Flow:
1. **Sample Processing**:
   - The script loops over each line in the CSV file (`File`), extracting the sample information such as Folder, Duplicate, and target.
   - For each sample, the script:
     - Calls the Python script `guideseq.py` to process the corresponding FASTQ files.
     - Performs operations such as **UMI tagging**, **consolidation**, **alignment**, and **identification of off-target sites**.
     - Logs the process details into the specified log file.

2. **UMI Tagging and Alignment**:
   - Unique Molecular Identifiers (UMIs) are used to tag and identify duplicate reads, ensuring that sequencing errors are minimized.
   - The aligned reads are checked for off-target editing using the reference genome to identify potential sites outside the intended target (off-target).

#### BED File Creation with `to_bed_format.sh`:
This script extracts specific data from the GUIDE-seq analysis to generate a **BED file**, a standard format used for genome annotations. The file includes columns such as:
- **BED_Chromosome**: Chromosome where the off-target effect was detected.
- **BED_Min.Position**: Start position of the off-target region.
- **BED_Max.Position**: End position of the off-target region.
- **Site Sequences**: Sequences with and without substitutions and gaps, showing the exact off-target variations.

This BED file is essential for visualizing genomic intervals and off-target sites in genome browsers, enabling more precise comparisons of the on-target versus off-target effects.

#### Goal of the Script:
The goal of the `GUIDEseqScriptByFile.sh` script is to automate the processing of raw sequencing data and streamline the identification of off-target sites in genome editing experiments. By using a combination of UMI-based read consolidation and precise genome alignment, the script aims to enhance the accuracy and reliability of CRISPR-Cas9 off-target detection. This process is crucial for improving the specificity and safety of genome-editing technologies, which is particularly important in clinical and research applications.

# comparisons.py: BED File Comparison for Off-Target Detection

## Overview

`comparisons.py` is a Python script designed to compare two BED files containing genomic data, typically from GUIDE-seq experiments. It identifies overlapping and non-overlapping regions between two experiments to detect differences in off-target editing sites.

## Purpose

The primary goal of this script is to:
- **Compare two sets of BED files**: These files contain genomic intervals representing detected off-target sites.
- **Identify overlapping regions**: The script detects whether off-target regions overlap across different experimental conditions.
- **Highlight differences**: It outputs regions that do not overlap between the two datasets, indicating differences in off-target detection between experiments.


## Functionality

### `comper(bed1, bed2, output, x='', y='', header=True)`
- **Parameters**:
  - `bed1` and `bed2`: Paths to the two BED files to compare.
  - `output`: Name of the output file where differences are saved.
  - `x`, `y`: Optional labels to distinguish columns from each file.
  - `header`: Boolean to include the header in the output (default `True`).
- **Process**:
  - Reads both BED files and merges them based on chromosomes.
  - Checks for overlapping genomic regions between the two files.
  - Filters out overlaps and outputs non-overlapping (different) regions.

### Script Workflow
- Iterates over files in two directories (`bedformat-X` and `bedformat-Y`).
- Compares corresponding files using `comper()` and appends differences to the output.

## Usage

1. **Prepare directories**: Place BED files from each experiment in `bedformat-X` and `bedformat-Y`.
2. **Run the script**:
   ```bash
   python comparisons.py
   ```
3. **Output**: Differences are saved in a file named `X_Y`.

## Dependencies
- **Python 3.x**
- **pandas**, **numpy**, **os**
