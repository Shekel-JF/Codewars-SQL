SELECT
  film_id, 
  CONCAT
  (
    title, ' is ',
    CASE
      WHEN COUNT(DISTINCT customer_id) > 30 THEN 'very'
      WHEN COUNT(DISTINCT customer_id) > 15 THEN 'moderately'
      WHEN COUNT(DISTINCT customer_id) > 5 THEN 'slightly'
      ELSE 'not'
    END, ' popular'
  ) AS popularity, 
  COUNT(DISTINCT customer_id) AS rental_count
FROM
  film
  JOIN inventory USING (film_id)
  JOIN rental USING (inventory_id)
  JOIN film_category USING (film_id)
  JOIN category USING (category_id)
WHERE
  name = 'Children'
GROUP BY
  film_id
ORDER BY
  rental_count DESC, 
  title