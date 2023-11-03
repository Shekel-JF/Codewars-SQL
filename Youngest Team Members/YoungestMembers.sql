SELECT DISTINCT ON (team)
  employee_id, 
  full_name, 
  team, 
  birth_date
FROM employees
ORDER BY
  team, birth_date DESC