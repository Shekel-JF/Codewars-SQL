WITH TimeIntervals AS
(
  SELECT
    machine_id,
    end_time AS interval_end,
    LEAD(start_time) OVER (PARTITION BY machine_id ORDER BY start_time) AS interval_start
  FROM process_times
)
SELECT
  machine_id, TO_CHAR (INTERVAL '1 second' * SUM(EXTRACT(EPOCH FROM (interval_start - interval_end))), 'HH24:MI:SS')
  AS total_down_time FROM TimeIntervals
  GROUP BY machine_id
  HAVING COUNT(*) > 1
  ORDER BY machine_id DESC;
