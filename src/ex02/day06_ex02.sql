SELECT p.name, m.pizza_name, m.price,
       m.price * (1 - pd.discount / 100) AS discount_price, p2.name AS pizzeria_name
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN person p on po.person_id = p.id
JOIN person_discounts pd on p.id = pd.person_id
JOIN pizzeria p2 on m.pizzeria_id = p2.id
ORDER BY 1, 2;
