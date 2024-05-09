CREATE DATABASE IF NOT EXISTS patent;
USE patent;

-- Create Patents table
CREATE TABLE IF NOT EXISTS Patents (
    patent_number VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255),
    inventor_name VARCHAR(255),
    patent_class VARCHAR(255),
    filing_date DATE,
    assignee_name VARCHAR(255),
    abstract TEXT
);

SHOW VARIABLES LIKE 'secure_file_priv';

-- Load data from CSV file into Patents table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/patent.csv'
INTO TABLE Patents
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skip header row if exists

#Selecting from the users table
SELECT * FROM Patents;

-- Search by Patent Number
SELECT * FROM Patents
WHERE patent_number = 'US2015269825A1';

-- Search by Title Keywords
SELECT * FROM Patents
WHERE title LIKE '%Glucose management%';

-- Search by Inventor Name
SELECT * FROM Patents
WHERE inventor_name IN ('Michael Mong Bao Tran');

-- Search by Filing Date
SELECT * FROM Patents
WHERE filing_date = '2014-03-20';