-- Session1
BEGIN TRANSACTION;

-- Session2
BEGIN TRANSACTION;

-- Session1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session1
SELECT SUM(rating) FROM pizzeria;

-- Session2
UPDATE pizzeria
SET rating = 1
WHERE name = 'Pizza Hut';
COMMIT;

-- Session1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- Session2
SELECT SUM(rating) FROM pizzeria;