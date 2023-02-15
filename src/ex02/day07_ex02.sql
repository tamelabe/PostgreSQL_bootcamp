WITH p_visit AS (
    SELECT p.name, count(pv.pizzeria_id) AS count, 'visit' AS action_type
    FROM person_visits pv
    JOIN pizzeria p on p.id = pv.pizzeria_id
    GROUP BY 1
    ORDER BY 3, 2 DESC LIMIT 3),
    p_order AS (
    SELECT p.name, count(m.pizzeria_id) AS count, 'order' AS action_type
    FROM person_order po
    JOIN menu m on m.id = po.menu_id
    JOIN pizzeria p on p.id = m.pizzeria_id
    GROUP BY 1
    ORDER BY 3, 2 DESC LIMIT 3)
SELECT *
FROM p_order
UNION ALL
SELECT *
FROM p_visit
ORDER BY 3, 2 DESC;
--Свериться с парнями (UNION)