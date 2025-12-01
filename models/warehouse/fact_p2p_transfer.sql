WITH cte_raw AS (
  SELECT
    *
    ,ROW_NUMBER() OVER (PARTITION BY transfer_id ORDER BY transfer_updated_time DESC) AS rn -- take latest update
  FROM staging.stg_p2p_transfers
)

SELECT
  transfer_id
  ,sender_id
  ,receiver_id
  ,token_id
  ,amount
  ,status
  ,transfer_created_time
  ,transfer_updated_time
FROM cte_raw
WHERE 1=1
  AND rn = 1
