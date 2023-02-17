--
DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date(character varying,numeric,date);
--
CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
        (IN pperson varchar default 'Dmitriy',
        IN pprice numeric default 500,
        IN pdate date default '2022-01-08')
    RETURNS varchar
    LANGUAGE plpgsql AS
    $$
    DECLARE pizzeria_name varchar;
    BEGIN
        SELECT pizz.name INTO pizzeria_name
        FROM pizzeria pizz
        JOIN menu m on pizz.id = m.pizzeria_id
        JOIN person_visits pv on pizz.id = pv.pizzeria_id
        JOIN person p on p.id = pv.person_id
        WHERE p.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
        RETURN pizzeria_name;
    END;
    $$;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 9999,pdate := '2022-01-01');

-- Проработать с парнями возврат нескольких значений