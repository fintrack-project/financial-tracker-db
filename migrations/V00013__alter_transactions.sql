-- Add `symbol` column to `transactions`
ALTER TABLE transactions ADD COLUMN symbol VARCHAR(255);

-- Copy `asset_name` values to `symbol` for existing data
UPDATE transactions SET symbol = asset_name;

-- Drop `total_balance_before` and `total_balance_after` columns
ALTER TABLE transactions DROP COLUMN total_balance_before, DROP COLUMN total_balance_after;