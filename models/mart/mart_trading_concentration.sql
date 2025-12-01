WITH monthly_token_amount AS (
  SELECT
    token_id
    ,DATE_TRUNC('month',trade_created_time) AS month_date
    ,side
    ,count(trade_id) AS trade_count
    ,SUM(amount_usd) AS trade_amount
  FROM fact_trades
  GROUP BY 1,2
)

,monthly_amount AS (
  SELECT 
    DATE_TRUNC('month',trade_created_time) AS month_date
    ,side
    ,count(trade_id) AS trade_count
    ,SUM(amount_usd) AS trade_amount
  FROM fact_trades
  GROUP BY 1
)

SELECT
  mta.month_date
  ,mta.token_id
  ,mta.token_amount
  ,ma.total_amount
  ,(mta.token_amount / ma.total_amount) AS perc_volume
FROM monthly_token_amount mta
JOIN monthly_amount ma
  ON ma.month_date = mta.month_date
  AND ma.side = mta.side
ORDER BY 1
