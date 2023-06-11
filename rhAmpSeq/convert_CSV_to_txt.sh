#!/bin/bash

# Create output folder
output_folder="output"
mkdir -p "$output_folder"

# Loop through CSV files
for csv_file in "crispresso2"/*.csv; do
    # Create output file name
    txt_file="$output_folder/$(basename "$csv_file" .csv).txt"
    # Convert CSV to TSV and write to output file
    awk -F'\t' -v OFS='\t' '{$1=$1} 1' "$csv_file" > "$txt_file"
done

echo "Done"
