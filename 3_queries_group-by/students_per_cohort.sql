SELECT cohorts.name,count(*) as student_count
FROM cohorts JOIN students ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING count(*) >= 18
ORDER BY student_count;
