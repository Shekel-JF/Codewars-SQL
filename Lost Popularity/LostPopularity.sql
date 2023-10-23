SELECT
  film_id, 
  CONCAT(title, ' (', rating, ')') AS film_title,
  COUNT(rental_id) AS rental_count, 
  TO_CHAR(MAX(rental_date), 'FMMonth DD, YYYY') AS last_rental_date
FROM inventory
JOIN film USING (film_id)
JOIN rental USING (inventory_id)
GROUP BY film_id, title, rating
HAVING
  COUNT(rental_id) > 9 AND
  CURRENT_DATE - MAX(rental_date) > INTERVAL '1' MONTH
ORDER BY
  rental_count DESC,
  last_rental_date DESC,
  title