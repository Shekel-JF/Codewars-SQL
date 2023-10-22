WITH increase AS
(
  SELECT
    country, 
    SUM(CASE WHEN year = 2020 THEN population WHEN year = 2000 THEN -population END) AS diff
  FROM world_population
  GROUP BY country
)
SELECT
  country,
  CONCAT(CAST(ROUND(diff / 1000000., 2) AS TEXT), ' M') AS population_increase
FROM increase
ORDER BY diff DESC
LIMIT 5
