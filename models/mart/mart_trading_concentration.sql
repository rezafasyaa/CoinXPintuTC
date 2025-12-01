WITH monthly_token_record AS (
  SELECT
    token_id
    ,DATE_TRUNC('month',trade_created_time) AS month_date
    ,side
    ,COUNT(quantity) AS shares_count
    ,SUM(amount_usd) AS shares_amount
  FROM fact_trades
  GROUP BY 1,2
)

,monthly_record AS (
  SELECT 
    DATE_TRUNC('month',trade_created_time) AS month_date
    ,side
    ,COUNT(quantity) AS total_shares_count
    ,SUM(amount_usd) AS total_shares_amount
  FROM fact_trades
  GROUP BY 1
)

SELECT
  mtr.month_date
  ,mtr.token_id
  ,mtr.side
  ,mtr.shares_count
  ,mr.total_shares_count
  ,(mtr.shares_count/mr.total_shares_count) AS shares_pct
  ,mtr.shares_amount
  ,mr.total_shares_amount
  ,(mtr.shares_amount/mr.total_shares_amount) AS amount_pct
FROM monthly_token_record mtr
JOIN monthly_record mr
  ON mr.month_date = mtr.month_date
  AND mr.side = mtr.side
ORDER BY 1
