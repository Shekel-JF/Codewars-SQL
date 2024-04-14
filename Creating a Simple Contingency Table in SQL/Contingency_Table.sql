SELECT
  COALESCE(sex, 'Total') AS "Sex/Handedness", 
  COUNT(CASE WHEN handedness = 'Right-handed' THEN 1 END) AS "Right-handed",
  COUNT(CASE WHEN handedness = 'Left-handed' THEN 1 END) AS "Left-handed",
  COUNT(*) AS "Total"
FROM survey_data
GROUP BY
  ROLLUP(sex)
ORDER BY
  CASE
    WHEN sex = 'Male' THEN 1
    WHEN sex = 'Female' THEN 2
    ELSE 3
  END