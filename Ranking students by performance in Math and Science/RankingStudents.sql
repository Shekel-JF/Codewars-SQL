SELECT
  RANK() OVER (ORDER BY total_score DESC, student_id) AS rank, 
  student_id, 
  name, 
  total_score
FROM
(
  SELECT
    SUM(CASE WHEN courses.course_name IN ('Math', 'Science') THEN courses.score END) AS total_score, 
    students.id AS student_id, 
    name
  FROM students JOIN courses ON students.id = courses.student_id
  GROUP BY students.id  
)
AS total
