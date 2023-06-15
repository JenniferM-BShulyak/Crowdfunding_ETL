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