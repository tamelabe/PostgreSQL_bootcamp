WITH t_casted AS (
    SELECT cast(age AS numeric) AS age, address
    FROM person),
    t_formula AS (
    SELECT address, round(max(age) - (min(age) / max(age)), 2) formula, round(avg(age), 2) AS average
    FROM t_casted
    GROUP BY address)
SELECT address,  formula, average, formula > average AS comparison
FROM t_formula
ORDER BY 1;