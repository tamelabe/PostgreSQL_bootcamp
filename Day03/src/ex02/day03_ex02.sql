WITH pz_id AS (
    SELECT id as menu_id
    FROM menu
    EXCEPT
    SELECT menu_id
    FROM person_order
    ORDER BY menu_id)
SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM menu
JOIN pz_id ON menu.id = pz_id.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price
;