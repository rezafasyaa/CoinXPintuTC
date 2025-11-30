SELECT
  CAST(trade_id AS STRING) AS trade_id
  ,CAST(user_id AS STRING) AS user_id
  ,CAST(token_id AS STRING) AS token_id
  ,CAST(side as STRING) AS side
  ,SAFE_CAST(price_usd AS NUMERIC) AS price_usd
  ,SAFE_CAST(quantity AS NUMERIC) AS quantity
  ,CAST(status as STRING) AS status
  ,TIMESTAMP(trade_created_time) AS trade_created_time
  ,TIMESTAMP(trade_updated_time) AS trade_updated_time
FROM raw_trades
