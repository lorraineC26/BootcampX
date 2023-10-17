-- Nesting
SELECT SUM(assignment_submissions.duration) AS total_duration
FROM assignment_submissions
JOIN students
ON student_id = students.id
WHERE student_id IN (
  SELECT students.id
    FROM students
    JOIN cohorts
    ON cohorts.id = students.cohort_id
    WHERE cohorts.name = 'FEB12'
);

-- two JOINs
SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12';

