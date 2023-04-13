WITH currency_mod AS (
        SELECT id, name, rate_to_usd, updated
        FROM (
            SELECT *, row_number() over (PARTITION BY id ORDER BY updated DESC) lxst
            FROM currency c) AS que
        WHERE lxst = 1),
    balance_mod AS (
        SELECT user_id, sum(money) AS volume, type, currency_id
        FROM balance
        GROUP BY 1, 3, 4)
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       b.type, b.volume,
       COALESCE(c.name, 'not defined') AS currency_name,
       COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
       (b.volume * COALESCE(c.rate_to_usd, 1)) AS total_volume_in_usd
FROM "user" AS u
FULL JOIN balance_mod b on u.id = b.user_id
FULL JOIN currency_mod c on c.id = b.currency_id
ORDER BY name DESC, lastname, b.type;