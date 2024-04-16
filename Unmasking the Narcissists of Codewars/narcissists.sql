WITH narcissists AS
(
  SELECT
    user_id,
    username, 
    ROUND(100.0 * COUNT(DISTINCT kata_id) FILTER (WHERE voter_user_id = user_id) / COUNT(DISTINCT kata_id), 2) AS self_vote_percentage
  FROM
    users
    JOIN solutions USING (user_id)
    LEFT JOIN votes USING (solution_id)
  GROUP BY
    user_id,
    username
  HAVING
    COUNT(DISTINCT kata_id) >= 30
  ORDER BY
    user_id DESC
)
SELECT*
FROM
  narcissists
WHERE
  self_vote_percentage >= 25