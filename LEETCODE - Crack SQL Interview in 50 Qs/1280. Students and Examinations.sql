SELECT DISTINCT
  s.student_id, 
  s.student_name, 
  sub.subject_name,
  (
    SELECT COUNT(*) 
    FROM Examinations e2
    WHERE e2.student_id = s.student_id
      AND e2.subject_name = sub.subject_name
  ) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
ORDER BY s.student_id;
