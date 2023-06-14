#max of off target by Chromosome
SELECT count(`#BED_Chromosome`) AS chromosome_count, min_frequency, min_quality, `#BED_Chromosome`
FROM Hendel_Lab.guide_seq_data
JOIN Hendel_Lab.analysis_parameters ON AnalysisParametersId = IDanalysis_parameters
GROUP BY min_frequency, min_quality, `#BED_Chromosome`
ORDER BY chromosome_count DESC
LIMIT 3;
