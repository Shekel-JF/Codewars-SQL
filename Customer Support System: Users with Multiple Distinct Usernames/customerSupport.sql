SELECT DISTINCT ON (user_id, LOWER(user_name))
  user_id,
  user_name
FROM
  tickets t
WHERE
 (SELECT
    COUNT(DISTINCT LOWER(user_name))
  FROM
    tickets t2
  WHERE
    t2.user_id = t.user_id
 ) > 1
ORDER BY
  user_id, 
  LOWER(user_name),
  id DESC