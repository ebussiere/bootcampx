const { Pool } = require('pg');
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


const cohort = process.argv[2] || 'JUL02';
const values = [cohort];

const queryString = `
SELECT  teachers.name as teacher, cohorts.name as cohort, count(assistance_requests.*) as total_assistances
FROM teachers 
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
JOIN students ON assistance_requests.student_id =students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name=$1 
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
`;

pool.query(queryString, values)
  .then(res => {
    res.rows.forEach(item => {
      console.log(`${item.cohort}: ${item.teacher}`);
    });
  }).catch(err => console.error('query error', err.stack));