WITH p_visit AS (
    SELECT p.name AS name, count(pv.pizzeria_id) AS count
    FROM person_visits pv
    JOIN pizzeria p on p.id = pv.pizzeria_id
    GROUP BY 1),
    p_order AS (
    SELECT p.name AS name, count(m.pizzeria_id) AS count
    FROM person_order po
    JOIN menu m on m.id = po.menu_id
    JOIN pizzeria p on p.id = m.pizzeria_id
    GROUP BY 1),
    p_united AS (
    SELECT *
    FROM p_visit
    UNION ALL
    SELECT *
    FROM p_order)
SELECT pu.name, sum(count) AS total_count
FROM p_united pu
GROUP BY 1
ORDER BY 2 DESC;