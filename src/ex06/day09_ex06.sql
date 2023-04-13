--
DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date(character varying,numeric,date);

--
CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
        (IN pperson varchar default 'Dmitriy',
        IN pprice numeric default 500,
        IN pdate date default '2022-01-08')
    RETURNS table (name varchar)
    LANGUAGE plpgsql AS
    $$
    BEGIN
        RETURN QUERY (
            SELECT DISTINCT pizz.name
            FROM pizzeria pizz
            JOIN menu m ON pizz.id = m.pizzeria_id
            JOIN person_visits pv ON pizz.id = pv.pizzeria_id
            JOIN person_order po ON m.id = po.menu_id
            JOIN person p ON p.id = pv.person_id AND p.id = po.person_id
            WHERE p.name = pperson AND m.price < pprice
              AND pv.visit_date = pdate AND po.order_date = pdate);
    END;
    $$;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
