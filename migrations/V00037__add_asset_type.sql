-- Step 1: Add `asset_type` column to `asset`, `transactions`, `holdings`, and `holdings_monthly` tables
-- (This step is already in your migration script, so you can skip it if the column is already added)
ALTER TABLE asset
ADD COLUMN asset_type asset_type NOT NULL DEFAULT 'UNKNOWN';

ALTER TABLE transactions
ADD COLUMN asset_type asset_type NOT NULL DEFAULT 'UNKNOWN';

ALTER TABLE holdings
ADD COLUMN asset_type asset_type NOT NULL DEFAULT 'UNKNOWN';

ALTER TABLE holdings_monthly
ADD COLUMN asset_type asset_type NOT NULL DEFAULT 'UNKNOWN';

-- Step 2: Update existing rows to set `asset_type` to 'STOCK'
UPDATE asset
SET asset_type = 'STOCK'
WHERE asset_type = 'UNKNOWN';

UPDATE transactions
SET asset_type = 'STOCK'
WHERE asset_type = 'UNKNOWN';

UPDATE holdings
SET asset_type = 'STOCK'
WHERE asset_type = 'UNKNOWN';

UPDATE holdings_monthly
SET asset_type = 'STOCK'
WHERE asset_type = 'UNKNOWN';