WITH cte_raw AS (
  SELECT
    sender_id AS user_id
    ,token_id
    ,'P2P Transfer' AS product_type
    ,transfer_created_time AS date
  FROM warehouse.fact_p2p_transfer
  WHERE 1=1
    AND status = 'SUCCESS'
  
  UNION
  
  SELECT
    receiver_id AS user_id
    ,token_id
    ,'P2P Transfer' AS product_type
    ,transfer_created_time AS date
  FROM warehouse.fact_p2p_transfer
  WHERE 1=1
    AND status = 'SUCCESS'

  UNION

  SELECT
    user_id
    ,token_id
    ,'Trade' AS product_type
    ,trade_created_time AS date
  FROM warehouse.fact_trades
  WHERE 1=1
    AND status = 'FILLED'
  )

  SELECT
    a.date
    ,a.user_id 
    ,c.region
    ,a.product_type
    ,a.token_id
    ,d.token_name
    ,d.category AS token_category
  FROM cte_raw a
  LEFT JOIN warehouse.dim_users AS c
    ON c.user_id = a.user_id
  LEFT JOIN warehouse.dim_tokens AS d
    ON d.token_id = a.token_id  


