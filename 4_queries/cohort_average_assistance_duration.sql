SELECT avg(subtable.total_duration)
FROM(
SELECT cohorts.name, sum(age(assistance_requests.completed_at, assistance_requests.started_at)) as total_duration
FROM cohorts
JOIN students ON students.cohort_id =cohorts.id 
JOIN assistance_requests ON students.id = assistance_requests.student_id
GROUP BY cohorts.name
) as subtable;

-- average_total_duration 
-- ------------------------
--  555:22:25.909091
-- (1 row)