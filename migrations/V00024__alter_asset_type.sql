-- Check if the ENUM type exists before creating it
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'asset_type') THEN
        CREATE TYPE asset_type AS ENUM ('STOCK', 'CRYPTO', 'COMMODITY', 'FOREX', 'UNKNOWN');
    END IF;
END $$;

-- Add the `asset_type` column to the `market_data` table
ALTER TABLE market_data
ADD COLUMN IF NOT EXISTS asset_type asset_type NOT NULL DEFAULT 'UNKNOWN';

-- Add the `asset_type` column to the `market_data_monthly` table
ALTER TABLE market_data_monthly
ADD COLUMN IF NOT EXISTS asset_type asset_type NOT NULL DEFAULT 'UNKNOWN';

-- Drop the old `type` column from the `market_data` table (if it exists)
ALTER TABLE market_data
DROP COLUMN IF EXISTS type;

-- Drop the old `type` column from the `market_data_monthly` table (if it exists)
ALTER TABLE market_data_monthly
DROP COLUMN IF EXISTS type;