INSERT INTO person_order
VALUES ((SELECT (MAX(id) + 1) FROM person_order),
        (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id FROM menu WHERE pizza_name = 'sicillian pizza'),
        '2022-02-24'),
       ((SELECT (MAX(id) + 2) FROM person_order),
        (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id FROM menu WHERE pizza_name = 'sicillian pizza'),
        '2022-02-24')
;