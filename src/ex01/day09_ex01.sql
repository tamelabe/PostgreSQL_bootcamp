CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
    RETURNS trigger
    LANGUAGE plpgsql AS
    $$BEGIN
    INSERT INTO person_audit
        SELECT  now(), 'U', NEW.*;
    RETURN NULL;
    END;$$;

CREATE OR REPLACE TRIGGER trg_person_update_audit
    AFTER UPDATE ON person FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;