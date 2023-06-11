#Calculation of which GUIDE has the most OFF TARGET
# note if we dont include "Targetsite" the result is distorted because there is no reference to D1 and D2 .If we don't want to refer to it (we will count D1 and D2 together) we will present the CELL column   
SELECT t.Targetsite,t.TargetSequence, t.count_of_guide as max_count_of_guide, t.min_frequency, t.min_quality
FROM (
	# create a table that calculate for each GUIDE the amount of instances divided by parameters
    SELECT TargetSequence, count(TargetSequence) as count_of_guide, min_frequency, min_quality,Targetsite 
    FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
    WHERE AnalysisParametersId = IDanalysis_parameters
    GROUP BY TargetSequence, min_frequency, min_quality,Targetsite
) AS t
JOIN (
	# subquery to calculate the maximum count of guides for each combination of "min_frequency" and "min_quality."
    SELECT min_frequency, min_quality, MAX(count_of_guide) AS max_count_of_guide
    FROM (
        SELECT Targetsite,TargetSequence, count(TargetSequence) as count_of_guide, min_frequency, min_quality
        FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
        WHERE AnalysisParametersId = IDanalysis_parameters
        GROUP BY TargetSequence, min_frequency, min_quality,Targetsite
    ) AS sub
    GROUP BY min_frequency, min_quality
) AS max_counts
ON t.min_frequency = max_counts.min_frequency
    AND t.min_quality = max_counts.min_quality
    AND t.count_of_guide = max_counts.max_count_of_guide;


"""
# example without Targetsite  
SELECT t.TargetSequence, t.count_of_guide as max_count_of_guide, t.min_frequency, t.min_quality
FROM (
	# create a table that 
    SELECT TargetSequence, count(TargetSequence) as count_of_guide, min_frequency, min_quality 
    FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
    WHERE AnalysisParametersId = IDanalysis_parameters
    GROUP BY TargetSequence, min_frequency, min_quality
) AS t
JOIN (
	# subquery to calculate the maximum count of guides for each combination of "min_frequency" and "min_quality."
    SELECT min_frequency, min_quality, MAX(count_of_guide) AS max_count_of_guide
    FROM (
        SELECT TargetSequence, count(TargetSequence) as count_of_guide, min_frequency, min_quality
        FROM Hendel_Lab.guide_seq_data, Hendel_Lab.analysis_parameters
        WHERE AnalysisParametersId = IDanalysis_parameters
        GROUP BY TargetSequence, min_frequency, min_quality
    ) AS sub
    GROUP BY min_frequency, min_quality
) AS max_counts
ON t.min_frequency = max_counts.min_frequency
    AND t.min_quality = max_counts.min_quality
    AND t.count_of_guide = max_counts.max_count_of_guide;
    """
