SELECT p.name, count(m.pizzeria_id), round(avg(m.price), 2) AS average_price, max(m.price) AS max_price,
       min(m.price) AS min_price
FROM person_order po
JOIN menu m on m.id = po.menu_id
JOIN pizzeria p on p.id = m.pizzeria_id
GROUP BY p.id
ORDER BY 1;