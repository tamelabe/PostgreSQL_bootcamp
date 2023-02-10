SELECT INTO person_order
SELECT gs_id AS id,
       p.id AS person_id,
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
       '2022-02-25' AS visit_date
FROM generate_series((SELECT (MAX(id) + 1) FROM person_order),
                    ((SELECT MAX(id) FROM person) + (SELECT MAX(id) FROM person_order)), 1) AS gs_id
JOIN person p ON (p.id + (SELECT MAX(id) FROM person_order)) = gs_id
;
