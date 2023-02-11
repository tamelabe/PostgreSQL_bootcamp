CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM person_visits AS pv
JOIN person p ON p.id = pv.person_id
JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE visit_date = '2022-01-08' AND p.name = 'Dmitriy'
    AND price < 800
;
