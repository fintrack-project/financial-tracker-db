-- Create an ENUM type for asset types
CREATE TYPE asset_type AS ENUM ('stock', 'crypto', 'commodity', 'forex', 'unknown');

-- Add the `asset_type` column to the `market_data` table
ALTER TABLE market_data
ADD COLUMN asset_type asset_type NOT NULL DEFAULT 'unknown';

-- Add the `asset_type` column to the `market_data_monthly` table
ALTER TABLE market_data_monthly
ADD COLUMN asset_type asset_type NOT NULL DEFAULT 'unknown';

-- Drop the old `type` column from the `market_data` table (if it exists)
ALTER TABLE market_data
DROP COLUMN IF EXISTS type;

-- Drop the old `type` column from the `market_data_monthly` table (if it exists)
ALTER TABLE market_data_monthly
DROP COLUMN IF EXISTS type;