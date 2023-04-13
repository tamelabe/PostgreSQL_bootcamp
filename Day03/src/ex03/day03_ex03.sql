WITH male_impur AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person
    JOIN person_visits ON person.id = person_visits.person_id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE gender = 'male'),
    female_impur AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person
    JOIN person_visits ON person.id = person_visits.person_id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE gender = 'female'),
    male AS (
    SELECT * FROM male_impur
    EXCEPT ALL
    SELECT * FROM female_impur),
    female AS (
    SELECT * FROM female_impur
    EXCEPT ALL
    SELECT * FROM male_impur)
SELECT pizzeria_name
FROM male
UNION ALL
SELECT pizzeria_name
FROM female
ORDER BY pizzeria_name
;