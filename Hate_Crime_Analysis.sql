CREATE DATABASE hate_crime;

USE hate_crime;

DESCRIBE cleaned_discrimination_data;

SELECT *
FROM cleaned_discrimination_data
LIMIT 10;


SELECT country,
       SUM(victims) AS total_incidents
FROM cleaned_discrimination_data
GROUP BY country
ORDER BY total_incidents DESC;


SELECT year,
       SUM(victims) AS yearly_incidents
FROM cleaned_discrimination_data
GROUP BY year
ORDER BY year;


SELECT incident_type,
       COUNT(*) AS cases
FROM cleaned_discrimination_data
GROUP BY incident_type
ORDER BY cases DESC;



SELECT event,
       SUM(victims) AS incidents
FROM cleaned_discrimination_data
GROUP BY event
ORDER BY incidents DESC;

SELECT country,
       SUM(victims) AS total_incidents,
       RANK() OVER (ORDER BY SUM(victims) DESC) AS country_rank
FROM cleaned_discrimination_data
GROUP BY country;


SELECT year,
       SUM(victims) AS total_incidents
FROM cleaned_discrimination_data
GROUP BY year
ORDER BY total_incidents DESC
LIMIT 1;


SELECT country,
       incident_type,
       COUNT(*) AS cases,
       RANK() OVER (PARTITION BY country ORDER BY COUNT(*) DESC) AS rank_in_country
FROM cleaned_discrimination_data
GROUP BY country, incident_type;


SELECT event,
       SUM(victims) AS total_incidents
FROM cleaned_discrimination_data
GROUP BY event
ORDER BY total_incidents DESC;


SELECT country,
       SUM(victims) AS total_incidents
FROM cleaned_discrimination_data
GROUP BY country
ORDER BY total_incidents DESC
LIMIT 3;