WITH top AS
(
  SELECT DISTINCT ON (region_id)
    region_id, 
    sale_date AS day
  FROM daily_sales
  ORDER BY region_id, sales_amount DESC
)
SELECT
  region_id, 
  sale_date,
  sales_amount,
  RANK() OVER (PARTITION BY region_id ORDER BY sales_amount DESC, sale_date DESC) AS sales_rank_within_region,
  DENSE_RANK() OVER (ORDER BY day, region_id DESC) AS earliest_top_sale_rank
FROM top
  JOIN daily_sales USING (region_id)
ORDER BY
  earliest_top_sale_rank,
  sales_rank_within_region;
