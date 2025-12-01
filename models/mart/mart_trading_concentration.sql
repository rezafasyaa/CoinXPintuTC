WITH monthly_token_record AS (
  SELECT
    token_id
    ,DATE_TRUNC('month',trade_created_time) AS month_date
    ,side
    ,COUNT(trade_id) AS trade_count
    ,SUM(amount_usd) AS trade_amount
  FROM fact_trades
  GROUP BY 1,2
)

,monthly_record AS (
  SELECT 
    DATE_TRUNC('month',trade_created_time) AS month_date
    ,side
    ,COUNT(trade_id) AS total_trade_count
    ,SUM(amount_usd) AS total_trade_amount
  FROM fact_trades
  GROUP BY 1
)

SELECT
  mtr.month_date
  ,mtr.token_id
  ,mtr.side
  ,mtr.trade_count
  ,mr.total_trade_count
  ,(mtr.trade_count/mr.total_trade_count) AS count_pct
  ,mtr.trade_amount
  ,mr.total_trade_amount
  ,(mtr.trade_amount/mr.total_trade_amount) AS amount_pct
FROM monthly_token_record mtr
JOIN monthly_record mr
  ON mr.month_date = mtr.month_date
  AND mr.side = mtr.side
ORDER BY 1
