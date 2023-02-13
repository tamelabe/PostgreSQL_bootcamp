SET enable_indexscan = ON;
SET enable_seqscan = OFF;
EXPLAIN ANALYSE
SELECT menu.pizza_name, pizz.name AS pizzeria_name
FROM menu
JOIN pizzeria pizz on menu.pizzeria_id = pizz.id;