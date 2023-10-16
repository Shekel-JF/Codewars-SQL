SELECT
  name AS product_name, 
  CAST(EXTRACT (YEAR FROM date) AS INTEGER) as year,
  CAST(EXTRACT (MONTH FROM date) AS INTEGER) as month,
  CAST(EXTRACT (DAY FROM date) AS INTEGER) as day,
  SUM(price * count) AS total
FROM products
  JOIN sales_details ON products.id = product_id
  JOIN sales ON sales_details.sale_id = sales.id
GROUP BY product_name,
  ROLLUP(year, month, day)
ORDER BY product_name, year, month, day
