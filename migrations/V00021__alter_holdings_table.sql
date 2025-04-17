-- Drop the `date` column
ALTER TABLE holdings DROP COLUMN date;

-- Add a new `updated_at` column to indicate when the row was last updated
ALTER TABLE holdings ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- Drop the existing unique constraint (if any)
ALTER TABLE holdings DROP CONSTRAINT IF EXISTS unique_asset_symbol_holdings;

-- Ensure only the most recent row per (account_id, asset_name) is kept
DELETE FROM holdings
WHERE ctid NOT IN (
    SELECT DISTINCT ON (account_id, asset_name) ctid
    FROM holdings
    ORDER BY account_id, asset_name, updated_at DESC
);

-- Add a new unique constraint on (account_id, asset_name)
ALTER TABLE holdings ADD CONSTRAINT unique_account_asset_name_holdings UNIQUE (account_id, asset_name);