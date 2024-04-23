WITH total AS
(
  SELECT
    customer_id,
    SUM(order_amount) AS total_orders
  FROM
    orders
  WHERE
    EXTRACT(YEAR FROM order_date) = 2023 AND
    EXTRACT(MONTH FROM order_date) = 9
  GROUP BY
    customer_id
)
SELECT
  customer_id, 
  total_orders,
  MAX(rebate_percentage) AS rebate_percentage
FROM
  total
CROSS JOIN
  rebates
WHERE
  total_orders >= min_purchase
GROUP BY
  customer_id, 
  total_orders
ORDER BY
  customer_id DESC