SELECT p1.name person_name1, p2.name person_name2, p1.address common_address
FROM person p1
JOIN person p2 ON p1.address = p2.address
WHERE p1.id > p2.id
ORDER BY person_name1, person_name2, common_address
;




