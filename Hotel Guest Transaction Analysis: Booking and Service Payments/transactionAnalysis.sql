WITH transactions_ranked AS
(
  SELECT
    transaction, 
    name, 
    CONCAT(receipt, ' (', datetime, ')') AS service, 
    RANK() OVER (PARTITION BY transaction ORDER BY datetime) AS position
  FROM hotel_transactions
)
SELECT
  transaction, 
  name, 
  MIN(CASE WHEN position = 1 THEN service END) AS initial_booking, 
  MIN(CASE WHEN position = 2 THEN service END) AS additional_services
FROM
  transactions_ranked
GROUP BY
  transaction, 
  name
ORDER BY
  transaction DESC