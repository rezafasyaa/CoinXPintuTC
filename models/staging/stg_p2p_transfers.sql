SELECT
  CAST(transfer_id AS STRING) AS transfer_id
  ,CAST(sender_id AS STRING) AS sender_id
  ,CAST(receiver_id AS STRING) AS receiver_id
  ,CAST(token_id AS STRING) AS token_id
  ,SAFE_CAST(amount AS NUMERIC) AS amount
  ,CAST(status AS STRING) AS status
  ,TIMESTAMP(transfer_created_time) AS transfer_created_time
  ,TIMESTAMP(transfer_updated_time) AS transfer_updated_time
FROM raw_p2p_transfers
