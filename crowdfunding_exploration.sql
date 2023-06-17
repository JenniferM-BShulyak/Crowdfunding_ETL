--! Country of origin for the most successful campaigns
SELECT country, COUNT(cf_id) AS total_campaigns, 
	ROUND((COUNT(cf_id) FILTER (WHERE pledged > goal))*100.00/COUNT(cf_id),2) AS percent_success
FROM campaign
GROUP BY country
ORDER BY total_campaigns DESC;

--! Most common categories and their percentage of success
WITH category_sum AS(
SELECT cat.category, COUNT(cam.category_id) AS total,
	COUNT(cam.category_id) FILTER (WHERE cam.pledged>cam.goal) AS successful,
	COUNT(cam.category_id) FILTER (WHERE cam.pledged<cam.goal) AS unsuccessful
FROM campaign cam
LEFT JOIN category cat ON cam.category_id = cat.category_id
GROUP BY cat.category
ORDER BY total DESC)

SELECT *, ROUND((successful*100.00/total),2) AS percent_success
FROM category_sum
ORDER BY percent_success DESC;

--! Companies with most campaigns
SELECT company_name, COUNT(cf_id) number_campaigns 
FROM campaign
GROUP BY company_name
ORDER BY number_campaigns DESC
LIMIT 10;

--! Looking for contacts with more than one campaign
SELECT cam.contact_id, COUNT(cam.*) AS number_campaign
FROM campaign cam
GROUP BY cam.contact_id
ORDER BY number_campaign DESC
LIMIT 5;


--! Temp table to look at repeat companies with their campaigns numbered by end date
--! Looking for campaigns by same company; was the second campaign following a first successfull one or after a failed one? 
CREATE TEMPORARY TABLE repeaters AS(	
	SELECT *,
	RANK() OVER(PARTITION BY company_name ORDER BY end_date) AS campaign_num 
	FROM campaign
	WHERE company_name IN (SELECT company_name 
						   FROM (SELECT company_name, COUNT(*)
								FROM campaign
								GROUP BY company_name HAVING COUNT(*) > 1) AS ranked
						  	)
					)
--! How many companies are repeaters?
SELECT COUNT (DISTINCT company_name)
FROM repeaters;

--! How many repeat companies had successful first versus second campaigns 
--! First make a CTE with the calculation for success of each company's campaigns
--! Then Use case statements to sum up the campaigns based on their successes
WITH first_second AS (
	SELECT company_name,
		SUM(pledged-goal) FILTER (WHERE campaign_num=1) AS first_attempt,
		SUM(pledged-goal) FILTER (WHERE campaign_num=2) AS second_attempt
	FROM repeaters
	GROUP BY company_name)

SELECT SUM(CASE WHEN first_attempt>0 AND second_attempt>0 THEN 1 ELSE 0 END) AS both_successful,
	SUM(CASE WHEN first_attempt>0 AND second_attempt<0 THEN 1 ELSE 0 END) AS first_successul,
	SUM(CASE WHEN first_attempt<0 AND second_attempt>0 THEN 1 ELSE 0 END) AS first_failure,
	SUM(CASE WHEN first_attempt<0 AND second_attempt<0 THEN 1 ELSE 0 END) AS both_failed
FROM first_second;

--! 	



















	
	
	
	
	
	
	
	
	
	
	
	
