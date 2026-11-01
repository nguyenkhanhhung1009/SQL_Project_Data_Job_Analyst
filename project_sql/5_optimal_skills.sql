WITH skills_demand AS (
    SELECT
        sk.skill_id,
        sk.skills,
        count(j.job_id) as skill_count
    FROM job_postings_fact as j
    INNER JOIN skills_job_dim as s ON j.job_id = s.job_id
    INNER JOIN skills_dim as sk ON s.skill_id = sk.skill_id
    WHERE 
        j.job_title_short = 'Data Analyst'
        AND j.salary_year_avg IS NOT NULL  
        AND j.job_work_from_home = 'TRUE'
    group by sk.skills, sk.skill_id
    ORDER BY skill_count DESC
),
skills_salary AS(
    SELECT
        sk.skill_id,
        sk.skills,
        round(avg(j.salary_year_avg),2) as salary_year_avg
    FROM job_postings_fact as j
    INNER JOIN skills_job_dim as s ON j.job_id = s.job_id
    INNER JOIN skills_dim as sk ON s.skill_id = sk.skill_id
    WHERE 
        j.job_title_short = 'Data Analyst'  
        AND j.salary_year_avg IS NOT NULL
        AND j.job_work_from_home = 'TRUE'
    group by sk.skills, sk.skill_id
    ORDER BY salary_year_avg DESC
)
SELECT
    d.skill_id,
    d.skills,
    d.skill_count,
    ss.salary_year_avg
FROM skills_demand as d
INNER JOIN skills_salary as ss ON d.skill_id = ss.skill_id
WHERE d.skill_count > 10
ORDER BY d.skill_count DESC, ss.salary_year_avg DESC
LIMIT 25;

