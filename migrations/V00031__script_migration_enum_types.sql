-- Step 1: Drop the old ENUM type if it exists
DO $$ BEGIN
    IF EXISTS (SELECT 1 FROM pg_type WHERE typname = 'asset_type') THEN
        DROP TYPE asset_type CASCADE;
    END IF;
END $$;

-- Step 2: Create the updated ENUM type for asset types with capitalized constants
CREATE TYPE asset_type AS ENUM ('STOCK', 'CRYPTO', 'COMMODITY', 'FOREX', 'UNKNOWN');

-- Step 3: Update the `asset_type` column in `market_data` to match the new ENUM values
UPDATE market_data
SET asset_type = CASE
    WHEN asset_type = 'stock' THEN 'STOCK'
    WHEN asset_type = 'crypto' THEN 'CRYPTO'
    WHEN asset_type = 'commodity' THEN 'COMMODITY'
    WHEN asset_type = 'forex' THEN 'FOREX'
    ELSE 'UNKNOWN'
END;

-- Step 4: Update the `asset_type` column in `market_data_monthly` to match the new ENUM values
UPDATE market_data_monthly
SET asset_type = CASE
    WHEN asset_type = 'stock' THEN 'STOCK'
    WHEN asset_type = 'crypto' THEN 'CRYPTO'
    WHEN asset_type = 'commodity' THEN 'COMMODITY'
    WHEN asset_type = 'forex' THEN 'FOREX'
    ELSE 'UNKNOWN'
END;

-- Step 5: Alter the `asset_type` column in `market_data` to use the updated ENUM type
ALTER TABLE market_data
ALTER COLUMN asset_type TYPE asset_type USING asset_type::text::asset_type;

-- Step 6: Alter the `asset_type` column in `market_data_monthly` to use the updated ENUM type
ALTER TABLE market_data_monthly
ALTER COLUMN asset_type TYPE asset_type USING asset_type::text::asset_type;