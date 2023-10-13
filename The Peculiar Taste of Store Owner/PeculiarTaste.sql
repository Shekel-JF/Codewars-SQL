SELECT
  actor.actor_id, 
  CONCAT(actor.first_name, ' ', actor.last_name) AS full_name, 
  film.title AS film_title
FROM actor
  JOIN film_actor ON actor.actor_id = film_actor.actor_id
  JOIN film ON film_actor.film_id = film.film_id
WHERE
  actor.first_name LIKE 'J%'
  AND film.film_id = (
    SELECT MAX(film_id) FROM film_actor
    WHERE film_actor.actor_id = actor.actor_id
  )
  ORDER BY actor.actor_id