SELECT DISTINCT ON (film_title, film_id)
  film_id, 
  title AS film_title, 
  TO_CHAR(rental_date, 'DY') AS most_popular_day_of_week
FROM category
  JOIN film_category USING (category_id)
  JOIN inventory USING (film_id)
  JOIN rental USING (inventory_id)
  JOIN film USING (film_id)
WHERE
  name = 'Action'
GROUP BY
  film_id,
  film_title, 
  TO_CHAR(rental_date, 'DY')
ORDER BY
  film_title, film_id, COUNT(film_id) DESC, TO_CHAR(rental_date, 'DY')