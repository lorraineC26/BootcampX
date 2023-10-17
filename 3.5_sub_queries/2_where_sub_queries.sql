-- get the name of all incomplete assignments for a student

-- STEP #1: return ids represent all completed assignments for this specific student
SELECT assignment_id
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

-- STEP #2: filter out completed id from step#1
-- return the name of all assignments not completed by 'Ibrahim Schimmel'
SELECT assignments.name
FROM assignments 
WHERE id NOT IN
(
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);