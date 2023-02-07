SELECT name,
    CASE
        WHEN NAME = 'Denis' THEN 'true'
        ELSE 'false'
    END AS check_name
FROM
    (SELECT (SELECT name
              FROM person
              WHERE id = person_order.person_id)
    FROM person_order
    WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18)
    AND order_date = '2022-01-07') AS NAME
;