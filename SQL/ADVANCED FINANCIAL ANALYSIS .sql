-- ============================================================
-- 1. Basic Dataset Statistics
-- ============================================================
SELECT
    COUNT(*) AS total_records,
    ROUND(AVG(GrowthRate), 2) AS average_growth,
    ROUND(MAX(GrowthRate), 2) AS maximum_growth,
    ROUND(MIN(GrowthRate), 2) AS minimum_growth
FROM finance_data;

-- ============================================================
-- 2. Growth Rate Classification
-- ============================================================

SELECT
    CASE
        WHEN GrowthRate >= 20 THEN 'High Growth'
        WHEN GrowthRate >= 10 THEN 'Moderate Growth'
        WHEN GrowthRate >= 0 THEN 'Low Growth'
        ELSE 'Negative Growth'
    END AS Growth_Category,
    COUNT(*) AS Record_Count
FROM finance_data
GROUP BY
    CASE
        WHEN GrowthRate >= 20 THEN 'High Growth'
        WHEN GrowthRate >= 10 THEN 'Moderate Growth'
        WHEN GrowthRate >= 0 THEN 'Low Growth'
        ELSE 'Negative Growth'
    END
ORDER BY Record_Count DESC;

-- ============================================================
-- 3. Positive vs Negative Growth
-- ============================================================

SELECT
    CASE
        WHEN GrowthRate >= 0 THEN 'Positive Growth'
        ELSE 'Negative Growth'
    END AS Growth_Type,
    COUNT(*) AS Total_Records
FROM finance_data
GROUP BY
    CASE
        WHEN GrowthRate >= 0 THEN 'Positive Growth'
        ELSE 'Negative Growth'
    END;


