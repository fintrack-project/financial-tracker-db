-- Change the `price` column in `market_data` to NUMERIC(15,6)
ALTER TABLE market_data
ALTER COLUMN price TYPE NUMERIC(15,6);

-- Change the `price` column in `market_data_monthly` to NUMERIC(15,6)
ALTER TABLE market_data_monthly
ALTER COLUMN price TYPE NUMERIC(15,6);