SELECT p.name AS name
FROM person p
JOIN person_order po on p.id = po.person_id
JOIN menu m on m.id = po.menu_id
WHERE (p.address = 'Moscow' OR p.address = 'Samara') AND
      (m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'mushroom pizza') AND
      p.gender = 'male'
ORDER BY name DESC
;
