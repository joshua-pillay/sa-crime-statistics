-- ================================================================
-- schema.sql
-- South African Crime Statistics (2010-2022)
-- Stage 3 - SQL Table Creation
-- ================================================================
-- Estbalishes the sa_crime table and creates a performance index.
-- Execute this in DBeaver after loading the database sa_crime.db
-- via Python.

-- Data source: data/processed/sa_crime_clean.csv
-- Loaded into: data/sql/sa_crime.db (SQLite)
-- ================================================================
-- Establishes sa_crime table with correct column types.
-- 'province' and 'crime_category' are variables of text data type.
-- 'financial_year' is an integer variable parsed to four digits 
-- in Python.
-- 'incident_count' is an integer measure.
CREATE TABLE IF NOT EXISTS sa_crime (    
              province       TEXT    NOT NULL,
              crime_category TEXT    NOT NULL,
              financial_year INTEGER NOT NULL,
              incident_count INTEGER NOT NULL
);

-- creates composite index on (province,financial_year) for optimal
-- data scaling on clauses that filter these two columns together 
-- frequently:
CREATE INDEX IF NOT EXISTS province_year_idx 
ON sa_crime (province, financial_year);

-- returns number of row entries in sa_crime table for verification
-- purposes:
SELECT COUNT(*) FROM sa_crime;
