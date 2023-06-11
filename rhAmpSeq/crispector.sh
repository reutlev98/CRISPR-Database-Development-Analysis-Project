#!/bin/bash‏
File="dataFileForMainScript.csv"
log_file="crispector_log"
cat $File |while read line
do
	#take the first col 
	EXP=$(echo $line | awk '{print $1}');
	MOCK=$(echo $line | awk '{print $2}');
	CONF=$(echo $line | awk  '{print $3}');
	echo $EXP $MOCK $CONF
	crispector -t_r1 $EXP"_R1.fq.gz" -t_r2 $EXP"_R2.fq.gz" -m_r1 $MOCK"_R1.fq.gz" -m_r2 $MOCK"_R2.fq.gz" -c $CONF.csv |& tee -a $log_file
done
