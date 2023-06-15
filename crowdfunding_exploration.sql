--! Country of origin for the most successful campaigns
SELECT country, COUNT(cf_id) successful_campaigns
FROM campaign
WHERE pledged > goal
GROUP BY country
ORDER BY successful_campaigns DESC;

--! Country of origin for the most unsuccesful campaigns
SELECT country, COUNT(cf_id) UNsuccessful_campaigns
FROM campaign
WHERE pledged < goal
GROUP BY country
ORDER BY UNsuccessful_campaigns DESC;

--! Companies with most campaigns
SELECT company_name, COUNT(cf_id) number_campaigns 
FROM campaign
GROUP BY company_name
ORDER BY number_campaigns DESC
LIMIT 10;

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

