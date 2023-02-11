CREATE VIEW v_price_with_discount AS
SELECT p.name AS name, m.pizza_name AS pizza_name, m.price, round(m.price - m.price * 0.1) AS discount_price
FROM person_order
JOIN person p on p.id = person_order.person_id
JOIN menu m on m.id = person_order.menu_id
ORDER BY 1, 2
;