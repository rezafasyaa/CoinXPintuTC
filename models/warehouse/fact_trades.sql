WITH cte_raw AS (
  SELECT
    *
    ,ROW_NUMBER() OVER (PARTITION BY trade_id ORDER BY trade_updated_time DESC) AS rn -- take latest update
  FROM staging.stg_trades
)

SELECT
  trade_id
  ,user_id
  ,token_id
  ,side
  ,price_usd
  ,quantity
  ,(price_usd*quantity) AS amount_usd
  ,status
  ,trade_created_time
  ,trade_updated_time
FROM cte_raw
WHERE 1=1
  AND rn = 1
