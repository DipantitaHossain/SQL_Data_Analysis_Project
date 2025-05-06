/*
Question: What are the top skills based on salary?
-- Look at the average salary associated with each skill for data analyst positions
-- Focuses on roles with specified salaries regardless of location
-- Why? It reveals how different skills impact salary levels for Data Analyst 
    and helps to identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills_dim.skills,
    round(avg(job_postings_fact.salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON
    skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON
    skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_work_from_home = true
 GROUP BY
    skills_dim.skills
ORDER BY avg_salary DESC
LIMIT 25;

