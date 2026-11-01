SELECT
    sk.skills,
    count(j.job_id) as skill_count
FROM job_postings_fact as j
INNER JOIN skills_job_dim as s ON j.job_id = s.job_id
INNER JOIN skills_dim as sk ON s.skill_id = sk.skill_id
WHERE 
    j.job_title_short = 'Data Analyst'  
    AND j.job_work_from_home = 'TRUE'
 group by sk.skills
 ORDER BY skill_count DESC
 limit 5;