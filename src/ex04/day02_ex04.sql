SELECT pizza_name, pizzeria.name pizzeria_name, price
FROM (SELECT *
      FROM menu
      WHERE pizza_name = 'mushroom pizza'
        OR pizza_name =  'pepperoni pizza') AS menu_spec
JOIN pizzeria ON menu_spec.pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria_name
;
