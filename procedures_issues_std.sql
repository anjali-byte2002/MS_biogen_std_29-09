
standardization of proc_name, proc_code and proc_coding system where earlier it was getting standardised as 'NS'. 
The ones which are still not standardised are the codes which are not present in lookup table, most of themm are invalid codes also


SELECT distinct
    p.proc_code,

    t.COMMONDESCRIPTION AS new_proc_name_std,
    t.DESCRIPTION AS new_proc_description_std,

    p.proc_coding_system_std AS current_proc_coding_system_std,

    CASE
        WHEN (p.proc_code IS NULL OR TRIM(p.proc_code) = '')
             AND (p.proc_name IS NULL OR TRIM(p.proc_name) = '')
            THEN NULL

        WHEN h.HCPC IS NOT NULL
            THEN 'HCPCS'

        WHEN LEFT(t.PROCEDURECODE, 5) REGEXP '^[0-9]+$'
            THEN 'CPT'

        WHEN LEFT(t.PROCEDURECODE, 5) REGEXP '^(?=.[A-Za-z])(?=.[0-9])[A-Za-z0-9]+$'
            THEN 'HCPCS'

        ELSE 'NS'
    END AS new_proc_coding_system_std

FROM biogen_consolidated.procedures p

INNER JOIN tncpa.PROCEDURECODEREFERENCE t
    ON TRIM(UPPER(p.proc_code)) = TRIM(UPPER(t.PROCEDURECODE))

LEFT JOIN semantics.hcpcs h
    ON TRIM(UPPER(p.proc_code)) = TRIM(UPPER(h.HCPC))

WHERE p.proc_coding_system_std = 'NS'
  AND p.proc_code IS NOT NULL
  AND h.HCPC IS NULL;
