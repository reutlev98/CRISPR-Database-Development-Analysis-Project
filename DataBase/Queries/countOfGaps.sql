# Calculation how many sites could be GAPs per expiriment 
SELECT Targetsite, count(`guide_seq_data`.`Site_GapsAllowed.Sequence`), min_frequency, min_quality
FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
WHERE AnalysisParametersId = IDanalysis_parameters
AND `guide_seq_data`.`Site_GapsAllowed.Sequence` != ''
group by  Targetsite, min_frequency, min_quality;

# Calculation how many sites could be GAPs
SELECT count(number_of_gaps),min_frequency, min_quality 
FROM (
SELECT Targetsite, count(`guide_seq_data`.`Site_GapsAllowed.Sequence`) as number_of_gaps, min_frequency, min_quality
FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
WHERE AnalysisParametersId = IDanalysis_parameters
AND `guide_seq_data`.`Site_GapsAllowed.Sequence` != ''
group by  Targetsite, min_frequency, min_quality) as subTable
group by min_frequency, min_quality;
