SELECT
  film_id, 
  title, 
  length
FROM film
WHERE length NOT BETWEEN
(
  SELECT MIN(length)
  FROM film
  WHERE rating = 'R'
)
AND
(
  SELECT PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY length)
  FROM film
  WHERE rating = 'PG-13'
)
ORDER BY length, title, film_id