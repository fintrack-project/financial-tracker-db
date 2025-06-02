-- Step 2: Add unique constraints
ALTER TABLE market_data
DROP CONSTRAINT unique_symbol_market_data;

ALTER TABLE market_data
ADD CONSTRAINT unique_symbol_asset_type_market_data UNIQUE (symbol, asset_type);
