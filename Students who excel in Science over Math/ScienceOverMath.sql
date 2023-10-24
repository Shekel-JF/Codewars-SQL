SELECT
  student_id, 
  name,
  score_difference
FROM
(
  SELECT
    student_id, 
    students.name,
    SUM(CASE WHEN course_name IN ('Science') THEN score WHEN course_name IN ('Math') THEN -score END) AS score_difference
  FROM students JOIN courses ON students.id = courses.student_id
  GROUP BY student_id, students.name
) AS difference
WHERE score_difference > 0
ORDER BY
  score_difference DESC,
  student_id