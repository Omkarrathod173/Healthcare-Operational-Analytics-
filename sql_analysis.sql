CREATE TABLE patients (
 patient_id INT PRIMARY KEY, arrival_datetime TIMESTAMP, age INT, sex TEXT,
 triage_level TEXT, department TEXT, diagnosis_group TEXT, wait_time_minutes INT,
 length_of_stay_hours NUMERIC(8,2), admitted_flag INT, bed_transfer_flag INT,
 bed_transfer_delay_minutes INT, bed_occupancy_pct NUMERIC(6,2),
 insurance_type TEXT, disposition TEXT
);

-- Operational KPIs
SELECT COUNT(*) total_patients,
ROUND(AVG(wait_time_minutes),2) avg_er_wait_minutes,
ROUND(AVG(length_of_stay_hours),2) avg_los_hours,
ROUND(AVG(bed_occupancy_pct),2) avg_bed_occupancy_pct,
ROUND(100.0*AVG(admitted_flag),2) admission_rate_pct
FROM patients;

-- Length-of-stay segmentation
SELECT CASE
WHEN length_of_stay_hours < 4 THEN '<4h'
WHEN length_of_stay_hours < 8 THEN '4-8h'
WHEN length_of_stay_hours < 12 THEN '8-12h'
ELSE '12h+' END los_band,
COUNT(*) patients,ROUND(AVG(wait_time_minutes),2) avg_wait
FROM patients GROUP BY 1 ORDER BY 1;

-- 15% transfer bottleneck
SELECT ROUND(100.0*AVG(bed_transfer_flag),2) transfer_rate_pct,
ROUND(AVG(bed_transfer_delay_minutes) FILTER(WHERE bed_transfer_flag=1),2) avg_transfer_delay_minutes,
ROUND(AVG(wait_time_minutes) FILTER(WHERE bed_transfer_flag=1),2) avg_wait_for_transfer_group
FROM patients;

-- Wait-time drivers by triage
SELECT triage_level,COUNT(*) patients,ROUND(AVG(wait_time_minutes),2) avg_wait,
ROUND(AVG(length_of_stay_hours),2) avg_los
FROM patients GROUP BY triage_level ORDER BY avg_wait DESC;

-- Hourly operational pressure
SELECT EXTRACT(HOUR FROM arrival_datetime)::int arrival_hour,
COUNT(*) arrivals,ROUND(AVG(wait_time_minutes),2) avg_wait,
ROUND(AVG(bed_occupancy_pct),2) avg_occupancy
FROM patients GROUP BY 1 ORDER BY 1;