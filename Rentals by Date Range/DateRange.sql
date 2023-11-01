WITH dates AS
(
    SELECT
      DATE(rental_date) AS date, 
      COUNT(*) AS rental_num
    FROM rental
    WHERE rental_date
      BETWEEN
        '2005-05-24' AND
        '2005-06-03'
    GROUP BY DATE(rental_date)
    ORDER BY DATE
)
SELECT 
  TO_CHAR(date, 'YYYY-MM-DD') AS date, 
  COALESCE(rental_num, 0) AS rentals
FROM dates
  RIGHT JOIN
  (
    SELECT
      DATE(GENERATE_SERIES('2005-05-24', '2005-06-02', INTERVAL '1 day')) AS date
  ) AS days 
  USING (date)
