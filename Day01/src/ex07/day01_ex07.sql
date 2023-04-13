SELECT order_date,
       (SELECT name || ' (age:' || age || ')') AS person_information
FROM person_order
JOIN person ON person_order.person_id = person.id
ORDER BY order_date, person_information
;
