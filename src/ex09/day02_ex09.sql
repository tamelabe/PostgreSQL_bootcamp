WITH my_query AS
    (SELECT p.id p_id, p.name AS name, m.pizza_name
    FROM person p
    JOIN person_order po on p.id = po.person_id
    JOIN menu m on m.id = po.menu_id
    WHERE (m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'cheese pizza') AND
          p.gender = 'female')
SELECT name
FROM my_query
WHERE pizza_name = 'pepperoni pizza' AND p_id IN (
    SELECT p_id
    FROM my_query
    WHERE pizza_name = 'cheese pizza')
ORDER BY name
;
