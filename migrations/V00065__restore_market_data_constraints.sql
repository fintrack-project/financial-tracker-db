-- Restore unique constraint for market_data
ALTER TABLE market_data
ADD CONSTRAINT unique_symbol_asset_type_market_data UNIQUE (symbol, asset_type);

-- Restore unique constraint for market_data_monthly
ALTER TABLE market_data_monthly
ADD CONSTRAINT unique_symbol_date_asset_type UNIQUE (symbol, date, asset_type); 