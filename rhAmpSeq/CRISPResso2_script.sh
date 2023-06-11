#!/bin/bash‏
File="dataFileForCripresso2Script.csv"
log_file="cripresso2_log"
superFolfder="rhAmpSeq_data"
GENOME=""
cat $File |while read line
do
	#take the first col 
	EXP=$(echo $line | awk '{print $1}');
	Duplicate=$(echo $line | awk '{print $2}');
	CONF=$(echo $line | awk  '{print $3}');
	cat $CONF |while read line_of_conf
	do
		AMP_NAME=$(echo $line_of_conf | awk  '{print $1}');
		AMPLICONS=$(echo $line_of_conf | awk '{print $2}');
	done
	echo $EXP $Duplicate $CONF $AMP_NAME $AMPLICONS
	CRISPRessoPooled -r1 $superFolfder/$EXP/$Duplicate/$EXP"-Cr-"$Duplicate".r1.fastq.gz" -r2 $superFolfder/$EXP/$Duplicate/$EXP"-Cr-"$Duplicate".r2.fastq.gz" -f $AMPLICONS --name $AMP_NAME --gene_annotations $GENOME -o "CRISPResso2_output"/$EXP"_"$Duplicate 
done
