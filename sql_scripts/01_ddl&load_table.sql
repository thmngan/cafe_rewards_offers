-- ========================================================
-- Purpose: Load raw data into the staging schema for the CafeRewards project
-- This script creates staging tables for customers, events, and offers,
-- then imports raw CSV files into these tables for further transformation.

-- Usage:
--   1. Run this script after initializing the database and creating schemas
--   2. Ensure the CSV file paths are correct on your local environment
--   3. Data here is raw and will be transformed later into DW schema
-- ========================================================


-- Create staging.customers table and import customers.csv
DROP TABLE IF EXISTS staging.customers;
CREATE TABLE staging.customers (
    customer_id       VARCHAR(100),
    became_member_on  DATE,
    gender            VARCHAR(5),
    age               INT,
    income            INT
);

COPY staging.customers
FROM 'D:\BI\Cafe Rewards Offers Project\customers.csv' 
WITH (
    FORMAT csv, 
    HEADER true
);

-- Create staging.events table and import events.csv
DROP TABLE IF EXISTS staging.events;
CREATE TABLE staging.events (
    customer_id  VARCHAR(100),
    event        VARCHAR(100),
    value        VARCHAR(100),
    time         INT
);

COPY staging.events
FROM 'D:\BI\Cafe Rewards Offers Project\events.csv' 
WITH (
    FORMAT csv, 
    HEADER true
);

-- Create staging.offers table and import offers.csv
DROP TABLE IF EXISTS staging.offers;
CREATE TABLE staging.offers (
    offer_id    VARCHAR(50),
    offer_type  VARCHAR(50),
    difficulty  INT,
    reward      INT,
    duration    INT,
    channels    VARCHAR(50)
);

COPY staging.offers
FROM 'D:\BI\Cafe Rewards Offers Project\offers.csv'
WITH (
    FORMAT csv, 
    HEADER true
);
