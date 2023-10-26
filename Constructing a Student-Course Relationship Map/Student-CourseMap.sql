WITH SxE AS
(
  SELECT
    student_id, 
    name
  FROM students
  WHERE student_id IN
  (
    SELECT
      student_id
    FROM enrollments
  )
),

CxE AS
(
  SELECT
    course_id, 
    course_name
  FROM courses
  WHERE course_id IN
  (
    SELECT
      course_id
    FROM enrollments
  )
)

SELECT
  CONCAT(SxE.name, ' (', SxE.student_id, ')') AS student, 
  CONCAT(CxE.course_name, ' (', CxE.course_id, ')') AS course, 
  CASE WHEN enrollments.student_id IS NOT NULL THEN 1 ELSE 0 END AS is_exists
FROM SxE CROSS JOIN CxE
LEFT JOIN enrollments ON SxE.student_id = enrollments.student_id AND CxE.course_id = enrollments.course_id
ORDER BY SxE.student_id, CxE.course_id;
