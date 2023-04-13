CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
    RETURNS numeric
    LANGUAGE plpgsql AS
    $$
    DECLARE
        minVal numeric;
        i numeric;
    BEGIN
    minVal = $1[1];
        FOREACH i IN ARRAY $1 LOOP
        IF minVal >= i THEN
            minVal := i;
        END IF;
        END LOOP;
    RETURN minVal;
    END;
    $$;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);