
SELECT r.regions, COUNT(DISTINCT o.species_id) AS species_count
FROM observations o
JOIN regions r ON o.region_id = r.region_id
GROUP BY r.regions
ORDER BY species_count DESC;


SELECT strftime('%m', observation_date) AS month,
  COUNT(*) AS observation_count
FROM observations
GROUP BY month
ORDER BY observation_count DESC;


SELECT s.species_name, SUM(o.quantity) AS total_observed
FROM observations o
JOIN species s ON o.species_id = s.species_id
GROUP BY s.species_name
HAVING total_observed < 50
ORDER BY total_observed ASC;


SELECT r.regions, COUNT(DISTINCT o.species_id) AS distinct_species_count
FROM observations o
JOIN regions r ON o.region_id = r.region_id
GROUP BY r.regions
ORDER BY distinct_species_count DESC
LIMIT 1;


SELECT s.species_name, COUNT(*) AS observation_count
FROM observations o
JOIN species s ON o.species_id = s.species_id
GROUP BY s.species_name
ORDER BY observation_count DESC;


SELECT observer_name, COUNT(*) AS observation_count
FROM observations
GROUP BY observer_name
ORDER BY observation_count DESC;


SELECT s.species_name
FROM species s
LEFT JOIN observations o ON s.species_id = o.species_id
WHERE o.observation_id IS NULL;


SELECT observation_date, COUNT(DISTINCT species_id) AS distinct_species_count
FROM observations
GROUP BY observation_date
ORDER BY distinct_species_count DESC;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations; 
