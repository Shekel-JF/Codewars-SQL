SELECT
  category_id, 
  category, 
  title, 
  views, 
  post_id
FROM
(
  SELECT
    categories.id AS category_id, 
    category, 
    title, 
    views, 
    posts.id AS post_id,
    ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY views DESC, posts.id) AS num
  FROM categories LEFT JOIN posts ON categories.id = posts.category_id
)
AS posts
WHERE num <=2
ORDER BY
  category, 
  views DESC, 
  post_id