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

--! 