/*

Data cleaning steps

1. Remove unecessary columns
2. Extract youtube channel names from first column

*/

CREATE VIEW view_US_youtubers_2024 AS

SELECT CAST(SUBSTRING(NAME, 1, CHARINDEX('@', NAME) -1) AS VARCHAR(100)) AS influencer_Name,
	   total_subscribers,
	   total_views,
	   total_videos
FROM
	   top_US_youtubers_2024;



