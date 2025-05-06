/*
Question: what are the most optimal skills to learn (its in high demand and high paying skills)?
-- Identify skills in high demand and associated with high average salaries for data analyst roles
-- Concentrates on remote postions with specified salaries
-- Why? Target skills that offer job security (high demand) and financial benefits (high salaries),
    offersing strategic insights for career development in data analysis
*/

WITH skills_demand AS (

    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) as demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON
        skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON
        skills_dim.skill_id = skills_job_dim.skill_id
    WHERE job_postings_fact.job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
        AND job_postings_fact.job_work_from_home = true
    GROUP BY
        skills_dim.skill_id
)
,
average_salary AS (
    SELECT
        skills_dim.skill_id,
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
        skills_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_salary.avg_salary

FROM skills_demand
INNER JOIN average_salary ON
    average_salary.skill_id = skills_demand.skill_id
ORDER BY
    skills_demand.demand_count DESC,
    average_salary.avg_salary DESC
LIMIT 25;

-- Rewrite this same query more concisely

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count,
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
    skills_dim.skill_id
HAVING 
    count(skills_job_dim.job_id) >10
ORDER BY 
    avg_salary DESC,
    demand_count DESC
    
LIMIT 25;
