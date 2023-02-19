CREATE OR REPLACE FUNCTION check_date_in_the_past(curr_id integer, bal_date timestamp)
       RETURNS TABLE (rate_to_usd numeric, date timestamp)
   AS $$BEGIN
        RETURN QUERY
        (
            SELECT rate_to_usd, c.updated
            FROM currency c
                JOIN balance b ON c.id = b.currency_id

        );
       END;
    $$ LANGUAGE plpgsql;


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
