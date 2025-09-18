/*
==================
The purpose of this init database script is to set up a clean and organized database environment before you start loading and analyzing data.
==================
*/
-- Create database
CREATE DATABASE cafe_rewards;

--  Create Schemas
-- staging = raw data zone (CSV import)
-- dw      = cleaned & modeled data (Fact/Dim tables)
-- ========================================================
CREATE SCHEMA staging;
CREATE SCHEMA dw;
-- ========================================================
