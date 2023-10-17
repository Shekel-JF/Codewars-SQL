SELECT
  title
FROM film JOIN film_actor USING (film_id)
WHERE actor_id IN (105, 122)
GROUP BY film_id
HAVING COUNT(*) = 2
ORDER BY title