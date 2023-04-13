-- Session1
BEGIN TRANSACTION;

-- Session2
BEGIN TRANSACTION;

-- Session1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session2
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session2
UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut';
COMMIT;

-- Session1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';