SELECT
  class,
  COUNT(user_id)
FROM
(
  SELECT
    user_id,
    MAX(class) AS class
  FROM users
  GROUP BY user_id
)
AS m
GROUP BY class