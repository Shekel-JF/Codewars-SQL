SELECT
  player_name,
  games,
  LTRIM(TO_CHAR(CAST(hits AS DECIMAL) / at_bats, '0.000')) AS batting_average
FROM yankees
WHERE at_bats >= 100
ORDER BY batting_average DESC;