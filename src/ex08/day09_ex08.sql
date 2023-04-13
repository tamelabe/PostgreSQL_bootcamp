CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER default 10)
    RETURNS SETOF INTEGER
    LANGUAGE plpgsql AS
    $$
    BEGIN
        RETURN QUERY WITH RECURSIVE t(a, b) AS (
        VALUES(0, 1)
        UNION ALL
        SELECT GREATEST(a, b), a + b AS a from t
        WHERE b < $1)
    SELECT a FROM t;
    END;
    $$;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

-- DROP FUNCTION fnc_fibonacci(integer);