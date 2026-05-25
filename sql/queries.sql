-- ================================================================
-- queries.sql
-- South African Crime Statistics (2011-2022)
-- Stage 7: SQL Analytical Queries
-- ================================================================
-- Six analytic queries that address the four research questions 
-- defined in the project overview. 
-- Execute this in DBeaver after loading the database sa_crime.db
-- and running the schema.sql queries. 

-- Data source: data/processed/sa_crime_clean.csv
-- Loaded into: data/sql/sa_crime.db (SQLite)
-- ================================================================

-- ----------------------------------------------------------------
-- Query 1: Total Crime Incidents per Province (RQ1)
-- ----------------------------------------------------------------
-- Aggregates all categories and years into a single provincial
-- total, ordered descending - highest province count appears first
-- Note: absolute counts, not per-capita figures.
-- ----------------------------------------------------------------
SELECT   province, 
         SUM(incident_count)        AS total_crimes_province 
FROM     sa_crime
GROUP BY province 
ORDER BY total_crimes_province DESC;

-- ----------------------------------------------------------------
-- Query 2: Annual National Crime Incidents (RQ3)
-- ----------------------------------------------------------------
-- Aggregates all provinces and categories by year to yield
-- national annual total - serves as source for Power BI trend
-- chart. Note: sharp drop expected in 2020 due to COVID-19 period
-- ----------------------------------------------------------------
SELECT   financial_year, 
         SUM(incident_count) AS total_crimes_year 
FROM     sa_crime
GROUP BY financial_year 
ORDER BY financial_year ASC;

-- ----------------------------------------------------------------
-- Query 3: Top Crime Categories (RQ2)
-- ----------------------------------------------------------------
-- Aggregates counts for all provinces and years per category, 
-- ordered descending - largest category count appears first.
-- ----------------------------------------------------------------
SELECT   crime_category, 
         SUM(incident_count)         AS total_crimes_category 
FROM     sa_crime
GROUP BY crime_category
ORDER BY total_crimes_category DESC;

-- ----------------------------------------------------------------
-- Query 4: Year-over-Year Count Change per Province (RQ1 & RQ3)
-- ----------------------------------------------------------------
-- LAG retrieves the preceding year's total within each defined
-- province partition to produce a column 'year_over_year_change' 
-- representing directional trends. Note: NULL will appear in
-- 'year_over_year_change' in 2011 due to a lack of a prior year
-- to compare against. 
-- ----------------------------------------------------------------
SELECT   province, 
         financial_year,
         SUM(incident_count)   AS total_crimes,         
         SUM(incident_count) - LAG(SUM(incident_count))
OVER   ( PARTITION BY province 
         ORDER BY financial_year 
       )                       AS year_over_year_change
FROM     sa_crime
GROUP BY province, financial_year
ORDER BY province, financial_year;

-- ----------------------------------------------------------------
-- Query 5: Peak Year per Province (RQ1 & RQ3)
-- ----------------------------------------------------------------
-- ROW_NUMBER() in subquery ranks years within each province by
-- descending total count, with the outer query filtering rank = 1
-- to yield only the peak year per province.  
-- ----------------------------------------------------------------
SELECT    province, 
          financial_year, 
          total_count 
FROM    ( SELECT       province, 
                       financial_year, 
                       SUM(incident_count)      AS total_count,
          ROW_NUMBER() 
          OVER (               
          PARTITION BY province 
          ORDER BY     SUM(incident_count) DESC
               )                                AS count_rank
          FROM         sa_crime
          GROUP BY     province,
                       financial_year
        )               
WHERE     count_rank = 1
ORDER BY  total_count DESC;

-- ----------------------------------------------------------------
-- Query 6: Summary View for Power BI
-- ----------------------------------------------------------------
-- Pre-aggregates province and year totals as a reusable view.
-- Aggregation logic is maintained through connecting Power BI to 
-- view 'sa_crime_summary' rather than raw table sa_crime. 
-- View needs to exported to data/processed/sa_crime_summary.csv
-- via Python to be directly imported into Power BI desktop. 
-- ----------------------------------------------------------------
CREATE VIEW 
IF NOT EXISTS sa_crime_summary 
AS            SELECT   province, 
                       financial_year, 
                       SUM(incident_count)       AS total_crimes
              FROM     sa_crime 
              GROUP BY province, financial_year;

-- Queries sa_crime_summary view for verification and exporting:
SELECT   * 
FROM     sa_crime_summary
ORDER BY province, financial_year
LIMIT    20;
