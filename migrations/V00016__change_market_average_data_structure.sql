-- Rename `timestamp` to `updated_at` for table
ALTER TABLE market_average_data RENAME COLUMN timestamp TO updated_at;

-- Ensure only one row per `symbol`, keeping the most recent, for table
DELETE FROM market_average_data
WHERE ctid NOT IN (
    SELECT DISTINCT ON (symbol) ctid
    FROM market_average_data
    ORDER BY symbol, updated_at DESC
);

-- Add unique constraints to enforce one row per `symbol`
ALTER TABLE market_average_data ADD CONSTRAINT unique_symbol_market_average_data UNIQUE (symbol);