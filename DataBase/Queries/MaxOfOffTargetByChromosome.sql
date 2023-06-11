#max of off target by Chromosome
SELECT max(`#BED_Chromosome`),count(`#BED_Chromosome`), min_frequency, min_quality FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
where AnalysisParametersId = IDanalysis_parameters
group by min_frequency, min_quality;