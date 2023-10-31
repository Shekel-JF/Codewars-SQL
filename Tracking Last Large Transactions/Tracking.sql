SELECT
  *, 
  (  
    SELECT MAX(date)
    FROM account_transactions a2
    WHERE
      amount > 100 AND
      a1.account_id = a2.account_id AND
      a2.date <= a1.date
  )
  AS last_over_hundred
FROM account_transactions a1
ORDER BY account_id DESC, date