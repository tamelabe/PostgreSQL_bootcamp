WITH v_id AS (
    SELECT MAX(id) + 1 FROM person_visits),
    v_per_id AS (
    SELECT id FROM person WHERE name = 'Dmitriy'),
    pre1_pizz_id AS (
    SELECT pizz.id
    FROM pizzeria pizz
    JOIN person_visits pv on pizz.id = pv.pizzeria_id
    JOIN v_per_id ON v_per_id.id = pv.person_id
    WHERE visit_date = '2022-01-08'),
    pre2_pizz_id AS (
    SELECT pizz.id
    FROM pizzeria pizz
    JOIN menu m on pizz.id = m.pizzeria_id
    WHERE price < 800),
    v_pizz_id AS (
    SELECT v2.id
    FROM pre2_pizz_id v2
    WHERE v2.id NOT IN (SELECT id FROM pre1_pizz_id) LIMIT 1)
INSERT INTO person_visits
VALUES ((SELECT * FROM v_id),
        (SELECT * FROM v_per_id),
        (SELECT * FROM v_pizz_id),
        ('2022-01-08'))
;
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
SELECT * FROM mv_dmitriy_visits_and_eats;
