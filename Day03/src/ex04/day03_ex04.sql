WITH female_impur AS (
    SELECT pizzeria.name AS p_female
    FROM person
    JOIN person_order ON person.id = person_order.person_id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE gender = 'female'),
    male_impur AS (
    SELECT pizzeria.name AS p_male
    FROM person
    JOIN person_order ON person.id = person_order.person_id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE gender = 'male'),
    female AS (
    SELECT p_female AS pizzeria_name
    FROM female_impur
    EXCEPT
    SELECT p_male
    FROM male_impur),
    male AS (
    SELECT p_male AS pizzeria_name
    FROM male_impur
    EXCEPT
    SELECT p_female
    FROM female_impur)
SELECT pizzeria_name
FROM female
UNION
SELECT pizzeria_name
FROM male
;