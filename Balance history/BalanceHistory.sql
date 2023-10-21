SELECT
  date, 
  SUM(balance) OVER(ORDER BY date) AS balance
FROM
(
  SELECT
    DATE(date) AS date, 
    SUM(amount) AS balance
  FROM operations
  GROUP BY DATE(date)
)
AS calc
ORDER BY date