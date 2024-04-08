WITH active_30 AS
(
  SELECT
    categories.id,
    categories.name,
    COUNT(categories.id) AS quantity_30_days_ago
    FROM products
      JOIN subcategories ON products.subcategory_id = subcategories.id
      JOIN categories ON categories.id = subcategories.category_id
    WHERE
      deleted_at > CURRENT_DATE - 30 OR products.deleted_at IS NULL
    GROUP BY
      categories.id
),
active_curr AS
(
  SELECT
    categories.id,
    categories.name,
    COUNT(categories.id) AS current_quantity
    FROM products
      JOIN subcategories ON products.subcategory_id = subcategories.id
      JOIN categories ON categories.id = subcategories.category_id
    WHERE
      deleted_at > CURRENT_DATE OR products.deleted_at IS NULL
    GROUP BY
      categories.id
)
SELECT
  categories.id AS category_id,
  categories.name AS name,
  COALESCE(active_curr.current_quantity, 0) AS current_quantity,
  COALESCE(active_30.quantity_30_days_ago, 0) AS quantity_30_days_ago
FROM categories
  LEFT JOIN active_curr ON active_curr.id = categories.id
  LEFT JOIN active_30 ON active_30.id = categories.id
  WHERE
    COALESCE(current_quantity, 0) < 10 AND
    COALESCE(quantity_30_days_ago, 0) >= 10
ORDER BY
  categories.id DESC