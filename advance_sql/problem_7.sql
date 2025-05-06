
/* 
Find the companies that have the most job openings
 - Get the total number of job postings per company id
 - Return the total number of jobs with the company name
*/

SELECT
    company_dim.name as company_name,
    Count(job_postings_fact.company_id) AS total_job_count
FROM company_dim
LEFT JOIN job_postings_fact ON
job_postings_fact.company_id=company_dim.company_id

GROUP BY company_name

ORDER BY total_job_count DESC

LIMIT 10;

/* 
Find the count of the number of remote job posting per skill
 - Display the top 5 skills by their demand in remote jobs
 - Include skill_id, name and count of postings requiring the skill
*/

SELECT
     skills_job_dim.skill_id,
     skills_dim.skills,
     count(skills_job_dim.job_id) as total_job
FROM 
    skills_job_dim
LEFT JOIN
    skills_dim ON
    skills_dim.skill_id = skills_job_dim.skill_id

LEFT JOIN
    job_postings_fact ON
    job_postings_fact.job_id=skills_job_dim.job_id

WHERE job_postings_fact.job_work_from_home = true

GROUP BY 
    skills_job_dim.skill_id,
     skills_dim.skills

ORDER BY total_job DESC

LIMIT 5;