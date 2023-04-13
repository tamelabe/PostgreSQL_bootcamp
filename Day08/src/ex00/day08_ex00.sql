-- Session1
BEGIN TRANSACTION;
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session1
COMMIT;

-- Session2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';