SELECT
job_title_short AS title,
job_location AS location,
job_posted_date:: TIME AS date
FROM
job_postings_fact
LIMIT 50;

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS date_month ,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM
    job_postings_fact
LIMIT 10;

SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    date_month
ORDER BY
    job_posted_count DESC;


SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_schedule_type,
    AVG(salary_year_avg) AS salary_yearly,
    AVG(salary_hour_avg) AS salary_hourly,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM 
    job_postings_fact
WHERE
    job_posted_date > '2023-06-01'
GROUP BY
    job_schedule_type, job_id
LIMIT 50;

SELECT 
    COUNT(*)
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01';

SELECT
    job_id,
    salary_year_avg,
    salary_hour_avg
FROM job_postings_fact
WHERE job_id IN (0, 5, 6, 8);

-- January
CREATE TABLE January_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE February_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE March_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_title_short, job_posted_date
FROM January_jobs;





