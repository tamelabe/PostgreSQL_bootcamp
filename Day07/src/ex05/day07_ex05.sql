SELECT DISTINCT p.name
FROM person_order po
JOIN person p on p.id = po.person_id
ORDER BY 1;