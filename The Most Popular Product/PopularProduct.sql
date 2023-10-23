SELECT
  product_id, 
  product_name,
  COUNT(orders.id) AS count_orders
FROM products JOIN orders ON products.id = orders.product_id
GROUP BY product_id, product_name
HAVING COUNT(orders.id) >= ALL
(
  SELECT COUNT(orders.id)
  FROM orders
  GROUP BY product_id
)
ORDER BY product_id DESC


