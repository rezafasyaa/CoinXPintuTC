WITH monthly_token_record AS (
  SELECT
    DATE_TRUNC('month',trade_created_time) AS month_date  
    ,token_id
    ,side
    ,COUNT(trade_id) AS shares_freq
    ,COUNT(quantity) AS shares_qty
    ,SUM(amount_usd) AS shares_amount
  FROM fact_trades
  WHERE 1=1
    and status = 'FILLED'
  GROUP BY 1,2,3
)

,monthly_record AS (
  SELECT 
    DATE_TRUNC('month',trade_created_time) AS month_date
    ,side
    ,COUNT(trade_id) AS total_shares_freq
    ,COUNT(quantity) AS total_shares_qty
    ,SUM(amount_usd) AS total_shares_amount
  FROM fact_trades
  WHERE 1=1
    and status = 'FILLED'
  GROUP BY 1,2
)

SELECT
  mtr.month_date
  ,mtr.token_id
  ,mtr.side
  ,mtr.shares_freq
  ,mr.total_shares_freq
  ,(mtr.shares_freq/mr.total_shares_freq) AS shares_freq_pct
  ,mtr.shares_qty
  ,mr.total_shares_qty
  ,(mtr.shares_qty/mr.total_shares_qty) AS shares_qty_pct
  ,mtr.shares_amount
  ,mr.total_shares_amount
  ,(mtr.shares_amount/mr.total_shares_amount) AS shares_amount_pct
FROM monthly_token_record mtr
JOIN monthly_record mr
  ON mr.month_date = mtr.month_date
  AND mr.side = mtr.side
ORDER BY 1,2,3
