Clean std is performed here and complete std

Distinct 
WITH distinct_names AS (
SELECT DISTINCT test_name
FROM biogen_consolidated.radiology   
),

base AS (
SELECT
r.test_name,
-- strip a leading '-' (and surrounding whitespace) if present
REGEXP_REPLACE(TRIM(r.test_name), '^\\s*-\\s*', '') AS test_name_clean
FROM distinct_names r
),

prefixed AS (
SELECT
test_name,
test_name_clean,
-- optional "P <code> " procedure-code prefix (e.g. "P 77003 ")
REGEXP_SUBSTR(test_name_clean, '^P\\s+[0-9]+\\s+') AS pcode_prefix
FROM base
),

remainder AS (
SELECT
test_name,
pcode_prefix,
CASE
WHEN pcode_prefix IS NOT NULL
THEN SUBSTRING(test_name_clean, LENGTH(pcode_prefix) + 1)
ELSE test_name_clean
END AS remainder0
FROM prefixed
),

modality_mapped AS (
SELECT
test_name,
pcode_prefix,
remainder0,
REGEXP_SUBSTR(remainder0, '^[A-Za-z/\\-]+') AS leading_token,
CASE UPPER(REGEXP_SUBSTR(remainder0, '^[A-Za-z/\\-]+'))
WHEN 'MRI'        THEN 'MRI'
WHEN 'MR'         THEN 'MRI'
WHEN 'MRA'        THEN 'MRA'
WHEN 'MRV'        THEN 'MRV'
WHEN 'CT'         THEN 'CT'
WHEN 'CTA'        THEN 'CTA'
WHEN 'XR'         THEN 'X-ray'
WHEN 'XRAY'       THEN 'X-ray'
WHEN 'X-RAY'      THEN 'X-ray'
WHEN 'US'         THEN 'Ultrasound'
WHEN 'ULTRASOUND' THEN 'Ultrasound'
WHEN 'NM'         THEN 'Nuclear Medicine'
WHEN 'MG'         THEN 'Mammography'
WHEN 'MAMMO'      THEN 'Mammography'
WHEN 'FL'         THEN 'Fluoroscopy'
WHEN 'FLUORO'     THEN 'Fluoroscopy'
WHEN 'IR'         THEN 'Interventional Radiology'
WHEN 'ANG'        THEN 'Angiography'
WHEN 'PET'        THEN 'PET'
WHEN 'PET/CT'     THEN 'PET/CT'
WHEN 'DEXA'       THEN 'DEXA'
WHEN 'DXA'        THEN 'DEXA'
ELSE NULL
END AS modality_std
FROM remainder
),

body_split AS (
SELECT
test_name, pcode_prefix, modality_std,
CASE
WHEN modality_std IS NOT NULL
THEN SUBSTRING(remainder0, LENGTH(leading_token) + 1)
ELSE remainder0
END AS body
FROM modality_mapped
),

-- Step 1: WWO (with-and-without) patterns -> placeholder
c1 AS (
SELECT test_name, pcode_prefix, modality_std,
REGEXP_REPLACE(
body,
(?:\\(\\s?C-\\s?/\\s?C\\+\\s?\\)|WITH\\s*AND\\s*W/?O|WITHOUT/WITH|WITH/WITHOUT|W\\s*AND\\s*WOW|W\\s*AND\\s*OR\\s*WO|W\\s?&\\s?W/?O|WO\\s*\\+\\s*W\\b|W/?\\s*\\+\\s*W/?O|WO,\\s?W|W,\\s?WO|W/W/O|WO/W|W/&W/O|W[/\\s-]?WO|WO\\s*W\\b|W\\s*W/?O)(?:[\\s,]*(?:CONTRAST|CONTRAS|CONTRST|CONTAST|CNTRST|CONTST|CONTR|CTRT|CONT)\\b)?',
{{WWO}}', 1, 0, 'i'
) AS body
FROM body_split
),

-- Step 2: guard "WO"/"W" immediately before "IV CONTRAST" so the generic
-- WO/W passes below don't swallow "IV CONTRAST" -- keep it intact
c2 AS (
SELECT test_name, pcode_prefix, modality_std,
REGEXP_REPLACE(
REGEXP_REPLACE(body, '\\bWO\\b(?=\\s+IV\\s*CONTRAST\\b)', '{{WOPLAIN}}', 1, 0, 'i'),
\\bW\\b(?=\\s+IV\\s*CONTRAST\\b)', '{{WPLAIN}}', 1, 0, 'i'
) AS body
FROM c1
),

-- Step 3: generic WO (without) patterns -> placeholder
c3 AS (
SELECT test_name, pcode_prefix, modality_std,
REGEXP_REPLACE(
body,
(?:\\bWOIV\\b|\\bWO\\s*CONTRAST\\b|\\bW/O\\s*CONTRAST\\b|\\bWO\\s*CON\\b|\\bWO\\s*C\\b|\\(\\s?C-\\s?\\)|\\bWITHOUT\\b|\\bNO\\s*CON\\b|\\bNCON\\b|\\bW/O\\b|\\bWO\\b)(?:[\\s,]*(?:CONTRAST|CONTRAS|CONTRST|CONTAST|CNTRST|CONTST|CONTR|CTRT|CONT)\\b)?',
{{WO}}', 1, 0, 'i'
) AS body
FROM c2
),

-- Step 4: bare "W" at end of string -> placeholder for "With Contrast"
c4 AS (
SELECT test_name, pcode_prefix, modality_std,
REGEXP_REPLACE(body, '\\bW\\b\\s*$', '{{W}}', 1, 0, 'i') AS body
FROM c3
),

-- Step 5: remaining W (with) patterns -> placeholder
c5 AS (
SELECT test_name, pcode_prefix, modality_std,
REGEXP_REPLACE(
body,
(?:\\bW/\\s*(?:CONTRAST|CONTRAS|CONTRST|CONTAST|CNTRST|CONTST|CONTR|CTRT|CONT)\\b|\\bWITH\\s*CONTRAST\\b|\\bW\\s*CONTRAST\\b|\\bW\\s*CONT\\b|\\bW\\s*CON\\b|\\bW\\s*C\\b|\\(\\s?C\\+\\s?\\)|\\bW/\\b|\\bCON\\b)',
{{W}}', 1, 0, 'i'
) AS body
FROM c4
),

-- resolve placeholders to final English phrases, then normalize VW/VWS -> View/Views
resolved AS (
SELECT
test_name, pcode_prefix, modality_std,
REGEXP_REPLACE(
REGEXP_REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(body, '{{WWO}}', 'With and Without Contrast'),
{{WO}}', 'Without Contrast'
),
{{W}}', 'With Contrast'
),
{{WPLAIN}}', 'With'
),
\\bVWS\\b', 'Views', 1, 0, 'i'
),
\\bVW\\b', 'View', 1, 0, 'i'
) AS body_pre_woplain
FROM c5
),

final_body AS (
SELECT
test_name, pcode_prefix, modality_std,
REPLACE(body_pre_woplain, '{{WOPLAIN}}', 'Without') AS body
FROM resolved
)

SELECT
test_name,
CONCAT(COALESCE(pcode_prefix, ''), COALESCE(modality_std, ''), body) AS test_name_std
FROM final_body
ORDER BY test_name;

































































































































































































































































































































































































































































































































































































































































































































































































































































