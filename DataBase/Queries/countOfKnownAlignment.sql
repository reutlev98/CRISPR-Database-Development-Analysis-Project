#Calculation of the number of times an experiment has been aligned
SELECT Targetsite,count(BED_Site_Name),min_frequency, min_quality FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
where AnalysisParametersId = IDanalysis_parameters
AND BED_Site_Name != ''
group by  Targetsite,min_frequency, min_quality;


#Calculation of the amount of experiments in which there is a known ALIGNMENT
SELECT count(number_of_alignment),min_frequency, min_quality from (
SELECT Targetsite,count(BED_Site_Name) as number_of_alignment,min_frequency, min_quality FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
where AnalysisParametersId = IDanalysis_parameters
AND BED_Site_Name != ''
group by  Targetsite,min_frequency, min_quality) as subTable
group by min_frequency, min_quality;


#Calculation of the percentage of experiments in which there is a known ALIGNMENT
SELECT (count(number_of_alignment)/count(distinct Targetsite))*100 as precentage ,min_frequency, min_quality from (
SELECT Targetsite,count(BED_Site_Name) as number_of_alignment,min_frequency, min_quality FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
where AnalysisParametersId = IDanalysis_parameters
AND BED_Site_Name != ''
group by  Targetsite,min_frequency, min_quality) as subTable
group by min_frequency, min_quality;