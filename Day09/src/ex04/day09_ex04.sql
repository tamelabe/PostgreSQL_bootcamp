CREATE OR REPLACE FUNCTION fnc_persons_female()
    RETURNS table (id bigint, name varchar, age integer, gender varchar, address varchar)
    LANGUAGE SQL AS
    $$
    SELECT * FROM person WHERE gender = 'female';
    $$;

CREATE OR REPLACE FUNCTION fnc_persons_male()
    RETURNS table (id bigint, name varchar, age integer, gender varchar, address varchar)
    LANGUAGE SQL AS
    $$
    SELECT * FROM person WHERE gender = 'male';
    $$;

SELECT *
FROM fnc_persons_female();

SELECT *
FROM fnc_persons_male();
