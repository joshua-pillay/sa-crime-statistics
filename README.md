# Exploring South African Crime Trends: A Data-Driven Analysis (2011 - 2023)

This project comprises an exploratory, spatial and predictive analysis of published South African Police Service (SAPS) crime statistics spanning 12 years across nine provinces and seven crime categories.  A multi-tool pipeline spanning Excel, Python, MATLAB, SQL, and Power BI was used for EDA, geospatial analysis, trend decomposition, and time series forecasting. 

## Research Questions
- **RQ1:** Which provinces have the highest overall crime figures?
- **RQ2:** Which crime categories are most prevalent?
- **RQ3:** Are there identifiable cyclical or longer-term patterns?
- **RQ4:** Can a reasonable short-term forecast be produced?

## Analytical Pipeline
| Stage | Tool | Purpose |
|---|---|---|
| 1 | Excel |  Data profiling and transformation  |
| 2 | Python | Data cleaning and preparation   |
| 3 | Python |  Exploratory data analysis  |
| 4 | Python |  Geospatial analysis  |
| 5 | MATLAB |  Trend decomposition  |
| 6 | Python |  Time series forecasting  |
| 7 | SQL |  Structured querying for cross-validation  |
| 8 | Power BI |  Interactive dashboard  |

## Repository Structure
```
sa-crime-statistics/
├─ data/               # raw, processed, and SQL database files
├─ excel/              # Data profiling workbook
├─ matlab/             # Trend decomposition live script, figure and PDF export
├─ notebooks/          # Jupyter notebooks (01 to 05)
├─ powerbi/            # Dashboard file and screenshots
├─ reports/            # Technical report and summary PDFs, and LaTeX source
├─ sql/                # Schema and analytical queries
└─ requirements.txt
```

## How To Run
1. Clone the repository
2. Install dependencies: `pip install -r requirements.txt`
3. Run notebooks in order:
- `01_cleaning.ipynb`
- `02_eda.ipynb`
- `03_geospatial.ipynb`
- `04_arima.ipynb`
- `05_summary_export.ipynb`
4. Open `matlab/trend_analysis.mlx` in MATLAB
5. Open SQL scripts in DB Browser for SQLite against `data/sql/sa_crime.db`
6. Open `powerbi/sa_crime_dashboard.pbix` in Power BI Desktop

## Data Sources
- [Crime Statistics of South Africa 2011 - 2023](https://www.kaggle.com/datasets/harutyunagababyan/crime-stats-of-south-africa-2011-2023)
- [Natural Earth Admin-1 Shapefile](https://www.naturalearthdata.com/downloads/10m-cultural-vectors/10m-admin-1-states-provinces/)
- [SAPS Annual Report 2022/2023](https://www.saps.gov.za/services/downloads/2022-2023-Annual-Crime-Statistics-Report.pdf)

## Requirements
- See `requirements.txt` for Python dependencies.
- MATLAB and Power BI Desktop are required for stages 5 and 8 respectively.

## Author
Joshua Pillay - [github.com/joshua-pillay](https://github.com/joshua-pillay)