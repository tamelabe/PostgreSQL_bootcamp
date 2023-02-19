insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION check_date(t_date timestamp, c_id bigint)
    RETURNS numeric
    LANGUAGE SQL AS
    $$
    (WITH id_fltred AS (
        SELECT * FROM currency WHERE id = c_id),
        d_past AS (
            SELECT max(updated) AS date FROM id_fltred WHERE updated <= t_date),
        d_future AS (
            SELECT min(updated) AS date FROM id_fltred WHERE updated > t_date),
        d_date AS (
            SELECT (CASE
                    WHEN (SELECT count(*) FROM d_past) = 1 THEN d_past.date
                    ELSE d_future.date
                    END) AS date
            FROM d_past, d_future)
    SELECT rate_to_usd
    FROM currency c, d_date
    WHERE d_date.date = c.updated)
    $$;

WITH currency_mod AS (
        SELECT id, name, rate_to_usd, updated
        FROM (
            SELECT *, row_number() over (PARTITION BY id ORDER BY updated DESC) lxst
            FROM currency c) AS que
        WHERE lxst = 1)
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       c.name AS currency_name,
       (b.money::numeric * check_date(c.updated, c.id)) AS currency_in_usd
FROM "user" AS u
FULL JOIN balance b on u.id = b.user_id
JOIN currency_mod c on c.id = b.currency_id
ORDER BY name DESC, lastname, currency_name;





SELECT DISTINCT COALESCE(u.name, 'not defined')   AS name,
                COALESCE(u.lastname, 'not defined') AS lastname,
                user_id,
                money,
                currency_id,
                b.updated
FROM "user" u
         JOIN balance b ON u.id = b.user_id
WHERE currency_id IN (SELECT id FROM currency)
-- ORDER BY name DESC, lastname, currency_name;
ORDER BY name DESC, lastname ASC, b.updated;




-- SELECT DISTINCT user_id, money, currency.rate_to_usd, balance.updated, currency.updated, (currency.updated - balance.updated) as dif
-- FROM balance
--     JOIN currency ON currency.id = balance.currency_id
-- WHERE currency_id = 100
-- ORDER BY dif
-- -- FETCH FIRST 1 ROWS ONLY
-- ;
