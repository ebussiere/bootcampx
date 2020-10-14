SELECT cohorts.name, sum(assistance_requests.completed_at - assistance_requests.started_at) as total_duration
FROM students 
JOIN assistance_requests ON students.id = assistance_requests.student_id
JOIN cohorts ON students.cohort_id =cohorts.id
GROUP BY cohorts.name 
ORDER BY total_duration;

-- cohort | total_duration 
-- --------+----------------
--  JUL30  | 390:35:20
--  AUG27  | 398:19:00
--  JUL02  | 453:50:30
--  NOV19  | 462:34:40
--  MAY07  | 480:10:55
--  ...
--  (11 rows)