WITH t_plate AS (
    SELECT pv.person_id, count(*) AS count_of_visits
    FROM person_visits pv
    GROUP BY person_id)
SELECT p.name, t_plate.count_of_visits
FROM t_plate
JOIN person p ON t_plate.person_id = p.id
ORDER BY 2 DESC, 1 LIMIT 4;
