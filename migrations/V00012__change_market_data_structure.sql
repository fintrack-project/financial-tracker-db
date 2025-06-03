-- Rename `timestamp` to `updated_at` for table
ALTER TABLE market_data RENAME COLUMN timestamp TO updated_at;

-- Ensure only one row per `symbol`, keeping the most recent, for table
DELETE FROM market_data
WHERE ctid NOT IN (
    SELECT DISTINCT ON (symbol) ctid
    FROM market_data
    ORDER BY symbol, updated_at DESC
);

-- Add unique constraints to enforce one row per `symbol`
ALTER TABLE market_data ADD CONSTRAINT unique_symbol_market_data UNIQUE (symbol);

-- Drop unnecessary columns from `market_data`
ALTER TABLE market_data DROP COLUMN asset_name, DROP COLUMN price_unit;