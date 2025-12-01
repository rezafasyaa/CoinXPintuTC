https://dbdiagram.io/d/CoinXPintu-Test-Case-692dbe9cd6676488ba1c4e7c

Table fact_trades {
  trade_id integer [primary key]
  user_id	integer
  token_id integer
  side varchar
  price_usd	decimal
  quantity number
  status varchar	
  trade_created_time timestamp
  trade_updated_time timestamp
}

Table fact_p2p_transfers {
  transfer_id	integer [primary key]
  sender_id	integer
  receiver_id	integer
  token_id integer
  amount number
  status varchar	
  transfer_created_time	timestamp
  transfer_updated_time timestamp
}

Table dim_users {
  user_id integer [primary key]
  region varchar
  signup_date timestamp
}

Table dim_tokens {
  token_id integer [primary key]
  token_name varchar
  category varchar
}


Ref: dim_users.user_id > fact_trades.user_id
Ref: dim_tokens.token_id > fact_trades.token_id
Ref: dim_users.user_id > fact_p2p_transfers.sender_id
Ref: dim_users.user_id > fact_p2p_transfers.receiver_id
Ref: dim_tokens.token_id > fact_p2p_transfers.token_id
