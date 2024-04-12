WITH completed_tasks AS
(
  SELECT
    task_id
  FROM
    task_status
  GROUP BY
    task_id
  HAVING
    COUNT(*) = COUNT(CASE WHEN task_status = 'Completed' THEN 1 END)
)
SELECT
  house_id,
  COUNT(task_id) AS total_tasks,
  COALESCE(COUNT(completed_tasks.task_id), 0) AS completed_tasks,
  COUNT(task_id) - COALESCE(COUNT(completed_tasks.task_id), 0) AS incomplete_tasks
FROM
  house_tasks
LEFT JOIN
  completed_tasks USING (task_id)
GROUP BY
  house_tasks.house_id
ORDER BY
  house_tasks.house_id DESC;