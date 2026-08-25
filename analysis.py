import pandas as pd
from scipy.stats import ttest_ind, chi2_contingency

df = pd.read_csv("data_patients.csv")

print(df.info())
print(df.describe(include="all"))
print("Missing values:\n", df.isna().sum())

# t-test: ER wait time, bed-transfer vs non-transfer groups
a = df.loc[df.bed_transfer_flag==1, "wait_time_minutes"]
b = df.loc[df.bed_transfer_flag==0, "wait_time_minutes"]
t_stat, p_value = ttest_ind(a,b,equal_var=False)
print({"t_stat":t_stat,"p_value":p_value})

# Chi-Square: triage vs admission
table = pd.crosstab(df.triage_level,df.admitted_flag)
chi2,p,dof,expected = chi2_contingency(table)
print({"chi2":chi2,"p_value":p,"dof":dof})

print(df.groupby("triage_level").wait_time_minutes.agg(["count","mean","median"]))
print(df.groupby("department").length_of_stay_hours.agg(["count","mean","median"]))
print("Bed transfer bottleneck rate:", round(df.bed_transfer_flag.mean()*100,2), "%")