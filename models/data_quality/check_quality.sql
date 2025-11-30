-- Dups trade IDs
SELECT 
    trade_id
    ,COUNT(*) 
FROM stg_trades
GROUP BY 1 
HAVING COUNT(*) > 1;

-- Invalid value
SELECT
  COUNT(*) 
FROM stg_trades
WHERE price_usd <= 0 
  OR quantity <= 0;

-- Duplicate transfer IDs
SELECT
  transfer_id
  ,COUNT(*)
FROM stg_p2p_transfer
GROUP BY 1 
HAVING COUNT(*) > 1;

-- Suspicious high-value P2P transfers (>P99)
WITH p99 AS (
  SELECT 
    APPROX_QUANTILES(amount, 100)[OFFSET(99)] AS p99_amount
  FROM stg_p2p_transfer
)
  
SELECT 
  * 
FROM stg_p2p_transfer
WHERE amount > (SELECT p99_amount FROM p99);
