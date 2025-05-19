
SELECT r.name AS region_name, COUNT(DISTINCT o.species_id) AS unique_species_count
FROM regions r
JOIN observations o ON r.id = o.region_id
GROUP BY r.id, r.name
ORDER BY unique_species_count DESC;

SELECT strftime('%m', o.observation_date) AS month, COUNT(*) AS observation_count -- Corrected column name
FROM observations o
GROUP BY strftime('%m', o.observation_date)
ORDER BY observation_count DESC;

SELECT s.common_name AS species_name, COUNT(o.species_id) AS observation_count  -- corrected s.name to s.common_name
FROM species s
JOIN observations o ON s.id = o.species_id
GROUP BY s.id, s.common_name
ORDER BY observation_count ASC
LIMIT 10; 

SELECT r.name AS region_name, COUNT(DISTINCT o.species_id) AS unique_species_count
FROM regions r
JOIN observations o ON r.id = o.region_id
GROUP BY r.id, r.name
ORDER BY unique_species_count DESC
LIMIT 1;

SELECT s.common_name AS species_name, COUNT(o.species_id) AS observation_count  -- corrected s.name to s.common_name
FROM species s
JOIN observations o ON s.id = o.species_id
GROUP BY s.id, s.common_name
ORDER BY observation_count DESC
LIMIT 10; 


SELECT observer, COUNT(*) AS observation_count
FROM observations
GROUP BY observer
ORDER BY observation_count DESC
LIMIT 10; 

SELECT s.common_name AS species_name  
FROM species s
LEFT JOIN observations o ON s.id = o.species_id
WHERE o.id IS NULL;


SELECT o.observation_date, COUNT(DISTINCT o.species_id) AS unique_species_count  
FROM observations o
GROUP BY o.observation_date
ORDER BY unique_species_count DESC
LIMIT 10;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

