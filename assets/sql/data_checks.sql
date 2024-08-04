/*

# Data quality Checks

1. The data needs to be 100 records o youtube channels
2. The data needs 4 fields
3. The influencer name column must be string format, other columns must be numerical data type
4. Each record must be unique

*/


-- 1. Row count

SELECT COUNT(*)
FROM view_US_youtubers_2024;



-- 2. Column count check
SELECT 
	COUNT(*) as column_count
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_US_youtubers_2024';


-- 3. Data type check

SELECT
	COLUMN_NAME,
	DATA_TYPE
FROM
	INFORMATION_SCHEMA.COLUMNS
WHERE
	TABLE_NAME = 'view_US_youtubers_2024';


-- 4 Duplicate record check

SELECT influencer_Name,
	   COUNT(*) as duplicate_count
FROM
	   view_US_youtubers_2024
GROUP BY
	   influencer_name
HAVING
       COUNT(*) > 1;

-- 5. Check for NULL values

SELECT * 
FROM 
	view_US_youtubers_2024
WHERE 
	total_views is NULL;