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

-- ============================================================
-- 4. Growth Rate Distribution
-- ============================================================

SELECT
    CASE
        WHEN GrowthRate < -20 THEN 'Below -20%'
        WHEN GrowthRate < 0 THEN '-20% to 0%'
        WHEN GrowthRate < 10 THEN '0% to 10%'
        WHEN GrowthRate < 20 THEN '10% to 20%'
        ELSE '20%+'
    END AS Growth_Range,
    COUNT(*) AS Number_Of_Records
FROM finance_data
GROUP BY
    CASE
        WHEN GrowthRate < -20 THEN 'Below -20%'
        WHEN GrowthRate < 0 THEN '-20% to 0%'
        WHEN GrowthRate < 10 THEN '0% to 10%'
        WHEN GrowthRate < 20 THEN '10% to 20%'
        ELSE '20%+'
    END
ORDER BY Number_Of_Records DESC;


-- ============================================================
-- 5. Top 20 Growth Records
-- ============================================================

SELECT *
FROM finance_data
ORDER BY GrowthRate DESC
LIMIT 20;


-- ============================================================
-- 6. Bottom 20 Growth Records
-- ============================================================

SELECT *
FROM finance_data
ORDER BY GrowthRate ASC
LIMIT 20;

-- ============================================================
-- 7. Records Above Average Growth
-- ============================================================

SELECT *
FROM finance_data
WHERE GrowthRate > (
    SELECT AVG(GrowthRate)
    FROM finance_data
)
ORDER BY GrowthRate DESC;

-- ============================================================
-- 8. Records Below Average Growth
-- ============================================================

SELECT *
FROM finance_data
WHERE GrowthRate < (
    SELECT AVG(GrowthRate)
    FROM finance_data
)
ORDER BY GrowthRate ASC;

-- ============================================================
-- 9. Growth Rate Ranking
-- ============================================================

SELECT
    *,
    RANK() OVER (
        ORDER BY GrowthRate DESC
    ) AS Growth_Rank
FROM finance_data;

-- ============================================================
-- 10. Top 10% Growth Records
-- ============================================================

SELECT *
FROM (
    SELECT
        *,
        NTILE(10) OVER (
            ORDER BY GrowthRate DESC
        ) AS Growth_Decile
    FROM finance_data
) AS ranked_data
WHERE Growth_Decile = 1;

