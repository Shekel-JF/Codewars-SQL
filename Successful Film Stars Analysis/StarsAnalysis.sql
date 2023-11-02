WITH film_data AS
(
  SELECT
    actor_id, 
    COUNT(DISTINCT film_id) AS film_count
  FROM
    film_actor
  GROUP BY
    actor_id
  HAVING
    COUNT(DISTINCT film_id) >= 20
),

rental_data AS
(
  SELECT
    actor_id, 
    COUNT(rental_id) AS rented
  FROM
    rental
    JOIN inventory USING (inventory_id)
    RIGHT JOIN film_actor USING (film_id)
  GROUP BY actor_id, film_id
)

SELECT
  actor_id, 
  CONCAT(first_name, ' ', last_name) AS full_name,
  film_count
FROM
  film_data
  JOIN actor USING (actor_id)
  JOIN rental_data USING (actor_id)
GROUP BY
  actor_id, film_count, first_name, last_name
HAVING EVERY(rented >= 7)
ORDER BY
  COUNT(*) DESC,
  actor_id