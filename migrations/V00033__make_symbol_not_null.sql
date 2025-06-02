-- Step 1: Update rows with NULL `symbol` to a placeholder value (if necessary)
-- This ensures there are no NULL values before applying the NOT NULL constraint.
UPDATE holdings
SET symbol = 'UNKNOWN'
WHERE symbol IS NULL;

UPDATE holdings_monthly
SET symbol = 'UNKNOWN'
WHERE symbol IS NULL;

UPDATE market_data
SET symbol = 'UNKNOWN'
WHERE symbol IS NULL;

UPDATE transactions
SET symbol = 'UNKNOWN'
WHERE symbol IS NULL;

-- Step 2: Alter the `symbol` column to make it NOT NULL
ALTER TABLE holdings
ALTER COLUMN symbol SET NOT NULL;

ALTER TABLE holdings_monthly
ALTER COLUMN symbol SET NOT NULL;

ALTER TABLE market_data
ALTER COLUMN symbol SET NOT NULL;

ALTER TABLE transactions
ALTER COLUMN symbol SET NOT NULL;