-- ============================================================
-- 1. Basic Dataset Statistics
-- ============================================================
SELECT
    COUNT(*) AS total_records,
    ROUND(AVG(GrowthRate), 2) AS average_growth,
    ROUND(MAX(GrowthRate), 2) AS maximum_growth,
    ROUND(MIN(GrowthRate), 2) AS minimum_growth
FROM finance_data;
