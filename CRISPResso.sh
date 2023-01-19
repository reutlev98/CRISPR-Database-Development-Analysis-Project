#!/bin/bash‏
File="dataFileForMainScript.csv"
log_file="crispector_log"
GENOME=""
cat $File |while read line
do
	#take the first col 
	EXP=$(echo $line | awk '{print $1}');
	AMPLICONS=$(echo $line | awk '{print $2}');
	AMP_NAME=$(echo $line | awk  '{print $3}');
	echo $EXP $AMPLICONS $AMP_NAME
	CRISPRessoPooled -r1 $EXP"_1.fastq.gz" -r2 $EXP"_2.fastq.gz" -f $AMPLICONS --name $AMP_NAME --gene_annotations $GENOME
done
