WITH cte_p2p_trf_raw AS (
  SELECT
    sender_id AS user_id
    ,transfer_created_time AS first_date
  FROM warehouse.fact_p2p_transfer
  WHERE 1=1
    AND status = 'SUCCESS'
  
  UNION
  
  SELECT
    receiver_id AS user_id
    ,transfer_created_time AS first_date
  FROM warehouse.fact_p2p_transfer
  WHERE 1=1
    AND status = 'SUCCESS'
  GROUP BY 1
  )

,cte_p2p_trf_fix AS (
  SELECT
    user_id
    ,'P2P Transfer' AS first_product
    ,MIN(first_date) AS first_transfer_date
  FROM cte_p2p_trf_raw
  GROUP BY 1
  )

  ,cte_trade AS (
  SELECT
    user_id
    ,'Trade' AS second_product
    ,MIN(trade_created_time) AS first_trade_date
  FROM warehouse.fact_trades
  WHERE 1=1
    AND status = 'FILLED'
  GROUP BY 1
  )

  SELECT
    a.user_id
    ,c.region
    ,a.first_product
    ,a.first_transfer_date
    ,b.second_product
    ,b.first_trade_date
  FROM cte_p2p_trf_fix AS a
  LEFT JOIN cte_trade AS b
    ON b.user_id = a.user_id
    AND b.first_trade_date >= a.first_transfer_date
  LEFT JOIN warehouse.dim_users AS c
    ON c.user_id = a.user_id
