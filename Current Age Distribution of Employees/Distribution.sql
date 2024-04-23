WITH ages AS
(
  SELECT
    EXTRACT(YEAR FROM AGE(date_of_birth)) AS age
  FROM
    employees
)
SELECT
  '18-20' AS age_interval, ROUND(100.0 * (SELECT COUNT(*) FROM ages WHERE age BETWEEN 18 AND 20) / (SELECT COUNT(*) FROM ages), 2) AS percent
UNION
SELECT
  '26-40' AS age_interval, ROUND(100.0 * (SELECT COUNT(*) FROM ages WHERE age BETWEEN 26 AND 40) / (SELECT COUNT(*) FROM ages), 2) AS percent
UNION
SELECT
  '>40' AS age_interval, ROUND(100.0 * (SELECT COUNT(*) FROM ages WHERE age > 40) / (SELECT COUNT(*) FROM ages), 2) AS percent
ORDER BY
  age_interval