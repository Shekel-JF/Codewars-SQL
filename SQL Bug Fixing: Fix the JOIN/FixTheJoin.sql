SELECT 
  job_title,
  CAST(ROUND(SUM(salary) / COUNT(*), 2) AS FLOAT) AS average_salary,
  COUNT(*) AS total_people,
  CAST(ROUND(SUM(salary), 2) AS FLOAT) AS total_salary
FROM job
GROUP BY job_title
ORDER BY average_salary DESC;