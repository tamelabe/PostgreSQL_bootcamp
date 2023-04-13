SELECT order_date,
       (SELECT name || ' (age:' || age || ')') AS person_information
FROM person_order
NATURAL JOIN (SELECT id AS person_id, name, age
                    FROM person) as person_new
ORDER BY order_date, person_information
;