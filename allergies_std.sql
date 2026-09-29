WITH snomed_max AS (
SELECT conceptId, MAX(id) AS latest_snomed_id
FROM semantics.snomed
WHERE active = 1
GROUP BY conceptId
),
rx_max AS (
SELECT EVD_RXN_RXCUI, MAX(EVD_RXN_CONCEPT_SOURCE_KEY) AS latest_rx_id
FROM FDB.REVDCS0_RXN_CONCEPT_SOURCE
GROUP BY EVD_RXN_RXCUI
),
rxdesc_one AS (     -- one description per source key, so codes don't duplicate
SELECT EVD_RXN_CONCEPT_SOURCE_KEY, MIN(EVD_RXN_STR) AS EVD_RXN_STR
FROM FDB.REVDCD0_RXN_CONCEPT_DESC
GROUP BY EVD_RXN_CONCEPT_SOURCE_KEY
),

/* ---------- distinct NS codes ---------- */
ns_codes AS (
SELECT
allergen_code,
allergen_coding_system,
CASE WHEN UPPER(TRIM(allergen_coding_system)) = 'NDC' THEN 1 ELSE 0 END AS is_ndc,
GROUP_CONCAT(DISTINCT allergen_name ORDER BY allergen_name SEPARATOR ' | ') AS raw_allergen_names,
COUNT(*) AS row_count
FROM biogen_consolidated.allergies
WHERE allergen_name_std          = 'NS'
AND allergen_coding_system_std = 'NS'
AND allergen_code_std          = 'NS'
AND allergen_code IS NOT NULL
AND TRIM(allergen_code) <> ''
GROUP BY allergen_code, allergen_coding_system
),

/* ---------- NDC normalisation ---------- */
ndc_typed AS (
SELECT
allergen_code,
REGEXP_REPLACE(TRIM(allergen_code), '[^0-9-]', '') AS code_clean,
REGEXP_REPLACE(allergen_code, '[^0-9]', '')        AS code_digits
FROM ns_codes
WHERE is_ndc = 1
),
ndc_ruled AS (
SELECT t.*,
CASE
WHEN code_clean REGEXP '^[0-9]{4,5}-[0-9]{3,4}-[0-9]{1,2}$'
AND CHAR_LENGTH(code_digits) IN (10, 11)                THEN 'HYPHENATED'
WHEN code_clean REGEXP '^[0-9]{11}$'                          THEN 'NDC11'
WHEN code_clean REGEXP '^[0-9]{7,9}$'                         THEN 'ZERO_STRIPPED'
WHEN code_clean REGEXP '^([0-9]{5}-[0-9]{5}|[0-9]{10})$'      THEN 'NDC10_AMBIGUOUS'
ELSE 'NOT_NDC'
END AS ndc_rule
FROM ndc_typed t
),
ndc_candidates AS (
SELECT allergen_code,
CASE ndc_rule
WHEN 'HYPHENATED' THEN CONCAT(
LPAD(SUBSTRING_INDEX(code_clean, '-', 1), 5, '0'),
LPAD(SUBSTRING_INDEX(SUBSTRING_INDEX(code_clean, '-', 2), '-', -1), 4, '0'),
LPAD(SUBSTRING_INDEX(code_clean, '-', -1), 2, '0'))
WHEN 'NDC11'         THEN code_clean
WHEN 'ZERO_STRIPPED' THEN LPAD(code_clean, 11, '0')
END AS ndc11
FROM ndc_ruled
WHERE ndc_rule IN ('HYPHENATED', 'NDC11', 'ZERO_STRIPPED')

UNION ALL   -- ambiguous 10-digit: 4-4-2
SELECT allergen_code, CONCAT('0', code_digits)
FROM ndc_ruled WHERE ndc_rule = 'NDC10_AMBIGUOUS'

UNION ALL   -- 5-3-2
SELECT allergen_code, CONCAT(LEFT(code_digits, 5), '0', RIGHT(code_digits, 5))
FROM ndc_ruled WHERE ndc_rule = 'NDC10_AMBIGUOUS'

UNION ALL   -- 5-4-1
SELECT allergen_code, CONCAT(LEFT(code_digits, 9), '0', RIGHT(code_digits, 1))
FROM ndc_ruled WHERE ndc_rule = 'NDC10_AMBIGUOUS'
),
ndc_resolved AS (
SELECT c.allergen_code,
MIN(m.NDC) AS ndc11,
MIN(m.BN)  AS bn
FROM ndc_candidates c
JOIN FDB.RNDC14_NDC_MSTR m ON m.NDC = c.ndc11
GROUP BY c.allergen_code
HAVING COUNT(DISTINCT m.NDC) = 1
)

SELECT
c.allergen_code,
c.allergen_coding_system,
c.raw_allergen_names,
c.row_count,

CASE WHEN c.is_ndc = 1
THEN COALESCE(NULLIF(TRIM(nr.bn), ''), 'NS')
ELSE COALESCE(rxdesc.EVD_RXN_STR, ndc.BN, s.term, 'NS')
END AS allergen_name_std,

CASE
WHEN c.is_ndc = 1 THEN IF(nr.ndc11 IS NOT NULL, 'NDC', 'NS')
WHEN rx.EVD_RXN_RXCUI IS NOT NULL AND ndc.NDC IS NULL AND s.conceptId IS NULL THEN 'RXNORM'
WHEN ndc.NDC IS NOT NULL AND rx.EVD_RXN_RXCUI IS NULL AND s.conceptId IS NULL THEN 'NDC'
WHEN s.conceptId IS NOT NULL AND rx.EVD_RXN_RXCUI IS NULL AND ndc.NDC IS NULL THEN 'SNOMED'
ELSE 'NS'
END AS allergen_coding_system_std,

CASE WHEN c.is_ndc = 1
THEN COALESCE(nr.ndc11, 'NS')
ELSE COALESCE(rx.EVD_RXN_RXCUI, ndc.NDC, s.conceptId, 'NS')
END AS allergen_code_std

FROM ns_codes c

/* NDC codes: normalised lookup */
LEFT JOIN ndc_resolved nr
ON nr.allergen_code = c.allergen_code
AND c.is_ndc = 1

/* Non-NDC codes: existing logic */
LEFT JOIN snomed_max sm
ON TRIM(c.allergen_code) = CAST(sm.conceptId AS CHAR)
AND c.is_ndc = 0
LEFT JOIN semantics.snomed s
ON sm.conceptId = s.conceptId
AND s.id = sm.latest_snomed_id
LEFT JOIN FDB.RNDC14_NDC_MSTR ndc
ON REPLACE(REPLACE(TRIM(c.allergen_code), '_', ''), '-', '') = ndc.NDC
AND c.is_ndc = 0
LEFT JOIN rx_max rxm
ON rxm.EVD_RXN_RXCUI = TRIM(c.allergen_code)
AND c.is_ndc = 0
LEFT JOIN FDB.REVDCS0_RXN_CONCEPT_SOURCE rx
ON rx.EVD_RXN_RXCUI = TRIM(c.allergen_code)
AND rx.EVD_RXN_CONCEPT_SOURCE_KEY = rxm.latest_rx_id
LEFT JOIN rxdesc_one rxdesc
ON rx.EVD_RXN_CONCEPT_SOURCE_KEY = rxdesc.EVD_RXN_CONCEPT_SOURCE_KEY

ORDER BY allergen_coding_system_std, c.allergen_code;  -- 1528


























































































































































































































































































































































































































































































































































































































































































































































































































































































