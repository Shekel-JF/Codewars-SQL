SELECT
  product_id, 
  COUNT(DISTINCT(color_id, size_id)) AS total_unique_variants,
  COUNT(CASE WHEN in_stock = 'true' THEN 1 END) AS in_stock_variants
FROM
  product_variants
GROUP BY 
  product_id