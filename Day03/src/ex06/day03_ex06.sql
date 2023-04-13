WITH list1 AS (
    SELECT pizza_name, pizzeria.name AS pizzeria_name_1, price, pizzeria.id
    FROM pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
), list2 AS (
    SELECT pizza_name, pizzeria.name AS pizzeria_name_2, price, pizzeria.id
    FROM pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
)
SELECT list1.pizza_name, pizzeria_name_1, pizzeria_name_2, list1.price
FROM list1, list2
WHERE list1.pizza_name = list2.pizza_name AND list1.price = list2.price AND list1.id > list2.id
ORDER BY 1
;