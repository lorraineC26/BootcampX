-- calculate the average number of students that attend a cohort
-- STEP 1. calculate the total number of students for each cohort
SELECT count(students) as total_students
FROM students
JOIN cohorts on cohorts.id = cohort_id
GROUP BY cohorts;

-- STEP 2. use step#1 as FROM resource here
SELECT avg(total_students) AS average_students
FROM (
  SELECT count(students) as total_students, cohorts.name as cohort_name
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts.name
) 
-- gives an alias to the sub query so that we can use it's name like we would use any other table's name
AS totals_table;

