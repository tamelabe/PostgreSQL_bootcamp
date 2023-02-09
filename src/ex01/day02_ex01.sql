SELECT CAST(days AS date) AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day') days
LEFT JOIN (SELECT visit_date
           FROM person_visits
           WHERE person_id = 1 OR person_id = 2
           AND visit_date BETWEEN '2022-01-01' AND '2022-01-10') AS temp
    ON days = temp.visit_date
    WHERE temp.visit_date ISNULL
ORDER BY missing_date
;
