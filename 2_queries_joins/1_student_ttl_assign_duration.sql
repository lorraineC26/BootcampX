SELECT SUM(assignment_submissions.duration) AS total_duration
FROM assignment_submissions 
JOIN students
-- from 后是主表，ON后可直接使用主表var名称
ON students.id = student_id 
WHERE students.name = 'Ibrahim Schimmel';