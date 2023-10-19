const { Pool } = require('pg');

// connect to the bootcampx Db
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// Name of Teachers That Assisted
pool.query(`
SELECT DISTINCT(teachers.name) AS teacher, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests
ON teachers.id = assistance_requests.teacher_id
JOIN students
ON students.id = assistance_requests.student_id
JOIN cohorts
ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE '%${process.argv[2]}%'
ORDER BY teacher;
`)
  .then(res => {
    console.log('connected');
    res.rows.forEach(result => {
      console.log(`${result.cohort}: ${result.teacher}`);
    });
  })
  .catch(err => console.error('query error', err.stack));

  