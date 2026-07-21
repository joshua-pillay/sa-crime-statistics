# Findings Summary

## Overview
An exploratory, spatial, and predictive analysis was conducted on South African Police Service crime statistics spanning 12 years across nine provinces and seven crime categories, with the intention of addressing four structured research questions concerning the spatial distribution, categorical composition, temporal patterns and short-term trajectory of the South African crimescape between 2011 and 2022. A multi-tool pipeline spanning Excel, Python, SQL, MATLAB, and Power BI was used for EDA, geospatial analysis, trend decomposition, and time series forecasting. 

## Key Findings

### RQ1: Provincial Crime Distribution
- Gauteng, Western Cape and KwaZulu-Natal recorded the highest absolute crime totals across all years, revealing a geographic concentration of reported incidents reflective of urbanisation and population size.
- The geographic concentration in reported incidents was revealed to be structural rather than temporary, as the provincial ranking was consistent across
the cumulative and snapshot periods.

### RQ2: Crime Category Prevalence and Trends
- Community-reported incidents dominated the national crimescape, with contact crimes recording the highest absolute crime totals across all years.
- The top five categories shared two features: a 2020 minimum and post-lockdown rebound, reflective of the COVID-19 lockdown period and subsequent lifting of restrictions.
- Police action crimes experienced an increase across the 2011 – 2017 period, followed by a sharp decline post-2017, potentially reflecting policing intensity rather than genuine changes in criminal activity and public safety.

### RQ3: Cyclical and Longer-Term Patterns
- The underlying pattern for national contact crimes comprised a broadly stable but slightly declining path for the 2011 – 2019 period, followed by a sharp rebound post-2020, which confirmed the 2020 crime suppression to be temporary and not structural.
- The linear trend revealed that national contact crimes remained relatively stable across the full analysis period, indicating no long-term increase or decrease.

### RQ4: Short-Term Forecast
- A nearly flat 3-year projection of national contact crime figures was produced for 2023 – 2025, with projected figures remaining close to the 2022 peak, which is reflective of the sharp post-2020 rebound.
- The widening CI reflected the increased uncertainty from a short time series and COVID-19 anomaly.
- The nearly flat near-term projection suggests that, without any structural interventions, national contact crimes are unlikely to decline significantly from rebounded levels recorded in 2022.

## Limitations
- The dataset contains absolute crime figures and not per-capita rates, meaning the figures reflect population size rather than individual crime risk.
- The dataset lacks police-station level crime figures. As such, sub-provincial spatial analysis was not possible.
- The 2020 crime figures were temporarily suppressed due to the national lockdown. Despite
having been acknowledged as an anomaly throughout the analysis, the trend decomposition and forecast results may have been influenced by its presence in the time series.
- The ARIMA(1,1,1) was a simple model that was selected for interpretability and not precision. A more complex model or a longer time series would likely produce tighter confidence intervals and more reliable projections.

## Policy Implications
The key findings were relevant to several existing South African policing and safety frameworks (SAPS Strategic Plan 2025 – 2030, NDP 2030, Integrated Crime and Violence Prevention Strategy, SAPS Annual Performance Plan, Community Policing Forums), as they could potentially inform:
- A data-driven approach for high-risk area crime targeting and allocation of policing resources.
- The crime types and areas that may require priority-level intervention.
- The annual resource allocation and operational planning at a national level.
- The planning of localised crime prevention initiatives and awareness campaigns through targeted crime operations.

## Further Reading
- [Technical Report](reports/sa_crime_report.pdf)
- [Summary Report](reports/sa_crime_summary.pdf)