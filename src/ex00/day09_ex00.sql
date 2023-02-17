CREATE TABLE person_audit
( created TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
  type_event CHAR(1) DEFAULT 'I' NOT NULL,
  row_id BIGINT NOT NULL,
  name VARCHAR,
  age INTEGER,
  gender varchar,
  address varchar,
  CONSTRAINT ch_type_event CHECK (type_event in('I','U','D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
    RETURNS trigger
    LANGUAGE plpgsql AS
    $$BEGIN
    INSERT INTO person_audit
        SELECT  now(), 'I', NEW.*;
    RETURN NULL;
    END;$$;

CREATE OR REPLACE TRIGGER trg_person_insert_audit
    AFTER INSERT ON person FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
