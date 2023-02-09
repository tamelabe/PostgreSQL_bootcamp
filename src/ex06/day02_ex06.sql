SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM person_order po
JOIN menu ON po.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person ON po.person_id = person.id
WHERE person.name = 'Denis' OR person.name = 'Anna'
ORDER BY pizza_name, pizzeria_name
;