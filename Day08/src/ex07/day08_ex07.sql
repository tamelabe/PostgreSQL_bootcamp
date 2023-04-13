-- Session1
BEGIN TRANSACTION;
SHOW TRANSACTION ISOLATION LEVEL;

-- Session2
BEGIN TRANSACTION;
SHOW TRANSACTION ISOLATION LEVEL;

-- Session1
UPDATE pizzeria
SET rating = 1
WHERE id = 1;

-- Session2
UPDATE pizzeria
SET rating = 2
WHERE id = 2;

-- Session1
UPDATE pizzeria
SET rating = 3
WHERE id = 2;

-- Session2
UPDATE pizzeria
SET rating = 4
WHERE id = 1;

-- Session1
COMMIT;

-- Session2
COMMIT;
