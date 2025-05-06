/*
Question: what are the most in-demand skills for Data Analyst?
-- Join job postings to inner join table similar to query 2
-- Identify the top 5 in-demand skills for a Data Analyst
-- Focus on all job postings
-- Why? Retrieves the top 5 skills with the highest demand in the job market
    providing insights into the most valuable skills for job seekers
*/

WITH Top_in_demand_skills as (

SELECT
    skills_job_dim.skill_id,
    count(job_postings_fact.job_id) as total_job_postings
FROM skills_job_dim
INNER JOIN job_postings_fact ON
    job_postings_fact.job_id = skills_job_dim.job_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
 GROUP BY
    skills_job_dim.skill_id)

SELECT
    skills_dim.skills,
    Top_in_demand_skills.*
FROM Top_in_demand_skills
INNER JOIN skills_dim ON
    skills_dim.skill_id = Top_in_demand_skills.skill_id

ORDER BY
    Top_in_demand_skills.total_job_postings DESC

LIMIT 5;

--Another way

SELECT
    skills_dim.skills,
    count(skills_job_dim.job_id) as jobs_in_demand
FROM job_postings_fact
INNER JOIN skills_job_dim ON
    skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON
    skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
 GROUP BY
    skills_dim.skills
ORDER BY jobs_in_demand DESC
LIMIT 5;
