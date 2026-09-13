--showing record in table 
SELECT * FROM finance_data;

-- Total Records
SELECT COUNT(*) AS Total_Records
FROM finance_data;

-- Average Growth Rate
SELECT ROUND(AVG(GrowthRate),2) AS Avg_Growth
FROM finance_data;

-- Highest Growth Rate
SELECT MAX(GrowthRate) AS Highest_Growth
FROM finance_data;

-- Lowest Growth Rate
SELECT MIN(GrowthRate) AS Lowest_Growth
FROM finance_data;

-- Top 10 Highest Growth Records
SELECT *
FROM finance_data
ORDER BY GrowthRate DESC
LIMIT 10;

-- Records with Negative Growth
SELECT COUNT(*) AS Negative_Records
FROM finance_data
WHERE GrowthRate < 0;

-- Dataset Summary
SELECT
COUNT(*) AS Total_Records,
ROUND(AVG(GrowthRate),2) AS Avg_Growth,
MAX(GrowthRate) AS Highest_Growth,
MIN(GrowthRate) AS Lowest_Growth
FROM finance_data;
