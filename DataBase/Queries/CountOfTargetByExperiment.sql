#counts of off target by experiment
SELECT Targetsite, count(Targetsite), min_frequency, min_quality FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
where AnalysisParametersId = IDanalysis_parameters
group by Targetsite, min_frequency, min_quality;