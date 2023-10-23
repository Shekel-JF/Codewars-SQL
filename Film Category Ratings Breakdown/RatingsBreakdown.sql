SELECT
  name AS category_name, 
  rating AS film_rating, 
  ROUND(COUNT(film_id) * 100 / (SUM(COUNT(film_id)) OVER (PARTITION BY category_id)), 3) AS percentage
FROM category
  JOIN film_category USING (category_id)
  JOIN film USING (film_id)
GROUP BY category_id, rating
ORDER BY
  category_name, 
  percentage DESC, 
  film_rating  