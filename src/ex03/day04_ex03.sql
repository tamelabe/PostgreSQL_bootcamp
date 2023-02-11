SELECT vgd.generated_date AS missing_date
FROM v_generated_dates vgd
LEFT JOIN person_visits pv ON vgd.generated_date = pv.visit_date
WHERE pv.id ISNULL
ORDER BY 1
;