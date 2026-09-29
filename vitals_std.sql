WITH named AS (
SELECT distinct
vital_name AS vital_name_raw,
vital_unit,
TRIM(
CASE TRIM(vital_name)
WHEN 'Blood Pressure' THEN 'Blood pressure (BP)'
WHEN 'Blood pressure (BP)' THEN 'Blood pressure (BP)'
WHEN 'Blood pressure, sitting' THEN 'Blood pressure (sitting)'
WHEN 'Blood pressure, standing' THEN 'Blood pressure (standing)'
WHEN 'Blood pressure, supine' THEN 'Blood pressure (supine)'
WHEN 'BLOODPRESSURE.DIASTOLICREFUSED' THEN 'Blood pressure (Diastolic)-Refused'
WHEN 'BLOODPRESSURE.REFUSED' THEN 'Blood pressure-Refused'
WHEN 'BLOODPRESSURE.REFUSEDREASON' THEN 'Blood pressure-Refused Reason'
WHEN 'BLOODPRESSURE.SITE' THEN 'Blood pressure-Site'
WHEN 'BMI %' THEN 'Body mass index (BMI) Percentile'
WHEN 'BMI Percentile' THEN 'Body mass index (BMI) Percentile'
WHEN 'BMI:' THEN 'Body mass index (BMI)'
WHEN 'BMI.REFUSED' THEN 'Body mass index (BMI)-Refused'
WHEN 'Body mass index (BMI)' THEN 'Body mass index (BMI)'
WHEN 'Body mass index (BMI) [Percentile]' THEN 'Body mass index (BMI) Percentile'
WHEN 'Body mass index (BMI) [Ratio]' THEN 'Body mass index (BMI) Ratio'
WHEN 'BP' THEN 'Blood pressure (BP)'
WHEN 'BP - Lying' THEN 'Blood pressure (supine)'
WHEN 'BP - Standing' THEN 'Blood pressure (standing)'
WHEN 'BP sitting' THEN 'Blood pressure (sitting)'
WHEN 'BP standing' THEN 'Blood pressure (standing)'
WHEN 'BP supine' THEN 'Blood pressure (supine)'
WHEN 'BP-Treatment' THEN 'Blood pressure-Treatment'
WHEN 'BP:' THEN 'Blood pressure (BP)'
WHEN 'Diastolic BP:' THEN 'Blood pressure (Diastolic)'
WHEN 'HC' THEN 'Head Circumference (HC)'
WHEN 'HC %' THEN 'Head Circumference(HC) Percentile'
WHEN 'Hc Percentile' THEN 'Head Circumference(HC) Percentile'
WHEN 'Head circumference' THEN 'Head Circumference (HC)'
WHEN 'Heart Rate/Pulse Rate' THEN 'Heart Rate or Pulse Rate'
WHEN 'HEARTRATE' THEN 'Heart rate'
WHEN 'Height' THEN 'Height (Ht)'
WHEN 'Height (Ht)' THEN 'Height (Ht)'
WHEN 'Height Percentile' THEN 'Height Percentile'
WHEN 'HEIGHT.REFUSED' THEN 'Height Refused'
WHEN 'HEIGHT.REFUSEDREASON' THEN 'Height Refused Reason'
WHEN 'HEIGHT.TYPE' THEN 'Height Type'
WHEN 'HEIGHT.TYPE.VALUEID' THEN 'Height Type ValueID'
WHEN 'HR' THEN 'Heart Rate (HR)'
WHEN 'HR:' THEN 'Heart Rate (HR)'
WHEN 'Ht' THEN 'Height (Ht)'
WHEN 'Ht %' THEN 'Height (Ht) Percentile'
WHEN 'Ht Percentile' THEN 'Height (Ht) Percentile'
WHEN 'Ht-cm' THEN 'Height (Ht)'
WHEN 'Ht:' THEN 'Height (Ht)'
WHEN 'LMP' THEN 'Last Menstrual Period'
WHEN 'LMP Date' THEN 'Last Menstrual Period Date'
WHEN 'MOCA' THEN 'Montreal Cognitive Assessment'
WHEN 'NC' THEN 'Neck Circumference'
WHEN 'Neck Circumference' THEN 'Neck Circumference'
WHEN 'Neck Circumference:' THEN 'Neck Circumference'
WHEN 'O2 Sat' THEN 'Oxygen Saturation'
WHEN 'O2SATURATION' THEN 'Oxygen Saturation'
WHEN 'O2SATURATION.AIRTYPE' THEN 'Oxygen Saturation Air Type'
WHEN 'O2SATURATION.OXYGENQUANTITY' THEN 'Oxygen Saturation Oxygen Quantity'
WHEN 'Oxygen Flow Rate' THEN 'Oxygen Flow Rate'
WHEN 'Oxygen sat %' THEN 'Oxygen Saturation Percentile'
WHEN 'PAINSCALE' THEN 'Pain scale'
WHEN 'PAINSCALE.VALUEID' THEN 'Pain scale ValueID'
WHEN 'PAINSCALETYPE' THEN 'Pain scale Type'
WHEN 'PAINSCALETYPE.VALUEID' THEN 'Pain scale Type ValueID'
WHEN 'Pulse sitting' THEN 'Pulse (sitting)'
WHEN 'Pulse standing' THEN 'Pulse (standing)'
WHEN 'Pulse supine' THEN 'Pulse (supine)'
WHEN 'Pulse, sitting' THEN 'Pulse (sitting)'
WHEN 'Pulse, standing' THEN 'Pulse (standing)'
WHEN 'Pulse, supine' THEN 'Pulse (supine)'
WHEN 'PULSE.RATE' THEN 'Pulse Rate'
WHEN 'PULSE.TYPE' THEN 'Pulse Type'
WHEN 'PULSE.TYPE.VALUEID' THEN 'Pulse Type ValueID'
WHEN 'Repeat BP' THEN 'Repeat blood pressure'
WHEN 'RESPIRATIONRATE' THEN 'Respiratory rate (RR)'
WHEN 'Respiratory Rate' THEN 'Respiratory rate (RR)'
WHEN 'Respiratory rate (RR)' THEN 'Respiratory rate (RR)'
WHEN 'RR' THEN 'Respiratory rate (RR)'
WHEN 'RR:' THEN 'Respiratory rate (RR)'
WHEN 'SUPPRESSHEIGHTACCELERATION' THEN 'Supress Height Acceleration'
WHEN 'Systolic blood pressure' THEN 'Blood pressure (Systolic)'
WHEN 'Systolic BP' THEN 'Blood pressure (Systolic)'
WHEN 'Systolic BP:' THEN 'Blood pressure (Systolic)'
WHEN 'T25FW' THEN 'Unknown'
WHEN 'Temp' THEN 'Temperature'
WHEN 'Temp:' THEN 'Temperature'
WHEN 'Temperature' THEN 'Temperature'
WHEN 'TEMPERATURE.TYPE' THEN 'Temperature Type'
WHEN 'Vitals Taken By:' THEN 'Unknown'
WHEN 'VITALS.BLOODPRESSURE.DIASTOLIC' THEN 'Blood pressure (Diastolic)'
WHEN 'VITALS.BLOODPRESSURE.DIASTOLICREFUSED' THEN 'Blood pressure (Diastolic)-Refused'
WHEN 'VITALS.BLOODPRESSURE.REFUSED' THEN 'Blood pressure-Refused'
WHEN 'VITALS.BLOODPRESSURE.REFUSEDREASON' THEN 'Blood pressure-Refused Reason'
WHEN 'VITALS.BLOODPRESSURE.SITE' THEN 'Blood pressure-Site'
WHEN 'VITALS.BLOODPRESSURE.SITE.VALUEID' THEN 'Blood pressure-Site ValueID'
WHEN 'VITALS.BLOODPRESSURE.SYSTOLIC' THEN 'Blood pressure (Systolic)'
WHEN 'VITALS.BLOODPRESSURE.SYSTOLICREFUSED' THEN 'Blood pressure (Systolic)-Refused'
WHEN 'VITALS.BLOODPRESSURE.TYPE' THEN 'Blood pressure Type'
WHEN 'VITALS.BLOODPRESSURE.TYPE.VALUEID' THEN 'Blood pressure Type ValueID'
WHEN 'VITALS.BLOODPRESSURECUFFSIZE' THEN 'Blood pressure Cuff Size'
WHEN 'VITALS.BMI' THEN 'Body mass index (BMI)'
WHEN 'VITALS.BMI.PERCENTILE' THEN 'Body mass index (BMI) Percentile'
WHEN 'VITALS.BMI.REFUSED' THEN 'Body mass index (BMI)-Refused'
WHEN 'VITALS.BODYSURFACEAREA' THEN 'Body Surface Area'
WHEN 'VITALS.HEARTRATE' THEN 'Heart Rate'
WHEN 'VITALS.HEIGHT' THEN 'Height'
WHEN 'VITALS.HEIGHT.REFUSED' THEN 'Height Refused'
WHEN 'VITALS.HEIGHT.REFUSEDREASON' THEN 'Height Refused Reason'
WHEN 'VITALS.HEIGHT.TYPE' THEN 'Height Type'
WHEN 'VITALS.NOTES' THEN 'Notes'
WHEN 'VITALS.O2SATURATION' THEN 'Oxygen Saturation'
WHEN 'VITALS.O2SATURATION.AIRTYPE' THEN 'Oxygen Saturation Air Type'
WHEN 'VITALS.PAINSCALE' THEN 'Pain Scale'
WHEN 'VITALS.PAINSCALE.VALUEID' THEN 'Pain Scale ValueID'
WHEN 'VITALS.PAINSCALETYPE' THEN 'Pain Scale Type'
WHEN 'VITALS.PAINSCALETYPE.VALUEID' THEN 'Pain Scale Type ValueID'
WHEN 'VITALS.PULSE.RATE' THEN 'Pulse Rate'
WHEN 'VITALS.PULSE.TYPE' THEN 'Pulse Type'
WHEN 'VITALS.PULSE.TYPE.VALUEID' THEN 'Pulse Type Type ValueID'
WHEN 'VITALS.RESPIRATIONRATE' THEN 'Respiration Rate'
WHEN 'VITALS.SUPPRESSHEIGHTACCELERATION' THEN 'Supress Height Acceleration'
WHEN 'VITALS.TEMPERATURE' THEN 'Temperature'
WHEN 'VITALS.TEMPERATURE.TYPE' THEN 'Temperature Type'
WHEN 'VITALS.WEIGHT' THEN 'Weight (Wt)'
WHEN 'VITALS.WEIGHT.OUTOFRANGE' THEN 'Weight Out Of Range'
WHEN 'VITALS.WEIGHT.REFUSED' THEN 'Weight Refused'
WHEN 'VITALS.WEIGHT.REFUSEDREASON' THEN 'Weight Refused Reason'
WHEN 'VITALS.WEIGHT.TYPE' THEN 'Weight Type'
WHEN 'VITALS.WEIGHT.TYPE.VALUEID' THEN 'Weight Type ValueID'
WHEN 'Waist Circumference:' THEN 'Waist Circumference'
WHEN 'Waist Size' THEN 'Waist Circumference'
WHEN 'Weight' THEN 'Weight (Wt)'
WHEN 'Weight (Wt)' THEN 'Weight (Wt)'
WHEN 'Weight Percentile' THEN 'Weight (Wt) Percentile'
WHEN 'WEIGHT.OUTOFRANGE' THEN 'Weight Out Of Range'
WHEN 'WEIGHT.REFUSED' THEN 'Weight Refused'
WHEN 'WEIGHT.REFUSEDREASON' THEN 'Weight Refused Reason'
WHEN 'WEIGHT.REFUSEDREASON.VALUEID' THEN 'Weight Refused Reason ValueID'
WHEN 'WEIGHT.TYPE' THEN 'Weight Type'
WHEN 'WEIGHT.TYPE.VALUEID' THEN 'Weight Type ValueID'
WHEN 'Wt' THEN 'Weight (Wt)'
WHEN 'Wt %' THEN 'Weight (Wt) Percentile'
WHEN 'Wt Change' THEN 'Weight Change'
WHEN 'Wt Percentile' THEN 'Weight Percentile'
WHEN 'Wt-kg' THEN 'Weight (Wt)'
WHEN 'Wt:' THEN 'Weight (Wt)'
WHEN '25FOOTTIMEDWALK' THEN 'Timed 25-Foot Walk (T25FW)'
WHEN 'Blood pressure (Diastolic)' THEN 'Blood pressure (Diastolic)'
WHEN 'Blood pressure (standing)' THEN 'Blood pressure (standing)'
WHEN 'Blood pressure (Systolic)' THEN 'Blood pressure (Systolic)'
WHEN 'Blood pressure (Treatment)' THEN 'Blood pressure-Treatment'
WHEN 'BLOODPRESSURE.SITE.VALUEID' THEN 'Blood pressure-Site ValueID'
WHEN 'BLOODPRESSURE.SYSTOLICREFUSED' THEN 'Blood pressure (Systolic)-Refused'
WHEN 'BLOODPRESSURE.TYPE' THEN 'Blood pressure Type'
WHEN 'BLOODPRESSURE.TYPE.VALUEID' THEN 'Blood pressure Type ValueID'
WHEN 'BLOODPRESSURECUFFSIZE' THEN 'Blood pressure Cuff Size'
WHEN 'BMI' THEN 'Body mass index (BMI)'
WHEN 'Body height' THEN 'Height (Ht)'
WHEN 'Body Surface Area' THEN 'Body Surface Area'
WHEN 'Body Temperature' THEN 'Temperature'
WHEN 'Body Weight' THEN 'Weight (Wt)'
WHEN 'BODYSURFACEAREA' THEN 'Body Surface Area'
WHEN 'BSA' THEN 'Body Surface Area'
WHEN 'BSA Calculated' THEN 'Body Surface Area Calculated'
WHEN 'Diastolic blood pressure' THEN 'Blood pressure (Diastolic)'
WHEN 'EDSS' THEN 'Expanded Disability Status Scale (EDSS)'
WHEN 'ESS' THEN 'Epworth Sleepiness Scale (ESS)'
WHEN 'FS' THEN 'Unknown'
WHEN 'Hearing (Both)' THEN 'Hearing (Both)'
WHEN 'Heart rate' THEN 'Heart Rate (HR)'
WHEN 'Inhaled Oxygen Flow Rate' THEN 'Inhaled Oxygen Flow Rate'
WHEN 'initials' THEN 'Initials'
WHEN 'Mallampati' THEN 'Mallampati'
WHEN 'NOTES' THEN 'Notes'
WHEN 'Oxygen Saturation' THEN 'Oxygen Saturation'
WHEN 'Oxygen saturation in Blood' THEN 'Oxygen Saturation'
WHEN 'Pain scale' THEN 'Pain scale'
WHEN 'Pain Score' THEN 'Pain scale'
WHEN 'Peak Flow' THEN 'Peak Flow'
WHEN 'POX2' THEN 'Unknown'
WHEN 'Pulse' THEN 'Pulse'
WHEN 'Repeat blood pressure' THEN 'Repeat blood pressure'
WHEN 'Repeat Peak Flow' THEN 'Repeat Peak Flow'
WHEN 'SDMT' THEN 'Symbol Digit Modality Test (SDMT)'
WHEN 'Smoking' THEN 'Smoking'
WHEN 'SpO2' THEN 'Oxygen Saturation'
WHEN 'Vision' THEN 'Vision'
ELSE TRIM(vital_name)
END
) AS vital_name_std
FROM biogen_consolidated.vitals
)
SELECT distinct
vital_name_raw,
vital_name_std,
vital_unit,
CASE
WHEN NULLIF(TRIM(vital_unit), '') IS NOT NULL THEN vital_unit
ELSE
CASE TRIM(vital_name_std)
WHEN 'Blood pressure (BP)' THEN 'mm Hg'
WHEN 'Blood pressure (Diastolic)' THEN 'mm Hg'
WHEN 'Blood pressure (Systolic)' THEN 'mm Hg'
WHEN 'Blood pressure (sitting)' THEN 'mm Hg'
WHEN 'Blood pressure (standing)' THEN 'mm Hg'
WHEN 'Blood pressure (supine)' THEN 'mm Hg'
WHEN 'Blood pressure-Treatment' THEN 'mm Hg'
WHEN 'Repeat blood pressure' THEN 'mm Hg'
WHEN 'Blood pressure (Diastolic)-Refused' THEN NULL
WHEN 'Blood pressure (Systolic)-Refused' THEN NULL
WHEN 'Blood pressure Cuff Size' THEN NULL
WHEN 'Blood pressure Type' THEN NULL
WHEN 'Blood pressure Type ValueID' THEN NULL
WHEN 'Blood pressure-Refused' THEN NULL
WHEN 'Blood pressure-Refused Reason' THEN NULL
WHEN 'Blood pressure-Site' THEN NULL
WHEN 'Blood pressure-Site ValueID' THEN NULL
WHEN 'Body Surface Area' THEN 'm2'
WHEN 'Body Surface Area Calculated' THEN 'm2'
WHEN 'Body mass index (BMI)' THEN 'kg/m2'
WHEN 'Body mass index (BMI) Ratio' THEN 'kg/m2'
WHEN 'Body mass index (BMI) Percentile' THEN '%'
WHEN 'Body mass index (BMI)-Refused' THEN NULL
WHEN 'Epworth Sleepiness Scale (ESS)' THEN 'score'
WHEN 'Expanded Disability Status Scale (EDSS)' THEN 'score'
WHEN 'Symbol Digit Modality Test (SDMT)' THEN 'score'
WHEN 'Timed 25-Foot Walk (T25FW)' THEN 'secs'
WHEN 'Montreal Cognitive Assessment' THEN 'score'
WHEN 'Mallampati' THEN 'class'
WHEN 'Pain Scale' THEN 'score'
WHEN 'Pain scale' THEN 'score'
WHEN 'Pain Scale Type' THEN NULL
WHEN 'Pain Scale Type ValueID' THEN NULL
WHEN 'Pain Scale ValueID' THEN NULL
WHEN 'Pain scale Type' THEN NULL
WHEN 'Pain scale Type ValueID' THEN NULL
WHEN 'Pain scale ValueID' THEN NULL
WHEN 'Head Circumference (HC)' THEN 'cm'
WHEN 'Head Circumference(HC) Percentile' THEN '%'
WHEN 'Hearing (Both)' THEN NULL
WHEN 'Vision' THEN NULL
WHEN 'Smoking' THEN NULL
WHEN 'Heart Rate' THEN 'beats/min'
WHEN 'Heart Rate (HR)' THEN 'beats/min'
WHEN 'Heart Rate or Pulse Rate' THEN 'beats/min'
WHEN 'Heart rate' THEN 'beats/min'
WHEN 'Pulse' THEN 'beats/min'
WHEN 'Pulse (sitting)' THEN 'beats/min'
WHEN 'Pulse (standing)' THEN 'beats/min'
WHEN 'Pulse (supine)' THEN 'beats/min'
WHEN 'Pulse Rate' THEN 'beats/min'
WHEN 'Pulse Type' THEN NULL
WHEN 'Pulse Type Type ValueID' THEN NULL
WHEN 'Pulse Type ValueID' THEN NULL
WHEN 'Height' THEN 'cm'
WHEN 'Height (Ht)' THEN 'cm'
WHEN 'Height (Ht) Percentile' THEN '%'
WHEN 'Height Percentile' THEN '%'
WHEN 'Height Refused' THEN NULL
WHEN 'Height Refused Reason' THEN NULL
WHEN 'Height Type' THEN NULL
WHEN 'Height Type ValueID' THEN NULL
WHEN 'Inhaled Oxygen Flow Rate' THEN 'L/min'
WHEN 'Oxygen Flow Rate' THEN 'L/min'
WHEN 'Oxygen Saturation' THEN '%'
WHEN 'Oxygen Saturation Air Type' THEN NULL
WHEN 'Oxygen Saturation Oxygen Quantity' THEN 'L/min'
WHEN 'Oxygen Saturation Percentile' THEN '%'
WHEN 'Last Menstrual Period' THEN NULL
WHEN 'Last Menstrual Period Date' THEN NULL
WHEN 'Initials' THEN NULL
WHEN 'Notes' THEN NULL
WHEN 'Peak Flow' THEN 'L/min'
WHEN 'Repeat Peak Flow' THEN 'L/min'
WHEN 'Respiration Rate' THEN 'breaths/min'
WHEN 'Respiratory rate (RR)' THEN 'breaths/min'
WHEN 'Supress Height Acceleration' THEN NULL
WHEN 'Temperature' THEN 'F'
WHEN 'Temperature Type' THEN NULL
WHEN 'Unknown' THEN NULL
WHEN 'Waist Circumference' THEN 'cm'
WHEN 'Neck Circumference' THEN 'cm'
WHEN 'Weight (Wt)' THEN 'lbs'
WHEN 'Weight (Wt) Percentile' THEN '%'
WHEN 'Weight Change' THEN 'lbs'
WHEN 'Weight Out Of Range' THEN NULL
WHEN 'Weight Percentile' THEN '%'
WHEN 'Weight Refused' THEN NULL
WHEN 'Weight Refused Reason' THEN NULL
WHEN 'Weight Refused Reason ValueID' THEN NULL
WHEN 'Weight Type' THEN NULL
WHEN 'Weight Type ValueID' THEN NULL
ELSE NULL
END
END AS vital_unit_std
FROM named;




























































































































































































































































































































































































































































































































































































































































































































