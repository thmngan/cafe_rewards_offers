-- ========================================================
-- Purpose: Initialization script for the CafeRewards project
-- This script creates a fresh database environment for development/analysis.

-- Usage:
--   Run this script before loading data or building transformations
--   so that you always start with a consistent structure.
-- ========================================================

-- Create database
CREATE DATABASE cafe_rewards;

--  Create Schemas
-- staging = raw data zone (CSV import)
-- dw      = cleaned & modeled data (Fact/Dim tables)
-- ========================================================
CREATE SCHEMA staging;
CREATE SCHEMA dw;
-- ========================================================
