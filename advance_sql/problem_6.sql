-- January
CREATE TABLE January AS
    select *
    from job_postings_fact
    where extract (month from job_posted_date) = 1
;

-- February
CREATE TABLE February AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH from job_posted_date) = 2
;

-- March
CREATE TABLE March AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH from job_posted_date) = 3
;

--Case Expression

-- Categorize salaries from each job posting

SELECT
    job_location,
    job_via,
    job_schedule_type,
    job_posted_date:: DATE as job_posted_date,
    salary_year_avg,
    Case
        WHEN salary_year_avg >=200000 then 'High'
        WHEN salary_year_avg >=100000 THEN 'Standard'
        ELSE 'Low'
        END AS salary_category

FROM job_postings_fact
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg is not null

ORDER BY salary_year_avg DESC
;


