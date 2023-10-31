SELECT *
FROM fuel_transactions
WHERE
  is_reversal = 'N' AND
  transaction_id NOT IN
  (
    SELECT
    (
      SELECT
        MAX(t1.transaction_id)
      FROM fuel_transactions t1
      WHERE
        t1.quantity = -t2.quantity AND
        t1.fuel_type = t2.fuel_type AND
        t1.transaction_id < t2.transaction_id
    )
    AS reversed 
    FROM fuel_transactions t2
    WHERE is_reversal = 'Y'
  )