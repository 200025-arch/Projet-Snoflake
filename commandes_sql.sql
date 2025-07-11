-- ==============================
-- INITIALISATION
-- ==============================
CREATE OR REPLACE DATABASE linkedin;

USE DATABASE linkedin;

-- Stage S3
CREATE OR REPLACE STAGE bucket_s3 URL = 's3://snowflake-lab-bucket/';

-- Formats de fichiers
CREATE OR REPLACE FILE FORMAT csv_format
  TYPE = 'CSV'
  FIELD_DELIMITER = ','
  RECORD_DELIMITER = '\n'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  NULL_IF = ('')
  ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;

CREATE OR REPLACE FILE FORMAT json_format
  TYPE = 'JSON';

-- ==============================
-- TABLES & CHARGEMENT : CSV
-- ==============================

-- Table Benefits
CREATE
OR
REPLACE
TABLE benefits (
    job_id INTEGER,
    inferred STRING,
    tipe STRING
);

COPY INTO benefits
FROM @bucket_s3 / benefits.csv FILE_FORMAT = (FORMAT_NAME = csv_format);

select * from benefits;

-- Table Employee_counts
CREATE
OR
REPLACE
TABLE employee_counts (
    company_id INTEGER,
    employee_count STRING,
    follower_count STRING,
    time_recorded INTEGER
);

COPY INTO employee_counts
FROM @bucket_s3 / employee_counts.csv FILE_FORMAT = (FORMAT_NAME = csv_format);

select * from employee_counts;

-- Table Job_Skills
CREATE
OR
REPLACE
TABLE job_skills (
    job_id INTEGER,
    skill_abr STRING
);

COPY INTO job_skills
FROM @bucket_s3 / job_skills.csv FILE_FORMAT = (FORMAT_NAME = csv_format);

select * from job_skills;

-- Table Jobs_Postings
CREATE
OR
REPLACE
TABLE jobs_postings (
    job_id STRING,
    company_name STRING,
    title STRING,
    description STRING,
    max_salary STRING,
    original_listed_time STRING,
    closed_time STRING,
    pay_period STRING,
    formatted_work_type STRING,
    location STRING,
    expiry STRING,
    views STRING,
    remote_allowed STRING,
    applies STRING,
    application_url STRING,
    job_posting_url STRING,
    application_type STRING,
    listed_time STRING,
    posting_domain STRING,
    formatted_experience_level STRING,
    skills_desc STRING,
    sponsored STRING,
    company_website STRING,
    company_email STRING,
    work_type STRING,
    currency STRING,
    compensation_type STRING,
    job_tags STRING
);

COPY INTO jobs_postings
FROM
    @bucket_s3 / job_postings.csv FILE_FORMAT = (FORMAT_NAME = csv_format) ON_ERROR = 'CONTINUE';