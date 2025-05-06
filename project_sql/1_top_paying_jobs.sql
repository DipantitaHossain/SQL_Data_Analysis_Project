/*
Question: what are the top paying data analyst jobs?
---identify the top 10 highest-paying Data Analyst roles that are available remotely
---focuses on job postings with spacified salaries (remove nulls)
---why? highlight the top paying opportunities for Data Analyst
*/

SELECT
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date::date,
    salary_year_avg,
    name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON
    company_dim.company_id=job_postings_fact.company_id

WHERE job_work_from_home = true
    AND job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC

LIMIT 10;






