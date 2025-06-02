-- Add a unique constraint to the table
ALTER TABLE market_data_monthly
ADD CONSTRAINT unique_symbol_date_asset_type UNIQUE (symbol, date, asset_type);