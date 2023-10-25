SELECT
  students.id AS student_id, 
  students.name,
  CASE
    WHEN COUNT(courses.id) = 0 THEN 'quit studying'
    ELSE CONCAT('failed in ', STRING_AGG(CONCAT(courses.course_name, '(', courses.score, ')'), ', ' ORDER BY courses.course_name))
  END AS reason
FROM students LEFT JOIN courses ON students.id = courses.student_id
WHERE courses.score < 60 OR courses.student_id IS NULL
GROUP BY students.id, students.name
HAVING COUNT(courses.student_id) = 0 OR COUNT(courses.id) >= 3
ORDER BY student_id
