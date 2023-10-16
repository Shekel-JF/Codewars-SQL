WITH kata_scores AS
(
  SELECT
    kata_id, 
    AVG(vote) AS score
  FROM kata_votes
  GROUP BY kata_id
  HAVING COUNT(vote) >= 3
)
SELECT
  user_id, 
  COUNT(kata_id) AS bad_kata_count
FROM kata_scores JOIN kata_authors USING (kata_id)
WHERE score < 0.7
GROUP BY user_id
HAVING COUNT(kata_id) >=5
ORDER BY bad_kata_count DESC, user_id DESC