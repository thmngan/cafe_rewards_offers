-- ========================================================
-- Data Quality Checks & Cleaning Script
-- Purpose: Detect and fix duplicates, NULLs, unwanted spaces,
--          and inconsistent categorical values
-- ========================================================

-- 1. Check duplicates in 3 tables
--    Compare total rows vs distinct PK/logic key
SELECT 'offers'    AS table_name, COUNT(*) AS total, COUNT(DISTINCT offer_id) AS unique_ids
FROM offers
UNION ALL
SELECT 'customers', COUNT(*), COUNT(DISTINCT customer_id)
FROM customers
UNION ALL
SELECT 'events', COUNT(*), COUNT(DISTINCT (customer_id, event, value, time))
FROM events;

-- 2. Remove duplicates in events
--    Keep the first row per (customer_id, event, value, time), remove the rest
DELETE FROM events a
USING (
    SELECT ctid,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id, event, value, time
               ORDER BY ctid
           ) AS rn
    FROM events
) b
WHERE a.ctid = b.ctid
  AND b.rn > 1;

-- 3. Check for NULL values in PK & FK across 3 tables
SELECT 'customers' AS table_name, COUNT(customer_id) AS is_null
FROM customers 
WHERE customer_id IS NULL
UNION ALL
SELECT 'events', COUNT(customer_id)
FROM events
WHERE customer_id IS NULL
UNION ALL
SELECT 'offers', COUNT(offer_id)
FROM offers
WHERE offer_id IS NULL;

-- 4. Check for unwanted spaces 
--    Customers
SELECT customer_id
FROM customers
WHERE customer_id != TRIM(customer_id);

--    Events
SELECT customer_id
FROM events
WHERE customer_id != TRIM(customer_id);

--    Offers
SELECT offer_id
FROM offers
WHERE offer_id != TRIM(offer_id);

-- 5. Data Standardization
--    Check distinct categorical values
--    Customers - gender
SELECT DISTINCT gender
FROM customers;

--    Events - event type
SELECT DISTINCT event
FROM events;

--    Offers - offer type
SELECT DISTINCT offer_type
FROM offers;
