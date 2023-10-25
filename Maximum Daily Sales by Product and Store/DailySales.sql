SELECT DISTINCT ON(store_id, product_id)
  store_id, 
  product_id, 
  transaction_date, 
  MAX(quantity) AS max_quantity, 
  SUM(quantity) AS total_quantity_on_max_day
FROM sales
GROUP BY store_id, product_id, transaction_date
ORDER BY store_id, product_id, max_quantity DESC, transaction_date