SELECT 
    date,
    customer_id,
    name,
    (
      SELECT
        COUNT(DISTINCT NAME)
      FROM
        customers c2
      WHERE
        c2.customer_id = c1.customer_id AND
        c2.date BETWEEN c1.date - INTERVAL '2 days' AND c1.date
    ) AS count  
FROM
  customers c1
ORDER BY 
  date,
  customer_id DESC,
  name;