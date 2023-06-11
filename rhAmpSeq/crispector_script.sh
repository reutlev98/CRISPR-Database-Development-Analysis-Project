#!/bin/bash‏
File="dataFileForCrispectorScript.csv"
log_file="crispector_log"
superFolfder="rhAmpSeq_data"
cat $File |while read line
do
	#take the first col 
	EXP=$(echo $line | awk '{print $1}');
	Duplicate=$(echo $line | awk '{print $2}');
	CONF=$(echo $line | awk  '{print $3}');
	echo $EXP $MOCK $CONF
	crispector -t_r1 $superFolfder/$EXP/$Duplicate/$EXP"-Cr-"$Duplicate".r1.fastq.gz" -t_r2 $superFolfder/$EXP/$Duplicate/$EXP"-Cr-"$Duplicate".r2.fastq.gz" -m_r1 $superFolfder/$EXP/$Duplicate/$EXP"-Mock-"$Duplicate".r1.fastq.gz" -m_r2 $superFolfder/$EXP/$Duplicate/$EXP"-Mock-"$Duplicate".r2.fastq.gz" -c rhamseq_config_file/$CONF -o $EXP"_"$Duplicate|& tee -a $log_file
done

