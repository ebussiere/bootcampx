SELECT teachers.name as teacher,
  students.name as student, 
  assignments.name as assignment,
   age(assistance_requests.completed_at, assistance_requests.started_at) as duration
FROM students 
JOIN assistance_requests ON students.id = assistance_requests.student_id
JOIN teachers on teachers.id = assistance_requests.teacher_id
JOIN assignments on assistance_requests.assignment_id=assignments.id
GROUP BY students.name, teachers.name, assignments.name, assistance_requests.started_at, 
assistance_requests.completed_at 
ORDER BY duration



--   teacher       |         student          |    assignment    | duration 
-- --------------------+--------------------------+------------------+----------
--  Helmer Rodriguez   | Maximillian Pfannerstill | Expedita officia | 00:02:45
--  Roberto Towne      | Vivien Mosciski          | Ea totam iste    | 00:02:45
--  Georgiana Fahey    | Gene Carter              | Ut fuga          | 00:02:45
--  Cheyanne Powlowski | Vivien Mosciski          | Eum eaque        | 00:02:45
--  Roberto Towne      | Maximillia Willms        | Quibusdam est    | 00:03:00
-- (26299 rows)