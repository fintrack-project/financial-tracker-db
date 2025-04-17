-- Add `symbol` column to `holdings_history`
ALTER TABLE holdings_history ADD COLUMN symbol VARCHAR(255);

-- Copy `asset_name` values to `symbol` for existing data
UPDATE holdings_history SET symbol = asset_name;