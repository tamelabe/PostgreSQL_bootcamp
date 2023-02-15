SELECT p2.address, p.name, count(m.pizzeria_id) AS count_of_orders
FROM person_order po
JOIN menu m on m.id = po.menu_id
JOIN pizzeria p on p.id = m.pizzeria_id
JOIN person p2 on p2.id = po.person_id
GROUP BY 1, 2
ORDER BY 1, 2;

