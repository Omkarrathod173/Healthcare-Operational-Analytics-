# 🏥 Healthcare Operational Analytics

![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-150458?style=for-the-badge&logo=pandas&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Analytics-CC292B?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Healthcare](https://img.shields.io/badge/Domain-Healthcare%20Analytics-008080?style=for-the-badge)
![Reporting](https://img.shields.io/badge/Reporting-BI%20%26%20KPIs-FF6F00?style=for-the-badge)

An end-to-end healthcare operational analytics pipeline designed to evaluate hospital performance, optimize resource utilization, and track critical clinical metrics across patient admissions, departmental workflows, and readmission trends.

---

## ⚡ Architecture & Pipeline Workflow

```text
[ Raw EHR Data ] ──► [ Python / Pandas Cleaning ] ──► [ Operational Analysis ] ──► [ Executive Metrics ]
                           • Schema Normalization           • Length of Stay (LOS)             • Bed Turnover Rate
                           • Null Imputation                • 30-Day Readmission Risk          • Cost Efficiency
                           • Datetime Coercion              • Resource Allocation              • Department KPIs
