WITH duration AS
(
  SELECT
    (CAST(split_part(transaction_duration, '.', 1) AS DECIMAL) * 60) + CAST(split_part(transaction_duration, '.', 2) AS DECIMAL) AS minutes,
    atm_id
  FROM atm_transactions
)
SELECT
  atm_id, 
  CASE
    WHEN
      SUBSTRING(TO_CHAR((SUM(minutes)) * interval '1 minute', 'HH24.MI'), 1, 1) = '0' THEN SUBSTRING(TO_CHAR((SUM(minutes)) * interval '1 minute', 'HH24.MI'), 2)
    ELSE
      TO_CHAR((SUM(minutes)) * interval '1 minute', 'HH24.MI')
  END AS total_duration_hours
FROM duration
GROUP BY atm_id
ORDER BY SUM(minutes) DESC, atm_id DESC;