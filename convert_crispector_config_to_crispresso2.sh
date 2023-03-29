#!/bin/bash‏
readFolder="rhamseq_config_file"
newFolder="crispresso2_config_file"
mkdir $newFolder

cd $readFolder

for f in *; do
echo $f;
cat "$f" | awk 'BEGIN {FS=","; OFS=","} {print $1, $2, "NA", "NA"}' | tail -n +2 >> "../$newFolder/$f"
done

# select column 1 and 2 and add NA . 
