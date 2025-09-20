-- ========================================================
-- Purpose:  Initialization script for the CafeRewards project + Load raw data directly into the database
-- This script creates a fresh database environment for development/analysis.
-- This script creates tables for customers, events, and offers,
-- then imports raw CSV files into these tables for further transformation.

-- Usage:
--   1. Run this script after initializing the database.
--   2. Ensure the CSV file paths are correct on your local environment.
--   3. Data here is raw and will be transformed later into the DW schema.
-- ========================================================

-- Create database
CREATE DATABASE cafe_rewards;

-- ========================================================

-- Create customers table and import customers.csv
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id       VARCHAR(100),
    became_member_on  DATE,
    gender            VARCHAR(5),
    age               INT,
    income            INT
);

COPY customers
FROM 'D:\BI\Cafe Rewards Offers Project\customers.csv' 
WITH (
    FORMAT csv, 
    HEADER true
);

-- Create events table and import events.csv
DROP TABLE IF EXISTS events;
CREATE TABLE events (
    customer_id  VARCHAR(100),
    event        VARCHAR(100),
    value        VARCHAR(100),
    time         INT
);

COPY events
FROM 'D:\BI\Cafe Rewards Offers Project\events.csv' 
WITH (
    FORMAT csv, 
    HEADER true
);

-- Create offers table and import offers.csv
DROP TABLE IF EXISTS offers;
CREATE TABLE offers (
    offer_id    VARCHAR(50),
    offer_type  VARCHAR(50),
    difficulty  INT,
    reward      INT,
    duration    INT,
    channels    VARCHAR(50)
);

COPY offers
FROM 'D:\BI\Cafe Rewards Offers Project\offers.csv'
WITH (
    FORMAT csv, 
    HEADER true
);
