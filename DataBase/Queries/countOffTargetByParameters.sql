# The amount of OFF TARGET divided into parameters
SELECT count(idguide_seq_data) , min_frequency, min_quality
FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
WHERE AnalysisParametersId = IDanalysis_parameters
group by min_frequency, min_quality;

# The amount of OFF TARGET divided into parameters and name of experiment
SELECT Targetsite,count(idguide_seq_data) , min_frequency, min_quality
FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
WHERE AnalysisParametersId = IDanalysis_parameters
group by Targetsite,min_frequency, min_quality
order by  Targetsite DESC;