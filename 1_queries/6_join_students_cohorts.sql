SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM cohorts 
JOIN students ON cohort_id = cohorts.id;

