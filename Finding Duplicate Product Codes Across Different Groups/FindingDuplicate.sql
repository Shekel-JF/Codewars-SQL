WITH dis AS
(
  SELECT
    product_code
  FROM products
  GROUP BY product_code
  HAVING COUNT(DISTINCT group_id) > 1
)

SELECT
  MAX(product_id) AS product_id, 
  group_id, 
  product_code
FROM dis
  JOIN products USING (product_code)
GROUP BY
  group_id,
  product_code
ORDER BY
  product_code,
  group_id DESC
