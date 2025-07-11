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