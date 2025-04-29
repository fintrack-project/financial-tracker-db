-- Step 1: Rename the existing `asset_type` column to `asset_type_old` for `asset` table
ALTER TABLE asset
RENAME COLUMN asset_type TO asset_type_old;

-- Step 2: Add a new `asset_type` column of type VARCHAR for `asset` table
ALTER TABLE asset
ADD COLUMN asset_type VARCHAR(255);

-- Step 3: Copy the values from the old `asset_type` column to the new `asset_type` column for `asset` table
UPDATE asset
SET asset_type = asset_type_old::TEXT;

-- Step 4: Set a default value for rows where `asset_type` is NULL
UPDATE asset
SET asset_type = 'UNKNOWN'
WHERE asset_type IS NULL;

-- Step 5: Alter the new `asset_type` column to make it NOT NULL
ALTER TABLE asset
ALTER COLUMN asset_type SET NOT NULL;

-- Step 6: Drop the old `asset_type_old` column for `asset` table
ALTER TABLE asset
DROP COLUMN asset_type_old;


-- Repeat the same steps for `holdings` table
ALTER TABLE holdings
RENAME COLUMN asset_type TO asset_type_old;

ALTER TABLE holdings
ADD COLUMN asset_type VARCHAR(255);

UPDATE holdings
SET asset_type = asset_type_old::TEXT;

UPDATE holdings
SET asset_type = 'UNKNOWN'
WHERE asset_type IS NULL;

ALTER TABLE holdings
ALTER COLUMN asset_type SET NOT NULL;

ALTER TABLE holdings
DROP COLUMN asset_type_old;


-- Repeat the same steps for `holdings_monthly` table
ALTER TABLE holdings_monthly
RENAME COLUMN asset_type TO asset_type_old;

ALTER TABLE holdings_monthly
ADD COLUMN asset_type VARCHAR(255);

UPDATE holdings_monthly
SET asset_type = asset_type_old::TEXT;

UPDATE holdings_monthly
SET asset_type = 'UNKNOWN'
WHERE asset_type IS NULL;

ALTER TABLE holdings_monthly
ALTER COLUMN asset_type SET NOT NULL;

ALTER TABLE holdings_monthly
DROP COLUMN asset_type_old;


-- Repeat the same steps for `transactions` table
ALTER TABLE transactions
RENAME COLUMN asset_type TO asset_type_old;

ALTER TABLE transactions
ADD COLUMN asset_type VARCHAR(255);

UPDATE transactions
SET asset_type = asset_type_old::TEXT;

UPDATE transactions
SET asset_type = 'UNKNOWN'
WHERE asset_type IS NULL;

ALTER TABLE transactions
ALTER COLUMN asset_type SET NOT NULL;

ALTER TABLE transactions
DROP COLUMN asset_type_old;