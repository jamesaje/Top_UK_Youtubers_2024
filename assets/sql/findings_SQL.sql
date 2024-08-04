-- 1. Top 10 Youtubers with most subscribers

SELECT TOP (10)
	influencer_Name AS Influencer,
	CAST((total_subscribers / 1000000) AS DECIMAL(10,2)) AS Subscribers
FROM
	view_US_youtubers_2024
ORDER BY
	total_subscribers DESC

-- 2. Top three channels with most uploaded videos

SELECT TOP (3)
	influencer_Name AS Influencer,
	total_videos AS Videos
FROM
	view_US_youtubers_2024
ORDER BY
	total_videos DESC


-- 3. Top three channels with most views

SELECT TOP (3)
	influencer_Name AS Influencer,
	ROUND(CAST(total_views AS FLOAT) / 1000000000, 2) AS Views
FROM
	view_US_youtubers_2024
ORDER BY
	total_views DESC


-- 4. Channels with the highest average views per video
SELECT TOP (3)
	influencer_Name AS Influencer,
	ROUND(CAST((total_views / total_videos) AS FLOAT) / 1000000, 2) AS avg_view_per_video
FROM
	view_US_youtubers_2024
ORDER BY
	avg_view_per_video DESC


-- 5. Channels with highest view per subscriber ratio
SELECT TOP (3)
	influencer_Name AS Influencer,
	CAST((total_views / total_subscribers) AS FLOAT) AS view_per_subscriber
FROM
	view_US_youtubers_2024
ORDER BY
	view_per_subscriber DESC

-- 6. Channels with highest subscriber engatement rate per video uploaded

SELECT TOP (3)
	influencer_Name as Influencer,
	ROUND(CAST((total_subscribers / total_videos) AS FLOAT) / 1000, 2) AS subscriber_engagement
FROM
	view_US_youtubers_2024
ORDER BY
	subscriber_engagement DESC