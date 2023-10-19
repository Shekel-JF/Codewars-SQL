WITH top_categories AS
(
  SELECT
    inventory.store_id, 
    category.name AS category, 
    COUNT(rental.rental_id) AS num_rentals,
    ROW_NUMBER() OVER (PARTITION BY inventory.store_id ORDER BY COUNT(rental.rental_id) DESC, category.name) AS rank
  FROM inventory
    JOIN rental ON inventory.inventory_id = rental.inventory_id
    JOIN film_category ON inventory.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
  GROUP BY inventory.store_id, category.name 
)
SELECT
  store_id, 
  category, 
  num_rentals
FROM top_categories
WHERE rank <= 5
ORDER BY store_id, rank