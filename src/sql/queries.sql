-- queries.sql
-- Complete each mission by writing your SQL query below the instructions.
-- Don't forget to end each query with a semicolon ;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations; 


-- Mission 1 : Regions with most recorded species
SELECT r.regions, COUNT(DISTINCT o.species_id) AS species_count
FROM observations o
JOIN regions r ON o.region_id = r.region_id
GROUP BY r.regions
ORDER BY species_count DESC;

-- Mission 2: Months with highest observation activity

SELECT strftime('%m', observation_date) AS month,
  COUNT(*) AS observation_count
FROM observations
GROUP BY month
ORDER BY observation_count DESC;


-- Mission 3: Species with few recorded individuals
SELECT s.species_name, SUM(o.quantity) AS total_observed
FROM observations o
JOIN species s ON o.species_id = s.species_id
GROUP BY s.species_name
HAVING total_observed < 50
ORDER BY total_observed ASC;

-- Mission 4: Region with most distinct species
SELECT r.regions, COUNT(DISTINCT o.species_id) AS distinct_species_count
FROM observations o
JOIN regions r ON o.region_id = r.region_id
GROUP BY r.regions
ORDER BY distinct_species_count DESC
LIMIT 1;

-- Mission 5: Most frequently observed species
SELECT s.species_name, COUNT(*) AS observation_count
FROM observations o
JOIN species s ON o.species_id = s.species_id
GROUP BY s.species_name
ORDER BY observation_count DESC;


-- Mission 6: Most active observers
SELECT observer_name, COUNT(*) AS observation_count
FROM observations
GROUP BY observer_name
ORDER BY observation_count DESC;


-- Mission 7: Species never observed
SELECT s.species_name
FROM species s
LEFT JOIN observations o ON s.species_id = o.species_id
WHERE o.observation_id IS NULL;


-- Mission 8: Dates with most distinct species
SELECT observation_date, COUNT(DISTINCT species_id) AS distinct_species_count
FROM observations
GROUP BY observation_date
ORDER BY distinct_species_count DESC;
