CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
    RETURNS trigger
    LANGUAGE plpgsql AS
    $$BEGIN
    INSERT INTO person_audit
        SELECT  now(), 'D', OLD.*;
    RETURN NULL;
    END;$$;

CREATE OR REPLACE TRIGGER trg_person_delete_audit
    AFTER DELETE ON person FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;