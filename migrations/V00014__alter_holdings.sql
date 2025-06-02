-- Add `symbol` column to `holdings`
ALTER TABLE holdings ADD COLUMN symbol VARCHAR(255);

-- Copy `asset_name` values to `symbol` for existing data
UPDATE holdings SET symbol = asset_name;