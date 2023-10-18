SELECT
  customer.customer_id,  
  CONCAT(first_name, ' ', last_name) AS full_name, 
  COUNT(rental_id) AS total_rentals
FROM customer
  JOIN rental ON customer.customer_id = rental.customer_id
  JOIN inventory ON rental.inventory_id = inventory.inventory_id
  JOIN film ON inventory.film_id = film.film_id
GROUP BY customer.customer_id
HAVING SUM(CASE WHEN rating = 'NC-17' THEN 1 ELSE 0 END) = 0
ORDER BY total_rentals DESC, last_name
LIMIT 5
