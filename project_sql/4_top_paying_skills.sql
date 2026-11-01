 SELECT
    sk.skills,
    round(avg(j.salary_year_avg),2) as salary_year_avg
FROM job_postings_fact as j
INNER JOIN skills_job_dim as s ON j.job_id = s.job_id
INNER JOIN skills_dim as sk ON s.skill_id = sk.skill_id
WHERE 
    j.job_title_short = 'Data Analyst'  
    AND j.salary_year_avg IS NOT NULL
    AND j.job_work_from_home = 'TRUE'
group by sk.skills
ORDER BY salary_year_avg DESC
limit 25;
/*
[
  {
    "skills": "pyspark",
    "salary_year_avg": "208172.25"
  },
  {
    "skills": "bitbucket",
    "salary_year_avg": "189154.50"
  },
  {
    "skills": "couchbase",
    "salary_year_avg": "160515.00"
  },
  {
    "skills": "watson",
    "salary_year_avg": "160515.00"
  },
  {
    "skills": "datarobot",
    "salary_year_avg": "155485.50"
  },
  {
    "skills": "gitlab",
    "salary_year_avg": "154500.00"
  },
  {
    "skills": "swift",
    "salary_year_avg": "153750.00"
  },
  {
    "skills": "jupyter",
    "salary_year_avg": "152776.50"
  },
  {
    "skills": "pandas",
    "salary_year_avg": "151821.33"
  },
  {
    "skills": "elasticsearch",
    "salary_year_avg": "145000.00"
  },
  {
    "skills": "golang",
    "salary_year_avg": "145000.00"
  },
  {
    "skills": "numpy",
    "salary_year_avg": "143512.50"
  },
  {
    "skills": "databricks",
    "salary_year_avg": "141906.60"
  },
  {
    "skills": "linux",
    "salary_year_avg": "136507.50"
  },
  {
    "skills": "kubernetes",
    "salary_year_avg": "132500.00"
  },
  {
    "skills": "atlassian",
    "salary_year_avg": "131161.80"
  },
  {
    "skills": "twilio",
    "salary_year_avg": "127000.00"
  },
  {
    "skills": "airflow",
    "salary_year_avg": "126103.00"
  },
  {
    "skills": "scikit-learn",
    "salary_year_avg": "125781.25"
  },
  {
    "skills": "jenkins",
    "salary_year_avg": "125436.33"
  },
  {
    "skills": "notion",
    "salary_year_avg": "125000.00"
  },
  {
    "skills": "scala",
    "salary_year_avg": "124903.00"
  },
  {
    "skills": "postgresql",
    "salary_year_avg": "123878.75"
  },
  {
    "skills": "gcp",
    "salary_year_avg": "122500.00"
  },
  {
    "skills": "microstrategy",
    "salary_year_avg": "121619.25"
  }
]
*/
