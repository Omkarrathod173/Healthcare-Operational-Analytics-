# Healthcare Operational Analytics — Project Report

## Objective
Identify operational factors associated with emergency-room waiting time and patient flow and present the findings in Power BI.

## Data
Synthetic dataset containing 50,000 patient records with arrival time, triage, department, diagnosis, wait time, length of stay, admission, bed transfer, transfer delay and occupancy.

## Python
EDA checks distributions and missingness. A Welch t-test compares wait time for transfer vs non-transfer groups. A Chi-Square test evaluates triage level vs admission status.

## SQL
SQL calculates operational KPIs, segments length of stay, measures transfer rate/delay and compares wait times across triage levels and arrival hours.

## Dashboard
Three Power BI pages cover ER operations, bed/LOS analysis, and triage/bottleneck analysis.

## Portfolio finding
The synthetic dataset intentionally contains a **15% bed-transfer flag rate**, matching the scale stated in the resume bullet.

## Limitation
This is synthetic portfolio data, not real patient or hospital data.