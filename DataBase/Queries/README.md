
# SQL Queries for Data Analysis

## Overview

This document provides an overview of how to use SQL queries to analyze experimental data. The focus includes off-target events, key experiments, chromosome density, and alignment percentages.

## Analysis Objectives

### 1. Amount of Off-Target Events Divided by Parameters
![image](https://github.com/user-attachments/assets/85dfbee2-84d0-4533-866e-1907664000c8)


**Objective**: Calculate and compare the number of off-target events observed for different parameter settings (e.g., min_frequency and min_quality). 

**Details**: Typically, higher parameter values (e.g., 0.9,15) result in fewer off-target events compared to lower values (e.g., 0.4,10). The analysis focuses on parameters (0.4,10) for significant off-target events.

### 2. The 10 Experiments with the Largest Number of Off-Target Events
![image](https://github.com/user-attachments/assets/dcc87a45-b9b0-4d76-9d5f-f9d42e7682b6)


**Objective**: Identify the top 10 experiments with the highest number of off-target events.

**Details**: For instance, `S17_PLUSE_3_E2_CISH` has the highest number with 1627 off-target events.

### 3. Chromosomes with the Highest Off-Target Density
![image](https://github.com/user-attachments/assets/cf1eb1aa-93e3-4449-a027-a3f0e0452531)


**Objective**: Determine which chromosomes exhibit the highest density of off-target sites.

**Details**: Density is calculated by dividing the number of off-target sites by the length of the chromosome. Chromosomes 17 and 19 have been observed to show the highest densities.

### 4. Percentage of Known Alignment from Total Data
![image](https://github.com/user-attachments/assets/61fef4af-b343-4034-97c8-94b2f3a0efe0)


**Objective**: Assess the percentage of sites with successful alignment to their corresponding genome positions.

**Details**: The analysis indicates that only 33% of the sites show alignment. This percentage is relatively low and highlights challenges in identifying and accurately locating off-target sites.

### 5. The 10 Sites with the Highest Alignment Percentage
![image](https://github.com/user-attachments/assets/bfbf5cdc-8ebe-4e1f-bed4-d30abe607852)


**Objective**: Identify the top 10 sites with the highest alignment percentages.

### 6. The 10 Sites with the Lowest Alignment Percentage
![image](https://github.com/user-attachments/assets/1bcdcfdc-5a48-408e-bd94-4aa60231bb5d)


**Objective**: Identify the top 10 sites with the lowest alignment percentages.

**Details**: On average, 523 sites are off-target in these experiments, with an average of 5 aligned sites.

### 7. Alignment Percentage Breakdown
![image](https://github.com/user-attachments/assets/533072fc-0774-4aa5-aa79-5686c085cd44)


**Objective**: Analyze alignment percentages based on alignment modes, including exact sequence alignment and flexible alignment with gaps.

**Details**:
- **Exact Sequence Alignment**: Matches sequences completely with the reference genome.
- **Flexible Alignment with Gaps**: Allows for sequence variations and gaps, which helps account for minor differences due to genetic changes or experimental noise.

**Analysis**: The graph displays:
- The percentage of sites with exact alignment (including gaps).
- The percentage of sites with flexible alignment (gaps only).
- The percentage of sites with exact alignment only (without gaps).

## Additional Information

For detailed instructions and further information on using these queries, please refer to the [Queries Documentation](https://github.com/reutlev98/CRISPR-Database-Development-Analysis-Project/blob/789c82f8b7758850d2fa75306dcecbcc48445007/DataBase/Queries/Results.pdf).
