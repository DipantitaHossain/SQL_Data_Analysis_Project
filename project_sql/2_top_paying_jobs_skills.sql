/*
Question: What skills are required for the top paying data analyst jobs?
--- Use the top 10 highest-paying data analyst jobs from first query
--- Add the specific skills required for these roles
--- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

SELECT
    job_title,
    job_schedule_type,
    salary_year_avg,
    name as company_name,
    skills as skills_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON
    company_dim.company_id=job_postings_fact.company_id
INNER JOIN skills_job_dim ON
    skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON
    skills_dim.skill_id=skills_job_dim.skill_id

WHERE job_work_from_home = true
    AND job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC

LIMIT 10;


/*
[
  {
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills_name": "sql"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills_name": "python"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills_name": "r"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills_name": "azure"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills_name": "databricks"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills_name": "aws"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills_name": "pandas"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills_name": "pyspark"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills_name": "jupyter"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills_name": "excel"
  }
]
*/
