SELECT
  customer_id, 
  CONCAT(first_name, ' ', last_name) AS customer_name, 
  COUNT(rental_id) AS friday_rentals, 
  STRING_AGG(FORMAT('%s', rental_date), ', ' ORDER BY rental_date DESC) AS rental_dates
FROM
  customer
  JOIN rental USING (customer_id)
WHERE
  EXTRACT(DOW FROM rental_date) = 5 AND
  EXTRACT(HOUR FROM rental_date) BETWEEN 18 AND 23
GROUP BY
  customer_id
ORDER BY
  friday_rentals DESC,
  last_name
LIMIT 50