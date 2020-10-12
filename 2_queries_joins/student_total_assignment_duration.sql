SELECT sum(assignment_submissions.duration) as total_duration
FROM students RIGHT JOIN assignment_submissions ON students.id = assignment_submissions.student_id
WHERE students.name= 'Ibrahim Schimmel';

