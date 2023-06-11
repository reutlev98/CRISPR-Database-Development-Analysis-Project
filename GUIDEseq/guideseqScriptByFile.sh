#!/bin/bash‏
File="dataFileForMainScript.csv"
superFolfder="ALL_GS_FASTQ"
pythonScript="/home/shir/anaconda3/envs/guideseq/bin/guideseq.py"
genom="/home/labhendel/Documents/genome/GCA_000001405.15_GRCh38_no_alt_analysis_set/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna"
outfolder="0.4_10_params"
min_quality="10"
min_frequency="0.4"
log_file="log_file_0.4_10"
cat $File |while read line
do
	Folder=$(echo $line | awk '{print $1}');
	Duplicate=$(echo $line | awk '{print $2}');
	target=$(echo $line | awk  -v f=$Folder '$1==f {print $3}');
	echo $Folder $Duplicate $target
	
	python $pythonScript umitag --read1 $superFolfder/$Folder/$Duplicate/$Folder-$Duplicate.r1.fastq \
	 --read2 $superFolfder/$Folder/$Duplicate/$Folder-$Duplicate.r2.fastq \
	 --index1 $superFolfder/$Folder/$Duplicate/$Folder-$Duplicate.i1.fastq \
	 --index2 $superFolfder/$Folder/$Duplicate/$Folder-$Duplicate.i2.fastq \
	 --outfolder $outfolder/ |& tee -a $log_file
	 
	python $pythonScript consolidate --read1 $outfolder/umitagged/$Folder-$Duplicate.r1.umitagged.fastq \
	  --read2 $outfolder/umitagged/$Folder-$Duplicate.r2.umitagged.fastq \
	  --outfolder $outfolder/ --min_quality $min_quality --min_frequency $min_frequency |& tee -a $log_file

	python $pythonScript align --bwa bwa --genome $genom\
	  --read1 $outfolder/consolidated/$Folder-$Duplicate.r1.consolidated.fastq\
	  --read2 $outfolder/consolidated/$Folder-$Duplicate.r2.consolidated.fastq\
	  --outfolder $outfolder/ |& tee -a $log_file
	 
	python $pythonScript identify --aligned $Folder-$Duplicate.sam\
	  --genome $genom --outfolder $outfolder/\
	  --target_sequence $target --description $Folder-$Duplicate |& tee -a $log_file

	python $pythonScript visualize --infile /home/shir/Documents/project/GuideSeqData/$outfolder/identified/$Folder-$Duplicate"_identifiedOfftargets.txt"\
	  --outfolder $outfolder/ --title $Folder-$Duplicate |& tee -a $log_file
done

