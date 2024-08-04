/*

1. Define variables
2. Create a CTE for rounding the average views per video
3. Select the columns that are required for the analysis
4. Filter the results by the Youtube influencer with highest subscriber base

*/

DECLARE @conversionRate FLOAT = 0.02;	-- conversion rate
DECLARE @productCost MONEY = 5.0;		-- product cost in USD
DECLARE @campaignCost MONEY = 50000.0;	-- campaign cost

WITH InfluencerData AS (
	SELECT
		influencer_Name,
		total_subscribers,
		total_views,
		total_videos,
		ROUND((CAST(total_views AS FLOAT) / total_videos), -4) AS rounded_avg_views_per_video
	FROM
		view_US_youtubers_2024
)

-- SELECT * FROM InfluencerData
-- ORDER BY total_subscribers DESC

-- 3
SELECT influencer_Name,
	   rounded_avg_views_per_video,
	   (rounded_avg_views_per_video * @conversionRate) AS potential_units_sold_per_video,
	   (rounded_avg_views_per_video * @conversionRate * @productCost) AS potential_revenue_per_video,
	   (rounded_avg_views_per_video * @conversionRate * @productCost) - @campaignCost as net_profit
FROM
		InfluencerData
WHERE
		influencer_Name in ('MrBeast', 'T-Series', 'Cocomelon - Nursery Rhymes')
ORDER BY
		net_profit


