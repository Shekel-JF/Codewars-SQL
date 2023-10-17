SELECT
  DATE (created_at) AS date, 
  COUNT(*) AS count, 
  CAST(SUM(COUNT(*)) OVER (ORDER BY DATE(created_at)) AS INTEGER) AS total
FROM posts
GROUP BY date
