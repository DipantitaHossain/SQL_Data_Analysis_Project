/*
Find job postings from the first quarter that have a salary greater than $70k
--Combine job posting tables from the first quater of 2023 (Jan,Feb,Mar)
--Gets job postings with an average yearly salary >$70000
*/

SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM (
SELECT
    *
FROM january
UNION ALL
SELECT
    *
FROM february
UNION ALL
SELECT
    *
FROM march
) AS quarter1_job_posting

WHERE salary_year_avg >70000 AND
      job_title_short = 'Data Analyst'

ORDER BY salary_year_avg DESC

