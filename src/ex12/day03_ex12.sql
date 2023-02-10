SELECT INTO person_order
SELECT gs_id AS id,
       p.id AS person_id,
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
       '2022-02-25' AS visit_date
FROM generate_series((SELECT (MAX(id) + 1) FROM person_order),
                    ((SELECT MAX(id) FROM person) + (SELECT MAX(id) FROM person_order)), 1) AS gs_id
JOIN person p ON (p.id + (SELECT MAX(id) FROM person_order)) = gs_id
;

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT gen_id AS id,
       pers_id.id AS person_id,
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
       '2022-02-25' AS visit_date
FROM generate_series((SELECT max(id) + 1 FROM person_order),
                     (SELECT max(id) FROM person) + (SELECT max(id) FROM person_order)) AS gen_id
JOIN person AS pers_id ON pers_id.id + (SELECT max(id) FROM person_order) = gen_id