SELECT format('%s (age:%s,gender:%L,address:%L)', name, age, gender, address)
FROM person
ORDER BY name ASC
;