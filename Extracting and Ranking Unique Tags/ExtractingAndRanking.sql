SELECT
  RANK() OVER (ORDER BY COUNT(tag) DESC, tag) AS tag_rank, 
  tag, 
  COUNT(tag) AS tag_count
FROM
(
  SELECT
    user_id, 
    UNNEST(STRING_TO_ARRAY(tags, ',')) AS tag
  FROM user_tags
) AS smth
GROUP BY
  tag
ORDER BY
  tag_rank